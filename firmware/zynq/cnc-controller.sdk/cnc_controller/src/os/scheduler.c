/*
 * scheduler.c
 *
 * Created: 5/4/2017 5:44:31 PM
 *  Author: Nate
 */

#include "scheduler.h"
#include "drivers/interrupt_controller.h"
#include "drivers/ttc.h"
#include "hw_al/timer.h"
#include "critical_section.h"
#include "os_config.h"
#include "os_task_slots.h"

static timer_handle_t* _running_timer = NULL;
static timer_handle_t* _next_task_timer = NULL;

volatile static uint64_t _us_counter = 0;
static task_t _task_slots[OS_NUM_IRQ_SLOTS][OS_NUM_TASK_SLOTS_PER_PRIORITY];
volatile static task_t* _next_task = NULL;
static bool _initialized = false;

volatile static task_t* _active_tasks[OS_NUM_IRQ_SLOTS];
static volatile uint64_t _next_task_us = 0;
static volatile uint64_t _saved_time = 0;

static volatile bool _model_done = false;
static volatile uint64_t _model_schedule_time = 0;
static int32_t _schedule_time_model = 0;

void _update_next_task(void)
{
	//figure out if the next task is coming up too soon to worry about
	CriticalSection_Enter();
	task_t* next_task = NULL;//(task_t*) _next_task;
	uint64_t current_time = Scheduler_GetTicks();
	for(int i = OS_NUM_IRQ_SLOTS-1; i >= 0; i--)
	{
		for(int j = 0; j < OS_NUM_TASK_SLOTS_PER_PRIORITY; j++)
		{
			if(_task_slots[i][j].state != TASK_STATE__EMPTY)
			{
				if(next_task == NULL && _task_slots[i][j].state != TASK_STATE__RUNNING)
				{
					next_task = &_task_slots[i][j];
				}
				else if(next_task && _task_slots[i][j].start_time_us < next_task->start_time_us)
				{
					//TODO: below commented out is not entirely because it will ONLY run tasks that are in the future
					//however, the current implementation is not entirely correct either because it will run any old task since it doesn't look at the time
					//need to figure out how to handle missed task start times

					if(_task_slots[i][j].state != TASK_STATE__RUNNING)
					{
						next_task = &_task_slots[i][j];
					}
				}
			}
		}
	}

	_next_task = next_task;

	int64_t time_diff = 10000; //0xffffffff;
	if(_next_task != NULL)
	{
		if(_next_task->start_time_us < current_time)
		{
			time_diff = 0;
		}
		else
		{
			time_diff = _next_task->start_time_us - current_time;
		}
	}

	_next_task_us = 0;
	Timer_Stop(_next_task_timer);
	if(time_diff <= 1)
	{
		if(_next_task->state != TASK_STATE__RUNNING && (_active_tasks[_next_task->priority] == NULL || _active_tasks[_next_task->priority]->state != TASK_STATE__RUNNING))
		{
			_active_tasks[_next_task->priority] = _next_task;
			InterruptController_ClearInterrupt(_next_task->priority);
			InterruptController_TriggerSoftwareInterrupt(_next_task->priority, 1);
			_next_task->state = TASK_STATE__RUNNING;
			_next_task = NULL;
			//Timer_SetCompareValue(_next_task_timer, 375);
			//Timer_Reset(_next_task_timer);
			//Timer_Start(_next_task_timer);
		}
	}
	else if(time_diff <= Timer_GetTicksPerInterval(_running_timer))
	{
		Timer_SetCompareValue(_next_task_timer, (uint16_t)((time_diff - _schedule_time_model)));
		Timer_Reset(_next_task_timer);
		Timer_Start(_next_task_timer);
	}
	else
	{
		_next_task = NULL;
		_next_task_us = time_diff;
		//Timer_SetCompareValue(_next_task_timer, 46875);
		//Timer_Start(_next_task_timer);
	}
	CriticalSection_Exit();
}

void _running_timer_irq(void* arg)
{
	//pio_set(PIOC, PIO_PC13);
	Timer_ClearInterrupts(_running_timer);
	_us_counter += Timer_GetTicksPerInterval(_running_timer);
	if(_next_task_us > Timer_GetTicksPerInterval(_running_timer))
	{
		_next_task_us -= Timer_GetTicksPerInterval(_running_timer);
	}
	if(_next_task_us <= Timer_GetTicksPerInterval(_running_timer))
	{
		_update_next_task();
	}
	//pio_clear(PIOC, PIO_PC13);
}

void _next_task_timer_irq(void* arg)
{
	//pio_set(PIOC, PIO_PC13);
	Timer_ClearInterrupts(_next_task_timer);
	Timer_Stop(_next_task_timer);
	if(_next_task && _next_task->state != TASK_STATE__RUNNING)
	{
		if(_active_tasks[_next_task->priority] == NULL || _active_tasks[_next_task->priority]->state != TASK_STATE__RUNNING)
		{
			_active_tasks[_next_task->priority] = _next_task;
			InterruptController_ClearInterrupt(_next_task->priority);
			InterruptController_TriggerSoftwareInterrupt(_next_task->priority, 1);
			_next_task->state = TASK_STATE__RUNNING;
		}
	}
	_next_task = NULL;
	_update_next_task();
	//pio_clear(PIOC, PIO_PC13);
}

