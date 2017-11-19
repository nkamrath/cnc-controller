#include "queue.h"
#include <stdlib.h>
#include <string.h>
#include "critical_section.h"

queue_t* Queue_Create(uint16_t item_size, uint16_t max_num_items)
{
	queue_t* queue = (queue_t*)malloc(sizeof(queue_t));
	if(queue)
	{
		queue->data = malloc((item_size * max_num_items));
		if(queue->data)
		{
			queue->item_size = item_size;
			queue->max_num_items = max_num_items;
			queue->head = queue->data;
			queue->tail = queue->data;
			queue->end = (void*)((uint32_t)queue->data) + (queue->item_size * queue->max_num_items);
			queue->size = 0;
		}
		else
		{
			free(queue);
			queue = NULL;
		}
	}
	return queue;
}

bool Queue_Add(queue_t* queue, void* item)
{
	bool ret = false;
	CriticalSection_Enter();
	if(queue->size < queue->max_num_items)
	{
		memcpy(queue->tail, item, queue->item_size);
		queue->tail = (void*)((uint32_t)queue->tail + queue->item_size);
		if((uint32_t)queue->tail >= (uint32_t)queue->end)
		{
			queue->tail = queue->data;
		}
		queue->size++;
		ret = true;
	}
	CriticalSection_Exit();
	return ret;
}

bool Queue_Remove(queue_t* queue, void* item)
{
	bool ret = false;
	CriticalSection_Enter();
	if(queue->size > 0)
	{
		memcpy(item, queue->head, queue->item_size);
		queue->head = (void*)((uint32_t)queue->head + queue->item_size);
		if((uint32_t)queue->head >= (uint32_t)queue->end)
		{
			queue->head = queue->data;
		}
		queue->size--;
		ret = true;
	}
	CriticalSection_Exit();
	return ret;
}

uint16_t Queue_GetSize(queue_t* queue)
{
	return queue->size;
}
