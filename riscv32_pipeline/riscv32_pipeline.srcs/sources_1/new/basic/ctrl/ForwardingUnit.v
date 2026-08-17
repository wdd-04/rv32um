`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: ForwardingUnit
 * @Description: 前推/旁路控制单元。
 *               监控流水线中的寄存器写回冲突，当检测到 RAW (Read After Write) 冒险时，
 *               通过多路选择器将 EX 阶段或 MEM 阶段的结果直接传递给 ID 阶段的操作数。
 *               这避免了由于数据相关性导致的流水线频繁停顿。
 */
module ForwardingUnit (
          input    wire clk,
          input    wire rst_n,
          input    wire                risk_Ctrl,        // 控制冒险标志
          input    wire [4: 0]         rs1_ID,           // ID 阶段源寄存器 1 地址
          input    wire [4: 0]         rs2_ID,           // ID 阶段源寄存器 2 地址
          input    wire [4: 0]         wr_EX,            // EX 阶段目标寄存器地址
          input    wire [4: 0]         wr_MEM,           // MEM 阶段目标寄存器地址
          input    wire                we_EX,            // EX 阶段寄存器写使能
          input    wire                we_MEM,           // MEM 阶段寄存器写使能
          input    wire [31: 0]        rd_EX,            // EX 阶段产生的计算结果
          input    wire [31: 0]        rd_MEM,           // MEM 阶段准备写回的数据
          output   reg                 MUX_A_forwarding, // 操作数 A 的旁路选择信号
          output   reg                 MUX_B_forwarding, // 操作数 B 的旁路选择信号
          output   reg  [31: 0]        forwardingA,      // 推送到操作数 A 的旁路数据
          output   reg  [31: 0]        forwardingB       // 推送到操作数 B 的旁路数据
      );

// =================================================================
// 冒险检测逻辑 (Hazard Detection Logic)
// =================================================================
// 条件：源寄存器非 x0，且后端阶段有写回操作，且地址匹配

// 检测来自 EX 阶段的数据冒险 (优先级最高)
wire risk_EX_A  = (rs1_ID != 5'd0) && (wr_EX  != 5'd0) && we_EX  && (rs1_ID == wr_EX);
wire risk_EX_B  = (rs2_ID != 5'd0) && (wr_EX  != 5'd0) && we_EX  && (rs2_ID == wr_EX);

// 检测来自 MEM 阶段的数据冒险
wire risk_MEM_A = (rs1_ID != 5'd0) && (wr_MEM != 5'd0) && we_MEM && (rs1_ID == wr_MEM);
wire risk_MEM_B = (rs2_ID != 5'd0) && (wr_MEM != 5'd0) && we_MEM && (rs2_ID == wr_MEM);

// =================================================================
// 操作数 A 的前推选择 (Forwarding for Operand A)
// =================================================================
always @(*) begin
   if (risk_EX_A) begin
       // 优先使用最新的 EX 阶段结果
       MUX_A_forwarding = `ASEL_FORWARDING;
       forwardingA = rd_EX;
   end else if (risk_MEM_A) begin
       // 其次使用 MEM 阶段结果
       MUX_A_forwarding = `ASEL_FORWARDING;
       forwardingA = rd_MEM;
   end else begin
       // 无冒险，使用寄存器堆原始读取值
       MUX_A_forwarding = ~(`ASEL_FORWARDING);
       forwardingA = 32'd0;
   end
end

// =================================================================
// 操作数 B 的前推选择 (Forwarding for Operand B)
// =================================================================
always @(*) begin
   if (risk_EX_B) begin
       // 优先使用最新的 EX 阶段结果
       MUX_B_forwarding = `BSEL_FORWARDING;
       forwardingB = rd_EX;
   end else if (risk_MEM_B) begin
       // 其次使用 MEM 阶段结果
       MUX_B_forwarding = `BSEL_FORWARDING;
       forwardingB = rd_MEM;
   end else begin
       // 无冒险，使用寄存器堆原始读取值
       MUX_B_forwarding = ~(`BSEL_FORWARDING);
       forwardingB = 32'd0;
   end
end

endmodule