void _TimeModelTask(void* arg)
{
	uint64_t run_time = Scheduler_GetTicks();

	if(run_time > _model_schedule_time)
	{
		_schedule_time_model = run_time - _model_schedule_time;
	}
	else
	{
		_schedule_time_model = - (_model_schedule_time - run_time);
	}

	_model_done = true;
}

bool Scheduler_Create(void)
{
	if(_initialized)
	{
		return true;
	}

	//clear the task slots
	for(int i = 0; i < OS_NUM_IRQ_SLOTS; i++)
	{
		_active_tasks[i] = NULL;
		for(int j = 0; j < OS_NUM_TASK_SLOTS_PER_PRIORITY; j++)
		{
			_task_slots[i][j].state = TASK_STATE__EMPTY;
		}

		InterruptController_SetHandler(i, os_task_slots[i], NULL);
		InterruptController_ClearInterrupt(i);
		InterruptController_SetSoftwareInterruptPriority(i, i+1); //keep priority 0 open
		InterruptController_EnableInterrupt(i);

	}

	//Create running timer for scheduler time base, 100 hz interrupt rate, 3.750 ticks = 1 us
	timer_options_t running_timer_options;
	running_timer_options.timer_module = TTC0;
	running_timer_options.channel = TTC_CHANNEL_0;
	running_timer_options.rate_hz = 0;
	running_timer_options.pre_div = TTC_PRESCALES_64;
	running_timer_options.compare_value = 50782;
	_running_timer = Timer_Create(&running_timer_options);
	Timer_RegisterCallback(_running_timer, _running_timer_irq, NULL);
	Timer_Start(_running_timer);

	//setup the next task timer but don't start
	timer_options_t next_task_timer_options;
	next_task_timer_options.timer_module = TTC0;
	next_task_timer_options.channel = TTC_CHANNEL_1;
	next_task_timer_options.rate_hz = 0;
	next_task_timer_options.pre_div = TTC_PRESCALES_64;
	_next_task_timer = Timer_Create(&next_task_timer_options);
	Timer_RegisterCallback(_next_task_timer, _next_task_timer_irq, NULL);

	_initialized = true;

	//model a task for timing
	_model_schedule_time = Scheduler_GetTicks() + Scheduler_MicrosToTicks(100000);
	//task_t* model_task;
	Scheduler_Add(_model_schedule_time, 0, 2, _TimeModelTask, NULL);

	//while(_model_done == false);
	return true;
}

task_t* Scheduler_GetActiveTask(uint8_t priority)
{
	if(priority < OS_NUM_IRQ_SLOTS)
	{
		return (task_t*)_active_tasks[priority];
	}
	return NULL;
}

uint64_t Scheduler_MicrosToTicks(uint64_t micros)
{
	return ((micros * Timer_TicksPerSecond(_running_timer)) / 1000000);
}

uint64_t Scheduler_GetTicks(void)
{
	CriticalSection_Enter();
	uint32_t read1 = Timer_Get(_running_timer);
	uint64_t temp_us = _us_counter;
	CriticalSection_Exit();
	uint64_t ret = temp_us + read1;
	return ret;
}

task_t* Scheduler_Add(uint64_t start_time_us, uint32_t period_us, uint8_t priority, void(*function)(void*), void* arg)
{
	task_t* task = NULL;
	if(priority < OS_NUM_IRQ_SLOTS)
	{
		for(int i = 0; i < OS_NUM_TASK_SLOTS_PER_PRIORITY; i++)
		{
			if(_task_slots[priority][i].state == TASK_STATE__EMPTY)
			{
				task = &_task_slots[priority][i];
				break;
			}
		}

		if(task)
		{
			task->start_time_us = start_time_us;
			task->period_us = period_us;
			task->priority = priority;
			task->function = function;
			task->arg = arg;

			task->state = TASK_STATE__IDLE;
			CriticalSection_Exit();
			_update_next_task();
		}
	}
	return task;
}

void Scheduler_Remove(task_t* task)
{
	if(task)
	{
		CriticalSection_Enter();
		if(task->state != TASK_STATE__RUNNING)
		{
			//remove it as it is not in use
			for(int i = 0; i < OS_NUM_TASK_SLOTS_PER_PRIORITY; i++)
			{
				if(&_task_slots[task->priority][i] == task)
				{
					_task_slots[task->priority][i].state = TASK_STATE__EMPTY;
					break;
				}
			}
		}
		else
		{
			task->period_us = 0;  //prevent it from being rescheduled again
		}
		CriticalSection_Exit();
	}
}

void Scheduler_SaveTime(void)
{
	_saved_time = Scheduler_GetTicks();
}

uint64_t Scheduler_GetSavedTime(void)
{
	return _saved_time;
}
