`timescale 1ns / 1ps

module inst_mem(
    input  wire        clka,
    input  wire [13:0] addra,
    output reg  [31:0] douta
);
    reg [31:0] ram_data [0:16383];

    initial begin
        $readmemh("test_current.mem", ram_data);
    end

    always @(posedge clka) begin
        douta <= ram_data[addra];
    end
endmodule

module tb_bram_batch();
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
    wire [31:0] mem_rd;

    reg [31:0] dmem [0:16383];
    reg [31:0] dmem_rd;
    reg [31:0] dmem_next;
    integer i;
    integer log_file;

    assign mem_rd = dmem_rd;

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

    always @(posedge clk) begin
        if (mem_addr < 32'h00010000) begin
            dmem_next = dmem[mem_addr[15:2]];
            if (mem_we[0]) begin
                dmem_next[7:0] = mem_wd[7:0];
            end
            if (mem_we[1]) begin
                dmem_next[15:8] = mem_wd[15:8];
            end
            if (mem_we[2]) begin
                dmem_next[23:16] = mem_wd[23:16];
            end
            if (mem_we[3]) begin
                dmem_next[31:24] = mem_wd[31:24];
            end
            dmem_rd <= dmem_next;
            if (|mem_we) begin
                dmem[mem_addr[15:2]] <= dmem_next;
            end
        end else begin
            dmem_rd <= 32'h00000000;
        end
    end

    initial begin
        clk = 1'b0;
        rst_n = 1'b1;
        dmem_rd = 32'h00000000;

        log_file = $fopen("bram_batch_detail.log", "w");

        for (i = 0; i < 16384; i = i + 1) begin
            dmem[i] = 32'h00000000;
        end

        $readmemh("test_current.mem", dmem);

        #10;
        rst_n = 1'b0;
        #100;
        rst_n = 1'b1;
        $display("START test_current.mem");
        $fdisplay(log_file, "START test_current.mem");
    end

    always @(posedge clk) begin
        if (rst_n && $time < 2000) begin
            $fdisplay(log_file,
                "TRACE t=%0t wb_have=%b pcIF=%h instIF=%h pcID=%h instID=%h pcEX=%h aluMEM=%h mem_stall=%b mem_waited=%b mem_addr=%h mem_we=%b mem_rd=%h",
                $time, wb_have_inst, u_dut.pc_IF, u_dut.inst_IF,
                u_dut.pc_ID, u_dut.inst_ID, u_dut.pc_EX, u_dut.ALUOut_MEM_mem,
                u_dut.mem_sync_stall, u_dut.mem_access_waited,
                mem_addr, mem_we, mem_rd);
        end

        if (rst_n && wb_have_inst) begin
            $fdisplay(log_file,
                "COMMIT t=%0t wb_pc=%h wb_we=%b wb_rd=x%0d wb_val=%h IF_pc=%h IF_inst=%h ID_pc=%h ID_inst=%h EX_pc=%h EX_alu=%h mem_stall=%b mem_commit=%b mem_we=%b mem_addr=%h mem_wd=%h mem_rd=%h",
                $time, wb_pc, wb_ena, wb_reg, wb_value,
                u_dut.pc_IF, u_dut.inst_IF, u_dut.pc_ID, u_dut.inst_ID,
                u_dut.pc_EX, u_dut.ALUOut_EX,
                u_dut.mem_sync_stall, u_dut.mem_access_commit,
                mem_we, mem_addr, mem_wd, mem_rd);
        end

        if (rst_n && |mem_we) begin
            $fdisplay(log_file, "MEM_WRITE t=%0t pc=%h addr=%h wd=%h ctrl=%b",
                      $time, wb_pc, mem_addr, mem_wd, mem_ctrl);
        end

        if (rst_n && |mem_we && mem_addr == 32'h80000000) begin
            if (mem_wd == 32'h00000001) begin
                $display("RESULT PASS test_current.mem pc=%h time=%0t", wb_pc, $time);
                $fdisplay(log_file, "RESULT PASS pc=%h time=%0t", wb_pc, $time);
            end else begin
                $display("RESULT FAIL test_current.mem code=%h pc=%h wb_reg=%0d wb_value=%h time=%0t",
                         mem_wd, wb_pc, wb_reg, wb_value, $time);
                $fdisplay(log_file, "RESULT FAIL code=%h pc=%h wb_reg=%0d wb_value=%h time=%0t",
                          mem_wd, wb_pc, wb_reg, wb_value, $time);
            end
            $finish;
        end
    end

    initial begin
        #2000000;
        $display("RESULT TIMEOUT test_current.mem pc=%h mem_addr=%h mem_we=%b mem_wd=%h",
                 wb_pc, mem_addr, mem_we, mem_wd);
        $fdisplay(log_file, "RESULT TIMEOUT pc=%h mem_addr=%h mem_we=%b mem_wd=%h",
                  wb_pc, mem_addr, mem_we, mem_wd);
        $finish;
    end
endmodule
