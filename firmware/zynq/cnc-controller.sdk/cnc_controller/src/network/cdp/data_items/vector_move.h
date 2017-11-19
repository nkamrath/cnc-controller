#ifndef _NETWORK_CDP_DATA_ITEMS_VECTOR_MOVE_COMMAND_H_
#define _NETWORK_CDP_DATA_ITEMS_VECTOR_MOVE_COMMAND_H_

#include <stdint.h>

#define CDP_VECTOR_MOVE_COMMAND_TYPE		0x0008

typedef struct
{
	uint32_t microseconds_per_step_x;
	int32_t number_of_steps_x;
	uint32_t microseconds_per_step_y;
	int32_t number_of_steps_y;
	uint32_t microseconds_per_step_z;
	int32_t number_of_steps_z;
} __attribute__((packed)) cdp_vector_move_command_t;

#endif
