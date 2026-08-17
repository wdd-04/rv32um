`ifdef DEBUG
    `include "param.v"
`else
    `include "../param.v"
`endif

/**
 * @Module: EX_MEM
 * @Description: 执行/访存阶段流水线寄存器。
 *               1. 锁存并传递 EX 阶段的所有计算结果（ALUOut, COMPOut）和控制信号。
 *               2. 支持 hold_MEM 信号：用于流水线因后端（如 Cache Miss）阻塞时保持当前数据。
 *               3. 支持 M_stall 和 bubble_MEM 信号：用于在分支预测错误或执行高延迟 M 指令时清空（Flush）当前流水级。
 *               4. 包含 ALUOut 的副本 ALUOut_mem_o，用于特定的访存地址时序优化。
 */
module EX_MEM (
           input wire clk,
           input wire rst_n,
           input wire M_stall,          // M 扩展单元（乘除法器）忙碌导致的停顿
           input wire hold_MEM,         // 访存阶段保持信号（通常来自流水线控制器）
           input wire bubble_MEM,       // 访存阶段气泡信号（清空信号）
           input wire [`WIDTH_PC - 1: 0]           pc,              // 当前指令 PC
           input wire [`WIDTH_DRAM_EX_TYPE - 1: 0] DRAM_EX_TYPE,    // 访存扩展类型 (LB, LH, LW 等)
           input wire [`WIDTH_DRAMWE - 1: 0]       DRAMWE,          // 内存写使能
           input wire [`WIDTH_RWSel - 1: 0]        RWSel,           // 写回寄存器数据源选择
           input wire [`WIDTH_REGMARK - 1: 0]      RegWr,           // 写回寄存器地址 (Rd)
           input wire [`WIDTH_REGMARK - 1: 0]      Rs2,             // 源寄存器 2 地址 (用于访存写数据旁路)
           input wire [`WIDTH_RegWE - 1: 0]        RegWe,           // 寄存器堆写使能
           input wire [`WIDTH_COMPOUT - 1: 0]      COMPOut,         // 比较器输出结果
           input wire [`WIDTH_ALUOUT - 1: 0]       ALUOut,          // ALU 计算结果
           input wire [`WIDTH_DRAMIN - 1: 0]       DRAMIn,          // 准备写入内存的数据
           input wire [`WIDTH_Unsigned - 1: 0]     Unsigned,        // 无符号/符号位标志

           output reg [`WIDTH_PC - 1: 0]           pc_o,
           output reg [`WIDTH_DRAM_EX_TYPE - 1: 0] DRAM_EX_TYPE_o,
           output reg [`WIDTH_DRAMWE - 1: 0]       DRAMWE_o,
           output reg [`WIDTH_RWSel - 1: 0]        RWSel_o,
           output reg [`WIDTH_REGMARK - 1: 0]      RegWr_o,
           output reg [`WIDTH_REGMARK - 1: 0]      Rs2_o,
           output reg [`WIDTH_RegWE - 1: 0]        RegWe_o,
           output reg [`WIDTH_COMPOUT - 1: 0]      COMPOut_o,
           // 使用 (*EQUIVALENT_REGISTER_REMOVAL="NO"*) 强制保留重复寄存器，防止综合时被合并，有利于布线优化
           (*EQUIVALENT_REGISTER_REMOVAL="NO"*) output reg [`WIDTH_ALUOUT - 1: 0] ALUOut_o,
           (*EQUIVALENT_REGISTER_REMOVAL="NO"*) output reg [`WIDTH_ALUOUT - 1: 0] ALUOut_mem_o,
           output reg [`WIDTH_DRAMIN - 1: 0]       DRAMIn_o,
           output reg [`WIDTH_Unsigned - 1: 0]     Unsigned_o
       );

// ===============================================================
// 流水线寄存器更新逻辑 (Pipeline Register Update Logic)
// ===============================================================
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        // 异步复位：清空所有寄存器
        pc_o           <= 0;
        DRAM_EX_TYPE_o <= 0;
        DRAMWE_o       <= 0;
        RWSel_o        <= 0;
        RegWr_o        <= 0;
        Rs2_o          <= 0;
        RegWe_o        <= 0;
        COMPOut_o      <= 0;
        ALUOut_o       <= 0;
        ALUOut_mem_o   <= 0;
        DRAMIn_o       <= 0;
        Unsigned_o     <= 0;
    end
    else if (hold_MEM) begin
        // 保持状态：通常用于后端阻塞时锁存当前值
        pc_o           <= pc_o;
        DRAM_EX_TYPE_o <= DRAM_EX_TYPE_o;
        DRAMWE_o       <= DRAMWE_o;
        RWSel_o        <= RWSel_o;
        RegWr_o        <= RegWr_o;
        Rs2_o          <= Rs2_o;
        RegWe_o        <= RegWe_o;
        COMPOut_o      <= COMPOut_o;
        ALUOut_o       <= ALUOut_o;
        ALUOut_mem_o   <= ALUOut_mem_o;
        DRAMIn_o       <= DRAMIn_o;
        Unsigned_o     <= Unsigned_o;
    end
    else if (M_stall || bubble_MEM) begin
        // 插入气泡/清除：当 M 扩展单元忙碌或发生分支预测错误时，将控制信号置 0（相当于 NOP）
        pc_o           <= 0;
        DRAM_EX_TYPE_o <= 0;
        DRAMWE_o       <= 0;
        RWSel_o        <= 0;
        RegWr_o        <= 0;
        Rs2_o          <= 0;
        RegWe_o        <= 0;
        COMPOut_o      <= 0;
        ALUOut_o       <= 0;
        ALUOut_mem_o   <= 0;
        DRAMIn_o       <= 0;
        Unsigned_o     <= 0;
    end
    else begin
        // 正常更新：在时钟上升沿将 EX 阶段数据存入 MEM 阶段
        pc_o           <= pc;
        DRAM_EX_TYPE_o <= DRAM_EX_TYPE;
        DRAMWE_o       <= DRAMWE;
        RWSel_o        <= RWSel;
        RegWr_o        <= RegWr;
        Rs2_o          <= Rs2;
        RegWe_o        <= RegWe;
        COMPOut_o      <= COMPOut;
        ALUOut_o       <= ALUOut;
        ALUOut_mem_o   <= ALUOut; // 同步锁存 ALU 输出作为访存地址
        DRAMIn_o       <= DRAMIn;
        Unsigned_o     <= Unsigned;
    end
end

endmodule