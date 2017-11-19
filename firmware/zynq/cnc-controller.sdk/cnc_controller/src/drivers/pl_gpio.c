#include <stdlib.h>
#include "pl_gpio.h"
#include "include/pl_interrupt_manager_ids.h"
#include "pl_interrupt_manager.h"

#define _NUM_INTERRUPT_HANDLERS 32

static bool _initialized = false;
static void (*_interrupt_handlers[_NUM_INTERRUPT_HANDLERS])(void* arg);
static void* _interrupt_handler_args[_NUM_INTERRUPT_HANDLERS];

static void _InterruptHandler(void* bank_pointer)
{
	pl_gpio_t* bank = (pl_gpio_t*)bank_pointer;
	uint32_t status = PlGpio_GetInterruptStatus(bank);
	PlGpio_ClearInterrupt(bank, status);
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
}

void PlGpio_Create(void)
{
	if(!_initialized)
	{
		for(int i = 0; i < _NUM_INTERRUPT_HANDLERS; i++)
		{
			_interrupt_handlers[i] = NULL;
			_interrupt_handler_args[i] = NULL;
		}


		PlInterruptManager_Create();
		//register handler with pl interrupt manager
		PlInterruptManager_SetInterruptHandler(PL_GPIO_INTERRUPT_ID, _InterruptHandler, PL_GPIO0);
		_initialized = true;
	}
}

void PlGpio_EnablePin(pl_gpio_t* bank, uint8_t pin)
{
	bank->control |= (1<<pin);
}

void PlGpio_ConfigureOutput(pl_gpio_t* bank, uint8_t pin)
{
	bank->direction |= (1<<pin);
}

void PlGpio_ConfigureInput(pl_gpio_t* bank, uint8_t pin)
{
	bank->direction &= ~(1<<pin);
}

void PlGpio_Set(pl_gpio_t* bank, uint8_t pin)
{
	bank->output_values |= (1<<pin);
}

void PlGpio_Clear(pl_gpio_t* bank, uint8_t pin)
{
	bank->output_values &= (~(1<<pin));
}

void PlGpio_Write(pl_gpio_t* bank, uint8_t pin, uint8_t value)
{
	if(value)
	{
		PlGpio_Set(bank, pin);
	}
	else
	{
		PlGpio_Clear(bank, pin);
	}
}

bool PlGpio_Read(pl_gpio_t* bank, uint8_t pin)
{
	return ((bank->input_values >> pin) & 0x01);
}

void PlGpio_EnableInterrupt(pl_gpio_t* bank, uint8_t pin, pl_gpio_level_t trigger)
{
	uint32_t mask = (1<<pin);
	if(trigger == PL_GPIO_LEVEL_RISING_EDGE || trigger == PL_GPIO_LEVEL_CHANGE)
	{
		bank->interrupt_rising |= mask;
	}

	if(trigger == PL_GPIO_LEVEL_FALLING_EDGE || trigger == PL_GPIO_LEVEL_CHANGE)
	{
		bank->interrupt_falling |= mask;
	}
	bank->interrupt_enable |= mask;
}

uint32_t PlGpio_GetInterruptStatus(pl_gpio_t* bank)
{
	return bank->interrupt_status;
}

void PlGpio_ClearInterrupt(pl_gpio_t* bank, uint32_t mask)
{
	bank->interrupt_status = mask;
}
