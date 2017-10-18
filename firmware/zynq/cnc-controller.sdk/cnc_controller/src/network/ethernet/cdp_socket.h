#ifndef NETWORK_ETHERNET_CDP_SOCKET_H
#define NETWORK_ETHERNET_CDP_SOCKET_H

#include <stdint.h>
#include "lwip/udp.h"
#include "lwip/inet.h"

typedef void(*cdp_rx_callback_t)(uint8_t* data, uint16_t length, ip_addr_t* remote_addr, uint16_t port);

void CdpSocket_Create(void);
void CdpSocket_SendMulticast(void* data, uint16_t length, ip_addr_t* addr, uint16_t port);
void CdpSocket_SendUnicast(void* data, uint16_t length, ip_addr_t* addr, uint16_t port);
void CdpSocket_RegisterRxCallback(cdp_rx_callback_t callback);

#endif
