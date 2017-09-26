#include "timer.h"
#include "../drivers/ttc.h"
#include "../drivers/interrupt_controller.h"
#include "xttcps.h"

/********************
 * PRIVATE DEFINES
 ********************/

#define _HANDLE ((_timer_t*)handle)

/********************
 * PRIVATE TYPES
 ********************/

typedef struct _TIMER_T
{
	ttc_t* timer_module;
	uint8_t channel;
	uint32_t pre_div;
	uint16_t interval_ticks;
	void (*irq_handler)(void* arg);
	void* irq_handler_arg;
} _timer_t;

typedef struct _IRQ_SLOT_T
{
	void(*irq_handler)(void* arg);
	void* irq_handler_arg;
} _irq_slot_t;


/********************
 * PUBLIC VARIABLES
 ********************/

timer_handle_t* Timer_Create(timer_options_t* options)
{
	_timer_t* timer_handle = (_timer_t*) malloc(sizeof(_timer_t));
	if(timer_handle)
	{
		timer_handle->timer_module = (ttc_t*)options->timer_module;
		timer_handle->channel = options->channel;
		timer_handle->pre_div = 64;//options->pre_div;
		timer_handle->interval_ticks = options->compare_value;
		Ttc_SetPrescale(timer_handle->timer_module, timer_handle->channel, options->pre_div);
		Timer_SetCompareValue((timer_handle_t*)timer_handle, options->compare_value);
		Ttc_Reset(timer_handle->timer_module, timer_handle->channel);
	}

	return (timer_handle_t*)timer_handle;
}

void Timer_Start(timer_handle_t* handle)
{
	Ttc_Start(_HANDLE->timer_module, _HANDLE->channel);
}

void Timer_Stop(timer_handle_t* handle)
{
	Ttc_Stop(_HANDLE->timer_module, _HANDLE->channel);
}

void Timer_Reset(timer_handle_t* handle)
{
	Ttc_Reset(_HANDLE->timer_module, _HANDLE->channel);
}

uint32_t Timer_Get(timer_handle_t* handle)
{
	return Ttc_Read(_HANDLE->timer_module, _HANDLE->channel);
}

void Timer_RegisterCallback(timer_handle_t* handle, void(*function)(void*), void* arg)
{
	uint32_t interrupt_id = 0;
	if(_HANDLE->timer_module == TTC0)
	{
		switch(_HANDLE->channel)
		{
			case TTC_CHANNEL_0:
				interrupt_id = TTC0_CHANNEL0_INTERRUPT_ID;
			break;
			case TTC_CHANNEL_1:
				interrupt_id = TTC0_CHANNEL1_INTERRUPT_ID;
			break;
			case TTC_CHANNEL_2:
				interrupt_id = TTC0_CHANNEL2_INTERRUPT_ID;
			break;
		}
	}
	else
	{
		switch(_HANDLE->channel)
		{
			case TTC_CHANNEL_0:
				interrupt_id = TTC1_CHANNEL0_INTERRUPT_ID;
			break;
			case TTC_CHANNEL_1:
				interrupt_id = TTC1_CHANNEL1_INTERRUPT_ID;
			break;
			case TTC_CHANNEL_2:
				interrupt_id = TTC1_CHANNEL2_INTERRUPT_ID;
			break;
		}
	}
	InterruptController_DisableInterrupt(interrupt_id);
	InterruptController_ClearInterrupt(interrupt_id);
	InterruptController_SetHandler(interrupt_id, function, arg);
	InterruptController_SetPeripheralInterruptPriority(interrupt_id, 0);
	InterruptController_EnableInterrupt(interrupt_id);
}

void Timer_SetCompareValue(timer_handle_t* handle, uint32_t value)
{
	Ttc_SetInterruptMode(_HANDLE->timer_module, _HANDLE->channel, TTC_COUNTER_INTERRUPT_MODE_INTERVAL);
	Ttc_SetIntervalValue(_HANDLE->timer_module, _HANDLE->channel, value);
}

uint32_t Timer_TicksPerSecond(timer_handle_t* handle)
{
	uint32_t clock_rate = Ttc_GetClockRate(_HANDLE->timer_module, _HANDLE->channel);
	uint32_t tick_rate = clock_rate / _HANDLE->pre_div;
	return tick_rate;
}

void Timer_ClearInterrupts(timer_handle_t* handle)
{
	uint32_t interrupt_status = Ttc_GetInterruptStatus(_HANDLE->timer_module, _HANDLE->channel);
	Ttc_ClearInterrupts(_HANDLE->timer_module, _HANDLE->channel, interrupt_status);
}

uint16_t Timer_GetTicksPerInterval(timer_handle_t* handle)
{
	return _HANDLE->interval_ticks;
}
