#include <stdbool.h>
#include <stdlib.h>
#include "motor_manager.h"
#include "utils/stepper_motor.h"

#include "utils/cdp_packet_handler.h"
#include "network/cdp/data_items/step_motor_command.h"
#include "network/cdp/data_items/step_axis_command.h"

#include "xil_printf.h"

#include "drivers/pl_pwm.h"
#include "drivers/pin.h"

#define _NUM_AXIS			3
#define _MOTORS_PER_AXIS	3

static stepper_motor_t* motors[_NUM_AXIS][_MOTORS_PER_AXIS];
static bool _initialized = false;

void _HandleStepMotorCommand(uint8_t* data, uint16_t length)
{
	if(length == sizeof(cdp_step_motor_command_t))
	{
		print("Stepping motor\r\n");

		cdp_step_motor_command_t* command = (cdp_step_motor_command_t*)data;
		printf("args: %d, %d", command->direction, command->number_steps);
		stepper_motor_t* motor = motors[command->motor_axis][command->motor_index];
		if(motor)
		{
			StepperMotor_Step(motor, command->direction, command->number_steps);
		}
	}
}

void _HandleStepAxisCommand(uint8_t* data, uint16_t length)
{
	if(length == sizeof(cdp_step_axis_command_t))
	{
		print("stepping axis \r\n");
		cdp_step_axis_command_t* command = (cdp_step_axis_command_t*)data;
		uint8_t enable_mask = 0;
		for(int i = 0; i < _MOTORS_PER_AXIS; i++)
		{
			if(motors[command->motor_axis][i])
			{
				PlPwm_Disable(PL_PWM0, motors[command->motor_axis][i]->pwm_channel);
				//setup the step count
				PlPwm_SetPeriodCount(PL_PWM0, motors[command->motor_axis][i]->pwm_channel, command->number_steps);
				//setup the direction pin
				Pin_Write(motors[command->motor_axis][i]->direction_pin, command->direction);
				//add it to the enable mask
				enable_mask |= (1<<motors[command->motor_axis][i]->pwm_channel);
			}
		}
		//enable axis motors in sync
		PlPwm_EnableMultiple(PL_PWM0, enable_mask);
	}
}

void MotorManager_Create(void)
{
	if(!_initialized)
	{
		CdpPacketHandler_Create();
		CdpPacketHandler_RegisterRxCallback(CDP_STEP_MOTOR_COMMAND_TYPE, _HandleStepMotorCommand);
		CdpPacketHandler_RegisterRxCallback(CDP_STEP_AXIS_COMMAND_TYPE, _HandleStepAxisCommand);

		for(int i = 0; i < _NUM_AXIS; i++)
		{
			for(int j = 0; j < _MOTORS_PER_AXIS; j++)
			{
				motors[i][j] = NULL;
			}
		}
		_initialized = true;
	}
}

void MotorManager_Add(stepper_motor_t* motor, motor_axis_t axis)
{
	for(int i = 0; i < _MOTORS_PER_AXIS; i++)
	{
		if(motors[axis][i] == NULL)
		{
			motors[axis][i] = motor;
			return;
		}
	}
}

void MotorManager_StepAxis(motor_axis_t axis, bool direction, uint32_t steps)
{

}
