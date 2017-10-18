#include "stepper_motor.h"
#include "drivers/pl_pwm.h"
#include "drivers/pin.h"

stepper_motor_t* StepperMotor_Create(stepper_motor_options_t* options)
{
	stepper_motor_t* motor = (stepper_motor_t*) malloc(sizeof(stepper_motor_t));
	if(motor)
	{
		motor->direction_pin = options->direction_pin;
		motor->pwm_channel = options->pwm_channel;

		//configure the pwm channel
		PlPwm_Disable(PL_PWM0, motor->pwm_channel);
		PlPwm_SetReloadEnabled(PL_PWM0, motor->pwm_channel, false);
		PlPwm_SetPeriod(PL_PWM0, motor->pwm_channel, options->pwm_period);
		PlPwm_SetDutyCycle(PL_PWM0, motor->pwm_channel, options->pwm_duty_cycle);

		//configure direction pin
		Pin_ConfigureOutput(motor->direction_pin);

	}
	return motor;
}

void StepperMotor_Step(stepper_motor_t* motor, uint8_t direction, uint32_t number_steps)
{
	PlPwm_Disable(PL_PWM0, motor->pwm_channel);
	Pin_Write(motor->direction_pin, direction & 1);
	PlPwm_SetPeriodCount(PL_PWM0, motor->pwm_channel, number_steps);
	PlPwm_Enable(PL_PWM0, motor->pwm_channel);
}
