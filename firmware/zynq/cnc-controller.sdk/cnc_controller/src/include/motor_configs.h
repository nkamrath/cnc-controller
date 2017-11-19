#ifndef _INCLUDE_MOTOR_CONFIGS_H_
#define _INCLUDE_MOTOR_CONFIGS_H_

#define MOTOR_CONFIGS_STEPS_PER_REVOLUTION	800
#define MOTOR_CONFIGS_MM_PER_REVOLUTION		(25.4 / 20)
#define MOTOR_CONFIGS_MM_PER_STEP			(MOTOR_CONFIGS_MM_PER_REVOLUTION / MOTOR_CONFIGS_STEPS_PER_REVOLUTION)

#define MOTOR_CONFIGS_STEP_TIME_US			600

#define MOTOR_CONFIGS_Y_0 {										\
	.direction_pin = 13,										\
	.pwm_channel = 0,											\
	.pwm_period = (MOTOR_CONFIGS_STEP_TIME_US * 100),			\
	.pwm_duty_cycle = ((MOTOR_CONFIGS_STEP_TIME_US/2) * 100)	\
}


#define MOTOR_CONFIGS_X_0 {										\
	.direction_pin = 10,										\
	.pwm_channel = 1,											\
	.pwm_period = (MOTOR_CONFIGS_STEP_TIME_US * 100),			\
	.pwm_duty_cycle = ((MOTOR_CONFIGS_STEP_TIME_US/2) * 100)	\
}

#define MOTOR_CONFIGS_X_1 {										\
	.direction_pin = 11,										\
	.pwm_channel = 2,											\
	.pwm_period = (MOTOR_CONFIGS_STEP_TIME_US * 100),			\
	.pwm_duty_cycle = ((MOTOR_CONFIGS_STEP_TIME_US/2) * 100)	\
}

#define MOTOR_CONFIGS_Z_0 {										\
	.direction_pin = 12,										\
	.pwm_channel = 3,											\
	.pwm_period = (MOTOR_CONFIGS_STEP_TIME_US * 100),			\
	.pwm_duty_cycle = ((MOTOR_CONFIGS_STEP_TIME_US/2) * 100)	\
}

#define MOTOR_CONFIGS_Z_1 {										\
	.direction_pin = 15,										\
	.pwm_channel = 4,											\
	.pwm_period = (MOTOR_CONFIGS_STEP_TIME_US * 100),			\
	.pwm_duty_cycle = ((MOTOR_CONFIGS_STEP_TIME_US/2) * 100)	\
}

#endif
