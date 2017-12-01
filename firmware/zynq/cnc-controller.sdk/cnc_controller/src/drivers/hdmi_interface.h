#ifndef _DRIVERS_HDMI_INTERFACE_H_
#define _DRIVERS_HDMI_INTERFACE_H_

#include <stdint.h>

#define HDMI_INTERFACE_BASE_ADDRESS	0x43C30000

void HdmiInterface_Create(void);
uint32_t HdmiInterface_GetLastDma(void);

#endif
