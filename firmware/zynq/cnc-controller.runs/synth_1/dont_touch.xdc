# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: new/zybo_constraints.xdc

# Block Designs: bd/cnc_controller_design_1/cnc_controller_design_1.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==cnc_controller_design_1 || ORIG_REF_NAME==cnc_controller_design_1}]

# IP: bd/cnc_controller_design_1/ip/cnc_controller_design_1_processing_system7_0_0/cnc_controller_design_1_processing_system7_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_processing_system7_0_0 || ORIG_REF_NAME==cnc_controller_design_1_processing_system7_0_0}]

# IP: bd/cnc_controller_design_1/ip/cnc_controller_design_1_axi_interconnect_0_0/cnc_controller_design_1_axi_interconnect_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_axi_interconnect_0_0 || ORIG_REF_NAME==cnc_controller_design_1_axi_interconnect_0_0}]

# IP: bd/cnc_controller_design_1/ip/cnc_controller_design_1_rst_ps7_0_100M_0/cnc_controller_design_1_rst_ps7_0_100M_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_rst_ps7_0_100M_0 || ORIG_REF_NAME==cnc_controller_design_1_rst_ps7_0_100M_0}]

# IP: bd/cnc_controller_design_1/ip/cnc_controller_design_1_xbar_0/cnc_controller_design_1_xbar_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_xbar_0 || ORIG_REF_NAME==cnc_controller_design_1_xbar_0}]

# IP: bd/cnc_controller_design_1/ip/cnc_controller_design_1_pl_pwm_0_0/cnc_controller_design_1_pl_pwm_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_pl_pwm_0_0 || ORIG_REF_NAME==cnc_controller_design_1_pl_pwm_0_0}]

# IP: bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_pc_0/cnc_controller_design_1_auto_pc_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_auto_pc_0 || ORIG_REF_NAME==cnc_controller_design_1_auto_pc_0}]

# IP: bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_pc_1/cnc_controller_design_1_auto_pc_1.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_auto_pc_1 || ORIG_REF_NAME==cnc_controller_design_1_auto_pc_1}]

# XDC: bd/cnc_controller_design_1/ip/cnc_controller_design_1_processing_system7_0_0/cnc_controller_design_1_processing_system7_0_0.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_processing_system7_0_0 || ORIG_REF_NAME==cnc_controller_design_1_processing_system7_0_0}] {/inst }]/inst ]]

# XDC: bd/cnc_controller_design_1/ip/cnc_controller_design_1_rst_ps7_0_100M_0/cnc_controller_design_1_rst_ps7_0_100M_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_rst_ps7_0_100M_0 || ORIG_REF_NAME==cnc_controller_design_1_rst_ps7_0_100M_0}] {/U0 }]/U0 ]]

# XDC: bd/cnc_controller_design_1/ip/cnc_controller_design_1_rst_ps7_0_100M_0/cnc_controller_design_1_rst_ps7_0_100M_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_rst_ps7_0_100M_0 || ORIG_REF_NAME==cnc_controller_design_1_rst_ps7_0_100M_0}] {/U0 }]/U0 ]]

# XDC: bd/cnc_controller_design_1/ip/cnc_controller_design_1_rst_ps7_0_100M_0/cnc_controller_design_1_rst_ps7_0_100M_0_ooc.xdc

# XDC: bd/cnc_controller_design_1/ip/cnc_controller_design_1_xbar_0/cnc_controller_design_1_xbar_0_ooc.xdc

# XDC: bd/cnc_controller_design_1/ip/edit_pl_pwm_v1_0.srcs/constrs_1/zybo_constraints.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==cnc_controller_design_1_pl_pwm_0_0 || ORIG_REF_NAME==cnc_controller_design_1_pl_pwm_0_0}] {/U0 }]/U0 ]]

# XDC: bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_pc_0/cnc_controller_design_1_auto_pc_0_ooc.xdc

# XDC: bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_pc_1/cnc_controller_design_1_auto_pc_1_ooc.xdc

# XDC: bd/cnc_controller_design_1/cnc_controller_design_1_ooc.xdc
