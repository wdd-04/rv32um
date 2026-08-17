open_project D:/riscv32_pipeline_cache/riscv32_pipeline.xpr
puts "RUNS:" 
foreach r [get_runs] { puts "$r TYPE=[get_property IS_SYNTHESIS $r] STRATEGY=[get_property STRATEGY $r] STATUS=[get_property STATUS $r]" }
puts "IMPL_STRATEGIES:"
catch {foreach s [get_strategies -type implementation] { puts $s }} msg
puts "MSG=$msg"
exit
