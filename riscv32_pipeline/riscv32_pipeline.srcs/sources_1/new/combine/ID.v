/**
 * @Module: ID (Instruction Decode)
 * @Description: 指令译码模块。
 *               负责将 32 位指令拆解为寄存器索引 (rs1, rs2)、功能码 (func3, func7) 
 *               及操作码 (opcode)。同时例化寄存器堆获取原始数据，并根据指令类型生成
 *               符号扩展后的立即数。
 */
module ID (
           input    wire            clk,
           input    wire            rst_n,
           input    wire [31: 0]    inst,       // 输入指令机器码
           input    wire [4: 0]     SextOpe,    // 立即数扩展控制信号 (来自 CTRL)
           input    wire            RegWe,      // 寄存器写使能 (来自 WB 阶段回传)
           input    wire [31: 0]    RegWd,      // 寄存器写回数据 (来自 WB 阶段回传)
           input    wire [4: 0]     RegWr,      // 寄存器写回目标地址 (来自 WB 阶段回传)
           output   wire [31: 0]    rd1,        // 源寄存器 1 读取的数据
           output   wire [31: 0]    rd2,        // 源寄存器 2 读取的数据
           output   wire [31: 0]    immOut      // 扩展后的 32 位立即数
       );

// =================================================================
// 指令字段拆解 (Instruction Field Decomposition)
// =================================================================

wire [4: 0]    rs1;
wire [4: 0]    rs2;
wire [6: 0]    func7;
wire [2: 0]    func3;
wire [6: 0]    opecode;
wire [31: 7]   imm;

// 根据 RISC-V 标准指令格式进行位切片
assign rs1     = inst[19: 15]; // 源寄存器 1 索引
assign rs2     = inst[24: 20]; // 源寄存器 2 索引
assign func7   = inst[31: 25]; // 7 位辅助功能码
assign func3   = inst[14: 12]; // 3 位辅助功能码
assign opecode = inst[6: 0];   // 7 位操作码
assign imm     = inst[31: 7];  // 原始立即数位段 (待扩展)

// =================================================================
// 核心子模块连接 (Sub-module Interconnection)
// =================================================================

// 1. 寄存器堆：提供多路读、单路写的功能
RegFile regFile (
            .clk(clk),
            .rst_n(rst_n),
            .we(RegWe),    // 写使能
            .rs1(rs1),     // 读地址 1
            .rs2(rs2),     // 读地址 2
            .wd(RegWd),    // 写数据
            .wr(RegWr),    // 写地址
            .rd1(rd1),     // 输出数据 1
            .rd2(rd2)      // 输出数据 2
        );

// 2. 立即数生成器：根据指令格式 (I, S, B, U, J) 进行符号位或零扩展
ImmGen immGen (
           .imm(imm),
           .SextOpe(SextOpe),
           .out(immOut)
       );

endmodule