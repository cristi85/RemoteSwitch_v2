#include "board.h"

void Config()
{
  /* Fmaster = 8MHz, HSI */
  CLK_DeInit();
  CLK_CCOCmd(FALSE);
  CLK_HSICmd(ENABLE);
  while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);  //wait until HSI not ready
  CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);             //set HSI prescaler to 2, 16/2 = 8 MHz
  //CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);     //same functionality as above
  CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  CLK_FastHaltWakeUpCmd(ENABLE);                       //this automatically selects the HSI clock as master clock after MCU wakeup from Halt or Active-halt
  
  CLK_AdjustHSICalibrationValue(CLK_HSITRIMVALUE_7);  
  CLK_CCOConfig(CLK_OUTPUT_CPUDIV64);  // 125.5KHz
  CLK_CCOCmd(ENABLE);
  
  /* Enable peripheral clock */
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);   /* 8bit: timeouts */
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);   /* delay_10us */
  CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);   /* RF pulses measurement */

  // INPUT - Button
  GPIO_Init(BTN_PORT, BTN_PIN, GPIO_MODE_IN_FL_NO_IT);

  // OUTPUT PP low - LED
  GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  
  /* Input with weak pull-up - RF receive pin*/
  GPIO_Init(RFRCV_PORT, RFRCV_PIN, GPIO_MODE_IN_FL_NO_IT);         /* RF receive timer trigger reset and capture pin(falling) - input pullup */
  
  // OUTPUT PP fast - Test pin
  //GPIO_Init(TESTPIN_PORT, TESTPIN_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  
  // LCD RS - digital OUTPUT
  GPIO_Init(LCD_RS_PORT, LCD_RS_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  // LCD E - digital OUTPUT
  GPIO_Init(LCD_EN_PORT, LCD_EN_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  // LCD D4 - digital OUTPUT
  GPIO_Init(LCD_D4_PORT, LCD_D4_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  // LCD D5 - digital OUTPUT
  GPIO_Init(LCD_D5_PORT, LCD_D5_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  // LCD D6 - digital OUTPUT
  GPIO_Init(LCD_D6_PORT, LCD_D6_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  // LCD D7 - digital OUTPUT
  GPIO_Init(LCD_D7_PORT, LCD_D7_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  
  // TIMER4 configuration
  TIM4_DeInit();
  TIM4_TimeBaseInit(TIM4_PRESCALER_64, 250);   // 2MS overflow interval
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
  TIM4_Cmd(ENABLE);

  // TIMER2 configuration
  TIM2_DeInit();
  TIM2_ITConfig(TIM2_IT_UPDATE, DISABLE);
  TIM2_TimeBaseInit(TIM4_PRESCALER_2, 40);   // 10us overflow interval
  TIM2_Cmd(DISABLE);

  /* TIMER1 configuration  - RF receive bit timing
     Timer configured in Trigger standard mode
     Timer is started by falling edge of input, 
     on the following falling edge of input we make a capture
  */
  TIM1_DeInit();
  TIM1_TimeBaseInit(7, TIM1_COUNTERMODE_UP, 4000, 0x00);    // 4ms overflow period, 1us resolution                                                        
  TIM1->SMCR |= 0x04;                                        // Slave mode control register
                                                             // Clock/trigger/slave mode selection, SMS = 100
                                                             // 100: Reset mode - Rising edge of the selected trigger signal (TRGI) re-initializes the counter and
                                                             // generates an update of the registers
                                                             // 110: Trigger standard mode - The counter starts at a rising edge of the trigger TRGI (but, it is not
                                                             // reset). Only the start of the counter is controlled.
                                                             
  TIM1->SMCR |= 0x60;                                        // Slave mode control register, Trigger selection, TS = 110
                                                             // 101: Filtered timer input 1 (TI1FP1)
                                                             // 110: Filtered timer input 2 (TI2FP2)
                                                             
  TIM1->CCMR2 |= 0x01;                                       // Capture/compare mode register 2, CC2S[1:0]: Capture/compare 2 selection, CC2S = 01
                                                             // 00: CC2 channel is configured as output
                                                             // 01: CC2 channel is configured as input, IC2 is mapped on TI2FP2
                                                             // 10: CC2 channel is configured as input, IC2 is mapped on TI1FP2
  
  TIM1->CCER1 |= 0x10;                                       // Capture/compare enable register 1, CC2E = 1
  /*TIM1->CCER1 &= (u8)(~(0x10));*/                          // Capture/compare enable register 1, CC2E = 0
                                                             // CC2E: Capture/compare 1 output enable, CC1 channel is configured as input: This bit determines 
                                                             // if a capture of the counter value can be made in the input capture/compare register 2 (TIM1_CCR2) or not.
                                                             // 0: Capture disabled
                                                             // 1: Capture enabled
                                                             
  TIM1->CCER1 |= (u8)(0x20);                                 // Capture/compare enable register 1, CC2P = 1
                                                             // CC2P: Capture/compare 2 output polarity, when CC1 channel configured as input for trigger function: 1: 
                                                             // Trigger on a low level or falling edge of TI1F
                                                             
  /*TIM1->CCMR3 |= 0x01;*/                                   // CC3S[1:0]: Capture/compare 3 selection = 01: CC3 channel is configured as input, IC3 is mapped on TI3FP3
  
  /*TIM1->CCER2 |= 0x01;*/                                   // CC3E = 1, CC3E: Capture/compare 3 output enable, CC3 channel is configured as input: This bit determines 
                                                             // if a capture of the counter value can be made in the input capture/compare register 3 (TIM1_CCR3) or not.
                                                             
  /*TIM1->CCER2 |= 0x02;*/                                   // CC3P = 1, CC3P: Capture/compare 3 output polarity, CC3 channel configured as input for trigger function: 1: Trigger 
                                                             // on a low level or falling edge of TI1F
                                                             
  //investigate if we can use a single pin for reset trigger and capture
  TIM1_ITConfig(TIM1_IT_CC2, ENABLE);                        // interrupt on timer capture compare 3 - falling edge of pulse
  TIM1_ClearITPendingBit(TIM1_FLAG_CC2);
  TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
  TIM1_Cmd(ENABLE);
}