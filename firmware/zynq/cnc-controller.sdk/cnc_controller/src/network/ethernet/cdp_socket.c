#include <string.h>
#include <stdbool.h>
#include "cdp_socket.h"
#include "include/network_config.h"
#include "xil_printf.h"

#define _RX_BUFFER_LENGTH   1024
#define _TX_BUFFER_LENGTH   1024

/***********************
 * Private Variables
 ***********************/
//UDP socket variables
static struct udp_pcb* _pcb;
static ip_addr_t multicast_addr;
static struct pbuf _tx_packet_buffer;
static uint8_t _rx_buffer[_RX_BUFFER_LENGTH];
static uint8_t _tx_buffer[_TX_BUFFER_LENGTH];
static bool _initialized = false;

static ip_addr_t _unicast_addr;
static ip_addr_t _tx_addr;
static struct pbuf _packet_buffer;
cdp_rx_callback_t _rx_callback = NULL;


static void _HandleRx(void* arg, struct udp_pcb* upcb, struct pbuf* p, ip_addr_t* remote_addr, u16_t port)
{
	//reply
	if(_rx_callback)
	{
		_rx_callback(p->payload, p->len, remote_addr, port);
	}

	pbuf_free(p);
}


void CdpSocket_Create()
{
	if(!_initialized)
	{
		_pcb = udp_new();
		multicast_addr.addr = inet_addr(DISCOVERY_MULTICAST_ADDRESS);

		_unicast_addr.addr = htonl(INADDR_ANY);
		udp_bind(_pcb, &_unicast_addr, CONTROL_SOCKET_PORT);
		udp_recv(_pcb, _HandleRx, NULL);

		_initialized = true;
	}
}

void CdpSocket_SendMulticast(void* data, uint16_t length, ip_addr_t* addr, uint16_t port)
{
	memcpy(_tx_buffer, data, length);
	_tx_packet_buffer.payload = _tx_buffer;
	_tx_packet_buffer.len = length;
	_tx_packet_buffer.tot_len = length;
	_tx_packet_buffer.type = PBUF_RAM;
	_tx_packet_buffer.ref = 1;

	udp_sendto(_pcb, &_tx_packet_buffer, addr, port);
}

void CdpSocket_SendUnicast(void* data, uint16_t length, ip_addr_t* addr, uint16_t port)
{
	memcpy(_tx_buffer, data, length);
	_tx_packet_buffer.payload = _tx_buffer;
	_tx_packet_buffer.len = length;
	_tx_packet_buffer.tot_len = length;
	_tx_packet_buffer.type = PBUF_RAM;
	_tx_packet_buffer.ref = 1;

	udp_sendto(_pcb, &_tx_packet_buffer, addr, port);
}


void CdpSocket_RegisterRxCallback(cdp_rx_callback_t callback)
{
	_rx_callback = callback;
}
