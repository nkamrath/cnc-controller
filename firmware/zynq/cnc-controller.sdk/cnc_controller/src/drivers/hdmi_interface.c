#include <stdbool.h>
#include "hdmi_interface.h"

static bool _initialized = false;

void HdmiInterface_Create(hdmi_t* hdmi)
{
	if(!_initialized)
	{
		_initialized = true;
	}
}

void HdmiInterface_Disable(hdmi_t* hdmi)
{
	hdmi->control |= (0x01);
}

void HdmiInterface_Enable(hdmi_t* hdmi)
{
	hdmi->control &= ~(0x01);
}

uint32_t HdmiInterface_GetLastDma(void)
{
	return *((uint32_t*)HDMI_INTERFACE_BASE_ADDRESS);
}

void HdmiInterface_DisableFrameSync(hdmi_t* hdmi)
{
	hdmi->control &= ~(0x01<<1);
}

void HdmiInterface_EnableFrameSync(hdmi_t* hdmi)
{
	hdmi->control |= (0x01<<1);
}

void HdmiInterface_SetFrameSyncAdvance(hdmi_t* hdmi, uint16_t advance)
{
	uint32_t val = hdmi->control;
	val &= ~(0xffff<<16);
	val |= (advance<<16);
	hdmi->control = val;
}
