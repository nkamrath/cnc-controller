

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "pl_interrupt_manager" "NUM_INSTANCES" "DEVICE_ID"  "C_pl_interrupt_manager_BASEADDR" "C_pl_interrupt_manager_HIGHADDR"
}
