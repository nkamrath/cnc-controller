#ifndef _UTILS_CDP_PACKET_HANDLER_H
#define _UTILS_CDP_PACKET_HANDLER_H

#include "network/cdp/cdp_data_item.h"

typedef void(*cdp_handler_callback_t)(uint8_t* data, uint16_t length);

void CdpPacketHandler_Create(void);
bool CdpPacketHandler_RegisterRxCallback(uint16_t packet_type, cdp_handler_callback_t callback);
void CdpPacketHandler_SendDataItem(cdp_data_item_t* data_item);

#endif
