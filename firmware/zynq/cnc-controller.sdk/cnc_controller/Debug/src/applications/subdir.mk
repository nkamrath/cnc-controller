################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/applications/device_discovery.c \
../src/applications/stage_manager.c 

OBJS += \
./src/applications/device_discovery.o \
./src/applications/stage_manager.o 

C_DEPS += \
./src/applications/device_discovery.d \
./src/applications/stage_manager.d 


# Each subdirectory must supply rules for building sources it contributes
src/applications/%.o: ../src/applications/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I"D:\Nate\code\zynq\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I../../cnc_controller_bsp/ps7_cortexa9_0/include -I"D:\Nate\code\zynq\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard -I../../cnc_controller_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


