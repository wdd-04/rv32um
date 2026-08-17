# ----------------------------------------------------------------------------
# ALINX / OPENEDV ZYNQ Navigator V2 minimal CoreMark UART constraints
# Target board: ZYNQ Navigator V2, PL clock 50 MHz
# Top ports kept intentionally small for area: clk, rst, tx_out
# ----------------------------------------------------------------------------

# PL system clock: 50 MHz
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 20.000 -name sys_clk_pin -waveform {0.000 10.000} [get_ports clk]

# Reset button: active low. top.v uses rst directly as reset_n after clock lock.
set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports rst]

# PL UART COM2 TX: FPGA TX -> USB/UART RX on board
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports tx_out]

# PL UART COM2 RX, currently unused because top.v has no rx port:
# set_property -dict {PACKAGE_PIN K14 IOSTANDARD LVCMOS33} [get_ports rx_in]

# ILA/debug is intentionally disabled for the area/timing bitstream.