// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon May  4 10:30:33 2026
// Host        : WDDdLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dcache_data_bram_sim_netlist.v
// Design      : dcache_data_bram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dcache_data_bram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31200)
`pragma protect data_block
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
0I0BhgktwmDHpfOImXWStwBFelOo
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
