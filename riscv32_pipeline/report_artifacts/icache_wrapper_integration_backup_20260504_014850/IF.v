`ifdef DEBUG
    `include "param.v"
`else
    `include "../param.v"
`endif

module IF (
    input  wire                           clk,
    input  wire                           rst_n,
    input  wire                           stop_IF,
    input  wire [`WIDTH_PCCTRL - 1:0]     PCCTRL,
    input  wire [`WIDTH_PC - 1:0]         branch_inst_pc,
    input  wire [`WIDTH_ALUOUT - 1:0]     branch_pc,
    input  wire [`WIDTH_COMPOUT - 1:0]    COMPOut,
    input  wire                           pred_taken_EX,
    input  wire [`WIDTH_PC - 1:0]         pred_target_EX,
    input  wire [`WIDTH_INST - 1:0]       inst_ID,
    output wire [`WIDTH_INST - 1:0]       inst,
    output wire [`WIDTH_PC - 1:0]         pc,
    output wire                           pred_taken,
    output wire [`WIDTH_PC - 1:0]         pred_target,
    output wire                           risk_Ctrl
);

localparam IF_BUF_DEPTH = 8;
localparam PTR_WIDTH    = 3;

reg [`WIDTH_INST - 1:0] if_buf [0:IF_BUF_DEPTH-1];
reg [`WIDTH_PC - 1:0]   if_buf_pc [0:IF_BUF_DEPTH-1];
reg [PTR_WIDTH-1:0]     buf_head;
reg [PTR_WIDTH-1:0]     buf_tail;
reg [PTR_WIDTH:0]       buf_count;

wire buf_full  = (buf_count == IF_BUF_DEPTH);
wire buf_empty = (buf_count == 0);

assign inst = buf_empty ? 32'h00000013 : if_buf[buf_head];
assign pc   = buf_empty ? 32'h00000000 : if_buf_pc[buf_head];

wire [`WIDTH_INST - 1:0] inst_irom;
wire fence_i_ID = (inst_ID[6:0] == 7'b0001111) && (inst_ID[14:12] == 3'b001);
reg  [`WIDTH_PC - 1:0]   pre_fetch_pc;
reg  [`WIDTH_PC - 1:0]   pre_fetch_pc_d;
reg                      irom_valid;

wire [`WIDTH_PCSEL - 1:0] PCSel;
BranchCTRL IF_branchCTRL (
    .PCCTRL(PCCTRL),
    .COMPOut(COMPOut),
    .PCSel(PCSel)
);

wire actual_is_branch = PCCTRL[`PCCTRL_B];
wire actual_is_jump   = PCCTRL[`PCCTRL_J];
wire actual_event     = actual_is_branch || actual_is_jump;
wire actual_taken     = PCSel;
wire [`WIDTH_PC - 1:0] actual_next_pc = actual_taken ? branch_pc : (branch_inst_pc + 32'd4);

wire target_wrong = actual_taken && pred_taken_EX && (pred_target_EX != branch_pc);
assign risk_Ctrl = actual_event && ((pred_taken_EX != actual_taken) || target_wrong);

wire pred_jump_raw;
wire [`WIDTH_PC - 1:0] pred_pc_raw;

BranchPredictor branchPredictor (
    .clk(clk),
    .rst_n(rst_n),
    .inst(inst),
    .pc(pc),
    .update_valid(actual_event && !stop_IF),
    .update_is_branch(actual_is_branch),
    .update_taken(actual_taken),
    .update_pc(branch_inst_pc),
    .update_target(branch_pc),
    .pre_pc(pred_pc_raw),
    .jump(pred_jump_raw)
);

assign pred_taken = !buf_empty && pred_jump_raw;
assign pred_target = pred_pc_raw;

InstMem IF_irom (
    .clk(clk),
    .rst_n(rst_n),
    .flush(fence_i_ID || risk_Ctrl || predict_redirect),
    .pc(pre_fetch_pc),
    .inst(inst_irom)
);

wire pop_en = !risk_Ctrl && !buf_empty && !stop_IF;
wire predict_redirect = pop_en && pred_taken;
wire fetch_blocked = risk_Ctrl || predict_redirect;
wire fetch_en = !fetch_blocked && !buf_full && !stop_IF;
wire push_en = !fetch_blocked && irom_valid && !buf_full;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        pre_fetch_pc   <= 32'h00000000;
        pre_fetch_pc_d <= 32'h00000000;
        irom_valid     <= 1'b0;
    end
    else if (risk_Ctrl) begin
        pre_fetch_pc   <= actual_next_pc;
        pre_fetch_pc_d <= actual_next_pc;
        irom_valid     <= 1'b0;
    end
    else if (predict_redirect) begin
        pre_fetch_pc   <= pred_target;
        pre_fetch_pc_d <= pred_target;
        irom_valid     <= 1'b0;
    end
    else if (fetch_en) begin
        pre_fetch_pc_d <= pre_fetch_pc;
        pre_fetch_pc   <= pre_fetch_pc + 32'd4;
        irom_valid     <= 1'b1;
    end
    else begin
        irom_valid     <= 1'b0;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        buf_head  <= {PTR_WIDTH{1'b0}};
        buf_tail  <= {PTR_WIDTH{1'b0}};
        buf_count <= {(PTR_WIDTH+1){1'b0}};
    end
    else if (risk_Ctrl || predict_redirect) begin
        buf_head  <= {PTR_WIDTH{1'b0}};
        buf_tail  <= {PTR_WIDTH{1'b0}};
        buf_count <= {(PTR_WIDTH+1){1'b0}};
    end
    else begin
        if (push_en) begin
            if_buf[buf_tail]    <= inst_irom;
            if_buf_pc[buf_tail] <= pre_fetch_pc_d;
            buf_tail <= buf_tail + 1'b1;
        end

        if (pop_en) begin
            buf_head <= buf_head + 1'b1;
        end

        case ({push_en, pop_en})
            2'b10: buf_count <= buf_count + 1'b1;
            2'b01: buf_count <= buf_count - 1'b1;
            default: buf_count <= buf_count;
        endcase
    end
end

endmodule
