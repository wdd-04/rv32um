`timescale 1ns / 1ps

module tb_iic_master;

    reg        clk = 1'b0;
    reg        rst_n = 1'b1;
    reg        iic_start = 1'b0;
    reg [7:0]  dev_addr = 8'h50;
    reg [7:0]  data = 8'ha5;
    wire       iic_done;
    wire       scl;
    wire       sda;

    reg        sda_ack_drive = 1'b0;
    reg [7:0]  rx_addr = 8'd0;
    reg [7:0]  rx_data = 8'd0;
    reg        rx_valid = 1'b0;
    integer    errors = 0;

    assign sda = sda_ack_drive ? 1'b0 : 1'bz;
    pullup(sda);

    iic_master #(
        .CLK_DIV(4)
    ) dut (
        .clk       (clk),
        .rst_n     (rst_n),
        .iic_start (iic_start),
        .dev_addr  (dev_addr),
        .data      (data),
        .iic_done  (iic_done),
        .scl       (scl),
        .sda       (sda)
    );

    initial forever #5 clk = ~clk;

    task fail;
        input [1023:0] msg;
        begin
            errors = errors + 1;
            $display("[%0t] FAIL: %0s", $time, msg);
        end
    endtask

    task recv_byte;
        output [7:0] value;
        integer bit_i;
        begin
            value = 8'd0;
            for (bit_i = 0; bit_i < 8; bit_i = bit_i + 1) begin
                @(posedge scl);
                #1;
                value = {value[6:0], sda};
            end
        end
    endtask

    task send_ack;
        begin
            @(negedge scl);
            sda_ack_drive = 1'b1;
            @(posedge scl);
            @(negedge scl);
            sda_ack_drive = 1'b0;
        end
    endtask

    initial begin
        forever begin
            @(negedge sda);
            if (scl) begin
                recv_byte(rx_addr);
                send_ack();
                recv_byte(rx_data);
                send_ack();
                wait (scl == 1'b1);
                @(posedge sda); // STOP condition: SDA rises while SCL is high.
                rx_valid = 1'b1;
            end
        end
    end

    initial begin
        $dumpfile("tb_iic_master.vcd");
        $dumpvars(0, tb_iic_master);

        errors = 0;
        rst_n = 1'b0; // Create a real negedge at time 0 for async reset.

        repeat (5) @(posedge clk);
        rst_n = 1'b1;
        repeat (2) @(posedge clk);

        @(negedge clk);
        iic_start = 1'b1;
        @(negedge clk);
        iic_start = 1'b0;

        wait (iic_done);
        repeat (2) @(posedge clk);
        if (!rx_valid)       fail("IIC slave model did not see STOP");
        if (rx_addr != 8'h50) fail("IIC address byte mismatch");
        if (rx_data != 8'ha5) fail("IIC data byte mismatch");
        if (scl != 1'b1)      fail("SCL did not return high after STOP");

        repeat (5) @(posedge clk);
        if (errors == 0) $display("[%0t] PASS: tb_iic_master", $time);
        else             $display("[%0t] FAIL: tb_iic_master found %0d error(s)", $time, errors);
        $finish;
    end

endmodule
