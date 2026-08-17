// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon May  4 00:31:32 2026
// Host        : WDDdLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top icache_data_bram -prefix
//               icache_data_bram_ icache_data_bram_sim_netlist.v
// Design      : icache_data_bram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "icache_data_bram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module icache_data_bram
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
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
  wire [0:0]wea;
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
  (* C_BYTE_SIZE = "9" *) 
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
  (* C_INIT_FILE = "icache_data_bram.mem" *) 
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
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  icache_data_bram_blk_mem_gen_v8_4_5 U0
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
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 30960)
`pragma protect data_block
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
iuB7df1MpS2Y
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
