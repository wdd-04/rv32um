`timescale 1ns / 1ps

`define TEST_MEM_FILE "D:/riscv32_pipeline/riscv32_pipeline.ip_user_files/mem_init_files/rv32ui-p-add_nocsr.mem"

module tb_official_add();
    reg clk;
    reg rst_n;

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

    always #5 clk = ~clk;

    always @(*) begin
        if (mem_addr < 32'h00010000) begin
            mem_rd = dmem[mem_addr[15:2]];
        end else begin
            mem_rd = 32'h00000000;
        end
    end

    always @(posedge clk) begin
        if (mem_we && mem_addr < 32'h00010000) begin
            dmem[mem_addr[15:2]] <= mem_wd;
        end
    end

    initial begin
        clk = 1'b0;
        rst_n = 1'b0;
        mem_rd = 32'h00000000;

        for (i = 0; i < 16384; i = i + 1) begin
            dmem[i] = 32'h00000000;
        end

        $readmemh(`TEST_MEM_FILE, tb_official_add.u_dut.If.IF_irom.irom.inst.ram_data);
        $readmemh(`TEST_MEM_FILE, dmem);

        #100;
        rst_n = 1'b1;
        $display(">>> official simulation started: %s", `TEST_MEM_FILE);
    end

    always @(posedge clk) begin
        if (rst_n && mem_we && mem_addr == 32'h80000000) begin
            if (mem_wd == 32'h00000001) begin
                $display(">>> PASS: rv32ui-p-add passed. time=%0t pc=%h", $time, wb_pc);
            end else begin
                $display("!!! FAIL: rv32ui-p-add failed. code=%h time=%0t pc=%h wb_reg=%0d wb_value=%h",
                         mem_wd, $time, wb_pc, wb_reg, wb_value);
            end
            $finish;
        end
    end

    initial begin
        #20000000;
        $display("!!! TIMEOUT: pc=%h mem_addr=%h mem_we=%b mem_wd=%h",
                 wb_pc, mem_addr, mem_we, mem_wd);
        $finish;
    end
endmodule
