################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/stage/stage.c \
../src/stage/stage_axis.c 

OBJS += \
./src/stage/stage.o \
./src/stage/stage_axis.o 

C_DEPS += \
./src/stage/stage.d \
./src/stage/stage_axis.d 


# Each subdirectory must supply rules for building sources it contributes
src/stage/%.o: ../src/stage/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I../../cnc_controller_bsp/ps7_cortexa9_0/include -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../cnc_controller_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


