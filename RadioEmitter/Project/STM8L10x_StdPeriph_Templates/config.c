#include "board.h"

void Config()
{
  //System clock at power up is HSI/8 = 16MHz/8 = 2MHz
  //CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);  //set HSI/4 = 4MHz SysClk to Core and Memory, minimum clock = 125KHz for CLK_SYSCLKDiv_128
  
  //Configure external interrupts - BTN1 and BTN2 presses
  EXTI_SetPinSensitivity(EXTI_Pin_1, EXTI_Trigger_Falling_Low);
  EXTI_SetPinSensitivity(EXTI_Pin_2, EXTI_Trigger_Falling_Low);

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