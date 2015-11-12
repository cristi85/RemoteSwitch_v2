#ifndef _DELAY_H_
#define _DELAY_H_

#include "board.h"

#define DELAY_US_START(x)  {TIM4->CR1 &= (u8)(~TIM4_CR1_CEN);                   \
                            TIM4->ARR = (u8)x;                                  \
                            TIM4->CNTR = 0;                                     \
                            TIM4->SR1 &= (u8)(~TIM4_IT_Update);                 \
                            TIM4->CR1 |= TIM4_CR1_CEN;                          \
                           }
#define DELAY_SET(x)       TIM4->ARR = (u8)x;
#define DELAY_START        TIM4->CR1 |= TIM4_CR1_CEN;
#define DELAY20MS_START    {CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);  \
                             /* Init TIM4 to give Update event after 20.48ms */      \
                             /* Increment TIM4 every 1.024ms (for 2MHz clock) */     \
                             TIM4->PSCR = (u8)(TIM4_Prescaler_2048);                 \
                             TIM4->ARR = 20;  /* 20 * 1.024ms = 20.48 ms */          \
                             TIM4->CNTR = 0;                                         \
                             TIM4->SR1 &= (u8)(~TIM4_IT_Update);                     \
                             TIM4->CR1 |= TIM4_CR1_CEN;                              \
                            }
#define DELAY_STOP        { TIM4->CR1 &= (u8)(~TIM4_CR1_CEN);                       \
                            CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);  /* Stop TIM4 peripheral clock */ \
                          }
#define DELAY_US_STOP     {TIM4->CR1 &= (u8)(~TIM4_CR1_CEN);}
#define DELAY_EXPIRED     ((TIM4->SR1 & TIM4_IT_Update) != 0)
#define DELAY_CLEAR       (TIM4->SR1 &= (u8)(~TIM4_IT_Update))
#define WAIT_US_DELAY     {while(!DELAY_EXPIRED); \
                           DELAY_US_STOP;         \
                          }

void delay_ms(u16 n_ms);
void delay_4us(u8);

#define DELAY_US( loops ) _asm("$N: \n decw X \n jrne $L \n nop", (u16)loops);

#endif