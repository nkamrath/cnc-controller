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

void StageManager_Create(void);

#endif
