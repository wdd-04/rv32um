`timescale 1ns / 1ps

`ifndef TEST_MEM_FILE
`define TEST_MEM_FILE "D:/riscv32_pipeline/riscv32_pipeline.ip_user_files/mem_init_files/coremark.mem"
`endif

module tb_coremark_ila();

    localparam real CLK_HALF_NS = 6.6666667; // 75 MHz

    reg clk;
    reg rst_n;

    wire [31:0] mem_addr;
    wire [0:0]  mem_ctrl;
    wire [31:0] mem_wd;
    wire        mem_we;
    reg  [31:0] mem_rd;

    wire        wb_have_inst;
    wire [31:0] wb_pc;
    wire        wb_ena;
    wire [4:0]  wb_reg;
    wire [31:0] wb_value;

    reg [31:0] dmem [0:16383];
    reg [31:0] timer_count;
    reg [31:0] score_value;

    integer uart_log;
    integer trace_log;

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

    initial clk = 1'b0;
    always #(CLK_HALF_NS) clk = ~clk;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer_count <= 32'd0;
        end else begin
            timer_count <= timer_count + 32'd1;
        end
    end

    always @(*) begin
        if (mem_addr < 32'h00010000) begin
            mem_rd = dmem[mem_addr[15:2]];
        end else if (mem_addr == 32'hFFFFF090) begin
            mem_rd = timer_count;
        end else if (mem_addr == 32'hFFFFF084) begin
            mem_rd = 32'h00000000;
        end else begin
            mem_rd = 32'h00000000;
        end
    end

    always @(posedge clk) begin
        if (rst_n && mem_we) begin
            if (mem_addr < 32'h00010000) begin
                dmem[mem_addr[15:2]] <= mem_wd;
                if (mem_addr == 32'h0000F000) begin
                    score_value <= mem_wd;
                    $display("COREMARK_SCORE_WRITE time=%0t cycles=%0d score=%0d hex=%08h pc=%08h",
                             $time, timer_count, mem_wd, mem_wd, wb_pc);
                    $fdisplay(trace_log, "COREMARK_SCORE_WRITE time=%0t cycles=%0d score=%0d hex=%08h pc=%08h",
                              $time, timer_count, mem_wd, mem_wd, wb_pc);
                end
            end else if (mem_addr == 32'hFFFFF080) begin
                $write("%c", mem_wd[7:0]);
                $fwrite(uart_log, "%c", mem_wd[7:0]);
            end
        end
    end

    always @(posedge clk) begin
        if (rst_n && wb_have_inst && wb_ena) begin
            $fdisplay(trace_log, "COMMIT cyc=%0d pc=%08h rd=x%0d value=%08h mem_we=%b mem_addr=%08h mem_wd=%08h mem_rd=%08h",
                      timer_count, wb_pc, wb_reg, wb_value, mem_we, mem_addr, mem_wd, mem_rd);
        end
    end

    initial begin
        uart_log = $fopen("coremark_uart.log", "w");
        trace_log = $fopen("coremark_trace.log", "w");
        score_value = 32'd0;

        $readmemh(`TEST_MEM_FILE, tb_coremark_ila.u_dut.If.IF_irom.irom.inst.ram_data);
        $readmemh(`TEST_MEM_FILE, dmem);

        $display("----------------------------------------------");
        $display("CoreMark simulation started");
        $display("mem file : %s", `TEST_MEM_FILE);
        $display("clock    : 75 MHz");
        $display("score at : 0x0000F000");
        $display("----------------------------------------------");

        rst_n = 1'b0;
        #(20 * CLK_HALF_NS);
        rst_n = 1'b1;
    end

    initial begin
        #(200000000);
        $display("COREMARK_TIMEOUT cycles=%0d pc=%08h score=%0d", timer_count, wb_pc, score_value);
        $fdisplay(trace_log, "COREMARK_TIMEOUT cycles=%0d pc=%08h score=%0d", timer_count, wb_pc, score_value);
        $finish;
    end

endmodule
