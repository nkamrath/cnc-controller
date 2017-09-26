onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib cnc_controller_design_1_opt

do {wave.do}

view wave
view structure
view signals

do {cnc_controller_design_1.udo}

run -all

quit -force
