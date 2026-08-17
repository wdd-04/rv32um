`timescale 1ns / 1ps

module tb_mini_rv();
    reg clk;
    reg rst_n;
    
    // ���߽ӿ�
    wire [31:0] mem_addr;
    wire [31:0] mem_ctrl;
    wire [31:0] mem_wd;
    wire        mem_we;
    reg  [31:0] mem_rd;

    // DEBUG �ӿ��ź�
    wire        wb_have_inst;
    wire [31:0] wb_pc;
    wire        wb_ena;
    wire [4:0]  wb_reg;
    wire [31:0] wb_value;

    // 1. ʵ������Ķ���ģ��? mini_rv
    mini_rv uut (
    
        // �����? DEBUG �ӿڱ������� mini_rv �����һ��?
        .wb_have_inst(wb_have_inst),
        .wb_pc(wb_pc),
        .wb_ena(wb_ena),
        .wb_reg(wb_reg),
        .wb_value(wb_value),
    
        .mem_addr(mem_addr),
        .mem_ctrl(mem_ctrl),
        .mem_wd(mem_wd),
        .mem_we(mem_we),
        .mem_rd(mem_rd),
        .clk(clk),
        .rst_n(rst_n)
    );

    // 2. ģ���ⲿ Data Memory (DRAM)
    reg [31:0] ram [0:255];
    always @(posedge clk) begin
        if (mem_we) ram[mem_addr[9:2]] <= mem_wd;
        mem_rd <= ram[mem_addr[9:2]];
    end

    // 3. ʱ������ (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 4. ���漤������
    initial begin
        rst_n = 0;          // ��λ״̬
        mem_rd = 0;
        #25 rst_n = 1;      // �ͷŸ�λ
        
        #2000;              // �������� 2000ns
        $display("Simulation Complete.");
        $stop;              // ֹͣ����
    end

endmodule