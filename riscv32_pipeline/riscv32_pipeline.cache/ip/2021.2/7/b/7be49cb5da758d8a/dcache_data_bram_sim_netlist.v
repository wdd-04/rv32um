// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon May  4 00:38:13 2026
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [1:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [15:0]doutb;
  wire ena;
  wire enb;
  wire [1:0]wea;
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
  wire [15:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.01735 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
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
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
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
  (* C_WEA_WIDTH = "2" *) 
  (* C_WEB_WIDTH = "2" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
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
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[15:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web({1'b0,1'b0}));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21472)
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
