#include <string.h>
#include <stdbool.h>
#include "include/network_config.h"
#include "lwip/udp.h"
#include "lwip/inet.h"


#define _BUFFER_LENGTH   256

/***********************
 * Private Variables
 ***********************/
//UDP socket variables
static struct udp_pcb* pcb;
static ip_addr_t multicast_addr;
static struct pbuf packet_buffer;
static uint8_t _buffer[_BUFFER_LENGTH];
static bool _initialized = false;

void DiscoverySocket_Create(void)
{
	if(!_initialized)
	{
		pcb = udp_new();
		multicast_addr.addr = inet_addr(DISCOVERY_MULTICAST_ADDRESS);
		_initialized = true;
	}
}

void DiscoverySocket_Send(void* data, uint16_t length)
{
	memcpy(_buffer, data, length);
	packet_buffer.payload = _buffer;
	packet_buffer.len = length;
	packet_buffer.tot_len = length;
	packet_buffer.type = PBUF_RAM;
	packet_buffer.ref = 1;

	udp_sendto(pcb, &packet_buffer, &multicast_addr, DISCOVERY_MULTICAST_PORT);
}
