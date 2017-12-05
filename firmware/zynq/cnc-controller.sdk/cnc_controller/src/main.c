/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/


/* TO BUILD IMAGE FILE FOR SD CARD BOOT:
 * Vivado:
- make sure that SD0 is activated in PS7 configuration

SDK:
- create application project FSBL + new BSP (FLASH-FS must be activated), Template FSBL
- "Xilinx Tools"=>"Create Zynq Boot Image"
- Boot image partititions:
  1. FSBL.elf
  2. <bitstream_file>.bit
  3. <application>.elf
- "Create Image"
- Copy File to SD card (FAT): BOOT.bin

Board:
- insert SD card
- set boot mode jumper to "SD", power on
 */

#include "ps7_init.h"
#include "applications/stage_manager.h"
#include "network/ethernet/cdp_socket.h"
#include "stage/stage.h"
#include "xil_printf.h"

#include "drivers/interrupt_controller.h"
#include "os/scheduler.h"
#include "network/ethernet/ethernet.h"
#include "applications/device_discovery.h"
#include "utils/cdp_packet_handler.h"
#include "utils/device_state.h"

#include "drivers/pin.h"
#include "utils/stepper_motor.h"
#include "include/motor_configs.h"
#include "drivers/pl_pwm.h"

#include "drivers/pl_gpio.h"
#include "drivers/pl_interrupt_manager.h"

#include "drivers/axi_dma.h"
#include "drivers/hdmi_interface.h"

#include "neon/neon.h"

uint8_t pin_number = 13;
uint8_t pin_state = 0;

//uint32_t pixels[640];
uint32_t bytes_per_line = 640*4;

#define BYTES_PER_FRAME (640*480*4)//(640*480*4)

void pin_task(void* arg)
{
	if(pin_state == 0)
	{
		pin_state = 1;
	}
	else
	{
		pin_state = 0;
	}

	PlGpio_Write(PL_GPIO0, 0, pin_state);
	PlGpio_Write(PL_GPIO0, 1, pin_state);
	PlGpio_Write(PL_GPIO0, 2, pin_state);
	PlGpio_Write(PL_GPIO0, 3, pin_state);
	PlGpio_Write(PL_GPIO0, 4, pin_state);
	PlGpio_Write(PL_GPIO0, 5, pin_state);
	PlGpio_Write(PL_GPIO0, 6, pin_state);
	PlGpio_Write(PL_GPIO0, 7, pin_state);
}

void pin_read_task(void* arg)
{
	for(int i = 0; i < 8; i++)
	{
		if(PlGpio_Read(PL_GPIO0, i))
		{
			printf("Gpio %d high\r\n", i);
		}
		else
		{
			printf("Gpio %d low\r\n", i);
		}
	}

	uint32_t interrupt_status = PlGpio_GetInterruptStatus(PL_GPIO0);
	if(interrupt_status > 0)
	{
		printf("gpio interrupt has ocurred %d! clearing....\r\n", interrupt_status);
		PlGpio_ClearInterrupt(PL_GPIO0, interrupt_status);
	}
}


volatile int byte_counter = 0;
bool temp_state = false;

uint32_t* pixels = NULL;

void _HdmiEnable(void* arg)
{
	HdmiInterface_Enable(HDMI0);
}

void dma_task(void* arg)
{
	HdmiInterface_Disable(HDMI0);
	Dma_TransferBlocks(AXI_DMA0, pixels, BYTES_PER_FRAME, true);
}

int refresh_counter = 0;
void pixel_task(void* arg)
{
	if(refresh_counter == 0)
	{
		refresh_counter = 0;
		PlGpio_Write(PL_GPIO0, 0, true);
		temp_state = !temp_state;

		Neon_VectorAddScalarU32(pixels, 2, (BYTES_PER_FRAME/4));
		Xil_DCacheFlushRange((UINTPTR)pixels, BYTES_PER_FRAME);

//		Neon_VectorAddScalarU32(pixels, 2, (640));
//		Xil_DCacheFlushRange((UINTPTR)pixels, (640*4*4));
//		Neon_VectorAddScalarU32(&pixels[(640*4*4)], 2, ((BYTES_PER_FRAME/4)-((640*4*4))));
//		Xil_DCacheFlushRange((UINTPTR)&pixels[(640*4*4)], ((BYTES_PER_FRAME/2)-((640*4*4))));

		PlGpio_Write(PL_GPIO0, 0, false);
	}
	else
	{
		refresh_counter++;
	}
}

