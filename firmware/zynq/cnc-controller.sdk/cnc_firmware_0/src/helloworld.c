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

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_exception.h"

#include "drivers/ttc.h"
#include "drivers/interrupt_controller.h"
#include "drivers/pl_pwm.h"
#include "hw_al/timer.h"
#include "os/scheduler.h"

#define PL_PWM_BASE_ADDRESS 0x43c00000

static volatile int counter = 0;

void task_1(void* arg)
{
	counter++;
	print("Hello World\n\r");
}

void task_2(void* arg)
{
	while(counter < 5);
}

int main()
{
    init_platform();

    InterruptController_Init();

    Scheduler_Create();

    //Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(1000000), Scheduler_MicrosToTicks(1000000), 5, task_2, NULL);
    Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(1000000), Scheduler_MicrosToTicks(1000000), 3, task_1, NULL);

    //startup the custom pl_pwm axi module
    PlPwm_Disable(PL_PWM0, 0);
    PlPwm_Disable(PL_PWM0, 1);
    PlPwm_SetPeriod(PL_PWM0, 0, 10000);
    PlPwm_SetPeriod(PL_PWM0, 1, 20000);
    PlPwm_SetDutyCycle(PL_PWM0, 0, 5000);
    PlPwm_SetDutyCycle(PL_PWM0, 1, 5000);
    PlPwm_SetPeriodCount(PL_PWM0, 0, 20);
    PlPwm_SetPeriodCount(PL_PWM0, 1, 10);
    PlPwm_SetReloadEnabled(PL_PWM0, 1, 1);
    PlPwm_EnableMultiple(PL_PWM0, 3);

    print("Hello World\n\r");

    while(counter < 1 );

    PlPwm_DisableMultiple(PL_PWM0, 3);

    while(counter < 2);

    //restart it again
	PlPwm_DisableMultiple(PL_PWM0, 3);

	PlPwm_SetIdleLevel(PL_PWM0, 1, 1);
	PlPwm_SetReloadEnabled(PL_PWM0, 1, 0);
	PlPwm_EnableMultiple(PL_PWM0, 3);

    while(counter < 3 );

    PlPwm_DisableMultiple(PL_PWM0, 3);

    cleanup_platform();
    return 0;
}