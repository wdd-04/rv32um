`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: InstDivider
 * @Description: 指令拆分/转换模块。
 *               该模块用于将特定的存储指令（如 SB, SH）转换为一种复合操作序列。
 *               目前的实现逻辑是将输入指令转换成一条目标寄存器为 x0 的 LW 指令：
 *               [lw x0, offset(base)]，这种操作通常用于在执行实际写操作前
 *               触发缓存命中或处理特定的总线事务。
 */
module InstDivider (
    input   wire [`WIDTH_INST - 1 : 0] inst_in,  // 输入原始指令
    output  wire [`WIDTH_INST - 1 : 0] inst_out // 输出拆分/转换后的指令
);

// =================================================================
// 指令拆分与重组逻辑 (Instruction Reassembly Logic)
// =================================================================
// 原始设计意图：目前只有 SB 和 SH 指令需要处理，将其转换为 LW 作为前置指令。
/*
    转换逻辑示例：
    sb | sh -> [lw x0, same_addr] + (后续序列)
*/

assign inst_out[`WIDTH_INST - 1 : 0] = {
    // 重新映射指令字段以拼凑成一条新的 LW 指令:
    inst_in[31: 27], // 提取原始指令的高位立即数部分 (Immediate[11:7])
    2'b00,           // 立即数低位补齐
    inst_in[11: 7],  // 提取原始指令的 Immediate[4:0] 部分
    inst_in[19: 15], // 保持原始指令的基址寄存器 rs1 不变
    inst_in[14],     // 提取部分 funct3 编码
    2'b10,           // 固定编码位，用于匹配 LW 的 funct3 (010)
    5'b00000,        // 目标寄存器 rd 强制设为 x0 (硬编码为 0)，表示不保留加载结果
    7'b0000011       // RISC-V Load 类型指令的标准 Opcode (0000011)
};

endmodule