#ifndef OS_TASK_SLOTS_H_
#define OS_TASK_SLOTS_H_

//clearing interrupts before done with irq seems to allow other lower priority interrupts to steal cpu
//InterruptController_ClearSoftwareInterrupt(x);

extern void _update_next_task(void);

#define _IRQ_SLOT_FUNCTION_MACRO(x)						\
CriticalSection_Enter();								\
task_t* task = Scheduler_GetActiveTask(x);				\
CriticalSection_Exit();									\
if(task)												\
{														\
	InterruptController_EnableNestedInterrupts();		\
	CriticalSection_Enter();								\
	task->state = TASK_STATE__RUNNING;						\
	CriticalSection_Exit();									\
	task->function(task->arg);								\
	CriticalSection_Enter();								\
	task->state = TASK_STATE__IDLE;							\
	CriticalSection_Exit();									\
	if(task->period_us)										\
	{														\
		task->start_time_us += task->period_us;				\
		_update_next_task();								\
	}														\
	else													\
	{														\
		Scheduler_Remove(task);								\
	}														\
	InterruptController_DisableNestedInterrupts();			\
	InterruptController_ClearInterrupt(x);					\
}

void OsTaskSlot0(void* arg)
{
	_IRQ_SLOT_FUNCTION_MACRO(0);
}

void OsTaskSlot1(void* arg)
{
	_IRQ_SLOT_FUNCTION_MACRO(1);
}

void OsTaskSlot2(void* arg)
{
	_IRQ_SLOT_FUNCTION_MACRO(2);
//	CriticalSection_Enter();
//	task_t* task = Scheduler_GetActiveTask(2);
//	CriticalSection_Exit();
//	if(task)
//	{
//		InterruptController_ClearSoftwareInterrupt(2);
//		InterruptController_EnableNestedInterrupts();
//		CriticalSection_Enter();
//		task->state = TASK_STATE__RUNNING;
//		CriticalSection_Exit();
//		task->function(task->arg);
//		CriticalSection_Enter();
//		task->state = TASK_STATE__IDLE;
//		CriticalSection_Exit();
//		if(task->period_us)
//		{
//			task->start_time_us += task->period_us;
//		}
//		else
//		{
//			Scheduler_Remove(task);
//		}
//		InterruptController_DisableNestedInterrupts();
//	}
}

void OsTaskSlot3(void* arg)
{
	_IRQ_SLOT_FUNCTION_MACRO(3);
//	CriticalSection_Enter();
//	task_t* task = Scheduler_GetActiveTask(3);
//	CriticalSection_Exit();
//	if(task)
//	{
//		InterruptController_EnableNestedInterrupts();
//		CriticalSection_Enter();
//		task->state = TASK_STATE__RUNNING;
//		CriticalSection_Exit();
//		task->function(task->arg);
//		CriticalSection_Enter();
//		task->state = TASK_STATE__IDLE;
//		CriticalSection_Exit();
//		if(task->period_us)
//		{
//			task->start_time_us += task->period_us;
//			_update_next_task();
//		}
//		else
//		{
//			Scheduler_Remove(task);
//		}
//		InterruptController_DisableNestedInterrupts();
//		InterruptController_ClearInterrupt(3);
//	}
}

void OsTaskSlot4(void* arg)
{
	_IRQ_SLOT_FUNCTION_MACRO(4);
}

void OsTaskSlot5(void* arg)
{
	_IRQ_SLOT_FUNCTION_MACRO(5);
}

void OsTaskSlot6(void* arg)
{
	_IRQ_SLOT_FUNCTION_MACRO(6);
}

void OsTaskSlot7(void* arg)
{
	_IRQ_SLOT_FUNCTION_MACRO(7);
}

void (*os_task_slots[OS_NUM_IRQ_SLOTS])(void*) = {
		OsTaskSlot0,
		OsTaskSlot1,
		OsTaskSlot2,
		OsTaskSlot3,
		OsTaskSlot4,
		OsTaskSlot5,
		OsTaskSlot6,
		OsTaskSlot7
};

#endif
