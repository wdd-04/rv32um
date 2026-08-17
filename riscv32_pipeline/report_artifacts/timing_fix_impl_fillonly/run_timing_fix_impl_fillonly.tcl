open_project D:/riscv32_pipeline_cache/riscv32_pipeline.xpr
reset_run synth_1_copy_1
set_property strategy Flow_AreaOptimized_high [get_runs synth_1_copy_1]
launch_runs synth_1_copy_1 -jobs 8
wait_on_run synth_1_copy_1
set synth_status [get_property STATUS [get_runs synth_1_copy_1]]
puts "SYNTH_STATUS=$synth_status"
if {[string match "*failed*" $synth_status]} { exit 1 }
reset_run impl_2
set_property STEPS.POWER_OPT_DESIGN.IS_ENABLED false [get_runs impl_2]
set_property STEPS.POST_PLACE_POWER_OPT_DESIGN.IS_ENABLED false [get_runs impl_2]
launch_runs impl_2 -to_step route_design -jobs 8
wait_on_run impl_2
set impl_status [get_property STATUS [get_runs impl_2]]
puts "IMPL_STATUS=$impl_status"
open_run impl_2
report_timing_summary -file D:/riscv32_pipeline_cache/report_artifacts/timing_fix_impl_fillonly/top_timing_timing_fix_fillonly.rpt
report_utilization -file D:/riscv32_pipeline_cache/report_artifacts/timing_fix_impl_fillonly/top_utilization_timing_fix_fillonly.rpt
exit
