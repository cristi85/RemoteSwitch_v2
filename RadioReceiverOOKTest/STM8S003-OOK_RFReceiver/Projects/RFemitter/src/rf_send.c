#include "board.h"
#include "delay.h"
#include "rf_send.h"
#include "xorshift.h"

#define RFINITSEED        (u32)0x81B3AC98

void RFPULSE(u16 LOW, u16 HIGH) 
{ 
  DELAY_US(LOW);
  RFSEND_HIGH();
  DELAY_US(HIGH);
  RFSEND_LOW();
}         

static RFmsg_t RFmsg;
static u32 m_RFseccode = RFINITSEED;
static u8 CHKSUM;
void RF_Send(RF_Cmd_TypeDef RFcmd)
{
  u8 i, j, mask;
  m_RFseccode = xorshift32(m_RFseccode);
  RFmsg.RFmsgmember.RFseccode = m_RFseccode;
  RFmsg.RFmsgmember.RFremoteID = RFREMOTEID;
  RFmsg.RFmsgmember.RFcmd = RFcmd;
  
  CHKSUM = 0;
  /* Calculate message checksum */
  for(i=0; i<RFSEND_DATALEN-1; i++)
  {
    CHKSUM += RFmsg.RFmsgarray[i];
  }
  CHKSUM = (u8)(~CHKSUM);
  RFmsg.RFmsgmember.RFmsgCHKSUM = CHKSUM;
  /* Send 24 pulses for receiver gain adjustment before sending the start pulse */
  for(i=0; i<24; i++)
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