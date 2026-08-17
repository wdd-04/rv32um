module icache_data_bram(
    input  wire        clka,
    input  wire        ena,
    input  wire [0:0]  wea,
    input  wire [7:0]  addra,
    input  wire [63:0] dina,
    input  wire        clkb,
    input  wire        enb,
    input  wire [7:0]  addrb,
    output reg  [63:0] doutb
);
    reg [63:0] mem [0:255];
    integer i;
    initial begin
        doutb = 64'b0;
        for (i = 0; i < 256; i = i + 1) begin
            mem[i] = 64'b0;
        end
    end
    always @(posedge clka) begin
        if (ena && wea[0]) begin
            mem[addra] <= dina;
        end
    end
    always @(posedge clkb) begin
        if (enb) begin
            doutb <= mem[addrb];
        end
    end
endmodule

module dcache_data_bram(
    input  wire        clka,
    input  wire        ena,
    input  wire [7:0]  wea,
    input  wire [7:0]  addra,
    input  wire [63:0] dina,
    input  wire        clkb,
    input  wire        enb,
    input  wire [7:0]  addrb,
    output reg  [63:0] doutb
);
    reg [63:0] mem [0:255];
    integer i;
    initial begin
        doutb = 64'b0;
        for (i = 0; i < 256; i = i + 1) begin
            mem[i] = 64'b0;
        end
    end
    always @(posedge clka) begin
        if (ena) begin
            if (wea[0]) mem[addra][7:0]   <= dina[7:0];
            if (wea[1]) mem[addra][15:8]  <= dina[15:8];
            if (wea[2]) mem[addra][23:16] <= dina[23:16];
            if (wea[3]) mem[addra][31:24] <= dina[31:24];
            if (wea[4]) mem[addra][39:32] <= dina[39:32];
            if (wea[5]) mem[addra][47:40] <= dina[47:40];
            if (wea[6]) mem[addra][55:48] <= dina[55:48];
            if (wea[7]) mem[addra][63:56] <= dina[63:56];
        end
    end
    always @(posedge clkb) begin
        if (enb) begin
            doutb <= mem[addrb];
        end
    end
endmodule