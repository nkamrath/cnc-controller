#ifndef _DRIVERS_PIN_H
#define _DRIVERS_PIN_H

#include <stdint.h>

/*
 * zynq ps pins on zybo are on JF in the following order
 * ---------------------------------
 * |VCC | GND | 12 | 11 | 10 | 13 |
 * ---------------------------------
 * |VCC | GND | 15 | 14 | 9  | ?  |
 * ---------------------------------
 */

void Pin_ConfigureOutput(uint8_t pin);
void Pin_Set(uint8_t pin);
void Pin_Clear(uint8_t pin);
void Pin_Write(uint8_t pin, uint8_t value);

#endif
