/******************************************************************************
*         HITACHI HD44780 DISPLAY CONTROLLER C DRIVER FOR PIC16 MCUs          *
*                                                                             *
* AUTHOR:   COSTACHESCU CRISTINEL (a.k.a. T3STY)                              *
* VERSION:  2.0                                                               *
* CONTACT:  Contact me via Private Messages on the edaboard forum:            *
*           http://www.edaboard.com/member467136.html                         *
*           or via email at:                                                  *
*           T3STY@live.com                                                    *
*                                                                             *
* LICENSE: GPL 3.0 - Please read License.txt provided along with this package *
*          or read it online at:                                              *
*          http://www.gnu.org/licenses/gpl.txt                                *
*                                                                             *
* DISCLAIMER: Please read Disclaimer.txt provided along with this package     *
*             Also, this file (HD44780.h) is OVER-COMMENTED. Although the     *
*             HD44780.c file is undercommented (self-explainatory in most     *
*             cases) 'I' made the effort of explaining here how to correctly  *
*             use this driver; make sure 'YOU' read them comments for your    *
*             own good (and no headaches - if any).                           *
*                                                                             *
* KNOWN BUGS:                                                                 *
*   # LCD_WriteNumber() cannot write signed numbers                           *
*   # This driver does not have any function for reading the BusyFlag         *
*     >> I may never add one, feel free to make you own if you're able to     *
*                                                                             *
* NOTES:                                                                      *
*   # This driver relies on HiTech PICC Compiler's delay functions:           *
*     >>  __delay_us()  for micro-seconds                                     *
*     >>  __delay_ms()  for milli-seconds                                     *
*     if you're willing to use any other compiler make sure you find an       *
*     equivalent replacement for these functions                              *
*                                                                             *
******************************************************************************/


/******************************************************************************
*                      PIC -> LCD Interface Control pins                      *
******************************************************************************/
// THIS DRIVER USES INDEPENDENT PIN CONTROL                                  //
// MAKE SURE YOU SET THE CORRECT PINS YOU'LL BE USING FOR CONTROLLING THE LCD//

#include "board.h"

// ADDRESS BUS
#define LCD_CK_DEL	50	// It defines the time (in micro-seconds) that LCD_EN
						// should be kept high (1). Adjust the value if you
						// encounter any issues. In simulators you may encounter
						// "Controller received data whilst busy" errors if the
						// time is too short. Longer times will only make the
						// operation completion take longer, it does no harm.

/******************************************************************************
*                             LCD Base settings                               *
******************************************************************************/
// FUNCTION SET
#define LCD_DL		0	// 0: 4-bit DTM		| 1: 8-bit Data Transfer Mode
#define LCD_N		1	// 0: 1 line		| 1: 2 lines
#define LCD_F		0	// 0: 5x8 px font	| 1: 5x10 px font

// ENTRY MODE SET
#define LCD_S		0	// 0: SHIFT	OFF		| 1: SHIFT ON
#define LCD_ID		0	// 0: INCREMENT		| 1: DECREMENT

// DISPLAY ON/OFF CONTROL
#define LCD_B		0	// 0: CUR_BLINK OFF	| 1: CUR_BLINK ON
#define LCD_C		0	// 0: CURSOR OFF	| 1: CURSOR ON
#define LCD_D		1	// 0: DISPLAY OFF	| 1: DISPLAY ON

// CURSOR OR DISPLAY SHIFT
#define LCD_SC		0	// 0: SHIFT CURSOR	| 1: SHIFT DISPLAY
#define LCD_RL		1	// 0: SHIFT LEFT	| 1: SHIFT RIGHT

/******************************************************************************
*                          Basic display functions                            *
******************************************************************************/
///////////////////////////////////////////////////////////////////////////////
// The next function have been built so you may use them alone. If you think //
// that the Extended display functions (below) are using too much space on   //
// your PIC, feel free to delete these functions from the driver. You'll be  //
// able to use the driver by using only the next 3 functions, but you'll have//
// to manually create the writing loops for strings. Although excluding the  //
// extended functions reduces the driver size by about 50%, it also brings a //
// lot of headache when writing strings and moving on the display. But you're//
// free to choose and in some cases, saving some space is more important than//
// headaches... isn't it? :-)                                                //
///////////////////////////////////////////////////////////////////////////////


// LCD_Clock()
// Parameters: NONE
// Return:     NONE
// ----------------------------------------------------------------------------
// This function clocks the LCD Data nibbles and ensures the clock stays high
// for enough time for the LCD to correctly read data.
// You'll NEVER use this function alone, it's only needed by LCD_Write() and
// LCD_Initialize(). If you use it alone you may clock random data in the
// display, which may corrupt the display settings or text on the display.
// Don't - just don't.
// ----------------------------------------------------------------------------
void LCD_Clock(void);

// LCD_Write()
// Parameters: 1
// |-----|---------------|----------------------------------------------------|
// | PAR |     TYPE      | DESCRIPTION                                        |
// |-----|---------------|----------------------------------------------------|
// |  1  | unsigned char | the byte of data to write on the LCD               |
// |-----|---------------|----------------------------------------------------|
// Return: NONE
// ----------------------------------------------------------------------------
// This function is the basic function used to write data on the LCD
// You may use this function alone but it's highly reccomended to only use when
// you've got no other choice or when you want to write something in no-time
// You may write 1 byte of data each call
void LCD_Write(u8);

