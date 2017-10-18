#ifndef _NETWORK_CDP_DATA_ITEMS_STEP_MOTOR_COMMAND_H_
#define _NETWORK_CDP_DATA_ITEMS_STEP_MOTOR_COMMAND_H_

#include <stdint.h>

#define CDP_STEP_MOTOR_COMMAND_TYPE		0x0004

typedef struct
{
	uint8_t motor_axis;
	uint8_t motor_index;
	uint8_t direction;
	uint32_t number_steps;
} __attribute__((packed)) cdp_step_motor_command_t;

#endif
