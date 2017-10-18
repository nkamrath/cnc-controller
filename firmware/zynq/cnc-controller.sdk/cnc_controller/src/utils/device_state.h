#ifndef _UTILS_DEVICE_STATE_H
#define _UTILS_DEVICE_STATE_H

#include "lwip/udp.h"

void DeviceState_Create(void);
ip_addr_t* DeviceState_GetHostIp(void);
uint16_t DeviceState_GetHostPort(void);

#endif
