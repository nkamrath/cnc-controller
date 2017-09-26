#include "../drivers/ttc.h"
#include "xparameters.h"

ttc_res_t Ttc_SetPrescale(ttc_t* timer, ttc_channel_t channel, ttc_prescale_t prescale)
{
	if(timer == TTC0 || timer == TTC1)
	{
		if(channel < 3)
		{
			//clear the prescale and prescale enable
			timer->clock_controls[channel] &= ~(TTC_CLOCK_CONTROL_PS_VAL_MASK | TTC_CLOCK_CONTROL_PS_EN_MASK);
			if(prescale != TTC_PRESCALES_NONE)
			{
				//set the prescale value and prescale enable
				timer->clock_controls[channel] |= (((prescale << TTC_CLOCK_CONTROL_PS_VAL_SHIFT) & TTC_CLOCK_CONTROL_PS_VAL_MASK) |
						TTC_CLOCK_CONTROL_PS_EN_ENABLED);
				return TTC_RES_SUCCESS;
			}
		}
		else
		{
			return TTC_RES_INVALID_CHANNEL;
		}
	}
	return TTC_RES_INVALID_TIMER;
}

void Ttc_Reset(ttc_t* timer, uint8_t channel)
{
	timer->interrupt_registers[channel] = TTC_INTERRUPT_REGISTER_MASK_ALL_IRQS; //clear all irqs
	timer->counter_controls[channel] |= TTC_COUNTER_CONTROL_RST_MASK;
}

void Ttc_SetCounterDirection(ttc_t* timer, ttc_channel_t channel, ttc_counter_direction_t direction)
{
	timer->counter_controls[channel] &= ~(TTC_COUNTER_CONTROL_DECR_MASK);
	timer->counter_controls[channel] |= TTC_COUNTER_CONTROL_DECR_MASK;
}

//todo: this function should be split into several, enable interval mode, disable interval mode, enable match, disable match etc
void Ttc_SetInterruptMode(ttc_t* timer, ttc_channel_t channel, ttc_interrupt_mode_t interrupt_mode)
{
	timer->counter_controls[channel] &= ~(TTC_COUNTER_CONTROL_INT_MASK);
	timer->counter_controls[channel] |= TTC_COUNTER_CONTROL_INT_MASK;
	timer->interrupt_enables[channel] = 0x01;
}

void Ttc_Start(ttc_t* timer, ttc_channel_t channel)
{
	timer->counter_controls[channel]  &= ~(TTC_COUNTER_CONTROL_DIS_MASK | (1<<5));
}

void Ttc_Stop(ttc_t* timer, ttc_channel_t channel)
{
	timer->counter_controls[channel] |= (TTC_COUNTER_CONTROL_DIS_MASK);
}

uint16_t Ttc_Read(ttc_t* timer, ttc_channel_t channel)
{
	return timer->counter_values[channel] & TTC_COUNTER_VALUE_MASK;
}

void Ttc_SetIntervalValue(ttc_t* timer, ttc_channel_t channel, uint16_t value)
{
	timer->interval_counters[channel] = value;
}

void Ttc_SetMatchValue1(ttc_t* timer, ttc_channel_t channel, uint16_t value)
{
	timer->match1_counters[channel] = value;
}

void Ttc_SetMatchValue2(ttc_t* timer, ttc_channel_t channel, uint16_t value)
{
	timer->match2_counters[channel] = value;
}

void Ttc_SetMatchValue3(ttc_t* timer, ttc_channel_t channel, uint16_t value)
{
	timer->match3_counters[channel] = value;
}

uint32_t Ttc_GetInterruptStatus(ttc_t* timer, ttc_channel_t channel)
{
	return (timer->interrupt_registers[channel] & TTC_INTERRUPT_REGISTER_MASK_ALL_IRQS);
}

void Ttc_ClearInterrupts(ttc_t* timer, ttc_channel_t channel, uint32_t mask)
{
	//timer->interrupt_registers[channel] = (mask & TTC_INTERRUPT_REGISTER_MASK_ALL_IRQS);
}

uint32_t Ttc_GetClockRate(ttc_t* timer, ttc_channel_t channel)
{
	if(timer == TTC0)
	{
		return XPAR_XTTCPS_0_TTC_CLK_FREQ_HZ;
	}
	else
	{
		return XPAR_XTTCPS_1_TTC_CLK_FREQ_HZ;
	}
}
