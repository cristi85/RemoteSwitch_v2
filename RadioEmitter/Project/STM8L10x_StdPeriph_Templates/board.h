#ifndef _BOARD_H_
#define _BOARD_H_

#include "stm8l10x_conf.h"

#define HWVERSION 10  /* Hardware version v1.0 */

#if defined (HWVERSION)
  #if HWVERSION == 10  /* if Hardware version v1.0 */
    /* Board LED: Pin1, Pin2 */
    #define LED_PORT      GPIOA 
    #if defined (STM8L051F3)
      #define LED_PIN1    GPIO_Pin_5
      #define LED_PIN2    GPIO_Pin_6
    #elif defined(STM8L101F2)
      #define LED_PIN1    GPIO_Pin_2
      #define LED_PIN2    GPIO_Pin_3
    #else
      #error "Pinout configured only for STM8L051F3 and STM8L101F2!"
    #endif
    #define LED_RED_ON      {(LED_PORT->ODR &= (u8)(~LED_PIN2)); (LED_PORT->ODR |=       LED_PIN1);}
    #define LED_GREEN_ON    {(LED_PORT->ODR |=       LED_PIN2);  (LED_PORT->ODR &= (u8)(~LED_PIN1));}
    #define LED_OFF         {(LED_PORT->ODR &= (u8)(~LED_PIN1)); (LED_PORT->ODR &= (u8)(~LED_PIN2));}

    /* Board Buttons
    PB0 Button 1, button press = 0
    PD0 Button 2, button press = 0
    */
    #define BTN1_PORT  GPIOC 
    #define BTN2_PORT  GPIOC
    #define BTN1_PIN   GPIO_Pin_2
    #define BTN2_PIN   GPIO_Pin_1
    #define BTN1_STATE (BTN1_PORT->IDR & BTN1_PIN)
    #define BTN2_STATE (BTN2_PORT->IDR & BTN2_PIN)

    /* ======RFM85W====== */
    #define RFM_ON_PORT   GPIOC
    #define RFM_ON_PIN    GPIO_Pin_3
    // DATA - digital OUTPUT
    #define RFM_DATA_PORT   GPIOB 
    #define RFM_DATA_PIN    GPIO_Pin_3
    
    #define RFM_DATA(x)    (x==(u8)0 ? (RFM_DATA_PORT->ODR   &= (~RFM_DATA_PIN)) : (RFM_DATA_PORT->ODR |= RFM_DATA_PIN))
    #define RFM_DATA_STATE (RFM_DATA_PORT->IDR & RFM_DATA_PIN)
    #define RFM_OFF        (RFM_ON_PORT->ODR |= RFM_ON_PIN)
    #define RFM_ON         (RFM_ON_PORT->ODR &= (~RFM_ON_PIN))
    /* ======END RFM85W====== */
  #else  /* #if HWVERSION ==  */
    #error "No valid hardware version defined! Please define HWVERSION with a valid version"
  #endif
#else  /* #if defined (HWVERSION) */
  #error "No hardware version defined! Please define HWVERSION!"
#endif
#endif