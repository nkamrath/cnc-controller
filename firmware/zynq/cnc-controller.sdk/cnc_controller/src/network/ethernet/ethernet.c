
#include "ethernet.h"

#include "xparameters.h"
#include "netif/xadapter.h"
#include "platform.h"
#include "platform_config.h"

#include "drivers/interrupt_controller.h"
#include "os/scheduler.h"

#if LWIP_DHCP==1
#include "lwip/dhcp.h"
#endif

/* missing declaration in lwIP */
void lwip_init();

#if LWIP_DHCP==1
volatile int dhcp_timoutcntr;
err_t dhcp_start(struct netif *netif);
#endif

/***********************
 * Private Variables
 ***********************/
static struct netif _netif;
static struct ip_addr ipaddr, netmask, gw;

/* the mac address of the board. this should be unique per board */
static unsigned char mac_ethernet_address[] = { 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };

/***********************
 * Private Functions
 ***********************/
void DhcpTask(void* arg)
{
	/* we need to call tcp_fasttmr & tcp_slowtmr at intervals specified
	 * by lwIP. It is not important that the timing is absoluetly accurate.
	 */
	static int odd = 1;
#if LWIP_DHCP==1
    static int dhcp_timer = 0;
#endif

	odd = !odd;
//#ifndef USE_SOFTETH_ON_ZYNQ
//	ResetRxCntr++;
//#endif
	if (odd) {
#if LWIP_DHCP==1
		dhcp_timer++;
		dhcp_timoutcntr--;
#endif

#if LWIP_DHCP==1
		dhcp_fine_tmr();
		if (dhcp_timer >= 120) {
			dhcp_coarse_tmr();
			dhcp_timer = 0;
		}
#endif
	}

	/* For providing an SW alternative for the SI #692601. Under heavy
	 * Rx traffic if at some point the Rx path becomes unresponsive, the
	 * following API call will ensures a SW reset of the Rx path. The
	 * API xemacpsif_resetrx_on_no_rxdata is called every 100 milliseconds.
	 * This ensures that if the above HW bug is hit, in the worst case,
	 * the Rx path cannot become unresponsive for more than 100
	 * milliseconds.
	 */
//#ifndef USE_SOFTETH_ON_ZYNQ
//	if (ResetRxCntr >= RESET_RX_CNTR_LIMIT) {
//		xemacpsif_resetrx_on_no_rxdata(echo_netif);
//		ResetRxCntr = 0;
//	}
//#endif

}

void _HandleRxTask(void* arg)
{
	xemacif_input(&_netif);
	//schedule this task again as one time so as not to eat an entire priority level since tasks of same priority can not interrupt each other
	Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(100000), 0, 7, _HandleRxTask, NULL);
}

/***********************
 * Public Functions
 ***********************/

void Ethernet_Create(void)
{
	struct netif* netif_ptr = &_netif;

	#if LWIP_DHCP==1
		ipaddr.addr = 0;
		gw.addr = 0;
		netmask.addr = 0;
	#else
		/* initliaze IP addresses to be used */
		IP4_ADDR(&ipaddr,  192, 168,   1, 10);
		IP4_ADDR(&netmask, 255, 255, 255,  0);
		IP4_ADDR(&gw,      192, 168,   1,  1);
	#endif

	lwip_init();

	//schedule the dhcp task
	Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(10000), Scheduler_MicrosToTicks(250000), 2, DhcpTask, NULL);

  	/* Add network interface to the netif_list, and set it as default */
	if (!xemac_add(netif_ptr, &ipaddr, &netmask,
						&gw, mac_ethernet_address,
						PLATFORM_EMAC_BASEADDR)) {
		//handle error?
		return;
	}
	netif_set_default(netif_ptr);

	/* now enable interrupts */
	InterruptController_Init();
	InterruptController_EnableInterrupts();

	/* specify that the network if is up */
	netif_set_up(netif_ptr);

#if (LWIP_DHCP==1)
	/* Create a new DHCP client for this interface.
	 * Note: you must call dhcp_fine_tmr() and dhcp_coarse_tmr() at
	 * the predefined regular intervals after starting the client.
	 */
	dhcp_start(netif_ptr);
	dhcp_timoutcntr = 24;

	while(((netif_ptr->ip_addr.addr) == 0) && (dhcp_timoutcntr > 0))
		xemacif_input(netif_ptr);

	if (dhcp_timoutcntr <= 0) {
		if ((_netif.ip_addr.addr) == 0) {
			//xil_printf("DHCP Timeout\r\n");
			//xil_printf("Configuring default IP of 192.168.1.10\r\n");
			IP4_ADDR(&(netif_ptr->ip_addr),  192, 168,   1, 10);
			IP4_ADDR(&(netif_ptr->netmask), 255, 255, 255,  0);
			IP4_ADDR(&(netif_ptr->gw),      192, 168,   1,  1);
		}
	}

	ipaddr.addr = _netif.ip_addr.addr;
	gw.addr = _netif.gw.addr;
	netmask.addr = _netif.netmask.addr;
#endif

	//start rx thread in a few seconds to allow sys config to finish
	Scheduler_Add(Scheduler_GetTicks() + Scheduler_MicrosToTicks(2000000), 0, 7, _HandleRxTask, NULL);

	//done

}
