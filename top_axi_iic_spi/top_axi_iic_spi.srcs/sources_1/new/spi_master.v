`timescale 1ns / 1ps

module spi_master #(
    parameter integer CLK_DIV = 10
    )(
    input  wire       clk,
    input  wire       rst_n,
    input  wire       spi_start,
    input  wire [7:0] data_in,
    output reg        spi_done,
    output reg        sck,
    output reg        mosi,
    output reg        cs
    );

    localparam integer HALF_DIV = (CLK_DIV <= 2) ? 1 : (CLK_DIV / 2);

    localparam IDLE = 2'd0;
    localparam SEND = 2'd1;
    localparam DONE = 2'd2;

    reg [1:0]  state;
    reg [2:0]  bit_cnt;
    reg [7:0]  shift_reg;
    reg [31:0] div_cnt;

    wire div_tick = (div_cnt == (HALF_DIV - 1));

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= IDLE;
            bit_cnt   <= 3'd0;
            shift_reg <= 8'd0;
            div_cnt   <= 32'd0;
            spi_done  <= 1'b0;
            sck       <= 1'b0;
            mosi      <= 1'b0;
            cs        <= 1'b1;
        end else begin
            spi_done <= 1'b0;

            if (state == SEND) begin
                if (div_tick) begin
                    div_cnt <= 32'd0;
                end else begin
                    div_cnt <= div_cnt + 1'b1;
                end
            end else begin
                div_cnt <= 32'd0;
            end

            case (state)
                IDLE: begin
                    sck <= 1'b0;  // SPI mode 0: CPOL=0, idle clock is low.
                    cs  <= 1'b1;
                    if (spi_start) begin
                        shift_reg <= data_in;
                        mosi      <= data_in[7]; // CPHA=0: first bit is stable before first rising edge.
                        bit_cnt   <= 3'd0;
                        cs        <= 1'b0;
                        state     <= SEND;
                    end
                end

                SEND: begin
                    if (div_tick) begin
                        if (!sck) begin
                            sck <= 1'b1; // Slave samples MOSI on this rising edge.
                        end else begin
                            sck <= 1'b0; // Master changes MOSI on the falling edge.
                            if (bit_cnt == 3'd7) begin
                                cs    <= 1'b1;
                                mosi  <= 1'b0;
                                state <= DONE;
                            end else begin
                                bit_cnt   <= bit_cnt + 1'b1;
                                shift_reg <= {shift_reg[6:0], 1'b0};
                                mosi      <= shift_reg[6];
                            end
                        end
                    end
                end

                DONE: begin
                    spi_done <= 1'b1;
                    state    <= IDLE;
                end

                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
