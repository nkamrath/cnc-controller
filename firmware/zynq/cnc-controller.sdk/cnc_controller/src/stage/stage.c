#include <stdbool.h>
#include <string.h>
#include "stage.h"
#include "include/motor_configs.h"
#include "include/task_priorities.h"
#include "stage_axis.h"
#include "os/critical_section.h"
#include "os/scheduler.h"
#include "os/queue.h"

#define _NUM_AXIS				3
#define _COMMAND_QUEUE_SIZE		100

typedef enum
{
	STAGE_COMMAND_TYPE_MOVE_TO,
	STAGE_COMMAND_TYPE_VECTOR_MOVE
} _stage_command_type_t;

typedef struct
{
	uint32_t period_us_x;
	int32_t steps_x;
	uint32_t period_us_y;
	int32_t steps_y;
	uint32_t period_us_z;
	int32_t steps_z;
} _vector_move_command_t;

typedef struct
{
	double_coordinate_t coordinate;
} _move_to_command_t;

typedef struct
{
	_stage_command_type_t type;
	union
	{
		_vector_move_command_t vector_move_command;
		_move_to_command_t move_to_command;
	};
} _stage_command_t;

static bool _initialized = false;
static stage_axis_t* _axis[_NUM_AXIS];
static double_coordinate_t _stage_location = {0.0, 0.0, 0.0};
static queue_t* _command_queue = NULL;

static void _MoveTo(double_coordinate_t* coordinate);

static uint32_t _ComputeMoveDurationUs(uint32_t x_steps, uint32_t y_steps, uint32_t z_steps)
{
	uint32_t max_steps = x_steps;
	if(y_steps > max_steps)
	{
		max_steps = y_steps;
	}
	if(z_steps > max_steps)
	{
		max_steps = z_steps;
	}
	uint32_t duration_us = max_steps * MOTOR_CONFIGS_STEP_TIME_US;
	return duration_us + 100;
}

static void _ProcessQueueTask(void* arg)
{
	if(Queue_GetSize(_command_queue) > 0)
	{
		if(!Stage_IsBusy())
		{
			_stage_command_t command;
			if(Queue_Remove(_command_queue, &command))
			{
				//execute the next command, this also handles scheduling this task again
				if(command.type == STAGE_COMMAND_TYPE_MOVE_TO)
				{
					_MoveTo(&command.move_to_command.coordinate);
				}
				else if(command.type == STAGE_COMMAND_TYPE_VECTOR_MOVE)
				{
					//first we need to setup the motor speeds then setup the step amounts for each axis and go
					StageAxis_SetSpeed(_axis[AXIS_X], command.vector_move_command.period_us_x * 100);  //multiply by 100 bc plpwm clock is 100mhz not 1 mhz to match the us
					StageAxis_SetSpeed(_axis[AXIS_Y], command.vector_move_command.period_us_y * 100);
					StageAxis_SetSpeed(_axis[AXIS_Z], command.vector_move_command.period_us_z * 100);

					if(command.vector_move_command.steps_x < 0)
					{
						Stage_StepAxis(AXIS_X, 0, (-command.vector_move_command.steps_x));
					}
					else
					{
						Stage_StepAxis(AXIS_X, 1, command.vector_move_command.steps_x);
					}

					if(command.vector_move_command.steps_y < 0)
					{
						Stage_StepAxis(AXIS_Y, 0, (-command.vector_move_command.steps_y));
					}
					else
					{
						Stage_StepAxis(AXIS_Y, 1, command.vector_move_command.steps_y);
					}

					if(command.vector_move_command.steps_z < 0)
					{
						Stage_StepAxis(AXIS_Z, 0, (-command.vector_move_command.steps_z));
					}
					else
					{
						Stage_StepAxis(AXIS_Z, 1, command.vector_move_command.steps_z);
					}
				}
			}
		}
		else
		{
			//we thought we shouldn't be busy, but we are so schedule this task again slightly in the future
			Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(10000), 0,
									STAGE_COMMAND_QUEUE_PROCESSING_TASK_PRIORITY, _ProcessQueueTask, NULL);
		}
	}
}

void _UpdateLocation(axis_t axis, bool direction, uint32_t steps)
{
	double change_mm = (MOTOR_CONFIGS_MM_PER_STEP * steps);
	if(direction)
	{
		change_mm *= -1.0;
	}
	switch(axis)
	{
		case AXIS_X:
			_stage_location.x += change_mm;
			break;
		case AXIS_Y:
			_stage_location.y += change_mm;
			break;
		case AXIS_Z:
			_stage_location.z += change_mm;
			break;
	}
}

