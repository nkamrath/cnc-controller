#ifndef _DRIVERS_PL_INTERRUPT_MANAGER_H_
#define _DRIVERS_PL_INTERRUPT_MANAGER_H_

#include <stdint.h>

#define PL_INTERRUPT_MANAGER0		((pl_interrupt_manager_t*)0x43C20000)

typedef struct
{
	volatile uint32_t interrupt_status;
} pl_interrupt_manager_t;

void PlInterruptManager_Create(void);
void PlInterruptManager_SetInterruptHandler(uint8_t pl_interrupt_id, void (*handler)(void*), void* handler_arg);
void PlInterruptManager_Clear(uint32_t mask);

#endif
