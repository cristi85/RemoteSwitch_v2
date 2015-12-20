#include "board.h"
#include "delay.h"
#include "hd44780.h"

/******************************************************************************
*                          Basic display functions                            *
******************************************************************************/
void LCD_Clock()
{
  LCD_EN(1);
  delay_10us(LCD_CK_DEL/10);
  LCD_EN(0);
}

void LCD_Write(u8 c)
{
  LCD_D7((u8)((c >> 7) & 0x01));
  LCD_D6((u8)((c >> 6) & 0x01));
  LCD_D5((u8)((c >> 5) & 0x01));
  LCD_D4((u8)((c >> 4) & 0x01));
  LCD_Clock();  // 4-bit only
  LCD_D7((u8)((c >> 3) & 0x01));
  LCD_D6((u8)((c >> 2) & 0x01));
  LCD_D5((u8)((c >> 1) & 0x01));
  LCD_D4((u8)((c >> 0) & 0x01));
  LCD_Clock();
  delay_10us(10);
}

void LCD_Initialize()
{
  LCD_RS(0);
  LCD_EN(0);

  LCD_D7(0);
  LCD_D6(0);
  LCD_D5(1);
  LCD_D4(1);
  LCD_Clock();
  delay_10us(500);

  LCD_Clock();
  delay_10us(100);

  LCD_Clock();
  delay_10us(100);

  LCD_D7(0);
  LCD_D6(0);
  LCD_D5(1);
  LCD_D4(0);
  LCD_Clock();
  delay_10us(100);

  //At this point device switches to 4 bit mode

  // FUNCTION SET				| 0  0  1  DL N  F  —  — |
  // BIN_OR_BIT_MASK:			{ 0  0  1  0  0  0  0  0 }
  // HEX_OR_BIT_MASK:			0x20
  LCD_Write((((LCD_DL<<4)&0x10)+((LCD_N<<3)&0x08)+((LCD_F <<2)&0x04)) | 0x20);

  // DISPLAY ON/OFF CONTROL	| 0  0  0  0  1  D  C  B |
  // BIN_OR_BIT_MASK:			{ 0  0  0  0  1  0  0  0 }
  // HEX_OR_BIT_MASK:			0x08
  LCD_Write(0x08);   //Display is off, cursor off, cursor blink off

  // CLEAR LCD DISPLAY
  LCD_Write(0x01);   

  delay_10us(400);   //Wait for more than 3ms or until busy flag is clear

  // ENTRY MODE SET			| 0  0  0  0  0  1  ID S |
  // BIN_OR_BIT_MASK:			{ 0  0  0  0  0  1  0  0 }
  // HEX_OR_BIT_MASK:			0x04
  LCD_Write((((LCD_ID<<1)&0x02)+(LCD_S&0x01)) | 0x04);

  //Initialization complete

  // DISPLAY ON/OFF CONTROL	| 0  0  0  0  1  D  C  B |
  // BIN_OR_BIT_MASK:			{ 0  0  0  0  1  0  0  0 }
  // HEX_OR_BIT_MASK:			0x08
  LCD_Write((((LCD_D<<2)&0x04)+((LCD_C<<1)&0x02)+(LCD_B&0x01)) | 0x08);

  // CURSOR OR DISPLAY SHIFT	| 0  0  0  1  SC RL —  — |
  // BIN_OR_BIT_MASK:			{ 0  0  0  1  0  0  0  0 } 
  // HEX_OR_BIT_MASK:			0x10
  //LCD_Write((((LCD_SC<<3)&0x08)+((LCD_RL<<3)&0x04)) | 0x10);
}

/******************************************************************************
*                          Extended display functions                         *
******************************************************************************/
void LCD_WriteNumber(u32 num)
{
  LCD_RS(1);    // Data send
  if (num == 0) LCD_Write('0');
  else 
  {
    static u8 numstr[10];
    u8 CurPos=0;
    while (num != 0)
    {
      numstr[CurPos] = (u8)((u8)(num%10) + 48);
      num /= 10;
      CurPos++;
    }

    while (CurPos--) LCD_Write(numstr[CurPos]);
  }
}

void LCD_WriteByte(u8 num, _Bool prefix)
{
  LCD_RS(1);    // Data send
  if(prefix)
  {
    LCD_Write('0');
    LCD_Write('x');
  }
  if(((num & 0xF0) >> 4) < 10) LCD_Write(((num & 0xF0) >> 4) + 48);
  else LCD_Write(((num & 0xF0) >> 4) + 55);
  if((num & 0x0F) < 10) LCD_Write((num & 0x0F) + 48);
  else LCD_Write((num & 0x0F) + 55);
}

void LCD_WriteString(const char* s)
{
  LCD_RS(1);  // Data send
  while(*s)
  {
    if (*s != '\n') LCD_Write(*s);
    else LCD_GoTo(0x40);

    s++;
  }
}

void LCD_Clear(void)
{
  LCD_RS(0);    // Command send
  LCD_Write(0x01);
  LCD_RS(1);
  delay_10us(200);
}

void LCD_Home(void)
{
  LCD_RS(0);    // Command send
  LCD_Write(0x02);
  LCD_RS(1);
  delay_10us(200);
}

void LCD_GoTo(u8 P)
{
  LCD_RS(0);    // Command send
  LCD_Write((u8)(0x80+P));
  LCD_RS(1);
  delay_10us(200);
}

void LCD_Move_Cursor(u8 row, u8 col)
{
  LCD_RS(0);    // Command send
  LCD_Write((u8)(0x80 + 0x40*(row-1) + (col-1)));
  LCD_RS(1);
  delay_10us(200);
}