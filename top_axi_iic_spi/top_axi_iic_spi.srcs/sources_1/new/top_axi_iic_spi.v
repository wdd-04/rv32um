`timescale 1ns / 1ps

module top_axi_iic_spi #(
    parameter integer IIC_CLK_DIV = 1000,
    parameter integer SPI_CLK_DIV = 10
    )(
    input  wire        clk,
    input  wire        rst_n,

    input  wire        awvalid,
    output wire        awready,
    input  wire [31:0] awaddr,
    input  wire        wvalid,
    output wire        wready,
    input  wire [31:0] wdata,
    output wire        bvalid,
    input  wire        bready,
    output wire [1:0]  bresp,

    input  wire        arvalid,
    output wire        arready,
    input  wire [31:0] araddr,
    output wire        rvalid,
    input  wire        rready,
    output wire [31:0] rdata,
    output wire [1:0]  rresp,

    output wire        iic_scl,
    inout  wire        iic_sda,

    output wire        spi_sck,
    output wire        spi_mosi,
    output wire        spi_cs
    );

    wire        reg_wr_en;
    wire        reg_rd_en;
    wire [1:0]  reg_addr;
    wire [31:0] reg_wdata;
    wire [31:0] reg_rdata;

    wire        iic_start;
    wire [7:0]  iic_dev_addr;
    wire [7:0]  iic_data;
    wire        iic_done;

    wire        spi_start;
    wire [7:0]  spi_data;
    wire        spi_done;

    wire        iic_busy;
    wire        iic_done_flag;
    wire        spi_busy;
    wire        spi_done_flag;

    // AXI4-Lite slave turns bus handshakes into one-cycle register pulses.
    axi_lite_slave u_axi_lite_slave (
        .clk        (clk),
        .rst_n      (rst_n),
        .awvalid    (awvalid),
        .awready    (awready),
        .awaddr     (awaddr),
        .wvalid     (wvalid),
        .wready     (wready),
        .wdata      (wdata),
        .bvalid     (bvalid),
        .bready     (bready),
        .bresp      (bresp),
        .arvalid    (arvalid),
        .arready    (arready),
        .araddr     (araddr),
        .rvalid     (rvalid),
        .rready     (rready),
        .rdata      (rdata),
        .rresp      (rresp),
        .reg_wr_en  (reg_wr_en),
        .reg_rd_en  (reg_rd_en),
        .reg_addr   (reg_addr),
        .reg_wdata  (reg_wdata),
        .reg_rdata  (reg_rdata)
    );

    // Register file implements CTRL/IIC_DATA/SPI_DATA/STATUS at 0x00/0x04/0x08/0x0c.
    reg_file u_reg_file (
        .clk           (clk),
        .rst_n         (rst_n),
        .reg_wr_en     (reg_wr_en),
        .reg_rd_en     (reg_rd_en),
        .reg_addr      (reg_addr),
        .reg_wdata     (reg_wdata),
        .reg_rdata     (reg_rdata),
        .iic_start     (iic_start),
        .iic_dev_addr  (iic_dev_addr),
        .iic_data      (iic_data),
        .iic_done      (iic_done),
        .spi_start     (spi_start),
        .spi_data      (spi_data),
        .spi_done      (spi_done),
        .iic_busy      (iic_busy),
        .iic_done_flag (iic_done_flag),
        .spi_busy      (spi_busy),
        .spi_done_flag (spi_done_flag)
    );

    iic_master #(
        .CLK_DIV(IIC_CLK_DIV)
    ) u_iic_master (
        .clk       (clk),
        .rst_n     (rst_n),
        .iic_start (iic_start),
        .dev_addr  (iic_dev_addr),
        .data      (iic_data),
        .iic_done  (iic_done),
        .scl       (iic_scl),
        .sda       (iic_sda)
    );

    spi_master #(
        .CLK_DIV(SPI_CLK_DIV)
    ) u_spi_master (
        .clk       (clk),
        .rst_n     (rst_n),
        .spi_start (spi_start),
        .data_in   (spi_data),
        .spi_done  (spi_done),
        .sck       (spi_sck),
        .mosi      (spi_mosi),
        .cs        (spi_cs)
    );

endmodule
