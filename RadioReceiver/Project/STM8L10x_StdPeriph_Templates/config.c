#include "board.h"

void Config()
{
  //System clock at power up is HSI/8 = 16MHz/8 = 2MHz
  //CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);  //set HSI/4 = 4MHz SysClk to Core and Memory, minimum clock = 125KHz for CLK_SYSCLKDiv_128
  //PWR_PVDCmd(ENABLE);  //Power voltage detector and brownout Reset unit supply current 2,6uA
  //PWR_PVDLevelConfig(PWR_PVDLevel_2V26); //set Programmable voltage detector threshold to 2,26V
  //PWR_GetFlagStatus(PWR_FLAG_PVDOF);  //checks whether the specified PWR flag is set or not
  
  //Configure external interrupts - BTN1 and BTN2 presses
  //EXTI_SetPinSensitivity(EXTI_Pin_2, EXTI_Trigger_Falling_Low);
  //EXTI_SetPinSensitivity(EXTI_Pin_4, EXTI_Trigger_Falling_Low);
  //EXTI_SelectPort(EXTI_Port_B);
  //EXTI_SetHalfPortSelection(EXTI_HalfPort_B_MSB, ENABLE);
  
  // Timer 4 Configuration
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);   // 8bit: used for system periodic flags and timeouts
  TIM4_TimeBaseInit(TIM4_Prescaler_16, 125);                // Overflow at 1ms, 2MHz/16/125 = 1000
  TIM4_ITConfig(TIM4_IT_Update, ENABLE);
  TIM4_Cmd(ENABLE);

  // Timer 2 Configuration
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);           // 16bit: used for runtime measurement
  TIM2_TimeBaseInit(TIM2_Prescaler_2, TIM2_CounterMode_Up, 0xFFFF); // timebase of 1us, 2MHz/2=1M
  TIM2_Cmd(ENABLE);
  
  // Timer3 Configuration
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
  TIM3_TimeBaseInit(TIM3_Prescaler_2, TIM3_CounterMode_Up, 0xFFFF);  // 1us timebase @ 2MHz system clock
  TIM3_ICInit(TIM3_Channel_2,
              TIM3_ICPolarity_Falling,
              TIM3_ICSelection_IndirectTI,
              TIM3_ICPSC_Div1,
              0);
  TIM3_ICInit(TIM3_Channel_1,
              TIM3_ICPolarity_Rising,
              TIM3_ICSelection_DirectTI,
              TIM3_ICPSC_Div1,
              0);
  TIM3_SelectInputTrigger(TIM3_TRGSelection_TI1FP1);
  TIM3_SelectSlaveMode(TIM3_SlaveMode_Reset);  // Reset timer on selected trigger signal
  TIM3_ITConfig(TIM3_IT_CC1, ENABLE);
  TIM3_ITConfig(TIM3_IT_CC2, ENABLE);
  TIM3_Cmd(ENABLE);
  
  /* Output PP High - bicolor LED to GND */
  GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
  GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);

  /* Input pull up no IT - onboard Button, external pull-up */
  GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_No_IT);
  
  /* RFM83L pins */
  GPIO_Init(RFM_DATA_PORT, RFM_DATA_PIN, GPIO_Mode_In_FL_No_IT);
  
  /* DEBUG pin */
  GPIO_Init(DEBUG_PIN_PORT, DEBUG_PIN_PIN, GPIO_Mode_Out_PP_Low_Fast);

  /* Light ON outputs */
  GPIO_Init(LIGHT_ON_PORT,  LIGHT_ON_PIN,    GPIO_Mode_Out_PP_High_Fast);
}
