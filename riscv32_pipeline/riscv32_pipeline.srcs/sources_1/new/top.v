`include "param.v"

/**
 * @Module: top
 * @Description: 集成电路创新创业大赛参赛作品 - 顶层模块
 *               负责时钟管理(MMCM/PLL)、处理器核(mini_rv)与系统总线(BUS)的互联。
 * @Platform: ZYNQ-7020 (Z7-P / ALINX / OPENEDV)
 */
module top(
    input  wire       clk,        // 外部输入时钟 (板载 50 MHz)
    input  wire       rst,        // 外部复位信号 (低电平有效)
    output wire       tx_out      // 串口发送端 (UART TX)
);

    // =================================================================
    // 参数定义
    // =================================================================
    localparam integer CPU_CLK_HZ = 75_000_000; // 处理器工作频率 (通过 PLL 升频)
    localparam integer UART_BAUD  = 115200;     // 串口通信波特率

    // =================================================================
    // 时钟管理单元 (Clocking Wizard)
    // =================================================================
    wire clk_out; // 升频后的 CPU 全局时钟
    wire locked;  // 时钟锁定标志信号

    cpuclk cpuClk (
        .clk_in1(clk),       // 输入板载 50MHz
        .locked(locked),     // MMCM 锁定后拉高
        .clk_out1(clk_out)   // 输出 75MHz
    );

    // 系统内部同步复位信号：需满足时钟锁定且外部复位释放
    wire rst_n = locked && rst;

    // =================================================================
    // 处理器与总线间的互联信号线 (SoC Bus Interconnect)
    // =================================================================
    wire [`IO_BUS_WIDTH_DATA - 1: 0] mem_wd;    // 写数据总线
    wire [`IO_BUS_WIDTH_ADDR - 1: 0] mem_addr;  // 地址总线
    wire [3:0]                       mem_wstrb; // 字节掩码 (Byte Write Strobe)
    wire [`IO_BUS_WIDTH_DATA - 1: 0] mem_rd;    // 读数据总线
    wire [`IO_BUS_WIDTH_CTRL - 1: 0] mem_ctrl;  // 总线控制信号
    wire [`IO_BUS_WIDTH_DATA - 1: 0] busData;   // 总线返回原始数据

    assign mem_rd = busData; // 建立读数据通路回馈处理器

    // =================================================================
    // 核心模块实例化：mini_rv (RISC-V Processor Core)
    // =================================================================
    mini_rv mini_rv_u (
        .clk(clk_out),
        .rst_n(rst_n),
        .mem_addr(mem_addr),
        .mem_ctrl(mem_ctrl),
        .mem_wd(mem_wd),
        .mem_rd(mem_rd),
        .mem_we(mem_wstrb)     // 输入写使能/掩码信号
    );

    // =================================================================
    // 外设资源管理 (Peripheral Bus & IO)
    // =================================================================
    
    // 未使用的板载外设信号定义 (保持定义以确保模块端口匹配)
    wire [`DEVICE_NUM_LED - 1:0]       unused_led;
    wire [`DEVICE_NUM_NUMLED_EN - 1:0] unused_led_en;
    wire unused_led_ca;
    wire unused_led_cb;
    wire unused_led_cc;
    wire unused_led_cd;
    wire unused_led_ce;
    wire unused_led_cf;
    wire unused_led_cg;
    wire unused_led_dp;

    // 系统总线模块：负责地址译码及外设（UART、Timer等）挂载
    BUS #(
        .ENABLE_NUMLED(1'b0),        // 关闭数码管
        .ENABLE_LED_SWITCH(1'b0),    // 关闭 LED 和开关
        .ENABLE_UART(1'b1),          // 启用 UART (核心输出)
        .ENABLE_TIMER(1'b1),         // 启用系统定时器 (支持性能评估)
        .CPU_CLK_HZ(CPU_CLK_HZ),
        .UART_BAUD(UART_BAUD)
    ) bus (
        .clk(clk_out),
        .rst_n(rst_n),
        .BC(1'b0),
        .switch({`DEVICE_NUM_SWITCH{1'b0}}),
        .led(unused_led),
        .led_en(unused_led_en),
        .led_ca(unused_led_ca),
        .led_cb(unused_led_cb),
        .led_cc(unused_led_cc),
        .led_cd(unused_led_cd),
        .led_ce(unused_led_ce),
        .led_cf(unused_led_cf),
        .led_cg(unused_led_cg),
        .led_dp(unused_led_dp),
        .uart_tx_pin(tx_out),        // UART 输出至顶层管脚
        .addr(mem_addr),             // 处理器地址输入
        .ctrl(mem_ctrl),             // 处理器控制输入
        .wstrb(mem_wstrb),           // 处理器写使能输入
        .wdata(mem_wd),              // 处理器写数据输入
        .data(busData)               // 总线读数据返回处理器
    );

endmodule