#ifndef _ERRORS_H_
#define _ERRORS_H_

#include "board.h"

#define ERROR_ADC_INIT    (u8)0
#define ERROR_NRF24_INIT  (u8)1
#define ERROR_NRF24_COMM  (u8)2
#define ERROR_NRF24_REG   (u8)3
#define ERROR_FLASH_WRITE (u8)4
#define ERROR_FLASH_ERASE (u8)5

#define ERRORS (u8)ERROR_FLASH_ERASE + 1

void Errors_Init(void);
void Errors_SetError(u8);
void Errors_ResetError(u8);
bool Errors_CheckError(u8);
bool Errors_IsError(void);
u8 Errors_NumErrors(void);

#endif