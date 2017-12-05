#ifndef _DRIVERS_AXI_DMA_H_
#define _DRIVERS_AXI_DMA_H_

#include <stdint.h>
#include <stdbool.h>

#define AXI_DMA0_BASE_ADDRESS 0x40400000

#define AXI_DMA0 ((axi_dma_t*) AXI_DMA0_BASE_ADDRESS)

typedef struct
{
	volatile uint32_t MM2S_DMACR;				//0x00
	volatile uint32_t MM2S_DMASR;				//0x04
	volatile uint32_t MM2S_CURDESC;				//0x08
	volatile uint32_t MM2S_CURDESC_MSB;			//0x0C
	volatile uint32_t MM2S_TAILDESC;			//0x10
	volatile uint32_t MM2S_TAILDESC_MSB;		//0x14
	volatile uint32_t RESERVED[5];				//0x18, 0x1C, 0x20, 0x24, 0x28
	volatile uint32_t SG_CTL;					//0x2C
	volatile uint32_t S2MM_DMACR;				//0x30
	volatile uint32_t S2MM_DMASR;				//0x34
	volatile uint32_t S2MM_CURDESC;				//0x38
	volatile uint32_t S2MM_CURDESC_MSB;			//0x3C
	volatile uint32_t S2MM_TAILDESC;			//0x40
	volatile uint32_t S2MM_TAILDESC_MSB;		//0x44
} axi_dma_t;

typedef struct
{
	volatile uint32_t NXTDESC;
	volatile uint32_t NXTDESC_MSB;
	volatile uint32_t BUFFER_ADDRESS;
	volatile uint32_t BUFFER_ADDRESS_MSB;
	volatile uint32_t RESERVED1;
	volatile uint32_t RESERVED2;
	volatile uint32_t CONTROL;
	volatile uint32_t STATUS;
	volatile uint32_t APP[5];
	volatile uint32_t PAD[3];
} axi_dma_descriptor_t;

typedef struct
{
	uint16_t count;
	uint16_t max_size;
	axi_dma_t* dma_ptr;
	axi_dma_descriptor_t descriptors[];
} axi_dma_list_t;

/**************************************************************************************
 								MM2S_DMACR
 *************************************************************************************/
#define MM2S_DMACR_RS_SHIFT 					(0)
#define MM2S_DMACR_RS_MASK						(1<<MM2S_DMACR_RS_SHIFT)
#define MM2S_DMACR_RESET_SHIFT					(2)
#define MM2S_DMACR_RESET_MASK					(1<<MM2S_DMACR_RESET_SHIFT)
#define MM2S_DMACR_KEYHOLE_SHIFT				(3)
#define MM2S_DMACR_KEYHOLE_MASK					(1<<MM2S_DMACR_KEYHOLE_SHIFT)
#define MM2S_DMACR_CYCLIC_BD_ENABLE_SHIFT		(4)
#define MM2S_DMACR_CYCLIC_BD_ENABLE_MASK		(1<<MM2S_DMACR_CYCLIC_BD_ENABLE_SHIFT)
#define MM2S_DMACR_IOC_IRQEN_SHIFT				(12)
#define MM2S_DMACR_IOC_IRQEN_MASK				(1<<MM2S_DMACR_IOC_IRQEN_SHIFT)
#define MM2S_DMACR_DLY_IRQEN_SHIFT				(13)
#define MM2S_DMACR_DLY_IRQEN_MASK				(1<<MM2S_DMACR_DLY_IRQEN_SHIFT)
#define MM2S_DMACR_ERR_IRQEN_SHIFT				(14)
#define MM2S_DMACR_ERR_IRQEN_MASK				(1<<MM2S_DMACR_ERR_IRQEN_SHIFT)
#define MM2S_DMACR_IRQ_THRESHOLD_SHIFT			(16)
#define MM2S_DMACR_IRQ_THRESHOLD_MASK			(0xff<<MM2S_DMACR_IRQ_THRESHOLD_SHIFT)
#define MM2S_DMACR_IRQ_DELAY_SHIFT				(24)
#define MM2S_DMACR_IRQ_DELAY_MASK				(0xff<<MM2S_DMACR_IRQ_DELAY_MASK)

