`ifdef DEBUG
    `include "param.v"
`else
    `include "../param.v"
`endif

/**
 * @Module: MEM
 * @Description: 访存阶段处理模块。
 *               1. 数据对齐：根据地址低两位 (addr[1:0]) 将读取的字节或半字移位到低有效位。
 *               2. 符号扩展：处理 LB/LBU, LH/LHU 指令，根据 Unsigned 信号决定进行符号扩展还是零扩展。
 *               3. 写掩码生成：根据访问类型（Byte, Half-word, Word）生成对应的字节写使能信号 (bus_we)。
 *               4. 数据存储格式化：将要写入的数据 (din) 移位到内存总线对应的字节槽位。
 */
module MEM (
    input   wire [`IO_BUS_WIDTH_ADDR - 1: 0]    addr,          // 访存地址
    input   wire                                DRAMWE,        // 内存写使能
    input   wire [1: 0]                         DRAM_EX_TYPE,  // 访存宽度类型
    input   wire                                Unsigned,      // 0: 符号扩展, 1: 零扩展
    input   wire [`IO_BUS_WIDTH_DATA - 1: 0]    bus_rd,        // 从总线读入的原始 32 位数据
    input   wire [`IO_BUS_WIDTH_DATA - 1: 0]    din,           // 准备写入内存的数据 (来自寄存器 rs2)
    input   wire [`IO_BUS_WIDTH_DATA - 1: 0]    bus_rd_WB,     // 写回阶段的参考数据
    output  wire [`IO_BUS_WIDTH_ADDR - 1: 0]    bus_addr,      // 输出至总线的地址
    output  wire [`IO_BUS_WIDTH_DATA - 1: 0]    bus_wd,        // 输出至总线的格式化后的写数据
    output  wire [3: 0]                         bus_we,        // 字节写使能 (Byte Write Enable)
    output  wire [`IO_BUS_WIDTH_CTRL - 1: 0]    bus_ctrl,      // 总线控制信号 (通常为总线使能)
    output  wire [`IO_BUS_WIDTH_DATA - 1: 0]    DRAMRd         // 处理后输出给处理器的读数据
);

wire TYPE_B, TYPE_H, TYPE_HB;

reg [31: 0] rd_reg;
reg [31: 0] DRAMRd_reg;
reg [31: 0] din_reg;
reg [3: 0]  byte_we_reg;

// 总线输出信号赋值
assign bus_addr = addr;
assign bus_we   = DRAMWE ? byte_we_reg : 4'b0000;
assign bus_ctrl = {|bus_we}; // 只要有任何字节写，就拉高总线控制位
assign bus_wd   = din_reg;
assign DRAMRd   = DRAMRd_reg;

// 访问宽度解码
assign TYPE_B    = DRAM_EX_TYPE[`DRAM_EX_B_BIT]; // 字节访问
assign TYPE_H    = DRAM_EX_TYPE[`DRAM_EX_H_BIT]; // 半字访问
assign TYPE_HB   = TYPE_H | TYPE_B;              // 非字访问（需要特殊对齐）

/****************************************************************
                        读取阶段 (Load Logic)
*****************************************************************/

// 根据地址低两位进行移位对齐：将目标数据移位到低字节区域
always @(*) begin
    case(addr[1: 0])
        2'b00:
            rd_reg = bus_rd[31: 0];
        2'b01:
            rd_reg = (TYPE_HB) ? {8'b0, bus_rd[31: 8]} : bus_rd[31: 0];
        2'b10:
            rd_reg = (TYPE_HB) ? {16'b0, bus_rd[31: 16]} : bus_rd[31: 0];
        default: // 2'b11
            rd_reg = (TYPE_B) ? {24'b0, bus_rd[31: 24]} : bus_rd[31: 0];
    endcase
end

// 对读取结果进行扩展 (Sign/Zero Extension)
always @(*) begin
    DRAMRd_reg[7: 0] = rd_reg[7: 0]; // 无论如何最低字节始终保留
    if (TYPE_B) begin
        // 字节扩展：根据 Unsigned 标志位扩展第 7 位或清零
        DRAMRd_reg[31: 8] = (Unsigned) ? {24'b0} : {24{rd_reg[7]}};
    end
    else if (TYPE_H) begin
        // 半字扩展：处理高 16 位，根据第 15 位符号位或清零
        DRAMRd_reg[31: 8] = (Unsigned) ? {16'b0, rd_reg[15: 8]} : {{16{rd_reg[15]}}, rd_reg[15: 8]};
    end
    else begin
        // 字访问：不进行扩展，直接透传
        DRAMRd_reg[31: 8] = rd_reg[31: 8];
    end
end

/****************************************************************
                        写入阶段 (Store Logic)
*****************************************************************/

// 根据地址低两位对写入结果进行移位并生成字节掩码
always @(*) begin
    din_reg = 32'b0;
    byte_we_reg = 4'b0000;

    if (TYPE_B) begin
        // 字节写指令 (SB)
        case (addr[1:0])
            2'b00: begin din_reg = {24'b0, din[7:0]};       byte_we_reg = 4'b0001; end
            2'b01: begin din_reg = {16'b0, din[7:0], 8'b0}; byte_we_reg = 4'b0010; end
            2'b10: begin din_reg = {8'b0, din[7:0], 16'b0}; byte_we_reg = 4'b0100; end
            default: begin din_reg = {din[7:0], 24'b0};     byte_we_reg = 4'b1000; end
        endcase
    end
    else if (TYPE_H) begin
        // 半字写指令 (SH)
        case (addr[1])
            1'b0: begin din_reg = {16'b0, din[15:0]}; byte_we_reg = 4'b0011; end
            1'b1: begin din_reg = {din[15:0], 16'b0}; byte_we_reg = 4'b1100; end
        endcase
    end
    else begin
        // 字写指令 (SW)
        din_reg = din;
        byte_we_reg = 4'b1111;
    end
end

endmodule