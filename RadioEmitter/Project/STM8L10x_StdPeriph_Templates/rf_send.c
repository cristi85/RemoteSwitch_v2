#include "board.h"
#include "delay.h"
#include "rf_send.h"

#define RFSYNCVAL (u16)0x81B3
static RFmsg_t RFmsg;
static u8 chksum;

void RFPULSE(u16 LOW, u16 HIGH) 
{ 
  DELAY_US(LOW);
  RF_OUT(1);
  DELAY_US(HIGH);
  RF_OUT(0);
}         

void RF_Send(RF_Cmd_TypeDef RFcmd)
{
  u8 i, j, mask;
  RFmsg.RFmsgmember.RFsyncValue = RFSYNCVAL;
  RFmsg.RFmsgmember.RFNodeId = RFNODEID;
  RFmsg.RFmsgmember.RFcmd = RFcmd;
  
  chksum = 0;
  /* Calculate message checksum */
  for(i=0; i<RFSEND_DATALEN-1; i++)
  {
    chksum += RFmsg.RFmsgarray[i];
  }
  chksum = (u8)(~chksum);
  RFmsg.RFmsgmember.RFmsgCHKSUM = chksum;
  /* Send 24 pulses for receiver gain adjustment before sending the start pulse */
  for(i=0; i<12; i++)
  {
    RFPULSE(DELAY_350US, DELAY_350US);
  }
      
  /* Send start pulse - 1250us */
  RFPULSE(DELAY_850US, DELAY_400US);
    
  /* Send data bytes */
  for(i=0; i<RFSEND_DATALEN; i++)
  {
    mask = 0x80;
    for(j=0; j<8; j++)
    {
      if(RFmsg.RFmsgarray[i] & mask)
      {
        //send 1 - 750uS wide
        RFPULSE(DELAY_350US, DELAY_400US);
      }
      else
      {
        //send 0 - 500uS wide
        RFPULSE(DELAY_100US, DELAY_400US);
      }
      mask >>= 1;
    }
  }
}
//-----------------------------------------------------------------------------