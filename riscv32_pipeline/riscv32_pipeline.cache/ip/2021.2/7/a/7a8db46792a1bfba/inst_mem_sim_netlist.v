// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Tue Apr 14 00:15:33 2026
// Host        : WDDdLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ inst_mem_sim_netlist.v
// Design      : inst_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a12ticsg325-1L
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
Ha1lCaWrzZT3DPSVz/o0qr+NNlnUEzWkoWQ6qO0LtQpKM9ETE39DoA/N0InRlaEyWp4H24lNjY5q
Pup0nrWDXigP7scEEBeYU9stJRAu7GkXI6VCmoyucguyElyXLwH5tt9SrZ9uIJBhybOc+Hdo66Pp
SmvwGJtICKQnpT4soDL/unsjssDt4I6jyGmeX4C0A5bg17f+zQnibFEtxp9mst0Qr3EMr2qpbuU8
HU6RbXnTJlRJ8x3d5Ml8XDWaSQ63didEhAApbzSl4hEv4uvJOwLRvC7zWkY7akOCv4MGv+mMm1zU
hMV2VHPV6Fv6zgpjNeXzrtwESse2mhKCaA8Wx1EtlpFM7yXhGJocY0Ndv/6ltTVYz7TG4ckEDLEW
bF8lw+XrlrrqDsxmE86hC5kp/OSB+3sVVLFWFUuGC0PpcXDCV3KOI5WlZC59XRPOC1ChhRmKF2zS
9vPsQZJjwR2+0E1IPUirB6kMh0Bqc60Y1wMZTitVBBB3AEkL41ADtkodV34ItSx9e69S8pPxoupn
0abCuLitLh+cdw0f4fdllkNbVTiDrxLmoJtYJ74KUIETRinSZ56D8FSEmr62SocciHkuO7AlK1fk
lbxjRclwPQfekN8Br/a0hmHAeu9IV4VmkRZ3mJLQUrtVSjZcy0fgiuEBX/eek0lOF2+G9rz3pCyO
JxWOzwEr/eLcdFY5X7Q8uXG5g6F9/KCpU2RgljlIVzMaMSIlCNfEk40Q6CLVm+p1Kj3hxQN/sgFe
aUklZJ5G2rFJP7qG6VvBwwiTTN2VN5Um/0+d5rJOK9sXorGllgk5WX1jm+ONsTtheinwjEqBqyyg
LGRKL2D33ndHcGHlZPk//k2jHIbkjQQeDbqUsZHjLJWEYXSGvi4KwzbUfDlwlIJm9cRneRC+D3ob
svbfDdV4IHtl3g+r9KW4yohgstTCavnCahlLNbwC2sBHkIxL/K4xSK632EERPnl5xrO+mHMA1fPu
sddVxKH7RPnTs8p92MpmvVaB26fOt+B1zCBVZDJspL8/dEo1dFo1r+koNH/vH8FrINctyhcSEA0c
iYNISB4kJCcBFjopytDixwXI4EdSlcs4EAM9mXX748FsfXgWHN8axstgV1GjmTHpfr3ekTVInBFW
Tummtvr+Q2fMjeQvRyeRKOafbKWoFYNzd5IWKyC0SrkDa5IT2PhuYLsGjM3A/HrrUgdzb7nja0RD
iL48jGN7K7BVI4pFkzyh4Rqrvw66kynPu85MjqJfa1nscgUsMivLwn5W9UT+sDzaRtdrqZ3ZN4HW
TZaSYW3gtcAfBcnht1xlq4s+S9VyVhFEHMzj/Dk+9q/1CAvQaflQUGicbgT7u7QWbguEfh0eQNfG
LijfQztr1TYRsJ/r6pbS/w2ixH4LYnNWHNsnL+LOa4WGFu4NNc6LKWGXqi82Id9saZlK+BP/WRhh
2+cbflQBnhjr2pLyfoggtqCgjVM7Mx03e9CicZEdo3n1nttwOw4evw1RfHdOUm5hlxspRVjH6VUG
2g2amtNjSB7lEC3YeTTus4MO+1lFyj1JDDtkWlU73xWBfjUwsUoRVn/WMXoO3+VBNn7Uz+kzkEGM
BeC5xDJlPM6bzEEmJHtq4OTu+bXRYm6JEzFf5POKSYgTXOw3I0ZMl4METiw7KOQUlA/E9sUxrPbS
0k+N/RwYg8Tuzlm/PtKTKPc/OJ3siNyURMDNmiJMTTs75RFmvwuWszAS6XxEjrlTq/MGgcQcuFPo
0vRPyIzVXYs0TltCKf/6HMvZqlxrqGAHpSnAdCrnaQsibklsFglBtBCmdehD8E+Usqczy+dr+ZJ7
hJPM0QWZySDoR9YBvWLoYaCx2rPzbsB505K1JIJH0B2MUAAu93aAgF41cxDCkx1g8CvA7Wp6qjRj
S73bWxyLEV1/w6+k7Lic02lclUq8yJIBBHxwzDd/YJBhFDR6kbHYeSeH4f2zjvwolpGJR1MdZYLx
1wKAosuuFWndBXEUOeBTEVE92n3THiasJES3VfZMlBgm+xIOXO7//c0+eDxt8SGhJmLCbb5/9jAL
fjsHprqjqrZGz7hTBIT9Zf3NBSOgEzrnx4myE8tcWzR3xmeKMuSy40T+vhTWr03uTdpPca5iTLi+
EKtLyJmrDvY+56Xzb3V7O/wLE/7YiO6s9sJ/LLk1x7cRSeVEgKZqydPygzT2jTx+bRzjClr/vNUq
5da54Xcuk0hBeY+b2nCeAwrVBmJiGE7DzhsfaQntPlXeGc69SGCD8EwO5mcK42muKIxkkA3yK9Cl
o1peSsDkC61HGq5sXaM5sEMMm4f9D8fnK8o4RZoJdLesITG5eW+6pnAFIgdvsOrTF14im9Cc6AQs
MdpSswN9PPEAjmXxWkYk/JY9/qeAaXabNin1mZFp3ckDWRBzR5SOTzvv5w0RhLxG1aTclaiV6KRr
VXl180kB5W1tFn42ASzt1tQYaHD2AuYn5T8ZZ5WTzFcxCYDn5tT0xBMiSSn1BLXDamtKWQqcCzIr
qm5GEoEsuvLbz3SGgC3HLQNp5k4EL5ME4B4tFCaEVlFroP86oH2A5896efJYbR+sqR5z7ndBY0MG
X5HCM0rmj7nUuOm0tDK0thgi3p9luVYk/l8UWDmjG6mc62SgVvlYdiSOgqXRiqGPPalNsQ2oJT8I
7tY2lEkcrC7Uxwxl64vUenGPpmGw2bdaCJGOe5mgOdoKLkkQM3FZ1nfPQ12XxBhN2HqCsrhKlXpS
FbTyk9WJr0SmE7MAgh3bn8BAMp8TBsW8xB6Pg2/XJ4C/OC3K17jH7VpMX88Y6sLbitJosI0+ncX0
ixGd0H4FYOaEiKHo+W18IBX+iszG7SLf2zTqtQgIG8sF4JaSvEUJqHiToLgtVOcEHl6ySlnuONQs
vSmdUbJ3OOROZMpaXb4wLwgl8CQjIRwhn2CzYFvpOfMafcT90U2vjZPni31EWOwxfqid3C08y59j
6s/bEhxH0y57jRTbBQrHkVNG9/Hu4kygsfxi3PSm59uWWPEhlBXwxJX7FHeGcCgIUBy3JsuCzkfH
O9ijDLrCb9HP2xG+/NruXLrMFIsCQNvgKu7KqP1LrDKsWpUVM6XNY8ZYy2G5NJrEozy44SJWH5pr
WK9xNnXxNrG/UMn3q3l6G8XXKzTgXKahprr4gE/hghEf8neRSTsqtbVfN3ALIBq4d35GrSttYqeL
99EYIIYCYsDgvpsQcHk4Mp8XCaTlzAmDNv1fM7tmDTl6CTqxzW+Z/uKwq/rgDK18zuqWEz43Lnef
bP3/WKFMms+ipAFXCNrKznDwxie/J8e4S5E4i5DaGF3Qe4BxatPTiKzrkTLBK7OdzgY54kOXp/co
lmjXWwfrVr3zkHRpUfdIh+S7VB7dG0xyS5q50+w6JfRjhK7xqpqAyoRNrR6A+v4BKTP7fG7tZQJB
n2xOYO8CQFIrSP6274cjdPfoiOeVE32pEMT6lESFFH4eXH0ox5LhbNmPwuTBweQ0IjfvQeXAKK59
gDWNlY+OTgKLQ1JJrWT58c4HVXAds37AGIaayFAJV7TmCahjiWKyMoM6K+m+sL2mRIFySUcuFWbJ
EewANUoLDSKgEi6t6av25tPKpjrAbhGNLSvg1BVvyY6WyaG/IncGefoAC5uZArTNyksB1alGg0mP
tXbhMw62Fmc/aPMdM4bnvz2B24+lsP2LhnAWlxgEHkYWlDMc8e6ktgS7MnARCJ/93rkGN/+QnMpZ
fCaifQEo0F0RZg5jdZGfxgzgX6urQvKujHRaWAPAvqcj41F8h2chwXIinWwurkClGGFxz8UaKztt
ppq/P/uBbWGBtq+xY3xgbM8UIFlDlIKVjkdlYn0bTMOxW94E0JkMSw38VxyvRFoRC7ucbfsUXYDs
WetfHR9hk/SVrK5h4Fpd1+h6odRQ0Fxu8e7kbuAmp1slm3m8SsSc18RQp07DMmUaY2vAarmkjvRH
Hk04TPQsyFv5eW/Rr6ABVRJkamgmEMdSkaAX+tqs8XWr8cbI+GMCG1nkKbRdRKXDrkv5OOdIgeh7
FtiKDUpvHWq2aRvDiAuOEWdbJGc+Mn0+9YEuhwHkOz9v/sAZCVYAro7yfXxJdSEtepUBMSSj57YG
7UAKshjJW06JjTE0dWqHn5SMZkncy8eqLRI3h90mEkceGAwkzUG5OcIayHwbrFOCcMPbJ9z4B/sx
1AsmZ/ibJSW/6nyY02StxDZ+sh361wRjPiwV0mBM4PrCUY00MJywQyTimFjC1YO+Is2o1YYN4q9z
6VX+zaTf7bEyE4hqB9LqmJbevcPgSDCn/I6bpuJdKvFmSQBUP4Nb4/UgpTLykD1Aiuu4BDZVfog7
Du0LPK5emVbqih+bb5/o0RB71dI0KKjzqFQPU7nr9eSrLBmT/bWUOoACkoIqTWuPtYdOSfIaJJN9
3r74JOQp3RoThoJuEaMzssPqmvtMlS9SRkifX2i9jSRlsIAXc/4MFatQ/+g22NcXuaOBXG5N4xAB
4t4jfgYx9V3JDPuz0OkWYhKC4gDYtpeK2aimdId/BSCmVlpFYggfc//3rempd8sPcvORPUJJOxRu
xsLet/C6w3p6UjjsSnA2YTccEJLUSmYS2gR5mDnWea0lYmPF4A9z7x33cVdYN69Lp5/Wv5K+bsVT
A/9Jyyob2xmXs+tkTQ4CMHiYoPTBr6D3E3gxkGM/DZp2xQ7LVhveb3M0yhBoZdBL321NepTLW/v2
tM5FpLdawV81YNNWd3iHduNCj+RhPPl6FKDFtPq8nP3KUi4kE6d5qzvWmpQIEht6P6WmVdl5bYn4
1Q19C3e7rQS1lZKMPM7KMStOvelKDJ+OUWIu96eG/mZkhpNt6KyzHvILglPjCFo8AMTh6weQD5jj
csPyVL7TUYbItfZEGd1Fm709QWFXPNpwp+KoVgVCifBSdzBpAQHG8loissKaRFakAi5gzNgmqtOo
0XwTZD4RkFO3T+0WDzdpxqwcWfe1qqfIcL6FGIhBkspyKAivyLgsD854pLlCBmAM3A1XVv0TTZIy
LzShREZW8NNtcGElyTscOLRocdd+AinnBG9uVv+e2mWYvYxoLXu5KesiwfY+9+lPeaIXx4oCyb4c
9c/EzENZmC32MHHxCyS+kBkr5hGD20WhShCp7kG/WGUohnDnZbE25PvsqN4uHlpnaol+e6X2ArUm
xFYD4BVup4gErjcxUs+oEI3C8uLyH+ArLPhrLlOUGhHTvs91BRELXqvs8tDU6J0LbaVh20IsL83j
AjkDE0kWDMkZrKfpyUnlh9h7suCsEjZsxtHfXCnjFRjf8cSy84Cn37ADZVv5eLl0M1RiJDIqUYo2
i4fruR2yrwfRlRVpGD/t3QecT236LVp0DrK5X6hjfIKEpK4zCySGAfX23HnPLuimVjN9dDYmprm4
6XMrBPHON60bJUZ6I0ROX2nVd6ZfEOqnGbPq7pqkcOEb6sJhuQwOcHEloH7VPddtVLizkWxNk+3f
Wk/6C0SJsaixobaMZpcwUhrCvL0kJkXgMuEdrvX35T4YWegDD+mZ3jPocmuiZQ251Umrm1M/LDly
j3BMyDmBBg48yzst5WHsriiT7hUsziS4mMz/+ibvtqWzSShb9o374KK97V/8ncpsOCDtw1D09pPS
p6eIYD5hPygW+tw1Ja/XDBBCi2gPTqJio6xbavRveTp8Bx2fimXdhxkbCUTfmsMetopB9OPneCRX
lqAPLx5I1RjsWW/Lm4D9+B48tlrrqvZ9PdOz+dukg7+wWNFBZMkrBNN7AZCOddhN4BAHXhUQiYgC
4nSwhxbozVQf92tNd3fT4lPnXkkfDmgWx4PDT6/AAK8XLhIth5gJ4DRYNdQkZdwK7G4j1PmbxFWW
2V24jzxcy/vWt2l+ewBcrYs0q7hTyl5pR4hMeQtTNQObLQT3KrHvXFpnTEXxUm0r90j3qu20uhhK
Cwv27FuenFkFWRDASEh6QeUX49z7yts7cqCgxsoWywRvoNkUnD7FTMmV9Ys9VSQy6UZ/THKGUjsZ
/IdF6aDTUvr0yRA7nRlPQTifprcBwciw4vWHxxTKBAde9SY13EZlQOUfINUvYQ8PARW49odv/W5g
ZhxueNASkAfAIvoQbHtfPDBF7edKbxApdEg6D/7d1PrA3D3+JtNS+OOqabLRmE/D40lpFVOOok1W
O1g5yVFaqEDHjL2hY+T8vSLzQoZrbLd6YJvv7GlOXMhKpMqyX8/fE7Ihk4DuFqLDvQIY6O7DOLcZ
v/STNeZ/eaGGABg5JcuXn5qUrj1tOFy7tBcAkU+mVAn3M25Yjenbaqv+w/lLi6JI9yUolrdSI1pi
std0/5h0vBmkM/RibZVQ827yNy2zU3g4EnrYVAbtpYfLv28ZxrDh/TQUkmwm38AqzhNCulugM62x
kUFayHR0x7+wmO7RrB0HQqwaFPezIbAK7yPxDNoqrbFr0VIvUHA3IZPUMfMX9e1RMYSLvzcjKvKn
cKnbXwdoT5DgsT0REdlIl4v/Qb19E/teytil4ghJu4MtDJI2/b86Mhdn6o+WMJemCExqQZmW8Wo/
mQF2tBTT1HUbbY+Seixamn2ha1fu2BL178z2Nf9zrEzy6ywO3HTY+YRD1GuetIwsBN1RDXew9m3D
+HdMry/sp3OI3pFgLT0wDrbKehvonVdP/bpU2I2dDUVWbhkKryEERAZ5oHsWpXYKLZSiQiyWb3yx
mZf2KxlDEayphRLt4TlBbMPSzWH6xELpvjB/i2CKwigb/mNcozZ5zXmcatOVab4T+tO+kduJc0HC
Xuf2cYd+UNF4qAh9q1TXuWjyEJ7BGJP7/GBNm4QqO9zpV7dtDJdtMbjgAvrPeC+HMS+ovQmkfqi/
l4ZJiZxnUXItyXvXDDgvn38YLYr6cVm85fmTwmdxJIMFNY1YZi/oYFfxVLxcIFZPNFwclQ2XVNx7
EgKAiVYOoNPiYx/pkOGSrNFn6ZvROt/kJn+TxgZHSJLxJLb3rtAuhHhk9uVrq3MJkauASYF3owm7
VcHQMgsFo6J15uLctsr9xurjhx2dN5mRX/kxEY/aCyBY6sTuq9ybJZZ28tWgpEKgOXyQyj9Uox29
bf9tNSMLTuxE52gGUecJWgXb4WCh4/YEK3REvV9SLX8FDEzdJPCXbzYLt6eu54ZWtAaUPmJHUrDl
ibUiiqK5D5MuYoF7W+bdZfabtd8Gj6FO+a1TblnokkZRuZRaZaLFunk7dl9BZ4YH8fLAOIPUui50
RhwzlzJLEs7jLDNKemL5lJbXfzK7X0dXofKYjjbltbhCAB4vhAc9tpUw0v2Xk6VyQzVYTAlvDmIm
elEFlzuJbJ7hdODtAHsVID2SYIPLDhpLAoS338Tc9JSy1H9T96KHQvPibAx2MzFBQ11QWXb8/gTb
fGFuPtfaXotatCXx549sXmjfYdFDfS0yfOSIzu9xew00g4TswUsawClqsJrRuk1gvcXzKr4HbbjF
12DGKJL89yhRaC7Q/zXLePcieYwdV61c1OQppF7aFAwPQIq07TJJiRHuow+rrRrsJbF10cCk/2Ti
mRrFW1xlnQtUwNjsGBAA2Xv/gAgHMYK8WxFcLo6EuSgvWXDP3Ho+0nqYMymXF4OPCWEFPGkb8z5x
srZO0V1UtgJ7Oc3FIgu7P2hGuwIgSB/42xwU2RWZMLL/yzhpznWsjt969sFYoPwHm7c58DDLMb3N
ByGA1SuN4kYP8Hku8plDb9gAr6EGHMBI01ddZtJHUqBsDScD/XHZYvp2PRrf+EuOAIBBcxGQFfkE
wHw3VdpsIfvVamFbo+LM8T7ALb2+c2YT+S30VB6stxA05VecbATT/7RTHgkSha9CJiI5PHitYi6H
Cmqdv7Yy9Occ1xgPwtdfwr9isT02vX1aeGQTfUXyCOhoBzL1UfKfUAd+ylG3Rc+3Mw+mdRglc5Dn
AVOeYJ0pKUfQZFAL/smoSmCWFPqiRm1RHdiYrPa9feknrFQVQYn3xMjqmK4bmiB+t1OiImziKQFs
kcj7XQ4HmfCVMn+96CBRZTjGHwt14wVy/BbTQiziydkFF0ofnglNnXVv1s7RYgufkJvueLOq09ST
y7GMKx5ZDYdJVx7JeCa6u49l3mInL1M3yBb08O13gSR0xX0xOmh1pcR3CC13+NbT3Eh+6sIm3hvo
zjnNYVLSwe5TncE6Lmm5yToKczdthxtcqnLcIuLDHTes6Eklke9NkuuTLitjFRwWU6bam3/Jj9dU
HSQfxYHeJ0m9yBiOOP1jgtfJ77b3Qs2TFtgDm3VF1Ar7RSCFYSejHgwn5nNmzYCT4qmWmP+bhvVx
6ABy+swA3ABfo7DOCVA4SLilDiyeikzERQYPrSG+AfBPr6LcCwY4aeeVXjucYX7D/NPnPf/5tSkn
lNa7oWK8KaVqH9ucynaabmqg7QgWK2wvqT5RX/2s2+A3rPgEiB1EskFzwGrU3d0ZBkw9jsyKJNXd
ZZWmnwUlpdMUubs99gd3SIGK2xUBOmP22Xw6uSVBm2jnKwe2QrKNIUjqbOw2cK/arkVMBMgposo5
b+i9XGfgaIPLoFMKHy/DWC7joVbdj1+Kldn9bC2SJGAEZ14qoHqkxmBG89+JjfjBzbfeokpqhA9Y
Jnr0MI3pWJON9zouY9i4pFNPq84E/Spw7P2kt4bLaiocMFF4mPCa+d4IlPVo/J48+PzKPond1GqA
jWofIRNQzJmfcLuXym4BiSS8MBxyzEmQrtd10igDPMwIqs4A0iisphrKeTb/fSSF7eoX0DO7hmS3
HOTjvr7aLH2OEMbuqXibRXoW4TXLw0qsGi3EMB6n0zsmQbBR5FIapWsIHENGKK6i5W5XdoyvWo+0
1WfX5X8eXdTkX0Xv0skULM1mS/D/z3l2Y7xGArtuuadDR5wxCDWDSu8jhRVhYSpOTT7Os4vzFEmr
VgTCnEFd7fNITETne0VorFRpu7P1Sowy9hwGh253PfR/ABf9WsZAQ7fSTwHKXvkdCp3LGl5iONkL
WwcM+QXAZrFhmf2zR+tOXx9TsoQL/5C7K7kqHn/jPbkcqiTW5Ow/f9sgVBXgkjwO6rLzuIT98SyS
bHAss/JSzIxIe6M3p/9gRV8BBDyWidjeQrflpfuiVs8mUcd0ha48NIkGHX+Bowtsor6mm7rRJMDO
b8kI/jo1NakpMjncwSTxPt3eAQ8Xl6b7Eti7pdeHVXfb7rJs4Zlr0iq+g+GiTKr+VvtFGXlgrU1M
09YnXusE02qUDXMdM5hVQMyrUvErUiuYCZv2+4NJoIbIM1HiJKgtOdwm3BPUAwx/HcXsruHRPWbG
NHGrMj8xwJMF3sFv12hMxDPyjtZ3SE0VBW9Gs0xYegzTmPxX4L9qYin68KaTVqDQW4JmAlc8pgAq
+XKnIEkaa3VRMWHqFDQ8cXo6ItEbgphSjAuBnyankuz0QrYzuck+ETA/jKXPXkHz81GIgUcYff9v
189qhAzKrqV487wwE53V1nI2wUVduwG44hH0eYtKsEfc36byJN0DvFPtvqSD/iuFXRl0RnXGwxvN
iEEu/kz1ZT/Ay5EsIbqQQbJ6fjX7bYbGaetVirV3D9o/NSJJH0wwXxRBTojsz+cJrDu01GxtAG+a
371G63/rnGhCu/mE40lNam4Kv++vGeEPjAR2OUuAShPDW1zE0vkb1tdVbmyuM+KVvdH+l0gJ34hl
nDxdMocQnfsGiypivJgYvK/7u78c4dT7mrQh7hCIXkXvQVIP5yzauoSIKHT9NmjgQV7AlXHjpCac
Wu89Oxn8hclWF47nZOtw9UeO2vZYegIqzhyaGUAgiXSLOBIlowlreZ4keWaMM4NxNfhL46g0z002
rpNXHdo+OlvnepV+wg0rR3wN4zbZLjjWSvJf3s2sCIQZ03xkKUidzeMteox1IgE9zuk2YdVMcI/T
FQuz9dBQ2HLJwa/YJ87xDnexnap73AM+kToI38OT5V1n++2y/dAseR0Mm2eOLxhGftSCTR5Hz9Gy
pzmZ6gXdb8X7EPO0nwyThh946AzZos4VbKoAAVoJ1jOxijB70ZBIqlrw3dZBJMjP+T7sfT0BJ656
6cC+EUzfApZJpHSwO9aXAByO6mcx2QPrnhI8rp6vBpUEpawezI9MCvg+EMEn/UFeiZTnnVtg5cVZ
l9EzGQPLZvQfWJd1n/fDcBnhh+NZW1vcr4q/ObNvZ9Lv+TbSx/P6uYYKypBaJ6ql3jGQS33gjYJc
07P9OIRmnjgoNgP1+h/GM81JrPQHWHoSzsdYLrByBBOYyxxNtwNTDFmAtOr6VL9I3d0ZmfpoZyV0
nPOgYyvLm4EfkZUMXRfk4lUcW8HI6g8lxu/nQRZDTFe7/8gOkhUG14LQfBDF5qw6zhCgmb4QaBak
zRgkFV5xkU+0wtWUsabd+Lx0/lWI/1+Cux0vEYpp8XDHUwHbcjv5FhYlE6F28P9Ood7K1+PEew05
xV7jdpzaZ6cxyEStIiNdnKqf+e1sACgTlUJzOFFlbx02IkTlshUt3qt4ixr09O+ZtWZ0VbKJXZGB
lTvlDJu98pBYB4J7Y5IOEaavU+bf0LGo0CVslpy2XvxGWnSy9QFAV65n11gkSH073kXi3CBsxRdG
E55MuRwG3NPzbHSzFHG+OvCOm8TQv96ByMpkW3YrBCPvTgx9O61QL1Fsml97oG9xj5brelT6HDxS
XwMd+n9lkJ8awcbValTVNhXxKUeLAsvOZ2mwEuB3NZdrmL9eViRLJR8xqgaYNGiqVXT8Dl7swcRk
zaanPx3mFUgv3Xy6DFQFkgH+MhqbUOVL4+nKYZmfzfg1uZWElJYv2AzyMlNqVy4B3QUES+jBOIMi
9H5hJoccAa/CQpbl9TW3yhvEeBQY5AY51CBl2uoK9GHmMzkjzlOjLjNqjhVBCtQ85ODr+WyWa69H
m5vS1JTWMCosRGdzDlXr1A/OIIymKdo0olFZSho6/HO2kcOh6Kr1NFcm9rqo0WAR0YYxz5583CW4
9ibWM+CU02UlVM0F1eVIsjI1ixUex2FWa65jAfU6ZaFUgFUYZrU7pS1nfYDsYv2c+2xbJzWYym+J
ihgwovzUgq3YXGBB6ZhmsRlgNLYQTZeTpbclh+YW8WzxTrnZ9FJR/x4kMqLJ6rPtTPfSUVvtt8w5
38NVftDCKzaql+ZIbvBpTSYk7J/xNqoYCzayRFtGsuqnSfzJbxzOKu43oHFZdLAMw+wq9eZCvevd
+DGvmvB3W0yVCYvRL1YjGCyRbioPBQNrzGNRgltJl2HRD7+TDVnwMBwTZEdYE3wry1H77Kg3k+hT
Cx83fodcy6pMtTUn9icO3wa9j4znIkSHa8WGeEePhulZ3HCZkhnpWdCe1YXS5MvDjMhMBzy/UhdD
lT2rR1Ceg+ClT5zhtq3tqs8+HINJwfL89UFEZq6+lEO4tsgxgyCzW4H2iL9yWlaOfagLaDVSZ0Rb
8fphWimKJghCu/6eBDcdrusztZ5PFayeohJ1ohpqwzkl/X4+tts0gEgv7kogsQItg0eFBS5FbmqC
uqLNPTxgwj1MueQW8aWQjMhnRqj1xhIkHKJ1y6wPElzKsOWXnQsNGyJr9EvIDb1UWNhFfNIfRQn9
8x9yRQlwANKixrIeBF3Ud1RS5sv1xxMa0z7G+JonQLbRlj+XhjLYiUIHulRblRCn5UavvmoLfGtG
7sE+Vmh45/ilVm/KfRfJeGZjnO4FCHu0IW7OYNTT9NJC+dewkUIAJZIZxYhdriHC7N9QQ5yk7Zdu
s/UDqIIJoWS/IDEh/4rIdnncp2lp/9lDhTEa2lwRxrlAWLV/ztgEoY2W89KfpiayGu9U8io2CXYD
wgRxvmfAY6q8Vd9ussdftcYj38AO8Jw9cdLQeffyRRcXM5XWM5QNgGrYAb4P2h+VoA/bUeZkoxZd
hjP2zyKpE3yk/l3/w6LsHuuPEMNoGKE0SFvvFwjiIku6AeRRGHqlQ9eBY4K4/f/WNhV9w4bVKCpa
EyTizD864tWymiuj8d/vBaPmBZ1ExisvqePQ1KcTveJ9Vib6wX5INofcodF+DEm5IIy+b1IIyg4/
HyNukLjj9C6lrazqOs8B7dDtwNenNGnrhEVx1vjGAScs+e+aQt99h4bzmbFnqhMvdhtm0qBUn2Hh
by879/IPTp9G++ykvhYK+KsMb9O4R2CcWaw25P/zyP2fYkrUxdycuFHe7U9DZGazidvymTve2ozz
PVGwCeKk/OvnUCH+zIeHT6cwWPG+Hjc48eUSXpotlvWheUlYPm7u8OUCrC+jeQizbivU8I5Gz2Nu
DkjB88U3+uN8u7xARwserFY7S1dFHhokLSF/1kNDpY2JYVGAdQh3PEluE3v5EV6b6Z2pl6HVhStr
RDMpJATobSZYTb7mPKmfxQCidNZm6SSaWkuL6RxBw/RlgKOuah+RYo24fxS0Ck/SZc9bCP+oL40f
oGikwgKTvHrt7PUIppCRheAN9GzoWuGnrzRbyAXxM/idFcw0j8cIm8qtKkMflcjdCgb9oQbzfUSb
/kVXnRhSQv1qtjNp+ytDcjqNIUlXVW8Twy7HLYuGuAhA8f5qWp43bb1A7z4d8fUFwxtuFQCnRmhY
BhfY1tW8EvxJTdqcvqGLnbVy6AXtrJW9O1gU6PUiDS9A+WuCpZY9jjaM/raukZgQsO2Lng+bEd+M
vI0Dm7oMZPts0FqZlZWxFmiKKaVxRs51oVJ5IaUx8dZnQw3OOHHw/EXUei4k01+lTV6tEdXHcsfQ
zYrQR8ZHCiAy5UfZRlnd5kf2OLjk6HGVAlJdXVIZNOQxhIu8yjMFoENcME18WalLyAaCBTfXou8F
RqTmK4aXyNcawq5EVVKQq/U46p//nVp05PcmImq3O84m8DRg5bwhbIRYqjSPBziQl33hrOpKUJOz
QjMrwvLujyj7kjWfDJWXvzfqAiPrT++wjdYusvNMVAW2mJh1dz0k3S/tet7gbII9oPDwsp2dwuWR
9DI/z/JZh+nfMCvXCco1cbiFiDIV8ZI1IEdb/fnRu0cEdVw9BjOj2TISM8jHdMc+LASRuSa3s99m
Mg477T0Pz1/bxq2E92j6u326gkohuvbkIKjpmTv8MumDkCHeVxe6hjsB6bswXdGtW8Syr9qfsgNj
PJaNKph7Cn3IuNqu9Z4EeyhSmxNPchdkB9TCpfAVnIeUGYi7ja++ocHh+WAjclUbCJ7xyYl0he4y
esEN3mMxgpMOC0IHcLxWWrJvVGboxia6wLD4PnJWYFd6ANsaYJyc018ggoY0un94SMlRhH+66Rqi
xMZUo1psP4E094jglhbb+ZP0po34t6liIl8w9ruUwVympPNbDOw+09ynGN0JZKI+sas1hm0wSMsf
6nYuSqGVFu7vnHsB+pTkTCqD4zH8U5wiqkSI4ZnTec/PePTXJwvARJTzqv9gQAJV8XzPQjw9geRU
n0pRiYCIbCkp8w1d1sQF8jtwGeKLXIcZy285fofs/XiSju7a1aDemCK0pRVsPurvztvCcB82c1FY
1i357ot55GghFfeOZHH+wYHKSqM+4vHwmCMUPAACVuw0FuRJRTjYrVppxut+sT6z1a/d0j+1de6q
EM716vUZWPfFzswf+/8ESG1BUVFYqsDFB/h1v+IVsveQamd8lTrBzNZOJZJGcJaWJe4Osn7nX6US
ttRCGnwPBOIXKWqFfUEOHpnJyzfAkOtKnHPi7sjhM5CRpVtgOZr1vIcclvuvzs+kB4cQ3WkIr7BZ
c63GQRsknqbDYtdEkgbxIrZMIf0rwyUxHoxVv/3FZEEoP4YHHnL8iG4mBAUJ2KsuD6AJx8/A3uO8
g54txkUGn9SoPULTgucSrjRHxwbBT2plOLz/DWS0aQCEVm6MRofQvOLrGjN4Pq7rv6bnDFSHr4md
7eSN1JEf6ZX+nxWaoQNigtpclZVgPC3pXoVRtPjTr9w81V2pGj6YSRSGUEjlc8Kf1e3iF7rnum1w
ICOJbNWLP9/gJZfzbNaSwYR5h5y4kl9ZwRcbaG3i9uaGTGtU4AkjXizfIAppBD9hv+U8wMJwLFwP
zdXbCXsz75EshCvS0iG28XnIy+CWQVsaUkt0Z0UciZmR6M8k6cEHDKimnUN5+v4xderGdrLAEQ9z
6TKePZvrShYwNVqbHKHWmrWgFgq437TFv6YY/SyhXAXD9yokdRRIs52iBMRsxEBymqz1KFVyVwCb
uPV5o/+SAK3xbXP2eW/fFRTrzzT/K0PIOSP10TFYpi1RVl1P3grPIiLj7P+TWyYOCCBdw2M6aVRL
QuIPU/3HGoSj0ErKPoeicZ5+j3X3ACOMiOrmhPAk7KCgOMaSSlxkGHHprbhZzahjMyoxinFRajvX
EMMruGgAXB/F1YIlKWYLnf5CPoT57fc7IrUlHG3USPPJKY51rcsJb6hGFDhiS0hBUEJM4iAUwmcU
K0iTdqYIZ6Ffj4R9wZSj6omMupgwivP0pYZeHgYqKubkN6Ypj6VIWb9oSZ79dfup9mDDoVlFLasL
oS1hU/iNMyR+YztOEc6wrIt9OheghoHisplz3tzlT1MnH8msBQNm//+uXCNauL6Ka4wX0CiCG3qA
5INBZEKmbeJtE7HPCmAjtg8b3Un+CCWqZHgaIOSe2gupdd0b38LjSpRLzWyqt+qYSZSK3y/xBNRh
WCwf62HYIyEnbQFlN+gQ0C1j90MiGuxwpCqdTIBGSNLvcyUrPJfTSedV/1nmWyRCs6NY4lhfj9Tq
NFB6WTmpGlrNv5BtdRbZdMX0EBcJqnf/tklxzXcUxbspc7Uzl4go/0QFLpxFhCQsvJBTIKwKlM7J
L+NPvPNJFHbpmVEFfAv/AjSB9OvLd8nyNNm5XDWRX8wjhHEUAkqttea62rPgfJeWTDRjxZV4PgRL
holF3aXKI1R7pwISJ7SWj+a2Siezq7So+04zbgbXfaC8UnmV29ds0Yhk9gPviIj4EBqYvOyq8S/i
pQEBesGMGbqNBawnEqTLHA+8mRn9AIN76DFrl2Xnc+IRfI1UcpHhtlTNtLNAY0w6EZ1FjVE2hUhF
uP9AYU5tFmhiaJmDn2bnTTjNmgAQg3aIyJSCyvsKHiMVo1M=
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
