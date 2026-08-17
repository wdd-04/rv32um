`ifdef DEBUG
    `include "param.v"
`else
    `include "../param.v"
`endif

/**
 * @Module: MEM_WB
 * @Description: 访存/写回阶段流水线寄存器。
 *               1. 作为流水线的最后一级隔离，将 MEM 阶段产生的各类结果（ALU、DRAM、PC+4 等）同步至 WB 阶段。
 *               2. 核心作用是确保写回寄存器堆（RF）的数据和地址在时钟边沿严格同步。
 *               3. 支持 hold 信号：当流水线需要整体停顿时，锁存当前数据不被更新。
 */
module MEM_WB (
           input wire clk,
           input wire rst_n,
           input wire hold,                                 // 流水线停顿控制信号
           input wire [`WIDTH_PC - 1: 0]           pc4,     // PC+4，用于 JAL/JALR 指令写回返回地址
           input wire [`WIDTH_RWSel - 1: 0]        RWSel,   // 写回数据源选择信号
           input wire [`WIDTH_REGMARK - 1: 0]      RegWr,   // 目标寄存器地址 (Rd)
           input wire [`WIDTH_RegWE - 1: 0]        RegWe,   // 寄存器堆写使能信号
           input wire [`WIDTH_COMPOUT - 1: 0]      COMPOut, // 比较器输出结果（通常用于 SLT/SLTU 指令写回）
           input wire [`WIDTH_ALUOUT - 1: 0]       ALUOut,  // ALU 计算结果
           input wire [`WIDTH_OPENUM - 1: 0]       DRAMRd,  // 从内存中读取并处理对齐后的数据

           output reg [`WIDTH_PC - 1: 0]           pc4_o,
           output reg [`WIDTH_RWSel - 1: 0]        RWSel_o,
           output reg [`WIDTH_REGMARK - 1: 0]      RegWr_o,
           output reg [`WIDTH_RegWE - 1: 0]        RegWe_o,
           output reg [`WIDTH_COMPOUT - 1: 0]      COMPOut_o,
           output reg [`WIDTH_ALUOUT - 1: 0]       ALUOut_o,
           output reg [`WIDTH_OPENUM - 1: 0]       DRAMRd_o
       );


/****************************************************************
                        输出寄存器逻辑
*****************************************************************/
always @(posedge clk or negedge rst_n) begin

    if (~rst_n) begin
        // 异步复位：清空所有锁存的信号
        pc4_o      [`WIDTH_PC - 1: 0]              <= 0;
        DRAMRd_o   [`WIDTH_OPENUM - 1: 0]          <= 0;
        RWSel_o    [`WIDTH_RWSel - 1: 0]           <= 0;
        RegWr_o    [`WIDTH_REGMARK - 1: 0]         <= 0;
        RegWe_o    [`WIDTH_RegWE - 1: 0]           <= 0;
        COMPOut_o  [`WIDTH_COMPOUT - 1: 0]         <= 0;
        ALUOut_o   [`WIDTH_ALUOUT - 1: 0]          <= 0;
    end
    else if (hold) begin
        // 停顿状态：保持寄存器当前值不变
        pc4_o      [`WIDTH_PC - 1: 0]              <= pc4_o;
        DRAMRd_o   [`WIDTH_OPENUM - 1: 0]          <= DRAMRd_o;
        RWSel_o    [`WIDTH_RWSel - 1: 0]           <= RWSel_o;
        RegWr_o    [`WIDTH_REGMARK - 1: 0]         <= RegWr_o;
        RegWe_o    [`WIDTH_RegWE - 1: 0]           <= RegWe_o;
        COMPOut_o  [`WIDTH_COMPOUT - 1: 0]         <= COMPOut_o;
        ALUOut_o   [`WIDTH_ALUOUT - 1: 0]          <= ALUOut_o;
    end
    else begin
        // 正常更新：在时钟上升沿捕获 MEM 阶段数据并传递至 WB 阶段
        pc4_o      [`WIDTH_PC - 1: 0]              <= pc4;
        DRAMRd_o   [`WIDTH_OPENUM - 1: 0]          <= DRAMRd;
        RWSel_o    [`WIDTH_RWSel - 1: 0]           <= RWSel;
        RegWr_o    [`WIDTH_REGMARK - 1: 0]         <= RegWr;
        RegWe_o    [`WIDTH_RegWE - 1: 0]           <= RegWe;
        COMPOut_o  [`WIDTH_COMPOUT - 1: 0]         <= COMPOut;
        ALUOut_o   [`WIDTH_ALUOUT - 1: 0]          <= ALUOut;
    end

end

endmodule