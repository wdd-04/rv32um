// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Tue Apr 14 00:15:34 2026
// Host        : WDDdLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/riscv32_pipeline/riscv32_pipeline.gen/sources_1/ip/inst_mem/inst_mem_sim_netlist.v
// Design      : inst_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a12ticsg325-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "inst_mem,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module inst_mem
   (a,
    spo);
  input [13:0]a;
  output [31:0]spo;

  wire \<const0> ;
  wire [13:0]a;
  wire [30:0]\^spo ;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;
  wire [31:11]NLW_U0_spo_UNCONNECTED;

  assign spo[31] = \<const0> ;
  assign spo[30] = \^spo [30];
  assign spo[29] = \<const0> ;
  assign spo[28] = \<const0> ;
  assign spo[27:20] = \^spo [27:20];
  assign spo[19] = \<const0> ;
  assign spo[18] = \<const0> ;
  assign spo[17:15] = \^spo [17:15];
  assign spo[14] = \<const0> ;
  assign spo[13] = \^spo [13];
  assign spo[12] = \<const0> ;
  assign spo[11] = \<const0> ;
  assign spo[10:0] = \^spo [10:0];
  GND GND
       (.G(\<const0> ));
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "14" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "16384" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "inst_mem.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  (* is_du_within_envelope = "true" *) 
  inst_mem_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo({NLW_U0_spo_UNCONNECTED[31],\^spo }),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
