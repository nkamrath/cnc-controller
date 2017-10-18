#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "cdp_packet_handler.h"
#include "lwip/udp.h"
#include "network/ethernet/cdp_socket.h"
#include "network/cdp/cdp_packet.h"
#include "utils/device_state.h"

#define _CALLBACKS_PER_TYPE 	3
#define _TYPES 					50

#define _BUFFER_SIZE		1024

static cdp_handler_callback_t _callbacks[_TYPES][_CALLBACKS_PER_TYPE];
static bool _initialized = false;
static uint8_t _buffer[_BUFFER_SIZE];

void _RxCallback(uint8_t* data, uint16_t length, ip_addr_t* remote_addr, uint16_t port)
{
	//build the cdp packet
	cdp_packet_t* packet = (cdp_packet_t*)data;
	if(packet->header.mark == CDP_PACKET_HEADER_MARK)
	{
		uint16_t payload_index = sizeof(cdp_header_t);
		uint8_t data_item_index = 0;
		while(payload_index < length)
		{
			cdp_data_item_t* data_item = &packet->data_items[data_item_index];
			for(uint8_t i = 0; i < _CALLBACKS_PER_TYPE; i++)
			{
				if(_callbacks[data_item->type][i])
				{
					_callbacks[data_item->type][i](data_item->data, data_item->length);
				}
				else
				{
					break;
				}
			}
			data_item_index++;
			payload_index += data_item->length + sizeof(cdp_data_item_t);
		}
	}
}

void CdpPacketHandler_Create(void)
{
	if(!_initialized)
	{
		CdpSocket_Create();
		CdpSocket_RegisterRxCallback(_RxCallback);
		for(int i = 0; i < _TYPES; i++)
		{
			for(int j = 0; j < _CALLBACKS_PER_TYPE; j++)
			{
				_callbacks[i][j] = NULL;
			}
		}
		_initialized = true;
	}
}

bool CdpPacketHandler_RegisterRxCallback(uint16_t packet_type, cdp_handler_callback_t callback)
{
	for(int i = 0; i < _CALLBACKS_PER_TYPE; i++)
	{
		if(_callbacks[packet_type][i] == NULL)
		{
			_callbacks[packet_type][i] = callback;
			return true;
		}
	}
	return false;
}

void CdpPacketHandler_SendDataItem(cdp_data_item_t* data_item)
{
	cdp_packet_t* packet = (cdp_packet_t*)_buffer;
	packet->header.mark = CDP_PACKET_HEADER_MARK;
	memcpy(packet->data_items, data_item, data_item->length + sizeof(cdp_data_item_t));
	CdpSocket_SendUnicast(packet, (data_item->length + sizeof(cdp_packet_t) + sizeof(cdp_data_item_t)),
			DeviceState_GetHostIp(), DeviceState_GetHostPort());
}
