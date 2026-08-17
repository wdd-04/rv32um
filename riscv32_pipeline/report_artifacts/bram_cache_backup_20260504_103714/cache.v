module cache #(
    parameter INDEX_WIDTH = 8
)(
    input wire clk,
    input wire rst_n,
    input wire flush,
    input wire [31:0] addr,
    input wire [31:0] din,
    input wire we,
    input wire [3:0] byte_we,
    output reg [31:0] dout,
    output reg hit
);
    localparam TAG_WIDTH = 32 - INDEX_WIDTH - 2;

    reg [TAG_WIDTH-1:0] tag0 [0:(1<<INDEX_WIDTH)-1];
    reg [TAG_WIDTH-1:0] tag1 [0:(1<<INDEX_WIDTH)-1];
    reg [31:0] data0 [0:(1<<INDEX_WIDTH)-1];
    reg [31:0] data1 [0:(1<<INDEX_WIDTH)-1];
    reg valid0 [0:(1<<INDEX_WIDTH)-1];
    reg valid1 [0:(1<<INDEX_WIDTH)-1];
    reg lru [0:(1<<INDEX_WIDTH)-1];

    wire [INDEX_WIDTH-1:0] index = addr[INDEX_WIDTH+1:2];
    wire [TAG_WIDTH-1:0] tag = addr[31:INDEX_WIDTH+2];

    wire hit0 = valid0[index] && (tag0[index] == tag);
    wire hit1 = valid1[index] && (tag1[index] == tag);

    always @(*) begin
        hit = hit0 || hit1;
        dout = hit0 ? data0[index] : (hit1 ? data1[index] : 32'b0);
    end

    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n || flush) begin
            for (i = 0; i < (1<<INDEX_WIDTH); i = i + 1) begin
                valid0[i] <= 1'b0;
                valid1[i] <= 1'b0;
                lru[i]    <= 1'b0;
            end
        end else if (we) begin
            if (hit0) begin
                if (byte_we[0]) data0[index][7:0]   <= din[7:0];
                if (byte_we[1]) data0[index][15:8]  <= din[15:8];
                if (byte_we[2]) data0[index][23:16] <= din[23:16];
                if (byte_we[3]) data0[index][31:24] <= din[31:24];
                lru[index] <= 1'b1;
            end else if (hit1) begin
                if (byte_we[0]) data1[index][7:0]   <= din[7:0];
                if (byte_we[1]) data1[index][15:8]  <= din[15:8];
                if (byte_we[2]) data1[index][23:16] <= din[23:16];
                if (byte_we[3]) data1[index][31:24] <= din[31:24];
                lru[index] <= 1'b0;
            end else if (lru[index] == 1'b0) begin
                tag0[index]   <= tag;
                valid0[index] <= 1'b1;
                if (byte_we[0]) data0[index][7:0]   <= din[7:0];
                if (byte_we[1]) data0[index][15:8]  <= din[15:8];
                if (byte_we[2]) data0[index][23:16] <= din[23:16];
                if (byte_we[3]) data0[index][31:24] <= din[31:24];
                lru[index]    <= 1'b1;
            end else begin
                tag1[index]   <= tag;
                valid1[index] <= 1'b1;
                if (byte_we[0]) data1[index][7:0]   <= din[7:0];
                if (byte_we[1]) data1[index][15:8]  <= din[15:8];
                if (byte_we[2]) data1[index][23:16] <= din[23:16];
                if (byte_we[3]) data1[index][31:24] <= din[31:24];
                lru[index]    <= 1'b0;
            end
        end else if (hit0) begin
            lru[index] <= 1'b1;
        end else if (hit1) begin
            lru[index] <= 1'b0;
        end
    end
endmodule
