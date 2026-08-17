/**
 * @Module: cache
 * @Description: 通用两路组关联 (2-Way Set Associative) 缓存模块。
 *               支持参数化配置：INDEX_WIDTH (容量)、PIPELINE_WRITE (流水线写优化)、
 *               FILL_ONLY_WRITE (仅填充模式，适用于 I-Cache)。
 *               采用 LRU 算法进行表项替换。
 */
module cache #(
    parameter INDEX_WIDTH = 4,
    parameter USE_DCACHE_BRAM = 0,
    parameter PIPELINE_WRITE = 0,  // 是否开启流水线写（提高频率）
    parameter FILL_ONLY_WRITE = 0  // 为 1 时，写操作仅在缺失填充时发生
)(
    input wire clk,
    input wire rst_n,
    input wire flush,
    input wire [31:0] addr,
    input wire [31:0] din,
    input wire we,                 // 写使能
    input wire [3:0] byte_we,      // 字节掩码
    output reg [31:0] dout,
    output reg hit
);
    // =================================================================
    // 内部参数与存储阵列
    // =================================================================
    localparam TAG_WIDTH = 32 - INDEX_WIDTH - 2;
    localparam DEPTH = (1 << INDEX_WIDTH);

    // Tag 与 Valid 阵列 (两路)
    reg [TAG_WIDTH-1:0] tag0 [0:DEPTH-1];
    reg [TAG_WIDTH-1:0] tag1 [0:DEPTH-1];
    reg valid0 [0:DEPTH-1];
    reg valid1 [0:DEPTH-1];
    reg lru [0:DEPTH-1]; // 1-bit LRU：指向最近较少使用的那一项

    // 地址拆分：Tag | Index | Offset(fixed 2-bit)
    wire [INDEX_WIDTH-1:0] index = addr[INDEX_WIDTH+1:2];
    wire [7:0] bram_index = {{(8-INDEX_WIDTH){1'b0}}, index};
    wire [TAG_WIDTH-1:0] tag = addr[31:INDEX_WIDTH+2];

    // 读请求追踪寄存器
    reg [INDEX_WIDTH-1:0] rd_index;
    reg [TAG_WIDTH-1:0] rd_tag;
    reg rd_valid;

    // =================================================================
    // 命中与路选逻辑 (Hit & Way Selection)
    // =================================================================
    
    // 读命中判定
    wire rd_hit0 = rd_valid && valid0[rd_index] && (tag0[rd_index] == rd_tag);
    wire rd_hit1 = rd_valid && valid1[rd_index] && (tag1[rd_index] == rd_tag);

    // 写命中/缺失判定
    wire wr_hit0_raw = valid0[index] && (tag0[index] == tag);
    wire wr_hit1_raw = valid1[index] && (tag1[index] == tag);
    
    // 若为 FILL_ONLY_WRITE (I-Cache)，正常写操作不计为命中，强制触发替换填充
    wire wr_hit0 = (FILL_ONLY_WRITE != 0) ? 1'b0 : wr_hit0_raw;
    wire wr_hit1 = (FILL_ONLY_WRITE != 0) ? 1'b0 : wr_hit1_raw;
    wire wr_miss = !wr_hit0 && !wr_hit1;
    
    // 确定当前写操作目标路：命中则写原路，缺失则根据 LRU 替换
    wire wr_way1 = (FILL_ONLY_WRITE != 0) ? lru[index]  : (wr_hit1 || (wr_miss && lru[index]));
    wire wr_way0 = (FILL_ONLY_WRITE != 0) ? !lru[index] : (wr_hit0 || (wr_miss && !lru[index]));

    // =================================================================
    // 写流水线阶段 (Pipeline Write Stage)
    // =================================================================
    // 当 PIPELINE_WRITE 开启时，写操作延后一拍以优化关键路径时序
    reg                   pipe_we;
    reg [INDEX_WIDTH-1:0] pipe_index;
    reg [TAG_WIDTH-1:0]   pipe_tag;
    reg                   pipe_hit0;
    reg                   pipe_hit1;
    reg                   pipe_way0;
    reg                   pipe_way1;
    reg [31:0]            pipe_din;
    reg [3:0]             pipe_byte_we;
    reg [63:0]            pipe_bram_dout;

    // 确定当前生效的写控制信号 (有效使能/地址/数据)
    wire                eff_we        = (PIPELINE_WRITE != 0) ? pipe_we       : we;
    wire [INDEX_WIDTH-1:0] eff_index   = (PIPELINE_WRITE != 0) ? pipe_index    : index;
    wire [TAG_WIDTH-1:0]   eff_tag     = (PIPELINE_WRITE != 0) ? pipe_tag      : tag;
    wire                eff_hit0      = (PIPELINE_WRITE != 0) ? pipe_hit0     : wr_hit0;
    wire                eff_hit1      = (PIPELINE_WRITE != 0) ? pipe_hit1     : wr_hit1;
    wire                eff_way0      = (PIPELINE_WRITE != 0) ? pipe_way0     : wr_way0;
    wire                eff_way1      = (PIPELINE_WRITE != 0) ? pipe_way1     : wr_way1;
    wire [31:0]         eff_din       = (PIPELINE_WRITE != 0) ? pipe_din      : din;
    wire [3:0]          eff_byte_we   = (PIPELINE_WRITE != 0) ? pipe_byte_we  : byte_we;
    wire [63:0]         eff_bram_dout = (PIPELINE_WRITE != 0) ? pipe_bram_dout : bram_dout;
    wire [7:0]          eff_bram_index = {{(8-INDEX_WIDTH){1'b0}}, eff_index};

    // =================================================================
    // BRAM 数据阵列实例化
    // =================================================================
    // 两路数据并行存储在 64-bit 宽的 BRAM 中 ([63:32] Way1, [31:0] Way0)
    wire [63:0] bram_dout;
    wire [63:0] dcache_dina = eff_way1 ? {eff_din, 32'b0} : {32'b0, eff_din};
    wire [7:0]  dcache_wea = eff_we ? (eff_way1 ? {eff_byte_we, 4'b0000} : {4'b0000, eff_byte_we}) : 8'b00000000;
    
    // I-Cache 模式：由于 BRAM 可能不支持字节写使能，填充时需保持另一路数据不变
    wire [63:0] icache_dina = eff_way1 ? {eff_din, eff_bram_dout[31:0]} : {eff_bram_dout[63:32], eff_din};

    generate
        if (USE_DCACHE_BRAM) begin : gen_dcache_data
            dcache_data_bram data_bram (
                .clka(clk), .ena(1'b1), .wea(dcache_wea), .addra(eff_bram_index), .dina(dcache_dina),
                .clkb(clk), .enb(1'b1), .addrb(bram_index), .doutb(bram_dout)
            );
        end else begin : gen_icache_data
            icache_data_bram data_bram (
                .clka(clk), .ena(1'b1), .wea(eff_we), .addra(eff_bram_index), .dina(icache_dina),
                .clkb(clk), .enb(1'b1), .addrb(bram_index), .doutb(bram_dout)
            );
        end
    endgenerate

    // =================================================================
    // 读输出选择
    // =================================================================
    always @(*) begin
        hit = rd_hit0 || rd_hit1;
        if (rd_hit0)      dout = bram_dout[31:0];
        else if (rd_hit1) dout = bram_dout[63:32];
        else              dout = 32'b0;
    end

    // =================================================================
    // 状态机与阵列维护 (Update Tag/Valid/LRU)
    // =================================================================
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n || flush) begin
            // 复位清空
            rd_valid <= 1'b0;
            pipe_we  <= 1'b0;
            for (i = 0; i < DEPTH; i = i + 1) begin
                valid0[i] <= 1'b0;
                valid1[i] <= 1'b0;
                lru[i]    <= 1'b0;
            end
        end else begin
            // 读请求流水线化
            rd_index <= index;
            rd_tag   <= tag;
            rd_valid <= 1'b1;

            // 写请求流水线化映射
            pipe_we <= we;
            pipe_index <= index;
            pipe_tag <= tag;
            pipe_hit0 <= wr_hit0;
            pipe_hit1 <= wr_hit1;
            pipe_way0 <= wr_way0;
            pipe_way1 <= wr_way1;
            pipe_din <= din;
            pipe_byte_we <= byte_we;
            pipe_bram_dout <= bram_dout;

            // 更新 Tag、Valid 和 LRU 状态
            if (eff_we) begin
                if (eff_hit0) begin
                    lru[eff_index] <= 1'b1; // 访问了 Way0，则下一次替换 Way1
                end else if (eff_hit1) begin
                    lru[eff_index] <= 1'b0; // 访问了 Way1，则下一次替换 Way0
                end else if (eff_way0) begin
                    tag0[eff_index]   <= eff_tag;
                    valid0[eff_index] <= 1'b1;
                    lru[eff_index]    <= 1'b1;
                end else begin
                    tag1[eff_index]   <= eff_tag;
                    valid1[eff_index] <= 1'b1;
                    lru[eff_index]    <= 1'b0;
                end
            end else if (rd_hit0) begin
                lru[rd_index] <= 1'b1;
            end else if (rd_hit1) begin
                lru[rd_index] <= 1'b0;
            end
        end
    end
endmodule