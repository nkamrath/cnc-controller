#include "device_discovery.h"
#include "include/network_config.h"
#include "include/task_priorities.h"
#include "network/cdp/data_items/device_discovery.h"
#include "network/cdp/cdp_packet.h"
#include "network/cdp/cdp_data_item.h"
#include "network/ethernet/discovery_socket.h"

#include "os/scheduler.h"

static uint8_t _buffer[(sizeof(cdp_header_t) + sizeof(cdp_data_item_t) + sizeof(device_discovery_t))];
static bool _initialized = false;

void _SendDiscoveryTask(void* arg)
{
	DiscoverySocket_Send(_buffer, sizeof(_buffer));
}

void DeviceDiscovery_Create(void)
{
	if(!_initialized)
	{
		//make sure the discovery socket has been created
		DiscoverySocket_Create();
		//build the discovery packet
		cdp_header_t* header = (cdp_header_t*)_buffer;
		header->mark = CDP_PACKET_HEADER_MARK;

		cdp_data_item_t* data_item = &(header->data_items[0]);
		data_item->type = CDP_DEVICE_DISCOVERY_TYPE;
		data_item->length = sizeof(device_discovery_t);
		device_discovery_t* discovery = (device_discovery_t*)&(data_item->data);
		discovery->version_major = 0;
		discovery->version_minor = 1;
		discovery->version_patch = 2;
		discovery->device_status = 3;

		//schedule sender task

		Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(10000), Scheduler_MicrosToTicks(1000000), DEVICE_DISCOVERY_TASK_PRIORITY,
				_SendDiscoveryTask, NULL);
		_initialized = true;
	}

}
