`timescale 1ns / 1ps

module reg_file(
    input  wire        clk,
    input  wire        rst_n,

    input  wire        reg_wr_en,
    input  wire        reg_rd_en,
    input  wire [1:0]  reg_addr,
    input  wire [31:0] reg_wdata,
    output reg  [31:0] reg_rdata,

    output reg         iic_start,
    output wire [7:0]  iic_dev_addr,
    output wire [7:0]  iic_data,
    input  wire        iic_done,

    output reg         spi_start,
    output wire [7:0]  spi_data,
    input  wire        spi_done,

    output reg         iic_busy,
    output reg         iic_done_flag,
    output reg         spi_busy,
    output reg         spi_done_flag
    );

    localparam REG_CTRL    = 2'd0;
    localparam REG_IICDATA = 2'd1;
    localparam REG_SPIDATA = 2'd2;
    localparam REG_STATUS  = 2'd3;

    reg [31:0] iic_data_reg;
    reg [31:0] spi_data_reg;

    assign iic_dev_addr = iic_data_reg[15:8];
    assign iic_data     = iic_data_reg[7:0];
    assign spi_data     = spi_data_reg[7:0];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            iic_data_reg  <= 32'd0;
            spi_data_reg  <= 32'd0;
            reg_rdata     <= 32'd0;
            iic_start     <= 1'b0;
            spi_start     <= 1'b0;
            iic_busy      <= 1'b0;
            iic_done_flag <= 1'b0;
            spi_busy      <= 1'b0;
            spi_done_flag <= 1'b0;
        end else begin
            iic_start <= 1'b0;
            spi_start <= 1'b0;

            if (iic_done) begin
                iic_busy      <= 1'b0;
                iic_done_flag <= 1'b1;
            end

            if (spi_done) begin
                spi_busy      <= 1'b0;
                spi_done_flag <= 1'b1;
            end

            if (reg_wr_en) begin
                case (reg_addr)
                    REG_CTRL: begin
                        // CTRL writes generate one-cycle triggers; busy blocks repeated starts.
                        if (reg_wdata[0] && !iic_busy) begin
                            iic_start     <= 1'b1;
                            iic_busy      <= 1'b1;
                            iic_done_flag <= 1'b0;
                        end
                        if (reg_wdata[1] && !spi_busy) begin
                            spi_start     <= 1'b1;
                            spi_busy      <= 1'b1;
                            spi_done_flag <= 1'b0;
                        end
                    end

                    REG_IICDATA: begin
                        iic_data_reg <= reg_wdata;
                    end

                    REG_SPIDATA: begin
                        spi_data_reg <= reg_wdata;
                    end

                    default: begin
                    end
                endcase
            end

            if (reg_rd_en) begin
                case (reg_addr)
                    REG_CTRL: begin
                        reg_rdata <= 32'd0;
                    end

                    REG_IICDATA: begin
                        reg_rdata <= iic_data_reg;
                    end

                    REG_SPIDATA: begin
                        reg_rdata <= spi_data_reg;
                    end

                    REG_STATUS: begin
                        // STATUS: bit0 iic_busy, bit1 iic_done, bit2 spi_busy, bit3 spi_done.
                        reg_rdata <= {
                            28'd0,
                            (spi_done_flag || spi_done),
                            (spi_busy && !spi_done),
                            (iic_done_flag || iic_done),
                            (iic_busy && !iic_done)
                        };
                        iic_done_flag <= 1'b0;
                        spi_done_flag <= 1'b0;
                    end

                    default: begin
                        reg_rdata <= 32'd0;
                    end
                endcase
            end
        end
    end

endmodule