static void _MoveTo(double_coordinate_t* coordinate)
{
	//get the difference between current and desired
	double_coordinate_t diff = {0.0, 0.0, 0.0};
	diff.x = (_stage_location.x - coordinate->x);
	diff.y = (_stage_location.y - coordinate->y);
	diff.z = (_stage_location.z - coordinate->z);

	//compute the steps in each direction
	bool x_direction = true;
	bool y_direction = true;
	bool z_direction = true;

	if(diff.x < 0)
	{
		x_direction = false;
		diff.x *= -1;
	}

	if(diff.y < 0)
	{
		y_direction = false;
		diff.y *= -1;
	}

	if(diff.z < 0)
	{
		z_direction = false;
		diff.z *= -1;
	}

	uint32_t x_steps = diff.x / MOTOR_CONFIGS_MM_PER_STEP;
	uint32_t y_steps = diff.y / MOTOR_CONFIGS_MM_PER_STEP;
	uint32_t z_steps = diff.z / MOTOR_CONFIGS_MM_PER_STEP;

	Stage_StepAxis(AXIS_X, x_direction, x_steps);
	Stage_StepAxis(AXIS_Y, y_direction, y_steps);
	Stage_StepAxis(AXIS_Z, z_direction, z_steps);
	uint32_t task_duration = _ComputeMoveDurationUs(x_steps, y_steps, z_steps);
	Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(task_duration), 0,
					STAGE_COMMAND_QUEUE_PROCESSING_TASK_PRIORITY, _ProcessQueueTask, NULL);
}

void Stage_Create(void)
{
	if(!_initialized)
	{
		for(int i = 0; i < _NUM_AXIS; i++)
		{
			_axis[i] = StageAxis_Create();
		}

		//create the command queue
		_command_queue = Queue_Create(sizeof(_stage_command_t), _COMMAND_QUEUE_SIZE);

		_initialized = true;
	}
}

void Stage_AddMotor(stepper_motor_t* motor, axis_t axis)
{
	if(_axis[axis])
	{
		StageAxis_AddMotor(_axis[axis], motor);
	}
}

void Stage_SetOrigin(void)
{
	memset(&_stage_location, 0, sizeof(_stage_location));
}

void Stage_StepMotor(axis_t axis, uint8_t motor_index, bool direction, uint32_t steps)
{
	if(_axis[axis])
	{
		StageAxis_StepMotor(_axis[axis], motor_index, direction, steps);
	}
	_UpdateLocation(axis, direction, steps);
}

void Stage_StepAxis(axis_t axis, bool direction, uint32_t steps)
{
	StageAxis_StepAxis(_axis[axis], direction, steps);
	_UpdateLocation(axis, direction, steps);
}

void Stage_MoveTo(double_coordinate_t* coordinate)
{
	//if we are busy we need to queue the command, otherwise we can start processing
	if(Stage_IsBusy() || Queue_GetSize(_command_queue) > 0)
	{
		//build the generic command
		_stage_command_t command;
		command.type = STAGE_COMMAND_TYPE_MOVE_TO;
		command.move_to_command.coordinate = *coordinate;
		Queue_Add(_command_queue, &command);
	}
	else
	{
		_MoveTo(coordinate);
	}
}

void Stage_VectorMove(uint32_t period_x, int32_t steps_x, uint32_t period_y, int32_t steps_y, uint32_t period_z, int32_t steps_z)
{
	//build the vector move commmand
	_stage_command_t command;
	command.type = STAGE_COMMAND_TYPE_VECTOR_MOVE;
	command.vector_move_command.period_us_x = period_x;
	command.vector_move_command.steps_x = steps_x;
	command.vector_move_command.period_us_y = period_y;
	command.vector_move_command.steps_y = steps_y;
	command.vector_move_command.period_us_z = period_z;
	command.vector_move_command.steps_z = steps_z;

	Queue_Add(_command_queue, &command);


	//determine if we need to start processing the queue or if it is already being processed
	if(!(Stage_IsBusy() || Queue_GetSize(_command_queue) > 1))
	{
		//manually call the process queue task as this is the only item in the queue right now
		_ProcessQueueTask(NULL);
	}
}

bool Stage_IsBusy(void)
{
	bool busy = false;
	for(int i = 0; i < _NUM_AXIS; i++)
	{
		busy |= StageAxis_IsBusy(_axis[i]);
	}
	return busy;
}
