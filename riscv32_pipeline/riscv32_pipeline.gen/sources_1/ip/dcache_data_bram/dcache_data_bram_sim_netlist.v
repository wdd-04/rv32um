// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon May  4 10:30:34 2026
// Host        : WDDdLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/riscv32_pipeline_cache/riscv32_pipeline.gen/sources_1/ip/dcache_data_bram/dcache_data_bram_sim_netlist.v
// Design      : dcache_data_bram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dcache_data_bram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module dcache_data_bram
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [7:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [63:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [63:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [63:0]dina;
  wire [63:0]doutb;
  wire ena;
  wire enb;
  wire [7:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [63:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     6.966099 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "dcache_data_bram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "64" *) 
  (* C_READ_WIDTH_B = "64" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "8" *) 
  (* C_WEB_WIDTH = "8" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  dcache_data_bram_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[63:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oESHD2Q5NORrmTVTCApB+YFZJwjA1ezq7U6VZh96by+ofPCvSFp06AIoCLvB4BhPvxfob6kIkBpR
xVCOLM7HsDk7nO1JVWiYIJ6okoWTA8hAlPj3sdGuMwRlZNSBKn/c6F+CW5Jl37TEGotkhycSB3Bg
B/uu1THUZwIG87RPahE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RovEhaqHrFqzjckk+DIWG8LQeqg2Y/nACQDyXKKtSav7YHlgpKmgHZnsxwwNpqrqVRGyjTecSQ+e
6Mr/Pi9au3AgJVPL6VOgwNVE0yj2LpA4LPyWzxLN3+DiSDmsaCBNCBlVQi2MRKUabou8nLaXldbL
+7pv4pYhQdcyjDzuC2dx3HmzADqstdEiyXeU3ktJ29CDLDmGwDWdmsrl90s4YQSfBV2nj4/Vut3L
p/8dzphf1htPaNMujMxxgp3z4JzUEDJJokDL+gNutEEHiaWpI3URIA5v22vJu+NPD+eEraSioHfL
DPKAajZTwK5FHnonu4O2D0co8GWqWW5cUqZz9A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jBQ6Th9yy7jtKQD1h235YLT6qO6XiBaBKGJrV1Z8H9M9ePJ9R/fA8E1okt4LyBvoWjR7tmCbIg7A
0/vuKOogkLtDE/BtTlp4z1iurO8rQrAcdZy/e+7GATawyJxFY7kZhnXASu9zB8TiOBELSlapkpxe
WuAzXLde9FBMBkq4RSc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eucSNV2Zbm4zYc2tIGRlGmlVM8+WHY1NHe9drZdgDhGPOHz8PTqHapfnZ1kWuTLtPBLSMvcXNScn
UTvpULofBV6qD7WHLPg7UJcjpZVDL69lk88chgqrlc/RqaJXKNVv+Ubku53ZLU20uZK71bNymjSM
855RVWw5lvTHTCNC2MYIS94Fmrzuq8i0+tFh5qBKkHK2BC+fD7xVyyfuh4mZR2yr/hRs/emoI79E
IKoJnLiglVp6RXTsXFzZW4pIthbjWSuZlOQvoYkS2RMj8a0r9lyariphRQunoudc0bLO4Phk578c
40gusaaS/MI7idMT7k1Di96kvu5mHi23loRcZQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E/syLaRG2Ss/xTTkuAkOKXzm53+rCptYO2DkVukWhvlLmEB2daHCPrXt4gKeuG+0hIGWedSwCiLJ
7KNtEAiTumJ/j+3p7s3oXN9ftCSRolXoACsCclEAmwYjVM0ubCXUx6JNFOGt0yDl2Jsd5+W10mSJ
bYEKvRKi7koXM/eYJqbhTrtsrHDwRJEY0JVUPh8EOkLLqaIKbnjb6ENEY6qZOamp5PaWsSS30gJM
N6fB8D1AmGKnFbfY+d5TexS55Z92aYcAHNX2XwHsKnm45az1vHeZ0rTEU/oONIaSZfikRni1iDBg
x2GOue6sLiwxTEHaVkTJsOVR4mx0VsfFxavwRg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dSHHpkQiOEzzKs4D71WVyDXLpkKuR9h9h3pBLtnCq2bXiwE/eQHmk5HeQb+qREg0Yv193OukqaQz
RZyuF5GQcqOpqFHMxO62HQ2pdjdpMT5CC7gHvmgiw9qBkJJrXpihIHER4X7OF2iNUfeqxJ8eiSz3
C0V20NlIwKG7Mxg8MVj++xmb32KMUqL7ptikkym20vVdhecVMNvpPoXp8uvaGT7991enWP9HGKUC
9kLY2DEYwRGE71UJJLGWo4n49R50ExFRj91xWnYfvp7uJsMNwnBp5l3GTZiMELX2RkRVSPOHr7l1
n2p5Vq7Uee2drny1IxZ/4c0hYY6y3QWSEqpESw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HUtfqZ9dh5oZTOAt9a0ebo+wQbzg3izFQ0kVqZN81S4cBjQEF53WUiVlTKBDVjvLNUby4Se9WZjj
j86TQzuGJxLPDTohmbytErsg5JrlXHbHGwR4zGNGTbBs12X7PkxtS8wVCp+7b1rX6pOGOPqm6FoG
g6rZY/bTzVfGYF2CAOhjJUqUOXEAKnZRehspRyiBI28/ZZPSAUD/abKprW8PWCxMx2zPWztZz4No
R96jgvHezNzB1Ta8W7uRBFTMp+XVSToxTp2jzSXJZ0V5xJl+gdVjAMmf6+te2vqrK2wDWdMxk3Sf
iyLI4d0s25vCybcY2fZWacq5iO9pSlSaOQWgCA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
vYYu2Kvhv3RZi0pFbjRTQ/BBwfilCrGpkMls+Dz6HBGTZvSaC/anWgymoDS0XnoSENGG3Pz3EBF0
19OqLbyna95IHFe2bA7f8RgU9SEUffZ8eXGigfOjAWpZCN07Q77RkhGUKal7okWe3Q6xHtZy83l2
kW8ma3kOYL7GzQjtpbP3lINHLMqpGEo0dzbOHiJ5r6W5U6DsILGsoLQOXcw+MwrevvNRB0KkSklj
QnL8K2AK8PIsJGM6F8dj5KwRYhSBYNb1opuVpiJWlbHgADoeM+dhiRxBLmnaDE8PWs1ReY6uMzzH
SvvO6UEyxQtvS/Smm/uogr1eUFedUaBHPMEXnYlTAv/SKrh942GeknsqfrjGkZxWTN2NEnvpRUwT
fS0pyd/Err0s94b0srmcTYyxZfJGRUct2T8MCphZFaScAlhn655pxW9RaHMfcvDJUHpW8Qa+KhRt
9CWYScPIH6YNDByLQbhKL5BTpAYMNYPF2W7vM2ZzDob2NB7m6GGeKRr3

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QSNmIeTT4pBji+CTjknWXN6sH9Wff8+t8KF+AC3fIoIw08jtLtShcB9ZGeEKG02RGCO4lNIUf5YB
2TVYk6EJ5XyCav12qDhc60n56UVrnpfo7drorY0NmOypuxECgO43h6SDWp9W7px3r4CJnQ4+X2Mj
943GdP30WfL5kbWHZJC1Dz9cBIqRa1EbNXvvAqBvRPS2+aXBXAPOC4rNVZGeIUspn/33IW3yJLSp
Jm5GIct87ZuSoz8+DXhUvsTj4hq8lgirVhfz1qhHm8SfODcE91FGUPw3vbpGWXsBX73t2zxFC1Hz
/6m4YqQJVxd+H5iGE4kbHxHyHnH7FIerqc8Phw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UhfxKxECbuHK/o9ZExa2zP/MIPmFXuDNZwgpiawuBmPeRI1nJsYB7vzbBGMPKny4yIHLT8mHrQRc
fs05atkjIAbLea4+WNoCdCeg7/0PzuodM1ol3it6BHQ6Yzq4mnZbzlk8Xtwmk8ACAbzOr2SYxYWX
ueuUlimUSRusIe4+NiPvzbfHMAOVPjdmSY7zaSyeJuhdAR+fUGeHy5B23Xe2X6cDPeJ75IqcBeul
ox3dTXi3L8r/s1bTKX3FhxRyPZuh/xCWuEajsF2fEYdwWHKtLX6IQniLBJ5ZnVSS8D7IYPsvV4t0
9rWJqto5O1n3rAM44OvKvc9pOYXJupuv7g3gWg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fmo66vhS7nigYtLDMjdj7hgUnDG/fnO+cIaY/3qHrcwT7u/paj5enLuWHovegu9O9WRq3pPNnjuN
6vZRpuCgz5p4VAV7dVg9fuzg99BAjThp1Q/+HIPfdQ2LM14ZpTh4FXxthHGkTyS5PJArvZ3/UMpW
zwfdYd5+k2/emJ4/nuqoJHQG8k+O5EjSprLTvNZ/wrE1cT/fW/Lu2pxI4msHqVVYAXz7sJ13cQ+C
7tKxCV8vTyf0rpStdE+kZXg+jrc7vFKuPJO0U9axMsC0nXyeYx2jzfAHptGWKvfQaPg/Eo9mgLyN
qSJfFS6aIycuxNmg7L82WK401aWhnUn7GNrudg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31216)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
