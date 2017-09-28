
#include "udp_beacon.h"

#include "lwip/udp.h"
#include "lwip/inet.h"


#define _BUFFER_LENGTH   1024
#define BROADCAST_GROUP_ADDR 	"224.1.1.1"
#define UNICAST_PORT			50008
#define BROADCAST_PORT			50009

#define TEST_PAYLOAD			"TESTING 1 2 3, hello to Luke!"

/***********************
 * Private Variables
 ***********************/
//UDP socket variables
static struct udp_pcb* pcb;
static ip_addr_t network_manager_addr;
static ip_addr_t multicast_addr;
static struct pbuf packet_buffer;
static uint8_t _buffer[_BUFFER_LENGTH];

void UdpBeacon_Create(void)
{
	pcb = udp_new();
	multicast_addr.addr = inet_addr(BROADCAST_GROUP_ADDR);
}

void UdpBeacon_Send(void)
{
	packet_buffer.payload = TEST_PAYLOAD;
	packet_buffer.len = sizeof(TEST_PAYLOAD);
	packet_buffer.tot_len = sizeof(TEST_PAYLOAD);
	packet_buffer.type = PBUF_RAM;
	packet_buffer.ref = 1;

	udp_sendto(pcb, &packet_buffer, &multicast_addr, BROADCAST_PORT);
}