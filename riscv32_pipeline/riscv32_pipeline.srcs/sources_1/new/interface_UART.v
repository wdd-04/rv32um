module Interface_UART #(
    parameter integer CLK_FREQ  = 75_000_000,
    parameter integer BAUD_RATE = 115200
) (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        BG,
    input  wire [31:0] addr,
    input  wire [0:0]  ctrl,
    input  wire [31:0] wdata,
    inout  wire [31:0] data,
    output wire        tx_pin
);

    wire we = BG &&  ctrl[0];
    wire re = BG && !ctrl[0];

    wire is_data_reg   = (addr[3:2] == 2'b00); // 0xFFFFF080
    wire is_status_reg = (addr[3:2] == 2'b01); // 0xFFFFF084

    wire tx_busy;
    wire tx_start = we && is_data_reg && !tx_busy;
    wire [7:0] tx_data = wdata[7:0];

    uart_tx #(
        .CLK_FREQ  (CLK_FREQ),
        .BAUD_RATE (BAUD_RATE)
    ) uart_tx_inst (
        .clk      (clk),
        .rst_n    (rst_n),
        .tx_start (tx_start),
        .tx_data  (tx_data),
        .tx       (tx_pin),
        .tx_busy  (tx_busy)
    );

    assign data = re ? (is_status_reg ? {31'b0, tx_busy} : 32'h0) : 32'hzzzzzzzz;

endmodule

module uart_tx #(
    parameter integer CLK_FREQ  = 75_000_000,
    parameter integer BAUD_RATE = 115200
)(
    input  wire       clk,
    input  wire       rst_n,
    input  wire       tx_start,
    input  wire [7:0] tx_data,
    output reg        tx,
    output reg        tx_busy
);

    localparam integer CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;

    localparam s_IDLE  = 3'b000;
    localparam s_START = 3'b001;
    localparam s_DATA  = 3'b010;
    localparam s_STOP  = 3'b011;

    reg [2:0]  state;
    reg [31:0] clk_count;
    reg [2:0]  bit_idx;
    reg [7:0]  tx_data_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state       <= s_IDLE;
            clk_count   <= 0;
            bit_idx     <= 0;
            tx_data_reg <= 8'h00;
            tx          <= 1'b1;
            tx_busy     <= 1'b0;
        end else begin
            case (state)
                s_IDLE: begin
                    tx        <= 1'b1;
                    tx_busy   <= 1'b0;
                    clk_count <= 0;
                    bit_idx   <= 0;

                    if (tx_start) begin
                        tx_data_reg <= tx_data;
                        tx_busy     <= 1'b1;
                        state       <= s_START;
                    end
                end

                s_START: begin
                    tx <= 1'b0;
                    if (clk_count < CLKS_PER_BIT - 1) begin
                        clk_count <= clk_count + 1;
                    end else begin
                        clk_count <= 0;
                        state     <= s_DATA;
                    end
                end

                s_DATA: begin
                    tx <= tx_data_reg[bit_idx];
                    if (clk_count < CLKS_PER_BIT - 1) begin
                        clk_count <= clk_count + 1;
                    end else begin
                        clk_count <= 0;
                        if (bit_idx < 7) begin
                            bit_idx <= bit_idx + 1;
                        end else begin
                            bit_idx <= 0;
                            state   <= s_STOP;
                        end
                    end
                end

                s_STOP: begin
                    tx <= 1'b1;
                    if (clk_count < CLKS_PER_BIT - 1) begin
                        clk_count <= clk_count + 1;
                    end else begin
                        clk_count <= 0;
                        state     <= s_IDLE;
                    end
                end

                default: state <= s_IDLE;
            endcase
        end
    end

endmodule
