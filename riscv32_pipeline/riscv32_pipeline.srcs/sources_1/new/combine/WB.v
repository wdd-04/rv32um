`ifdef DEBUG
    `include "param.v"
`else
    `include "../param.v"
`endif

/**
 * @Module: WB
 * @Description: 写回阶段处理模块。
 *               1. 该模块实现了一个 4 选 1 的多路选择器，由 RWSel 信号控制。
 *               2. 它的作用是从多个潜在的数据源中挑选出正确的结果，准备写入 Rd 寄存器。
 *               3. 数据源包括：
 *                  - PC+4: 用于跳转指令 (JAL, JALR) 保存返回地址。
 *                  - COMPExOut: 用于比较指令 (SLT, SLTU) 的结果 (0 或 1)。
 *                  - ALUOut: 用于普通的算术/逻辑运算 (ADD, SUB, AND, OR 等)。
 *                  - DRAMRd: 用于加载指令 (LB, LH, LW 等) 从内存读取的数据。
 */
module WB (
           input   wire [`WIDTH_PC - 1: 0]      pc4,        // 来自 MEM/WB 的 PC+4 地址
           input   wire [`WIDTH_ALUOUT - 1: 0]  COMPExOut,  // 来自 MEM/WB 的比较器结果
           input   wire [`WIDTH_ALUOUT - 1: 0]  ALUOut,     // 来自 MEM/WB 的 ALU 计算结果
           input   wire [`WIDTH_DRAMRd - 1: 0]  DRAMRd,     // 来自 MEM/WB 经过格式化后的访存读数据
           input   wire [`WIDTH_RWSel - 1: 0]   RWSel,      // 写回数据选择控制信号 (来自控制单元)
           output  wire [`WIDTH_RegWd - 1: 0]   RegWd       // 最终决定写入寄存器堆的数据 (Register Write Data)
       );

reg [31: 0] reg_RegWd;

assign RegWd[31: 0] = reg_RegWd[31: 0];

/***************************************************************
                        写回寄存器数据多路选择
****************************************************************/

always @(*) begin
    case (RWSel)
        `REGWD_PC:
            // 选择 PC+4 (跳转链接指令)
            reg_RegWd = pc4;
        `REGWD_COMPOUT:
            // 选择比较器输出 (置位指令)
            reg_RegWd = COMPExOut;
        `REGWD_ALUOUT:
            // 选择 ALU 计算结果 (R 型或 I 型算术指令)
            reg_RegWd = ALUOut;
        default:
            // 默认选择内存读取结果 (Load 指令)
            reg_RegWd = DRAMRd;
    endcase
end

endmodule