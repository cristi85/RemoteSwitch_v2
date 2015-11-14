#include "board.h"

void Config()
{
  //System clock at power up is HSI/8 = 16MHz/8 = 2MHz
  
  //Configure external interrupts - BTN1 and BTN2 presses
  EXTI_SetPinSensitivity(EXTI_Pin_1, EXTI_Trigger_Falling_Low);
  EXTI_SetPinSensitivity(EXTI_Pin_2, EXTI_Trigger_Falling_Low);

  /*TIM3_TimeBaseInit(TIM3_Prescaler_128,
                    TIM3_CounterMode_Up,
                    313);*/
  //TIM3_UpdateDisableConfig(DISABLE);
  //TIM3_UpdateRequestConfig(TIM3_UpdateSource_Global);
  //TIM3_ARRPreloadConfig(DISABLE);
  //TIM3_ITConfig(TIM3_IT_Update | TIM3_IT_CC1 | TIM3_IT_CC2 | TIM3_IT_Trigger | TIM3_IT_Break, DISABLE);

  /* Input FL IT - onboard Button, external pull-up */
  GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_IT);
  GPIO_Init(BTN2_PORT, BTN2_PIN, GPIO_Mode_In_FL_IT);
  
  /* RFM85W pins */
  GPIO_Init(RFM_DATA_PORT, RFM_DATA_PIN, GPIO_Mode_Out_PP_Low_Fast);
  GPIO_Init(RFM_ON_PORT,   RFM_ON_PIN,   GPIO_Mode_Out_PP_Low_Fast);
  
  /* Output PP High - bicolor LED to GND */
  GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);

  RFM_OFF;
  RFM_DATA(0);
}