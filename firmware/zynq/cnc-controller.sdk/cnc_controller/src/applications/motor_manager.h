#ifndef _APPLICATIONS_MOTOR_MANAGER_H_
#define _APPLICATIONS_MOTOR_MANAGER_H_

#include <stdint.h>
#include "utils/stepper_motor.h"

typedef enum
{
	MOTOR_AXIS_X,
	MOTOR_AXIS_Y,
	MOTOR_AXIS_Z
} motor_axis_t;

void MotorManager_Create(void);
void MotorManager_Add(stepper_motor_t* motor, motor_axis_t axis);
void MotorManager_StepAxis(motor_axis_t axis, bool direction, uint32_t steps);

#endif
