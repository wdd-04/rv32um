open_project D:/riscv32_pipeline_cache/riscv32_pipeline.xpr
current_run -implementation [get_runs impl_trial_netdelay_high]
save_project
puts "ACTIVE_IMPL=[current_run -implementation]"
exit
