vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../riscv32_pipeline.gen/sources_1/ip/cpuclk_1/cpuclk_clk_wiz.v" \
"../../../../riscv32_pipeline.gen/sources_1/ip/cpuclk_1/cpuclk.v" \


vlog -work xil_defaultlib \
"glbl.v"

