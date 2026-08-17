`ifdef DEBUG
    `include "param.v"
`else
`include "../../param.v"
`endif

/**
 * @Module: ImmGen (Immediate Generator)
 * @Description: 立即数生成器。
 *               根据输入的指令位段和控制信号（SextOpe），将不连续的立即数位
 *               重组为完整的 32 位数据。支持 I-type, S-type, B-type, U-type, J-type。
 */
module ImmGen (
           input   wire [31: 7]   imm,      // 输入指令中可能包含立即数的位段
           input   wire [4: 0]    SextOpe,  // 立即数类型选择信号 (来自 CTRL)
           output  wire [31: 0]   out       // 输出扩展后的 32 位立即数
       );

reg  [31: 0] out_reg;
assign out = out_reg;

// =================================================================
// 指令字段拆解 (Instruction Field Slicing)
// =================================================================
// 将输入的 31:7 位段进一步拆分为更小的片断，以便于后续按不同格式拼接

wire inst0                  = imm[31];     // 符号位 (Sign Bit)
wire [5: 0]     inst1       = imm[30: 25];
wire [3: 0]     inst2       = imm[24: 21];
wire inst3                  = imm[20];
wire [7: 0]     inst4       = imm[19: 12];
wire [3: 0]     inst5       = imm[11: 8];
wire inst6                  = imm[7];

// 符号位扩展预处理
wire [11: 0]    signalEX_12 = {12{inst0}}; // 12 位符号扩展
wire [19: 0]    signalEX_20 = {{8{inst0}}, signalEX_12[11: 0]}; // 20 位符号扩展

// =================================================================
// 立即数类型组合 (Immediate Type Reassembly)
// =================================================================

wire [31: 0] imm_I; // 算术/加载指令立即数
wire [31: 0] imm_S; // 存储指令立即数
wire [31: 0] imm_B; // 分支指令立即数 (带 LSB 补 0)
wire [31: 0] imm_J; // 跳转指令立即数 (带 LSB 补 0)
wire [31: 0] imm_U; // 高位立即数 (如 LUI, AUIPC)

assign imm_I = {signalEX_20, inst0, inst1, inst2, inst3};
assign imm_S = {signalEX_20, inst0, inst1, inst5, inst6};
assign imm_B = {signalEX_20, inst6, inst1, inst5, 1'b0}; // 偏移量：位 12, 10:5, 4:1, 0
assign imm_J = {signalEX_12, inst4, inst3, inst1, inst2, 1'b0}; // 偏移量：位 20, 19:12, 11, 10:1, 0

//// 提示：原本注释中提到的修改逻辑已在内部实现或作为备选参考
//assign imm_B = {signalEX_20, inst0, inst6, inst1, inst5, 1'b0}; 
//assign imm_J = {signalEX_12, inst0, inst4, inst3, inst1, inst2, 1'b0}; 

assign imm_U = {inst0, inst1, inst2, inst3, inst4, 12'd0}; // U-type 填入高 20 位，低位补 0

// =================================================================
// 输出选择逻辑 (Output Multiplexing)
// =================================================================

always @(*) begin
    case (SextOpe)
        `IMM_I: begin
            // I-type: 常用作 ALU 立即数或 Load offset
            out_reg[31: 0] = imm_I[31: 0];
        end
        `IMM_S: begin
            // S-type: 用于 Store 指令的 offset
            out_reg[31: 0] = imm_S[31: 0];
        end
        `IMM_B: begin
            // B-type: 用于 Branch 分支跳转偏移量
            out_reg[31: 0] = imm_B[31: 0];
        end
        `IMM_J: begin
            // J-type: 用于 JAL 指令偏移量
            out_reg[31: 0] = imm_J[31: 0];
        end
        `IMM_U: begin
            // U-type: 用于 LUI/AUIPC，将立即数加载至高 20 位
            out_reg[31: 0] = imm_U[31: 0];
        end
        default: begin
            out_reg[31: 0] = 32'b0;
        end
    endcase
end

endmodule