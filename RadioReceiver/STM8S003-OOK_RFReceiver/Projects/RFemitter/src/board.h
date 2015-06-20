#ifndef _BOARD_H_
#define _BOARD_H_

#include "stm8s_conf.h"

// LCD RS - digital OUTPUT
#define LCD_RS_PORT  GPIOD 
#define LCD_RS_PIN   GPIO_PIN_2
// LCD E - digital OUTPUT
#define LCD_EN_PORT  GPIOD 
#define LCD_EN_PIN   GPIO_PIN_3
// LCD D4 - digital OUTPUT
#define LCD_D4_PORT  GPIOD 
#define LCD_D4_PIN   GPIO_PIN_4
// LCD D5 - digital OUTPUT
#define LCD_D5_PORT  GPIOD 
#define LCD_D5_PIN   GPIO_PIN_5
// LCD D6 - digital OUTPUT
#define LCD_D6_PORT  GPIOD 
#define LCD_D6_PIN   GPIO_PIN_6
// LCD D7 - digital OUTPUT
#define LCD_D7_PORT  GPIOD 
#define LCD_D7_PIN   GPIO_PIN_7

#define LCD_D7(x) (x==0 ? (LCD_D7_PORT->ODR &= (u8)(~LCD_D7_PIN)) : (LCD_D7_PORT->ODR |= LCD_D7_PIN))
#define LCD_D6(x) (x==0 ? (LCD_D6_PORT->ODR &= (u8)(~LCD_D6_PIN)) : (LCD_D6_PORT->ODR |= LCD_D6_PIN))
#define LCD_D5(x) (x==0 ? (LCD_D5_PORT->ODR &= (u8)(~LCD_D5_PIN)) : (LCD_D5_PORT->ODR |= LCD_D5_PIN))
#define LCD_D4(x) (x==0 ? (LCD_D4_PORT->ODR &= (u8)(~LCD_D4_PIN)) : (LCD_D4_PORT->ODR |= LCD_D4_PIN))
#define LCD_EN(x) (x==0 ? (LCD_EN_PORT->ODR &= (u8)(~LCD_EN_PIN)) : (LCD_EN_PORT->ODR |= LCD_EN_PIN))
#define LCD_RS(x) (x==0 ? (LCD_RS_PORT->ODR &= (u8)(~LCD_RS_PIN)) : (LCD_RS_PORT->ODR |= LCD_RS_PIN))

// LED
#define LED_PORT  GPIOD 
#define LED_PIN   GPIO_PIN_0
#define LED_OFF   (LED_PORT->ODR &= (u8)(~LED_PIN))
#define LED_ON    (LED_PORT->ODR |= LED_PIN)
#define LED_STATE (LED_PORT->IDR & LED_PIN)

// Digital INPUT - Learn Button
#define BTN_PORT      GPIOB
#define BTN_PIN       GPIO_PIN_7
#define BTN_STATE     (BTN_PORT->IDR & LRNBTN_PIN)
#define BTN_PRESSED   ((BTN_PORT->IDR & BTN_PIN) == 0)
#define BTN_DEPRESSED ((BTN_PORT->IDR & BTN_PIN) == BTN_PIN)

// Digital OUTPUT - Test pin
/*#define TESTPIN_PORT  GPIOA
#define TESTPIN_PIN   GPIO_PIN_1
#define TESTPIN_LOW   (TESTPIN_PORT->ODR &= (u8)(~TESTPIN_PIN))
#define TESTPIN_HIGH  (TESTPIN_PORT->ODR |= TESTPIN_PIN)
#define TESTPIN_STATE (TESTPIN_PORT->IDR & TESTPIN_PIN)*/

// RF Receiver
#define RFRCV_PORT  GPIOC
#define RFRCV_PIN   GPIO_PIN_2      //configured as trigger reset and capture for timer1 on falling edge

#endif