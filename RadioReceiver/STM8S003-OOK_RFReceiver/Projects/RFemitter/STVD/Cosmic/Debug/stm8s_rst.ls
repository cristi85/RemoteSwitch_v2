   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 124                     ; 48 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 124                     ; 49 {
 126                     .text:	section	.text,new
 127  0000               _RST_GetFlagStatus:
 131                     ; 51     assert_param(IS_RST_FLAG_OK(RST_Flag));
 133                     ; 55     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 135  0000 c450b3        	and	a,20659
 138  0003 81            	ret	
 173                     ; 64 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 173                     ; 65 {
 174                     .text:	section	.text,new
 175  0000               _RST_ClearFlag:
 179                     ; 67     assert_param(IS_RST_FLAG_OK(RST_Flag));
 181                     ; 69     RST->SR = (uint8_t)RST_Flag;
 183  0000 c750b3        	ld	20659,a
 184                     ; 70 }
 187  0003 81            	ret	
 200                     	xdef	_RST_ClearFlag
 201                     	xdef	_RST_GetFlagStatus
 220                     	end
