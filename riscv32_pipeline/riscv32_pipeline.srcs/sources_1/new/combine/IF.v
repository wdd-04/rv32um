`ifdef DEBUG
    `include "param.v"
`else
    `include "../param.v"
`endif

/**
 * @Module: IF (Instruction Fetch)
 * @Description: 取指阶段核心模块，包含 PC 维护、指令预取、分支预测以及指令缓存。
 *               采用指令 FIFO (if_buf) 缓冲机制，解耦取指与后续译码阶段。
 */
module IF (
    input  wire                               clk,
    input  wire                               rst_n,
    input  wire                               stop_IF,         // 流水线暂停信号
    input  wire [`WIDTH_PCCTRL - 1:0]      PCCTRL,          // 来自 EX 段的分支控制信息
    input  wire [`WIDTH_PC - 1:0]          branch_inst_pc,  // 分支指令本身的 PC
    input  wire [`WIDTH_ALUOUT - 1:0]      branch_pc,       // 分支目标 PC (ALU 计算值)
    input  wire [`WIDTH_COMPOUT - 1:0]     COMPOut,         // 比较器结果
    input  wire                               pred_taken_EX,   // EX 段当时的预测状态
    input  wire [`WIDTH_PC - 1:0]          pred_target_EX,  // EX 段当时的预测目标
    input  wire [`WIDTH_INST - 1:0]        inst_ID,         // ID 段指令 (用于识别 fence.i)
    output wire [`WIDTH_INST - 1:0]        inst,            // 输出至 ID 段的指令
    output wire [`WIDTH_PC - 1:0]          pc,              // 输出至 ID 段的 PC
    output wire                               pred_taken,      // 当前指令预测跳转标志
    output wire [`WIDTH_PC - 1:0]          pred_target,     // 当前指令预测跳转目标
    output wire                               risk_Ctrl        // 控制冲突 (预测失败) 信号
);

// =================================================================
// 指令预取缓冲区 (Instruction Buffer / FIFO)
// =================================================================
localparam IF_BUF_DEPTH = 8; // 缓冲区深度
localparam PTR_WIDTH    = 3; // 指针宽度

reg [`WIDTH_INST - 1:0] if_buf [0:IF_BUF_DEPTH-1]; // 存放指令
reg [`WIDTH_PC - 1:0]   if_buf_pc [0:IF_BUF_DEPTH-1]; // 存放对应 PC
reg [PTR_WIDTH-1:0]      buf_head;
reg [PTR_WIDTH-1:0]      buf_tail;
reg [PTR_WIDTH:0]        buf_count; // 计数器用于判定满/空

wire buf_full  = (buf_count == IF_BUF_DEPTH);
wire buf_empty = (buf_count == 0);

// 若 Buffer 为空，输出 NOP (0x00000013) 以维持流水线流动
assign inst = buf_empty ? 32'h00000013 : if_buf[buf_head];
assign pc   = buf_empty ? 32'h00000000 : if_buf_pc[buf_head];

// =================================================================
// 控制冲突检测 (Branch Misprediction Detection)
// =================================================================
wire [`WIDTH_INST - 1:0] inst_irom;
wire fence_i_ID = (inst_ID[6:0] == 7'b0001111) && (inst_ID[14:12] == 3'b001); // 识别同步指令
reg  [`WIDTH_PC - 1:0]   pre_fetch_pc;   // 预取 PC
reg  [`WIDTH_PC - 1:0]   pre_fetch_pc_d; // 预取 PC 的延迟拍
reg                        irom_valid;     // I-Cache 输出有效标志

wire [`WIDTH_PCSEL - 1:0] PCSel;
BranchCTRL IF_branchCTRL (
    .PCCTRL(PCCTRL),
    .COMPOut(COMPOut),
    .PCSel(PCSel)
);

wire actual_is_branch = PCCTRL[`PCCTRL_B];
wire actual_is_jump   = PCCTRL[`PCCTRL_J];
wire actual_event      = actual_is_branch || actual_is_jump;
wire actual_taken      = PCSel;
// 计算真实的下一条指令 PC (用于纠错)
wire [`WIDTH_PC - 1:0] actual_next_pc = actual_taken ? branch_pc : (branch_inst_pc + 32'd4);

// 核心纠错逻辑：预测跳转方向错误 或 预测目标地址错误
wire target_wrong = actual_taken && pred_taken_EX && (pred_target_EX != branch_pc);
assign risk_Ctrl = actual_event && ((pred_taken_EX != actual_taken) || target_wrong);

// =================================================================
// 分支预测器集成 (Branch Predictor)
// =================================================================
wire pred_jump_raw;
wire [`WIDTH_PC - 1:0] pred_pc_raw;

