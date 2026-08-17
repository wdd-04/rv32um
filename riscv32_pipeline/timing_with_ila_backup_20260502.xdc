# ----------------------------------------------------------------------------
# PYNQ-Z2 + Arduino Shield CoreMark ILA Constraints
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Clock: PYNQ-Z2 PL clock 125 MHz, pin H16
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} [get_ports clk]

# ----------------------------------------------------------------------------
# Reset: PYNQ-Z2 BTN0, active high in top.v, internally inverted to rst_n
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports rst]

# ----------------------------------------------------------------------------
# Arduino Shield Switches: switch[5:0]
# Keep constrained while top.v has these ports.
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {switch[0]}]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {switch[1]}]
set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {switch[2]}]
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports {switch[3]}]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {switch[4]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {switch[5]}]

# ----------------------------------------------------------------------------
# Arduino Shield LEDs: led[7:0]
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {led[4]}]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {led[5]}]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports {led[6]}]
set_property -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS33} [get_ports {led[7]}]

# ----------------------------------------------------------------------------
# 7-Segment Digit Enables: led_en[7:0]
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {led_en[0]}]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {led_en[1]}]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {led_en[2]}]
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports {led_en[3]}]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports {led_en[4]}]
set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports {led_en[5]}]
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {led_en[6]}]
set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports {led_en[7]}]

# ----------------------------------------------------------------------------
# 7-Segment Segment Outputs
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN F17 IOSTANDARD LVCMOS33} [get_ports led_ca]
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports led_cb]
set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33} [get_ports led_cc]
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports led_cd]
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports led_ce]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports led_cf]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports led_cg]
set_property -dict {PACKAGE_PIN P16 IOSTANDARD LVCMOS33} [get_ports led_dp]

# ----------------------------------------------------------------------------
# UART TX, optional
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports tx_out]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list cpuClk/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {mem_wd[0]} {mem_wd[1]} {mem_wd[2]} {mem_wd[3]} {mem_wd[4]} {mem_wd[5]} {mem_wd[6]} {mem_wd[7]} {mem_wd[8]} {mem_wd[9]} {mem_wd[10]} {mem_wd[11]} {mem_wd[12]} {mem_wd[13]} {mem_wd[14]} {mem_wd[15]} {mem_wd[16]} {mem_wd[17]} {mem_wd[18]} {mem_wd[19]} {mem_wd[20]} {mem_wd[21]} {mem_wd[22]} {mem_wd[23]} {mem_wd[24]} {mem_wd[25]} {mem_wd[26]} {mem_wd[27]} {mem_wd[28]} {mem_wd[29]} {mem_wd[30]} {mem_wd[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {mem_addr[0]} {mem_addr[1]} {mem_addr[2]} {mem_addr[3]} {mem_addr[4]} {mem_addr[5]} {mem_addr[6]} {mem_addr[7]} {mem_addr[8]} {mem_addr[9]} {mem_addr[10]} {mem_addr[11]} {mem_addr[12]} {mem_addr[13]} {mem_addr[14]} {mem_addr[15]} {mem_addr[16]} {mem_addr[17]} {mem_addr[18]} {mem_addr[19]} {mem_addr[20]} {mem_addr[21]} {mem_addr[22]} {mem_addr[23]} {mem_addr[24]} {mem_addr[25]} {mem_addr[26]} {mem_addr[27]} {mem_addr[28]} {mem_addr[29]} {mem_addr[30]} {mem_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list coremark_score_hit]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list mem_we]]
set_property C_CLK_INPUT_FREQ_HZ 75000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_out]
