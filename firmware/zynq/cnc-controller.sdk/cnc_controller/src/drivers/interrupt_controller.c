#include <stdbool.h>
#include "interrupt_controller.h"
#include "xil_exception.h"

static XScuGic InterruptController;  /* Interrupt controller instance */
static bool _initialized = false;

void InterruptController_Init(void)
{
	if(!_initialized)
	{
		//XScuGic_CPUWriteReg(&InterruptController, XSCGIC_BIN_PT_OFFSET,0x03);  //allow for nested interrupts
		//Xil_ExceptionInit();

		XScuGic_Config* config;
		config = XScuGic_LookupConfig(INTERRUPT_CONTROLLER_ID);
		XScuGic_CfgInitialize(&InterruptController, config, config->CpuBaseAddress);
		XScuGic_CPUReadReg(&InterruptController, XSCUGIC_INT_ACK_OFFSET); //this will clear any pending irqs
		Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XScuGic_InterruptHandler, &InterruptController);

		XScuGic_CPUWriteReg(&InterruptController, XSCUGIC_BIN_PT_OFFSET, 0x03); //magic for setting up the interrupt controller
		Xil_ExceptionInit();

		//clear all interrupts
		for(int i = 0; i < XSCUGIC_MAX_NUM_INTR_INPUTS; i++)
		{
			InterruptController_DisableInterrupt(i);
			InterruptController_ClearInterrupt(i);
		}
		_initialized = true;
	}
}

void InterruptController_EnableInterrupts(void)
{
	Xil_ExceptionEnable();
}

void InterruptController_DisableInterrupts(void)
{
	Xil_ExceptionDisable();
}

void InterruptController_SetHandler(uint32_t interrupt_id, void(*handler), void* arg)
{
	InterruptController.Config->HandlerTable[interrupt_id].Handler = handler;
	InterruptController.Config->HandlerTable[interrupt_id].CallBackRef = arg;
}

void InterruptController_EnableInterrupt(uint32_t interrupt_id)
{
	XScuGic_Enable(&InterruptController, interrupt_id);
	/*
	 * The Int_Id is used to create the appropriate mask for the
	 * desired bit position. Int_Id currently limited to 0 - 31
	 */
	//u32 Mask = 0x00000001U << (interrupt_id % 32U);

	/*
	 * Enable the selected interrupt source by setting the
	 * corresponding bit in the Enable Set register.
	 */
//	XScuGic_DistWriteReg(&InterruptController, (u32)XSCUGIC_ENABLE_SET_OFFSET +
	//					((interrupt_id / 32U) * 4U), Mask);
}

void InterruptController_DisableInterrupt(uint32_t interrupt_id)
{
	XScuGic_Disable(&InterruptController, interrupt_id);
}

void InterruptController_TriggerSoftwareInterrupt(uint32_t interrupt_id, uint32_t cpu_id)
{
	XScuGic_SoftwareIntr(&InterruptController, interrupt_id, cpu_id);
}

void InterruptController_SetSoftwareInterruptPriority(uint32_t interrupt_id, uint8_t priority)
{
	//software interrupt priorities are spaced by 8 according to data sheet
	XScuGic_SetPriorityTriggerType(&InterruptController, interrupt_id, priority * 8, 0b10);
}

void InterruptController_SetPeripheralInterruptPriority(uint32_t interrupt_id, uint8_t priority)
{
	XScuGic_SetPriorityTriggerType(&InterruptController, interrupt_id, priority * 8, 0b01);
}

void InterruptController_ClearInterrupt(uint32_t interrupt_id)
{
	XScuGic_CPUWriteReg(&InterruptController, XSCUGIC_EOI_OFFSET, interrupt_id);
}
