`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: CTRL
 * @Description: 主控制单元。
 *               负责将译码阶段的指令字段转换为具体的硬件控制信号。
 *               包括：指令类型识别、运算源选择、访存控制、写回源选择以及分支跳转逻辑。
 */
module CTRL (
           input   wire        clk,
           input   wire        rst_n,
           input   wire[6: 0]  func7,
           input   wire[2: 0]  func3,
           input   wire[6: 0]  opecode,
           output  reg         RegWe,          // 寄存器堆写使能
           output  reg         ASel,           // ALU A端口选择 (0:Reg, 1:PC)
           output  reg         BSel,           // ALU B端口选择 (0:Reg, 1:Imm)
           output  reg         DRAMWE,         // 数据存储器写使能
           output  reg[1: 0]   RWSel,          // 写回寄存器数据源选择
           output  wire[4: 0]  SextOpe,        // 立即数符号扩展模式选择
           output  wire[1: 0]  DRAM_EX_TYPE,   // 访存宽度 (Byte, Half, Word)
           output  wire        TYPE_COMP,      // 比较/逻辑运算指令标志
           output  wire        TYPE_LOAD,      // 加载指令标志
           output  wire        TYPE_M,         // M扩展指令 (乘除法) 标志
           output  wire[2: 0]  M_FUNC3,        // 传递给乘除法器的功能码
           output  reg [`WIDTH_PCCTRL - 1: 0]  PCCTRL, // 分支跳转控制总线
           output  wire        inst_div,       // 指令拆分信号 (用于特定的访存周期)
           output  wire [2: 0] ALUop,          // ALU 操作码
           output  wire        Unsigned        // 无符号运算标志
       );

// =================================================================
// 指令类型解码逻辑 (Instruction Type Decoding)
// =================================================================
wire r, i, s, b, u, j;
reg  [5: 0] type_reg;

wire TYPE_COMP_R;
wire TYPE_COMP_I;
wire TYPE_JUMP;
wire TYPE_PC;
wire TYPE_FENCE;
wire TYPE_NOP;

assign {r, i, s, b, u, j} = type_reg[5: 0];

// 信号生成逻辑
assign SextOpe     = {i, s, b, j, u};
assign TYPE_COMP   = ({opecode[6], opecode[4: 2]} == 4'b0100 && func3[2:1] == 2'b01 && !TYPE_M) ? 1'b1 : 1'b0;
assign TYPE_COMP_R = (TYPE_COMP & opecode[5]) ? 1'b1 : 1'b0;
assign TYPE_COMP_I = (TYPE_COMP & ~opecode[5]) ? 1'b1 : 1'b0;
assign TYPE_JUMP   = (j || (opecode[6: 2] == 5'b11001)) ? 1'b1 : 1'b0;
assign TYPE_PC     = ((j | b | TYPE_COMP) == 1'b1 || (opecode[6: 2] == 5'b00101));
assign TYPE_LOAD   = (opecode[6: 2] == 5'b00000) ? 1'b1 : 1'b0;
assign TYPE_M      = (opecode == 7'b0110011 && func7 == 7'b0000001) ? 1'b1 : 1'b0;
assign TYPE_FENCE  = (opecode == 7'b0001111) ? 1'b1 : 1'b0;
assign M_FUNC3     = func3;
assign TYPE_NOP    = ((opecode[1: 0] == 2'b00) || TYPE_FENCE) ? 1'b1 : 1'b0;

// Opcode 映射到基本指令格式
always @(*) begin
    case (opecode[6:2])
        5'b01100: type_reg = 6'b100000; // R-type
        5'b01101: type_reg = 6'b000010; // U-type: LUI
        5'b00101: type_reg = 6'b000010; // U-type: AUIPC
        5'b11011: type_reg = 6'b000001; // J-type
        5'b01000: type_reg = 6'b001000; // S-type
        5'b11000: type_reg = 6'b000100; // B-type
        default:  type_reg = 6'b010000; // I-type
    endcase
end

// =================================================================
// 控制通路信号分配 (Datapath Control Signals)
// =================================================================

// 寄存器写使能控制：Store、Branch 和 NOP 指令不写寄存器
always @(*) begin
    if (s | b | TYPE_NOP) begin
        RegWe = `REGWE_READ;
    end
    else begin
        RegWe = `REGWE_WRITE;
    end
end

// ALU A操作数选择：跳转或比较指令通常需要 PC
always @(*) begin
    if (TYPE_PC) begin
        ASel = `ASEL_PC;
    end
    else begin
        ASel = `ASEL_REG;
    end
end

// ALU B操作数选择：根据是否是 R-type 指令选择寄存器或立即数
always @(*) begin
    if ((r == 1'b1 && TYPE_COMP_R == 1'b0) || TYPE_COMP_I == 1'b1) begin
        BSel = `BSEL_REG;
    end
    else begin
        BSel = `BSEL_IMM;
    end
end

// 写回数据源选择逻辑
always @(*) begin
    if (TYPE_NOP) begin
        RWSel = `REGWD_ALUOUT;
    end
    else if (TYPE_LOAD) begin
        RWSel = `REGWD_DRAMRD;
    end
    else if (TYPE_COMP) begin
        RWSel = `REGWD_COMPOUT;
    end
    else if (TYPE_JUMP) begin
        RWSel = `REGWD_PC;
    end
    else begin
        RWSel = `REGWD_ALUOUT;
    end
end

// 存储器写使能逻辑
always @(*) begin
    if (s) begin
        DRAMWE = `DRAM_WRITE;
    end
    else begin
        DRAMWE = `DRAM_READ;
    end
end

// 访存类型转换：由 func3 决定是按字节(Byte)还是半字(Half Word)访问
assign DRAM_EX_TYPE[1: 0] = {
           ((func3[1: 0] == 2'b01) ? 1'b1 : 1'b0),
           ((func3[1: 0] == 2'b00) ? 1'b1 : 1'b0)
       };

// =================================================================
// 分支跳转控制逻辑 (Branch Control)
// =================================================================
always @(*) begin
    PCCTRL[`PCCTRL_J] = TYPE_JUMP;
    PCCTRL[`PCCTRL_B] = b;
    case (func3)
        3'b000:  PCCTRL[1: 0] = `PCCTRL_B_EQ;
        3'b001:  PCCTRL[1: 0] = `PCCTRL_B_NE;
        3'b100:  PCCTRL[1: 0] = `PCCTRL_B_LT;
        3'b110:  PCCTRL[1: 0] = `PCCTRL_B_LT;
        default: PCCTRL[1: 0] = `PCCTRL_B_GEQ;
    endcase
end

// =================================================================
// 指令拆分计数器与 ALU 操作实例化
// =================================================================
reg counter; // 用于控制多周期拆分指令（如对齐访存辅助操作）

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        counter <= 1'b0;
    end
    else if (counter == 1'b1) begin
        counter <= ~counter;
    end
    else begin
        counter <= inst_div;
    end
end

// 触发指令拆分的条件：存储操作且为特定的字节/半字对齐类型
assign inst_div = (counter) ? 1'b0 : (s & (DRAM_EX_TYPE[0] | DRAM_EX_TYPE[1]));

ALUope aluOpe (
           .func7(func7),
           .func3(func3),
           .opecode(opecode),
           .ALUop(ALUop),
           .Unsigned(Unsigned)
       );

endmodule