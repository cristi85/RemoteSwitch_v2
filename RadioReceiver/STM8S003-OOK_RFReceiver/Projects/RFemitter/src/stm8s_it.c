/**
  ******************************************************************************
  * @file     stm8s_it.c
  * @author   MCD Application Team
  * @version  V2.1.0
  * @date     18-November-2011
  * @brief    Main Interrupt Service Routines.
  *           This file provides template for all peripherals interrupt service
  *           routine.
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8s_it.h"
#include "board.h"
#include "timeout.h"
#include "errors.h"


// ===== RF Receive =====
#define RF_START_PULSE_MIN (u16)1100
#define RF_START_PULSE_MAX (u16)1300
#define RF_BITPERIOD_MAX   (u16)1000
#define RF_MIDDLEBIT       (u16)625
#define RF_RCVTIMEOUT      (u8)100
#define RFSYNCVAL          (u16)0x81B3
#define RFRECORDLEN        (u8)30

volatile RFmsg_t RcvRFmsg;
static u8 RFrcvChksum;
u8 RFbytesReady = FALSE;
static u8 RFrcvTimeoutcnt = 0;
static u8 _highB;
static u8 _lowB;
static u8 RF_bits = 0;
static u8 RF_bytes = 0;
static u8 RF_data = 0;
static u16 RF_PulsePeriod = 0;
static volatile u16 temp2[RFRECORDLEN];
static u8 idx_temp2 = 0;
static _Bool flag_RF_StartRec = FALSE;

typedef enum {
          RF_RCVSTATE_WAITSTART  = 0,
          RF_RCVSTATE_REC8BITS   = 1
} RF_rcvState_t;
static RF_rcvState_t RF_rcvState = RF_RCVSTATE_WAITSTART;
_Bool FLAG_UART_cmd_rcv = FALSE;
// ===== END UART Receive =====


// External variables
extern _Bool Timeout_istout1;
extern _Bool Timeout_istout2;
extern _Bool Timeout_istout3;
extern u16 Timeout_toutcnt1;
extern u16 Timeout_toutcnt2;
extern u16 Timeout_toutcnt3;
extern u16 Timeout_tout1;
extern u16 Timeout_tout2;
extern u16 Timeout_tout3;

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/


/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/


/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

#ifdef _COSMIC_
/**
  * @brief Dummy Interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
INTERRUPT_HANDLER(NonHandledInterrupt, 25)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*_COSMIC_*/

/**
  * @brief TRAP Interrupt routine
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
  * @brief Top Level Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TLI_IRQHandler, 0)

{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Auto Wake Up Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(AWU_IRQHandler, 1)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Clock Controller Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(CLK_IRQHandler, 2)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTA Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
{
  /* External interrupt generated from HCS SDA rising edge
  */
}

/**
  * @brief External Interrupt PORTB Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
{
  /* External interrupt generated from Learn Button press (falling edge)
  */
  
}

/**
  * @brief External Interrupt PORTC Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */  
}

/**
  * @brief External Interrupt PORTD Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTE Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#ifdef STM8S903
/**
  * @brief External Interrupt PORTF Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S903*/

#if defined (STM8S208) || defined (STM8AF52Ax)
/**
  * @brief CAN RX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief CAN TX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S208 || STM8AF52Ax */

