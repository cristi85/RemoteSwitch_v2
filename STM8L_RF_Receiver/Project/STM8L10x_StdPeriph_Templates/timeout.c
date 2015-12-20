/* Includes ------------------------------------------------------------------*/

#include "board.h"

#define TMR_REC  (u8)1   //timer interrupt reccurency in miliseconds

_Bool Timeout_istout1 = TRUE;
_Bool Timeout_istout2 = TRUE;
_Bool Timeout_istout3 = TRUE;
u16 Timeout_toutcnt1 = 0;
u16 Timeout_toutcnt2 = 0;
u16 Timeout_toutcnt3 = 0;
u16 Timeout_tout1 = 100 / TMR_REC;   //init to 100ms
u16 Timeout_tout2 = 100 / TMR_REC;   //init to 100ms
u16 Timeout_tout3 = 100 / TMR_REC;   //init to 100ms

void Timeout_SetTimeout1(u16 time)
{
  Timeout_tout1 = time / TMR_REC;
  Timeout_toutcnt1 = 0;
  Timeout_istout1 = FALSE;
}

u16 Timeout_GetTimeout1()
{
  return (2*Timeout_toutcnt1);
}

_Bool Timeout_IsTimeout1()
{
  return Timeout_istout1;
}

void Timeout_SetTimeout2(u16 time)
{
  Timeout_tout2 = time / TMR_REC;
  Timeout_toutcnt2 = 0;
  Timeout_istout2 = FALSE;
}

u16 Timeout_GetTimeout2()
{
  return (2*Timeout_toutcnt2);
}

_Bool Timeout_IsTimeout2()
{
  return Timeout_istout2;
}

void Timeout_SetTimeout3(u16 time)
{
  Timeout_tout3 = time / TMR_REC;
  Timeout_toutcnt3 = 0;
  Timeout_istout3 = FALSE;
}

u16 Timeout_GetTimeout3()
{
  return (2*Timeout_toutcnt3);
}

_Bool Timeout_IsTimeout3()
{
  return Timeout_istout3;
}