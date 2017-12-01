################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/pl_pwm_v1_0/src/pl_pwm.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/pl_pwm_v1_0/src/pl_pwm_selftest.c 

OBJS += \
./libsrc/pl_pwm_v1_0/src/pl_pwm.o \
./libsrc/pl_pwm_v1_0/src/pl_pwm_selftest.o 

C_DEPS += \
./libsrc/pl_pwm_v1_0/src/pl_pwm.d \
./libsrc/pl_pwm_v1_0/src/pl_pwm_selftest.d 


# Each subdirectory must supply rules for building sources it contributes
libsrc/pl_pwm_v1_0/src/pl_pwm.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/pl_pwm_v1_0/src/pl_pwm.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/pl_pwm_v1_0/src/pl_pwm_selftest.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/pl_pwm_v1_0/src/pl_pwm_selftest.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


