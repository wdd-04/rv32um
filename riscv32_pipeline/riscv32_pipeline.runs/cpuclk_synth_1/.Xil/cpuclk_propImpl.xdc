set_property SRC_FILE_INFO {cfile:d:/riscv32_pipeline/riscv32_pipeline.gen/sources_1/ip/cpuclk_2/cpuclk.xdc rfile:../../../riscv32_pipeline.gen/sources_1/ip/cpuclk_2/cpuclk.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.200
