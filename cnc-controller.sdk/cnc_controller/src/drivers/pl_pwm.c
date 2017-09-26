#include "pl_pwm.h"

void PlPwm_Enable(pl_pwm_t* pwm, uint8_t channel)
{
	pwm->control |= (CONTROL_ENABLE_MASK << (CONTROL_BITS_PER_CHANNEL*channel));
}

void PlPwm_EnableMultiple(pl_pwm_t* pwm, uint8_t channel_mask)
{
	//build bit mask of enables
	uint32_t enable_mask = 0;
	for(int i = PL_PWM_CHANNELS_PER_CONTROLLER-1; i >= 0; i--)
	{
		enable_mask = enable_mask << CONTROL_BITS_PER_CHANNEL;
		if(channel_mask & (1<<i))
		{
			enable_mask |= CONTROL_ENABLE_MASK;
		}
	}
	pwm->control |= enable_mask;
}

void PlPwm_Disable(pl_pwm_t* pwm, uint8_t channel)
{
	pwm->control &= ~(CONTROL_ENABLE_MASK << (CONTROL_BITS_PER_CHANNEL*channel));
}

void PlPwm_DisableMultiple(pl_pwm_t* pwm, uint8_t channel_mask)
{
	//build bit mask of enables
	uint32_t disable_mask = 0;
	for(int i = PL_PWM_CHANNELS_PER_CONTROLLER-1; i >= 0; i--)
	{
		disable_mask = disable_mask << CONTROL_BITS_PER_CHANNEL;
		if(channel_mask & (1<<i))
		{
			disable_mask |= CONTROL_ENABLE_MASK;
		}
	}
	pwm->control &= ~(disable_mask);
}

void PlPwm_SetIdleLevel(pl_pwm_t* pwm, uint8_t channel, bool idle_level)
{
	if(idle_level)
	{
		pwm->control |= (CONTROL_IDLE_LEVEL_MASK << (CONTROL_BITS_PER_CHANNEL*channel));
	}
	else
	{
		pwm->control &= ~(CONTROL_IDLE_LEVEL_MASK << (CONTROL_BITS_PER_CHANNEL*channel));
	}
}

void PlPwm_SetReloadEnabled(pl_pwm_t* pwm, uint8_t channel, bool reload_enabled)
{
	if(reload_enabled)
	{
		pwm->control |= (CONTROL_RELOAD_MASK << (CONTROL_BITS_PER_CHANNEL*channel));
	}
	else
	{
		pwm->control &= ~(CONTROL_RELOAD_MASK << (CONTROL_BITS_PER_CHANNEL*channel));
	}
}

void PlPwm_SetPeriod(pl_pwm_t* pwm, uint8_t channel, uint32_t period)
{
	pwm->periods[channel] = period;
}

void PlPwm_SetDutyCycle(pl_pwm_t* pwm, uint8_t channel, uint32_t duty_cycle)
{
	pwm->duty_cycles[channel] = duty_cycle;
}

void PlPwm_SetPeriodCount(pl_pwm_t* pwm, uint8_t channel, uint32_t period_count)
{
	pwm->period_counts[channel] = period_count;
}

uint32_t PlPwm_GetStatus(pl_pwm_t* pwm, uint8_t channel)
{
	return pwm->status_registers[channel];
}