/**************************************************************************************
 								MM2S_DMASR
 *************************************************************************************/
#define MM2S_DMASR_HALTED_SHIFT					(0)
#define MM2S_DMASR_HALTED_MASK					(1<<MM2S_DMASR_HALTED_SHIFT)
#define MM2S_DMASR_IDLE_SHIFT					(1)
#define MM2S_DMASR_IDLE_MASK					(1<<MM2S_DMASR_IDLE_SHIFT)
#define MM2S_DMASR_SG_INC_ID_SHIFT				(3)
#define MM2S_DMASR_SG_INC_ID_MASK				(1<<MM2S_DMASR_SG_INC_ID_SHIFT)
#define MM2S_DMASR_DMA_INT_ERR_SHIFT			(4)
#define MM2S_DMASR_INT_ERR_MASK					(1<<MM2S_DMASR_DMA_INT_ERR_SHIFT)
#define MM2S_DMASR_SLV_ERR_SHIFT				(5)
#define MM2S_DMASR_SLV_ERR_MASK					(1<<MM2S_DMASR_SLV_ERR_SHIFT)
#define MM2S_DMASR_DMA_DEC_ERR_SHIFT			(6)
#define MM2S_DMASR_DMA_DEC_ERR_MASK				(1<<MM2S_DMASR_DMA_DEC_ERR_SHIFT)
#define MM2S_DMASR_SG_INT_ERR_SHIFT				(8)
#define MM2S_DMASR_SG_INT_ERR_MASK				(1<<MM2S_DMASR_SG_INT_ERR_MASK)
#define MM2S_DMASR_SG_SLV_ERR_SHIFT				(9)
#define MM2S_DMASR_SG_SLV_ERR_MASK				(1<<MM2S_DMASR_SG_SLV_ERR_SHIFT)
#define MM2S_DMASR_SG_DEC_ERR_SHIFT				(10)
#define MM2S_DMASR_SG_DEC_ERR_MASK				(1<<MM2S_DMASR_SG_DEC_ERR_SHIFT)
#define MM2S_DMASR_IOC_IRQ_SHIFT				(12)
#define MM2S_DMASR_IOC_IRQ_MASK					(1<<MM2S_DMASR_IOC_IRQ_SHIFT)
#define MM2S_DMASR_DLY_IRQ_SHIFT				(13)
#define MM2S_DMASR_DLY_IRQ_MASK					(1<<MM2S_DMASR_DLY_IRQ_SHIFT)
#define MM2S_DMASR_ERR_IRQ_SHIFT				(14)
#define MM2S_DMASR_ERR_IRQ_MASK					(1<<MM2S_DMASR_ERR_IRQ_SHIFT)
#define MM2S_DMASR_IRQ_THRESHOLD_STS_SHIFT		(16)
#define MM2S_DMASR_IRQ_THRESHOLD_STS_MASK		(0xff<<MM2S_DMASR_IRQ_THRESHOLD_STS_SHIFT)
#define MM2S_DMASR_IRQ_DELAY_STS_SHIFT			(24)
#define MM2S_DMASR_IRQ_DELAY_STS_MASK			(0xff<<MM2S_DMASR_IRQ_DELAY_STS_SHIFT)


#define DISABLE_SCATTER_GATHER 0
#define ENABLE_SCATTER_GATHER 1

void Dma_Create(axi_dma_t* dma, bool enable_scatter_gather);

void Dma_Start(axi_dma_t* dma);
void Dma_Stop(axi_dma_t* dma);
void Dma_Reset(axi_dma_t* dma);
void Dma_EnableCyclicBD(axi_dma_t* dma);
void Dma_DisableCyclicBD(axi_dma_t* dma);

int Dma_Transfer(void* data, uint32_t length);
void Dma_TransferBlock(axi_dma_t* dma, void* data, uint32_t length, bool cyclic);
void Dma_TransferBlocks(axi_dma_t* dma, uint32_t* data, uint32_t length, bool cyclic);
void Dma_TransferList(axi_dma_list_t* list, bool cyclic);
bool Dma_IsTxDone(void);
bool Dma_DescriptorAdd(axi_dma_list_t* list, axi_dma_descriptor_t* descriptor);

#endif
