open_project D:/riscv32_pipeline_cache/riscv32_pipeline.xpr
foreach r [list [get_runs impl_2] [get_runs synth_1_copy_1]] {
  puts "RUN=$r"
  foreach p {FLOW STRATEGY DIRECTORY PART CONSTRSET} { catch {puts "$p=[get_property $p $r]"} }
}
exit