int main()
{
	//ps7_init();
	InterruptController_Init();
	InterruptController_EnableInterrupts();
	PlInterruptManager_Create();
	PlGpio_Create();
	HdmiInterface_Create(HDMI0);
	Dma_Create(AXI_DMA0, ENABLE_SCATTER_GATHER);

	pixels = malloc(BYTES_PER_FRAME);

	//init pixels
	for(uint32_t i = 0; i < ((BYTES_PER_FRAME/4)-1); i++)
	{
		pixels[i] = i;
	}

	Scheduler_Create();

	PlGpio_EnablePin(PL_GPIO0, 0);
//	PlGpio_EnablePin(PL_GPIO0, 1);
//	PlGpio_EnablePin(PL_GPIO0, 2);
//	PlGpio_EnablePin(PL_GPIO0, 3);
//	PlGpio_EnablePin(PL_GPIO0, 4);
//	PlGpio_EnablePin(PL_GPIO0, 5);
//	PlGpio_EnablePin(PL_GPIO0, 6);
//	PlGpio_EnablePin(PL_GPIO0, 7);
    PlGpio_ConfigureOutput(PL_GPIO0, 0);
//	PlGpio_ConfigureOutput(PL_GPIO0, 1);
//	PlGpio_ConfigureOutput(PL_GPIO0, 2);
//	PlGpio_ConfigureOutput(PL_GPIO0, 3);
//	PlGpio_ConfigureOutput(PL_GPIO0, 4);
//	PlGpio_ConfigureOutput(PL_GPIO0, 5);
//	PlGpio_ConfigureOutput(PL_GPIO0, 6);
//	PlGpio_ConfigureOutput(PL_GPIO0, 7);
	//Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(10000), Scheduler_MicrosToTicks(1000), 3, pin_task, NULL);

	//setup an interrupt on plgpio
	//PlGpio_EnableInterrupt(PL_GPIO0, 1, PL_GPIO_LEVEL_CHANGE);
	//Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(10000), Scheduler_MicrosToTicks(1000000), 3, pin_read_task, NULL);

	Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(100000), 0, 3, dma_task, NULL);
	Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(101000), 0, 3, _HdmiEnable, NULL);

	//non interrupt driven frame refresh
	//Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(100500), Scheduler_MicrosToTicks(20000), 3, pixel_task, NULL);

	//setup the advance and enable frame sync irq
	HdmiInterface_SetFrameSyncAdvance(HDMI0, 0);
	HdmiInterface_EnableFrameSync(HDMI0);

	//interrupt driven frame refresh
	PlInterruptManager_SetInterruptHandler(1, pixel_task, NULL);

	while(1);

	Ethernet_Create();

	stepper_motor_options_t motor_options = MOTOR_CONFIGS_Y_0;
	stepper_motor_t* motor = StepperMotor_Create(&motor_options);
	Stage_Create();
	Stage_AddMotor(motor, AXIS_Y);

	stepper_motor_options_t motor_options_z0 = MOTOR_CONFIGS_Z_0;
	motor = StepperMotor_Create(&motor_options_z0);
	Stage_AddMotor(motor, AXIS_Z);

	stepper_motor_options_t motor_options_z1 = MOTOR_CONFIGS_Z_1;
	motor = StepperMotor_Create(&motor_options_z1);
	Stage_AddMotor(motor, AXIS_Z);

	stepper_motor_options_t motor_options_x0 = MOTOR_CONFIGS_X_0;
	motor = StepperMotor_Create(&motor_options_x0);
	Stage_AddMotor(motor, AXIS_X);

	stepper_motor_options_t motor_options_x1 = MOTOR_CONFIGS_X_1;
	motor = StepperMotor_Create(&motor_options_x1);
	Stage_AddMotor(motor, AXIS_X);

	DeviceDiscovery_Create();
	CdpPacketHandler_Create();
	DeviceState_Create();
	StageManager_Create();

	/* receive and process packets */
	while (1) {
		//nothing
	}

	return 0;
}
