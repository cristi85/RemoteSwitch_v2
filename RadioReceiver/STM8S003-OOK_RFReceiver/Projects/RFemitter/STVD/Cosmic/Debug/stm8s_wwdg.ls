   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  70                     ; 47 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  70                     ; 48 {
  72                     .text:	section	.text,new
  73  0000               _WWDG_Init:
  75  0000 89            	pushw	x
  76       00000000      OFST:	set	0
  79                     ; 50     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  81                     ; 52     WWDG->WR = WWDG_WR_RESET_VALUE;
  83  0001 357f50d2      	mov	20690,#127
  84                     ; 53     WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  86  0005 9e            	ld	a,xh
  87  0006 aac0          	or	a,#192
  88  0008 c750d1        	ld	20689,a
  89                     ; 54     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  91  000b 7b02          	ld	a,(OFST+2,sp)
  92  000d a47f          	and	a,#127
  93  000f aa40          	or	a,#64
  94  0011 c750d2        	ld	20690,a
  95                     ; 55 }
  98  0014 85            	popw	x
  99  0015 81            	ret	
 133                     ; 63 void WWDG_SetCounter(uint8_t Counter)
 133                     ; 64 {
 134                     .text:	section	.text,new
 135  0000               _WWDG_SetCounter:
 139                     ; 67     assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 141                     ; 71   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 143  0000 a47f          	and	a,#127
 144  0002 c750d1        	ld	20689,a
 145                     ; 73 }
 148  0005 81            	ret	
 171                     ; 82 uint8_t WWDG_GetCounter(void)
 171                     ; 83 {
 172                     .text:	section	.text,new
 173  0000               _WWDG_GetCounter:
 177                     ; 84     return(WWDG->CR);
 179  0000 c650d1        	ld	a,20689
 182  0003 81            	ret	
 205                     ; 92 void WWDG_SWReset(void)
 205                     ; 93 {
 206                     .text:	section	.text,new
 207  0000               _WWDG_SWReset:
 211                     ; 94     WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 213  0000 358050d1      	mov	20689,#128
 214                     ; 95 }
 217  0004 81            	ret	
 252                     ; 104 void WWDG_SetWindowValue(uint8_t WindowValue)
 252                     ; 105 {
 253                     .text:	section	.text,new
 254  0000               _WWDG_SetWindowValue:
 258                     ; 107     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 260                     ; 109     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 262  0000 a47f          	and	a,#127
 263  0002 aa40          	or	a,#64
 264  0004 c750d2        	ld	20690,a
 265                     ; 110 }
 268  0007 81            	ret	
 281                     	xdef	_WWDG_SetWindowValue
 282                     	xdef	_WWDG_SWReset
 283                     	xdef	_WWDG_GetCounter
 284                     	xdef	_WWDG_SetCounter
 285                     	xdef	_WWDG_Init
 304                     	end
