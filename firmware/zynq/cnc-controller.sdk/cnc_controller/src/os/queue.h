#ifndef _OS_QUEUE_H_
#define _OS_QUEUE_H_

#include <stdbool.h>
#include <stdint.h>

typedef struct
{
	uint16_t item_size;
	uint16_t max_num_items;
	uint16_t size;
	void* data;
	void* head;
	void* tail;
	void* end;
} queue_t;

queue_t* Queue_Create(uint16_t item_size, uint16_t max_num_items);
bool Queue_Add(queue_t* queue, void* item);
bool Queue_Remove(queue_t* queue, void* item);
uint16_t Queue_GetSize(queue_t* queue);

#endif
