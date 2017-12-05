#include "axi_dma.h"
#include "drivers/pl_interrupt_manager.h"
#include "xparameters.h"
#include "xaxidma.h"

static bool _initialized = false;
static XAxiDma AxiDma;
static XAxiDma_Config *Config;

static int _error = 0;
static int _tx_done = 0;
static axi_dma_descriptor_t _descriptor __attribute__((aligned(0x40)));
static axi_dma_descriptor_t _descriptor2 __attribute__((aligned(0x40)));
static axi_dma_descriptor_t _descriptor3 __attribute__((aligned(0x40)));
static axi_dma_descriptor_t _descriptor4 __attribute__((aligned(0x40)));

static axi_dma_descriptor_t _descriptor_list[525] __attribute__((aligned(0x40)));

static void _DmaTxHandler(void* arg)
{
	u32 IrqStatus;
	int TimeOut;
	XAxiDma* AxiDmaInst = &AxiDma;

	/* Read pending interrupts */
		IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DMA_TO_DEVICE);

		/* Acknowledge pending interrupts */


		XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DMA_TO_DEVICE);

		/*
		 * If no interrupt is asserted, we do not do anything
		 */
		if (!(IrqStatus & XAXIDMA_IRQ_ALL_MASK)) {

			return;
		}

		/*
		 * If error interrupt is asserted, raise error flag, reset the
		 * hardware to recover from the error, and return with no further
		 * processing.
		 */
		if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

			_error = 1;

			/*
			 * Reset should never fail for transmit channel
			 */
			XAxiDma_Reset(AxiDmaInst);

			TimeOut = 10000;

			while (TimeOut) {
				if (XAxiDma_ResetIsDone(AxiDmaInst)) {
					break;
				}

				TimeOut -= 1;
			}

			return;
		}

		/*
		 * If Completion interrupt is asserted, then set the TxDone flag
		 */
		if ((IrqStatus & XAXIDMA_IRQ_IOC_MASK)) {

			_tx_done = 1;
		}
}

void Dma_Create(axi_dma_t* dma, bool enable_scatter_gather)
{
	if(!_initialized)
	{
		//configure dma
		Config = XAxiDma_LookupConfig(0);
		XAxiDma_CfgInitialize(&AxiDma, Config);

		//disable interrupts
		XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
		XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

		//ensure stopped
		Dma_Stop(dma);
		//reset
		Dma_Reset(dma);

		//wait for reset to clear
		int timeout = 1000;
		while(dma->MM2S_DMACR & MM2S_DMACR_RESET_MASK)
		{
			timeout--;
			if(timeout <= 0)
			{
				break;
			}
		}

		//enable cyclic bds
		Dma_EnableCyclicBD(dma);

		//setup irq handlers
//		PlInterruptManager_Create();
//		PlInterruptManager_SetInterruptHandler(30, _DmaTxHandler, NULL);

		//re-enable interrupts for error recovery
//		XAxiDma_IntrEnable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
//								XAXIDMA_DMA_TO_DEVICE);
//
//
//		XAxiDma_IntrEnable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,
//								XAXIDMA_DEVICE_TO_DMA);

		_initialized = true;
	}

}

void Dma_Start(axi_dma_t* dma)
{
	dma->MM2S_DMACR |= MM2S_DMACR_RS_MASK;
}

void Dma_Stop(axi_dma_t* dma)
{
	dma->MM2S_DMACR &= ~(MM2S_DMACR_RS_MASK);
}

void Dma_Reset(axi_dma_t* dma)
{
	dma->MM2S_DMACR |= MM2S_DMACR_RESET_MASK;
}

void Dma_EnableCyclicBD(axi_dma_t* dma)
{
	dma->MM2S_DMACR |= MM2S_DMACR_CYCLIC_BD_ENABLE_MASK;
}

void Dma_DisableCyclicBD(axi_dma_t* dma)
{
	dma->MM2S_DMACR &= ~MM2S_DMACR_CYCLIC_BD_ENABLE_MASK;
}

int Dma_Transfer(void* data, uint32_t length)
{
	Xil_DCacheFlushRange((UINTPTR)data, length);

	//setup a block descriptor

	return XAxiDma_SimpleTransfer(&AxiDma, (UINTPTR)data, length, XAXIDMA_DMA_TO_DEVICE);
}

