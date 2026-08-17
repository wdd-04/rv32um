`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: BranchCTRL
 * @Description: 分支控制单元，负责根据比较器的输出结果 (COMPOut) 
 *               和指令译码出的控制信号 (PCCTRL) 决定最终的程序计数器选择信号 (PCSel)。
 */
module BranchCTRL (
           input wire [`WIDTH_PCCTRL - 1 : 0]   PCCTRL,   // 来自译码阶段的分支控制类型
           input wire [`WIDTH_COMPOUT - 1 : 0]  COMPOut,  // 来自执行阶段比较器的原始结果
           output reg  [`WIDTH_PCSEL - 1 : 0]   PCSel     // 下一周期 PC 选择路径信号
       );

// 分支类型解析
wire branch_b    = PCCTRL[`PCCTRL_B]; // 标志当前是否为 B-Type 指令 (如 beq, bne 等)
wire branch_j    = PCCTRL[`PCCTRL_J]; // 标志当前是否为 J-Type 或无条件跳转指令 (如 jal, jalr)

// =================================================================
// 比较结果解码 (Comparator Result Decoding)
// =================================================================
// 根据 COMPOut 的编码值，解析出具体的逻辑比较结果
wire COMP_EQ    = (COMPOut == 2'b00) ? 1'b1 : 1'b0; // 相等
wire COMP_NEQ   = ~COMP_EQ;                         // 不相等
wire COMP_LE    = (COMPOut == 2'b01) ? 1'b1 : 1'b0; // 小于 (Less Than)
wire COMP_GE_EQ = ~COMP_LE;                         // 大于等于 (Greater or Equal)

// =================================================================
// 下一跳地址选择逻辑 (Next PC Selection Logic)
// =================================================================
always @ (*) begin
    if (branch_b) begin
        // B-Type 分支逻辑：根据指令子类型 (beq/bne/blt/bge) 判断跳转条件是否满足
        case (PCCTRL[1: 0])
            `PCCTRL_B_EQ: begin // beq: 若相等则跳转
                PCSel = (COMP_EQ) ? `PCSEL_JUMP : `PCSEL_PC4;
            end
            `PCCTRL_B_NE: begin // bne: 若不相等则跳转
                PCSel = (COMP_NEQ) ? `PCSEL_JUMP : `PCSEL_PC4;
            end
            `PCCTRL_B_LT: begin // blt / bltu: 若小于则跳转
                PCSel = (COMP_LE) ? `PCSEL_JUMP : `PCSEL_PC4;
            end
            default: begin // bge / bgeu: 若大于等于则跳转
                PCSel = (COMP_GE_EQ) ? `PCSEL_JUMP : `PCSEL_PC4;
            end
        endcase
    end
    else if (branch_j) begin 
        // 无条件跳转逻辑：对于 jal 或 jalr 指令，PCSel 直接指向跳转目标地址
        PCSel = `PCSEL_JUMP;
    end
    else begin
        // 默认情况：顺序取指 (PC + 4)
        PCSel = `PCSEL_PC4;
    end
end

endmodule