#ifndef _DELAY_H_
#define _DELAY_H_

#include "board.h"

//RF communication - test
#define DELAY_850US  (u16)567    
#define DELAY_400US  (u16)267
#define DELAY_350US  (u16)233
#define DELAY_100US  (u16)60

void delay_ms(u16);


#define DELAY_US( loops ) _asm("$N: \n decw X \n jrne $L \n nop", (u16)loops);

#endif