#ifndef _UTILS_STEPPER_MOTOR_H_
#define _UTILS_STEPPER_MOTOR_H_

#include <stdint.h>
#include <stdbool.h>

typedef struct
{
	uint8_t direction_pin;
	uint8_t pwm_channel;
} stepper_motor_t;

typedef struct
{
	uint8_t direction_pin;
	uint8_t pwm_channel;
	uint32_t pwm_period;
	uint32_t pwm_duty_cycle;
} stepper_motor_options_t;

stepper_motor_t* StepperMotor_Create(stepper_motor_options_t* options);
void StepperMotor_SetSpeed(stepper_motor_t* motor, uint32_t period_us);
void StepperMotor_Setup(stepper_motor_t* motor, uint8_t direction, uint32_t steps);
void StepperMotor_Step(stepper_motor_t* motor, uint8_t direction, uint32_t number_steps);
bool StepperMotor_IsBusy(stepper_motor_t* motor);

#endif
