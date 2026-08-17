`ifdef DEBUG
    `include "param.v"
`else
    `include "../param.v"
`endif

/**
 * @Module: EX
 * @Description: 执行阶段顶层模块。
 *               1. 包含基础 ALU：处理加减、位运算、移位等单周期指令。
 *               2. 包含比较器 (COMP)：处理分支指令的条件判定。
 *               3. 包含 M 扩展单元：集成 16 周期乘法器和 32 周期除法器。
 *               4. 停顿逻辑 (M_stall)：当执行乘除法时，拉高停顿信号直至运算完成。
 */
module EX (
           input  wire            clk,
           input  wire            rst_n,
           input  wire [31: 0]    Ain,          // 操作数 A
           input  wire [31: 0]    Bin,          // 操作数 B
           input  wire [31: 0]    COMPAin,      // 比较器输入 A (通常来自旁路后的寄存器值)
           input  wire [31: 0]    COMPBin,      // 比较器输入 B
           input  wire [2: 0]     ALUop,        // ALU 操作码
           input  wire            Unsigned,     // 无符号符号位
           input  wire            M,            // M 扩展指令使能信号
           input  wire [2: 0]     M_FUNC3,      // RISC-V M 扩展功能码 (MUL/DIV/REM)
           output wire            M_stall,      // M 扩展运算导致的流水线停顿信号
           output wire [1: 0]     COMPOut,      // 比较结果输出 (LT, EQ 等)
           output wire [31: 0]    ALUOut        // 执行阶段最终计算结果输出
       );

// =================================================================
// 基础运算单元 (Base Execution Units)
// =================================================================
wire [31:0] alu_out;

// 标准 ALU 实例化
ALU alu (
        .A(Ain),
        .B(Bin),
        .ALUop(ALUop),
        .Unsigned(Unsigned),
        .out(alu_out)
    );

// 比较单元实例化
COMP comp (
          .A(COMPAin),
          .B(COMPBin),
          .Unsigned(Unsigned),
          .out(COMPOut)
     );

// =================================================================
// M 扩展控制逻辑 (Multiplication & Division Logic)
// =================================================================
reg m_active; // M 运算激活状态
reg m_armed;  // M 运算就绪锁存

wire        mul_op = M && (M_FUNC3[2] == 1'b0); // 编码 0xx 为乘法
wire        div_op = M && (M_FUNC3[2] == 1'b1); // 编码 1xx 为除法
wire        m_start = M && !m_active;           // 启动脉冲
wire        mul_done;
wire        div_done;
wire [63:0] mul_product;
wire [31:0] div_quotient;
wire [31:0] div_remainder;

// 乘法符号选择逻辑
reg [1:0] mul_sign_sel;
always @(*) begin
    case (M_FUNC3)
        3'b010:  mul_sign_sel = 2'b01; // MULHSU: rs1 有符号, rs2 无符号
        3'b011:  mul_sign_sel = 2'b10; // MULHU:  两者均为无符号
        default: mul_sign_sel = 2'b00; // MUL/MULH: 默认有符号路径
    endcase
end

// 16 周期流水线/循环乘法器
multiplier_16c m_mul (
    .clk(clk),
    .reset(~rst_n),
    .enable(m_start && mul_op),
    .sign_sel(mul_sign_sel),
    .opA(Ain),
    .opB(Bin),
    .done(mul_done),
    .product(mul_product)
);

// 32 周期试商除法器
divider_32c m_div (
    .clk(clk),
    .reset(~rst_n),
    .enable(m_start && div_op),
    .sign_sel(M_FUNC3[0]), // 区分 DIV/DIVU 或 REM/REMU
    .numA(Ain),
    .denB(Bin),
    .done(div_done),
    .busy_out(),
    .quotient(div_quotient),
    .remainder(div_remainder)
);

// =================================================================
// M 扩展状态机 (M-Extension State Machine)
// =================================================================
wire unit_done = (mul_op && mul_done) || (div_op && div_done);
wire m_done = m_active && m_armed && unit_done; // 运算真正完成的判定

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        m_active <= 1'b0;
        m_armed  <= 1'b0;
    end
    else if (!M) begin
        m_active <= 1'b0;
        m_armed  <= 1'b0;
    end
    else if (m_done) begin
        m_active <= 1'b0;
        m_armed  <= 1'b0;
    end
    else if (m_start) begin
        m_active <= 1'b1;
        m_armed  <= 1'b0;
    end
    else if (m_active && !unit_done) begin
        m_armed  <= 1'b1;
    end
end

// =================================================================
// 结果选择与输出 (Result Mux & Output)
// =================================================================
reg [31:0] m_result;
always @(*) begin
    case (M_FUNC3)
        3'b000: m_result = mul_product[31:0];  // MUL: 取低 32 位
        3'b001: m_result = mul_product[63:32]; // MULH: 取高 32 位
        3'b010: m_result = mul_product[63:32]; // MULHSU
        3'b011: m_result = mul_product[63:32]; // MULHU
        3'b100: m_result = div_quotient;       // DIV: 商
        3'b101: m_result = div_quotient;       // DIVU
        3'b110: m_result = div_remainder;      // REM: 余数
        3'b111: m_result = div_remainder;      // REMU
        default: m_result = 32'b0;
    endcase
end

// 如果 M 指令未完成，则持续拉高 stall 信号阻塞流水线
assign M_stall = M && !m_done;

// 最终结果输出选择：M 扩展结果或普通 ALU 结果
assign ALUOut = M ? m_result : alu_out;

endmodule