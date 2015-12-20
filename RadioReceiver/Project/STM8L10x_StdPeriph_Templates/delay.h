#ifndef _DELAY_H_
#define _DELAY_H_

#include "board.h"

void delay_ms(u16 n_ms);
void delay_4us(u8);

#define DELAY_US( loops ) _asm("$N: \n decw X \n jrne $L \n nop", (u16)loops);

#endif