#ifndef _INCLUDE_MOTOR_CONFIGS_H_
#define _INCLUDE_MOTOR_CONFIGS_H_

#define MOTOR_CONFIGS_Y_0 {			\
	.direction_pin = 13,			\
	.pwm_channel = 0,				\
	.pwm_period = (600 * 100),		\
	.pwm_duty_cycle = (300 * 100)	\
}


#define MOTOR_CONFIGS_Z_0 {			\
	.direction_pin = 10,			\
	.pwm_channel = 1,				\
	.pwm_period = (600 * 100),		\
	.pwm_duty_cycle = (300 * 100)	\
}

#define MOTOR_CONFIGS_Z_1 {			\
	.direction_pin = 11,			\
	.pwm_channel = 2,				\
	.pwm_period = (600 * 100),		\
	.pwm_duty_cycle = (300 * 100)	\
}


#endif
