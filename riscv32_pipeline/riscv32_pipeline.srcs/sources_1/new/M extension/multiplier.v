/**
 * @Module: multiplier_16c
 * @Description: 16 周期迭代型乘法器。
 *               1. 支持有符号 (MUL/MULH)、无符号 (MULHU) 以及混合符号 (MULHSU) 运算。
 *               2. 核心算法：基-4 (Radix-4) 移位加逻辑。每个时钟周期检查操作数 Q 的低 2 位，
 *                  根据其值（0, 1, 2, 3）决定累加被乘数 M 的倍数，然后整体右移 2 位。
 *               3. 符号处理：先取绝对值运算，最后根据 sign_r 结果符号位进行补码校正。
 */
module multiplier_16c (
    input  wire        clk,
    input  wire        reset,    
    input  wire        enable,   // 启动信号
    input  wire [1:0]  sign_sel, // 符号选择：00: SS, 01: SU, 10: UU (S=Signed, U=Unsigned)
    input  wire [31:0] opA,      // 被乘数 (Multiplicand)
    input  wire [31:0] opB,      // 乘数 (Multiplier)
    output reg         done,     // 运算完成标志
    output reg  [63:0] product   // 64 位乘积结果
);
    reg [31:0] acc, q, m;        // acc: 累加器高位, q: 乘数及结果低位, m: 被乘数缓存
    reg [4:0]  cnt;              // 迭代计数器 (从 16 递减至 0)
    reg        busy, sign_r;     // busy: 工作中状态, sign_r: 最终结果是否取反

    // ===============================================================
    // 预处理逻辑 (Pre-processing: Sign & Absolute Value)
    // ===============================================================
    
    // 根据 sign_sel 对 opA 和 opB 进行绝对值转换
    wire [31:0] opA_abs = (sign_sel[1] == 0 && opA[31]) ? (~opA + 1) : opA;
    wire [31:0] opB_abs = (sign_sel == 2'b00 && opB[31]) ? (~opB + 1) : opB;
    
    // 结果符号判定逻辑
    wire        res_sign = (sign_sel == 2'b00) ? (opA[31] ^ opB[31]) : 
                           (sign_sel == 2'b01) ? opA[31] : 1'b0;

    // 位扩展，用于处理加法溢出（最大加 3 倍 m）
    wire [33:0] acc_ext = {2'b0, acc};
    wire [33:0] m_ext   = {2'b0, m};
    reg  [33:0] next_acc;

    // ===============================================================
    // 迭代步进逻辑 (Iteration Step: Radix-4 Partial Product)
    // ===============================================================
    
    // 根据乘数 q 的低两位决定本次迭代加多少倍的被乘数
    always @(*) begin
        case (q[1:0])
            2'b01:   next_acc = acc_ext + m_ext;           // +1 * M
            2'b10:   next_acc = acc_ext + (m_ext << 1);    // +2 * M
            2'b11:   next_acc = acc_ext + m_ext + (m_ext << 1); // +3 * M
            default: next_acc = acc_ext;                   // +0
        endcase
    end

    // ===============================================================
    // 状态机与控制 (Control & State Machine)
    // ===============================================================
    always @(posedge clk) begin
        if (reset) begin
            busy <= 1'b0; done <= 1'b0; product <= 64'd0; cnt <= 5'd0;
            acc <= 32'd0; q <= 32'd0; m <= 32'd0; sign_r <= 1'b0;
        end else begin
            done <= 1'b0;
            if (!busy) begin
                if (enable) begin
                    // 初始化运算状态
                    busy <= 1'b1; 
                    cnt <= 5'd16;    // 32 位除以 2 位/周期 = 16 周期
                    m <= opA_abs; 
                    q <= opB_abs; 
                    acc <= 32'd0; 
                    sign_r <= res_sign;
                end
            end else begin
                if (cnt > 0) begin
                    // 核心移位操作：{acc, q} 整体右移 2 位
                    {acc, q} <= {next_acc, q} >> 2;
                    cnt <= cnt - 5'd1;
                end else begin
                    // 运算结束：处理最终符号并输出
                    busy <= 1'b0; 
                    done <= 1'b1;
                    // 如果结果符号为负，进行补码取反加一
                    product <= sign_r ? (~{acc, q} + 1) : {acc, q};
                end
            end
        end
    end
endmodule