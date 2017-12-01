################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips_g.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips_hw.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips_options.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips_selftest.c \
D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips_sinit.c 

OBJS += \
./libsrc/qspips_v3_3/src/xqspips.o \
./libsrc/qspips_v3_3/src/xqspips_g.o \
./libsrc/qspips_v3_3/src/xqspips_hw.o \
./libsrc/qspips_v3_3/src/xqspips_options.o \
./libsrc/qspips_v3_3/src/xqspips_selftest.o \
./libsrc/qspips_v3_3/src/xqspips_sinit.o 

C_DEPS += \
./libsrc/qspips_v3_3/src/xqspips.d \
./libsrc/qspips_v3_3/src/xqspips_g.d \
./libsrc/qspips_v3_3/src/xqspips_hw.d \
./libsrc/qspips_v3_3/src/xqspips_options.d \
./libsrc/qspips_v3_3/src/xqspips_selftest.d \
./libsrc/qspips_v3_3/src/xqspips_sinit.d 


# Each subdirectory must supply rules for building sources it contributes
libsrc/qspips_v3_3/src/xqspips.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/qspips_v3_3/src/xqspips_g.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips_g.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/qspips_v3_3/src/xqspips_hw.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips_hw.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/qspips_v3_3/src/xqspips_options.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips_options.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/qspips_v3_3/src/xqspips_selftest.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips_selftest.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

libsrc/qspips_v3_3/src/xqspips_sinit.o: D:/Nate/dev/FPGA_stuff/fpgaProjects/zybo/cnc-controller/firmware/zynq/cnc-controller.sdk/cnc_controller_bsp/ps7_cortexa9_0/libsrc/qspips_v3_3/src/xqspips_sinit.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../test1_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\include" -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_bsp\ps7_cortexa9_0\libsrc\emacps_v3_4\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


