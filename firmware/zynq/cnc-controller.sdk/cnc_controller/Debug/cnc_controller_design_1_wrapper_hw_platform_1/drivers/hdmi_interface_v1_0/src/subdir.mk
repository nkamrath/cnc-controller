################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_design_1_wrapper_hw_platform_1/drivers/hdmi_interface_v1_0/src/hdmi_interface.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_design_1_wrapper_hw_platform_1/drivers/hdmi_interface_v1_0/src/hdmi_interface_selftest.c 

OBJS += \
./cnc_controller_design_1_wrapper_hw_platform_1/drivers/hdmi_interface_v1_0/src/hdmi_interface.o \
./cnc_controller_design_1_wrapper_hw_platform_1/drivers/hdmi_interface_v1_0/src/hdmi_interface_selftest.o 

C_DEPS += \
./cnc_controller_design_1_wrapper_hw_platform_1/drivers/hdmi_interface_v1_0/src/hdmi_interface.d \
./cnc_controller_design_1_wrapper_hw_platform_1/drivers/hdmi_interface_v1_0/src/hdmi_interface_selftest.d 


# Each subdirectory must supply rules for building sources it contributes
cnc_controller_design_1_wrapper_hw_platform_1/drivers/hdmi_interface_v1_0/src/hdmi_interface.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_design_1_wrapper_hw_platform_1/drivers/hdmi_interface_v1_0/src/hdmi_interface.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

cnc_controller_design_1_wrapper_hw_platform_1/drivers/hdmi_interface_v1_0/src/hdmi_interface_selftest.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_design_1_wrapper_hw_platform_1/drivers/hdmi_interface_v1_0/src/hdmi_interface_selftest.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