qBHgXmwbTbZKEU9tcjZbsi+ExctvD8XefVx14BkxLFOTaColWRgtKU9vhojRxOADVyuCsE7IUw5/
fIBh9Lwwg/1gRLE7njxHZhWAz9S1sVJTpj4NzEQ/HyJYMIoxPpczRyPcn1WxmVNQqNuYI1QUkQdA
njnTdD+zeIXLmFmD1F8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
V/TizgGPju21MuRFF7y/ABvr1JqliOqk4fYco5uCOBoyUST+UXZx+hvy+kbS/LIOoofVkSPNsgIB
cZoZuq7YCpk/jDm/+3eTRWDEB56vO8JkeH1jwR7EzYU3QoipBAujdnlLacwL/Qy/9BMtpw8ZC+MO
wBnu3Kj0Q1dJVGnfxGEY6YDPJ+d21AYrk0MUpKHc8NVxv4Hojk39AhtxcEVXw2v2A/fQ9jZC/Ndf
05gPeW4R8LQP/EGbOdtsgq9I5dfdsNv7iKW511rAce2zY8b2yC3vfsAK+YvJlJhR9xErRgfrNVjL
Wf/LCVNpz2k1nBpoU73eFFZpZpBgcK2RDNk23w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Bq6b1vbyY3ChcNU6TEnpKgFXql2W7SCpYB5BjNQXc3pXJDMmVkEfYRRu3dus6SDMFXRHG0YcdGWS
/wS2NHW3Y4jbYKRazEyz7v6YOZcyrun1KL6tR+AG/wFDOveXfxNNB+zhBzCpD4rjZneOXH/S238v
1RhzzAtXry9bFvLFEvM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bYFsVmVVlPDgpJA7LNUGgEzYGUdTNv5Vsc3Jwzl3M7dMROVIX3hQvamUB9EXDcek0Zh/sGPCLhKi
ldQUStkE/1cexALf6/IyDRsZwk6TfIOli5xAX33R98gH53kMGqm4LeMSjvxdw1HFasq3DFQf9MFS
2Vd3MBk2RQ7oHEiynkyQ6u6rVzyv/fEvYXD4vddz2P59pyQWGFNkNK2IO+xY995zx5+zEWsxRbhY
BiKHBy3THjpQOfIu9GAuI55cn3CQjjpvKXcx+Y3heO9CKpqZLGfEqa24KfEbqGfiApu6kTIVexUg
dDBIIdD+N8LJltHRpZ+jbHfXPp+zcquX5mHHjw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Qj/0qDRoIRfY71MSM/IDZuivT67/prQAAFtf0lEbUPKKco5uVYjUx2y9eBkAfFGhs2fZalRebtNk
xUbSGT68uQ1coh2Q6nhS4cdo4YPsspTH1Nhu4RIhtPgRxdUttXHYX/Gr97N9TcXoMsfDghFW64X1
k5hEWEfn83fPzGIjm+7kdnV/4img9Fa3ZxxYUrgr5ny+/n9TADBfPj0nanLXP9IfpXIXFMO4cZ0z
Bn1eYo5PYUkIMm2NtSetwGM6Rot106wWg5O8rFVPs19cOE8+1EqXo7dNBHsY+L8Kc+GyZSZKYJeV
JveQ0goTcw48qT7c20RAD9/7ios9uAXp0PTvpQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
n4eN8OcgE2ytgAerPG7drDMcMy/2Ng9XyKzdLoueXaLeh19zquDnQa2TeOOi0kQM7hGEW4N0KSLe
m6/JDweeF+Zh9xzzoNG/7KoO99Lq3PLQiMZJ59hyawaj7oI6PxjJXrmtNuERK3VaiwAJCkdIROIA
KQWVzBm/UM8v21JbncRVWz79jVq9PoB0JyDeHd8yQSMkqhlQuqJk6w0/g6hvk6v0eZ8cm+YQPd0g
lcExsPMEJVUIstZmgw7cO9bw9rbVgiwyICyHMF9e9m+Fe/Erm8j76lm7U0ARiW5L4G85A2pA7Npy
R4KxewsytXQLOLLLVKSJgeQsFsNGQkjyZbzRJw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Xr27ZXCB8OnsIkHZpOeCueAdq2OspASj7YxAKEG4q8NqrecPF23quvvBjuwcB49ClOEqtHMTy8Wx
weKE0jw+n98eLI9Twla9KkITonZCHdMyBRODorH0IaSSb4J6rlebTz4yIeDkU+T39FfS19iVrJv9
YqXU3m1SGEsOT1DI4s/uVoxGxOXgwU9vp+nGCLp4cWSDJ5NmNma3Bkvy1AofNpsy04s51ATfy536
dpOLpy/2AJscmf6UromXJmy3AjFYU5O9tgB+VG+ew3ZTMKUxBUQgIg6qI3jmIkWZ3kN/k2X52CIU
cKg6JWkdfO6Yk9nM2sROGf/SLG8ybirlacy0SQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
R2nz22UK9YsaRdZIY3kGldutQifE5DDy7NbJzgHH9NuMVkNCseU6780lVUn1OPAvaNVfCBMh5aZB
Qa0UQVeAStJarB7+LT6a3OM60oJ6FEegSw1JKYWlpr0J4bm0S8AP9vR86sm2qfGICS2ZYl4qJmT8
m4T3EkhhzBehr+YTSE5DVzXiDX1G5ichGCmCZeSTKbpaMUP4CxdLB3GXI3i/Q8iml9J42mVCnpUw
iemH4c94zF6h8A9D4QXZyzCcG7ls+jKtBjHptjiIu8+V0cg9S7zgQsphkLKIetlWBVuL7zqnpbWe
8s/b5fnpCatZemVgKkFuy8UKlkzOt0yBn4MFWqFhLaoZWztlyHiXcUuSgmaIK7C0o6rpozCRxgkr
/krI39PGhNLvh9r+dLgiXtDNHEPG7Rc1kGWMV4Tv/wTcuizsdwyK5ULiX9zDkm9Wp8wc2FmonXXs
zUMW2MTsj6qNgl3ly6aR71kz80w3HEm6vpYE0PgIioLUHtXSJrNI0YZH

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KxbkAZO3A4DCLBukfrGMdxDyiqe7FeV3hRi5vLrwE66pgRsrzhpdsdVNVm9GBFGyirgfJc8Msa9K
Y4YDSFDYTsg59E8GFTF+GyDnevyA+S2gpVNFB0n2xfXaYhsh3iGMlmbrfQJILt4u+8Vuch+DunTO
8I4THbi625TC6yg0oe4r3JPCuc0C+w0RF2tsnPzM8RExC1kOIqKZaY9q1/wcBS5yGvCu13nNJIh8
IjjeDlgUK3GKB5FLzKJjUN79rMWT/qzH5OvgP7qaduyP5OfGm9E21O9eYtZEDGyGoM6ob08/TjSI
IIIPgVDQr6hOVM58Dogadky8yVeXSxHRau5RRA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11216)
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
