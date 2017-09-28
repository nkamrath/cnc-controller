#ifndef NETWORK_CDP_CDP_DATA_ITEM_H
#define NETWORK_CDP_CDP_DATA_ITEM_H

#include <stdint.h>

typedef struct
{
	uint16_t type;
	uint16_t length;
	uint8_t data[];
} __attribute__((packed)) cdp_data_item_t;

#endif
