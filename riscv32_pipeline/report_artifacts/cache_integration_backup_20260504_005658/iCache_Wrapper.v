module iCache_Wrapper (
    input wire clk,
    input wire rst_n,
    input wire [31:0] pc,
    output reg [31:0] inst,
    output reg stall_cpu,
    output reg [13:0] mem_a,    // 连接 InstMem 的地址端口
    input  wire [31:0] mem_inst // 连接 InstMem 的数据端口 (spo)
);
    wire hit;
    wire [31:0] cache_dout;
    reg we;

    // 实例化 Cache 模块
    cache #(.INDEX_WIDTH(8)) u_cache ( // 显式传递参数
        .clk(clk), 
        .rst_n(rst_n), 
        .addr(pc), 
        .din(mem_inst), 
        .we(we), 
        .byte_we(4'b0000), // 补全：iCache 只读，强制置为 0
        .dout(cache_dout), 
        .hit(hit)
    );

    reg [1:0] state;
    localparam IDLE = 2'd0, MISS = 2'd1, FILL = 2'd2;

// 修改输出 inst 的逻辑，使其在数据到达时立刻透传
    // 这样 inst 就不再会有滞后一拍的情况
    always @(*) begin
        if (state == IDLE && hit) begin
            inst = cache_dout;
        end else if (state == FILL) begin
            inst = mem_inst; // 在 FILL 阶段直接从内存透传
        end else begin
            inst = 32'h0;    // 其他情况保持 0 或保持旧值
        end
    end

    // 状态机只负责跳转和 stall 信号
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            stall_cpu <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (!hit) begin
                        state <= MISS;
                        stall_cpu <= 1;
                        mem_a <= pc[15:2]; 
                    end
                end
                MISS: begin
                    state <= FILL;
                end
                FILL: begin
                    state <= IDLE;
                    stall_cpu <= 0; // 下一拍解除 stall
                end
            endcase
        end
    end

endmodule