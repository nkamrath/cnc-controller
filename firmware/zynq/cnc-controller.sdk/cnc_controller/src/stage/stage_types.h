#ifndef _STAGE_STAGE_TYPES_H_
#define _STAGE_STAGE_TYPES_H_

typedef enum
{
	AXIS_X,
	AXIS_Y,
	AXIS_Z
} axis_t;

typedef struct
{
	double x;
	double y;
	double z;
} double_coordinate_t;

#endif
