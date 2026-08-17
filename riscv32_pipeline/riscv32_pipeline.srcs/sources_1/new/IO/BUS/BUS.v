`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: BUS
 * @Description: 系统总线逻辑与外设地址译码器。
 *               1. 地址空间管理：将 32 位地址空间划分为 RAM 区和外设寄存器映射区（MMIO）。
 *               2. 动态模块生成：通过参数 (ENABLE_*) 控制硬件资源的实例化，节省 FPGA 逻辑面积。
 *               3. 双向数据总线管理：通过 inout 类型的 data 信号实现多个接口对 CPU 读请求的响应。
 *               4. 设备时钟管理：为数码管和 LED 扫描逻辑提供分频后的 deviceClk。
 */
module BUS #(
           parameter ENABLE_NUMLED     = 1'b0,         // 是否启用数码管
           parameter ENABLE_LED_SWITCH = 1'b0,         // 是否启用 LED 和拨码开关
           parameter ENABLE_UART       = 1'b0,         // 是否启用 UART 串口
           parameter ENABLE_TIMER      = 1'b0,         // 是否启用定时器
           parameter integer CPU_CLK_HZ = 75_000_000,   // 系统时钟频率
           parameter integer UART_BAUD  = 115200       // UART 波特率设置
       ) (
           input        wire clk,
           input        wire rst_n,
           input        wire BC,                       // 总线周期控制（Bus Cycle）
           input        wire [`IO_BUS_WIDTH_ADDR - 1: 0] addr,  // CPU 访存地址
           input        wire [`IO_BUS_WIDTH_CTRL - 1: 0] ctrl,  // 总线控制（读写信号）
           input        wire [3: 0] wstrb,             // 写掩码（Byte Write Strobe）
           input        wire [`IO_BUS_WIDTH_DATA - 1: 0] wdata, // CPU 写数据
           inout        wire [`IO_BUS_WIDTH_DATA - 1: 0] data,  // 双向数据总线

           // 外部硬件引脚接口
           input    wire [`DEVICE_NUM_SWITCH - 1: 0]       switch,
           output   wire [`DEVICE_NUM_LED - 1: 0]           led,
           output   wire [`DEVICE_NUM_NUMLED_EN - 1: 0]     led_en,
           output   wire                led_ca, led_cb, led_cc, led_cd, led_ce, led_cf, led_cg, led_dp,
           output   wire                uart_tx_pin
       );

reg [`IO_INTERFACE_NUM - 1: 0] BG; // 总线选择信号 (Bus Grant/Select)
wire deviceClk;

// ===============================================================
// 设备时钟生成逻辑 (Device Clock Generation)
// ===============================================================
generate
    if (ENABLE_NUMLED || ENABLE_LED_SWITCH) begin : gen_device_clk
        DeviceCLK #(.EXTEND(160000)) deviceCLK (
            .clk(clk),
            .rst_n(rst_n),
            .clk_out(deviceClk) // 用于数码管扫描等低频 I/O 操作
        );
    end
    else begin : gen_no_device_clk
        assign deviceClk = 1'b0;
    end
endgenerate

// ===============================================================
// 地址译码逻辑 (Address Decoding Logic)
// ===============================================================

always @(*) begin
    BG = {`IO_INTERFACE_NUM{1'b0}};

    // 0x0000_0000 - 0x0000_FFFF: 内部 RAM 空间
    if (addr < 32'h00010000) begin
        BG[0] = 1'b1;
    end
    // 0xFFFF_F000 - 0xFFFF_FFFF: MMIO 外设寄存器空间
    else if (addr[31:12] == 20'hFFFFF) begin
        case (addr[7:4])
            4'h1: BG[1] = ENABLE_NUMLED;     // 数码管地址映射
            4'h6: BG[2] = ENABLE_LED_SWITCH; // LED 地址映射
            4'h7: BG[2] = ENABLE_LED_SWITCH; // 开关地址映射
            4'h8: BG[3] = ENABLE_UART;       // UART 地址映射
            4'h9: BG[4] = ENABLE_TIMER;      // 定时器地址映射
            default: BG = {`IO_INTERFACE_NUM{1'b0}};
        endcase
    end
end

// ===============================================================
// 接口模块实例化 (Interface Instantiation)
// ===============================================================

// 内部数据存储器接口 (RAM Interface)
Interface_RAM interface_RAM (
    .clk(clk),
    .rst_n(rst_n),
    .BG(BG[0]),
    .addr(addr),
    .ctrl(ctrl),
    .wstrb(wstrb),
    .wdata(wdata),
    .data(data)
);

generate
    // 七段数码管接口
    if (ENABLE_NUMLED) begin : gen_numled
        Interface_NUMLED interface_numled (
            .clk(clk),
            .deviceClk(deviceClk),
            .rst_n(rst_n),
            .BG(BG[1]),
            .addr(addr),
            .ctrl(ctrl),
            .wdata(wdata),
            .data(data),
            .led_en(led_en),
            .led_ca(led_ca), .led_cb(led_cb), .led_cc(led_cc), .led_cd(led_cd),
            .led_ce(led_ce), .led_cf(led_cf), .led_cg(led_cg), .led_dp(led_dp)
        );
    end
    else begin : gen_no_numled
        assign led_en = {`DEVICE_NUM_NUMLED_EN{1'b1}}; // 熄灭所有数码管
        assign {led_ca, led_cb, led_cc, led_cd, led_ce, led_cf, led_cg, led_dp} = 8'hFF;
    end

    // LED 与拨码开关接口
    if (ENABLE_LED_SWITCH) begin : gen_led_switch
        Interface_LED_SWITCH interface_led_switch (
            .clk(clk),
            .deviceClk(deviceClk),
            .rst_n(rst_n),
            .BG(BG[2]),
            .addr(addr),
            .ctrl(ctrl),
            .wdata(wdata),
            .data(data),
            .led(led),
            .switch(switch)
        );
    end
    else begin : gen_no_led_switch
        assign led = {`DEVICE_NUM_LED{1'b0}};
    end

    // UART 串口接口
    if (ENABLE_UART) begin : gen_uart
        Interface_UART #(
            .CLK_FREQ(CPU_CLK_HZ),
            .BAUD_RATE(UART_BAUD)
        ) interface_uart (
            .clk(clk),
            .rst_n(rst_n),
            .BG(BG[3]),
            .addr(addr),
            .ctrl(ctrl),
            .wdata(wdata),
            .data(data),
            .tx_pin(uart_tx_pin)
        );
    end
    else begin : gen_no_uart
        assign uart_tx_pin = 1'b1; // UART 空闲状态为高电平
    end

    // 定时器接口
    if (ENABLE_TIMER) begin : gen_timer
        Interface_Timer interface_timer (
            .clk(clk),
            .rst_n(rst_n),
            .BG(BG[4]),
            .addr(addr),
            .ctrl(ctrl),
            .data(data)
        );
    end
endgenerate

endmodule