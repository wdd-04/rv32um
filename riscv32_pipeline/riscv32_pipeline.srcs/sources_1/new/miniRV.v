`include "param.v"

/**
 * @Module: mini_rv
 * @Description: 五级流水 CPU 顶层，负责连接 IF/ID/EX/MEM/WB、
 *               前递控制、暂停控制以及外部访存总线。
 */
module mini_rv (
`ifdef DEBUG
           output wire          wb_have_inst, // WB 阶段是否有有效指令
           output wire [31: 0]  wb_pc,        // WB 阶段指令 PC
           output wire          wb_ena,       // WB 阶段寄存器写使能
           output wire [4: 0]   wb_reg,       // WB 阶段写回寄存器
           output wire [31: 0]  wb_value,     // WB 阶段写回数据
`endif
           output wire [`IO_BUS_WIDTH_ADDR - 1: 0]  mem_addr, // 外部访存地址
           output wire [`IO_BUS_WIDTH_CTRL - 1: 0]  mem_ctrl, // 外部访存读写控制
           output wire [`IO_BUS_WIDTH_DATA - 1: 0]  mem_wd,   // 外部访存写数据
           output wire [3: 0]                       mem_we,   // 外部访存字节写使能
           input  wire [`IO_BUS_WIDTH_DATA - 1: 0]  mem_rd,   // 外部访存读数据

           input wire           clk,   // 系统时钟
           input wire           rst_n  // 低有效复位
       );

// 地址信号
wire [31: 0]    pc_IF, pc_ID, pc_EX, pc4_EX, pc4_MEM, pc4_WB; // 各级 PC 和 PC+4
wire [31: 0]    pc_IF_ID;     // IF/ID 边界 PC
wire [31: 0]    pc_ID_EX;     // ID/EX 边界 PC
wire [31: 0]    pc_EX_MEM;    // EX/MEM 边界 PC
wire [31: 0]    pc4_MEM_WB;   // MEM/WB 边界 PC+4

// 指令信号
wire [31: 0]    inst_IF;            // IF 阶段取出的指令
wire [31: 0]    inst_ID, inst_ID_INSTDIV; // ID 指令和拆分后的伪指令
wire [6: 0]     func7_ID   = inst_ID[31: 25], func7_ID_INSTDIV = inst_ID_INSTDIV[31: 25]; // funct7 字段
wire [2: 0]     func3_ID   = inst_ID[14: 12], func3_ID_INSTDIV = inst_ID_INSTDIV[14: 12]; // funct3 字段
wire [6: 0]     opecode_ID = inst_ID[6: 0], opecode_ID_INSTDIV = inst_ID_INSTDIV[6: 0];   // opcode 字段
wire            TYPE_COMP_ID, TYPE_COMP_ID_INSTDIV; // 比较类指令标志
wire            TYPE_LOAD_ID, TYPE_LOAD_ID_INSTDIV; // load 指令标志
wire            TYPE_M_ID, TYPE_M_ID_INSTDIV, TYPE_M_EX; // M 扩展指令标志
wire [2: 0]     M_FUNC3_ID, M_FUNC3_ID_INSTDIV, M_FUNC3_EX; // M 扩展子操作

// 读取写入信息
wire [4: 0]     rs1_ID = inst_ID[19: 15]; // ID 源寄存器 1
wire [4: 0]     rs2_ID = inst_ID[24: 20]; // ID 源寄存器 2
wire [4: 0]     rs1_EX, rs2_EX, rs2_MEM;  // 进入后级的源寄存器号
wire [31: 0]    rd1_ID;                   // rs1 读数据
wire [31: 0]    rd2_ID;                   // rs2 读数据
wire [31: 0]    DRAMRd_MEM, DRAMRd_WB;    // MEM/WB 阶段 load 读结果
wire [31: 0]    RegWd_WB;                 // WB 阶段最终写回数据
wire [4: 0]     RegWr_ID, RegWr_EX, RegWr_MEM, RegWr_WB; // 写回目标寄存器

// 运算结果
reg  [31: 0]    Anum_ID, Anum2_ID, Bnum_ID, Bnum2_ID; // ID 阶段操作数候选
wire [31: 0]    Anum_EX, Anum2_EX, Bnum_EX, Bnum2_EX; // ID/EX 锁存后的操作数
reg  [31: 0]    Anum_EX_AfterForwarding, Bnum_EX_AfterForwarding; // 前递后的 ALU 主操作数
reg  [31: 0]    Anum2_EX_AfterForwarding, Bnum2_EX_AfterForwarding; // 前递后的备用操作数
wire [31: 0]    ALUOut_EX, ALUOut_MEM, ALUOut_MEM_mem, ALUOut_WB; // ALU 结果流水传递
wire [1: 0]     COMPOut_EX, COMPOut_MEM, COMPOut_WB; // 比较结果流水传递
wire [31: 0]    COMPExOut_WB;        // 扩展后的比较写回值
wire [31: 0]    immOut_ID;           // ID 阶段立即数
wire [31: 0]    branch_pc_IF;        // EX 反馈给 IF 的跳转目标
wire            pred_taken_IF, pred_taken_ID, pred_taken_EX; // 分支预测方向流水传递
wire [31: 0]    pred_target_IF, pred_target_ID, pred_target_EX; // 分支预测目标流水传递

// 异常和暂停信号
wire risk_Ctrl;         // 分支预测失败或跳转修正
wire stop_IF;           // IF 总暂停信号
wire stop_IF_exception; // 冒险控制给出的前端暂停
wire stop_ID;           // ID 阶段暂停/插气泡
wire M_stall_EX;        // M 扩展多周期暂停
wire mem_sync_stall;    // 同步 BRAM 访存等待
assign stop_IF = stop_IF_exception | M_stall_EX | mem_sync_stall;

// 前递信号
wire            MUX_A_Forwarding; // EX A 端是否使用前递
wire            MUX_B_Forwarding; // EX B 端是否使用前递
wire [31: 0]    forwardingA;      // A 端前递数据
wire [31: 0]    forwardingB;      // B 端前递数据

// 控制信号
wire [3: 0]     PCCTRL_ID, PCCTRL_ID_INSTDIV, PCCTRL_EX; // 分支/跳转控制
wire            RegWe_ID, RegWe_ID_INSTDIV, RegWe_EX, RegWe_MEM, RegWe_WB; // 寄存器写使能
wire            ASel_ID, ASel_ID_INSTDIV, ASel_EX; // ALU A 端选择
wire            BSel_ID, BSel_ID_INSTDIV, BSel_EX; // ALU B 端选择
wire            DRAMWE_ID, DRAMWE_ID_INSTDIV, DRAMWE_EX, DRAMWE_MEM; // 数据存储器写使能
wire [1: 0]     RWSel_ID, RWSel_ID_INSTDIV, RWSel_EX, RWSel_MEM, RWSel_WB; // 写回来源选择
wire [4: 0]     SextOpe_ID, SextOpe_ID_INSTDIV; // 立即数扩展控制
wire [2: 0]     ALUop_ID, ALUop_ID_INSTDIV, ALUop_EX; // ALU 操作编码
wire            Unsigned_ID, Unsigned_ID_INSTDIV, Unsigned_EX, Unsigned_MEM; // 无符号控制
wire [1: 0]     DRAM_EX_TYPE_ID, DRAM_EX_TYPE_ID_INSTDIV, DRAM_EX_TYPE_EX, DRAM_EX_TYPE_MEM; // 访存宽度
wire [31: 0]    DRAMIn_MEM; // MEM 阶段 store 写数据
wire            inst_div;   // byte/half store 拆分标志


`ifdef DEBUG
    reg [4: 0] wbInst; // 调试用流水线有效位
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            wbInst <= 0;
        end
        else if (stop_IF) begin
            wbInst[4: 0] <= {wbInst[3: 2], 1'b0, wbInst[1: 0]};
        end
        else if (stop_ID) begin
            wbInst[4: 0] <= {wbInst[3: 2], 2'b0, wbInst[0]};
        end
        else begin
            wbInst[4: 0] <= {wbInst[3: 0], 1'b1};
        end
    end
// 流水线 CPU 中，wb_have_inst 由 WB 有效位给出
    assign wb_have_inst = wbInst[4];
    assign wb_pc        = pc4_WB - 4;
    assign wb_ena       = RegWe_WB;
    assign wb_reg       = RegWr_WB;
    assign wb_value     = RegWd_WB;
`endif

// 取指阶段

IF If (
       .clk(clk),
       .rst_n(rst_n),
       .stop_IF(stop_IF),
       .PCCTRL(PCCTRL_EX),
       .branch_inst_pc(pc_EX),
       .branch_pc(ALUOut_EX),
       .COMPOut(COMPOut_EX),
       .pred_taken_EX(pred_taken_EX),
       .pred_target_EX(pred_target_EX),
       .inst(inst_IF),
       .inst_ID(inst_ID),
       .pc(pc_IF),
       .pred_taken(pred_taken_IF),
       .pred_target(pred_target_IF),
       .risk_Ctrl(risk_Ctrl)
   );

IF_ID if_id (
          .clk(clk),
          .rst_n(rst_n),
          .stop_IF(stop_IF),
          .flush(risk_Ctrl),
          .pc(pc_IF),
          .inst(inst_IF),
          .pred_taken(pred_taken_IF),
          .pred_target(pred_target_IF),
          .pc_o(pc_ID),
          .inst_o(inst_ID),
          .pred_taken_o(pred_taken_ID),
          .pred_target_o(pred_target_ID)
      );

EX_IF ex_if (
    .clk(clk), 
    .rst_n(rst_n),
    .branch_pc(ALUOut_EX),
    .branch_pc_o(branch_pc_IF)
);

// 译码阶段
InstDivider instDivider (
    .inst_in(inst_ID),
    .inst_out(inst_ID_INSTDIV)
);

// 控制模块
CTRL ctrl (
         .clk(clk),
         .rst_n(rst_n),
         .func7(func7_ID),
         .func3(func3_ID),
         .opecode(opecode_ID),
         .RegWe(RegWe_ID),
         .ASel(ASel_ID),
         .BSel(BSel_ID),
         .DRAMWE(DRAMWE_ID),
         .RWSel(RWSel_ID),
         .SextOpe(SextOpe_ID),
         .DRAM_EX_TYPE(DRAM_EX_TYPE_ID),
         .TYPE_COMP(TYPE_COMP_ID),
         .TYPE_LOAD(TYPE_LOAD_ID),
         .TYPE_M(TYPE_M_ID),
         .M_FUNC3(M_FUNC3_ID),
         .PCCTRL(PCCTRL_ID),
         .inst_div(inst_div),
         .ALUop(ALUop_ID),
         .Unsigned(Unsigned_ID)
     );

CTRL ctrl_INSTDIV (
         .clk(clk),
         .rst_n(rst_n),
         .func7(func7_ID_INSTDIV),
         .func3(func3_ID_INSTDIV),
         .opecode(opecode_ID_INSTDIV),
         .RegWe(RegWe_ID_INSTDIV),
         .ASel(ASel_ID_INSTDIV),
         .BSel(BSel_ID_INSTDIV),
         .DRAMWE(DRAMWE_ID_INSTDIV),
         .RWSel(RWSel_ID_INSTDIV),
         .SextOpe(SextOpe_ID_INSTDIV),
         .DRAM_EX_TYPE(DRAM_EX_TYPE_ID_INSTDIV),
         .TYPE_COMP(TYPE_COMP_ID_INSTDIV),
         .TYPE_LOAD(TYPE_LOAD_ID_INSTDIV),
         .TYPE_M(TYPE_M_ID_INSTDIV),
         .M_FUNC3(M_FUNC3_ID_INSTDIV),
         .PCCTRL(PCCTRL_ID_INSTDIV),
         .ALUop(ALUop_ID_INSTDIV),
         .Unsigned(Unsigned_ID_INSTDIV)  
);

ID Id (
       .clk(clk),
       .rst_n(rst_n),
       .inst(inst_ID),
       .SextOpe(SextOpe_ID),
       .RegWe(RegWe_WB),
       .RegWd(RegWd_WB),
       .RegWr(RegWr_WB),
       .rd1(rd1_ID),
       .rd2(rd2_ID),
       .immOut(immOut_ID)
   );

ID_EX id_ex (
          .clk(clk),
          .rst_n(rst_n),
          .stop_ID(stop_ID),
          .flush(risk_Ctrl),
          .inst_div(inst_div),
          .pc(pc_ID),
          .pred_taken(pred_taken_ID),
          .pred_target(pred_target_ID),
          .ASel(ASel_ID),
          .BSel(BSel_ID),
          .Anum(Anum_ID),
          .Bnum(Bnum_ID),
          .Anum2(Anum2_ID),
          .Bnum2(Bnum2_ID),
          .ALUop(ALUop_ID),
          .Unsigned(Unsigned_ID),
          .DRAM_EX_TYPE(DRAM_EX_TYPE_ID),
          .DRAMWE(DRAMWE_ID),
          .RWSel(RWSel_ID),
          .RegWr(inst_ID[11: 7]),
          .Rs1(rs1_ID),
          .Rs2(rs2_ID),
          .RegWe(RegWe_ID),
          .PCCTRL(PCCTRL_ID),
          .M(TYPE_M_ID),
          .M_FUNC3(M_FUNC3_ID),

          .ASel_div(ASel_ID_INSTDIV),
          .BSel_div(BSel_ID_INSTDIV),
          .ALUop_div(ALUop_ID_INSTDIV),
          .Unsigned_div(Unsigned_ID_INSTDIV),
          .DRAM_EX_TYPE_div(DRAM_EX_TYPE_ID_INSTDIV),
          .DRAMWE_div(DRAMWE_ID_INSTDIV),
          .RWSel_div(RWSel_ID_INSTDIV),
          .RegWr_div(inst_ID_INSTDIV[11: 7]),
          .Rs1_div(inst_ID_INSTDIV[19: 15]),
          .Rs2_div(inst_ID_INSTDIV[24: 20]),
          .RegWe_div(RegWe_ID_INSTDIV),
          .PCCTRL_div(PCCTRL_ID_INSTDIV),
          .M_div(TYPE_M_ID_INSTDIV),
          .M_FUNC3_div(M_FUNC3_ID_INSTDIV),
          .hold_EX(M_stall_EX | mem_sync_stall),

          .pc_o(pc_EX),
          .pred_taken_o(pred_taken_EX),
          .pred_target_o(pred_target_EX),
          .ASel_o(ASel_EX),
          .BSel_o(BSel_EX),
          .Anum_o(Anum_EX),
          .Bnum_o(Bnum_EX),
          .Anum2_o(Anum2_EX),
          .Bnum2_o(Bnum2_EX),
          .ALUop_o(ALUop_EX),
          .Unsigned_o(Unsigned_EX),
          .DRAM_EX_TYPE_o(DRAM_EX_TYPE_EX),
          .DRAMWE_o(DRAMWE_EX),
          .RWSel_o(RWSel_EX),
          .RegWr_o(RegWr_EX),
          .Rs1_o(rs1_EX),
          .Rs2_o(rs2_EX),
          .RegWe_o(RegWe_EX),
          .PCCTRL_o(PCCTRL_EX),
          .M_o(TYPE_M_EX),
          .M_FUNC3_o(M_FUNC3_EX)
      );

// 操作数选择
always @(*) begin
// A操作数选择
    Anum_ID  = (ASel_ID == `ASEL_REG) ? rd1_ID : pc_ID;
    Anum2_ID = (ASel_ID == `ASEL_REG) ? pc_ID : rd1_ID;
end

always @(*) begin
// B操作数选择
    Bnum_ID  = (BSel_ID == `BSEL_REG) ? rd2_ID : immOut_ID;
    Bnum2_ID = (BSel_ID == `BSEL_REG) ? immOut_ID : rd2_ID;
end

// 执行阶段

// 前递数据选择
always @(*) begin
// A操作数选择
    if (MUX_A_Forwarding == `ASEL_FORWARDING) begin // 有前递
        Anum_EX_AfterForwarding  = (ASel_EX == `ASEL_REG) ? forwardingA : Anum_EX;
        Anum2_EX_AfterForwarding = (ASel_EX == `ASEL_REG) ? Anum2_EX : forwardingA;
    end
    else begin // 无前递
        Anum_EX_AfterForwarding  = Anum_EX;
        Anum2_EX_AfterForwarding = Anum2_EX;
    end
end
always @(*) begin
// A操作数选择
    if (MUX_B_Forwarding == `BSEL_FORWARDING) begin // 有前递
        Bnum_EX_AfterForwarding  = (BSel_EX == `BSEL_REG) ? forwardingB : Bnum_EX;
        Bnum2_EX_AfterForwarding = (BSel_EX == `BSEL_REG) ? Bnum2_EX : forwardingB;
    end
    else begin // 无前递
        Bnum_EX_AfterForwarding  = Bnum_EX;
        Bnum2_EX_AfterForwarding = Bnum2_EX;
    end
end


EX Ex (
       .clk(clk),
       .rst_n(rst_n),
       .Ain(Anum_EX_AfterForwarding),
       .Bin(Bnum_EX_AfterForwarding),
       .COMPAin(Anum2_EX_AfterForwarding),
       .COMPBin(Bnum2_EX_AfterForwarding),
       .ALUop(ALUop_EX),
       .Unsigned(Unsigned_EX),
       .M(TYPE_M_EX),
       .M_FUNC3(M_FUNC3_EX),
       .M_stall(M_stall_EX),
       .COMPOut(COMPOut_EX),
       .ALUOut(ALUOut_EX)
   );

assign pc4_EX = pc_EX + 4;


EX_MEM ex_mem (
           .clk(clk),
           .rst_n(rst_n),
           .M_stall(M_stall_EX),
           .hold_MEM(mem_sync_stall),
           .bubble_MEM(1'b0),
           .pc(pc4_EX),
           .DRAM_EX_TYPE(DRAM_EX_TYPE_EX),
           .DRAMWE(DRAMWE_EX),
           .RWSel(RWSel_EX),
           .RegWr(RegWr_EX),
           .Rs2(rs2_EX),
           .RegWe(RegWe_EX),
           .COMPOut(COMPOut_EX),
           .ALUOut(ALUOut_EX),
           .DRAMIn(Bnum2_EX_AfterForwarding), // S 型指令写入寄存器值，使用前递后的 rs2
           .Unsigned(Unsigned_EX),

           .pc_o(pc4_MEM),
           .DRAM_EX_TYPE_o(DRAM_EX_TYPE_MEM),
           .DRAMWE_o(DRAMWE_MEM),
           .RWSel_o(RWSel_MEM),
           .RegWr_o(RegWr_MEM),
           .Rs2_o(rs2_MEM),
           .RegWe_o(RegWe_MEM),
           .COMPOut_o(COMPOut_MEM),
           .ALUOut_o(ALUOut_MEM),
           .ALUOut_mem_o(ALUOut_MEM_mem),
           .DRAMIn_o(DRAMIn_MEM),
           .Unsigned_o(Unsigned_MEM)
       );

// 访存阶段
// 同步 BRAM 访存等待：load/store 先发起访问，下一拍再提交结果
wire mem_access_MEM = (RWSel_MEM == `REGWD_DRAMRD) || DRAMWE_MEM;
wire mem_access_commit;
reg  mem_access_waited;

assign mem_sync_stall    = mem_access_MEM && !mem_access_waited;
assign mem_access_commit = mem_access_MEM &&  mem_access_waited;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        mem_access_waited <= 1'b0;
    end
    else if (mem_sync_stall) begin
        mem_access_waited <= 1'b1;
    end
    else begin
        mem_access_waited <= 1'b0;
    end
end

wire [31: 0] DRAMIn_MEM_forwarded;
assign DRAMIn_MEM_forwarded = (DRAMWE_MEM && RegWe_WB && (RegWr_WB != 5'd0) && (RegWr_WB == rs2_MEM)) ? RegWd_WB : DRAMIn_MEM;

reg [31: 0] bus_rd_WB;

always @(posedge clk) begin
    bus_rd_WB <= DRAMRd_MEM; // 单独打一拍，降低时序压力
end

wire [31:0] mem_addr_raw;
wire [31:0] mem_wd_raw;
wire [3:0]  mem_we_raw;
wire [`IO_BUS_WIDTH_CTRL - 1:0] mem_ctrl_raw;
wire [31:0] mem_rd_cached;

MEM mem (
    .addr(ALUOut_MEM_mem),
    .DRAMWE(DRAMWE_MEM && mem_access_commit),
    .DRAM_EX_TYPE(DRAM_EX_TYPE_MEM),
    .Unsigned(Unsigned_MEM),
    .bus_rd(mem_rd_cached),
    .din(DRAMIn_MEM_forwarded),
    .bus_rd_WB(bus_rd_WB),
    .bus_addr(mem_addr_raw),
    .bus_wd(mem_wd_raw),
    .bus_we(mem_we_raw),
    .bus_ctrl(mem_ctrl_raw),
    .DRAMRd(DRAMRd_MEM)
);

dCache_Wrapper dcache (
    .clk(clk),
    .rst_n(rst_n),
    .cpu_valid(mem_access_MEM),
    .cpu_addr(mem_addr_raw),
    .cpu_ctrl(mem_ctrl_raw),
    .cpu_we(mem_we_raw),
    .cpu_wd(mem_wd_raw),
    .cpu_rd(mem_rd_cached),
    .mem_addr(mem_addr),
    .mem_ctrl(mem_ctrl),
    .mem_we(mem_we),
    .mem_wd(mem_wd),
    .mem_rd(mem_rd)
);

MEM_WB mem_wb (
           .clk(clk),
           .rst_n(rst_n),
           .hold(mem_sync_stall),
           .pc4(pc4_MEM),
           .RWSel(RWSel_MEM),
           .RegWr(RegWr_MEM),
           .RegWe(RegWe_MEM),
           .COMPOut(COMPOut_MEM),
           .ALUOut(ALUOut_MEM),
           .DRAMRd(DRAMRd_MEM),

           .pc4_o(pc4_WB),
           .RWSel_o(RWSel_WB),
           .RegWr_o(RegWr_WB),
           .RegWe_o(RegWe_WB),
           .COMPOut_o(COMPOut_WB),
           .ALUOut_o(ALUOut_WB),
           .DRAMRd_o(DRAMRd_WB)
       );

// 写回阶段

assign COMPExOut_WB = {31'b0, COMPOut_WB[0]}; // 比较结果扩展到 32 位

WB Wb (
       .pc4(pc4_WB),
       .COMPExOut(COMPExOut_WB),
       .ALUOut(ALUOut_WB),
       .DRAMRd(DRAMRd_WB),
       .RWSel(RWSel_WB),
       .RegWd(RegWd_WB)
   );


// 冒险与异常处理

wire isLoad_EX = (RWSel_EX == `REGWD_DRAMRD);

reg rd_Type_EX, rd_Type_MEM;
wire [31: 0] rd_EX  = (rd_Type_MEM) ? {31'b0, COMPOut_MEM[0]} : ALUOut_MEM[31: 0];
wire [31: 0] rd_MEM = RegWd_WB[31: 0];

assign rs1_ID      = inst_ID[19: 15];
assign rs2_ID      = inst_ID[24: 20];

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        rd_Type_EX <= 0;
        rd_Type_MEM <= 0;
    end
    else begin
        rd_Type_EX  <= TYPE_COMP_ID;
        rd_Type_MEM <= rd_Type_EX;
    end
end

ForwardingUnit forwardingUnit (
                   .clk(clk),
                   .rst_n(rst_n),
                   .risk_Ctrl(risk_Ctrl), // 连接顶层跳转冒险信号
                   .rs1_ID(rs1_EX),
                   .rs2_ID(rs2_EX),
                   .wr_EX(RegWr_MEM),
                   .wr_MEM(RegWr_WB),
                   .we_EX(RegWe_MEM),
                   .we_MEM(RegWe_WB),
                   .rd_EX(rd_EX),
                   .rd_MEM(rd_MEM),
                   .MUX_A_forwarding(MUX_A_Forwarding),
                   .MUX_B_forwarding(MUX_B_Forwarding),
                   .forwardingA(forwardingA),
                   .forwardingB(forwardingB)
               );

ExceptionCTRL exceptionCTRL (
                  .rs1_ID(rs1_ID),
                  .rs2_ID(rs2_ID),
                  .wr_EX(RegWr_EX),
                  .isLoad(isLoad_EX),
                  .inst_div(inst_div),
                  .isRiskCtrl(risk_Ctrl),
                  .cache_stall(1'b0), // 当前未接入 cache stall
                  .stop_IF(stop_IF_exception),
                  .stop_ID(stop_ID)
              );

endmodule

