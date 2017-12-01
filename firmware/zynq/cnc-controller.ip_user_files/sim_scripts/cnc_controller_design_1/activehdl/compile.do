vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/xil_common_vip_v1_0_0
vlib activehdl/smartconnect_v1_0
vlib activehdl/axi_protocol_checker_v1_1_14
vlib activehdl/axi_vip_v1_0_2
vlib activehdl/axi_vip_v1_0_1
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_11
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_register_slice_v2_1_13
vlib activehdl/fifo_generator_v13_1_4
vlib activehdl/axi_data_fifo_v2_1_12
vlib activehdl/axi_crossbar_v2_1_14
vlib activehdl/xlconcat_v2_1_1
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/lib_fifo_v1_0_8
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/axi_datamover_v5_1_15
vlib activehdl/axi_sg_v4_1_6
vlib activehdl/axi_dma_v7_1_14
vlib activehdl/axi_protocol_converter_v2_1_13
vlib activehdl/axi_clock_converter_v2_1_12
vlib activehdl/blk_mem_gen_v8_3_6
vlib activehdl/axi_dwidth_converter_v2_1_13

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap xil_common_vip_v1_0_0 activehdl/xil_common_vip_v1_0_0
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap axi_protocol_checker_v1_1_14 activehdl/axi_protocol_checker_v1_1_14
vmap axi_vip_v1_0_2 activehdl/axi_vip_v1_0_2
vmap axi_vip_v1_0_1 activehdl/axi_vip_v1_0_1
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_11 activehdl/proc_sys_reset_v5_0_11
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_13 activehdl/axi_register_slice_v2_1_13
vmap fifo_generator_v13_1_4 activehdl/fifo_generator_v13_1_4
vmap axi_data_fifo_v2_1_12 activehdl/axi_data_fifo_v2_1_12
vmap axi_crossbar_v2_1_14 activehdl/axi_crossbar_v2_1_14
vmap xlconcat_v2_1_1 activehdl/xlconcat_v2_1_1
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap lib_fifo_v1_0_8 activehdl/lib_fifo_v1_0_8
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_15 activehdl/axi_datamover_v5_1_15
vmap axi_sg_v4_1_6 activehdl/axi_sg_v4_1_6
vmap axi_dma_v7_1_14 activehdl/axi_dma_v7_1_14
vmap axi_protocol_converter_v2_1_13 activehdl/axi_protocol_converter_v2_1_13
vmap axi_clock_converter_v2_1_12 activehdl/axi_clock_converter_v2_1_12
vmap blk_mem_gen_v8_3_6 activehdl/blk_mem_gen_v8_3_6
vmap axi_dwidth_converter_v2_1_13 activehdl/axi_dwidth_converter_v2_1_13

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"D:/Vivado/2017.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Vivado/2017.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Vivado/2017.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_common_vip_v1_0_0  -sv2k12 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl/xil_common_vip_v1_0_vl_rfs.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v1_1_14  -sv2k12 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/a1b2/hdl/axi_protocol_checker_v1_1_vl_rfs.sv" \

vlog -work axi_vip_v1_0_2  -sv2k12 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl/axi_vip_v1_0_vl_rfs.sv" \

vlog -work axi_vip_v1_0_1  -sv2k12 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_processing_system7_0_0/sim/cnc_controller_design_1_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_11 -93 \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/5db7/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_rst_ps7_0_100M_0/sim/cnc_controller_design_1_rst_ps7_0_100M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/f9c1/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_13  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/55c0/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_1_4  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/ebc2/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_4 -93 \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_4  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/ebc2/hdl/fifo_generator_v13_1_rfs.v" \

vlog -work axi_data_fifo_v2_1_12  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/95b9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_14  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/f582/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_xbar_0/sim/cnc_controller_design_1_xbar_0.v" \

vcom -work xil_defaultlib -93 \
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

vlog -work xlconcat_v2_1_1  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/73b7/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_xlconcat_0_0/sim/cnc_controller_design_1_xlconcat_0_0.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/832a/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_fifo_v1_0_8 -93 \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/c387/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6039/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_15 -93 \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/43a6/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_6 -93 \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/ddc9/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_14 -93 \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/bb0b/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_axi_dma_0_0/sim/cnc_controller_design_1_axi_dma_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_xbar_1/sim/cnc_controller_design_1_xbar_1.v" \

vcom -work xil_defaultlib -93 \
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

vlog -work axi_protocol_converter_v2_1_13  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/f0ae/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_pc_1/sim/cnc_controller_design_1_auto_pc_1.v" \

vlog -work axi_clock_converter_v2_1_12  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/80fd/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_3_6  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/4158/simulation/blk_mem_gen_v8_3.v" \

vlog -work axi_dwidth_converter_v2_1_13  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/3bde/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/7e3a/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/2ad9/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/39ca/hdl/verilog" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/6eb1/hdl" "+incdir+../../../../cnc-controller.srcs/sources_1/bd/cnc_controller_design_1/ipshared/1d61/hdl" \
"../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_us_1/sim/cnc_controller_design_1_auto_us_1.v" \
"../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_us_0/sim/cnc_controller_design_1_auto_us_0.v" \
"../../../bd/cnc_controller_design_1/ip/cnc_controller_design_1_auto_pc_0/sim/cnc_controller_design_1_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

