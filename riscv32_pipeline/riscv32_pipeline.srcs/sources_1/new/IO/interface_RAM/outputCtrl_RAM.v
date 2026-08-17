/**
 * @Module: OutputCtrl_RAM
 * @Description: RAM 输出数据控制模块。
 *               1. 该模块位于 DataMem 的读输出端口与系统总线接口之间。
 *               2. 职责是将存储器阵列读出的原始 32 位数据透传给总线接口模块。
 *               3. 作为一个抽象层，它预留了处理输出数据对齐、字节序调整或输出缓冲（如果需要）的空间，
 *                  确保总线读取到的数据格式与 CPU 预期一致。
 */
module OutputCtrl_RAM (
    input   wire [31: 0]    rd_RAM, // 从物理存储器 (DataMem) 读出的原始 32 位数据
    output  wire [31: 0]    DRAMRd  // 发往总线接口，最终返回给 CPU 的读数据
);

// 执行数据透传：将存储器输出数据直接映射到接口输出
assign DRAMRd[31: 0] = rd_RAM[31: 0];

endmodule