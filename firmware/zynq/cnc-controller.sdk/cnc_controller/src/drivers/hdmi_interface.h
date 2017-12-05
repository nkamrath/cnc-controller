#ifndef _DRIVERS_HDMI_INTERFACE_H_
#define _DRIVERS_HDMI_INTERFACE_H_

#include <stdint.h>

#define HDMI_INTERFACE_BASE_ADDRESS	(0x43C30000)
#define HDMI0 ((hdmi_t*)HDMI_INTERFACE_BASE_ADDRESS)

typedef struct
{
	volatile uint32_t control;
} hdmi_t;

void HdmiInterface_Create(hdmi_t* hdmi);

void HdmiInterface_Disable(hdmi_t* hdmi);
void HdmiInterface_Enable(hdmi_t* hdmi);

void HdmiInterface_DisableFrameSync(hdmi_t* hdmi);
void HdmiInterface_EnableFrameSync(hdmi_t* hdmi);

void HdmiInterface_SetFrameSyncAdvance(hdmi_t* hdmi, uint16_t advance);

uint32_t HdmiInterface_GetLastDma(void);

#endif
