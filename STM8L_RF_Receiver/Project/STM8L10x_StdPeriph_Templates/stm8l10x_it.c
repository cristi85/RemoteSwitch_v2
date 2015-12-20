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
#include "rtms.h"
/** @addtogroup STM8L10x_StdPeriph_Templates
  * @{
  */
/* Periodic Tasks */
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
volatile u8 debug = 0;

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

// ===== RF Receive =====
#define RF_RCVTIMEOUT     (u8)100     // 100ms
#define RFSYNCVAL         (u16)0xA55A
#define RF_REC_LEN        (u8)50

// START pulse is accepted between 200us and 8ms
// bit time will be between 100us and 5ms
// baudrate will be between 10kbps and 200bps
#define RF_STARTTIME_LOW  (u16)200     // 200us 
#define RF_STARTTIME_HIGH (u16)10000   // 10ms
//#define RF_DEFAULTBITTIME (u16)500   // 500us

static u16 cap_rise, cap_fall;
static u8  FLAG_rise_edge = FALSE;
static u8  FLAG_fall_edge = FALSE;
static u8  FLAG_CC_Error = FALSE;
static u16 rf_bittime = 0;      
static u16 rf_halfbittime = 0;
static u16 rf_edges_jitter = 0;
static u16 rf_low_time = 0;
static u16 rf_high_time = 0;
static u16 rf_offset = 0;
volatile u16 rcv_buff[RF_REC_LEN];
volatile u8 idx = 0;
volatile RFmsg_t RcvRFmsg;
static u8 RFrcvChksum;
u8 RFbytesReady = FALSE;
static u8 RFrcvTimeoutcnt = 0;
static u8 RF_bits = 0;
static u8 RF_bytes = 0;
static u8 RF_data = 0;
typedef enum {
          RF_RCVSTATE_WAITSTART = 0,
          RF_RCVSTATE_RECBITS   = 1
} RF_rcvState_t;
typedef enum {
          RF_WAITSTART_WAITSTARTPULSE = 2,
          RF_WAITSTART_WAITNEXTEDGE   = 3
} RF_waitstart_substate_t;
RF_waitstart_substate_t RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
static RF_rcvState_t RF_rcvState = RF_RCVSTATE_WAITSTART;
_Bool FLAG_UART_cmd_rcv = FALSE;
static u8 templ, temph;

RTMS_DECLARE_EXTERN(runtime_it_1ms);
RTMS_DECLARE_EXTERN(runtime_it_RFrcv);

