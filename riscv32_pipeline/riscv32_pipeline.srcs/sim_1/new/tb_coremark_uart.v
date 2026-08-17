`timescale 1ns / 1ps

`ifndef TEST_MEM_FILE
`define TEST_MEM_FILE "D:/riscv32_pipeline/riscv32_pipeline.ip_user_files/mem_init_files/coremark_uart.mem"
`endif

module inst_mem(
    input  wire        clka,
    input  wire [13:0] addra,
    output reg  [31:0] douta
);
    reg [31:0] ram_data [0:16383];

    always @(posedge clka) begin
        douta <= ram_data[addra];
    end
endmodule

module tb_coremark_uart();
    parameter TRACE_COMMITS = 1'b0;
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
    wire [3:0]  mem_we;
    reg  [31:0] mem_rd;

    reg [31:0] dmem [0:16383];
    reg [31:0] dmem_next;
    reg [31:0] timer_counter;
    reg [8*256-1:0] uart_line;
    reg [8*12-1:0] uart_recent;
    reg coremark_line_seen;
    integer uart_line_len;
    integer i;
    integer log_file;
    integer uart_file;

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
    always #5 clk = ~clk;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer_counter <= 32'h00000000;
        end else begin
            timer_counter <= timer_counter + 32'h00000001;
        end
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            mem_rd <= 32'h00000000;
        end else if (mem_addr < 32'h00010000) begin
            dmem_next = dmem[mem_addr[15:2]];

            if (mem_we[0]) dmem_next[7:0]   = mem_wd[7:0];
            if (mem_we[1]) dmem_next[15:8]  = mem_wd[15:8];
            if (mem_we[2]) dmem_next[23:16] = mem_wd[23:16];
            if (mem_we[3]) dmem_next[31:24] = mem_wd[31:24];

            mem_rd <= dmem_next;
            if (|mem_we) begin
                dmem[mem_addr[15:2]] <= dmem_next;
            end
        end else begin
            case (mem_addr)
                32'hFFFFF084: mem_rd <= 32'h00000000;
                32'hFFFFF090: mem_rd <= timer_counter;
                default:      mem_rd <= 32'h00000000;
            endcase
        end
    end

    task push_uart_char;
        input [7:0] ch;
        begin
            $write("%c", ch);
            $fwrite(uart_file, "%c", ch);
            $fflush(uart_file);

            if (ch == 8'h0a || ch == 8'h0d) begin
                if (coremark_line_seen) begin
                    $display("");
                    $display("[DONE] CoreMark result line printed. timer=%h", timer_counter);
                    $finish;
                end
                uart_line = {8*256{1'b0}};
                uart_line_len = 0;
            end else if (uart_line_len < 256) begin
                uart_line = (uart_line << 8) | ch;
                uart_line_len = uart_line_len + 1;
            end

            uart_recent = (uart_recent << 8) | ch;
            if (((uart_recent << 8) | ch) == "CoreMark 1.0") begin
                coremark_line_seen = 1'b1;
            end
        end
    endtask

    always @(posedge clk) begin
        if (rst_n && |mem_we && mem_addr == 32'hFFFFF080) begin
            push_uart_char(mem_wd[7:0]);
        end
    end

    initial begin
        rst_n = 1'b0;
        mem_rd = 32'h00000000;
        timer_counter = 32'h00000000;
        uart_line = {8*256{1'b0}};
        uart_recent = {8*12{1'b0}};
        coremark_line_seen = 1'b0;
        uart_line_len = 0;

        log_file = $fopen("coremark_uart_detail.log", "w");
        uart_file = $fopen("coremark_uart_output.log", "w");

        for (i = 0; i < 16384; i = i + 1) begin
            dmem[i] = 32'h00000000;
        end

        $readmemh(`TEST_MEM_FILE, tb_coremark_uart.u_dut.If.IF_irom.irom.ram_data);
        $readmemh(`TEST_MEM_FILE, dmem);

        $display("----------------------------------------------");
        $display("CoreMark UART simulation start");
        $display("mem   : %s", `TEST_MEM_FILE);
        $display("uart  : data=0xFFFFF080 status=0xFFFFF084");
        $display("timer : 0xFFFFF090");
        $display("----------------------------------------------");

        #100;
        rst_n = 1'b1;
    end

    always @(posedge clk) begin
        if (TRACE_COMMITS && rst_n && wb_have_inst) begin
            $fdisplay(log_file,
                "COMMIT t=%0t pc=%h wb_we=%b rd=x%0d val=%h mem_addr=%h mem_we=%b mem_wd=%h mem_rd=%h timer=%h",
                $time, wb_pc, wb_ena, wb_reg, wb_value,
                mem_addr, mem_we, mem_wd, mem_rd, timer_counter);
        end
    end

    initial begin
        #2000000000;
        $display("");
        $display("[TIMEOUT] CoreMark UART simulation timeout. pc=%h mem_addr=%h mem_we=%b mem_wd=%h timer=%h",
                 wb_pc, mem_addr, mem_we, mem_wd, timer_counter);
        $finish;
    end
endmodule
