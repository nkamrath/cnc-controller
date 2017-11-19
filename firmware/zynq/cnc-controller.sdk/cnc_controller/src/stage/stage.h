#ifndef _STAGE_STAGE_H_
#define _STAGE_STAGE_H_

#include <stdbool.h>
#include "utils/stepper_motor.h"
#include "stage_types.h"


void Stage_Create(void);
void Stage_AddMotor(stepper_motor_t* motor, axis_t axis);

void Stage_SetOrigin(void);

void Stage_StepMotor(axis_t axis, uint8_t motor_index, bool direction, uint32_t steps);
void Stage_StepAxis(axis_t axis, bool direction, uint32_t steps);
void Stage_MoveTo(double_coordinate_t* coordinate);
void Stage_VectorMove(uint32_t period_x, int32_t steps_x, uint32_t period_y, int32_t steps_y, uint32_t period_z, int32_t steps_z);
bool Stage_IsBusy(void);

#endif
