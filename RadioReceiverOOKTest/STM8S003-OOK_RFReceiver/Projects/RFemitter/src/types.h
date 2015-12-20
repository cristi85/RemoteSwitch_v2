#ifndef _TYPES_H_
#define _TYPES_H_

typedef int32_t s32;
typedef int16_t s16;
typedef int8_t  s8;

typedef uint32_t u32;
typedef uint16_t u16;
typedef uint8_t  u8;

typedef enum {FALSE = 0, TRUE = !FALSE} bool;

#define U8_MAX     (255)
#define S8_MAX     (127)
#define S8_MIN     (-128)
#define U16_MAX    (65535u)
#define S16_MAX    (32767)
#define S16_MIN    (-32768)
#define U32_MAX    (4294967295uL)
#define S32_MAX    (2147483647)
#define S32_MIN    (-2147483648uL)

#define UARTBUFFSIZE (u8)16
typedef struct
{
  u8 CMD;
  u8 DATAlen;
  u8 DATA[UARTBUFFSIZE];
}UART_CMD_T;

#endif