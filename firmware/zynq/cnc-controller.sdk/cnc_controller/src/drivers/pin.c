#include "pin.h"
#include "xgpiops.h"
#include <stdbool.h>

#define GPIO_DEVICE_ID  	XPAR_XGPIOPS_0_DEVICE_ID

static XGpioPs _gpio;

static bool _gpio_initialized = false;

void Pin_ConfigureOutput(uint8_t pin)
{
	//init the gpio module if this is first pin to configure
	if(!_gpio_initialized)
	{
		XGpioPs_Config *ConfigPtr;
		ConfigPtr = XGpioPs_LookupConfig(GPIO_DEVICE_ID);
		XGpioPs_CfgInitialize(&_gpio, ConfigPtr, ConfigPtr->BaseAddr);

		_gpio_initialized = true;
	}

	XGpioPs_SetDirectionPin(&_gpio, pin, 1);
	XGpioPs_SetOutputEnablePin(&_gpio, pin, 1);
}

void Pin_Set(uint8_t pin)
{
	XGpioPs_WritePin(&_gpio, pin, 0x1);
}

void Pin_Clear(uint8_t pin)
{
	XGpioPs_WritePin(&_gpio, pin, 0x0);
}

void Pin_Write(uint8_t pin, uint8_t value)
{
	XGpioPs_WritePin(&_gpio, pin, value);
}