void Dma_TransferList(axi_dma_list_t* list, bool cyclic)
{
	//flush cache?

}

void Dma_TransferBlock(axi_dma_t* dma, void* data, uint32_t length, bool cyclic)
{
	Dma_Stop(dma);
	//Dma_Reset(dma);

	//build a descriptor
	_descriptor.BUFFER_ADDRESS = (uint32_t)data;
	_descriptor.NXTDESC = (uint32_t)&_descriptor2;
	_descriptor.CONTROL = ((length/3));
	_descriptor.STATUS = 0;

	_descriptor2.BUFFER_ADDRESS = (uint32_t)&(((uint8_t*)data)[length/3]);
	_descriptor2.NXTDESC = (uint32_t)&_descriptor3;
	_descriptor2.CONTROL = ((length/3));
	_descriptor2.STATUS = 0;

	_descriptor3.BUFFER_ADDRESS = (uint32_t)&((uint8_t*)data)[(2*length)/3];
	_descriptor3.NXTDESC = (uint32_t)&_descriptor;
	_descriptor3.CONTROL = ((length/3));
	_descriptor3.STATUS = 0;

	_descriptor4.BUFFER_ADDRESS = (uint32_t)&((uint8_t*)data)[(3*length)/4];
	_descriptor4.NXTDESC = (uint32_t)&_descriptor;
	_descriptor4.CONTROL = ((length/3) | (1<<26));
	_descriptor4.STATUS = 0;

	//memset((void*)_descriptor.APP, 0, sizeof(_descriptor.APP));

	Xil_DCacheFlushRange((UINTPTR)data, length);
	Xil_DCacheFlushRange((UINTPTR)&_descriptor, sizeof(_descriptor));
	Xil_DCacheFlushRange((UINTPTR)&_descriptor2, sizeof(_descriptor2));
	Xil_DCacheFlushRange((UINTPTR)&_descriptor3, sizeof(_descriptor3));
	Xil_DCacheFlushRange((UINTPTR)&_descriptor4, sizeof(_descriptor4));

	dma->MM2S_CURDESC = &_descriptor;
	Dma_Start(dma);
	dma->MM2S_TAILDESC = 0x50;//&_descriptor4;

	volatile temp = _descriptor.STATUS;
	temp = dma->MM2S_DMASR;
	temp = _descriptor2.STATUS;
//	if(cyclic)
//	{
//		Dma_EnableCyclicBD(dma);
//	}
//	else
//	{
//		Dma_DisableCyclicBD(dma);
//	}

	//Dma_Start(dma);
}

void Dma_TransferBlocks(axi_dma_t* dma, uint32_t* data, uint32_t length, bool cyclic)
{
	Dma_Stop(dma);
	//Dma_Reset(dma);

	//build a descriptor
	for(int i = 0; i < 480; i++)
	{
		_descriptor_list[i].BUFFER_ADDRESS = &data[(i*640)];
		_descriptor_list[i].CONTROL = (640*4);
		_descriptor_list[i].STATUS = 0;
		if(i == 479)
		{
			_descriptor_list[i].NXTDESC = (uint32_t)&_descriptor_list[0];
		}
		else
		{
			_descriptor_list[i].NXTDESC = (uint32_t)&_descriptor_list[i+1];
		}
		Xil_DCacheFlushRange((UINTPTR)&_descriptor_list[i], sizeof(_descriptor));
	}

	//memset((void*)_descriptor.APP, 0, sizeof(_descriptor.APP));

	Xil_DCacheFlushRange((UINTPTR)data, length);

	dma->MM2S_CURDESC = &_descriptor_list[0];
	Dma_Start(dma);
	dma->MM2S_TAILDESC = 0x50;//&_descriptor4;
}

bool Dma_DescriptorAdd(axi_dma_list_t* list, axi_dma_descriptor_t* descriptor)
{
	if(list && descriptor)
	{
		if(list->count == 0)
		{

		}
		else
		{

		}
		list->count++;
	}
	return true;
}

bool Dma_IsTxDone(void)
{
	if(_tx_done)
	{
		_tx_done = 0;
		return true;
	}
	return false;
}
