/**
 * @Module: divider_32c
 * @Description: 32 周期迭代型除法器。
 *               1. 支持有符号 (DIV/REM) 和无符号 (DIVU/REMU) 运算。
 *               2. 核心算法：基于移位和减法的试商法。每个时钟周期尝试从当前余数中减去除数，
 *                  根据减法结果符号判定当前商位（Quotient bit）为 1 还是 0。
 *               3. 特殊处理：符合 RISC-V 规范，当除数为 0 时，商返回全 1 (0xFFFFFFFF)，余数返回被除数原值。
 */
module divider_32c (
    input  wire         clk,
    input  wire         reset,    
    input  wire         enable,    // 启动信号
    input  wire         sign_sel,  // 符号选择：0 为有符号, 1 为无符号
    input  wire [31:0]  numA,      // 被除数 (Dividend)
    input  wire [31:0]  denB,      // 除数 (Divisor)
    output reg          done,      // 运算完成标志
    output wire         busy_out,  // 忙碌状态输出
    output reg  [31:0]  quotient,  // 商结果
    output reg  [31:0]  remainder  // 余数结果
);

    // 状态机编码
    localparam IDLE = 2'b00, CALC = 2'b01, FINISH = 2'b10;
    
    reg [1:0]  state;
    reg [31:0] a_reg, b_reg, q_reg, num_orig_reg;
    reg [32:0] r_reg;        // 余数寄存器，多出 1 位用于判断减法结果正负
    reg [5:0]  cnt;          // 迭代计数器 (32 down to 0)
    reg        busy_r, sign_q, sign_r, dbz;

    assign busy_out = busy_r;

    // ===============================================================
    // 组合逻辑 (Combinational Logic)
    // ===============================================================
    
    // 预处理：计算被除数和除数的绝对值
    wire [31:0] abs_numA = (sign_sel == 0 && numA[31]) ? (~numA + 1) : numA;
    wire [31:0] abs_denB = (sign_sel == 0 && denB[31]) ? (~denB + 1) : denB;
    
    // 核心试商减法：当前余数左移拼入被除数下一位，减去除数
    wire [32:0] sub_res = {r_reg[31:0], a_reg[31]} - {1'b0, b_reg};

    // ===============================================================
    // 状态机逻辑 (State Machine Control)
    // ===============================================================
    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE; busy_r <= 0; done <= 0;
        end else begin
            done <= 1'b0;
            case (state)
                IDLE: if (enable) begin
                    // 初始化阶段
                    state <= CALC; 
                    busy_r <= 1; 
                    cnt <= 32;
                    a_reg <= abs_numA; 
                    b_reg <= abs_denB; 
                    num_orig_reg <= numA;
                    r_reg <= 0; 
                    q_reg <= 0;
                    // 符号判定：商符号 = A 异或 B，余数符号 = A 符号
                    sign_q <= (sign_sel == 0) ? (numA[31] ^ denB[31]) : 0;
                    sign_r <= (sign_sel == 0) ? numA[31] : 0;
                    dbz <= (denB == 0); // 除零检测
                end

                CALC: if (dbz) begin
                    // 发生除零错误，直接跳转至结束阶段
                    state <= FINISH;
                end else if (cnt > 0) begin
                    // 迭代计算
                    if (!sub_res[32]) begin
                        // 减法结果为正，当前商位为 1，更新余数
                        r_reg <= sub_res;
                        q_reg <= {q_reg[30:0], 1'b1};
                    end else begin
                        // 减法结果为负，当前商位为 0，保留移位后的余数（不减）
                        r_reg <= {r_reg[31:0], a_reg[31]};
                        q_reg <= {q_reg[30:0], 1'b0};
                    end
                    a_reg <= {a_reg[30:0], 1'b0}; // 被除数寄存器左移
                    cnt <= cnt - 1;
                end else state <= FINISH;

                FINISH: begin
                    // 后处理阶段：符号校正与结果输出
                    busy_r <= 0; 
                    done <= 1; 
                    state <= IDLE;
                    
                    // 根据符号标志位对商和余数进行补码转换
                    quotient <= dbz ? 32'hFFFFFFFF : (sign_q ? (~q_reg + 1) : q_reg);
                    remainder <= dbz ? num_orig_reg : (sign_r ? (~r_reg[31:0] + 1) : r_reg[31:0]);
                end
            endcase
        end
    end
endmodule