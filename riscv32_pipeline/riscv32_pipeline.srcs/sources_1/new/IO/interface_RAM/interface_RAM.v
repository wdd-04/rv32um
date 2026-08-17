`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: Interface_RAM
 * @Description: 主存（RAM）总线接口模块。
 *               1. 连接方式：直接相连，无额外时钟周期缓冲，实现单周期访存响应。
 *               2. 地址译码：响应来自总线译码器分配的 BG (Bus Grant) 信号。
 *               3. 三态控制：当且仅当发生读操作且被选中时，驱动双向总线 data。
 *               4. 存储交互：将总线的字节写使能 (wstrb) 转换为 RAM 的写掩码 (we)。
 */

module Interface_RAM (
           input    wire            clk,
           input    wire            rst_n,
           input    wire            BG,          // 总线选中信号（由 BUS 模块译码产生）
           input    wire [`IO_BUS_WIDTH_ADDR - 1: 0]    addr,  // 访存地址
           input    wire [`IO_BUS_WIDTH_CTRL - 1: 0]    ctrl,  // 总线控制信号
           input    wire [3: 0]                         wstrb, // 字节写使能掩码
           input    wire [`IO_BUS_WIDTH_DATA - 1: 0]    wdata, // 总线写数据
           inout    wire [`IO_BUS_WIDTH_DATA - 1: 0]    data   // 双向数据总线（与系统总线互联）
       );

wire clk_input;
wire clk_output;

// 输入线定义
wire [`IO_BUS_WIDTH_DATA - 1: 0] data_input; // 总线数据 -> 接口缓冲
wire [`IO_BUS_WIDTH_DATA - 1: 0] input_data; // 接口缓冲 -> RAM 输入
// 输出线定义
wire [`IO_BUS_WIDTH_DATA - 1: 0] data_output; // RAM 输出 -> 接口缓冲
wire [`IO_BUS_WIDTH_DATA - 1: 0] output_data; // 接口缓冲 -> 总线输出数据

/***************************************************************
                        控制逻辑 (Control Logic)
****************************************************************/

// 读写操作调用判定
wire input_call;    // 写内存请求触发
wire output_call;   // 读内存请求触发
wire [3: 0] write_mask;

// 读写控制解析
// 只有当 BG 为高且控制位匹配时才激活对应操作
assign input_call  = ((BG == 1'b1) && (ctrl[`IO_BUS_CTRL_WE] == `IO_CTRL_WRITE)) ? 1'b1 : 1'b0;
assign output_call = ((BG == 1'b1) && (ctrl[`IO_BUS_CTRL_WE] == `IO_CTRL_READ)) ? 1'b1 : 1'b0;

// 写掩码生成：非写状态下强制为 0，防止内存数据被意外覆盖
assign write_mask  = input_call ? wstrb : 4'b0000;

/***************************************************************
                        数据交叉开关 (Data Steering)
****************************************************************/

// data 双向总线输出控制
// 采用三态门逻辑：只有在读请求且 BG 选中时才驱动总线，否则保持高阻态 'hz
assign data = (output_call) ? output_data :  
       `IO_BUS_WIDTH_DATA'hz;                

// data 输入路径
assign data_input = wdata;

/***************************************************************
                        输入输出缓冲/转换
****************************************************************/

assign clk_input = clk; 

// 输入控制：处理总线 wdata 到 RAM din 的转换（逻辑透传）
InputCtrl_RAM inputCtrl (
                  .din(data_input),
                  .din_RAM(input_data)
              );

assign clk_output = clk; 

// 输出控制：处理 RAM rd 到总线数据的转换（逻辑透传）
OutputCtrl_RAM outputCtrl (
                   .rd_RAM(data_output),
                   .DRAMRd(output_data)
               );

// ===============================================================
// 物理存储器例化 (Data RAM Instantiation)
// ===============================================================
DataMem dRAM (
            .clk(clk),
            .we(write_mask),                               // 四位字节写使能
            .adr(addr[`IO_BUS_WIDTH_ADDR - 1 :0]),        // 内存地址
            .din(input_data),                              // 写入数据
            .rd(data_output)                               // 读出原始数据
        );

endmodule