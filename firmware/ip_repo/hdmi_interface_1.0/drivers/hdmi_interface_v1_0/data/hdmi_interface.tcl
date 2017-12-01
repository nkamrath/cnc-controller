

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "hdmi_interface" "NUM_INSTANCES" "DEVICE_ID"  "C_hdmi_interface_BASEADDR" "C_hdmi_interface_HIGHADDR"
}
