/**
  ******************************************************************************
  * @file main.c
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "board.h" 
#include "stm8s_it.h"
#include "config.h"
#include "delay.h"
#include "timeout.h"
#include "errors.h"
#include "hd44780.h"

/* Defines ---------------------------------------------------------*/

/* CONSTANTS ---------------------------------------------------------------*/

/**
  ******************************************************************************
  * @brief Main function.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
static u8 RMsgRcvdCnt = 0;
void main(void)
{
  Config();
  enableInterrupts();

  LCD_Initialize();
  LCD_Clear();
  LCD_WriteString("OOK 433.92MHZ");
  LCD_Move_Cursor(2, 1);
  LCD_WriteString("Comm test");

  while(1)
  {
    if(RFbytesReady == TRUE)
    {
      LCD_Clear();
      LCD_WriteNumber((u32)(++RMsgRcvdCnt));
      LCD_Move_Cursor(1, 4);
      LCD_WriteByte(RcvRFmsg.RFmsgmember.RFNodeId, TRUE);
      LCD_Move_Cursor(1, 9);
      LCD_WriteByte(RcvRFmsg.RFmsgmember.RFcmd, TRUE);
      LCD_Move_Cursor(2, 1);
      LCD_WriteByte(RcvRFmsg.RFmsgmember.RFmsgCHKSUM, TRUE);
      RFbytesReady = FALSE;
    }
  }
}

/**
  ******************************************************************************
  * @brief Loop for temporisation
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */

/****************** (c) 2008  STMicroelectronics ******************************/

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval
  * None
  */
void assert_failed(u8* file, u32 line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {}
}
#endif

/**
  * @}
  */
