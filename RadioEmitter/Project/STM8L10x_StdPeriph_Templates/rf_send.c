#include "board.h"
#include "rf_send.h"
#include "delay.h"

#define RFSYNCVAL (u16)/*0x81B3*/0xA55A
static RFmsg_t RFmsg;
static u8 chksum;        

void RF_Send(RF_Cmd_TypeDef RFcmd)
{
  u8 i, j, mask;
  RFmsg.RFmsgmember.RFsyncValue = RFSYNCVAL;
  RFmsg.RFmsgmember.RFNodeId = RFNODEID;
  RFmsg.RFmsgmember.RFcmd = RFcmd;
  
  chksum = 0;
  // Calculate message checksum
  for(i=0; i<RFSEND_DATALEN-1; i++)
  {
    chksum += RFmsg.RFmsgarray[i];
  }
  chksum = (u8)(~chksum);
  RFmsg.RFmsgmember.RFmsgCHKSUM = chksum;
  //RFmsg.RFmsgmember.RFmsgCHKSUM = 0xaa;
  
  CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  TIM4->PSCR = (u8)(TIM4_Prescaler_4);
  TIM4->ARR = 150;  //300us
  TIM4->CNTR = 0;                                       
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);                  
  TIM4->CR1 |= TIM4_CR1_CEN; 
  
  // PREAMBLE
  RFM_DATA(1);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  RFM_DATA(0);
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  RFM_DATA(1);
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  RFM_DATA(0);
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  RFM_DATA(1);
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  RFM_DATA(0);
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  RFM_DATA(1);
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  RFM_DATA(0);
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  TIM4->ARR = 250;  //500us
  
  // START
  RFM_DATA(1);
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  RFM_DATA(0);
  TIM4->ARR = 125;  //250us
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  while(!(TIM4->SR1 & TIM4_IT_Update));
  TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  
  // DATA BYTES
  for(i=0; i<RFSEND_DATALEN; i++)
  {
    mask = 0x80;
    for(j=0; j<8; j++)
    {
      if((RFmsg.RFmsgarray[i] & mask))
      {
        // 1
        RFM_DATA(0);
        TIM4->SR1 &= (u8)(~TIM4_IT_Update);
        while(!(TIM4->SR1 & TIM4_IT_Update));
        RFM_DATA(1);
        TIM4->SR1 &= (u8)(~TIM4_IT_Update);
        while(!(TIM4->SR1 & TIM4_IT_Update));
      }
      else
      {
        // 0
        RFM_DATA(1);
        TIM4->SR1 &= (u8)(~TIM4_IT_Update);
        while(!(TIM4->SR1 & TIM4_IT_Update));
        RFM_DATA(0);
        TIM4->SR1 &= (u8)(~TIM4_IT_Update);
        while(!(TIM4->SR1 & TIM4_IT_Update));
      }
      mask >>= 1;
    } 
  }
  if(RFM_DATA_STATE)
  {
    while(!(TIM4->SR1 & TIM4_IT_Update));
    RFM_DATA(0);
    TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  }
  RFM_DATA(0);
}
//-----------------------------------------------------------------------------
