#include "critical_section.h"
#include "../drivers/interrupt_controller.h"
#include <stdint.h>

static uint32_t _count = 0;

void CriticalSection_Enter(void)
{
	if(_count == 0)
	{
		InterruptController_DisableInterrupts();
	}
	_count++;
}

void CriticalSection_Exit(void)
{
	_count--;
	if(_count == 0)
	{
		InterruptController_EnableInterrupts();
	}
}
