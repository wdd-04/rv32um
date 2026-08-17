vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../riscv32_pipeline.gen/sources_1/ip/cpuclk_1/cpuclk_clk_wiz.v" \
"../../../../riscv32_pipeline.gen/sources_1/ip/cpuclk_1/cpuclk.v" \


vlog -work xil_defaultlib \
"glbl.v"