//static volatile u8 test_cnt = 0;
//static volatile test = 0;
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
  * @brief  Timer3 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
{
  /* - cap_rise - timer value on rising edge  (contains signal period time)
     - cap_fall - timer value on falling edge (contains signal high time)
     - timer is reset on rising edge     */
  // _|-|_|-|_|--|__|--|__|--|_
  //  | P | P |  S |1 |0 |1 |
  // _|-|_|-|_|--|_|-|__|--|_
  //  | P | P |  S |0 |1 |0 |
  RTMS_MEASURE_START(runtime_it_RFrcv);
  //if(TIM3_GetITStatus(TIM3_IT_CC1) == SET) {
  if((u8)(TIM3->SR1 & (u8)TIM3_IT_CC1)) {
    cap_rise = TIM3_GetCapture1();
    /*temph = TIM3->CCR1H;
    templ = TIM3->CCR1L;
    cap_rise = (u16)(templ);
    cap_rise |= (u16)((u16)temph << 8);*/
    FLAG_rise_edge = TRUE;
  }
  else FLAG_rise_edge = FALSE;
  //if(TIM3_GetITStatus(TIM3_IT_CC2) == SET) {
  if((u8)(TIM3->SR1 & (u8)TIM3_IT_CC2)) {
    cap_fall = TIM3_GetCapture2();
    /*temph = TIM3->CCR2H;
    templ = TIM3->CCR2L;
    cap_rise = (u16)(templ);
    cap_rise |= (u16)((u16)temph << 8);*/
    FLAG_fall_edge = TRUE;
  }
  else FLAG_fall_edge = FALSE;
  if(FLAG_rise_edge && FLAG_fall_edge) {
    FLAG_CC_Error = TRUE;
  }
  
  RFrcvTimeoutcnt = 0;
  switch(RF_rcvState)
  {
    case RF_RCVSTATE_WAITSTART:
    {
      switch(RF_waitstart_substate)
      {
        case RF_WAITSTART_WAITSTARTPULSE:
        {
          DEBUG_PIN_ON;
          if(FLAG_fall_edge)
          {
            if(cap_fall <= RF_STARTTIME_HIGH && cap_fall >= RF_STARTTIME_LOW)
            {
              // if a start pulse is found
              rf_bittime = cap_fall >> 1;            // bit time is half of start time
              rf_halfbittime = rf_bittime >> 1;      // half of bit time
              rf_edges_jitter = rf_halfbittime >> 1; // maximum accepted edges jitter is a quarter bit time
              RF_bits = 0;
              RF_bytes = 0;
              RF_data = 0;
              RF_waitstart_substate = RF_WAITSTART_WAITNEXTEDGE;
              if(idx < RF_REC_LEN) rcv_buff[0] = cap_fall;
            }
          }
          break;
        }
        case RF_WAITSTART_WAITNEXTEDGE:
        {
          DEBUG_PIN_ON;
          if(FLAG_rise_edge)
          {
            rf_low_time = cap_rise-cap_fall;
            if(rf_low_time <= rf_bittime+rf_edges_jitter && rf_low_time >= rf_bittime-rf_edges_jitter)
            {
              //found "1" bit
              RF_data |= 0x01;
              RF_bits++;
              RF_data <<= 1;
              rf_offset = 0;
              idx = 2;
              rcv_buff[1] = rf_low_time;
              RF_rcvState = RF_RCVSTATE_RECBITS;
            }
            else if(rf_low_time <= rf_halfbittime+rf_edges_jitter && rf_low_time >= rf_halfbittime-rf_edges_jitter)
            {
              rf_offset = rf_low_time;
              idx = 2;
              RF_rcvState = RF_RCVSTATE_RECBITS;
            }
            else
            {
              // invalid edge timing after start pulse, search for start pulse again
              RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
            }
          }
          break;
        }
        default: break;
      }
      break;
    }
    case RF_RCVSTATE_RECBITS:
    {
      DEBUG_PIN_OFF;
      // ----- pulse duration logging -----
      if(idx < RF_REC_LEN)
      {
        if(FLAG_rise_edge) rcv_buff[idx++] = cap_rise-cap_fall;
        else rcv_buff[idx++] = cap_fall;
      }
      // ----- END pulse duration logging -----
      
      // now we had a start pulse, record 8 bits
      if(FLAG_rise_edge)
      {
        rf_low_time = cap_rise-cap_fall;
        if(rf_low_time+rf_offset <= rf_bittime+rf_edges_jitter && rf_low_time+rf_offset >= rf_bittime-rf_edges_jitter)
        {
          rf_bittime = ((rf_low_time+rf_offset) + rf_bittime) >> 1; // new bit time is arithmetic mean between old bit time and new bit time
          rf_halfbittime = rf_bittime >> 1;                         // half of bit time
          rf_edges_jitter = rf_halfbittime >> 1;                    // half of half bit time
          //found "1" bit
          RF_data |= 0x01;
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
                RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
                RF_rcvState = RF_RCVSTATE_WAITSTART;
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
              RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
              RF_rcvState = RF_RCVSTATE_WAITSTART;
            }
          }
          rf_offset = 0;
        }
        else if(rf_low_time <= rf_halfbittime+rf_edges_jitter && rf_low_time >= rf_halfbittime-rf_edges_jitter)
        {
          rf_offset = rf_low_time;
        }
        else
        {
          RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
          RF_rcvState = RF_RCVSTATE_WAITSTART;
        }
      }
      else if(FLAG_fall_edge)
      {
        rf_high_time = cap_fall;
        if(rf_high_time+rf_offset <= rf_bittime+rf_edges_jitter && rf_high_time+rf_offset >= rf_bittime-rf_edges_jitter)
        {
          rf_bittime = ((rf_high_time+rf_offset) + rf_bittime) >> 1; // new bit time is arithmetic mean between old bit time and new bit time
          rf_halfbittime = rf_bittime >> 1;                          // half of bit time
          rf_edges_jitter = rf_halfbittime >> 1;                     // half of half bit time
          //found "0" bit
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
                RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
                RF_rcvState = RF_RCVSTATE_WAITSTART;
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
              RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
              RF_rcvState = RF_RCVSTATE_WAITSTART;
            }
          }
          rf_offset = 0;
        }
        else if(rf_high_time <= rf_halfbittime+rf_edges_jitter && rf_high_time >= rf_halfbittime-rf_edges_jitter)
        {
          rf_offset = rf_high_time;
        }
        else if(rf_high_time <= RF_STARTTIME_HIGH && rf_high_time >= RF_STARTTIME_LOW)
        {
          // found a start pulse, reset decoding algorithm
          rf_bittime = cap_fall >> 1;            // bit time is half of start time
          rf_halfbittime = rf_bittime >> 1;      // half of bit time
          rf_edges_jitter = rf_halfbittime >> 1; // maximum accepted edges jitter is a quarter bit time
          RF_bits = 0;
          RF_bytes = 0;
          RF_data = 0;
          if(idx < RF_REC_LEN)
          rcv_buff[0] = cap_fall;
          RF_waitstart_substate = RF_WAITSTART_WAITNEXTEDGE;
          RF_rcvState = RF_RCVSTATE_WAITSTART;
        }
      }
      break;
    }
    default: break;
  }
  //TIM3_ClearITPendingBit(TIM3_IT_CC1);
  TIM3->SR1 = (u8)(~(u8)TIM3_IT_CC1);
  //TIM3_ClearITPendingBit(TIM3_IT_CC2);
  TIM3->SR1 = (u8)(~(u8)TIM3_IT_CC2);
  RTMS_MEASURE_STOP(runtime_it_RFrcv);
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
  RTMS_MEASURE_START(runtime_it_1ms);
  interrupt_status = 1;
  if((u8)(TIM4->SR1 & (u8)TIM4_IT_Update))  //1ms
  {
    /* ===== CKECK PERIODIC TASKS FLAGS ===== */
    /*if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
    if(cnt_flag_500ms >= CNTVAL_500MS) 
    {
      cnt_flag_500ms = 0;
      FLAG_500ms = TRUE;
    }*/
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
    /* CHECK RF COMM TIMEOUT */
    if(RFrcvTimeoutcnt < 255) RFrcvTimeoutcnt++;
    if(RFrcvTimeoutcnt >= RF_RCVTIMEOUT)
    {
      RF_waitstart_substate = RF_WAITSTART_WAITSTARTPULSE;
      RF_rcvState = RF_RCVSTATE_WAITSTART;
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
    TIM4->SR1 = (u8)(~(u8)TIM4_IT_Update);       // clear TIM4 update interrupt flag
  }
  interrupt_status = 0;
  RTMS_MEASURE_STOP(runtime_it_1ms);
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