BranchPredictor branchPredictor (
    .clk(clk),
    .rst_n(rst_n),
    .inst(inst),          // 基于当前 ID 段读出的指令进行预测
    .pc(pc),
    .update_valid(actual_event && !stop_IF), // 更新预测表
    .update_is_branch(actual_is_branch),
    .update_taken(actual_taken),
    .update_pc(branch_inst_pc),
    .update_target(branch_pc),
    .pre_pc(pred_pc_raw),
    .jump(pred_jump_raw)
);

assign pred_taken = !buf_empty && pred_jump_raw;
assign pred_target = pred_pc_raw;

// =================================================================
// I-Cache 接口
// =================================================================
iCache_Wrapper IF_icache (
    .clk(clk),
    .rst_n(rst_n),
    .flush(fence_i_ID || risk_Ctrl || predict_redirect), // 遇到预测失败或同步指令时刷新 Cache
    .pc(pre_fetch_pc),
    .inst(inst_irom),
    .stall_cpu()
);

// =================================================================
// 取指控制逻辑 (Fetch Control Logic)
// =================================================================
wire pop_en = !risk_Ctrl && !buf_empty && !stop_IF;       // 正常读取指令出队
wire predict_redirect = pop_en && pred_taken;              // 发现跳转预测，立即重定向取指
wire fetch_blocked = risk_Ctrl || predict_redirect;        // 阻塞当前预取流
wire fetch_en = !fetch_blocked && !buf_full && !stop_IF;   // 取指使能信号
wire push_en = !fetch_blocked && irom_valid && !buf_full; // 缓冲区入队使能

// PC 更新逻辑
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        pre_fetch_pc   <= 32'h00000000;
        pre_fetch_pc_d <= 32'h00000000;
        irom_valid     <= 1'b0;
    end
    else if (risk_Ctrl) begin // 场景 1：预测失败，强行重定向至真实地址
        pre_fetch_pc   <= actual_next_pc;
        pre_fetch_pc_d <= actual_next_pc;
        irom_valid     <= 1'b0;
    end
    else if (predict_redirect) begin // 场景 2：前端预测跳转，重定向至预测地址
        pre_fetch_pc   <= pred_target;
        pre_fetch_pc_d <= pred_target;
        irom_valid     <= 1'b0;
    end
    else if (fetch_en) begin // 场景 3：顺序取指
        pre_fetch_pc_d <= pre_fetch_pc;
        pre_fetch_pc   <= pre_fetch_pc + 32'd4;
        irom_valid     <= 1'b1;
    end
    else begin
        irom_valid     <= 1'b0;
    end
end

// 指令 FIFO 管理 (Push / Pop / Flush)
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        buf_head  <= {PTR_WIDTH{1'b0}};
        buf_tail  <= {PTR_WIDTH{1'b0}};
        buf_count <= {(PTR_WIDTH+1){1'b0}};
    end
    else if (risk_Ctrl || predict_redirect) begin // 发生重定向时清空缓冲区 (Flush)
        buf_head  <= {PTR_WIDTH{1'b0}};
        buf_tail  <= {PTR_WIDTH{1'b0}};
        buf_count <= {(PTR_WIDTH+1){1'b0}};
    end
    else begin
        // 入队操作
        if (push_en) begin
            if_buf[buf_tail]    <= inst_irom;
            if_buf_pc[buf_tail] <= pre_fetch_pc_d;
            buf_tail <= buf_tail + 1'b1;
        end

        // 出队操作
        if (pop_en) begin
            buf_head <= buf_head + 1'b1;
        end

        // 维护缓冲区计数器
        case ({push_en, pop_en})
            2'b10: buf_count <= buf_count + 1'b1;
            2'b01: buf_count <= buf_count - 1'b1;
            default: buf_count <= buf_count;
        endcase
    end
end

endmodule