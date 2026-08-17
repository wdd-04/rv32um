`timescale 1ns / 1ps

module tb_spi_master;

    reg        clk = 1'b0;
    reg        rst_n = 1'b1;
    reg        spi_start = 1'b0;
    reg [7:0]  data_in = 8'h5c;
    wire       spi_done;
    wire       sck;
    wire       mosi;
    wire       cs;

    reg [7:0]  rx_shift = 8'd0;
    reg [7:0]  rx_data = 8'd0;
    reg        rx_valid = 1'b0;
    integer    errors = 0;
    integer    bit_i = 0;

    spi_master #(
        .CLK_DIV(4)
    ) dut (
        .clk       (clk),
        .rst_n     (rst_n),
        .spi_start (spi_start),
        .data_in   (data_in),
        .spi_done  (spi_done),
        .sck       (sck),
        .mosi      (mosi),
        .cs        (cs)
    );

    initial forever #5 clk = ~clk;

    task fail;
        input [1023:0] msg;
        begin
            errors = errors + 1;
            $display("[%0t] FAIL: %0s", $time, msg);
        end
    endtask

    initial begin
        forever begin
            @(negedge cs);
            rx_shift = 8'd0;
            rx_valid = 1'b0;
            for (bit_i = 0; bit_i < 8; bit_i = bit_i + 1) begin
                @(posedge sck);
                #1;
                rx_shift = {rx_shift[6:0], mosi}; // SPI mode 0 samples on rising SCK.
            end
            @(posedge cs);
            rx_data  = rx_shift;
            rx_valid = 1'b1;
        end
    end

    initial begin
        $dumpfile("tb_spi_master.vcd");
        $dumpvars(0, tb_spi_master);

        errors = 0;
        rst_n = 1'b0; // Create a real negedge at time 0 for async reset.

        repeat (5) @(posedge clk);
        rst_n = 1'b1;
        repeat (2) @(posedge clk);

        @(negedge clk);
        spi_start = 1'b1;
        @(negedge clk);
        spi_start = 1'b0;

        wait (spi_done);
        repeat (2) @(posedge clk);
        if (!rx_valid)       fail("SPI slave model did not receive a byte");
        if (rx_data != 8'h5c) fail("SPI received data mismatch");
        if (cs != 1'b1)       fail("CS did not return high");
        if (sck != 1'b0)      fail("SCK did not return to mode-0 idle low");

        repeat (5) @(posedge clk);
        if (errors == 0) $display("[%0t] PASS: tb_spi_master", $time);
        else             $display("[%0t] FAIL: tb_spi_master found %0d error(s)", $time, errors);
        $finish;
    end

endmodule
