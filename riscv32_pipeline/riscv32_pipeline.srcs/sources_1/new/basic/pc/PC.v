`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: PC
 * @Description: 程序计数器 (Program Counter) 核心寄存器。
 *               1. 指令寻址：保存当前流水线取指阶段 (IF) 正在访问的指令地址。
 *               2. 状态更新：在每个时钟上升沿根据 npc (Next PC) 更新。
 *               3. 复位机制：采用异步复位。复位时 pc 设置为 -4 (0xFFFFFFFC)，
 *                  这是为了确保系统启动后，首条执行指令的地址从 0 开始。
 */
module PC(
           input    wire        clk,      // 系统时钟
           input    wire        rst_n,    // 异步复位信号，低电平有效
           input    wire[`WIDTH_PC - 1: 0] npc, // 由 NPC 模块计算出的下一条指令地址
           output   reg [`WIDTH_PC - 1: 0] pc   // 当前指令地址输出
       );

/***************************************************************
                        程序计数器时序逻辑
****************************************************************/

always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        // 异步复位：设置初始偏置
        // 设为 -4 是为了让复位后的第一个 npc (pc + 4) 指向 0
        pc <= -4;
    end
    else begin
        // 时钟上升沿：锁存下一条指令地址
        pc <= npc;
    end
end

endmodule