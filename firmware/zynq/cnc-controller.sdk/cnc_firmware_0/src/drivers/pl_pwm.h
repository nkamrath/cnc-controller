#ifndef _DRIVERS_PL_PWM_H_
#define _DRIVERS_PL_PWM_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

#define PL_PWM0_BASE_ADDRESS 			0x43c00000
#define PL_PWM0							((pl_pwm_t*)PL_PWM0_BASE_ADDRESS)

#define PL_PWM_CHANNELS_PER_CONTROLLER	8

#define CONTROL_BITS_PER_CHANNEL		4
#define CONTROL_ENABLE_SHIFT			0
#define CONTROL_ENABLE_MASK				(0x1)
#define CONTROL_IDLE_LEVEL_SHIFT		2
#define CONTROL_IDLE_LEVEL_MASK			(0x01<<CONTROL_IDLE_LEVEL_SHIFT)
#define CONTROL_RELOAD_SHIFT			3
#define CONTROL_RELOAD_MASK				(0x01<<CONTROL_RELOAD_SHIFT)

typedef struct PL_PWM_T
{
	volatile uint32_t control;
	volatile uint32_t reserved;
	volatile uint32_t periods[PL_PWM_CHANNELS_PER_CONTROLLER];
	volatile uint32_t duty_cycles[PL_PWM_CHANNELS_PER_CONTROLLER];
	volatile uint32_t period_counts[PL_PWM_CHANNELS_PER_CONTROLLER];
	volatile uint32_t status_registers[PL_PWM_CHANNELS_PER_CONTROLLER];
} pl_pwm_t;

void PlPwm_Enable(pl_pwm_t* pwm, uint8_t channel);
void PlPwm_EnableMultiple(pl_pwm_t* pwm, uint8_t channel_mask);
void PlPwm_Disable(pl_pwm_t* pwm, uint8_t channel);
void PlPwm_DisableMultiple(pl_pwm_t* pwm, uint8_t channel_mask);
void PlPwm_SetIdleLevel(pl_pwm_t* pwm, uint8_t channel, bool idle_level);
void PlPwm_SetReloadEnabled(pl_pwm_t* pwm, uint8_t channel, bool reload_enabled);

void PlPwm_SetPeriod(pl_pwm_t* pwm, uint8_t channel, uint32_t period);
void PlPwm_SetDutyCycle(pl_pwm_t* pwm, uint8_t channel, uint32_t duty_cycle);
void PlPwm_SetPeriodCount(pl_pwm_t* pwm, uint8_t channel, uint32_t period_count);
uint32_t PlPwm_GetStatus(pl_pwm_t* pwm, uint8_t channel);

#endif
