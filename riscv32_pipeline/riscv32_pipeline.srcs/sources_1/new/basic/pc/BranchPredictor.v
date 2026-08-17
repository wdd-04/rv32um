`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: BranchPredictor
 * @Description: 分支预测器顶层模块，旨在降低分支开销，提高流水线吞吐量。
 *               包含对 J-type (绝对跳转)、JALR (间接跳转) 和 B-type (条件分支) 的预测处理。
 *               策略：动态预测 (BHT/BTB) 为主，静态预测 (BTFN) 为辅。
 */
module BranchPredictor (
    input  wire                        clk,
    input  wire                        rst_n,
    input  wire [`WIDTH_INST - 1:0]    inst,             // 当前取指阶段的指令
    input  wire [`WIDTH_PC - 1:0]      pc,               // 当前指令对应的 PC
    input  wire                        update_valid,     // 预测信息更新使能 (来自 EX 段)
    input  wire                        update_is_branch, // 待更新的是否为 B-type 指令
    input  wire                        update_taken,     // 实际是否发生跳转
    input  wire [`WIDTH_PC - 1:0]      update_pc,        // 实际发生跳转的指令 PC
    input  wire [`WIDTH_PC - 1:0]      update_target,    // 实际跳转的目标地址
    output reg  [`WIDTH_PC - 1:0]      pre_pc,           // 预测的下一条 PC
    output reg                         jump              // 预测跳转使能标志 (1: 跳转, 0: PC+4)
);

// =================================================================
// 指令类型译码与立即数提取
// =================================================================
wire [6:0] opcode = inst[6:0];
wire inst_j    = (opcode[6:2] == 5'b11011); // JAL 指令
wire inst_jalr = (opcode[6:2] == 5'b11001); // JALR 指令
wire inst_b    = (opcode[6:2] == 5'b11000); // B-type 分支指令

// B-type 立即数拼接 (用于条件分支目标计算)
wire [31:0] imm_B = {{19{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
// J-type 立即数拼接 (用于 JAL 目标计算)
wire [31:0] imm_J = {{11{inst[31]}}, inst[31], inst[19:12], inst[20], inst[30:21], 1'b0};

// =================================================================
// 动态预测组件实例化
// =================================================================

// 分支历史表 (Branch History Table)：用于预测 B-type 指令的方向
wire isHit_BHT;
wire isJump_BHT;

BHT bht (
    .clk(clk),
    .rst_n(rst_n),
    .predict_valid(inst_b),                     // 仅对 B-type 开启方向预测
    .predict_pc(pc),
    .update_valid(update_valid && update_is_branch),
    .update_pc(update_pc),
    .update_taken(update_taken),
    .isHit(isHit_BHT),
    .isJump(isJump_BHT)                         // 输出预测结果：是否跳转
);

// 分支目标缓冲 (Branch Target Buffer)：用于 JALR 等间接跳转的地址预判
wire isHit_BTB;
wire [`WIDTH_PC - 1:0] btbTarget;

BTB btb (
    .clk(clk),
    .rst_n(rst_n),
    .predict_valid(inst_jalr),                  // JALR 指令需要从 BTB 获取目标
    .predict_pc(pc),
    .update_valid(update_valid && update_taken),
    .update_pc(update_pc),
    .update_target(update_target),
    .isHit(isHit_BTB),
    .target_pc(btbTarget)                       // 输出预测的目标地址
);

// 静态预测辅助：BTFN (Backwards Taken, Forwards Not Taken)
// 当 BHT 未命中时，根据立即数符号位判定：向后跳转 (循环) 默认 Taken
wire static_backward_taken = imm_B[31];

// =================================================================
// 预测决策逻辑 (Prediction Decision)
// =================================================================
always @(*) begin
    // 默认行为：顺序取指 PC + 4
    pre_pc = pc + 32'd4;
    jump   = `PCSEL_PC4;

    if (inst_j) begin
        // JAL：无条件跳转，目标地址在取指阶段即可通过 PC + Offset 确定
        pre_pc = pc + imm_J;
        jump   = `PCSEL_JUMP;
    end
    else if (inst_jalr) begin
        // JALR：目标地址依赖寄存器。若 BTB 命中，则使用缓存的历史目标地址
        if (isHit_BTB) begin
            pre_pc = btbTarget;
            jump   = `PCSEL_JUMP;
        end
    end
    else if (inst_b) begin
        // B-type：
        // 1. 若 BHT 动态预测命中，以 BHT 结果为准 (isJump_BHT)
        // 2. 若 BHT 未命中，则采用静态预测策略 (static_backward_taken)
        if ((isHit_BHT && isJump_BHT) || (!isHit_BHT && static_backward_taken)) begin
            pre_pc = pc + imm_B;
            jump   = `PCSEL_JUMP;
        end
    end
end

endmodule