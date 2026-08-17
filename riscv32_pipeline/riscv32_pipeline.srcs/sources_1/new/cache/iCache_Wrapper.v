/**
 * @Module: iCache_Wrapper
 * @Description: 指令缓存 (I-Cache) 包装模块。
 *               连接底层存储器 (InstMem) 与高速缓存核心 (cache)，
 *               在指令命中时提供单周期响应，在缺失时自动从存储器填充。
 */
module iCache_Wrapper (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        flush,     // 清空流水线/Cache 刷新信号
    input  wire [31:0] pc,        // 输入取指 PC
    output wire [31:0] inst,      // 输出指令数据
    output wire        stall_cpu  // 缓存忙信号 (当前实现为无等待访问)
);
    // 内部信号定义
    wire [31:0] mem_inst;   // 来自底层存储器的原始指令
    wire [31:0] cache_dout; // 来自 Cache 的指令数据
    wire        cache_hit;  // Cache 命中标志

    // 状态记录寄存器：用于追踪上一周期的请求状态
    reg         req_valid;
    reg         req_hit;
    reg  [31:0] req_pc;
    reg  [31:0] req_data;

    // =================================================================
    // Cache 填充控制逻辑 (Cache Fill Logic)
    // =================================================================
    // 当上一周期请求有效但未命中，且当前未发生刷新时，启动填充 (Fill)
    wire fill_en = req_valid && !req_hit && !flush;
    // 填充时使用上一周期的 PC 指向 Cache 地址空间进行写入，否则正常读取当前 PC
    wire [31:0] cache_addr = fill_en ? req_pc : pc;

    // 数据输出选择：若上一周期命中则输出 Cache 缓存数据，否则实时输出存储器数据
    assign inst = req_hit ? req_data : mem_inst;
    assign stall_cpu = 1'b0; // 维持高性能流水线，不轻易暂停 CPU

    // =================================================================
    // 实例 1：底层指令存储器 (Backing Storage)
    // =================================================================
    InstMem backing_mem (
        .clk(clk),
        .rst_n(rst_n),
        .flush(1'b0),
        .pc(pc),
        .inst(mem_inst)
    );

    // =================================================================
    // 实例 2：高速缓存核心 (Cache Core)
    // =================================================================
    cache #(.INDEX_WIDTH(4), .USE_DCACHE_BRAM(0), .PIPELINE_WRITE(1), .FILL_ONLY_WRITE(1)) u_cache (
        .clk(clk),
        .rst_n(rst_n),
        .flush(flush),
        .addr(cache_addr),
        .din(mem_inst),        // 写入数据来自存储器
        .we(fill_en),          // 写使能：Miss 后填充
        .byte_we(4'b1111),     // 全字节写入
        .dout(cache_dout),
        .hit(cache_hit)
    );

    // =================================================================
    // Cache 控制状态机/寄存器更新
    // =================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            req_valid <= 1'b0;
            req_hit   <= 1'b0;
            req_pc    <= 32'b0;
            req_data  <= 32'b0;
        end else if (flush) begin
            // 刷新时清空所有请求追踪状态，避免旧指令残留
            req_valid <= 1'b0;
            req_hit   <= 1'b0;
            req_pc    <= 32'b0;
            req_data  <= 32'b0;
        end else begin
            req_valid <= 1'b1; // 持续保持取指请求有效
            req_pc    <= pc;   // 缓存当前请求的地址
            
            if (fill_en) begin
                // 若正在进行填充，下一拍强制设为未命中以等待数据稳定
                req_hit  <= 1'b0;
                req_data <= 32'b0;
            end else begin
                // 记录当前周期的命中情况和数据，用于下一拍的 inst 选择
                req_hit  <= cache_hit;
                req_data <= cache_dout;
            end
        end
    end
endmodule