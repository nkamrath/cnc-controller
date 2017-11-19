#include "stage_axis.h"
#include <string.h>
#include <stdlib.h>
#include "drivers/pl_pwm.h"

stage_axis_t* StageAxis_Create(void)
{
	stage_axis_t* axis = malloc(sizeof(stage_axis_t));
	if(axis)
	{
		memset(axis->motors, 0, sizeof(axis->motors));
	}
	return axis;
}

void StageAxis_AddMotor(stage_axis_t* stage_axis, stepper_motor_t* motor)
{
	for(int i = 0; i < MAX_MOTORS_PER_AXIS; i++)
	{
		if(stage_axis->motors[i] == NULL)
		{
			stage_axis->motors[i] = motor;
			break;
		}
	}
}

void StageAxis_SetSpeed(stage_axis_t* stage_axis, uint32_t period_us)
{
	for(int i = 0; i < MAX_MOTORS_PER_AXIS; i++)
	{
		if(stage_axis->motors[i])
		{
			StepperMotor_SetSpeed(stage_axis->motors[i], period_us);
		}
	}
}

void StageAxis_StepMotor(stage_axis_t* stage_axis, uint8_t motor_index, bool direction, uint32_t steps)
{
	StepperMotor_Step(stage_axis->motors[motor_index], direction, steps);
}

void StageAxis_StepAxis(stage_axis_t* stage_axis, bool direction, uint32_t steps)
{
	uint8_t enable_mask = 0;
	for(int i = 0; i < MAX_MOTORS_PER_AXIS; i++)
	{
		if(stage_axis->motors[i])
		{
			StepperMotor_Setup(stage_axis->motors[i], direction, steps);
			enable_mask |= (1<<stage_axis->motors[i]->pwm_channel);
		}
	}
	PlPwm_EnableMultiple(PL_PWM0, enable_mask);
}

bool StageAxis_IsBusy(stage_axis_t* stage_axis)
{
	bool busy = false;

	for(int i = 0; i < MAX_MOTORS_PER_AXIS; i++)
	{
		busy |= StepperMotor_IsBusy(stage_axis->motors[i]);
	}

	return busy;
}
