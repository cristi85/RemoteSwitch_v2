#include "board.h"
#include "rf_send.h"
#include "delay.h"

#define RFSYNCVAL (u16)0xA55A
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
  
  CLK->PCKENR |= CLK_Peripheral_TIM3;
  TIM3->PSCR = (u8)(TIM3_Prescaler_4);
  TIM3->ARRH = (u8)0;
  TIM3->ARRL = (u8)150;  //300us
  TIM3->CNTRH = (u8)0;           
  TIM3->CNTRL = (u8)0;
  TIM3->EGR = 0x01;
  TIM3->BKR = TIM_BKR_RESET_VALUE;
  TIM3->SR1 = TIM_SR1_RESET_VALUE;  
  TIM3->CR1 = TIM_CR1_CEN; 
  
  // PREAMBLE
  RFM_DATA(1);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  RFM_DATA(0);
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  RFM_DATA(1);
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  RFM_DATA(0);
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  RFM_DATA(1);
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  RFM_DATA(0);
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  RFM_DATA(1);
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  RFM_DATA(0);
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  TIM3->ARRH = (u8)0;
  TIM3->ARRL = (u8)250;  //500us
  
  // START
  RFM_DATA(1);
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  RFM_DATA(0);
  TIM3->ARRH = (u8)0;
  TIM3->ARRL = (u8)125;  //250us
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  while(!(TIM3->SR1 & TIM_SR1_UIF));
  TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  
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
        TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
        while(!(TIM3->SR1 & TIM_SR1_UIF));
        RFM_DATA(1);
        TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
        while(!(TIM3->SR1 & TIM_SR1_UIF));
      }
      else
      {
        // 0
        RFM_DATA(1);
        TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
        while(!(TIM3->SR1 & TIM_SR1_UIF));
        RFM_DATA(0);
        TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
        while(!(TIM3->SR1 & TIM_SR1_UIF));
      }
      mask >>= 1;
    } 
  }
  if(RFM_DATA_STATE)
  {
    while(!(TIM3->SR1 & TIM_SR1_UIF));
    RFM_DATA(0);
    TIM3->SR1 &= (u8)(~TIM_SR1_UIF);
  }
  RFM_DATA(0);
  TIM3->CR1 = (u8)0x00;
}
//-----------------------------------------------------------------------------
