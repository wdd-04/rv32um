`timescale 1ns / 1ps

module axi_lite_slave(
    input  wire        clk,
    input  wire        rst_n,

    input  wire        awvalid,
    output wire        awready,
    input  wire [31:0] awaddr,

    input  wire        wvalid,
    output wire        wready,
    input  wire [31:0] wdata,

    output reg         bvalid,
    input  wire        bready,
    output reg  [1:0]  bresp,

    input  wire        arvalid,
    output wire        arready,
    input  wire [31:0] araddr,

    output reg         rvalid,
    input  wire        rready,
    output reg  [31:0] rdata,
    output reg  [1:0]  rresp,

    output reg         reg_wr_en,
    output reg         reg_rd_en,
    output reg  [1:0]  reg_addr,
    output reg  [31:0] reg_wdata,
    input  wire [31:0] reg_rdata
    );

    localparam W_COLLECT = 2'd0;
    localparam W_DO      = 2'd1;
    localparam W_RESP    = 2'd2;

    localparam R_IDLE = 2'd0;
    localparam R_REQ  = 2'd1;
    localparam R_WAIT = 2'd2;
    localparam R_RESP = 2'd3;

    reg [1:0]  wstate;
    reg [1:0]  rstate;
    reg        aw_seen;
    reg        w_seen;
    reg [31:0] awaddr_latched;
    reg [31:0] wdata_latched;

    wire aw_fire = awvalid && awready;
    wire w_fire  = wvalid  && wready;
    wire have_aw = aw_seen || aw_fire;
    wire have_w  = w_seen  || w_fire;

    // This simple slave serializes read and write accesses, matching the single-register-port design.
    assign awready = (wstate == W_COLLECT) && !aw_seen && (rstate == R_IDLE);
    assign wready  = (wstate == W_COLLECT) && !w_seen  && (rstate == R_IDLE);
    assign arready = (rstate == R_IDLE) && (wstate == W_COLLECT) &&
                     !aw_seen && !w_seen && !awvalid && !wvalid;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wstate         <= W_COLLECT;
            rstate         <= R_IDLE;
            aw_seen        <= 1'b0;
            w_seen         <= 1'b0;
            awaddr_latched <= 32'd0;
            wdata_latched  <= 32'd0;
            bvalid         <= 1'b0;
            bresp          <= 2'b00;
            rvalid         <= 1'b0;
            rdata          <= 32'd0;
            rresp          <= 2'b00;
            reg_wr_en      <= 1'b0;
            reg_rd_en      <= 1'b0;
            reg_addr       <= 2'd0;
            reg_wdata      <= 32'd0;
        end else begin
            reg_wr_en <= 1'b0;
            reg_rd_en <= 1'b0;

            case (wstate)
                W_COLLECT: begin
                    // AXI write address and data may arrive in different cycles; latch both before writing.
                    if (aw_fire) begin
                        aw_seen        <= 1'b1;
                        awaddr_latched <= awaddr;
                    end
                    if (w_fire) begin
                        w_seen        <= 1'b1;
                        wdata_latched <= wdata;
                    end

                    if (have_aw && have_w) begin
                        reg_addr  <= aw_seen ? awaddr_latched[3:2] : awaddr[3:2];
                        reg_wdata <= w_seen  ? wdata_latched       : wdata;
                        aw_seen   <= 1'b0;
                        w_seen    <= 1'b0;
                        wstate    <= W_DO;
                    end
                end

                W_DO: begin
                    reg_wr_en <= 1'b1;
                    bvalid    <= 1'b1;
                    bresp     <= 2'b00;
                    wstate    <= W_RESP;
                end

                W_RESP: begin
                    if (bvalid && bready) begin
                        bvalid <= 1'b0;
                        wstate <= W_COLLECT;
                    end
                end

                default: begin
                    wstate <= W_COLLECT;
                end
            endcase

            case (rstate)
                R_IDLE: begin
                    if (arvalid && arready) begin
                        reg_addr <= araddr[3:2];
                        rstate   <= R_REQ;
                    end
                end

                R_REQ: begin
                    // One-cycle read pulse; reg_file returns data on reg_rdata for R_WAIT.
                    reg_rd_en <= 1'b1;
                    rstate    <= R_WAIT;
                end

                R_WAIT: begin
                    rdata  <= reg_rdata;
                    rresp  <= 2'b00;
                    rvalid <= 1'b1;
                    rstate <= R_RESP;
                end

                R_RESP: begin
                    if (rvalid && rready) begin
                        rvalid <= 1'b0;
                        rstate <= R_IDLE;
                    end
                end

                default: begin
                    rstate <= R_IDLE;
                end
            endcase
        end
    end

endmodule
