#ifndef _NETWORK_CDP_DATA_ITEMS_SET_STAGE_LOCATION_COMMAND_H_
#define _NETWORK_CDP_DATA_ITEMS_SET_STAGE_LOCATION_COMMAND_H_

#include <stdint.h>

#define CDP_SET_STAGE_LOCATION_COMMAND_TYPE		0x0006

typedef struct
{
	double x;
	double y;
	double z;
} __attribute__((packed)) cdp_set_stage_location_command_t;

#endif
