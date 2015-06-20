#include "board.h"
#include "errors.h"

static u8 error_cnt[ERRORS];
static const u8 error_cnt_thr[ERRORS] = {1, 1, 1, 1, 1, 1};
static u8 error_state[ERRORS];

void Errors_Init()
{
  u8 i;
  for(i = 0; i < ERRORS; i++)
  {
    error_cnt[i] = 0;
    error_state[i] = 0;
  }
}
void Errors_SetError(u8 ErrorID)
{
  if(error_cnt[ErrorID] < U8_MAX) error_cnt[ErrorID]++;
  if(error_cnt[ErrorID] >= error_cnt_thr[ErrorID])
  {
    error_state[ErrorID] = TRUE;
  }
}
void Errors_ResetError(u8 ErrorID)
{
  if(error_cnt[ErrorID] > 0) error_cnt[ErrorID]--;
  if(error_cnt[ErrorID] == 0)
  {
    error_state[ErrorID] = FALSE;
  }
}
bool Errors_CheckError(u8 ErrorID)
{
  return error_state[ErrorID];
}

bool Errors_IsError()
{
  u8 i;
  for(i = 0; i < ERRORS; i++)
  {
    if(error_state[i]) return TRUE;
  }
  return FALSE;
}

u8 Errors_NumErrors(void)
{
  u8 i, numerrors = 0;
  for(i = 0; i < ERRORS; i++)
  {
    if(error_state[i]) numerrors++;
  }
  return numerrors;
}