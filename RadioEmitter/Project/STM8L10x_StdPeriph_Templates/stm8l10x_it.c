/**
  ******************************************************************************
  * @file     Project/STM8L10x_StdPeriph_Templates/stm8l10x_it.c
  * @author   MCD Application Team
  * @version  V1.2.1
  * @date     30-September-2014
  * @brief    This file contains all the interrupt routines.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
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
#include "stm8l10x_it.h"
#include "board.h"
#include "delay.h"
/** @addtogroup STM8L10x_StdPeriph_Templates
  * @{
  */
/* Periodic Tasks */
#define CNTVAL_250MS  (u16)250
_Bool FLAG_250ms = FALSE;
u16 cnt_flag_250ms = 0;
#define CNTVAL_500MS  (u16)500
_Bool FLAG_500ms = FALSE;
u16 cnt_flag_500ms = 0;
#define CNTVAL_1000MS (u16)1000
_Bool FLAG_1000ms = FALSE;
u16 cnt_flag_1000ms = 0;
/*================*/

/* Buttons debouncing and repetition delay */
#define DIG_IN_DEB_TIME   (u8)30    /* 30ms digital input debounce time */
#define BTN_DELAY         (u8)150   //300ms
u8 btn1_0_cnt = 0;
u8 btn1_1_cnt = 0;
u8 BTN1_DEB_STATE = BTN_DEPRESSED;	
_Bool BTN1_DELAY_FLAG = FALSE;
u8 btn1_delay_cnt = 0;
u16 BTN1_press_timer = 0;
/* External variables */
extern _Bool Timeout_istout1;
extern _Bool Timeout_istout2;
extern _Bool Timeout_istout3;
extern u16 Timeout_toutcnt1;
extern u16 Timeout_toutcnt2;
extern u16 Timeout_toutcnt3;
extern u16 Timeout_tout1;
extern u16 Timeout_tout2;
extern u16 Timeout_tout3;
static volatile u8 interrupt_status;

/* LED Blink */
#define LEDBLINK_ONTIME  (u16)50
#define LEDBLINK_OFFTIME (u16)200
u16 cnt_state_redLED = 0;
u16 cnt_state_greenLED = 0;
u8 cnt_blink_redLED = 0;
u8 cnt_blink_greenLED = 0;
u8 blink_redLED_times = 0;
u8 blink_greenLED_times = 0;
_Bool flag_blink_on_off = TRUE;
_Bool flag_blink_redLED = FALSE;
_Bool flag_blink_greenLED = FALSE;
_Bool flag_blink_unlimited = TRUE;
extern _Bool flag_blink_redLED;
extern _Bool flag_blink_greenLED;
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

#ifdef _COSMIC_
/**
  * @brief  Dummy interrupt routine
  * @param  None
  * @retval None
*/
INTERRUPT_HANDLER(NonHandledInterrupt,0)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
#endif

/**
  * @brief  TRAP interrupt routine
  * @param  None
  * @retval None
*/
INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  FLASH Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(FLASH_IRQHandler,1)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  Auto Wake Up Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(AWU_IRQHandler,4)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  External IT PORTB Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  External IT PORTD Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  External IT PIN0 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  External IT PIN1 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  External IT PIN2 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  External IT PIN3 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  External IT PIN4 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  External IT PIN5 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  External IT PIN6 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)

