   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
 116                     ; 64 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 116                     ; 65 {
 118                     .text:	section	.text,new
 119  0000               _RST_GetFlagStatus:
 123                     ; 67   assert_param(IS_RST_FLAG(RST_Flag));
 125                     ; 71   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 127  0000 c450b1        	and	a,20657
 128  0003 2702          	jreq	L01
 129  0005 a601          	ld	a,#1
 130  0007               L01:
 133  0007 81            	ret	
 168                     ; 85 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 168                     ; 86 {
 169                     .text:	section	.text,new
 170  0000               _RST_ClearFlag:
 174                     ; 88   assert_param(IS_RST_FLAG(RST_Flag));
 176                     ; 90   RST->SR = (uint8_t)RST_Flag;
 178  0000 c750b1        	ld	20657,a
 179                     ; 91 }
 182  0003 81            	ret	
 205                     ; 98 void RST_GPOutputEnable(void)
 205                     ; 99 {
 206                     .text:	section	.text,new
 207  0000               _RST_GPOutputEnable:
 211                     ; 101   RST->CR = RST_CR_MASK;
 213  0000 35d050b0      	mov	20656,#208
 214                     ; 102 }
 217  0004 81            	ret	
 230                     	xdef	_RST_GPOutputEnable
 231                     	xdef	_RST_ClearFlag
 232                     	xdef	_RST_GetFlagStatus
 251                     	end
