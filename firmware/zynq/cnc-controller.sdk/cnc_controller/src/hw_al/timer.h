#ifndef _DRIVERS_TIMER_H
#define _DRIVERS_TIMER_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

typedef void* timer_handle_t;

typedef struct TIMER_OPTIONS_T
{
	uint32_t rate_hz;
	uint32_t pre_div;
	uint32_t compare_value;
	void* timer_module;
	uint8_t channel;
} timer_options_t;

timer_handle_t* Timer_Create(timer_options_t* options);
void Timer_Start(timer_handle_t* handle);
void Timer_Stop(timer_handle_t* handle);
void Timer_Reset(timer_handle_t* handle);
uint32_t Timer_Get(timer_handle_t* handle);
void Timer_RegisterCallback(timer_handle_t* handle, void(*function)(void*), void* arg);
void Timer_SetCompareValue(timer_handle_t* handle, uint32_t value);
uint32_t Timer_TicksPerSecond(timer_handle_t* handle);
void Timer_ClearInterrupts(timer_handle_t* handle);
uint16_t Timer_GetTicksPerInterval(timer_handle_t* handle);

#endif
