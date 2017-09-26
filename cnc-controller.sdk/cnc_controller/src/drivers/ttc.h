#ifndef _DRIVERS_TTC_H_
#define _DRIVERS_TTC_H_

#include <stdint.h>
#include <stdbool.h>

#define TTC0_BASE_ADDRESS				(0xF8001000)
#define TTC1_BASE_ADDRESS				(0xF8002000)

#define TTC0_ID							(XPAR_XTTCPS_0_DEVICE_ID)
#define TTC1_ID							(XPAR_XTTCPS_1_DEVICE_ID)

#define TTC0_CHANNEL0_INTERRUPT_ID		(XPS_TTC0_0_INT_ID)
#define TTC0_CHANNEL1_INTERRUPT_ID		(XPS_TTC0_1_INT_ID)
#define TTC0_CHANNEL2_INTERRUPT_ID		(XPS_TTC0_2_INT_ID)
#define TTC1_CHANNEL0_INTERRUPT_ID		(XPS_TTC1_0_INT_ID)
#define TTC1_CHANNEL1_INTERRUPT_ID		(XPS_TTC1_1_INT_ID)
#define TTC1_CHANNEL2_INTERRUPT_ID		(XPS_TTC1_2_INT_ID)

#define TTC0 ((ttc_t*)TTC0_BASE_ADDRESS)
#define TTC1 ((ttc_t*)TTC1_BASE_ADDRESS)

#define TTC_CHANNELS_PER_MODULE 3

typedef struct TTC_T
{
	volatile uint32_t clock_controls		[TTC_CHANNELS_PER_MODULE];
	volatile uint32_t counter_controls		[TTC_CHANNELS_PER_MODULE];
	volatile uint32_t counter_values		[TTC_CHANNELS_PER_MODULE];
	volatile uint32_t interval_counters		[TTC_CHANNELS_PER_MODULE];
	volatile uint32_t match1_counters		[TTC_CHANNELS_PER_MODULE];
	volatile uint32_t match2_counters		[TTC_CHANNELS_PER_MODULE];
	volatile uint32_t match3_counters		[TTC_CHANNELS_PER_MODULE];
	volatile uint32_t interrupt_registers	[TTC_CHANNELS_PER_MODULE];
	volatile uint32_t interrupt_enables		[TTC_CHANNELS_PER_MODULE];
	volatile uint32_t event_control_timers	[TTC_CHANNELS_PER_MODULE];
	volatile uint32_t event_registers		[TTC_CHANNELS_PER_MODULE];
} ttc_t;

typedef enum TTC_RES_T
{
	TTC_RES_SUCCESS,
	TTC_RES_INVALID_CHANNEL,
	TTC_RES_INVALID_TIMER,
	TTC_RES_ERROR
} ttc_res_t;

typedef enum TTC_PRESCALES_T
{
	TTC_PRESCALES_2 = 0,
	TTC_PRESCALES_4,
	TTC_PRESCALES_8,
	TTC_PRESCALES_16,
	TTC_PRESCALES_32,
	TTC_PRESCALES_64,
	TTC_PRESCALES_128,
	TTC_PRESCALES_256,
	TTC_PRESCALES_512,
	TTC_PRESCALES_1024,
	TTC_PRESCALES_2048,
	TTC_PRESCALES_4096,
	TTC_PRESCALES_8192,
	TTC_PRESCALES_16384,
	TTC_PRESCALES_32768,
	TTC_PRESCALES_65536,
	TTC_PRESCALES_1,
	TTC_PRESCALES_NONE
} ttc_prescale_t;

typedef enum TTC_CHANNEL_T
{
	TTC_CHANNEL_0,
	TTC_CHANNEL_1,
	TTC_CHANNEL_2
} ttc_channel_t;

typedef enum TTC_COUNTER_DIRECTION_T
{
	TTC_COUNTER_DIRECTION_DOWN,
	TTC_COUNTER_DIRECTION_UP
} ttc_counter_direction_t;

typedef enum TTC_INTERRUPT_MODE_T
{
	TTC_COUNTER_INTERRUPT_MODE_OVERFLOW,
	TTC_COUNTER_INTERRUPT_MODE_INTERVAL
} ttc_interrupt_mode_t;

