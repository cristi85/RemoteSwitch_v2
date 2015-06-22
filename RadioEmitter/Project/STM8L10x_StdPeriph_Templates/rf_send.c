#include "board.h"
#include "rf_send.h"

#define RFSYNCVAL (u16)0x81B3
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
  
  TIM3_SetCounter(0);
  //TIM3_SetCompare1(375);   //375=0x177
  TIM3->CCR1H = (uint8_t)0x01;
  TIM3->CCR1L = (uint8_t)0x77;
  //TIM3_SetAutoreload(750); // 750=0x2EE
  TIM3->ARRH = (uint8_t)0x02;
  TIM3->ARRL = (uint8_t)0xEE;
  //TIM3_Cmd(ENABLE);
  TIM3->CR1 |= TIM_CR1_CEN;
  // PREAMBLE
  for(i=0; i < 11; i++)
  {
    while(!(TIM3->SR1 & TIM3_FLAG_Update));
    TIM3->SR1 &= ~(TIM3_FLAG_Update);
  }
  
  //TIM3_SetCompare1(600);     // 600=0x258
  TIM3->CCR1H = (uint8_t)0x02;
  TIM3->CCR1L = (uint8_t)0x58;
  //TIM3_SetAutoreload(1200);  // 1200=0x4B0
  TIM3->ARRH = (uint8_t)0x04;
  TIM3->ARRL = (uint8_t)0xB0;
  //START
  while(!(TIM3->SR1 & TIM3_FLAG_Update));
  TIM3->SR1 &= ~(TIM3_FLAG_Update);
  
  // DATA BYTES
  for(i=0; i<RFSEND_DATALEN; i++)
  {
    mask = 0x80;
    for(j=0; j<8; j++)
    {
      if(RFmsg.RFmsgarray[i] & mask)
      {
        //send 1 - 750uS wide
        //TIM3_SetCompare1(375);   //375=0x177
        TIM3->CCR1H = (uint8_t)0x01;
        TIM3->CCR1L = (uint8_t)0x77;
        //TIM3_SetAutoreload(750); // 750=0x2EE
        TIM3->ARRH = (uint8_t)0x02;
        TIM3->ARRL = (uint8_t)0xEE;
      }
      else
      {
        //send 0 - 500uS wide
        //TIM3_SetCompare1(250);   // 250=0xFA
        TIM3->CCR1H = (uint8_t)0x00;
        TIM3->CCR1L = (uint8_t)0xFA;
        //TIM3_SetAutoreload(500); // 500=0x1F4
        TIM3->ARRH = (uint8_t)0x01;
        TIM3->ARRL = (uint8_t)0xF4;
      }
      mask >>= 1;
      while(!(TIM3->SR1 & TIM3_FLAG_Update));
      TIM3->SR1 &= ~(TIM3_FLAG_Update);
    }
  }
  
  while(!(TIM3->SR1 & TIM3_FLAG_Update));
  TIM3->SR1 &= ~(TIM3_FLAG_Update);
  //TIM3_Cmd(DISABLE);
  TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
}
//-----------------------------------------------------------------------------
