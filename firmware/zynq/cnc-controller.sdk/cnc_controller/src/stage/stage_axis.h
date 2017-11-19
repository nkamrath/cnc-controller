#ifndef _STAGE_STAGE_AXIS_H_
#define _STAGE_STAGE_AXIS_H_

#include <stdbool.h>
#include "stage_types.h"
#include "utils/stepper_motor.h"

#define MAX_MOTORS_PER_AXIS	2

typedef struct
{
	stepper_motor_t* motors[MAX_MOTORS_PER_AXIS];
} stage_axis_t;

stage_axis_t* StageAxis_Create(void);
void StageAxis_AddMotor(stage_axis_t* stage_axis, stepper_motor_t* motor);

void StageAxis_SetSpeed(stage_axis_t* stage_axis, uint32_t period_us);
void StageAxis_StepMotor(stage_axis_t* stage_axis, uint8_t motor_index, bool direction, uint32_t steps);
void StageAxis_StepAxis(stage_axis_t* stage_axis, bool direction, uint32_t steps);
bool StageAxis_IsBusy(stage_axis_t* stage_axis);

#endif