#define TTC_CLOCK_CONTROL_EXT_EDGE_SHIFT					(6)
#define TTC_CLOCK_CONTROL_EXT_EDGE_MASK						(1<<TTC_CLOCK_CONTROL_EXT_EDGE_SHIFT)
#define TTC_CLOCK_CONTROL_SRC_SHIFT							(5)
#define TTC_CLOCK_CONTROL_SRC_MASK							(1<<TTC_CLOCK_CONTROL_SRC_SHIFT)
#define TTC_CLOCK_CONTROL_PS_VAL_SHIFT						(1)
#define TTC_CLOCK_CONTROL_PS_VAL_MASK						(0b11111<<TTC_CLOCK_CONTROL_PS_VAL_SHIFT)
#define TTC_CLOCK_CONTROL_PS_EN_SHIFT						(0)
#define TTC_CLOCK_CONTROL_PS_EN_MASK						(1<<TTC_CLOCK_CONTROL_PS_EN_SHIFT)
#define TTC_CLOCK_CONTROL_PS_EN_DISABLED					(0<<TTC_CLOCK_CONTROL_PS_EN_SHIFT)
#define TTC_CLOCK_CONTROL_PS_EN_ENABLED						(1<<TTC_CLOCK_CONTROL_PS_EN_SHIFT)

#define TTC_COUNTER_CONTROL_RST_SHIFT						(4)
#define TTC_COUNTER_CONTROL_RST_MASK						(1<<TTC_COUNTER_CONTROL_RST_SHIFT)
#define TTC_COUNTER_CONTROL_MATCH_SHIFT						(3)
#define TTC_COUNTER_CONTROL_MATCH_MASK						(1<<TTC_COUNTER_CONTROL_MATCH_SHIFT)
#define TTC_COUNTER_CONTROL_DECR_SHIFT						(2)
#define TTC_COUNTER_CONTROL_DECR_MASK						(1<<TTC_COUNTER_CONTROL_DECR_SHIFT)
#define TTC_COUNTER_CONTROL_INT_SHIFT						(1)
#define TTC_COUNTER_CONTROL_INT_MASK						(1<<TTC_COUNTER_CONTROL_INT_SHIFT)
#define TTC_COUNTER_CONTROL_DIS_SHIFT						(0)
#define TTC_COUNTER_CONTROL_DIS_MASK						(1<<TTC_COUNTER_CONTROL_DIS_SHIFT)

#define TTC_COUNTER_VALUE_SHIFT								(0)
#define TTC_COUNTER_VALUE_MASK								(0xffff)

#define TTC_INTERRUPT_REGISTER_MASK_ALL_IRQS				(0b111111)

/********************
 * PUBLIC FUNCTIONS
 ********************/

ttc_res_t Ttc_SetPrescale(ttc_t* timer, ttc_channel_t channel, ttc_prescale_t prescale);

void Ttc_Reset(ttc_t* timer, ttc_channel_t channel);

void Ttc_SetCounterDirection(ttc_t* timer, ttc_channel_t channel, ttc_counter_direction_t direction);

void Ttc_SetInterruptMode(ttc_t* timer, ttc_channel_t channel, ttc_interrupt_mode_t interrupt_mode);

void Ttc_Start(ttc_t* timer, ttc_channel_t channel);

void Ttc_Stop(ttc_t* timer, ttc_channel_t channel);

uint16_t Ttc_Read(ttc_t* timer, ttc_channel_t channel);

void Ttc_SetIntervalValue(ttc_t* timer, ttc_channel_t channel, uint16_t value);

void Ttc_SetMatchValue1(ttc_t* timer, ttc_channel_t channel, uint16_t value);

void Ttc_SetMatchValue2(ttc_t* timer, ttc_channel_t channel, uint16_t value);

void Ttc_SetMatchValue3(ttc_t* timer, ttc_channel_t channel, uint16_t value);

uint32_t Ttc_GetInterruptStatus(ttc_t* timer, ttc_channel_t channel);

void Ttc_ClearInterrupts(ttc_t* timer, ttc_channel_t channel, uint32_t mask);

uint32_t Ttc_GetClockRate(ttc_t* timer, ttc_channel_t channel);

#endif
