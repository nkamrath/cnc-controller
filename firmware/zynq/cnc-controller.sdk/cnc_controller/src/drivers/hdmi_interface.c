#include <stdbool.h>
#include "hdmi_interface.h"

static bool _initialized = false;

HdmiInterface_Create(void)
{
	if(!_initialized)
	{
		_initialized = true;
	}
}

uint32_t HdmiInterface_GetLastDma(void)
{
	return *((uint32_t*)HDMI_INTERFACE_BASE_ADDRESS);
}
