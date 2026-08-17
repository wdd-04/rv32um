`timescale 1ns / 1ps
`include "param.v"

`ifndef TEST_MEM_FILE
`define TEST_MEM_FILE "D:/riscv32_pipeline_cache/riscv32_pipeline.ip_user_files/mem_init_files/coremark_uart.mem"
`endif

`ifndef MAX_BRANCH_ACC_CYCLES
`define MAX_BRANCH_ACC_CYCLES 2000000
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

module tb_branch_accuracy();
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

    integer i;
    integer log_file;
    integer csv_file;

    integer cycle_count;
    integer branch_total;
    integer branch_correct;
    integer branch_fail;
    integer b_total;
    integer b_correct;
    integer j_total;
    integer j_correct;

    wire actual_is_branch = u_dut.PCCTRL_EX[`PCCTRL_B];
    wire actual_is_jump   = u_dut.PCCTRL_EX[`PCCTRL_J];
    wire actual_event     = actual_is_branch || actual_is_jump;
    wire actual_taken     = u_dut.If.PCSel;
    wire predicted_taken  = u_dut.pred_taken_EX;
    wire mispredict       = u_dut.risk_Ctrl;
    wire count_event      = rst_n && actual_event && !u_dut.M_stall_EX && !u_dut.mem_sync_stall;

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

    task write_summary;
        real acc;
        real b_acc;
        real j_acc;
        begin
            acc   = (branch_total == 0) ? 0.0 : (100.0 * branch_correct / branch_total);
            b_acc = (b_total == 0)      ? 0.0 : (100.0 * b_correct / b_total);
            j_acc = (j_total == 0)      ? 0.0 : (100.0 * j_correct / j_total);

            $display("BRANCH_ACC_SUMMARY cycles=%0d total=%0d correct=%0d fail=%0d acc=%0.2f%% b_total=%0d b_acc=%0.2f%% j_total=%0d j_acc=%0.2f%%",
                     cycle_count, branch_total, branch_correct, branch_fail, acc,
                     b_total, b_acc, j_total, j_acc);
            $fdisplay(log_file, "BRANCH_ACC_SUMMARY cycles=%0d total=%0d correct=%0d fail=%0d acc=%0.2f%% b_total=%0d b_acc=%0.2f%% j_total=%0d j_acc=%0.2f%%",
                      cycle_count, branch_total, branch_correct, branch_fail, acc,
                      b_total, b_acc, j_total, j_acc);
            $fdisplay(csv_file, "metric,value");
            $fdisplay(csv_file, "cycles,%0d", cycle_count);
            $fdisplay(csv_file, "branch_total,%0d", branch_total);
            $fdisplay(csv_file, "branch_correct,%0d", branch_correct);
            $fdisplay(csv_file, "branch_fail,%0d", branch_fail);
            $fdisplay(csv_file, "accuracy_percent,%0.2f", acc);
            $fdisplay(csv_file, "b_total,%0d", b_total);
            $fdisplay(csv_file, "b_correct,%0d", b_correct);
            $fdisplay(csv_file, "b_accuracy_percent,%0.2f", b_acc);
            $fdisplay(csv_file, "j_total,%0d", j_total);
            $fdisplay(csv_file, "j_correct,%0d", j_correct);
            $fdisplay(csv_file, "j_accuracy_percent,%0.2f", j_acc);
        end
    endtask

    initial begin
        rst_n = 1'b0;
        mem_rd = 32'h00000000;
        timer_counter = 32'h00000000;
        cycle_count = 0;
        branch_total = 0;
        branch_correct = 0;
        branch_fail = 0;
        b_total = 0;
        b_correct = 0;
        j_total = 0;
        j_correct = 0;

        log_file = $fopen("branch_accuracy_detail.log", "w");
        csv_file = $fopen("branch_accuracy_summary.csv", "w");

        for (i = 0; i < 16384; i = i + 1) begin
            dmem[i] = 32'h00000000;
        end

        $readmemh(`TEST_MEM_FILE, tb_branch_accuracy.u_dut.If.IF_icache.backing_mem.irom.ram_data);
        $readmemh(`TEST_MEM_FILE, dmem);

        $display("Branch predictor accuracy simulation start");
        $display("mem file: %s", `TEST_MEM_FILE);
        $fdisplay(log_file, "Branch predictor accuracy simulation start");
        $fdisplay(log_file, "mem file: %s", `TEST_MEM_FILE);
        $fdisplay(log_file, "cycle,pc_ex,pc_if,pc_id,actual_kind,actual_taken,predicted_taken,correct,risk_ctrl,bht_hit,btb_hit,bht_jump");

        #100;
        rst_n = 1'b1;
    end

    always @(posedge clk) begin
        if (rst_n) begin
            cycle_count <= cycle_count + 1;

            if (count_event) begin
                branch_total <= branch_total + 1;
                if (!mispredict) begin
                    branch_correct <= branch_correct + 1;
                end else begin
                    branch_fail <= branch_fail + 1;
                end

                if (actual_is_branch) begin
                    b_total <= b_total + 1;
                    if (!mispredict) b_correct <= b_correct + 1;
                end else begin
                    j_total <= j_total + 1;
                    if (!mispredict) j_correct <= j_correct + 1;
                end

                $fdisplay(log_file, "%0d,%08h,%08h,%08h,%s,%0d,%0d,%0d,%0d,%0d,%0d,%0d",
                          cycle_count,
                          u_dut.pc_EX,
                          u_dut.pc_IF,
                          u_dut.pc_ID,
                          actual_is_branch ? "B" : "J",
                          actual_taken,
                          predicted_taken,
                          !mispredict,
                          u_dut.risk_Ctrl,
                          u_dut.If.branchPredictor.isHit_BHT,
                          u_dut.If.branchPredictor.isHit_BTB,
                          u_dut.If.branchPredictor.isJump_BHT);
            end

            if (cycle_count >= `MAX_BRANCH_ACC_CYCLES) begin
                write_summary();
                $finish;
            end
        end
    end
endmodule
