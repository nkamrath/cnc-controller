#ifndef _DRIVERS_PL_GPIO_H_
#define _DRIVERS_PL_GPIO_H_

#include <stdint.h>
#include <stdbool.h>

#define PL_GPIO0		((pl_gpio_t*) 0x43C10000)

typedef struct
{
	volatile uint32_t control;
	volatile uint32_t direction;
	volatile uint32_t output_values;
	volatile uint32_t input_values;
	volatile uint32_t interrupt_enable;
	volatile uint32_t interrupt_status;
	volatile uint32_t interrupt_falling;
	volatile uint32_t interrupt_rising;
} pl_gpio_t;

typedef enum
{
	PL_GPIO_LEVEL_RISING_EDGE,
	PL_GPIO_LEVEL_FALLING_EDGE,
	PL_GPIO_LEVEL_CHANGE
} pl_gpio_level_t;

void PlGpio_Create(void);
void PlGpio_EnablePin(pl_gpio_t* bank, uint8_t pin);
void PlGpio_ConfigureOutput(pl_gpio_t* bank, uint8_t pin);
void PlGpio_ConfigureInput(pl_gpio_t* bank, uint8_t pin);
void PlGpio_Set(pl_gpio_t* bank, uint8_t pin);
void PlGpio_Clear(pl_gpio_t* bank, uint8_t pin);
void PlGpio_Write(pl_gpio_t* bank, uint8_t pin, uint8_t value);
bool PlGpio_Read(pl_gpio_t* bank, uint8_t pin);

void PlGpio_EnableInterrupt(pl_gpio_t* bank, uint8_t pin, pl_gpio_level_t trigger);
uint32_t PlGpio_GetInterruptStatus(pl_gpio_t* bank);
void PlGpio_ClearInterrupt(pl_gpio_t* bank, uint32_t mask);

#endif
