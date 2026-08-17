set outdir "D:/riscv32_pipeline_cache/report_artifacts/impl_strategy_trials"
open_project D:/riscv32_pipeline_cache/riscv32_pipeline.xpr
set synth_run synth_1_copy_1
set trials {
  {impl_trial_perf_explore Performance_Explore route_design}
  {impl_trial_netdelay_high Performance_NetDelay_high route_design}
  {impl_trial_postroute_phys Performance_ExplorePostRoutePhysOpt route_design}
}
set summary [open "$outdir/strategy_summary.csv" w]
puts $summary "run,strategy,status,wns,util_lut,util_ff,util_bram,power_w"
foreach t $trials {
  lassign $t run strat step
  puts "==== TRIAL $run STRATEGY=$strat ===="
  if {[llength [get_runs -quiet $run]] == 0} {
    create_run $run -parent_run $synth_run -flow {Vivado Implementation 2021} -constrset constrs_1
  }
  if {[catch {set_property STRATEGY $strat [get_runs $run]} err]} {
    puts "SKIP $run: cannot set strategy $strat: $err"
    puts $summary "$run,$strat,SKIP_STRATEGY,,, , ,"
    flush $summary
    continue
  }
  catch {set_property STEPS.POWER_OPT_DESIGN.IS_ENABLED false [get_runs $run]}
  catch {set_property STEPS.POST_PLACE_POWER_OPT_DESIGN.IS_ENABLED false [get_runs $run]}
  reset_run $run
  launch_runs $run -to_step $step -jobs 8
  wait_on_run $run
  set status [get_property STATUS [get_runs $run]]
  puts "STATUS $run = $status"
  if {[catch {open_run $run} err]} {
    puts "OPEN_RUN_FAILED $run: $err"
    puts $summary "$run,$strat,$status,,,,,"
    flush $summary
    continue
  }
  set timing_file "$outdir/${run}_timing.rpt"
  set util_file "$outdir/${run}_util.rpt"
  set power_file "$outdir/${run}_power.rpt"
  report_timing_summary -file $timing_file
  report_utilization -file $util_file
  catch {report_power -file $power_file}
  set wns "NA"
  set tp [get_timing_paths -setup -max_paths 1]
  if {[llength $tp] > 0} { set wns [format %.3f [get_property SLACK [lindex $tp 0]]] }
  set lut "NA"; set ff "NA"; set bram "NA"; set power "NA"
  catch {set lut [get_property USED [get_cells -hier -filter {PRIMITIVE_GROUP == LUT}]]}
  puts $summary "$run,$strat,$status,$wns,NA,NA,NA,NA"
  flush $summary
  close_design
}
close $summary
exit
