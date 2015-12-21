#ifndef _BOARD_H_
#define _BOARD_H_

#include "stm8l10x_conf.h"

#define HWVERSION 20  /* Hardware version v2.0 */

#if defined (HWVERSION)
  #if HWVERSION == 20  /* if Hardware version v2.0 */
    #ifndef STM8L101F2
      #error "Pinout configuration valid only for STM8L101F2"
    #endif
    /* Board LED: Pin1, Pin2 */
    #define LED_PORT        GPIOC
    #define LED_PIN1        GPIO_Pin_3
    #define LED_PIN2        GPIO_Pin_4
    #define LED_GREEN_ON    {(LED_PORT->ODR &= (u8)(~LED_PIN1)); (LED_PORT->ODR |=       LED_PIN2);}
    #define LED_RED_ON      {(LED_PORT->ODR |=       LED_PIN1);  (LED_PORT->ODR &= (u8)(~LED_PIN2));}
    #define LED_OFF         {(LED_PORT->ODR &= (u8)(~LED_PIN1)); (LED_PORT->ODR &= (u8)(~LED_PIN2));}
    #define IS_LED_RED_ON   {(LED_PORT->ODR & LED_PIN2) && (LED_PORT->ODR & (~LED_PIN1))} 
    #define IS_LED_GREEN_ON

    /* Board Buttons
    PB3 Button 1, button press = 0
    */
    #define BTN1_PORT  GPIOB 
    #define BTN1_PIN   GPIO_Pin_3 /* to be modified on HW!!! */
    #define BTN1_STATE (BTN1_PORT->IDR & BTN1_PIN)

    /* ======RM83CL====== */
    // DATA - digital INPT
    #define RFM_DATA_PORT   GPIOB 
    #define RFM_DATA_PIN    GPIO_Pin_1 /* to be modified on HW!!! */
    #define RFM_DATA_STATE ((u16)(RFM_DATA_PORT->IDR & RFM_DATA_PIN) != (u16)0 ? (u8)1 : (u8)0)
    
    /* ======DEBUG PIN====== */
    // DEBUG PIN - digital OUTPUT
    #define DEBUG_PIN_PORT  GPIOC 
    #define DEBUG_PIN_PIN   GPIO_Pin_1
    #define DEBUG_PIN_ON    (DEBUG_PIN_PORT->ODR |= DEBUG_PIN_PIN)
    #define DEBUG_PIN_OFF   (DEBUG_PIN_PORT->ODR &= (u8)(~DEBUG_PIN_PIN))
    
    /* LIGHT ON */
    #define LIGHT_ON_PORT  GPIOB
    #define LIGHT_ON_PIN   GPIO_Pin_0
    #define LIGHT_ON       (LIGHT_ON_PORT->ODR |= LIGHT_ON_PIN)
    #define LIGHT_OFF      (LIGHT_ON_PORT->ODR &= (u8)(~LIGHT_ON_PIN))
  #else  /* #if HWVERSION ==  */
    #error "No valid hardware version defined! Please define HWVERSION with a valid version"
  #endif
#else  /* #if defined (HWVERSION) */
  #error "No hardware version defined! Please define HWVERSION!"
#endif
#endif
