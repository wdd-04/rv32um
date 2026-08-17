`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: ALUope
 * @Description: ALU 操作解码器。
 *               根据指令的具体编码位，确定 ALU 的运算类型（如 ADD, SUB, SLL 等）
 *               以及确定运算是否涉及无符号数（Unsigned）。
 */
module ALUope (
           input    wire[6: 0]  func7,
           input    wire[2: 0]  func3,
           input    wire[6: 0]  opecode,
           output   reg[2: 0]   ALUop,      // 输出至 ALU 的操作控制信号
           output   reg         Unsigned    // 符号位控制 (0: Signed, 1: Unsigned)
       );

// =================================================================
// 运算类型控制逻辑 (Arithmetic/Logic Operation Selection)
// =================================================================

always @(*) begin
    // 使用 casez 进行位匹配，? 代表忽略位 (Don't Care)
    casez ({func7[5], func3, opecode[6:2]})
        // 移位运算 (Shift Operations)
        9'b11010?100: // SRA, SRAI (算术右移)
            ALUop = `SRA;
        9'b01010?100: // SRL, SRLI (逻辑右移)
            ALUop = `SRL;
        9'b00010?100: // SLL, SLLI (逻辑左移)
            ALUop = `SLL;
            
        // 逻辑运算 (Logical Operations)
        9'b?10000100: // XORI
            ALUop = `XOR;
        9'b010001100: // XOR (R-type)
            ALUop = `XOR;
        9'b?11000100: // ORI
            ALUop = `OR;
        9'b011001100: // OR (R-type)
            ALUop = `OR;
        9'b?11100100: // ANDI
            ALUop = `AND;
        9'b011101100: // AND (R-type)
            ALUop = `AND;
            
        // Lui 特殊处理 (LUI 实际上是通过逻辑左移实现)
        9'b????01101:
            ALUop = `SLL;
            
        // 算术运算 (Arithmetic Operations)
        9'b100001100: // SUB (R-type 减法，func7[5] 为 1)
            ALUop = `SUB;
            
        default:      // 默认为加法 (包括加载、存储、JAL、Add-type 等)
            ALUop = `ADD;
    endcase
end

// =================================================================
// 符号运算控制 (Sign Control Logic)
// =================================================================

always @(*) begin
    casez ({func3, opecode[6:2]})
        // 分支指令：无符号比较 (BLTU, BGEU)
        8'b11?11000: 
            Unsigned = `UNSIGNED;
        // 立即数/寄存器比较指令：无符号设置 (SLTIU, SLTU)
        // 注意：此处代码中保留了关于 And 操作可能存在的潜在风险提示 (WARNING)
        8'b0110?100: 
            Unsigned = `UNSIGNED;
        // 加载指令：无符号加载 (LBU, LWU, LHU)
        8'b1??00000: 
            Unsigned = `UNSIGNED;
        // LUI 指令：视作无符号处理
        8'b???01101: 
            Unsigned = `UNSIGNED;
        // 默认为有符号运算 (Signed)
        default:  
            Unsigned = `SIGNED;
    endcase
end

endmodule