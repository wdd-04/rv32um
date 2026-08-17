`timescale 1ns / 1ps

module tb_top;

    reg         clk = 1'b0;
    reg         rst_n = 1'b1;
    reg         awvalid = 1'b0;
    wire        awready;
    reg  [31:0] awaddr = 32'd0;
    reg         wvalid = 1'b0;
    wire        wready;
    reg  [31:0] wdata = 32'd0;
    wire        bvalid;
    reg         bready = 1'b0;
    wire [1:0]  bresp;
    reg         arvalid = 1'b0;
    wire        arready;
    reg  [31:0] araddr = 32'd0;
    wire        rvalid;
    reg         rready = 1'b0;
    wire [31:0] rdata;
    wire [1:0]  rresp;
    wire        iic_scl;
    wire        iic_sda;
    wire        spi_sck;
    wire        spi_mosi;
    wire        spi_cs;

    reg         iic_sda_ack_drive = 1'b0;
    reg  [7:0]  iic_rx_addr = 8'd0;
    reg  [7:0]  iic_rx_data = 8'd0;
    reg         iic_rx_valid = 1'b0;

    reg  [7:0]  spi_rx_shift = 8'd0;
    reg  [7:0]  spi_rx_data = 8'd0;
    reg         spi_rx_valid = 1'b0;

    integer     errors = 0;
    integer     i = 0;
    reg [31:0]  status = 32'd0;

    assign iic_sda = iic_sda_ack_drive ? 1'b0 : 1'bz;
    pullup(iic_sda);

    top_axi_iic_spi #(
        .IIC_CLK_DIV(4),
        .SPI_CLK_DIV(4)
    ) dut (
        .clk      (clk),
        .rst_n    (rst_n),
        .awvalid  (awvalid),
        .awready  (awready),
        .awaddr   (awaddr),
        .wvalid   (wvalid),
        .wready   (wready),
        .wdata    (wdata),
        .bvalid   (bvalid),
        .bready   (bready),
        .bresp    (bresp),
        .arvalid  (arvalid),
        .arready  (arready),
        .araddr   (araddr),
        .rvalid   (rvalid),
        .rready   (rready),
        .rdata    (rdata),
        .rresp     (rresp),
        .iic_scl  (iic_scl),
        .iic_sda  (iic_sda),
        .spi_sck  (spi_sck),
        .spi_mosi (spi_mosi),
        .spi_cs   (spi_cs)
    );

    initial forever #5 clk = ~clk; // 100 MHz system clock.

    task fail;
        input [1023:0] msg;
        begin
            errors = errors + 1;
            $display("[%0t] FAIL: %0s", $time, msg);
        end
    endtask

    task axi_write;
        input [31:0] addr;
        input [31:0] data;
        integer timeout;
        begin
            @(negedge clk);
            awaddr  = addr;
            wdata   = data;
            awvalid = 1'b1;
            wvalid  = 1'b1;
            bready  = 1'b0;

            timeout = 0;
            while (!(awready && wready)) begin
                @(negedge clk);
                timeout = timeout + 1;
                if (timeout > 100) begin
                    fail("AXI write address/data handshake timeout");
                    disable axi_write;
                end
            end
            @(posedge clk);
            #1;
            awvalid = 1'b0;
            wvalid  = 1'b0;

            bready = 1'b1;
            timeout = 0;
            while (!bvalid) begin
                @(posedge clk);
                #1;
                timeout = timeout + 1;
                if (timeout > 100) begin
                    fail("AXI write response timeout");
                    disable axi_write;
                end
            end
            if (bresp != 2'b00) fail("AXI write response is not OKAY");
            @(posedge clk);
            #1;
            bready = 1'b0;
            @(negedge clk);
        end
    endtask

    task axi_read;
        input  [31:0] addr;
        output [31:0] data;
        integer timeout;
        begin
            @(negedge clk);
            araddr  = addr;
            arvalid = 1'b1;
            rready  = 1'b0;

            timeout = 0;
            while (!arready) begin
                @(negedge clk);
                timeout = timeout + 1;
                if (timeout > 100) begin
                    fail("AXI read address handshake timeout");
                    disable axi_read;
                end
            end
            @(posedge clk);
            #1;
            arvalid = 1'b0;

            rready = 1'b1;
            timeout = 0;
            while (!rvalid) begin
                @(posedge clk);
                #1;
                timeout = timeout + 1;
                if (timeout > 100) begin
                    fail("AXI read data timeout");
                    disable axi_read;
                end
            end
            data = rdata;
            if (rresp != 2'b00) fail("AXI read response is not OKAY");
            @(posedge clk);
            #1;
            rready = 1'b0;
            @(negedge clk);
        end
    endtask

    task poll_status_bit;
        input integer bit_index;
        integer timeout;
        reg [31:0] rd_status;
        begin
            status = 32'd0;
            rd_status = 32'd0;
            timeout = 0;
            while (!rd_status[bit_index] && timeout < 80) begin
                axi_read(32'h0000_000c, rd_status);
                status = rd_status; // Keep the waveform status signal synchronized with each poll.
                if (!rd_status[bit_index]) repeat (4) @(posedge clk);
                timeout = timeout + 1;
            end
            if (!rd_status[bit_index]) fail("STATUS polling timeout");
        end
    endtask

    task iic_recv_byte;
        output [7:0] value;
        integer bit_i;
        begin
            value = 8'd0;
            for (bit_i = 0; bit_i < 8; bit_i = bit_i + 1) begin
                @(posedge iic_scl);
                #1;
                value = {value[6:0], iic_sda};
            end
        end
    endtask

    task iic_send_ack;
        begin
            // ACK is driven low only for the ninth clock and released immediately after.
            @(negedge iic_scl);
            iic_sda_ack_drive = 1'b1;
            @(posedge iic_scl);
            @(negedge iic_scl);
            iic_sda_ack_drive = 1'b0;
        end
    endtask

    initial begin
        forever begin
            @(negedge iic_sda);
            if (iic_scl) begin
                iic_recv_byte(iic_rx_addr);
                iic_send_ack();
                iic_recv_byte(iic_rx_data);
                iic_send_ack();
                wait (iic_scl == 1'b1);
                @(posedge iic_sda);
                iic_rx_valid = 1'b1;
            end
        end
    end

    initial begin
        forever begin
            @(negedge spi_cs);
            spi_rx_shift = 8'd0;
            spi_rx_valid = 1'b0;
            for (i = 0; i < 8; i = i + 1) begin
                @(posedge spi_sck);
                #1;
                spi_rx_shift = {spi_rx_shift[6:0], spi_mosi};
            end
            @(posedge spi_cs);
            spi_rx_data  = spi_rx_shift;
            spi_rx_valid = 1'b1;
        end
    end

    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, tb_top);

        errors = 0;
        rst_n = 1'b0; // Create a real negedge at time 0 for async reset.

        repeat (8) @(posedge clk);
        rst_n = 1'b1;
        repeat (4) @(posedge clk);

        axi_write(32'h0000_0004, 32'h0000_50a5); // IIC_DATA: address byte 0x50, data byte 0xa5.
        axi_write(32'h0000_0000, 32'h0000_0001); // CTRL bit0 triggers one IIC transfer.
        poll_status_bit(1);
        if (!iic_rx_valid) fail("IIC slave model did not receive a frame");
        if (iic_rx_addr != 8'h50) fail("IIC address byte mismatch");
        if (iic_rx_data != 8'ha5) fail("IIC data byte mismatch");

        axi_write(32'h0000_0008, 32'h0000_005c); // SPI_DATA: one byte to send.
        axi_write(32'h0000_0000, 32'h0000_0002); // CTRL bit1 triggers one SPI transfer.
        poll_status_bit(3);
        if (!spi_rx_valid) fail("SPI slave model did not receive a byte");
        if (spi_rx_data != 8'h5c) fail("SPI data byte mismatch");

        repeat (10) @(posedge clk);
        if (errors == 0) begin
            $display("[%0t] PASS: tb_top completed IIC/SPI AXI register test", $time);
        end else begin
            $display("[%0t] FAIL: tb_top found %0d error(s)", $time, errors);
        end
        $finish;
    end

endmodule
