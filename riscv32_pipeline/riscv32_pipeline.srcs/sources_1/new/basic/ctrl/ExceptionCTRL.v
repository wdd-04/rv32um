`ifdef DEBUG
    `include "param.v"
`else
    `include "../../param.v"
`endif

/**
 * @Module: ExceptionCTRL
 * @Description: 异常与冒险控制单元。
 *               主要功能：
 *               1. 检测 Load-Use 数据冒险：当上一条指令是加载指令且其目标寄存器
 *                  是当前指令的源寄存器时，插入一个周期的气泡。
 *               2. 处理控制冒险：当分支预测错误或发生跳转时，暂停或清空流水线。
 *               3. 响应存储层停顿：处理 Cache Miss 导致的流水线整体停顿。
 *               4. 配合指令拆分：当指令需要多个周期完成时（如非对齐访存），维持停顿。
 */
module ExceptionCTRL (
    input    wire [4: 0]         rs1_ID,      // ID 阶段源寄存器 1 地址
    input    wire [4: 0]         rs2_ID,      // ID 阶段源寄存器 2 地址
    input    wire [4: 0]         wr_EX,       // EX 阶段写回目标寄存器地址
    input    wire                isLoad,      // EX 阶段指令是否为 Load 指令
    input    wire                inst_div,    // 指令拆分状态信号
    input    wire                isRiskCtrl,  // 控制冒险检测信号（如分支跳转确定）
    input    wire                cache_stall, // 来自缓存系统的停顿请求
    output   wire                stop_ID,     // 停顿 ID 阶段信号（清空 ID/EX 寄存器）
    output   wire                stop_IF      // 停顿 IF 阶段信号（保持 PC 不变）
);

// =================================================================
// Load-Use 冒险检测 (Load-Use Hazard Detection)
// =================================================================
wire risk_LoadUse;

// 逻辑：如果 EX 阶段是加载指令，且其写回寄存器与 ID 阶段读取的寄存器相同（非 x0），
// 则存在数据依赖，必须暂停一个周期等待数据从存储器读出。
assign risk_LoadUse = (isLoad && (rs1_ID == wr_EX || rs2_ID == wr_EX) && (wr_EX != 5'b00000)) ? 1'b1 : 1'b0;

// =================================================================
// 控制冒险检测 (Control Hazard Detection)
// =================================================================
wire risk_Ctrl;
wire stop_EX;

assign risk_Ctrl = isRiskCtrl; // 接收来自跳转逻辑的冒险信号

// =================================================================
// 停顿信号生成与气泡插入 (Stall and Bubble Generation)
// =================================================================

/**
 * IF 阶段停顿逻辑：
 * 导致 PC 指针和 IF/ID 寄存器保持不变的条件：
 * 1. 发生 Load-Use 冒险。
 * 2. 指令正在进行拆分执行。
 * 3. Cache 未准备好 (Miss)。
 */
assign stop_IF = risk_LoadUse | inst_div  | cache_stall;

/**
 * ID 阶段停顿逻辑：
 * 导致译码内容无效（向 EX 阶段注入空泡/清空 ID/EX）的条件：
 * 1. 发生 Load-Use 冒险。
 * 2. 发生控制冒险（跳转生效，当前译码指令应废弃）。
 * 3. Cache 未准备好。
 */
assign stop_ID = risk_LoadUse | risk_Ctrl | cache_stall;

// 注意：在复杂的 SoC 设计中，若 Cache 停顿，通常建议 EX, MEM, WB 阶段也同步 Stall，
// 以防止流水线后端指令在访存缺失时继续推进导致数据丢失。

endmodule