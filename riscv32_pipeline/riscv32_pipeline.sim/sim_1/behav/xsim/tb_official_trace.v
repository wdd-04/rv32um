`timescale 1ns / 1ps

module tb_official_trace;
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
        if (mem_addr < 32'h00010000) mem_rd = dmem[mem_addr[15:2]];
        else mem_rd = 32'h0;
    end

    always @(posedge clk) begin
        if (mem_we && mem_addr < 32'h00010000) dmem[mem_addr[15:2]] <= mem_wd;
    end

    initial begin
        for (i = 0; i < 16384; i = i + 1) dmem[i] = 32'h0;
        $readmemh("rv32ui-p-add.mem", tb_official_trace.u_dut.If.IF_irom.irom.inst.ram_data);
        #100 rst_n = 1'b1;
        $display(">>> trace start");
    end

    always @(posedge clk) begin
        if (rst_n && $time >= 1600) begin
            $display("T=%0t IDpc=%h EXpc=%h MEMpc=%h WBpc=%h instID=%h rsEX=%0d/%0d wrEX=%0d wrMEM=%0d wrWB=%0d weMEM/WB=%b/%b mux=%b/%b f=%h/%h cmpA=%h cmpB=%h comp=%b pcctrl=%b risk=%b wb=%b r%0d=%h mem=%b %h %h",
                $time, u_dut.pc_ID, u_dut.pc_EX, u_dut.pc_EX_MEM, wb_pc, u_dut.inst_ID,
                u_dut.rs1_EX, u_dut.rs2_EX, u_dut.RegWr_EX, u_dut.RegWr_MEM, u_dut.RegWr_WB,
                u_dut.RegWe_MEM, u_dut.RegWe_WB, u_dut.MUX_A_Forwarding, u_dut.MUX_B_Forwarding,
                u_dut.forwardingA, u_dut.forwardingB, u_dut.Anum2_EX_AfterForwarding,
                u_dut.Bnum2_EX_AfterForwarding, u_dut.COMPOut_EX, u_dut.PCCTRL_EX, u_dut.risk_Ctrl,
                wb_ena, wb_reg, wb_value, mem_we, mem_addr, mem_wd);
        end
        if (rst_n && mem_we && mem_addr == 32'h80000000) begin
            $display("FINISH code=%h time=%0t wbpc=%h", mem_wd, $time, wb_pc);
            $finish;
        end
    end

    initial begin
        #20000000;
        $display("TIMEOUT");
        $finish;
    end
endmodule

