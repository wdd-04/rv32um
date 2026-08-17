`timescale 1ns / 1ps

module tb_rv32um_verbose;
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
    integer log_file;

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
            mem_rd = 32'h00000000;
        end
    end

    always @(posedge clk) begin
        if (mem_we && mem_addr < 32'h00010000) begin
            dmem[mem_addr[15:2]] <= mem_wd;
        end
    end

    initial begin
        log_file = $fopen("rv32um_verbose.log", "w");
        for (i = 0; i < 16384; i = i + 1) begin
            dmem[i] = 32'h00000000;
        end

        $readmemh("official_test.mem", tb_rv32um_verbose.u_dut.If.IF_irom.irom.inst.ram_data);
        $readmemh("official_test.mem", dmem);

        #100 rst_n = 1'b1;
        $display("START official_test.mem");
        $fdisplay(log_file, "START official_test.mem");
    end

    always @(posedge clk) begin
        if (rst_n && wb_have_inst) begin
            $fdisplay(log_file,
                "COMMIT t=%0t wb_pc=%h wb_we=%b wb_rd=x%0d wb_val=%h IF_pc=%h IF_inst=%h ID_pc=%h ID_inst=%h EX_pc=%h EX_alu=%h EX_m=%b EX_m_f3=%b EX_m_stall=%b mem_we=%b mem_addr=%h mem_wd=%h mem_rd=%h",
                $time, wb_pc, wb_ena, wb_reg, wb_value,
                u_dut.pc_IF, u_dut.inst_IF, u_dut.pc_ID, u_dut.inst_ID,
                u_dut.pc_EX, u_dut.ALUOut_EX, u_dut.TYPE_M_EX, u_dut.M_FUNC3_EX, u_dut.M_stall_EX,
                mem_we, mem_addr, mem_wd, mem_rd);
        end

        if (rst_n && u_dut.TYPE_M_EX && u_dut.Ex.m_start) begin
            $fdisplay(log_file, "M_START t=%0t pc=%h func3=%b rs1=%h rs2=%h", $time, u_dut.pc_EX, u_dut.M_FUNC3_EX, u_dut.Anum_EX_AfterForwarding, u_dut.Bnum_EX_AfterForwarding);
        end

        if (rst_n && u_dut.TYPE_M_EX && !u_dut.M_stall_EX) begin
            $fdisplay(log_file, "M_DONE t=%0t pc=%h func3=%b result=%h", $time, u_dut.pc_EX, u_dut.M_FUNC3_EX, u_dut.ALUOut_EX);
        end

        if (rst_n && mem_we) begin
            $fdisplay(log_file, "MEM_WRITE t=%0t pc=%h addr=%h wd=%h ctrl=%b", $time, wb_pc, mem_addr, mem_wd, mem_ctrl);
        end

        if (rst_n && mem_we && mem_addr == 32'h80000000) begin
            if (mem_wd == 32'h00000001) begin
                $display("RESULT PASS pc=%h time=%0t", wb_pc, $time);
                $fdisplay(log_file, "RESULT PASS pc=%h time=%0t", wb_pc, $time);
            end else begin
                $display("RESULT FAIL code=%h pc=%h wb_reg=%0d wb_value=%h time=%0t", mem_wd, wb_pc, wb_reg, wb_value, $time);
                $fdisplay(log_file, "RESULT FAIL code=%h pc=%h wb_reg=%0d wb_value=%h time=%0t", mem_wd, wb_pc, wb_reg, wb_value, $time);
            end
            $finish;
        end
    end

    initial begin
        #20000000;
        $display("RESULT TIMEOUT pc=%h mem_addr=%h mem_we=%b mem_wd=%h", wb_pc, mem_addr, mem_we, mem_wd);
        $fdisplay(log_file, "RESULT TIMEOUT pc=%h mem_addr=%h mem_we=%b mem_wd=%h", wb_pc, mem_addr, mem_we, mem_wd);
        $finish;
    end
endmodule
