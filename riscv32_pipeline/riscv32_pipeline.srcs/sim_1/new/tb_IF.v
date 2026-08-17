//`timescale 1ns / 1ps
//`ifdef DEBUG
//    `include "param.v"
//`else
//    `include "../param.v"
//`endif

module tb_IF();

    // 时钟与复位
    reg clk;
    reg rst_n;
    
    // 输入信号
    reg                         stop_IF;
    reg  [`WIDTH_PCCTRL - 1 : 0]    PCCTRL;
    reg  [`WIDTH_ALUOUT - 1 : 0]    branch_pc;
    reg  [`WIDTH_COMPOUT - 1 : 0]   COMPOut;
    reg  [`WIDTH_INST - 1: 0]       inst_ID;
    
    // 输出信号
    wire [`WIDTH_INST - 1: 0]       inst;
    wire [`WIDTH_PC - 1: 0]         pc;
    wire                            risk_Ctrl;

    // 实例化被测模块 (UUT)
    IF u_IF (
        .clk(clk),
        .rst_n(rst_n),
        .stop_IF(stop_IF),
        .PCCTRL(PCCTRL),
        .branch_pc(branch_pc),
        .COMPOut(COMPOut),
        .inst_ID(inst_ID),
        .inst(inst),
        .pc(pc),
        .risk_Ctrl(risk_Ctrl)
    );

    // 生成时钟: 100MHz (10ns 周期)
    always #5 clk = ~clk;

    initial begin
        // --- 1. 初始化信号 ---
        clk = 0;
        rst_n = 0;
        stop_IF = 0;
        PCCTRL = 0;
        branch_pc = 32'h0;
        COMPOut = 0;
        inst_ID = 32'h00000013; // 默认给个NOP

        // 复位持续 20ns
        #20 rst_n = 1;
        $display("Reset released at %t", $time);

        // --- 2. 测试顺序取指 ---
        // 观察 pc 是否在每个周期递增，inst 是否从 InstMem 读出并填入 buffer
        #50; 
        
        // --- 3. 测试暂停 (stop_IF) ---
        // 模拟 ID 阶段繁忙，暂停取指
        $display("Testing Stall (stop_IF) at %t", $time);
        stop_IF = 1;
        #30;
        stop_IF = 0;
        #20;

        // --- 4. 测试跳转冲刷 (Flush) ---
        // 模拟执行到一个 JUMP 指令
        $display("Testing Flush (Jump) at %t", $time);
        // 假设 PCCTRL 的某一位代表跳转，具体根据你的 param.v 定义
        // 这里模拟触发 flush 逻辑: risk_Ctrl 或 PCCTRL_J
        branch_pc = 32'h0000_0100; // 目标地址
        PCCTRL[`PCCTRL_J] = 1;     // 触发跳转信号
        #10;
        PCCTRL[`PCCTRL_J] = 0;     // 恢复
        
        // 观察此时 pc 是否跳转到了 0x100，且之前的 buffer 是否被清空
        #50;

        // --- 5. 测试分支跳转 ---
        $display("Testing Branch Jump at %t", $time);
        branch_pc = 32'h0000_0200;
        PCCTRL[`PCCTRL_B] = 1;
        // 假设 PCSel 逻辑在 BranchCTRL 里计算结果为 JUMP
        // 这里需要配合你 BranchCTRL 的内部实现来给 COMPOut 的值
        #10;
        PCCTRL[`PCCTRL_B] = 0;

        #100;
        $display("Simulation Finished");
        $finish;
    end

    // 可选：监视重要信号
    initial begin
        $monitor("Time=%t | PC=%h | Inst=%h | count=%d", 
                 $time, pc, inst, u_IF.buf_count);
    end

endmodule