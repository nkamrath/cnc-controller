#include "device_discovery.h"
#include "include/network_config.h"
#include "include/task_priorities.h"
#include "include/version.h"
#include "network/cdp/data_items/device_discovery.h"
#include "network/cdp/cdp_packet.h"
#include "network/cdp/cdp_data_item.h"
#include "network/ethernet/cdp_socket.h"

#include "os/scheduler.h"

static uint8_t _buffer[(sizeof(cdp_header_t) + sizeof(cdp_data_item_t) + sizeof(device_discovery_t))];
static bool _initialized = false;
static ip_addr_t _discovery_address;
static uint16_t _discovery_port;

void _SendDiscoveryTask(void* arg)
{
	CdpSocket_SendMulticast(_buffer, sizeof(_buffer), &_discovery_address, _discovery_port);
}

void DeviceDiscovery_Create(void)
{
	if(!_initialized)
	{
		_discovery_address.addr = inet_addr(DISCOVERY_MULTICAST_ADDRESS);
		_discovery_port = DISCOVERY_MULTICAST_PORT;
		//make sure the discovery socket has been created
		CdpSocket_Create();
		//build the discovery packet
		cdp_packet_t* packet = (cdp_packet_t*)_buffer;
		packet->header.mark = CDP_PACKET_HEADER_MARK;

		cdp_data_item_t* data_item = &(packet->data_items[0]);
		data_item->type = CDP_DEVICE_DISCOVERY_TYPE;
		data_item->length = sizeof(device_discovery_t);
		device_discovery_t* discovery = (device_discovery_t*)&(data_item->data);
		discovery->version_major = FIRMWARE_VERSION_MAJOR;
		discovery->version_minor = FIRMWARE_VERSION_MINOR;
		discovery->version_patch = FIRMWARE_VERSION_PATCH;
		discovery->device_status = 3;

		//schedule sender task

		Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(10000), Scheduler_MicrosToTicks(1000000), DEVICE_DISCOVERY_TASK_PRIORITY,
				_SendDiscoveryTask, NULL);
		_initialized = true;
	}

}
