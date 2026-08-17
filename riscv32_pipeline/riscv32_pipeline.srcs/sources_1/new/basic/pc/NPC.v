`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: NPC
 * @Description: 下一程序计数器 (Next PC) 计算模块。
 *               1. 分支预测集成：利用 BranchPredictor 在取指阶段预测跳转方向，减少分支开销。
 *               2. 预测验证与冲突控制：对比执行阶段的实际结果 (PCSel) 与预测记录 (is_jump)，
 *                  若预测失败则产生 risk_Ctrl 信号进行流水线冲刷。
 *               3. 停顿处理：支持 stop_IF 信号，在流水线停顿时保持当前 PC 不变。
 *               4. 路径修正：当预测错误时，根据实际跳转需求强行修正为正确的分支目标或 PC + 4。
 */
module NPC(
    input   wire clk,
    input   wire rst_n,
    input   wire stop_IF,               // 取指阶段停顿信号（通常来自 Hazard Unit）
    input   wire[`WIDTH_PC - 1: 0]       current_pc,   // 当前 PC 值
    input   wire[`WIDTH_PC - 1: 0]       branch_pc,    // 执行阶段计算出的实际跳转目标地址
    input   wire[`WIDTH_INST - 1: 0]     inst,         // 当前指令（用于预测逻辑解析）
    input   wire                         PCSel,        // 实际跳转选择信号 (1: 跳转, 0: PC+4)
    input   wire                         risk_Ctrl_delay, // 延迟后的冲突信号
    output  wire[`WIDTH_PC - 1: 0]       npc,          // 最终生成的下一周期 PC
    output  wire                         risk_Ctrl     // 预测失败/控制冲突信号
);

wire [`WIDTH_PC - 1:0] pre_pc;
wire pre_jump;
reg [1:0] is_jump; // 预测记录移位寄存器，用于比对预测值与实际值

// ===============================================================
// 分支预测器例化 (Branch Predictor)
// ===============================================================
BranchPredictor branchPredictor (
    .clk(clk),
    .rst_n(rst_n),
    .inst(inst),
    .risk_Ctrl_delay(risk_Ctrl_delay),
    .pc(current_pc),
    .branch_pc(branch_pc),
    .pre_pc(pre_pc),   // 预测的下一条地址
    .jump(pre_jump)    // 预测是否跳转
);

// ===============================================================
// 预测状态追踪逻辑
// ===============================================================
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        is_jump <= 2'b00;
    end else if (risk_Ctrl) begin
        // 一旦预测错误，清空记录队列，强制标记为未跳转状态
        is_jump <= {`PCSEL_PC4, `PCSEL_PC4};
    end else begin
        // 移位寄存器：将当前周期的预测结果压入队列，供后续阶段验证
        is_jump <= stop_IF ? is_jump : {pre_jump, is_jump[1]};
    end
end

// ===============================================================
// 冲突判定与 NPC 生成
// ===============================================================

// 判定预测风险：如果实际跳转决策 (PCSel) 与之前的预测记录 (is_jump[0]) 不一致，则 risk_Ctrl 为高
assign risk_Ctrl = (PCSel == is_jump[0]) ? 1'b0 : 1'b1;

// NPC 选择逻辑优先级：
// 1. 预测失败修正：若预测跳转但实际不跳，回退到 current_pc + 4；若预测不跳但实际跳，转到 branch_pc。
// 2. 正常运行逻辑：若停顿则保持当前 PC；否则使用预测器给出的 pre_pc。
assign npc = risk_Ctrl ? (PCSel ? branch_pc : (current_pc + 32'd4)) :
             (stop_IF ? current_pc : pre_pc);

endmodule