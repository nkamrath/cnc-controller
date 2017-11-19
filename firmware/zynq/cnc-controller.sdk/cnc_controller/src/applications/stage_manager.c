#include <applications/stage_manager.h>
#include <stdbool.h>
#include <stdlib.h>

#include "utils/cdp_packet_handler.h"
#include "network/cdp/data_items/step_motor_command.h"
#include "network/cdp/data_items/step_axis_command.h"
#include "network/cdp/data_items/set_stage_location.h"
#include "network/cdp/data_items/set_stage_origin.h"
#include "network/cdp/data_items/vector_move.h"

#include "stage/stage.h"

#include "xil_printf.h"

static bool _initialized = false;

void _HandleStepMotorCommand(uint8_t* data, uint16_t length)
{
	if(length == sizeof(cdp_step_motor_command_t))
	{
		cdp_step_motor_command_t* command = (cdp_step_motor_command_t*)data;
		Stage_StepMotor(command->motor_axis, command->motor_index, command->direction, command->number_steps);
	}
}

void _HandleStepAxisCommand(uint8_t* data, uint16_t length)
{
	if(length == sizeof(cdp_step_axis_command_t))
	{
		cdp_step_axis_command_t* command = (cdp_step_axis_command_t*)data;
		Stage_StepAxis(command->motor_axis, command->direction, command->number_steps);
	}
}

void _HandleSetStageLocationCommand(uint8_t* data, uint16_t length)
{
	if(length == sizeof(cdp_set_stage_location_command_t))
	{
		cdp_set_stage_location_command_t* command = (cdp_set_stage_location_command_t*)data;
		double_coordinate_t new_position;
		new_position.x = command->x;
		new_position.y = command->y;
		new_position.z = command->z;
		Stage_MoveTo(&new_position);
	}
}

static void _HandleSetStageOriginCommand(uint8_t* data, uint16_t length)
{
	Stage_SetOrigin();
}

static void _HandleVectorMoveCommand(uint8_t* data, uint16_t length)
{
	if(length == sizeof(cdp_vector_move_command_t))
	{
		cdp_vector_move_command_t* command = (cdp_vector_move_command_t*)data;
		Stage_VectorMove(command->microseconds_per_step_x, command->number_of_steps_x, command->microseconds_per_step_y, command->number_of_steps_y,
				command->microseconds_per_step_z, command->number_of_steps_z);
	}
}

void StageManager_Create(void)
{
	if(!_initialized)
	{
		CdpPacketHandler_Create();
		CdpPacketHandler_RegisterRxCallback(CDP_STEP_MOTOR_COMMAND_TYPE, _HandleStepMotorCommand);
		CdpPacketHandler_RegisterRxCallback(CDP_STEP_AXIS_COMMAND_TYPE, _HandleStepAxisCommand);
		CdpPacketHandler_RegisterRxCallback(CDP_SET_STAGE_LOCATION_COMMAND_TYPE, _HandleSetStageLocationCommand);
		CdpPacketHandler_RegisterRxCallback(CDP_SET_STAGE_ORIGIN_COMMAND_TYPE, _HandleSetStageOriginCommand);
		CdpPacketHandler_RegisterRxCallback(CDP_VECTOR_MOVE_COMMAND_TYPE, _HandleVectorMoveCommand);

		_initialized = true;
	}
}