// LCD_Initialize()
// Parameters: NONE
// Return:     NONE
// ----------------------------------------------------------------------------
// This function initializes the display based on the settings specified in
// the previous section in this file (LCD Base settings). It ensures that you
// won't spend any time figuring out how to configure the LCD
// If you want to change any of those settings at runtime, I assume you're an
// experienced user so I'd suggest you to look in the HD44780.c file (functions
// start at line 47) for description of the settings and use LCD_Write() with
// the appropriate configuration byte
// Remember that you have to use this function before you do any operation on
// the display or you'll miss the party.
// ----------------------------------------------------------------------------
void LCD_Initialize(void);

/******************************************************************************
*                          Extended display functions                         *
******************************************************************************/
///////////////////////////////////////////////////////////////////////////////
// Generally speaking, there's nothing special to say about this set of      //
// functions apart that they rely on the base functions, so you may not use  //
// them alone. Each function has its own usage, make sure you check out the  //
// comments before each function for well using them.                        //
///////////////////////////////////////////////////////////////////////////////

// LCD_WriteNumber()
// Parameters: 1
// |-----|---------------|----------------------------------------------------|
// | PAR |     TYPE      | DESCRIPTION                                        |
// |-----|---------------|----------------------------------------------------|
// |  1  | unsigned long | the number you wish to write on the display        |
// |-----|---------------|----------------------------------------------------|
// Return: NONE
// ----------------------------------------------------------------------------
// The function writes any unsigned integer on the display. Beware that signed
// integers will still be read as unsigned which may bring a different number
// than the one you expect. I'm currently updating this function so it'll write
// signed integers too, stay tuned on the forum for that.
// The data type used for the number is UNSIGNED LONG, this being the highest
// data type available on PIC 16F84A. If your PIC supports higher data types
// you may modify the function with your needed data type as parameter - also,
// very important: make sure that on line 80 of HD44780.c you specify a string
// length that can contain the highest value of your data type. In my case
// UNSIGNED LONG is a 32-bit long integer and the maximum (unsigned) value is:
// 2^32 = 4294967296 - that would be 10 chars long.
// Just make sure you know what you're doing when you're doing it.
// IMPORTANT:
// DO YOU HAVE YOUR OWN NUMBER-TO-ASCII CONVERTING FUNCTION? GOOD! Then you
// don't need this function! For writing strings use the function LCD_WriteString()
// as described next!
// ----------------------------------------------------------------------------
void LCD_WriteNumber(u32);

void LCD_WriteByte(u8, _Bool);

// LCD_WriteString()
// Parameters: 1
// |-----|-----------------------|--------------------------------------------|
// | PAR |         TYPE          | DESCRIPTION                                |
// |-----|-----------------------|--------------------------------------------|
// |  1  | unsigned char pointer | the string you wish to write on the display|
// |-----|-----------------------|--------------------------------------------|
// Return: NONE
// ----------------------------------------------------------------------------
// This function writes a string on the display. Beware that you may use this
// function to write numbers but only when you give them as strings.
// For exmaple: "1" or "234567890". Giving a non ASCII value (like 0xFF, 1234)
// will write strange chars on the display because the function won't convert
// the number to its ASCII string. For numbers use LCD_WriteNumber().
// You may not pass a pointer as function parameter - when passing a string it
// will automatically be passed by address (pointer). A pointer to a pointer
// will bring unexpected/unknown results. The string may be as long as you wish
// but keep in mind that the HD44780 controller may drive a maximum of 80 chars
// For simplifying the work, you may use the special char \n (newline) for
// jumping on the second line when using 2 line displays (2x8, 2x16, 2x20, 2x40)
// Using it when already on the second line will bring you to the start of the
// second line, not on the first line. I could not implement something for the
// first line so you'll have to separately use the function LCD_Home().
// ----------------------------------------------------------------------------
void LCD_WriteString(const char*);

// LCD_Home()
// Parameters: NONE
// Return: NONE
// ----------------------------------------------------------------------------
// As simple as the name: it returns the cursor on the display to the first
// character on line 1 without modifying any existing text.
// ----------------------------------------------------------------------------
void LCD_Home(void);

// LCD_GoTo()
// Parameters: 1
// |-----|---------------|----------------------------------------------------|
// | PAR |     TYPE      | DESCRIPTION                                        |
// |-----|---------------|----------------------------------------------------|
// |  1  | unsigned char | the position (1 to 80) where to move the cursor to |
// |-----|---------------|----------------------------------------------------|
// Return: NONE
// ----------------------------------------------------------------------------
// As simple as the name: it moves the cursor to the specified position on the
// display, leaving any existing text unmodified.
// You may use any number between 1 and 80. Any higher number will make the
// controller start counting from 1, looping the count until the number ends.
// Not really a big deal for your headaches...
// ----------------------------------------------------------------------------
// Jumps to the specified position on the display
void LCD_GoTo(u8);

// LCD_Home()
// Parameters: NONE
// Return: NONE
// ----------------------------------------------------------------------------
// As simple as the name: Clears any text written on the LCD and returns to home
// ----------------------------------------------------------------------------
void LCD_Clear(void);

void LCD_Move_Cursor(u8, u8);