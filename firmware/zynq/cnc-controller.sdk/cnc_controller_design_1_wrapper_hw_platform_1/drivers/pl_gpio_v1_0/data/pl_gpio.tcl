

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "pl_gpio" "NUM_INSTANCES" "DEVICE_ID"  "C_pl_gpio_BASEADDR" "C_pl_gpio_HIGHADDR"
}
