module Interface_Timer (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        BG,       // 总线同意
    input  wire [31:0] addr,     // 地址线
    input  wire [0:0]  ctrl,     // 控制线
    inout  wire [31:0] data      // 数据线
);

    // 内部的一个 32位 计数器
    reg [31:0] timer_count;

    // 只要不复位，每个时钟周期都无脑 +1
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            timer_count <= 32'd0;
        end else begin
            timer_count <= timer_count + 1'b1;
        end
    end

    // 读逻辑：当 CPU 发起读操作，且选中了本设备时，把计数器的值丢到总线上
    wire re = BG && !ctrl[0]; 
    
    // 假设不管读 timer 的什么地址，都返回这个 count
    assign data = re ? timer_count : 32'hzzzzzzzz;

endmodule