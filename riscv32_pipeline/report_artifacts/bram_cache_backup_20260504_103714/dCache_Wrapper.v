`include "param.v"

module dCache_Wrapper (
    input  wire                                clk,
    input  wire                                rst_n,
    input  wire                                cpu_valid,
    input  wire [`IO_BUS_WIDTH_ADDR - 1:0]     cpu_addr,
    input  wire [`IO_BUS_WIDTH_CTRL - 1:0]     cpu_ctrl,
    input  wire [3:0]                          cpu_we,
    input  wire [`IO_BUS_WIDTH_DATA - 1:0]     cpu_wd,
    output wire [`IO_BUS_WIDTH_DATA - 1:0]     cpu_rd,
    output wire [`IO_BUS_WIDTH_ADDR - 1:0]     mem_addr,
    output wire [`IO_BUS_WIDTH_CTRL - 1:0]     mem_ctrl,
    output wire [3:0]                          mem_we,
    output wire [`IO_BUS_WIDTH_DATA - 1:0]     mem_wd,
    input  wire [`IO_BUS_WIDTH_DATA - 1:0]     mem_rd
);
    wire cacheable = (cpu_addr < 32'h00010000) && (cpu_addr[1:0] == 2'b00);
    wire store_write = cpu_valid && cacheable && (|cpu_we);

    reg        req_valid;
    reg        req_cacheable;
    reg        req_write;
    reg        req_hit;
    reg [31:0] req_addr;
    reg [31:0] req_data;

    wire fill_read_miss = req_valid && req_cacheable && !req_write && !req_hit && !store_write;
    wire cache_we = store_write || fill_read_miss;
    wire [31:0] cache_addr = store_write ? cpu_addr : (fill_read_miss ? req_addr : cpu_addr);
    wire [31:0] cache_din  = store_write ? cpu_wd   : mem_rd;
    wire [3:0]  cache_byte_we = store_write ? cpu_we : 4'b1111;

    wire [31:0] cache_dout;
    wire        cache_hit;
    wire        lookup_valid = cpu_valid && cacheable && !cache_we;

    cache #(.INDEX_WIDTH(8)) u_cache (
        .clk(clk),
        .rst_n(rst_n),
        .flush(1'b0),
        .addr(cache_addr),
        .din(cache_din),
        .we(cache_we),
        .byte_we(cache_byte_we),
        .dout(cache_dout),
        .hit(cache_hit)
    );

    assign mem_addr = cpu_addr;
    assign mem_ctrl = cpu_ctrl;
    assign mem_we   = cpu_we;
    assign mem_wd   = cpu_wd;

    assign cpu_rd = (req_valid && req_cacheable && !req_write && req_hit) ? req_data : mem_rd;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            req_valid     <= 1'b0;
            req_cacheable <= 1'b0;
            req_write     <= 1'b0;
            req_hit       <= 1'b0;
            req_addr      <= 32'b0;
            req_data      <= 32'b0;
        end else begin
            req_valid     <= cpu_valid;
            req_cacheable <= cacheable;
            req_write     <= |cpu_we;
            req_addr      <= cpu_addr;
            if (lookup_valid) begin
                req_hit  <= cache_hit;
                req_data <= cache_dout;
            end else begin
                req_hit  <= 1'b0;
                req_data <= 32'b0;
            end
        end
    end
endmodule
