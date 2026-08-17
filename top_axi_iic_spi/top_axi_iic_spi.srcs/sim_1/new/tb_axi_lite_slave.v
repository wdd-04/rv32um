`timescale 1ns / 1ps

module tb_axi_lite_slave;

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
    wire        reg_wr_en;
    wire        reg_rd_en;
    wire [1:0]  reg_addr;
    wire [31:0] reg_wdata;
    reg  [31:0] reg_rdata = 32'd0;

    reg [31:0] mem [0:3];
    reg [31:0] read_back = 32'd0;
    integer    errors = 0;

    axi_lite_slave dut (
        .clk       (clk),
        .rst_n     (rst_n),
        .awvalid   (awvalid),
        .awready   (awready),
        .awaddr    (awaddr),
        .wvalid    (wvalid),
        .wready    (wready),
        .wdata     (wdata),
        .bvalid    (bvalid),
        .bready    (bready),
        .bresp     (bresp),
        .arvalid   (arvalid),
        .arready   (arready),
        .araddr    (araddr),
        .rvalid    (rvalid),
        .rready    (rready),
        .rdata     (rdata),
        .rresp     (rresp),
        .reg_wr_en (reg_wr_en),
        .reg_rd_en (reg_rd_en),
        .reg_addr  (reg_addr),
        .reg_wdata (reg_wdata),
        .reg_rdata (reg_rdata)
    );

    initial forever #5 clk = ~clk;

    always @(*) begin
        case (reg_addr)
            2'd0: reg_rdata = mem[0];
            2'd1: reg_rdata = mem[1];
            2'd2: reg_rdata = mem[2];
            2'd3: reg_rdata = mem[3];
            default: reg_rdata = 32'd0;
        endcase
    end

    always @(posedge clk) begin
        if (reg_wr_en) mem[reg_addr] <= reg_wdata; // Register write pulse from AXI slave.
    end

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
                    fail("AXI write handshake timeout");
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
                    fail("AXI read address timeout");
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
        end
    endtask

    initial begin
        $dumpfile("tb_axi_lite_slave.vcd");
        $dumpvars(0, tb_axi_lite_slave);

        errors = 0;
        mem[0] = 32'd0;
        mem[1] = 32'd0;
        mem[2] = 32'd0;
        mem[3] = 32'd0;
        rst_n = 1'b0; // Create a real negedge at time 0 for async reset.

        repeat (5) @(posedge clk);
        rst_n = 1'b1;
        repeat (2) @(posedge clk);

        axi_write(32'h0000_0004, 32'h1234_5678);
        if (mem[1] != 32'h1234_5678) fail("write pulse did not update register index 1");

        axi_read(32'h0000_0004, read_back);
        if (read_back != 32'h1234_5678) fail("read data mismatch at address 0x04");

        axi_write(32'h0000_000c, 32'ha5a5_5a5a);
        axi_read(32'h0000_000c, read_back);
        if (read_back != 32'ha5a5_5a5a) fail("read data mismatch at address 0x0c");

        repeat (5) @(posedge clk);
        if (errors == 0) $display("[%0t] PASS: tb_axi_lite_slave", $time);
        else             $display("[%0t] FAIL: tb_axi_lite_slave found %0d error(s)", $time, errors);
        $finish;
    end

endmodule
