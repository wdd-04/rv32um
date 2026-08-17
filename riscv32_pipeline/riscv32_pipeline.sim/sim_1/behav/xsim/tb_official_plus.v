`timescale 1ns / 1ps

module tb_official_plus;
    reg clk = 1'b0;
    reg rst_n = 1'b0;

    wire        wb_have_inst;
    wire [31:0] wb_pc;
    wire        wb_ena;
    wire [4:0]  wb_reg;
    wire [31:0] wb_value;

    wire [31:0] mem_addr;
    wire [0:0]  mem_ctrl;
    wire [31:0] mem_wd;
    wire        mem_we;
    reg  [31:0] mem_rd;

    reg [31:0] dmem [0:16383];
    integer i;
    integer trace_count;
    reg [1023:0] mem_file;

    mini_rv u_dut (
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

    always #5 clk = ~clk;

    always @(*) begin
        if (mem_addr < 32'h00010000) begin
            mem_rd = dmem[mem_addr[15:2]];
        end else begin
            mem_rd = 32'h0;
        end
    end

    always @(posedge clk) begin
        if (mem_we && mem_addr < 32'h00010000) begin
            dmem[mem_addr[15:2]] <= mem_wd;
        end
    end

    initial begin
        mem_file = "official_test.mem";
        trace_count = 0;
        for (i = 0; i < 16384; i = i + 1) dmem[i] = 32'h0;
        $readmemh(mem_file, tb_official_plus.u_dut.If.IF_irom.irom.inst.ram_data);
        #100 rst_n = 1'b1;
        $display(">>> Reset released, official test starts. mem=%s", mem_file);
    end

    always @(posedge clk) begin
        if (rst_n && mem_we && mem_addr == 32'h80000000) begin
            if (mem_wd == 32'h1) begin
                $display(">>> SUCCESS: Official Test Passed. code=%h time=%0t pc=%h", mem_wd, $time, wb_pc);
            end else begin
                $display("!!! FAILED: Official Test Error. code=%h time=%0t pc=%h wb_reg=%0d wb_value=%h", mem_wd, $time, wb_pc, wb_reg, wb_value);
            end
            $finish;
        end
    end

    always @(posedge clk) begin
        if (rst_n && wb_have_inst && trace_count < 200) begin
            trace_count = trace_count + 1;
            $display("TRACE[%0d] pc=%h wb_ena=%b wb_reg=%0d wb_value=%h mem_we=%b mem_addr=%h mem_wd=%h",
                     trace_count, wb_pc, wb_ena, wb_reg, wb_value, mem_we, mem_addr, mem_wd);
        end
    end

    initial begin
        #20000000;
        $display("!!! TIMEOUT: pc=%h mem_addr=%h mem_we=%b mem_wd=%h", wb_pc, mem_addr, mem_we, mem_wd);
        $finish;
    end
endmodule
