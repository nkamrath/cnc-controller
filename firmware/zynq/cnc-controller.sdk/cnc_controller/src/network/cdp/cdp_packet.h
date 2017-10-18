#ifndef NETWORK_CDP_CDP_HEADER_H
#define NETWORK_CDP_CDP_HEADER_H

#include "cdp_data_item.h"

#define CDP_PACKET_HEADER_MARK				0xCD01

typedef struct
{
	uint32_t mark;
} __attribute__((packed)) cdp_header_t;

typedef struct
{
	cdp_header_t header;
	cdp_data_item_t data_items[];
} __attribute__((packed)) cdp_packet_t;

#endif
