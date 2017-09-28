################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/network/ethernet/discovery_socket.c \
../src/network/ethernet/ethernet.c \
../src/network/ethernet/ethernet_command.c 

OBJS += \
./src/network/ethernet/discovery_socket.o \
./src/network/ethernet/ethernet.o \
./src/network/ethernet/ethernet_command.o 

C_DEPS += \
./src/network/ethernet/discovery_socket.d \
./src/network/ethernet/ethernet.d \
./src/network/ethernet/ethernet_command.d 


# Each subdirectory must supply rules for building sources it contributes
src/network/ethernet/%.o: ../src/network/ethernet/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I"D:\Nate\dev\FPGA_stuff\fpgaProjects\zybo\cnc-controller\firmware\zynq\cnc-controller.sdk\cnc_controller\src" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../cnc_controller_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


