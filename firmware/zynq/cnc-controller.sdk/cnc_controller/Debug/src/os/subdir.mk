################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/os/critical_section.c \
../src/os/queue.c \
../src/os/scheduler.c 

OBJS += \
./src/os/critical_section.o \
./src/os/queue.o \
./src/os/scheduler.o 

C_DEPS += \
./src/os/critical_section.d \
./src/os/queue.d \
./src/os/scheduler.d 


# Each subdirectory must supply rules for building sources it contributes
src/os/%.o: ../src/os/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../cnc_controller_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


