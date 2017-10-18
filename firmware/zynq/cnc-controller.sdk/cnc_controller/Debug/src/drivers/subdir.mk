################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/drivers/interrupt_controller.c \
../src/drivers/pin.c \
../src/drivers/pl_pwm.c \
../src/drivers/ttc.c 

OBJS += \
./src/drivers/interrupt_controller.o \
./src/drivers/pin.o \
./src/drivers/pl_pwm.o \
./src/drivers/ttc.o 

C_DEPS += \
./src/drivers/interrupt_controller.d \
./src/drivers/pin.d \
./src/drivers/pl_pwm.d \
./src/drivers/ttc.d 


# Each subdirectory must supply rules for building sources it contributes
src/drivers/%.o: ../src/drivers/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../cnc_controller_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


