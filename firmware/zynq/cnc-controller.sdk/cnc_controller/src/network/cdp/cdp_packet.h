#ifndef NETWORK_CDP_CDP_HEADER_H
#define NETWORK_CDP_CDP_HEADER_H

#include "cdp_data_item.h"

typedef struct
{
	uint32_t mark;
	cdp_data_item_t data_items[];
} __attribute__((packed)) cdp_header_t;

#endif