/**
  * @brief SPI Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(SPI_IRQHandler, 10)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Timer1 Update/Overflow/Trigger/Break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
  //while(1);
}

/**
  * @brief Timer1 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
  if(TIM1->SR1 & TIM1_IT_CC2)
  {
    RFrcvTimeoutcnt = 0;  // reset RF timeout counter
    _highB = TIM1->CCR2H;
    _lowB = TIM1->CCR2L;
    RF_PulsePeriod = (u16)(_lowB);
    RF_PulsePeriod |= (u16)((u16)_highB << 8);
    
    if(flag_RF_StartRec)
    {
      if(idx_temp2 < RFRECORDLEN)
      {
        temp2[idx_temp2++] = RF_PulsePeriod;
      }
    }
    
    switch(RF_rcvState)
    {
      case RF_RCVSTATE_WAITSTART: 
      {
        // wait for a start pulse (1.25ms)
        if(RF_PulsePeriod > RF_START_PULSE_MIN && RF_PulsePeriod < RF_START_PULSE_MAX)
        {
          RF_bits = 0;
          RF_bytes = 0;
          RF_data = 0;
          RF_rcvState = RF_RCVSTATE_REC8BITS;
        }
        break;
      }
      case RF_RCVSTATE_REC8BITS:
      {
        // now we had a start pulse, record 8 bits
        if(RF_PulsePeriod >= RF_BITPERIOD_MAX) 
        {
          // unexpected start pulse, reset data recording
          RF_bits = 0;
          RF_bytes = 0;
          RF_data = 0;
          flag_RF_StartRec = FALSE;
        }
        else
        {
          if(RF_PulsePeriod >= RF_MIDDLEBIT)   // 0 bit = 500uS, 1 bit = 750uS
          {
            // record 1 bit, else a 0 will be shifted and therefore recorded
            RF_data |= 0x01;
          }
          RF_bits++;
          if(RF_bits < 8) RF_data <<= 1;
          if(RF_bits == 8)
          {
            u8 i;
            RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
            RF_bits = 0;
            RF_data = 0;
            if(RF_bytes == 2)
            {
              if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
              {
                /* not the expected package */
                flag_RF_StartRec = FALSE;
                RF_rcvState = RF_RCVSTATE_WAITSTART;
              }
              else
              {
                flag_RF_StartRec = TRUE;
                idx_temp2 = 0;
              }
            }
            if(RF_bytes == RFSEND_DATALEN) 
            {
              RFrcvChksum = 0;
              for(i=0;i<RFSEND_DATALEN-1;i++)
              {
                RFrcvChksum += RcvRFmsg.RFmsgarray[i];
              }
              RFrcvChksum = (u8)(~RFrcvChksum);
              if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
              {
                RFbytesReady = TRUE;  // set new RF data available flag
              }
              flag_RF_StartRec = FALSE;
              RF_rcvState = RF_RCVSTATE_WAITSTART;
            }
          }
        }
        break;
      }
      default: break;
    }
    
    TIM1->SR1 = (u8)(~(u8)TIM1_IT_CC2);
  }
}

#ifdef STM8S903
/**
  * @brief Timer5 Update/Overflow/Break/Trigger Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM5_UPD_OVF_BRK_TRG_IRQHandler, 13)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Timer5 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM5_CAP_COM_IRQHandler, 14)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#else /*STM8S208, STM8S207, STM8S105 or STM8S103 or STM8AF62Ax or STM8AF52Ax or STM8AF626x */
/**
* @brief Timer2 Update/Overflow/Break Interrupt routine.
* @param  None
* @retval None
*/
INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
{
  /* In order to detect unexpected events during development,
  it is recommended to set a breakpoint on the following instruction.
  */
}

/**
* @brief Timer2 Capture/Compare Interrupt routine.
* @param  None
* @retval None
*/
INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
{
  /* In order to detect unexpected events during development,
  it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S903*/

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \
    defined(STM8S005) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8AF626x)
/**
  * @brief Timer3 Update/Overflow/Break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Timer3 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S208, STM8S207 or STM8S105 or STM8AF62Ax or STM8AF52Ax or STM8AF626x */

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S103) || \
    defined(STM8S003) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8S903)
/**
  * @brief UART1 TX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief UART1 RX Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
{
  while(1)
  {
	  
  }
}
#endif /*STM8S208 or STM8S207 or STM8S103 or STM8S903 or STM8AF62Ax or STM8AF52Ax */

/**
  * @brief I2C Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(I2C_IRQHandler, 19)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#if defined(STM8S105) || defined(STM8S005) ||  defined (STM8AF626x)
/**
  * @brief UART2 TX interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief UART2 RX interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /* STM8S105 or STM8AF626x */

#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
/**
  * @brief UART3 TX interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief UART3 RX interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */

#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
/**
  * @brief ADC2 interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#else /*STM8S105, STM8S103 or STM8S903 or STM8AF626x */
/**
* @brief ADC1 interrupt routine.
* @par Parameters:
* None
* @retval
* None
*/
INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
{
  /* In order to detect unexpected events during development,
  it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */

#ifdef STM8S903
/**
  * @brief Timer6 Update/Overflow/Trigger Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#else /*STM8S208, STM8S207, STM8S105 or STM8S103 or STM8AF52Ax or STM8AF62Ax or STM8AF626x */
/**
* @brief Timer4 Update/Overflow Interrupt routine.
* @param  None
* @retval None
*/
INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)     /* once every 2MS */
{
  /* In order to detect unexpected events during development,
  it is recommended to set a breakpoint on the following instruction.
  */
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
   /* ======= RF RECEIVE TIMEOUT ======= */
   if(RFrcvTimeoutcnt < 255) RFrcvTimeoutcnt++;
   if(RFrcvTimeoutcnt >= RF_RCVTIMEOUT)
   {
     RF_rcvState = RF_RCVSTATE_WAITSTART;
   }
   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
}
#endif /*STM8S903*/

/**
  * @brief Eeprom EEC Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/