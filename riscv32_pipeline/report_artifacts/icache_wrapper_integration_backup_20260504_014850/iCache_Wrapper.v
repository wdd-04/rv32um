module iCache_Wrapper (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] pc,
    output wire [31:0] inst,
    output wire        stall_cpu,
    output wire [13:0] mem_a,
    input  wire [31:0] mem_inst
);
    wire [31:0] cache_dout;
    wire        cache_hit;
    reg         req_valid;
    reg         req_hit;
    reg  [31:0] req_pc;
    reg  [31:0] req_data;

    wire fill_en = req_valid && !req_hit;
    wire [31:0] cache_addr = fill_en ? req_pc : pc;

    assign mem_a = pc[15:2];
    assign inst = req_hit ? req_data : mem_inst;
    assign stall_cpu = 1'b0;

    cache #(.INDEX_WIDTH(8)) u_cache (
        .clk(clk),
        .rst_n(rst_n),
        .flush(1'b0),
        .addr(cache_addr),
        .din(mem_inst),
        .we(fill_en),
        .byte_we(4'b1111),
        .dout(cache_dout),
        .hit(cache_hit)
    );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            req_valid <= 1'b0;
            req_hit   <= 1'b0;
            req_pc    <= 32'b0;
            req_data  <= 32'b0;
        end else begin
            req_valid <= 1'b1;
            req_pc    <= pc;
            if (fill_en) begin
                req_hit  <= 1'b0;
                req_data <= 32'b0;
            end else begin
                req_hit  <= cache_hit;
                req_data <= cache_dout;
            end
        end
    end
endmodule
