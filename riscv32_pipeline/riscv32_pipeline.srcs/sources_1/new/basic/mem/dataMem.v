/**
 * @Module: DataMem
 * @Description: 数据存储器物理例化层。
 *               1. 存储结构：例化底层 data_mem (BRAM)，作为系统的主要数据存储空间。
 *               2. 地址转换：由于 BRAM 通常配置为按字（32-bit）寻址，模块将 CPU 的字节地址 (adr) 
 *                  通过截断低两位 (adr[15:2]) 转换为字索引。
 *               3. 写使能机制：支持四位字节写使能 (we)，对应存储器内的四个字节通道，方便 SB/SH 指令操作。
 *               4. 寻址范围：当前配置为 16 位地址线截断后的 64KB 空间（取决于 addra 的位宽）。
 */
module DataMem (
           input    wire        clk,   // 存储器时钟
           input    wire[3: 0]  we,    // 字节写使能掩码 (Byte Write Enable)
           input    wire[31: 0] adr,   // 来自 CPU 的 32 位原始字节地址
           input    wire[31: 0] din,   // 写入数据
           output   wire[31: 0] rd     // 读出的 32 位对齐数据
       );

/***************************************************************
                        底层存储器 IP 例化
****************************************************************/

data_mem RAM (
             .clka    (clk),           // 端口 A 时钟
             .wea     (we),            // 端口 A 写使能（4 位，对应每个 Byte）
`ifdef DEBUG
             // 在调试和正常模式下，均截断低两位，实现从字节地址到字地址的映射
             .addra(adr[15: 2]),       
`else
             .addra(adr[15: 2]),       
`endif
             .dina    (din),           // 端口 A 写数据
             .douta   (rd)             // 端口 A 读数据输出
         );

endmodule