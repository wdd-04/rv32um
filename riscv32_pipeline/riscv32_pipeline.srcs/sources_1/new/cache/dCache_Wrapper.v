`include "param.v"

/**
 * @Module: dCache_Wrapper
 * @Description: 数据缓存 (dCache) 控制包装模块。
 *               1. 缓存策略：采用直写 (Write-through) 策略，所有写操作都会同步更新到内存。
 *               2. 写分配策略：非按写分配 (No-write-allocate)，写缺失时仅更新内存，不搬运数据到缓存。
 *               3. 访问机制：分为请求启动 (access_start) 和结果提交 (access_commit) 两个阶段。
 *               4. 缓存填充：Load 缺失时从 mem_rd 读取数据并填充 (Fill) 至缓存。
 */
module dCache_Wrapper (
    input  wire                                clk,
    input  wire                                rst_n,
    input  wire                                cpu_valid, // CPU 访存请求有效信号
    input  wire [`IO_BUS_WIDTH_ADDR - 1:0]     cpu_addr,  // CPU 访存地址
    input  wire [`IO_BUS_WIDTH_CTRL - 1:0]     cpu_ctrl,  // CPU 访存控制信号
    input  wire [3:0]                          cpu_we,    // CPU 字节写使能
    input  wire [`IO_BUS_WIDTH_DATA - 1:0]     cpu_wd,    // CPU 写数据
    output wire [`IO_BUS_WIDTH_DATA - 1:0]     cpu_rd,    // 返回给 CPU 的读数据
    output wire [`IO_BUS_WIDTH_ADDR - 1:0]     mem_addr,  // 发往内存总线的地址
    output wire [`IO_BUS_WIDTH_CTRL - 1:0]     mem_ctrl,  // 发往内存总线的控制
    output wire [3:0]                          mem_we,    // 发往内存总线的写使能
    output wire [`IO_BUS_WIDTH_DATA - 1:0]     mem_wd,    // 发往内存总线的写数据
    input  wire [`IO_BUS_WIDTH_DATA - 1:0]     mem_rd     // 从内存总线读回的数据
);
    reg        pending;   // 访存处理中标志位
    reg [31:0] req_addr;  // 缓存当前正在处理的地址

    wire [31:0] cache_dout;
    wire        cache_hit;

    // ===============================================================
    // 访问阶段控制逻辑 (Access Phase Control)
    // ===============================================================
    wire access_start  = cpu_valid && !pending;       // 握手开始：CPU 发起请求且当前空闲
    wire access_commit = pending;                     // 提交阶段：在请求发起后的下一个周期处理
    wire commit_store  = access_commit && (cpu_we != 4'b0000); // 判定为写操作提交
    wire commit_load   = access_commit && (cpu_we == 4'b0000); // 判定为读操作提交
    
    // 缓存地址选择：处理过程中锁定地址，防止 CPU 信号提前撤销
    wire [31:0] cache_addr = pending ? req_addr : cpu_addr;

    // ===============================================================
    // 缓存更新判定 (Cache Update Decision)
    // ===============================================================
    
    // 情况 1: Load 缺失 -> 需要从内存读取并写入缓存 (Fill)
    wire load_fill    = commit_load  && !cache_hit;
    
    // 情况 2: Store 命中 -> 直写策略下，更新内存的同时也要更新缓存 (Update)
    wire store_update = commit_store &&  cache_hit;
    
    wire cache_we     = load_fill || store_update;
    
    // 数据源选择：Load 填充用内存数据，Store 更新用 CPU 原始数据
    wire [31:0] cache_din = load_fill ? mem_rd : cpu_wd;
    
    // 写掩码：Load 填充通常是全字写入 (4'b1111)，Store 则跟随 CPU 的字节选择
    wire [3:0]  cache_byte_we = load_fill ? 4'b1111 : cpu_we;

    // 例化底层 BRAM Cache 模块
    cache #(.INDEX_WIDTH(4), .USE_DCACHE_BRAM(1)) u_dcache (
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

    // 总线透传：直写策略下，所有访存信号直接同步至内存总线
    assign mem_addr = cpu_addr;
    assign mem_ctrl = cpu_ctrl;
    assign mem_we   = cpu_we;
    assign mem_wd   = cpu_wd;

    // ===============================================================
    // 读数据返回选择 (Read Data Mux)
    // ===============================================================
    // - Load Hit:  返回缓存输出 (cache_dout)
    // - Load Miss: 返回内存读出数据 (mem_rd)
    assign cpu_rd = (commit_load && cache_hit) ? cache_dout : mem_rd;

    // ===============================================================
    // 状态机寄存器更新 (State Register Update)
    // ===============================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pending  <= 1'b0;
            req_addr <= 32'b0;
        end else if (access_start) begin
            pending  <= 1'b1;
            req_addr <= cpu_addr;
        end else if (pending) begin
            // 处理完成后回到空闲状态
            pending  <= 1'b0;
        end
    end
endmodule