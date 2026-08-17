/**
 * @Module: InputCtrl_RAM
 * @Description: RAM 输入数据控制模块。
 *               1. 该模块位于系统总线与 DataMem 之间，负责对写入存储器的数据进行预处理。
 *               2. 当前实现为逻辑透传，将总线的 32 位数据直接映射到 RAM 的输入端口。
 *               3. 在复杂的架构中，此模块可扩展用于处理大端/小端序转换或非对齐写入的掩码预处理。
 */
module InputCtrl_RAM (
    input wire [31: 0] din,      // 来自系统总线的原始写数据
    output wire [31: 0] din_RAM  // 发往物理存储器 (DataMem) 的格式化数据
);     

// 执行数据透传：将总线数据位对位连接至存储器输入
assign din_RAM[31: 0] = din[31: 0];

endmodule