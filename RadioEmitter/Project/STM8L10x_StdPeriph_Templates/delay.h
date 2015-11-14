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
#define DELAY20MS_START    { CLK->PCKENR |= CLK_Peripheral_TIM3;                                 \
                             TIM3->CR1 = (u8)0x00;                                               \
                             TIM3->PSCR  = TIM3_Prescaler_128;   /*64us step*/                   \
                             TIM3->ARRH  = (u8)0x01;                                             \
                             TIM3->ARRL  = (u8)0x39;             /* 0x139=313*64us=20.032ms */   \
                             TIM3->CNTRH = (u8)0x00;                                             \
                             TIM3->CNTRL = (u8)0x00;                                             \
                             TIM3->EGR = 0x01;                                                   \
                             TIM3->BKR = TIM_BKR_RESET_VALUE;                                    \
                             TIM3->SR1 = TIM_SR1_RESET_VALUE;                                    \
                             TIM3->CR1 = TIM_CR1_CEN;                                            \
                           }
#define DELAY50MS_START    { CLK->PCKENR |= CLK_Peripheral_TIM3;                                 \
                             TIM3->CR1 = (u8)0x00;                                               \
                             TIM3->PSCR  = TIM3_Prescaler_128;   /*64us step*/                   \
                             TIM3->ARRH  = (u8)0x03;                                             \
                             TIM3->ARRL  = (u8)0x01;             /* 0x301=769*64us=49.216ms */ \
                             TIM3->CNTRH = (u8)0x00;                                             \
                             TIM3->CNTRL = (u8)0x00;                                             \
                             TIM3->EGR = 0x01;                                                   \
                             TIM3->BKR = TIM_BKR_RESET_VALUE;                                    \
                             TIM3->SR1 = TIM_SR1_RESET_VALUE;                                    \
                             TIM3->CR1 = TIM_CR1_CEN;                                            \
                           }
#define DELAY100MS_START    {CLK->PCKENR |= CLK_Peripheral_TIM3;                                 \
                             TIM3->CR1 = (u8)0x00;                                               \
                             TIM3->PSCR  = TIM3_Prescaler_128;   /*64us step*/                   \
                             TIM3->ARRH  = (u8)0x06;                                             \
                             TIM3->ARRL  = (u8)0x1B;             /* 0x61B=1563*64us=100.032ms */ \
                             TIM3->CNTRH = (u8)0x00;                                             \
                             TIM3->CNTRL = (u8)0x00;                                             \
                             TIM3->EGR = 0x01;                                                   \
                             TIM3->BKR = TIM_BKR_RESET_VALUE;                                    \
                             TIM3->SR1 = TIM_SR1_RESET_VALUE;                                    \
                             TIM3->CR1 = TIM_CR1_CEN;                                            \
                           }
#define DELAY_STOP        { TIM3->CR1 &= (u8)(~TIM_CR1_CEN);                                             \
                            /*CLK->PCKENR &= (u8)(~CLK_Peripheral_TIM3);*/  /* Stop TIM3 peripheral clock */ \
                          }
#define DELAY_US_STOP     {TIM4->CR1 &= (u8)(~TIM4_CR1_CEN);}
#define DELAY_EXPIRED     ((TIM3->SR1 & TIM_SR1_UIF) != 0)
#define DELAY_CLEAR       (TIM4->SR1 &= (u8)(~TIM4_IT_Update))
#define WAIT_US_DELAY     {while(!DELAY_EXPIRED); \
                           DELAY_US_STOP;         \
                          }

void delay_ms(u16 n_ms);
void delay_4us(u8);

#define DELAY_US( loops ) _asm("$N: \n decw X \n jrne $L \n nop", (u16)loops);

#endif