connect -url tcp:127.0.0.1:3121
source D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/cnc-controller.sdk/cnc_controller_design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zybo 210279655606A"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo 210279655606A" && level==0} -index 1
fpga -file D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/cnc-controller.sdk/cnc_controller_design_1_wrapper_hw_platform_0/cnc_controller_design_1_wrapper.bit
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zybo 210279655606A"} -index 0
loadhw D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/cnc-controller.sdk/cnc_controller_design_1_wrapper_hw_platform_0/system.hdf
targets -set -filter {name =~"APU" && jtag_cable_name =~ "Digilent Zybo 210279655606A"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279655606A"} -index 0
dow D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/cnc-controller.sdk/cnc_controller_0/Debug/cnc_controller_0.elf
bpadd -addr &main
