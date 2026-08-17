`timescale 1ns / 1ps

module iic_master #(
    parameter integer CLK_DIV = 1000
    )(
    input  wire       clk,
    input  wire       rst_n,
    input  wire       iic_start,
    input  wire [7:0] dev_addr,
    input  wire [7:0] data,
    output reg        iic_done,
    output reg        scl,
    inout  wire       sda
    );

    localparam integer HALF_DIV = (CLK_DIV <= 2) ? 1 : (CLK_DIV / 2);

    localparam IDLE      = 3'd0;
    localparam START     = 3'd1;
    localparam SEND_ADDR = 3'd2;
    localparam WAIT_ACK1 = 3'd3;
    localparam SEND_DATA = 3'd4;
    localparam WAIT_ACK2 = 3'd5;
    localparam STOP      = 3'd6;

    reg [2:0]  state;
    reg [3:0]  bit_cnt;
    reg [7:0]  addr_shift;
    reg [7:0]  data_shift;
    reg [31:0] div_cnt;
    reg        phase;
    reg        sda_out;
    reg        sda_oe;
    reg        ack_sample;

    wire div_tick = (div_cnt == (HALF_DIV - 1));

    assign sda = sda_oe ? sda_out : 1'bz;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state      <= IDLE;
            bit_cnt    <= 4'd0;
            addr_shift <= 8'd0;
            data_shift <= 8'd0;
            div_cnt    <= 32'd0;
            phase      <= 1'b0;
            sda_out    <= 1'b0;
            sda_oe     <= 1'b0;
            scl        <= 1'b1;
            iic_done   <= 1'b0;
            ack_sample <= 1'b1;
        end else begin
            iic_done <= 1'b0;

            if (state == IDLE) begin
                div_cnt <= 32'd0;
            end else if (div_tick) begin
                div_cnt <= 32'd0;
            end else begin
                div_cnt <= div_cnt + 1'b1;
            end

            case (state)
                IDLE: begin
                    scl     <= 1'b1;
                    sda_out <= 1'b1;
                    sda_oe  <= 1'b0;
                    phase   <= 1'b0;
                    if (iic_start) begin
                        addr_shift <= dev_addr;
                        data_shift <= data;
                        state      <= START;
                    end
                end

                START: begin
                    if (div_tick) begin
                        if (!phase) begin
                            // START condition: SDA falls while SCL is high.
                            scl     <= 1'b1;
                            sda_out <= 1'b0;
                            sda_oe  <= 1'b1;
                            phase   <= 1'b1;
                        end else begin
                            scl     <= 1'b0;
                            bit_cnt <= 4'd7;
                            phase   <= 1'b0;
                            if (addr_shift[7]) begin
                                sda_out <= 1'b1;
                                sda_oe  <= 1'b0;
                            end else begin
                                sda_out <= 1'b0;
                                sda_oe  <= 1'b1;
                            end
                            state <= SEND_ADDR;
                        end
                    end
                end

                SEND_ADDR: begin
                    if (div_tick) begin
                        if (!scl) begin
                            scl <= 1'b1;
                        end else begin
                            scl <= 1'b0;
                            if (bit_cnt == 4'd0) begin
                                sda_out <= 1'b1;
                                sda_oe  <= 1'b0;
                                state   <= WAIT_ACK1;
                            end else begin
                                bit_cnt <= bit_cnt - 1'b1;
                                if (addr_shift[bit_cnt - 1'b1]) begin
                                    sda_out <= 1'b1;
                                    sda_oe  <= 1'b0;
                                end else begin
                                    sda_out <= 1'b0;
                                    sda_oe  <= 1'b1;
                                end
                            end
                        end
                    end
                end

                WAIT_ACK1: begin
                    if (div_tick) begin
                        if (!scl) begin
                            // Ninth SCL high level is the ACK sample point.
                            scl        <= 1'b1;
                            ack_sample <= sda;
                        end else begin
                            scl     <= 1'b0;
                            bit_cnt <= 4'd7;
                            if (data_shift[7]) begin
                                sda_out <= 1'b1;
                                sda_oe  <= 1'b0;
                            end else begin
                                sda_out <= 1'b0;
                                sda_oe  <= 1'b1;
                            end
                            state <= SEND_DATA;
                        end
                    end
                end

                SEND_DATA: begin
                    if (div_tick) begin
                        if (!scl) begin
                            scl <= 1'b1;
                        end else begin
                            scl <= 1'b0;
                            if (bit_cnt == 4'd0) begin
                                sda_out <= 1'b1;
                                sda_oe  <= 1'b0;
                                state   <= WAIT_ACK2;
                            end else begin
                                bit_cnt <= bit_cnt - 1'b1;
                                if (data_shift[bit_cnt - 1'b1]) begin
                                    sda_out <= 1'b1;
                                    sda_oe  <= 1'b0;
                                end else begin
                                    sda_out <= 1'b0;
                                    sda_oe  <= 1'b1;
                                end
                            end
                        end
                    end
                end

                WAIT_ACK2: begin
                    if (div_tick) begin
                        if (!scl) begin
                            scl        <= 1'b1;
                            ack_sample <= sda;
                        end else begin
                            scl     <= 1'b0;
                            sda_out <= 1'b0;
                            sda_oe  <= 1'b1;
                            phase   <= 1'b0;
                            state   <= STOP;
                        end
                    end
                end

                STOP: begin
                    if (div_tick) begin
                        if (!phase) begin
                            scl     <= 1'b1;
                            sda_out <= 1'b0;
                            sda_oe  <= 1'b1;
                            phase   <= 1'b1;
                        end else begin
                            // STOP condition: SDA rises while SCL is high.
                            scl      <= 1'b1;
                            sda_out  <= 1'b1;
                            sda_oe   <= 1'b0;
                            iic_done <= 1'b1;
                            phase    <= 1'b0;
                            state    <= IDLE;
                        end
                    end
                end

                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
