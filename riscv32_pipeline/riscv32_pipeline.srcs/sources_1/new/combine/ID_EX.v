`ifdef DEBUG
    `include "param.v"
`else
    `include "../param.v"
`endif

/**
 * @Module: ID_EX
 * @Description: ID 阶段与 EX 阶段之间的流水线寄存器。
 *               主要功能：
 *               1. 同步传递译码后的所有控制信号、操作数、分支预测信息。
 *               2. 处理流水线阻塞（Stall）：通过 hold_EX 保持当前 EX 状态不变。
 *               3. 处理流水线冲刷（Flush/Bubble）：通过 flush 或 stop_ID 清空当前寄存器，插入空泡。
 *               4. 协作指令拆分（Instruction Division）：当一条复杂指令需要分步执行时，从 _div 端口获取微操作控制信号。
 */
module ID_EX (
           input wire                          clk,
           input wire                          rst_n,
           input wire                          stop_ID,      // ID 阶段停止信号，通常导致 ID/EX 清空
           input wire                          flush,        // 流水线冲刷信号（如分支预测错误时）
           input wire                          inst_div,     // 指令拆分有效信号

           // --- 来自 ID 阶段的标准信号 ---
           input wire [`WIDTH_PC - 1: 0]            pc,
           input wire                               pred_taken,  // 分支预测结果
           input wire [`WIDTH_PC - 1: 0]            pred_target, // 分支预测目标地址
           input wire                               ASel,        // 操作数 A 选择信号
           input wire                               BSel,        // 操作数 B 选择信号
           input wire [`WIDTH_OPENUM - 1: 0]        Anum,        // 寄存器堆读取出的 Rs1 数据
           input wire [`WIDTH_OPENUM - 1: 0]        Bnum,        // 寄存器堆读取出的 Rs2 数据
           input wire [`WIDTH_OPENUM - 1: 0]        Anum2,       // 备用操作数
           input wire [`WIDTH_OPENUM - 1: 0]        Bnum2,       
           input wire [`WIDTH_ALUOp - 1: 0]         ALUop,       // ALU 运算类型控制
           input wire [`WIDTH_Unsigned - 1: 0]      Unsigned,    // 是否为无符号运算
           input wire [`WIDTH_DRAM_EX_TYPE - 1: 0]  DRAM_EX_TYPE,// 访存类型
           input wire [`WIDTH_DRAMWE - 1: 0]        DRAMWE,      // 内存写使能
           input wire [`WIDTH_RWSel - 1: 0]         RWSel,       // 写回数据选择
           input wire [`WIDTH_REGMARK - 1: 0]       RegWr,       // 写回目标寄存器地址
           input wire [`WIDTH_REGMARK - 1: 0]       Rs1,         // 源寄存器 1 地址（用于旁路检测）
           input wire [`WIDTH_REGMARK - 1: 0]       Rs2,         // 源寄存器 2 地址（用于旁路检测）
           input wire [`WIDTH_RegWE - 1: 0]         RegWe,       // 寄存器堆写使能
           input wire [`WIDTH_PCCTRL - 1 : 0]       PCCTRL,      // PC 更新控制
           input wire                               M,           // M 扩展指令标志（乘除法）
           input wire [2: 0]                        M_FUNC3,     // M 扩展功能码

           // --- 指令拆分使用的控制信号 (微操作相关) ---
           input wire                               ASel_div,
           input wire                               BSel_div,
           input wire [`WIDTH_ALUOp - 1: 0]         ALUop_div,
           input wire [`WIDTH_Unsigned - 1: 0]      Unsigned_div,
           input wire [`WIDTH_DRAM_EX_TYPE - 1: 0]  DRAM_EX_TYPE_div,
           input wire [`WIDTH_DRAMWE - 1: 0]        DRAMWE_div,
           input wire [`WIDTH_RWSel - 1: 0]         RWSel_div,
           input wire [`WIDTH_REGMARK - 1: 0]       RegWr_div,
           input wire [`WIDTH_REGMARK - 1: 0]       Rs1_div,
           input wire [`WIDTH_REGMARK - 1: 0]       Rs2_div,
           input wire [`WIDTH_RegWE - 1: 0]         RegWe_div,
           input wire [`WIDTH_PCCTRL - 1 : 0]       PCCTRL_div,
           input wire                               M_div,
           input wire [2: 0]                        M_FUNC3_div,
           input wire                               hold_EX,     // EX 阶段保持信号（停顿流水线后端）

           // --- 输出至 EX 阶段的信号 ---
           output reg [`WIDTH_PC - 1: 0]            pc_o,
           output reg                               pred_taken_o,
           output reg [`WIDTH_PC - 1: 0]            pred_target_o,
           output reg                               ASel_o,
           output reg                               BSel_o,
           output reg [`WIDTH_OPENUM - 1: 0]        Anum_o,
           output reg [`WIDTH_OPENUM - 1: 0]        Bnum_o,
           output reg [`WIDTH_OPENUM - 1: 0]        Anum2_o,
           output reg [`WIDTH_OPENUM - 1: 0]        Bnum2_o,
           output reg [`WIDTH_ALUOp - 1: 0]         ALUop_o,
           output reg [`WIDTH_Unsigned - 1: 0]      Unsigned_o,
           output reg [`WIDTH_DRAM_EX_TYPE - 1: 0]  DRAM_EX_TYPE_o,
           output reg [`WIDTH_DRAMWE - 1: 0]        DRAMWE_o,
           output reg [`WIDTH_RWSel - 1: 0]         RWSel_o,
           output reg [`WIDTH_REGMARK - 1: 0]       RegWr_o,
           output reg [`WIDTH_REGMARK - 1: 0]       Rs1_o,
           output reg [`WIDTH_REGMARK - 1: 0]       Rs2_o,
           output reg [`WIDTH_RegWE - 1: 0]         RegWe_o,
           output reg [`WIDTH_PCCTRL - 1 : 0]       PCCTRL_o,
           output reg                               M_o,
           output reg [2: 0]                        M_FUNC3_o
       );

// =================================================================
// 状态转移逻辑 (State Transition Logic)
// =================================================================
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        // 复位：所有控制信号和数据清零
        pc_o            <= 0;
        pred_taken_o    <= 0;
        pred_target_o   <= 0;
        ASel_o          <= 0;
        BSel_o          <= 0;
        Anum_o          <= 0;
        Bnum_o          <= 0;
        Anum2_o         <= 0;
        Bnum2_o         <= 0;
        ALUop_o         <= 0;
        Unsigned_o      <= 0;
        DRAM_EX_TYPE_o  <= 0;
        DRAMWE_o        <= 0;
        RWSel_o         <= 0;
        RegWr_o         <= 0;
        Rs1_o           <= 0;
        Rs2_o           <= 0;
        RegWe_o         <= 0;
        PCCTRL_o        <= 0;
        M_o             <= 0;
        M_FUNC3_o       <= 0;
    end
    else if (hold_EX) begin
        // 保持：流水线后端停顿时（如访存未命中或长周期指令），维持输出不变
        pc_o            <= pc_o;
        pred_taken_o    <= pred_taken_o;
        pred_target_o   <= pred_target_o;
        ASel_o          <= ASel_o;
        BSel_o          <= BSel_o;
        Anum_o          <= Anum_o;
        Bnum_o          <= Bnum_o;
        Anum2_o         <= Anum2_o;
        Bnum2_o         <= Bnum2_o;
        ALUop_o         <= ALUop_o;
        Unsigned_o      <= Unsigned_o;
        DRAM_EX_TYPE_o  <= DRAM_EX_TYPE_o;
        DRAMWE_o        <= DRAMWE_o;
        RWSel_o         <= RWSel_o;
        RegWr_o         <= RegWr_o;
        Rs1_o           <= Rs1_o;
        Rs2_o           <= Rs2_o;
        RegWe_o         <= RegWe_o;
        PCCTRL_o        <= PCCTRL_o;
        M_o             <= M_o;
        M_FUNC3_o       <= M_FUNC3_o;
    end
    else if (flush || stop_ID) begin
        // 清空：当发生冒险或分支预测错误时，将 ID/EX 寄存器清零，相当于插入 NOP
        pc_o            <= 0;
        pred_taken_o    <= 0;
        pred_target_o   <= 0;
        ASel_o          <= 0;
        BSel_o          <= 0;
        Anum_o          <= 0;
        Bnum_o          <= 0;
        Anum2_o         <= 0;
        Bnum2_o         <= 0;
        ALUop_o         <= 0;
        Unsigned_o      <= 0;
        DRAM_EX_TYPE_o  <= 0;
        DRAMWE_o        <= 0;
        RWSel_o         <= 0;
        RegWr_o         <= 0;
        Rs1_o           <= 0;
        Rs2_o           <= 0;
        RegWe_o         <= 0;
        PCCTRL_o        <= 0;
        M_o             <= 0;
        M_FUNC3_o       <= 0;
    end
    else if (inst_div) begin
        // 拆分逻辑：使用特殊的微操作信号源（_div）更新寄存器
        pc_o          <= pc;
        pred_taken_o  <= pred_taken;
        pred_target_o <= pred_target;
        ASel_o        <= ASel_div;
        BSel_o        <= BSel_div;
        Anum_o        <= Anum;
        Bnum_o        <= Bnum;
        Anum2_o       <= Anum2;
        Bnum2_o       <= Bnum2;
        ALUop_o       <= ALUop_div;
        Unsigned_o    <= Unsigned_div;
        PCCTRL_o      <= PCCTRL_div;
        RWSel_o       <= RWSel_div;
        DRAM_EX_TYPE_o<= DRAM_EX_TYPE_div;
        DRAMWE_o      <= DRAMWE_div;
        RegWr_o       <= RegWr_div;
        Rs1_o         <= Rs1_div;
        Rs2_o         <= Rs2_div;
        RegWe_o       <= RegWe_div;
        M_o           <= M_div;
        M_FUNC3_o     <= M_FUNC3_div;
    end
    else begin
        // 正常工作：将 ID 阶段的信号同步传递到输出
        pc_o          <= pc;
        pred_taken_o  <= pred_taken;
        pred_target_o <= pred_target;
        ASel_o        <= ASel;
        BSel_o        <= BSel;
        Anum_o        <= Anum;
        Bnum_o        <= Bnum;
        Anum2_o       <= Anum2;
        Bnum2_o       <= Bnum2;
        ALUop_o       <= ALUop;
        Unsigned_o    <= Unsigned;
        PCCTRL_o      <= PCCTRL;
        RWSel_o       <= RWSel;
        DRAM_EX_TYPE_o<= DRAM_EX_TYPE;
        DRAMWE_o      <= DRAMWE;
        RegWr_o       <= RegWr;
        Rs1_o         <= Rs1;
        Rs2_o         <= Rs2;
        RegWe_o       <= RegWe;
        M_o           <= M;
        M_FUNC3_o     <= M_FUNC3;
    end
end

endmodule