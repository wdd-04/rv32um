vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../ipstatic" \
"../../../../riscv32_pipeline.gen/sources_1/ip/cpuclk_1/cpuclk_clk_wiz.v" \
"../../../../riscv32_pipeline.gen/sources_1/ip/cpuclk_1/cpuclk.v" \


vlog -work xil_defaultlib \
"glbl.v"

