################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_bdring.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_control.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_g.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_hw.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_intr.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_sinit.c 

OBJS += \
./libsrc/emacps_v3_4/src/xemacps.o \
./libsrc/emacps_v3_4/src/xemacps_bdring.o \
./libsrc/emacps_v3_4/src/xemacps_control.o \
./libsrc/emacps_v3_4/src/xemacps_g.o \
./libsrc/emacps_v3_4/src/xemacps_hw.o \
./libsrc/emacps_v3_4/src/xemacps_intr.o \
./libsrc/emacps_v3_4/src/xemacps_sinit.o 

C_DEPS += \
./libsrc/emacps_v3_4/src/xemacps.d \
./libsrc/emacps_v3_4/src/xemacps_bdring.d \
./libsrc/emacps_v3_4/src/xemacps_control.d \
./libsrc/emacps_v3_4/src/xemacps_g.d \
./libsrc/emacps_v3_4/src/xemacps_hw.d \
./libsrc/emacps_v3_4/src/xemacps_intr.d \
./libsrc/emacps_v3_4/src/xemacps_sinit.d 


# Each subdirectory must supply rules for building sources it contributes
libsrc/emacps_v3_4/src/xemacps.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/emacps_v3_4/src/xemacps_bdring.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_bdring.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/emacps_v3_4/src/xemacps_control.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_control.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/emacps_v3_4/src/xemacps_g.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_g.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/emacps_v3_4/src/xemacps_hw.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_hw.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/emacps_v3_4/src/xemacps_intr.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_intr.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/emacps_v3_4/src/xemacps_sinit.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/emacps_v3_4/src/xemacps_sinit.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


