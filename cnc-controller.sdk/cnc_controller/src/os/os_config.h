/*
 * os_config.h
 *
 * Created: 6/8/2017 5:52:51 PM
 *  Author: Nate
 */


#ifndef OS_CONFIG_H_
#define OS_CONFIG_H_

#define OS_TASK_LOWEST_PRIORITY			8														//lowest task priority.  NVIC usually uses 0 as highest, so this is the number of NVIC priorities
#define OS_TASK_HIGHEST_PRIORITY		0														//this is the hightes os task priority.  This should probably never be 0
#define OS_NUM_IRQ_SLOTS				(OS_TASK_LOWEST_PRIORITY - OS_TASK_HIGHEST_PRIORITY)	//number of irq slots needed for scheduler and tasks
//this is because the highest should be reserved for hw irqs to service periphs.  The next highest
//should be the task for the os scheduler itself so it can interrupt tasks to do scheduling
#define OS_SCHEDULER_TASK_PRIORITY		1													//priority of the scheduler's task.  Usually one less than hw peripheral irqs.  NVIC highest
//priority is usually 0 so that usually makes the os scheduler task priority 1
#define OS_NUM_TASK_SLOTS_PER_PRIORITY	(8)


#endif /* OS_CONFIG_H_ */
