`timescale 1ns / 1ps

module tb_reg_file;

    reg         clk = 1'b0;
    reg         rst_n = 1'b1;
    reg         reg_wr_en = 1'b0;
    reg         reg_rd_en = 1'b0;
    reg  [1:0]  reg_addr = 2'd0;
    reg  [31:0] reg_wdata = 32'd0;
    wire [31:0] reg_rdata;
    wire        iic_start;
    wire [7:0]  iic_dev_addr;
    wire [7:0]  iic_data;
    reg         iic_done = 1'b0;
    wire        spi_start;
    wire [7:0]  spi_data;
    reg         spi_done = 1'b0;
    wire        iic_busy;
    wire        iic_done_flag;
    wire        spi_busy;
    wire        spi_done_flag;

    reg [31:0] status = 32'd0;
    integer    errors = 0;

    reg_file dut (
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

    initial forever #5 clk = ~clk;

    task fail;
        input [1023:0] msg;
        begin
            errors = errors + 1;
            $display("[%0t] FAIL: %0s", $time, msg);
        end
    endtask

    task reg_write;
        input [1:0]  addr;
        input [31:0] data;
        begin
            @(negedge clk);
            reg_addr   = addr;
            reg_wdata  = data;
            reg_wr_en  = 1'b1;
            @(posedge clk);
            #1;
            @(negedge clk);
            reg_wr_en = 1'b0;
        end
    endtask

    task reg_read;
        input  [1:0]  addr;
        output [31:0] data;
        begin
            @(negedge clk);
            reg_addr  = addr;
            reg_rd_en = 1'b1;
            @(posedge clk);
            #1;
            data = reg_rdata;
            @(negedge clk);
            reg_rd_en = 1'b0;
        end
    endtask

    task pulse_iic_done;
        begin
            @(negedge clk);
            iic_done = 1'b1;
            @(posedge clk);
            #1;
            iic_done = 1'b0;
        end
    endtask

    task pulse_spi_done;
        begin
            @(negedge clk);
            spi_done = 1'b1;
            @(posedge clk);
            #1;
            spi_done = 1'b0;
        end
    endtask

    initial begin
        $dumpfile("tb_reg_file.vcd");
        $dumpvars(0, tb_reg_file);

        errors = 0;
        rst_n = 1'b0; // Create a real negedge at time 0 for async reset.

        repeat (5) @(posedge clk);
        rst_n = 1'b1;
        repeat (2) @(posedge clk);

        reg_write(2'd1, 32'h0000_50a5); // IIC_DATA register.
        if (iic_dev_addr != 8'h50) fail("IIC device address decode mismatch");
        if (iic_data != 8'ha5)     fail("IIC data decode mismatch");

        reg_write(2'd0, 32'h0000_0001); // CTRL bit0 is a one-cycle IIC trigger.
        if (!iic_start) fail("IIC start pulse missing");
        if (!iic_busy)  fail("IIC busy was not set by start");
        @(posedge clk);
        #1;
        if (iic_start) fail("IIC start pulse stayed high too long");

        pulse_iic_done();
        if (iic_busy)       fail("IIC busy did not clear on done");
        if (!iic_done_flag) fail("IIC done flag did not set");
        reg_read(2'd3, status);
        if (status[1] != 1'b1) fail("STATUS bit1 did not report iic_done");
        reg_read(2'd3, status);
        if (status[1] != 1'b0) fail("STATUS read did not clear iic_done");

        reg_write(2'd2, 32'h0000_005c); // SPI_DATA register.
        if (spi_data != 8'h5c) fail("SPI data decode mismatch");

        reg_write(2'd0, 32'h0000_0002); // CTRL bit1 is a one-cycle SPI trigger.
        if (!spi_start) fail("SPI start pulse missing");
        if (!spi_busy)  fail("SPI busy was not set by start");
        @(posedge clk);
        #1;
        if (spi_start) fail("SPI start pulse stayed high too long");

        pulse_spi_done();
        if (spi_busy)       fail("SPI busy did not clear on done");
        if (!spi_done_flag) fail("SPI done flag did not set");
        reg_read(2'd3, status);
        if (status[3] != 1'b1) fail("STATUS bit3 did not report spi_done");
        reg_read(2'd3, status);
        if (status[3] != 1'b0) fail("STATUS read did not clear spi_done");

        repeat (5) @(posedge clk);
        if (errors == 0) $display("[%0t] PASS: tb_reg_file", $time);
        else             $display("[%0t] FAIL: tb_reg_file found %0d error(s)", $time, errors);
        $finish;
    end

endmodule
