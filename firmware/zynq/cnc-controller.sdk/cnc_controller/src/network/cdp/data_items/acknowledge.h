#ifndef NETWORK_CDP_DATA_ITEMS_ACKNOWLEDGE_H
#define NETWORK_CDP_DATA_ITEMS_ACKNOWLEDGE_H

#include <stdint.h>

#define CDP_ACKNOWLEDGE_TYPE		0x0003

typedef struct
{
	uint16_t acknowledge_of_type;
} __attribute__((packed)) cdp_acknowledge_t;

#endif
