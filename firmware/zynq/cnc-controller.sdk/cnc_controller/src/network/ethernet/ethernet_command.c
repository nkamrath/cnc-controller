#include "ethernet_command.h"

#include "xil_printf.h"

#include "lwip/udp.h"
#include "lwip/inet.h"


#define _BUFFER_LENGTH   1024

/***********************
 * Private Variables
 ***********************/
//UDP socket variables
static struct udp_pcb* _pcb;
static ip_addr_t _ethernet_command_addr;
static struct pbuf _packet_buffer;
static uint8_t _buffer[_BUFFER_LENGTH];


void _HandleRx(void* arg, struct udp_pcb* upcb, struct pbuf* p, ip_addr_t* remote_addr, u16_t port)
{
	print("Command RX!\r\n");
	//reply
	memcpy(_buffer, "OK", 2);
	_packet_buffer.payload = _buffer;
	_packet_buffer.len = 2;
	_packet_buffer.tot_len = 2;
	_packet_buffer.type = PBUF_RAM;
	_packet_buffer.ref = 1;
	udp_sendto(upcb, &_packet_buffer, remote_addr, port);
	pbuf_free(p);
}


void EthernetCommand_Create(uint16_t port)
{
	_pcb = udp_new();
	_ethernet_command_addr.addr = htonl(INADDR_ANY);
	udp_bind(_pcb, &_ethernet_command_addr, port);
	udp_recv(_pcb, _HandleRx, NULL);
}
