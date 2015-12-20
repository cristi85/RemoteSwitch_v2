#ifndef _TIMEOUT_H_
#define _TIMEOUT_H_

#include "board.h"

void Timeout_SetTimeout1(u16);
void Timeout_SetTimeout2(u16);
void Timeout_SetTimeout3(u16);
u16 Timeout_GetTimeout1(void);
u16 Timeout_GetTimeout2(void);
u16 Timeout_GetTimeout3(void);
_Bool Timeout_IsTimeout1(void);
_Bool Timeout_IsTimeout2(void);
_Bool Timeout_IsTimeout3(void);

#endif