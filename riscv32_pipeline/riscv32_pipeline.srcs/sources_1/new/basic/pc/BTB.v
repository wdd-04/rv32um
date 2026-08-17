`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: BTB (Branch Target Buffer)
 * @Description: 分支目标缓冲器。用于存储分支指令及其对应的目标跳转地址。
 *               在取指阶段根据 PC 预测跳转目标，消除 JALR 等指令的跳转延迟。
 *               采用直接映射 (Direct-Mapped) 结构提高检索速度。
 */
module BTB #(
    parameter INDEX_WIDTH = 4,  // 索引宽度，决定表项数量 (2^4 = 16)
    parameter BTB_DEPTH   = 16  // 缓冲深度
)(
    input  wire                        clk,
    input  wire                        rst_n,
    input  wire                        predict_valid, // 预测使能 (通常对应 JALR 指令)
    input  wire [`WIDTH_PC - 1:0]      predict_pc,    // 当前取指 PC
    input  wire                        update_valid,  // 更新使能 (来自后端执行结果)
    input  wire [`WIDTH_PC - 1:0]      update_pc,     // 分支指令的实际 PC
    input  wire [`WIDTH_PC - 1:0]      update_target, // 分支指令的实际跳转目标地址
    output wire                        isHit,         // BTB 命中标志
    output wire [`WIDTH_PC - 1:0]      target_pc      // 预测的目标跳转地址
);

// =================================================================
// 存储结构定义 (BTB Storage)
// =================================================================
reg [`WIDTH_PC - 1:0] target_table [0:BTB_DEPTH-1];     // 存储历史跳转目标地址
reg [31-INDEX_WIDTH-2:0] tag_table [0:BTB_DEPTH-1];     // 存储 PC 标签，用于冲突校验
reg valid_table [0:BTB_DEPTH-1];                        // 有效位

integer i;

// =================================================================
// 索引与标签生成 (Index & Tag Generation)
// =================================================================
// 预测路径索引解析：去掉低 2 位对齐位，取 INDEX_WIDTH 位作为索引
wire [INDEX_WIDTH-1:0] predict_index = predict_pc[INDEX_WIDTH+1:2];
wire [31-INDEX_WIDTH-2:0] predict_tag = predict_pc[31:INDEX_WIDTH+2];

// 更新路径索引解析：保持与预测路径一致的映射规则
wire [INDEX_WIDTH-1:0] update_index = update_pc[INDEX_WIDTH+1:2];
wire [31-INDEX_WIDTH-2:0] update_tag = update_pc[31:INDEX_WIDTH+2];

// =================================================================
// 写入/更新逻辑 (Update Logic)
// =================================================================
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        // 异步复位：清空所有有效位及表格数据
        for (i = 0; i < BTB_DEPTH; i = i + 1) begin
            valid_table[i]  <= 1'b0;
            tag_table[i]    <= {(31-INDEX_WIDTH-1){1'b0}};
            target_table[i] <= {`WIDTH_PC{1'b0}};
        end
    end
    else if (update_valid) begin
        // 当后端执行发现跳转发生时，更新/替换对应 Index 的表项
        valid_table[update_index]  <= 1'b1;
        tag_table[update_index]    <= update_tag;
        target_table[update_index] <= update_target;
    end
end

// =================================================================
// 读取/命中判定 (Lookup & Hit Logic)
// =================================================================
// 命中条件：1. 当前指令需要预测； 2. 条目有效； 3. PC 标签匹配 (Tag Match)
assign isHit = predict_valid && valid_table[predict_index] && (tag_table[predict_index] == predict_tag);

// 只要命中，直接输出存储的目标地址，用于更新取指阶段的 PC
assign target_pc = target_table[predict_index];

endmodule