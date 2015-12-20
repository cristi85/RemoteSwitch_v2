#ifndef _RF_SEND_H_
#define _RF_SEND_H_

#include "board.h"

#define RFSEND_DATALEN    (u8)7
#define RFREMOTEID        (u8)0x56

typedef enum {
  RFCMD_OPENDOORS  = (u8)0x0F, /* command to open doors */
  RFCMD_CLOSEDOORS = (u8)0xF0  /* command to close doors */
} RF_Cmd_TypeDef;

typedef union
{
  struct
  {
    u32 RFseccode;
    u8 RFremoteID;
    u8 RFcmd;
    u8 RFmsgCHKSUM;
  }RFmsgmember;
  u8 RFmsgarray[RFSEND_DATALEN];
}RFmsg_t;

void RF_Send(RF_Cmd_TypeDef RF_cmd);

#endif