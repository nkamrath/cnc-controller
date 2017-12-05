################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/drivers/axi_dma.c \
../src/drivers/hdmi_interface.c \
../src/drivers/interrupt_controller.c \
../src/drivers/pin.c \
../src/drivers/pl_gpio.c \
../src/drivers/pl_interrupt_manager.c \
../src/drivers/pl_pwm.c \
../src/drivers/ttc.c 

OBJS += \
./src/drivers/axi_dma.o \
./src/drivers/hdmi_interface.o \
./src/drivers/interrupt_controller.o \
./src/drivers/pin.o \
./src/drivers/pl_gpio.o \
./src/drivers/pl_interrupt_manager.o \
./src/drivers/pl_pwm.o \
./src/drivers/ttc.o 

C_DEPS += \
./src/drivers/axi_dma.d \
./src/drivers/hdmi_interface.d \
./src/drivers/interrupt_controller.d \
./src/drivers/pin.d \
./src/drivers/pl_gpio.d \
./src/drivers/pl_interrupt_manager.d \
./src/drivers/pl_pwm.d \
./src/drivers/ttc.d 


# Each subdirectory must supply rules for building sources it contributes
src/drivers/%.o: ../src/drivers/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I"D:\Nate\code\zynq\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -I../../cnc_controller_bsp/ps7_cortexa9_0/include -I"D:\Nate\code\zynq\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller_design_1_wrapper_hw_platform_1" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard -I../../cnc_controller_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


