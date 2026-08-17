module InstMem(
           input   wire       clk,
           input   wire[31: 0] pc,
           output  wire[31: 0] inst
       );

/***************************************************************
                        设备连接
****************************************************************/

inst_mem irom(
`ifdef DEBUG
             .clka(clk),
             .addra(pc[15: 2]),
`else
             .clka(clk),
             .addra(pc[15: 2]),
`endif
             .douta(inst)
         );

endmodule
