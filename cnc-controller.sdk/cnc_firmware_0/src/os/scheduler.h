

#ifndef SCHEDULER_H_
#define SCHEDULER_H_

#include <stdbool.h>
#include <stdint.h>

typedef struct SCHEDULER_OPTIONS_T
{
	uint32_t tick_frequency;
} scheduler_options_t;

typedef enum
{
	TASK_STATE__INVALID,
	TASK_STATE__EMPTY,
	TASK_STATE__SCHEDULED,
	TASK_STATE__IDLE,
	TASK_STATE__RUNNING,
	TASK_STATE__REMOVED
} task_state_t;

typedef struct TASK_T
{
	uint32_t period_us;
	uint64_t start_time_us;
	void (*function)(void*);
	void* arg;
	uint8_t priority;
	task_state_t state;
} task_t;

bool Scheduler_Create(void);
task_t* Scheduler_GetActiveTask(uint8_t priority);

uint64_t Scheduler_MicrosToTicks(uint64_t micros);
uint64_t Scheduler_GetTicks(void);

task_t* Scheduler_Add(uint64_t start_time, uint32_t period_us, uint8_t priority, void(*function)(void*), void* arg);
void Scheduler_Remove(task_t* task);

void Scheduler_SaveTime(void);
uint64_t Scheduler_GetSavedTime(void);


#endif

