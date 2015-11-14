/**
  ******************************************************************************
  * @file    Project/STM8L15x_StdPeriph_Template/main.c
  * @author  MCD Application Team
  * @version V1.6.0
  * @date    28-June-2013
  * @brief   Main program body
  ******************************************************************************
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */  
	
/* Includes ------------------------------------------------------------------*/
#include "board.h"
#include "stm8l10x_it.h"
#include "config.h"
#include "delay.h"
#include "errors.h"
#include "rf_send.h"

/* Private define ------------------------------------------------------------*/
/* Private typedef -----------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
static void Goto_HALT(void);
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
  disableInterrupts();
  Config();
  enableInterrupts();
  Goto_HALT();
  
  while (1)
  {
    if((btn_pressed != BUTTON1) && (btn_pressed != BUTTON2)) {
      DELAY_STOP;
      goto sleep;
    }
    
    while(! DELAY_EXPIRED);           // wait for power-up delay to expire (~20ms)
    DELAY_STOP;
    disableInterrupts();
    if(btn_pressed == BUTTON1) {
      LED_GREEN_ON;
      RF_Send(RFCMD_LOAD_ON);
      LED_OFF;
      DELAY50MS_START;
      while(! DELAY_EXPIRED);
      DELAY_STOP;
      LED_GREEN_ON;
      RF_Send(RFCMD_LOAD_ON);
      LED_OFF;
    }
    else if(btn_pressed = BUTTON2) {
      LED_GREEN_ON;
      RF_Send(RFCMD_LOAD_OFF);
      LED_OFF;
      DELAY50MS_START;
      while(! DELAY_EXPIRED);
      DELAY_STOP;
      LED_GREEN_ON;
      RF_Send(RFCMD_LOAD_OFF);
      LED_OFF;
    }
    enableInterrupts();
    
    sleep:
    Goto_HALT();
  }
}

static void Goto_HALT()
{
  // Prepare for HALT mode
  LED_OFF;
  RFM_OFF;
  RFM_DATA(0);
  btn_pressed = 0;
  CLK->PCKENR = 0x00; //Stop all peripheral clocks
  halt();             //go to HALT mode
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
