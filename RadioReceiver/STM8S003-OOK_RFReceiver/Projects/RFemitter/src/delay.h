#ifndef _DELAY_H_
#define _DELAY_H_

#include "board.h"

void delay_ms(u16);
void delay_10us(u16);

/* 
  Delay constants for 8MHz SYSCLK
  1us   - 2,56
  10us  - 25,6
  100us - 256
  1ms   - 2560

  Measurements:
  DELAY_US(1)   - 1.12us
  DELAY_US(2)   - 2.23us
  DELAY_US(5)   - 4.86us
  DELAY_US(10)  - 9.702us
  DELAY_US(20)  - 19.41us
  DELAY_US(50)  - 48.14us
  DELAY_US(100) - 95.9us
*/


#define DELAY_US(loops) _asm("$N: \n decw X \n jrne $L \n nop", (u16)(loops*2.56));

#endif