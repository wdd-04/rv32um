`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: COMP
 * @Description: 比较器模块。
 *               1. 提供两个 32 位操作数的相等（EQ）、小于（LT/LE）和大于（GE）判定。
 *               2. 核心算法：通过翻转有符号数的最高位（符号位）将其转换为偏移码。
 *                  在偏移码格式下，原本最小的负数变为 0，最大的正数变为全 1，
 *                  从而允许使用无符号比较器来得出有符号数的比较结果。
 */
module COMP (
           input    wire [31: 0]    A,          // 比较操作数 A
           input    wire [31: 0]    B,          // 比较操作数 B
           input    wire            Unsigned,   // 无符号比较使能信号
           output   wire [1: 0]     out         // 比较结果：EQ, LE(小于), GE(大于)
       );

wire [31: 0] Ain;
wire [31: 0] Bin;
wire equal;
wire less;

reg [1: 0] out_reg;

// ===============================================================
// 数值转换逻辑 (Number Format Conversion)
// ===============================================================

// 低 30 位保持不变
assign Ain[30: 0] = A[30: 0];
assign Bin[30: 0] = B[30: 0];

/**
 * 符号位处理：
 * 如果是无符号比较：保持原样。
 * 如果是有符号比较：翻转最高位（MSB）。
 * 
 * 原理：对于 32 位补码，0x8000_0000 是最小值，0x7FFF_FFFF 是最大值。
 * 翻转首位后，0x8000_0000 变为 0x0000_0000（变最小），
 * 0x7FFF_FFFF 变为 0xFFFF_FFFF（变最大），直接符合无符号大小排序。
 */
assign Ain[31]    = (Unsigned == `UNSIGNED) ? A[31] : ~A[31];
assign Bin[31]    = (Unsigned == `UNSIGNED) ? B[31] : ~B[31];

// ===============================================================
// 比较运算 (Comparison Operation)
// ===============================================================

// 执行无符号比较
assign equal = ($unsigned(Ain) == $unsigned(Bin)) ? 1'b1 : 1'b0;
assign less  = ($unsigned(Ain) < $unsigned(Bin)) ? 1'b1 : 1'b0;


// ===============================================================
// 输出编码选择 (Output Selection)
// ===============================================================

assign out = out_reg;

always @(*) begin
    if (equal) begin
        // 相等状态
        out_reg = `COMP_EQ;
    end
    else if (less) begin
        // 小于状态（Less Than / Lower）
        out_reg = `COMP_LE;
    end
    else begin
        // 大于或等于状态（Greater / Equal）
        // 注：由于先判定了 equal，此分支实际上表示 A > B
        out_reg = `COMP_GE;
    end
end

endmodule