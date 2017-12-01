-makelib ies/xil_defaultlib -sv \
  "D:/Vivado/2017.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Vivado/2017.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "D:/Vivado/2017.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/axi_infrastructure_v1_1_0 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies/xil_common_vip_v1_0_0 -sv \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl/xil_common_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/smartconnect_v1_0 -sv \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/sc_util_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/axi_protocol_checker_v1_1_14 -sv \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/a1b2/hdl/axi_protocol_checker_v1_1_vl_rfs.sv" \
-endlib
-makelib ies/axi_vip_v1_0_2 -sv \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl/axi_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/axi_vip_v1_0_1 -sv \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_processing_system7_0_0/sim/cnc_controller_design_1_processing_system7_0_0.v" \
-endlib
-makelib ies/lib_cdc_v1_0_2 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies/proc_sys_reset_v5_0_11 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_rst_ps7_0_100M_0/sim/cnc_controller_design_1_rst_ps7_0_100M_0.vhd" \
-endlib
-makelib ies/generic_baseblocks_v2_1_0 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/f9c1/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies/axi_register_slice_v2_1_13 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/55c0/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies/fifo_generator_v13_1_4 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/ebc2/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies/fifo_generator_v13_1_4 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.vhd" \
-endlib
-makelib ies/fifo_generator_v13_1_4 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.v" \
-endlib
-makelib ies/axi_data_fifo_v2_1_12 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/95b9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies/axi_crossbar_v2_1_14 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/f582/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_xbar_0/sim/cnc_controller_design_1_xbar_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/cnc_controller_design_1/ipshared/pl_gpio_v1_0.srcs/pl_gpio_controller.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/aa24/hdl/pl_gpio_v1_0_pl_gpio.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/aa24/hdl/pl_gpio_v1_0.vhd" \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_pl_gpio_0_0/sim/cnc_controller_design_1_pl_gpio_0_0.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/fd76/hdl/pl_pwm_v1_0_S00_AXI.vhd" \
  "../../../bd/cnc_controller_design_1/pl_pwm/edit_pl_pwm_v1_0.srcs/pwm_channel.vhd" \
  "../../../bd/cnc_controller_design_1/pl_pwm/edit_pl_pwm_v1_0.srcs/pwm_controller.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/fd76/hdl/pl_pwm_v1_0.vhd" \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_pl_pwm_0_1/sim/cnc_controller_design_1_pl_pwm_0_1.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/367e/hdl/pl_interrupt_manager_v1_0_pl_interrupt_manager.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/367e/hdl/pl_interrupt_manager_v1_0.vhd" \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_pl_interrupt_manager_0_2/sim/cnc_controller_design_1_pl_interrupt_manager_0_2.vhd" \
-endlib
-makelib ies/xlconcat_v2_1_1 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/73b7/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_xlconcat_0_0/sim/cnc_controller_design_1_xlconcat_0_0.v" \
-endlib
-makelib ies/lib_pkg_v1_0_2 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/832a/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib ies/lib_fifo_v1_0_8 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/c387/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib ies/lib_srl_fifo_v1_0_2 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6039/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib ies/axi_datamover_v5_1_15 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/43a6/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib ies/axi_sg_v4_1_6 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/ddc9/hdl/axi_sg_v4_1_rfs.vhd" \
-endlib
-makelib ies/axi_dma_v7_1_14 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/bb0b/hdl/axi_dma_v7_1_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_axi_dma_0_0/sim/cnc_controller_design_1_axi_dma_0_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_xbar_1/sim/cnc_controller_design_1_xbar_1.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/cnc_controller_design_1/ipshared/966d/hdl/tmds_encoder.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/966d/hdl/dvid.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/966d/src/fifo.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/966d/hdl/modn.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/966d/hdl/vga_sync.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/966d/hdl/vga.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/966d/hdl/hdmi_interface.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/966d/hdl/hdmi_interface_v1_0.vhd" \
  "../../../bd/cnc_controller_design_1/ipshared/966d/hdl/hdmi_interface_v1_0_hdmi_interface.vhd" \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_hdmi_interface_0_0/sim/cnc_controller_design_1_hdmi_interface_0_0.vhd" \
  "../../../bd/cnc_controller_design_1/hdl/cnc_controller_design_1.vhd" \
-endlib
-makelib ies/axi_protocol_converter_v2_1_13 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/f0ae/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_pc_1/sim/cnc_controller_design_1_auto_pc_1.v" \
-endlib
-makelib ies/axi_clock_converter_v2_1_12 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/80fd/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies/blk_mem_gen_v8_3_6 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/4158/simulation/blk_mem_gen_v8_3.v" \
-endlib
-makelib ies/axi_dwidth_converter_v2_1_13 \
  "../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/3bde/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_us_1/sim/cnc_controller_design_1_auto_us_1.v" \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_us_0/sim/cnc_controller_design_1_auto_us_0.v" \
  "../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_pc_0/sim/cnc_controller_design_1_auto_pc_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

