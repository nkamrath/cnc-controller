#include <stdbool.h>
#include "device_state.h"
#include "lwip/udp.h"
#include "utils/cdp_packet_handler.h"
#include "network/cdp/data_items/connect_command.h"

#include "xil_printf.h"

static ip_addr_t _tx_address;
static uint16_t _tx_port;
static bool _initialized = false;

void _HandleConnectCommand(uint8_t* data, uint16_t length)
{
	if(length == sizeof(cdp_connect_command_t))
	{
		cdp_connect_command_t* command = (cdp_connect_command_t*)data;
		_tx_address.addr = command->ip_address;
		_tx_port = command->port;
	}

}

void DeviceState_Create(void)
{
	if(!_initialized)
	{
		CdpPacketHandler_Create();
		CdpPacketHandler_RegisterRxCallback(CDP_CONNECT_COMMAND_TYPE, _HandleConnectCommand);
		_initialized = true;
	}
}

ip_addr_t* DeviceState_GetHostIp(void)
{
	return &_tx_address;
}

uint16_t DeviceState_GetHostPort(void)
{
	return _tx_port;
}
