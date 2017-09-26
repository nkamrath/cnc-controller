#ifndef _DRIVERS_INTERRUPT_CONTROLLER_H_
#define _DRIVERS_INTERRUPT_CONTROLLER_H_

#include <stdint.h>
#include <stdlib.h>

#include "xscugic.h"

#define INTERRUPT_CONTROLLER_ID			XPAR_SCUGIC_SINGLE_DEVICE_ID

//the blow defines can not reside in function calls
#define InterruptController_EnableNestedInterrupts Xil_EnableNestedInterrupts
#define InterruptController_DisableNestedInterrupts Xil_DisableNestedInterrupts

void InterruptController_Init(void);
void InterruptController_EnableInterrupts(void);
void InterruptController_DisableInterrupts(void);
void InterruptController_SetHandler(uint32_t interrupt_id, void(*handler), void* arg);
void InterruptController_EnableInterrupt(uint32_t interrupt_id);
void InterruptController_DisableInterrupt(uint32_t interrupt_id);

void InterruptController_TriggerSoftwareInterrupt(uint32_t interrupt_id, uint32_t cpu_id);
void InterruptController_SetSoftwareInterruptPriority(uint32_t interrupt_id, uint8_t priority);
void InterruptController_SetPeripheralInterruptPriority(uint32_t interrupt_id, uint8_t priority);

void InterruptController_ClearInterrupt(uint32_t interrupt_id);

#endif
