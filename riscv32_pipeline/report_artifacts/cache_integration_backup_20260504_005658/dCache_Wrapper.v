`include "param.v"

module dCache_Wrapper (
    input wire clk, rst_n,
    input wire [`IO_BUS_WIDTH_ADDR-1:0] addr,
    input wire DRAMWE,
    input wire [1:0] DRAM_EX_TYPE,
    input wire [`IO_BUS_WIDTH_DATA-1:0] din,
    output reg [`IO_BUS_WIDTH_DATA-1:0] dout,
    output reg stall_cpu,
    output reg [`IO_BUS_WIDTH_ADDR-1:0] mem_a,
    input wire [`IO_BUS_WIDTH_DATA-1:0] mem_din
);
    wire hit;
    wire [`IO_BUS_WIDTH_DATA-1:0] cache_dout;
    reg [1:0] state;
    localparam IDLE=0, MISS=1, FILL=2;

    // 实例化 Cache
    cache #(.INDEX_WIDTH(8)) u_cache (
        .clk(clk), .rst_n(rst_n), .addr(addr), .din((state==FILL)?mem_din:din),
        .we((DRAMWE && state==IDLE) || (state==FILL)),
        .byte_we(4'b1111), .dout(cache_dout), .hit(hit)
    );

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            stall_cpu <= 0;
        end else begin
            case(state)
                IDLE: if (!hit) begin // MISS 触发
                    state <= MISS;
                    stall_cpu <= 1;
                    mem_a <= addr;
                end
                MISS: state <= FILL; // 强制保持一个周期给内存读取
                FILL: begin 
                    state <= IDLE;
                    stall_cpu <= 0;
                end
            endcase
        end
    end

    always @(*) begin
        dout = (state == IDLE && hit) ? cache_dout : (state == FILL ? mem_din : 0);
    end
endmodule