/* Includes ------------------------------------------------------------------*/

#include "board.h"

/**
  * @brief  delay for some time in ms unit
  * @caller auto_test
  * @param  n_ms is how many ms of time to delay
  * @retval None
  */
void delay_ms(u16 n_ms)
{
  // Init TIMER 2 timebase = 1ms 
  TIM2->PSCR = (u8)(TIM2_PRESCALER_64);
  TIM2->ARRH = 0;
  TIM2->ARRL = 125;

  // Counter value: 2, to compensate the initialization of TIMER
  TIM2->CNTRH = 0;
  TIM2->CNTRL = 0;

  // clear update flag
  TIM2->SR1 &= (u8)(~TIM2_IT_UPDATE);

  // Enable Counter
  TIM2->CR1 |= TIM2_CR1_CEN;

  while(n_ms--)
  {
    while((TIM2->SR1 & TIM2_IT_UPDATE) == 0) ;
    TIM2->SR1 &= (u8)(~TIM2_IT_UPDATE);
  }

  // Disable Counter
  TIM2->CR1 &= (u8)(~TIM2_CR1_CEN);
}

/**
  * @brief  delay for some time in 10us unit(partial accurate)
  * @caller auto_test
  * @param n_10us is how many 10us of time to delay
  * @retval None
  */
void delay_10us(u16 n_10us)
{
  /* Counter value:  to compensate the initialization of TIMER */
  TIM2->CNTRH = 0;
  TIM2->CNTRL = 0;

  /* clear update flag */
  TIM2->SR1 &= (u8)(~TIM2_IT_UPDATE);

  /* Enable Counter */
  TIM2->CR1 |= TIM2_CR1_CEN;

  while(n_10us--)
  {
    while((TIM2->SR1 & TIM2_IT_UPDATE) == 0) ;
    TIM2->SR1 &= (u8)(~TIM2_IT_UPDATE);
  }

  /* Disable Counter */
  TIM2->CR1 &= (u8)(~TIM2_CR1_CEN);
}
/******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/
