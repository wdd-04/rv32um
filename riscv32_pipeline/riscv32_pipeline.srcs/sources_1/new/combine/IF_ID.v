`ifdef DEBUG
    `include "param.v"
`else
    `include "../param.v"
`endif

/**
 * @Module: IF_ID
 * @Description: 取指/译码流水线寄存器。
 *               用于缓存从指令缓存(iCache)取出的指令及其 PC，并将前端的分支预测信息
 *               同步传递至译码阶段。支持流水线暂停(Stall)和冲刷(Flush)功能。
 */
module IF_ID (
           input   wire clk,
           input   wire rst_n,
           input   wire stop_IF,      // 流水线暂停信号 (通常来自 Load-Use 冲突或 Cache Miss)
           input   wire flush,        // 流水线冲刷信号 (通常来自预测失败或异常)
           input   wire [`WIDTH_PC - 1: 0]      pc,           // 当前周期的 PC
           input   wire [`WIDTH_INST - 1: 0]    inst,         // 从存储器取出的原始指令
           input   wire                         pred_taken,   // BTB 预测是否跳转
           input   wire [`WIDTH_PC - 1: 0]      pred_target,  // BTB 预测的目标地址
           output  reg  [`WIDTH_PC - 1: 0]      pc_o,         // 传递给译码阶段的 PC
           output  reg  [`WIDTH_INST - 1: 0]    inst_o,       // 传递给译码阶段的指令
           output  reg                            pred_taken_o, // 同步后的预测跳转标志
           output  reg  [`WIDTH_PC - 1: 0]      pred_target_o // 同步后的预测目标地址
       );

// =================================================================
// 流水线寄存器更新逻辑 (Pipeline Register Update)
// =================================================================

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        // 异步复位：清空所有寄存器
        pc_o[`WIDTH_PC - 1: 0]     <= `WIDTH_PC'b0;
        inst_o[`WIDTH_INST - 1: 0] <= `WIDTH_PC'b0;
        pred_taken_o               <= 1'b0;
        pred_target_o              <= `WIDTH_PC'b0;
    end
    else if (flush) begin
        // 流水线冲刷：将当前指令槽位替换为 NOP 指令 (RISC-V 中 0x00000013 为 addi x0, x0, 0)
        pc_o <= 32'b0;
        inst_o <= 32'h00000013; 
        pred_taken_o <= 1'b0;
        pred_target_o <= 32'b0;
    end
    else if (stop_IF) begin
        // 流水线暂停：保持当前寄存器值不变 (Hold)
        pc_o[`WIDTH_PC - 1: 0]     <= pc_o[`WIDTH_PC - 1: 0];
        inst_o[`WIDTH_INST - 1: 0] <= inst_o[`WIDTH_INST - 1: 0];
        pred_taken_o               <= pred_taken_o;
        pred_target_o              <= pred_target_o;
    end
    else begin
        // 正常流动：更新为当前取指阶段的数据
        pc_o[`WIDTH_PC - 1: 0]     <= pc[`WIDTH_PC - 1: 0];
        inst_o[`WIDTH_PC - 1: 0]   <= inst[`WIDTH_PC - 1: 0];
        pred_taken_o               <= pred_taken;
        pred_target_o              <= pred_target;
    end
end

endmodule