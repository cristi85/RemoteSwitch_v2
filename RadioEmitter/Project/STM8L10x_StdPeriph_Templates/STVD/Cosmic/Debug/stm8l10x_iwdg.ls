   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  84                     ; 58 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  84                     ; 59 {
  86                     .text:	section	.text,new
  87  0000               _IWDG_WriteAccessCmd:
  91                     ; 61   assert_param(IS_IWDG_WRITEACCESS_MODE(IWDG_WriteAccess));
  93                     ; 62   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  95  0000 c750e0        	ld	20704,a
  96                     ; 63 }
  99  0003 81            	ret	
 189                     ; 79 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 189                     ; 80 {
 190                     .text:	section	.text,new
 191  0000               _IWDG_SetPrescaler:
 195                     ; 82   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 197                     ; 83   IWDG->PR = (uint8_t)IWDG_Prescaler;
 199  0000 c750e1        	ld	20705,a
 200                     ; 84 }
 203  0003 81            	ret	
 237                     ; 93 void IWDG_SetReload(uint8_t IWDG_Reload)
 237                     ; 94 {
 238                     .text:	section	.text,new
 239  0000               _IWDG_SetReload:
 243                     ; 95   IWDG->RLR = IWDG_Reload;
 245  0000 c750e2        	ld	20706,a
 246                     ; 96 }
 249  0003 81            	ret	
 272                     ; 104 void IWDG_ReloadCounter(void)
 272                     ; 105 {
 273                     .text:	section	.text,new
 274  0000               _IWDG_ReloadCounter:
 278                     ; 106   IWDG->KR = IWDG_KEY_REFRESH;
 280  0000 35aa50e0      	mov	20704,#170
 281                     ; 107 }
 284  0004 81            	ret	
 307                     ; 114 void IWDG_Enable(void)
 307                     ; 115 {
 308                     .text:	section	.text,new
 309  0000               _IWDG_Enable:
 313                     ; 116   IWDG->KR = IWDG_KEY_ENABLE;
 315  0000 35cc50e0      	mov	20704,#204
 316                     ; 117 }
 319  0004 81            	ret	
 332                     	xdef	_IWDG_Enable
 333                     	xdef	_IWDG_ReloadCounter
 334                     	xdef	_IWDG_SetReload
 335                     	xdef	_IWDG_SetPrescaler
 336                     	xdef	_IWDG_WriteAccessCmd
 355                     	end