{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  External IT PIN7 Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  Comparator Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(COMP_IRQHandler, 18)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  Timer2 Update/Overflow/Trigger/Break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
  interrupt_status = 1;
  if(TIM2_GetITStatus(TIM2_IT_Update))  //1ms
  {
    /* ===== CKECK PERIODIC TASKS FLAGS ===== */
    if(cnt_flag_250ms < U16_MAX) cnt_flag_250ms++;
    if(cnt_flag_250ms >= CNTVAL_250MS) 
    {
      cnt_flag_250ms = 0;
      FLAG_250ms = TRUE;
    }
    if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
    if(cnt_flag_500ms >= CNTVAL_500MS) 
    {
      cnt_flag_500ms = 0;
      FLAG_500ms = TRUE;
    }
    if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
    if(cnt_flag_1000ms >= CNTVAL_1000MS) 
    {
      cnt_flag_1000ms = 0;
      FLAG_1000ms = TRUE;
    }
    /* ===== CHECK TIMEOUTS ===== */
    if(!Timeout_istout1)
    {
      Timeout_toutcnt1++;
      if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
    }
    if(!Timeout_istout2)
    {
      Timeout_toutcnt2++;
      if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
    }
    if(!Timeout_istout3)
    {
      Timeout_toutcnt3++;
      if(Timeout_toutcnt3 >= Timeout_tout3) Timeout_istout3 = TRUE;
    }
    /* ========== DEBOUNCE INPUTS ========== 1MS */
    /* Debounce BTN1 */
    if(!BTN1_STATE)
    {
      if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
      btn1_1_cnt = 0;
      if(btn1_0_cnt >= DIG_IN_DEB_TIME)
      {
        BTN1_DEB_STATE = BTN_PRESSED;
      }
    }
    else
    {
      if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
      btn1_0_cnt = 0;
      if(btn1_1_cnt >= DIG_IN_DEB_TIME)
      {
        BTN1_DEB_STATE = BTN_DEPRESSED;
        //BTN1_press_timer = 0;
      }
    }
   
    /* Record button press time */
    if(BTN1_DEB_STATE == BTN_PRESSED)
    {
      if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
    }
    /* Process button repetition rate delays */
    if(!BTN1_DELAY_FLAG)
    {
      btn1_delay_cnt++;
      if(btn1_delay_cnt == BTN_DELAY)
      {
        btn1_delay_cnt = 0;
        BTN1_DELAY_FLAG = TRUE;
      }
    }
    /* ======================================= */
    
    /* Blink LED */
    if(flag_blink_redLED)
    {
      if(cnt_state_redLED < U16_MAX) cnt_state_redLED++;
      if(flag_blink_on_off)
      {
        if(cnt_state_redLED >= LEDBLINK_ONTIME)
        {
          flag_blink_on_off = FALSE;
          cnt_state_redLED = 0;
          LED_OFF;
        }
      }
      else
      {
        if(cnt_state_redLED >= LEDBLINK_OFFTIME)
        {
          if(cnt_blink_redLED < U8_MAX) cnt_blink_redLED++;
          flag_blink_on_off = TRUE;
          cnt_state_redLED = 0;
          if(cnt_blink_redLED >= blink_redLED_times && !flag_blink_unlimited)
          {
            flag_blink_redLED = FALSE;
            cnt_blink_redLED = 0;
          }
          else
          {
            LED_RED_ON;
          }
        }
      }
    }
    if(flag_blink_greenLED)
    {
      if(cnt_state_greenLED < U16_MAX) cnt_state_greenLED++;
      if(flag_blink_on_off)
      {
        if(cnt_state_greenLED >= LEDBLINK_ONTIME)
        {
          flag_blink_on_off = FALSE;
          cnt_state_greenLED = 0;
          LED_OFF;
        }
      }
      else
      {
        if(cnt_state_greenLED >= LEDBLINK_OFFTIME)
        {
          if(cnt_blink_greenLED < U8_MAX) cnt_blink_greenLED++;
          flag_blink_on_off = TRUE;
          cnt_state_greenLED = 0;
          if(cnt_blink_greenLED >= blink_greenLED_times && !flag_blink_unlimited)
          {
            flag_blink_greenLED = FALSE;
            cnt_blink_greenLED = 0;
          }
          else
          {
            LED_GREEN_ON;
          }
        }
      }
    }
    /* ======================================= */
    TIM2_ClearITPendingBit(TIM2_IT_Update);        // clear TIM2 update interrupt flag
  }
  interrupt_status = 0;
}

/**
  * @brief  Timer2 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}


/**
  * @brief  Timer3 Update/Overflow/Trigger/Break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief  Timer3 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief  Timer4 Update/Overflow Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  SPI Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(SPI_IRQHandler, 26)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
/**
  * @brief  USART TX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief  USART RX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}


/**
  * @brief  I2C Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(I2C_IRQHandler, 29)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/

