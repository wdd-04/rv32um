`include "../../param.v"

/**
 * @Module: ALU
 * @Description: 算术逻辑单元。
 *               1. 实现加法、减法、逻辑运算（AND, OR, XOR）及移位运算（SLL, SRL, SRA）。
 *               2. 减法通过加法器实现：A - B = A + (~B + 1)。
 *               3. 针对 LUI 等指令的特殊处理：在 SLL 路径下通过 Unsigned 标志位直接输出操作数 B。
 */
module ALU (
           input    wire [31: 0]    A,          // 操作数 A
           input    wire [31: 0]    B,          // 操作数 B
           input    wire [2: 0]     ALUop,      // ALU 操作码控制信号
           input    wire            Unsigned,   // 符号控制（在此模块中辅助处理特殊指令如 LUI）
           output   wire [31: 0]    out         // 计算结果输出
       );

// 运算中间结果
wire [31: 0]        addOut;
wire [31: 0]        subOut;
wire [31: 0]        andOut;
wire [31: 0]        orOut;
wire [31: 0]        xorOut;
wire [31: 0]        sllOut;
wire [31: 0]        srlOut;
wire [31: 0]        sraOut;
wire                trash_bit;  // 用于吸收进位加法中不必要的位

// 输出寄存器（组合逻辑 reg）
reg [31: 0]         out_reg;


// ===============================================================
// 运算逻辑实现 (Arithmetic & Logic Operations)
// ===============================================================

// 减法复用加法器逻辑: 
// A - B 等效于 A + (~B) + 1
// 这里通过将 A 左移一位并补入 0 或 subOpe，B 补入 1 或 0 来巧妙实现末尾加 1
wire [32: 0] addA;
wire [32: 0] addB;
wire         subOpe;
assign subOpe = (ALUop == `SUB); // 判断当前是否为减法操作

// 如果是减法：addA = {A, 1'b1}, addB = {~B, 1'b1} -> 结果右移一位即为 A + ~B + 1
// 如果是加法：addA = {A, 1'b0}, addB = {B, 1'b0}  -> 结果右移一位即为 A + B
assign addA   = {A[31: 0], subOpe};
assign addB   = (subOpe) ? {(~B), 1'b1} : {B, 1'b0};

// 计算输出
assign {addOut[31: 0], trash_bit} = addA[32: 0] + addB[32: 0]; // 进位结果通过位拼接提取

// 位逻辑运算
assign andOut[31: 0]              = A[31: 0] & B[31: 0];
assign orOut[31: 0]                = A[31: 0] | B[31: 0];
assign xorOut[31: 0]               = A[31: 0] ^ B[31: 0];

// 移位运算
// SLL 特殊处理：当 Unsigned 标志激活时，通常用于 LUI 指令，直接将立即数 B 传回输出
assign sllOut[31: 0]              = (Unsigned == `UNSIGNED) ? B[31: 0] : A[31: 0] << $unsigned(B[4: 0]); 
assign srlOut[31: 0]              = A[31: 0] >> $unsigned(B[4: 0]);           // 逻辑右移
assign sraOut[31: 0]              = $signed(A[31: 0]) >>> $unsigned(B[4: 0]); // 算术右移（保留符号位）

// ===============================================================
// 输出结果多路选择器 (Output Selection Mux)
// ===============================================================

assign out = out_reg;

always @(*) begin
    case (ALUop)
        `AND: begin
            out_reg[31: 0] = andOut[31: 0];
        end
        `OR: begin
            out_reg[31: 0] = orOut[31: 0];
        end
        `XOR: begin
            out_reg[31: 0] = xorOut[31: 0];
        end
        `SLL: begin
            out_reg[31: 0] = sllOut[31: 0];
        end
        `SRL: begin
            out_reg[31: 0] = srlOut[31: 0];
        end
        `SRA: begin
            out_reg[31: 0] = sraOut[31: 0];
        end
        default: begin  // 默认为 ADD 或 SUB (两者共享 addOut 结果路径)
            out_reg[31: 0] = addOut[31: 0];
        end
    endcase
end

endmodule