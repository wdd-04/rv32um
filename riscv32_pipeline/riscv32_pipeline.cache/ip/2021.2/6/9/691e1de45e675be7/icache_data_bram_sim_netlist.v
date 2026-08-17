// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon May  4 00:31:32 2026
// Host        : WDDdLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ icache_data_bram_sim_netlist.v
// Design      : icache_data_bram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "icache_data_bram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31232)
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
