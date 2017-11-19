#include <stdbool.h>
#include "pl_interrupt_manager.h"
#include "interrupt_controller.h"

#define IRQF2P_BASE_IRQ_ID		61
#define _NUM_INTERRUPT_HANDLERS 32

static bool _initialized = false;

static void (*_interrupt_handlers[_NUM_INTERRUPT_HANDLERS])(void* arg);
static void* _interrupt_handler_args[_NUM_INTERRUPT_HANDLERS];

static void _InterruptHandler(void* arg)
{
	uint32_t status = PL_INTERRUPT_MANAGER0->interrupt_status;
	uint8_t count = 0;
	while(status > 0)
	{
		if(status & 0x1 && (_interrupt_handlers[count] != NULL))
		{
			_interrupt_handlers[count](_interrupt_handler_args[count]);
		}
		count++;
		status >>= 1;
	}
	PL_INTERRUPT_MANAGER0->interrupt_status |= status;
}

void PlInterruptManager_Create(void)
{
	if(!_initialized)
	{
		InterruptController_Init();

		for(int i = 0; i < _NUM_INTERRUPT_HANDLERS; i++)
		{
			_interrupt_handlers[i] = NULL;
			_interrupt_handler_args[i] = NULL;
		}

		//register our interrupt controller
		InterruptController_SetHandler(IRQF2P_BASE_IRQ_ID, _InterruptHandler, NULL);
		InterruptController_EnableInterrupts();
		InterruptController_EnableInterrupt(IRQF2P_BASE_IRQ_ID);

		_initialized = true;
	}
}

void PlInterruptManager_SetInterruptHandler(uint8_t pl_interrupt_id, void (*handler)(void*), void* handler_arg)
{
	_interrupt_handlers[pl_interrupt_id] = handler;
	_interrupt_handler_args[pl_interrupt_id] = handler_arg;
}

void PlInterruptManager_Clear(uint32_t mask)
{
	PL_INTERRUPT_MANAGER0->interrupt_status |= mask;
}
