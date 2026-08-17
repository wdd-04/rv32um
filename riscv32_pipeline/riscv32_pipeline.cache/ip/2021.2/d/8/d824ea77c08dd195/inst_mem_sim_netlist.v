// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Thu Apr 23 09:25:48 2026
// Host        : WDDdLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ inst_mem_sim_netlist.v
// Design      : inst_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "inst_mem,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  (* C_FAMILY = "zynq" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11264)
`pragma protect data_block
9qjUJF/bNtdBDR/Y3GNTjo7M1fNfk2NiZ8JKVH57ma5JFSSlISFUsmWd1v/mg/Gd/jANuHjRjFfi
+b6S+wm8dK600fp7P7FY60+v70G2y7gUoFgLpa5aXx8Wl3S0tuZUpMiBHj91zly+8/VXQVzjsLYL
q/cHYtFtf675UcyZcj7FnXfKEMAEvinJwIGu6LwnhMLQi+veBRndlwdIstbSEPZpU0vxa109Y89I
2N2o9UMFMzEc9t7VfCinZbN+yAlwfF0q6RenjklnpJ3dyOi1tPjLvy/1CfSdEXxq4Bf5f/frR2Fx
RX0bATosDb6j5nY31jwNjST2yxd+Ihz2tFfj+SP6Hb0y07iG9GthRiDzlzY9McKULW0MWqajHNx4
7siWvcfwyAp9628wv/Ta+N0Ufc61v1IATJlucufKUrluPTnyxZlhLFV/Ot/7pLr/Z2xogi5YN7kf
95e9rWM7Cmti3w5mEnmcYcg7DZgx638I2iBa6WSuU6DoMS7BfXonflDqL/1GyR9tMHpTZrzMgDbZ
9UK7xu2Iw8l13lBiuGnV7vSnvhc/rrlrYILUqTEMfKBkBkGBzo6cyB2i3r8IaLxP2JVnZmqiFY2U
YO5U5wbk6Ic5JcZMdx0V6NiPCDGxkXH6ZfNoty7NXr/lM2Mb9hQQZ/c2JPw76pBRxzRt32BU7Vvj
OiyYS9ml6hlbPCkC1K3TxB2kCSTxj8c7D2Rn2nJ0Y8mbcdccGtRRm5HdtAXDmTQgn+GKf7mXqF0C
ZPLg+FDc+3LA82mOro995C9jvAUdky2yVZfGed13TFF+EKCLwe25lVbyTnHwQsVR995p41j0fy3s
LZpNeqBlvY5fL705cWsgDU1S+qKrXbOVeRc720NYygb1UYKuFcxcinlvfLU382l4DvNa+rFus+HW
IYhHGj8Rdc1DLodi1vbXeTOcoYTnP9nBW0S2owvYAhBCVrHaJypn3kuUqmDpP3NFuT6otYbiF10S
9RDc6uQrnjGiDuNzc9pK++SAJEsR4V6b8VqEHwfSs+EilJNIDnqFGIZsEB/8dh2ov19+s4mSOGk/
wLNAGcWfnP//Gcex8I5vZ42xRZY8L9pM0f76g4WaJu3FB0ixmcTDIbvFAUcUAxsNiMIIs524nFVM
RbiBMpqLdd6fplmaZyqt5i/qU4I0flz9d1sfriTlvqgVUZininuP/X9gXYsbtGbYqzXtbTl2uqFz
Sgu+7G/IpyPW/jazpprmcFJgXZMy4LAPFVzT2fb6rE5NLpkNpWJGXPH+BD5uaQsAOdW/fDPGpv0G
i+o6wpk+q3XMpdGUDQJzFjPTYcdUPHYGRc3sFEMRuSruI99dv6yiEwZ4L0atehJ4VGKEyhkvYIQy
Oji2y+dReb62ySzEZH8xC4aSr7syNePfdshZKQy2uhez2jLaBblkjQjnsu0Ut8G6WjnDyszMULEl
EqT8gqU1rJx2DvAhzPKnMZcXEXlnlmx690BkIgDBcGdrwCZgPMVAfw0/xwTcPdhJmerTJ0/w8zAb
bCPFdurXUsl5PKygUirpKqrHOadsMMFckp6MZ52iQvW4U461ehjEUN3naIgrjEABPnFJYof38y3N
898xh8lMI9VwdVc6QvGM7tWlfMKZAECfAUkBe8NOK7iaZ7psa7okZFM3p4rnSdXmc9uQdziBNSjL
kD5g4LPdurODPk1ow4a+HJ4MRfBOcsEDlGp43zMX5a7kH/VhFewVwytom9TxugFJBKXz8giMeJtu
Rdo6DFtmHd1gib9k12cNDMCOEsMSDvUWDnSG0XYf7KqLWPHNzdeRlLhOHDvou5F5pEm5NR7QvREq
wd8eYYlnViJ7TvNF47fGdTQpjloSFCHWWToJ3C/vVAjKKGkw5qo+/lGdSJ3JEXHj58AO7WK+myoL
rKu0TGgyLvGHHNX4n7iiGrTkraUj+Zu80xT+kUq0wAxcZmarn4y5EaduuxirWB9gAkK/BPOYo5yX
WaxTecEDDnt+9TPNiRt5+nvm7/zuNMqHxLayraccDcn+Z16WULxTcby1fi599h7zTyoBwxmNNHtA
lvdpLrHfNM2wHGnyfMFG+soHmacrwV5Ril5aNORPWTXbbwda/xjzqqWxh0dYjt+bmF19FmF2KQ6e
nUn8QKmS4tZTfp1Gb1tWhT2LO2j4rDICqpyE2rWaX8a+YUhE5iro3K6s0kieSGrzSQGOIqljZPSD
/3wTH+BCViFOC1StTYsz03vcjq62DjN7i2NEZFxCGHkAO0Suuz/Kj6hIuuux7gt/f47YHYQt4SLb
/vNP7+E+Qx5hUWZBy1BosChhiSHl2vbCjVdGI5a8blstoE+pYcHReVnEZ0KK5aMkdppJYTwE/uz3
eBuPUdP9Y8D6ZP5f7uk2MQqxpeeufB2bJ9tAQbRAq5puwcC2W5V2ezpSJXIS9ygwci8CX7IfpgHk
vI4ZfMGtPG0/6AvU8zmeSHpjhDYfd9BOrarrjPUHwb8KYmBQjD2UB4cV2wsf37tmUbaY3u41Kffg
l+G1k+O5h9EVXOPk5yKOI5Bjlu8XYVudYvFg0033ratS4gZThxYNfUQ9Y5ujGUo+OLHnGQa24jG4
0I2deAVh0RVsGSkwJ9WcriBT/Tn/IXQWOWYotSNpZTe2LcpqbFdoCPoE0yG+EgE+maWcjlbLwnAa
WFVK4u7oc65NBgmIUZpIDUpKygiJji46ei0cM1olzT/DY3+dX+gn33c27wGQe1HmIKck7YWQTbqm
ClwVMO4IhbfM6mYvkwLH58eBo3vGMRfo32V7PWLFD/b12znMyZqM/UfZgzeNcqLMNFA/sUHuejsB
6XPQu8tKHRfIN/+92SWIT1BkDORNoRV3fPIs7sTyS7cTQhNBffvYt4tvdXLoEt91JawAPK+e4Hz6
oQ9dXUDOnK27XD8w4nnFYQfIRGADN882npxhmw09aTQmSjbjmAaSUHdG22rtV5d1ayD1/wuMZDee
MxFMmNfhedWNqb4AljcPNiMAf+yksZwIpddbIXegMMVwybGjsNHCtyas/myM6UlnddkPFYTsHc5q
bgd/I63Bl9bAHKwT+5U1NCN22rpGGE8bzDNThjkLWgiIKpnyYTJJa3YwVDEUOt0xdCdL3IL7/ZD3
yYwwSmrRHxTH84wVcdGBoB66UDq9upGNyrSpCJPcZVCsDcLFu3RbK/xbW4RUunNkKHsMsi7d3lIw
IYCgSyiFZz5wyrqK8dflh4iO0y0uT60i1wTauu/KCLEpapgW2CNIQ6mcFr+f8hYMWGGQs6fZg1kd
LHXzzNIV+J0SOQar9QAS7Ux+reLhFReW4ZoQMD2yexaohGoi2ewcVsrHdJ82/NPmpz2iBf8VgvFp
ajdDEhNPk2j3Pzv7qZO4o9GRf7MLdcWHmtOCyXg/wdZ8kJHnKYG5ubGtmRbhj8CTwXIVQFOX34HI
S/xEbbA1pHFwQaMkG/qn1mVsUI9GkYhuxbreHZ1HU5z+WtEOgYrpi5cgU1UBwcXQdbpKPGnxSnEj
sKVqn3I0amhhk1ZietTcLyI4rHjXvHb4N0lS4tdU9D34UcTXreNw+cESQOELY7t7eucXhBHm96Hz
3cEt2381jwDC7hoLebzgoD8tyKd1Xqy/Hx92G3tUSqPs+9vPYl6mxE2vu+FwvVApB8+aqwcAIgQh
U3NKf2ZiAHZRd1wm+/FcjU+vl/n9C4srnLpuesplHiZTUdnei7i9md9PpJoJ8pEzs/vHUg3aNpq8
GOeLI9OObh7uBmThxP43iRldawMOrRXuXf/MG1J80roaTrXhvnRL/RSFrwPLFa4vVq4xJvIjuoMX
HYBdYtSaqNYMXk8cYYAxaCuK/nJCbSdsEjMeYdChPfu2It2G6bRKWtXzOMSYyRgdN3j0NucQFmJc
H78rmK96Jjwe/S30Zxc6L2UTiyX16x3OWfQSoDf0IRZ/LnujlbvVwboAGO2By9DIXTFvMJ2YUHQ5
Z3Yzbj4MmJnxkqpnMHPkRMXKSJK6PXLGthJJo6rs65M52FKOlM2Pt0Qpvay/UOrmwpuzDuhEgTOr
MDiUNtf3qvoXOYC7wjpmAGrRI+X6PMvl+7wAJKS4853fq73ntHwxchLH+bLG1HibYrXbxuEB5/zX
wj7vpTOCKeA6io+/cR140/X4Dx+NdcV8y9iNit8xqEIT0Xv1UQWJwE3i2/GvWNx++o/w/t7rtKau
18sIpF+ItEPMpjSCJRLoQmu1fmt/67afCU+apGsPCW71KCTkxB03sVwdhP+OfdhNDHRNBDRMNRcP
DzE340XETDJmSpA8ZnpWuRDu7PANere39pXoa455wU/B59XbzfNDI/GXUOESYfwkcYWTRt5FnOJt
xusKtcMltHyas0ATD4qsT+2zl5P1wFOlQHxCw0duem5JirYJ4W+iTcIMMCgSvnBXQ1jp88TH3Ono
P1hgqJOk7fv1apx9c+x6dd+d96C4rYVlFXMJmzPzJexmildZMZqqsmKxCLJ+ImII2w36a1D+6O/Y
CugG7LR/RU9fXKiJWIgs0rTPDCx1wosAjYDEmcx2Ew+HsRVZd+vwSCwhBwbFXRG1Wk92FQjkw13f
Np8WiHbF47fHiHBPwlStNhTGvUHwgbki4SUWrULedcPkf/wHXkyUfAnogPBw79OaaW2sZOs/Gahy
8wMyq2pLEgkc0P1BFSKp3npQEse+2mL2V6eEfYwDwR1AiIbuTO1ygItdRV56jXB46UIJI0s9LLi1
3gvN5LO69WkVjI3Ggha1sh5cC8soUARVR1KbdaUn7m54fXCEGp8D+CnpBDjl+/UlMqi5ZqlUIeEL
qTp8o1+IOfiLWFzDKrXzSuwBCy03i/r9ZnEGgB+jAWXFdU8TveMpwvVpTlJidcBBOH1trep1m3l6
tsCP8Kitpe+Cw7rj3YPPBLWFXSKE9IrefioWgKsTbDs/INtMr0VVNRicZ/DCRq0QShz0Yw4XNlM7
TWR3LqmgY6mm8gaRUAGK252TcAMGSdMUgCtKpfsg0YfIX2q3rhfwdqhykQngu6Gf1umFng/W2l5w
MoZJSicAh95wG/1N+QH521uXa/5I85BoORIBl0BFh1V9fBi7VMOJ2DJv9T4h3lJeExA2Akdp5Rt3
XOx7ZfqOstfSom06ENue1mfQlG6vaQQLc089E2FFFyB4v4H7936FcDHdho6eLHc8h1bNFenvKkYU
FJ3DPH09AbswFy3B03/JfQvyRTis+hT4C9TJRGBqEe+b4WYwhT1oxh7JiFISkuaavXlHEaBN94EF
wiClDTcZb5mi/I8FBu3X2YmcpRtEuxOxXJJ+4zNOpmR366PeXwB11dtVxIx/XhRnxD+PhnJzepTW
v3stWGKCxqz3kARurkq0IM4Sj16AZNazfF57CZWoULTcVkVhctOTY4VpLNmj+F1l5H6F27RBQs0N
+qxWR/l8G0PJDmhAUfZtPf+UCdwASEQAsO3P9bLU4Ja7bdKt1Fo2yWdtA5bSOKDysb2Mcl4+9ELF
s2Zh018aDPG6Es+Q9G2a1KGfzAUYIfJc1IgBA57ROTfETJmnGjuShTBIUZwcGphhtOKm0c4+RXWe
P/4H7nf5mzz7H9S02arhRNCMzIVENAE8hKLZfBWomjmphTRyRm4TKa/pRNlick8oUEm3OxbByM58
dztb6xlfxwP4iydcfGvyO6sry7B79c1H1SwlE5w2IIf5hWLbKbHmBaBtrV+L6hXt4nAjFr8w837O
8ThUHNje+KCtiy1ysJwJUyoiH7XO0dsOr5JF1mBw9alLDK45IAEUYcFWxophJqA1ft2KO4H80cws
JDUGibACGoWBw7b5EoD99mQqUEFPxnpQugIn77Dgg3iUNVbPqJEM3TQXFxpfZ0AiT4cfp8guc5C2
uHmSFSuAO6ySyHhF1NOJxV3N4B+BJ31v48XQ9ntJ9xCst9Z+i3gPs7xmu13GNxi3YlShkPmHKeBo
Bwgh6p10aZEU+DOGrQJngIFbl5IyMooHSs/2w+U4rx6HEAg+8lnX0DmS72haN3/sLj0ZSQPq9RZb
ZPhRxxwBSYD4jqwgy4b02wDRhzysvC0QQB9uw2ElpDGJ0DmUXW83u5AKzK/7aRYcVtkKEDeM8JLZ
JHY4Cgv8HAwZb9IkZ30/ARhvTuquVikw8wWnfKQFAhx9x7s/0Lu2PTYoTu2VNazFm7g3CzngxJ1U
7tzUsr5QOzuV/zmr1xXtnUp6Z/qIO9ZN/kKGubHvKzigJKjDfEtm1FTQ29n0ftaM7ClfB4EIWWUC
kvUbrpBXWgzuqXwUJhL9ZgKnlrCb2Mn/nhe0DW/IvCgzlrjqqy/UPBc980Rkzj7kSnlgVC6VgrEr
Sv2v+MMntvZOqI73poSejKzmn/9KfOPFpGRdCwy45lIabWrmhmcJfbFUOZ3F8DAQtri25u5MKOT7
HPJncZt6GAiJYbbvFuOQRFznPCIvoIX4Q2JjbH9s9SyJFcP59Fkoq4zhpFmLdxXCNDrCedstG9Mb
MAplEWuHY/+8nVzSXGYaLe/Go0SI8mrkXB110z0bg7lHQd6rlk6l/iCwOW4j09shTN2BnPoH7uu0
wX9TDP3Yu+/uE2LO68qdoQ88fIIsFVN3UvJXuYNFt48dC9MAw8YlmXqMK30iP9NK2J81g5rFPkH9
OhCM9J4lDSp2LanrVSmD19sF8f8Ah5n+RneJUMDAYwg6t08wcJsRDfNG3pkZ/uGzthjKuXPhuUv3
js2zr6gEbEgpPejHTn8TUAN773pgsOq83yvvuX5Cj9Z6IDfRS2MHIkwkw5NhCn4FOasgtPxD1A/Y
jRMMx8meQco2rP0GywrKdlHlDBTra3mQifzGRdjDdXRDfmyKE+lGvH1p2l/5FFIIQ878+Ha8KMEB
GG5BI2lNH+3HEQLM8LD1f5MondxAESTyd7OCE77EHz2U71kRw6eWwwlZetTQQwmYgJb1jDJIJagm
8dgJtC7F5AAC/ooMpQ8+HKZ/r4oMpwrmYhSS2hgW4FQMORCxlvabAIconvmejtABjVYDbPSzXwCA
CJ2DBB4+93hit2Dfo7iZln+4Ede6U0uS/r08JzUvHeAywUluDRenBbP1r6fkV8HsYEmQ+OGYo0rk
JjIvX9ABoRz/wh4cjIhcplJwXsIW4nwRm0Fhq5NkURa1xyqCsnrrGKwvVHTdkcsXT4LqUafxnmNB
A7SVg6JfIDwE+EE43rpTbRMrwNbF99eru48S1TRVUyS+DhtwtaYdBxfVpk0Zyv7JB7Q5n4PNhpDm
uzhdkFQt1Ime1gYUNktbAoTlU4HG9GoEfPVNieUk9yUUHTZ4HQuHg/aeJbJCwMMCOZPODAOAXnvv
aZ00BUK6/hhZiWahUUIcGcAYdP8mAcy1+tRGHcD+62yfdzhe4NU9/Bz0lm87v+tZvfRqeNYYspdA
61Cc1gCfnpaZEU/Gv6ye/VXxvl5ciZ+94tVGqsSe9m+lkdrv/17/eWFs0wNvXCiOXyGquh73+8kS
LxkQu40OCOv1eC/GFcmTMIEqgfrxSha3CpjhQL0pzqb84p3bRCcmeLKIBYPqfGlsl/gBi/WARlOK
CjEATwwTOpcyPlm5vH+q1tpm1Ac/OYzHE1d7YUVadK7A+4RAUA8yMNVpZY28wLhOhKQ6QRvWksiY
MM2aY59S/0tdpAlTRhl1+jbpDKX9ZDcUxf3/JxIcDmrX+QBpKxN0a6Z2WFMDFQZIKKHqN2xvQkUB
7PR7cx2tL5xmrckg2R6gIgpj3aqQ1DZj2tiCh0PYrs8IpXA9p6Qs6+ThKIoBo6/rRpsmAnInmk4q
PqhM2RuTj02QAcBctQiBrtJIwOU9yfEMjOOzV6JGvoebDqG26xDhhPs8pArWtGue6nhxYKnGMSP6
xQN5AXfbjFICbDeQ7hksKoIjjVf/tAMMtfPCPxZaBVN9wGcCER6A2CU3+k6VyQFxNJBoWZaWNoje
+m/MGZcicna/KEFHVop5hlC7yOk2rycIkaSX+rF5MG5POH0GsQO+pA+g3U/b+QUzmBiGzWwJ5v7k
W/iyEF74Ch6ViVdfUZ6/6V+WGa8zGYQmXif2MpHvWy/rshNU4WmBq79UcVL3jbqQFRyBN1FHJwlE
BFsvA8M4It2t1B6ilqWTxeUlZvqtI1itVj8CnhujTsNxxuzB/qsXVUfG0K15BOlY7MYDAA1Pl5O3
5iwSvSIj/i07y79yaT8DE6jelY/PSFzxVElEGOyl+hjAk96KxvyysmJ/Uy/b68FSGnpid3pFDYAI
fheiw7gY5F0TI/YY0wuQR/MXVfk9Bx7enuq6+bdFe91AHvtR/pNox43ktSvL6MB7BvhCY/oZVGFA
E0vPToC4gAT4XMw5NqySB7jtw9jbFPmIVTczX4i2U/NaqBOhfTMoBcJ/ZHO+EdhYSY0ZnlPGKdOX
/L+rxyLwiQX6blA7CC+pouZXbaqdN+J6dKXoyD+6VrH1zLBhFMl/wWJZUAX6+BHlJHp6PYX0Lgem
QzRxDWI1IYiqQbIVO9ScvprTARPFEnIzjhUMd1Nw6PW4fBt6zaDce0r3gPTx3ivZugQXfJZxJ8gb
40e2VwhmfYmDi7p1E8THP6aZkxV2HordbcjZ4H6NRwqzP+2ORNobw922R19AjUM83dFg+SXsdJIC
hQwrC69HlEp542gY6sbB5s4JJUYjCRhgN9TlQndED1ikMQLTUZ3RxmRv+mc6PW3dEE8q0nVDinG7
VFp2MwYPZw0U2cE5BDYK9nu6Kl9Xd76qTCLoTOX6+QEuqvturb15VvI1tnuXJI1NMflaRH05+L6j
RY5Uo1wW2FBF9P1jxiZ27QLAii9jUdYiEb9t3qdFlGjsCdHl5EFb1yuZl9pUvJs9pfHQcoFDGlM8
XfbWys9hhWml1BZiQXtlwbQLdYqxJdXpa4BejQR1e9NRpAb77p6TLeonFMYe5jEkxtSRT3EhXu5z
uLBbE0JvMHOyfxQcTUQZsg/1L6PMyRxXZsELlDhvIuEL6VjMi0ZemOpkGNgvES3oRQTflms793OP
I7Im5JJBnYFDIULHy2lPUfx9G4Cs/ZKrz9U7/8Bo4MPit4LMrvgOP4G6OpcO6d3Wmxswsx/2hjF4
g7Sgt+oWAVge0rLQoa4vtnzl27Qa7t9BZVqlYdKlPNkePtNZ899EAwq3B+bTCvXtaMy4Pwbho2RD
Eru8AkpMDqpIAclBjnkYd+ZG5AjyijaZD8aLMeTSJ3LGdJtP4X36xK5D24JAt1HFiVjaZ7KNJoPu
NJbWgkGCb66fxZu51Wig5g3ziDcZVyirP/QS3moOADHBCfFYQvFUzw0vHbIp7CSFOFXFpp6IYvpS
jFEIaQkua2rPufkyojHMRNJjhq7srMZ5u7HyCC0nHOn+D7OKg2cc3AB9oOqYktm4QCm4YYuGdOkP
QOUHNeBZqoP5evSeOqMDvMJA95ml9Ju7y++9g2ncA3eSCYTJ/BkrNMX7aqyw7lp58NSAkjXbS8jo
GMgQHj5qNTtqcBebrkN+Kb4hVtNCyaXLpJ2T5mP0Mx2+W88ahW4fIcknqZ7QsXBnpE6CHfDk3Mit
E+OSqZP8yB7JC1UWRnfIZKRtuxvvy39NQ+eSx6zfsajgzRjKQolKOfjY8RTf7nDxFg0pSUtkVm0f
AkW6YMZOWX4mkPv9o+NfIfr8STHNeC7gYAl2TrInxW6PW2wBT4MlDsbV0sjIKTZvLMySGxnNyBCk
0LMeGQspr4NB93lwUMMj0aZDf4lowO8XRy/exsCDA0q/hw5J7vBS4gCPXQy2N7CcsIuPW5i3GuCJ
Ra472xHfCfSeB/g28fR5po9iOSuAlrQxn18GUTOI1wfnzfP/fbT5EMa88JqkNEf1USeD51onHbfD
l+7ObfeVi+er1ee6Oed8JGwnRQ7yL5MFwrGETI464GEU679XEjW+riCvuM3L8Mit0IAkpdGdtvnA
ds2VwKyGkvGTEqbH1Jwb7Gs138H+c0PYfP+68jJ05+4wSgTsExr/5/hCIg5pPJbd87ssTLa3r5SX
ePmQ9YKO+1VNthyMMjIZ20l5MRDQNUB+bGaoHoMw0jaHwuvTL/EKarcSvzBMj2bMnz56HSik7UXM
dcStDsNrakAtFJl9Lc8Z0tVgswLdPLtQcc4dCI+e0iPA6Fd2OrqBo9VIqtmM7OQJMVarGBV3D/KP
kElj/rYyFBd/gvq5iqg45GTA9NUlbgCIhxF8xEcA2v9c7TZEar2urGFrDZwc2/jNkNCFd2ZjzQ6b
nx1CsAZ8SQt26ZTc/YfPrbKPOSyIpoBBe23PjFS8HRXqN3H1NK3lJbAP+M2O3p3oG40JLGPo8P2o
dD4XbPfG9p+pFiZaVkZsGvPani1Pf5GiTL8baYQneASyv0vcThAJ/RcSLlb1j7eJ4XtQ0B+oLP9a
busQMaaa6CNYkzPO6UOjFa+yzVWMSrdCav5UXb5p0pXLeeY0oYE3PgoI3t8OLqeI+QP7FT82CB1W
ZfElaJfJaYNgr5OBCkBG498/SWzsjhSWW2MpDq5Fz0K/7FrPEJ4F2DRxlAgZHviIFHQXzn4bv7L0
9AaSn0s0Xi83PKJ5kj3tNd9JxuDsJ2JVGMa/5B9hZJ6solSfZbAr5GKBr/7UvQAu8s/DCIQcgvPb
UcCjc0jOgfWwUVe/+9HGOfb1+8r+z6ehED5VYMdZt47wQMMo+WrotgaT50Z6HJDvuPl1srqa4aDU
wsG3L55cYI8frVRS4Gm/En3bTWSXwmDlIOC8XtwC/c91kF5pS3o8FTJsguMGR1jxK14RmCCDsgel
brYVsZN7SfBO2ZRptfR5l/knBpXo5vGDtHNZA73sOU2VoGaDBBZw23OmREK9bfR8bJLrXrhlhEpx
AT7zZkMnsTV6LeY1DVIoH8uwM2uUToGKbgCYM57n+UFOo1F9agpU+G72qPlZsdXsmPTfwlhmr893
UUtf67srT0FWf01QV1s1gRxcn/bLlaqyGaMd1cWvDBUL3Fe38jC2bfgQzKV09PIgA2EF+hG1BHmQ
F2Ho2b29M/0ykwQyOzrrjybS0QCH/cUn8fRjAOKnvLH0Y+cuHtjauL8SMtm3gQ1BoVcLj8jIczxP
f2qoFunmBNAMpwMgEi+q3z1vhQA4XEGxOtm1dPUWK7bH9XeANduNPoTD+owEMWH6IjZqBb7pqgd/
250iYBOIjBlHN93PhVqA1rW6x86oLkp6+qLUpqYUWmZOZVAzIy569Tuh097OFd/2TXqpWMm77aZH
iUi3kOHmvBLo+w1tXVwdxFpcwAu3mrtOjIigIzZGEAxygLi7A9zCO2hDpZt5IBjuJ1Xo8nvISCkI
z063BfHS0k5JCzyE4HnaZNzaa8kYMgBrKT/Q/iSH3O1+KY6QONfwD6TkUmDAKn3j96/1O1FSZ+u8
UJXZzWhcSyug4/dMSgLPbiMSqrSo7sGeDo/KfDk+TrRv4dpZDTAdSlUVT+7mTmBlmBPMJpXcn4yQ
Qzm5UeB17x1CQIOC7THYzI5jAUxspISHaUQHJ5tBCdYj6NdGr6UIiVVY7yOc1Cz6EWY5Xpa1eZww
FMpvejT8fxji8g8jT2Ote9YzTlX+3HDjkuyLsUZpZ5VqJMStOpv5iew81X94+1zEYk7zMY/8KXS+
v5x9wms/SFaWBNq5l40RiB2v6PFjvWLw1+ykCKvc5UHuHusemsTDvJMZ/JKxjGub5xjMg8xozKv6
uxDhhmbk9aI9paEuorbnItyWCMXFUweCQ7a71gsNLZuDVDXwXek/LxFEGIs16wCVlT+lN4UdmreY
0cQ1TE/R4pbpphxuo+uxh6PQqvRIuIDSRj6sQeL5D0g6iS6XhTSzerOQJha/VxmLMwsXbsSwnCcp
tplokSlwTTlN3oxWECAzez5k6JnqYfsqpO9ioBLb4BFFj6RZcMoUexXNx/DR2Z4/gIoigzTMxXX7
1pqIN+n1Hcl8JiMD8ZmHtlvMBtT8NFnEq6RAT4gcZSKcnc18hnFw7qn2quYNE6EZGZo8ccoDpIU+
1tGNVFULzibAlBVvbAFoV0bZPOTkBEo414iiMU3MzWfLAz5U9T6hFeVNBhtEc27kOtGvZYgglKwx
lcSnk7Nke93pv9Mm6M3r/6aQbfxWJIZ5EoMbx5g0y03vI/ic+u2d1aO1wIbJ1ayZvM/jgG1Yqf6d
ndjCLOBK80iJIRKnCG9XjuL1jfKI47GIJgrJSJ+aJMoT2QzbWkWvDKrcY58amP1bETQq4jlONP7p
bfJ7gyyKHzHLvbEvVCDyC3gCfqAuzZsACicG7vNuPbaJQkmMTdVK85qbme3WMse6Pe8s4YH4ED48
YiCE3BAIUXudmAtGStWrMeL+O1wy/3sf8FdAvpNWKfIqzGipwzCJ51C23cqgd52bc3ffrujlu9nq
cYxmAMBljwvOBDAcf5SXGmFBwLLYkXXCiQCkwNAknyGK2S4jJLywoGAVU+aGwNthBlGSciGOJImH
fZBxoklVRdmbxyOR9AYi1yEFKAt1eA7PzjjSCH6NMSb6khyMAJ7IB/LcGT5ECPvV5mwp7sHP1wTG
PnNY2YYFUaWK/h7se6B3TxLo39eBsy8CuhS5f0njVeXWj+SzRHu3hiUfZr6IRkP3DzDy0nzOih8M
k9SSbCeb5WDHaONFyFm+zIaQUQlJyaoi2epDZarUduOa1Qbw7YLHv6rJ+OiMO6kK98JLIJuPPAn2
Wu4tUegGqa6146RWhAXRx3cFDV/C+EWx7avPocZSyzrimAbwCTASz/aKNQ6K1tIrBVuwtmYhO5pQ
H0rtipwN9C+FszsekYOllqzzNVS95DiyYfxcL5xvVWchsXs85C4oH/rwoObx1gX3GMKn2+wU+M3f
AhvkfR0q+QhCZwsky2G53ZYioA237pSIKXU90+vlW30xsrP3BMs72WSkX/lLvRYcuUBELrhLc+z5
p7QHYS88Ij/tXaxrpE7U/XTkzRFjjjdo1b6OrsVd6TprMZeePUQ9BLpQ0l6A7diq5i/bO4qwdzcX
mZHxzfY2RmNjmhKVdQOyoFneQ++Wrr3xzrhSa2I81EIGh3gwwJKSvAci7sq57iLqFNDDgQBBndeU
kRXZIXV/uQVqAlym3puwAhXTNv9/OG2KOmOTxy9doj1qIP97Th/3SCVsQH7+/cKyweN4lNQQvK0P
7l0od0jdxxVYbFB/jPT3DyVhJOSaM5hQur55lS1hpxo5gcCjkX8c0bMyGTWWQ2NETfAnYEY8x2Di
kEJT8tbIw92QXMZB0QJOkrAm3OotCgeY3bfBqN5XMLG7UzWJYAZPAupGxtAKdFwlIUwu9z+sj2gs
8psC1HetMD49t/P6993maHYl8KHQSeXEFHi0mu04QNouT+14l0deMl3J0T+iVpeR422JHKFh++/4
hopEBlRpUN3Uz2hzNdDOPBCr6Zzp+EOTs5SuOjFSDqsFZEPNnc1Qoi+Y1wczwuWXQv2VB44gL0oB
GToP0RRS5CmGGgbal4tCw8DFJLQ0WlD5jEdJp6MCu4cZUbZswIOdZcEDrtN7Aghs18w2lMAgAAes
p3m15fZKTfPOe+dKoYAN1iNH5sCLUqyw7kqZPkYu5bVqcFKy2jQVuv2WtjYvMSA9sXcW1wjYKOvr
/g2cwBsDiqwhwjvU+7dCZwSvnMAjkipccFUnWxhWf1RYFLTsRFw2XctSa6kdvXNRyBq7w+HW/Ei7
68PhUXaf7Ek9zZin69UtEwPWnCq469N+KkEdNZQSc1b1gBjSXRd8nqL075TXP5HVIQsYNA61iVgU
dNsU/MIl4wGZAdPAuYrDCOaD/XEZoXBrNMjPV6fcy7Sm2XM5W+S6unMj3ssLrYAzANPAR+0Zevtx
NY0zmwmUImNFD0BkCxR0oTPc6oT7ua5L2E0EdKlyzFLdulxyzm6DJKYVkRO74rLZMWju42DhJMp1
tqEXmbnr3txoZz+3RKR3Zz/VJLCcJ2cWOGpf2KBXdXSsNKLFivEynFPSzmlwC/mY6VfHiyjFCwXT
IO3oLW1zaZf8+ucEY+hNdi5sOnnLr+vBRqqDkeCSnp9kh4WjHy6HyrZqo7uwIPxgcVxYKArRJUNV
alGNV/KKX3fZVIGeaDoTEy7Uot3AYFPvERfRpkeki9uQztOtTYEFVCPVfmndyE/VZQUQgxnJPowB
jy2V4VJUIvH0nwnGIauSLOFttYveXbczkZxHxTfuHZnVHGRT15l4wjlsa8U8TNaSD1k5VWevH90t
udEEI/rPoVpIvuyfn6gTANhlJhucLynC73d7PcYuqmJQ2CZErdfhD9r2QFa+GplFvH+5J8YdMaLE
AY4twvb87thgO9+C2ixLy1b+Gtxp/AlGmB/LTKIi2CCRUYAC6282tLnuiMUXs9ornNl4pD56Cm0l
4UCHkNSQ9LKSt19fJNR/c1WbcfD3uLR9UqSiisg1yUrynWxc32+ceEQgi+lis1rIwQCx4bGrwK6D
8ig/cWrlaOeVJdNHWH75txo1dv7J7l8ZksvvU3X13EsqNJUEA87qZ5Izq1OKn7TdgAWrlSt2z+GE
xM8zQfBmS4iAhl+wbNJHWvA15JtOX+r2vWss6Xm4x1dooktif3gK//o4EIjESHD3wnBn/b8TUggg
m+dHHth7F7NjxcPYyHRkpu1GaVynS9SWz+RNVyXMgmuS/OK+0XrNixo4AaNZosPSgqL1l9gHhwBu
6HrzxsfAffhxtFPtwnROIUhStjXFmD01IOfxnnJ/P4bsKXSDLrZ8Nm7Rlt7o9Sz2Ds0VwhVVzOp7
+lgj0f4Nlgy9zqD9hfKDFGAjg5EpnTbT9IwyGXmyBPcWNYZRH8se1ZLqPMDmVdW/s9jShE/qyxVK
GeGuZ8LGBQtiF7+JmJ3qrvXK6gnEypTNximvm9knhTbPzF4728pUDNtOJu2iOnotMOX+dQIx8SOw
EpqZTO5YTl784mjJPIKiiGYrHesv6x8uw9ekBlfQA2jXXJtN9CfUry8wxV7buOIpD3hVDS17tPDE
i/VE53hkdxwlWi36pZUNx7kb1pr6Y4VLmwOiw0drIWcOe++zk0n79QbhV/tsc4UFb7QnyIXZPC8n
qq/Ps31e2kPy6D8qu2mthVIz+0OdhK0s0y3WC9UIFaiCEn8=
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
