`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: BHT (Branch History Table)
 * @Description: 分支历史表，利用 2-bit 饱和计数器状态机实现动态分支预测。
 *               通过记录分支指令的历史行为，预测 B-type 指令未来的跳转方向。
 */
module BHT (
    input  wire                        clk,
    input  wire                        rst_n,
    input  wire                        predict_valid, // 当前是否为需要预测的有效指令
    input  wire [`WIDTH_PC - 1:0]      predict_pc,    // 预测阶段的 PC
    input  wire                        update_valid,  // 更新使能（来自执行阶段反馈）
    input  wire [`WIDTH_PC - 1:0]      update_pc,     // 需更新状态的分支指令 PC
    input  wire                        update_taken,  // 该指令实际执行时的跳转结果
    output wire                        isHit,         // BHT 命中标志
    output reg                         isJump         // 预测结果：1 为跳转 (Taken)，0 为不跳 (Not Taken)
);

// =================================================================
// 参数与表格结构定义
// =================================================================
localparam BHT_INDEX_WIDTH = 7;   // 索引宽度，决定行数
localparam BHT_DEPTH       = 128; // 表项深度 (2^7)
localparam TAG_WIDTH       = 7;   // 标签宽度，用于确认表项唯一性

// 2-bit 饱和计数器状态编码 (双峰预测器模型)
localparam STATUS_JUMP      = 2'b00; // 强跳转 (Strongly Taken)
localparam STATUS_WEAK_JUMP = 2'b01; // 弱跳转 (Weakly Taken)
localparam STATUS_WEAK_NORM = 2'b11; // 弱不跳 (Weakly Not Taken)
localparam STATUS_NORM      = 2'b10; // 强不跳 (Strongly Not Taken)

// 存储结构：Valid 位、Tag 标签、2-bit 状态值
reg                 valid_table [0:BHT_DEPTH-1];
reg [TAG_WIDTH-1:0] tag_table   [0:BHT_DEPTH-1];
reg [1:0]           state_table [0:BHT_DEPTH-1];

integer i;

// =================================================================
// 索引与标签生成逻辑 (Hash 映射)
// =================================================================
// 使用 PC[8:2] 作为 Index (指令 4 字节对齐，低 2 位固定为 0)
wire [BHT_INDEX_WIDTH-1:0] predict_index = predict_pc[8:2];
wire [TAG_WIDTH-1:0]       predict_tag   = predict_pc[15:9];

// 更新逻辑使用同样的映射规则
wire [BHT_INDEX_WIDTH-1:0] update_index  = update_pc[8:2];
wire [TAG_WIDTH-1:0]       update_tag    = update_pc[15:9];

// =================================================================
// 状态更新逻辑 (2-bit Saturated Counter Update)
// =================================================================
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        // 异步复位：清空有效位，初始状态设为"弱不跳"以增加冷启动稳定性
        for (i = 0; i < BHT_DEPTH; i = i + 1) begin
            valid_table[i] <= 1'b0;
            tag_table[i]   <= {TAG_WIDTH{1'b0}};
            state_table[i] <= STATUS_WEAK_NORM;
        end
    end
    else if (update_valid) begin
        valid_table[update_index] <= 1'b1;
        tag_table[update_index]   <= update_tag;

        // 根据执行结果更新状态机
        case (state_table[update_index])
            STATUS_JUMP: 
                state_table[update_index] <= update_taken ? STATUS_JUMP : STATUS_WEAK_JUMP;
            STATUS_WEAK_JUMP: 
                state_table[update_index] <= update_taken ? STATUS_JUMP : STATUS_WEAK_NORM;
            STATUS_WEAK_NORM: 
                state_table[update_index] <= update_taken ? STATUS_WEAK_JUMP : STATUS_NORM;
            default: // 对应 STATUS_NORM
                state_table[update_index] <= update_taken ? STATUS_WEAK_NORM : STATUS_NORM;
        endcase
    end
end

// =================================================================
// 预测输出逻辑 (Prediction Output)
// =================================================================

// 命中判定：Valid 为 1 且 Tag 匹配
wire entry_hit = valid_table[predict_index] && (tag_table[predict_index] == predict_tag);
wire [1:0] entry_state = state_table[predict_index];

assign isHit = predict_valid && entry_hit;

// 预测策略：处于强跳转或弱跳转状态时，预测为 Taken
always @(*) begin
    case (entry_state)
        STATUS_JUMP:      isJump = 1'b1;
        STATUS_WEAK_JUMP: isJump = 1'b1;
        default:          isJump = 1'b0;
    endcase
end

endmodule