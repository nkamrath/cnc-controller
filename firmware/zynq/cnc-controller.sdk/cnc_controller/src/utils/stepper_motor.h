#ifndef _UTILS_STEPPER_MOTOR_H_
#define _UTILS_STEPPER_MOTOR_H_

#include <stdint.h>

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
void StepperMotor_Step(stepper_motor_t* motor, uint8_t direction, uint32_t number_steps);

#endif
