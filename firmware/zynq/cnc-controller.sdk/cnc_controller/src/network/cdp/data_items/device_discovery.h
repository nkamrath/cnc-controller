#ifndef NETWORK_CDP_DATA_ITEMS_DEVICE_DISCOVERY_H
#define NETWORK_CDP_DATA_ITEMS_DEVICE_DISCOVERY_H

#include <stdint.h>

#define CDP_DEVICE_DISCOVERY_TYPE		0x0001

typedef struct
{
	uint8_t version_major;
	uint8_t version_minor;
	uint8_t version_patch;
	uint8_t device_status;
} __attribute__((packed)) device_discovery_t;

#endif
