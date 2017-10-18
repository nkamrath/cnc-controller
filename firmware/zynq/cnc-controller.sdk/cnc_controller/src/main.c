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

#include "network/ethernet/cdp_socket.h"
#include <stdio.h>

#include "xil_printf.h"

#include "drivers/interrupt_controller.h"
#include "os/scheduler.h"
#include "network/ethernet/ethernet.h"
#include "applications/device_discovery.h"
#include "applications/motor_manager.h"

#include "utils/cdp_packet_handler.h"
#include "utils/device_state.h"

#include "drivers/pin.h"
#include "utils/stepper_motor.h"
#include "include/motor_configs.h"
#include "drivers/pl_pwm.h"

uint8_t pin_number = 13;
uint8_t pin_state = 0;

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

	Pin_Write(pin_number, pin_state);
}

int main()
{

	InterruptController_Init();
	InterruptController_EnableInterrupts();

	Scheduler_Create();

	//Pin_ConfigureOutput(pin_number);
	//Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(10000), Scheduler_MicrosToTicks(5000000), 3, pin_task, NULL);

	Ethernet_Create();

	stepper_motor_options_t motor_options = MOTOR_CONFIGS_Y_0;
	stepper_motor_t* motor = StepperMotor_Create(&motor_options);
	MotorManager_Create();
	MotorManager_Add(motor, MOTOR_AXIS_Y);

	stepper_motor_options_t motor_options_z0 = MOTOR_CONFIGS_Z_0;
	motor = StepperMotor_Create(&motor_options_z0);
	MotorManager_Add(motor, MOTOR_AXIS_Z);

	stepper_motor_options_t motor_options_z1 = MOTOR_CONFIGS_Z_1;
	motor = StepperMotor_Create(&motor_options_z1);
	MotorManager_Add(motor, MOTOR_AXIS_Z);

	DeviceDiscovery_Create();
	CdpPacketHandler_Create();
	DeviceState_Create();

	/* receive and process packets */
	while (1) {
		//nothing
	}

	return 0;
}
