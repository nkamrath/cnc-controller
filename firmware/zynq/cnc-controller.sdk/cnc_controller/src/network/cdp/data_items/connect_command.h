#ifndef NETWORK_CDP_DATA_ITEMS_DEVICE_DISCOVERY_H
#define NETWORK_CDP_DATA_ITEMS_DEVICE_DISCOVERY_H

#include <stdint.h>

#define CDP_CONNECT_COMMAND_TYPE		0x0002

typedef struct
{
	uint32_t ip_address;
	uint16_t port;
} __attribute__((packed)) cdp_connect_command_t;

#endif
