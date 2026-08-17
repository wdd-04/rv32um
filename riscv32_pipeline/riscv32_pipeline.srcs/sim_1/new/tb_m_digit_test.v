`timescale 1ns / 1ps

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

module tb_m_digit_test();
    reg clk;
    reg rst_n;

    wire [31:0] mem_addr;
    wire [0:0]  mem_ctrl;
    wire [31:0] mem_wd;
    wire [3:0]  mem_we;
    reg  [31:0] mem_rd;

    reg [31:0] dmem [0:16383];
    reg [31:0] timer_counter;
    integer i;

    mini_rv u_dut (
        `ifdef DEBUG
        .wb_have_inst(),
        .wb_pc(),
        .wb_ena(),
        .wb_reg(),
        .wb_value(),
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
            timer_counter <= 32'h0;
        end else begin
            timer_counter <= timer_counter + 32'h1;
        end
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            mem_rd <= 32'h0;
        end else if (mem_addr < 32'h00010000) begin
            mem_rd <= dmem[mem_addr[15:2]];
            if (mem_we[0]) dmem[mem_addr[15:2]][7:0]   <= mem_wd[7:0];
            if (mem_we[1]) dmem[mem_addr[15:2]][15:8]  <= mem_wd[15:8];
            if (mem_we[2]) dmem[mem_addr[15:2]][23:16] <= mem_wd[23:16];
            if (mem_we[3]) dmem[mem_addr[15:2]][31:24] <= mem_wd[31:24];
        end else begin
            case (mem_addr)
                32'hFFFFF084: mem_rd <= 32'h00000000;
                32'hFFFFF090: mem_rd <= timer_counter;
                default:      mem_rd <= 32'h00000000;
            endcase
        end
    end

    always @(posedge clk) begin
        if (rst_n && |mem_we && mem_addr == 32'hFFFFF080) begin
            $write("%c", mem_wd[7:0]);
        end
    end

    initial begin
        rst_n = 1'b0;
        mem_rd = 32'h0;
        timer_counter = 32'h0;
        for (i = 0; i < 16384; i = i + 1) begin
            dmem[i] = 32'h0;
        end
        $readmemh("D:/riscv32_pipeline/riscv32_pipeline.ip_user_files/mem_init_files/m_div_digit_test.mem",
                  tb_m_digit_test.u_dut.If.IF_irom.irom.ram_data);
        $readmemh("D:/riscv32_pipeline/riscv32_pipeline.ip_user_files/mem_init_files/m_div_digit_test.mem",
                  dmem);
        #100;
        rst_n = 1'b1;
        #5000000;
        $display("");
        $finish;
    end
endmodule
