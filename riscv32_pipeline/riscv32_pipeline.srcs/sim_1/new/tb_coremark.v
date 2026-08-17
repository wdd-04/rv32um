`timescale 1ns / 1ps

module tb_coremark();

    // 信号定义
    reg clk;
    reg rst_n;

    // CPU 接口信号
    wire [31:0] mem_addr;
    wire [0:0]  mem_ctrl;
    wire [31:0] mem_wd;
    wire        mem_we;
    reg  [31:0] mem_rd;

    // Debug 信号 (mini_rv 开启了 DEBUG 宏)
    wire        wb_have_inst;
    wire [31:0] wb_pc;
    wire        wb_ena;
    wire [4:0]  wb_reg;
    wire [31:0] wb_value;

    // ---------------------------------------------------------
    // 1. 实例化 CPU (mini_rv)
    // ---------------------------------------------------------
    mini_rv u_dut (
        `ifdef DEBUG
           .wb_have_inst(wb_have_inst),
           .wb_pc(wb_pc),
           .wb_ena(wb_ena),
           .wb_reg(wb_reg),
           .wb_value(wb_value),
        `endif
           .mem_addr(mem_addr),
           .mem_ctrl(mem_ctrl),
           .mem_wd(mem_wd),
           .mem_we(mem_we),
           .mem_rd(mem_rd),

           .clk(clk),
           .rst_n(rst_n)
    );

    // ---------------------------------------------------------
    // 2. 模拟外部存储器 (Data RAM)
    // CoreMark 需要读写数据，这里模拟一个简单的异步读、同步写的 RAM
    // ---------------------------------------------------------
    reg [31:0] data_ram [0:8191]; // 32KB 数据内存
    
    // 处理内存读取 (异步读取给 CPU)
    always @(*) begin
        // 这里简单处理地址：取低 15 位作为索引 (32KB)
        mem_rd = data_ram[mem_addr[14:2]];
    end

    // 处理内存写入
    always @(posedge clk) begin
        if (mem_we && mem_addr < 32'h10000000) begin
            data_ram[mem_addr[14:2]] <= mem_wd;
        end
    end

    // ---------------------------------------------------------
    // 3. 【核心逻辑】虚拟串口打印监控
    // 当 CPU 往 0x1000_0000 地址写数据时，捕获字符并显示在控制台
    // ---------------------------------------------------------
    always @(posedge clk) begin
        if (mem_we && mem_addr == 32'h10000000) begin
            $write("%c", mem_wd[7:0]); // 在 Vivado Tcl Console 打印 C 语言输出的字符
        end
    end

    // ---------------------------------------------------------
    // 4. 时钟产生 (100MHz)
    // ---------------------------------------------------------
    initial clk = 0;
    always #5 clk = ~clk;

    // ---------------------------------------------------------
    // 5. 初始化与加载程序
    // ---------------------------------------------------------
    initial begin
        // 初始状态
        rst_n = 0;
        
        // 加载指令内存
        // 注意：根据你的截图，路径可能是 u_dut.If.xxxx
        // 请根据你 IF 模块内部具体的存储器变量名修改下面这行
        $readmemh("coremark.mem", tb_coremark.u_dut.If.IF_irom.irom.inst.ram_data);
        
        $display("----------------------------------------------");
        $display("         CoreMark Simulation Started         ");
        $display("----------------------------------------------");

        // 释放复位
        #100;
        rst_n = 1;

        // 设置仿真超时（如果程序跑飞了，10ms 后强制停止）
        #10000000; 
        $display("\n[Timeout] Simulation ended by safety timer.");
        $finish;
    end

    // ---------------------------------------------------------
    // 6. 监控程序结束（可选）
    // 如果你在 C 代码中定义了 0x80000000 为结束标志
    // ---------------------------------------------------------
    always @(posedge clk) begin
        if (mem_we && mem_addr == 32'h80000000) begin
            $display("\n----------------------------------------------");
            $display("       CoreMark Simulation Finished!         ");
            $display("----------------------------------------------");
            $finish;
        end
    end

endmodule