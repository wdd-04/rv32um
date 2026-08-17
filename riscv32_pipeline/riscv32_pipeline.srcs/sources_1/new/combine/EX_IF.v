`ifdef DEBUG
    `include "param.v"
`else
    `include "../param.v"
`endif

/**
 * @Module: EX_IF
 * @Description: 执行/取指回传寄存器。
 *               该模块位于执行阶段与取指阶段的反馈回路中。它负责缓存执行阶段计算出的
 *               实际跳转目标地址（branch_pc），并在下一时钟周期同步回传给取指阶段，
 *               用于修正 PC 指针，是处理分支预测失败修正或强制跳转的关键路径。
 */
module EX_IF (
    input  wire                   clk,
    input  wire                   rst_n,
    // 来自 EX 阶段：计算得到的实际跳转/分支目标地址
    input  wire [`WIDTH_PC - 1: 0] branch_pc,
    // 输出至 IF 阶段：用于更新下一周期的 PC
    output reg  [`WIDTH_PC - 1: 0] branch_pc_o
);

// =================================================================
// 信号同步逻辑 (Feedback Signal Synchronization)
// =================================================================

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        // 异步复位：将回传地址清零
        branch_pc_o[`WIDTH_PC - 1: 0] <= 0;
    end
    else begin
        // 锁存当前执行阶段的跳转地址。
        // 通过寄存器打一拍，有助于优化执行阶段到取指阶段长距离布线的时序压力。
        branch_pc_o[`WIDTH_PC - 1: 0] <= branch_pc[`WIDTH_PC - 1: 0];
    end
end

endmodule