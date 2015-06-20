   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     .const:	section	.text
  22  0000               _HSIDivFactor:
  23  0000 01            	dc.b	1
  24  0001 02            	dc.b	2
  25  0002 04            	dc.b	4
  26  0003 08            	dc.b	8
  55                     ; 68 void CLK_DeInit(void)
  55                     ; 69 {
  57                     .text:	section	.text,new
  58  0000               _CLK_DeInit:
  62                     ; 70   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  64  0000 350350c0      	mov	20672,#3
  65                     ; 71   CLK->PCKENR = CLK_PCKENR_RESET_VALUE;
  67  0004 725f50c3      	clr	20675
  68                     ; 72   CLK->CCOR  = CLK_CCOR_RESET_VALUE;
  70  0008 725f50c5      	clr	20677
  71                     ; 73 }
  74  000c 81            	ret	
 129                     ; 80 void CLK_CCOCmd(FunctionalState NewState)
 129                     ; 81 {
 130                     .text:	section	.text,new
 131  0000               _CLK_CCOCmd:
 135                     ; 83   assert_param(IS_FUNCTIONAL_STATE(NewState));
 137                     ; 85   if (NewState != DISABLE)
 139  0000 4d            	tnz	a
 140  0001 2705          	jreq	L74
 141                     ; 88     CLK->CCOR |= CLK_CCOR_CCOEN;
 143  0003 721050c5      	bset	20677,#0
 146  0007 81            	ret	
 147  0008               L74:
 148                     ; 93     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 150  0008 721150c5      	bres	20677,#0
 151                     ; 96 }
 154  000c 81            	ret	
 259                     ; 113 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 259                     ; 114 {
 260                     .text:	section	.text,new
 261  0000               _CLK_PeripheralClockConfig:
 263  0000 89            	pushw	x
 264       00000000      OFST:	set	0
 267                     ; 116     assert_param(IS_FUNCTIONAL_STATE(NewState));
 269                     ; 117     assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
 271                     ; 119     if (NewState != DISABLE)
 273  0001 9f            	ld	a,xl
 274  0002 4d            	tnz	a
 275  0003 2706          	jreq	L711
 276                     ; 122       CLK->PCKENR |= ((uint8_t)CLK_Peripheral);
 278  0005 9e            	ld	a,xh
 279  0006 ca50c3        	or	a,20675
 281  0009 2006          	jra	L121
 282  000b               L711:
 283                     ; 127       CLK->PCKENR &= (uint8_t)(~(uint8_t)CLK_Peripheral);
 285  000b 7b01          	ld	a,(OFST+1,sp)
 286  000d 43            	cpl	a
 287  000e c450c3        	and	a,20675
 288  0011               L121:
 289  0011 c750c3        	ld	20675,a
 290                     ; 129 }
 293  0014 85            	popw	x
 294  0015 81            	ret	
 369                     ; 141 void CLK_MasterPrescalerConfig(CLK_MasterPrescaler_TypeDef CLK_MasterPrescaler)
 369                     ; 142 {
 370                     .text:	section	.text,new
 371  0000               _CLK_MasterPrescalerConfig:
 373  0000 88            	push	a
 374       00000000      OFST:	set	0
 377                     ; 144   assert_param(IS_CLK_MASTER_PRESCALER(CLK_MasterPrescaler));
 379                     ; 146   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
 381  0001 c650c0        	ld	a,20672
 382  0004 a4fc          	and	a,#252
 383  0006 c750c0        	ld	20672,a
 384                     ; 147   CLK->CKDIVR = (uint8_t)CLK_MasterPrescaler;
 386  0009 7b01          	ld	a,(OFST+1,sp)
 387  000b c750c0        	ld	20672,a
 388                     ; 148 }
 391  000e 84            	pop	a
 392  000f 81            	ret	
 465                     ; 161 void CLK_CCOConfig(CLK_Output_TypeDef CLK_Output)
 465                     ; 162 {
 466                     .text:	section	.text,new
 467  0000               _CLK_CCOConfig:
 469  0000 88            	push	a
 470       00000000      OFST:	set	0
 473                     ; 164   assert_param(IS_CLK_OUTPUT(CLK_Output));
 475                     ; 167   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
 477  0001 c650c5        	ld	a,20677
 478  0004 a4f9          	and	a,#249
 479  0006 c750c5        	ld	20677,a
 480                     ; 170   CLK->CCOR |= ((uint8_t)CLK_Output);
 482  0009 c650c5        	ld	a,20677
 483  000c 1a01          	or	a,(OFST+1,sp)
 484  000e c750c5        	ld	20677,a
 485                     ; 173   CLK->CCOR |= CLK_CCOR_CCOEN;
 487  0011 721050c5      	bset	20677,#0
 488                     ; 174 }
 491  0015 84            	pop	a
 492  0016 81            	ret	
 545                     ; 181 uint32_t CLK_GetClockFreq(void)
 545                     ; 182 {
 546                     .text:	section	.text,new
 547  0000               _CLK_GetClockFreq:
 549  0000 5209          	subw	sp,#9
 550       00000009      OFST:	set	9
 553                     ; 183   uint32_t clockfrequency = 0;
 555                     ; 184   uint8_t tmp = 0, presc = 0;
 559                     ; 186   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
 561  0002 c650c0        	ld	a,20672
 562  0005 a403          	and	a,#3
 563                     ; 187   presc = HSIDivFactor[tmp];
 565  0007 5f            	clrw	x
 566  0008 97            	ld	xl,a
 567  0009 d60000        	ld	a,(_HSIDivFactor,x)
 568  000c 6b09          	ld	(OFST+0,sp),a
 569                     ; 188   clockfrequency = HSI_VALUE / presc;
 571  000e b703          	ld	c_lreg+3,a
 572  0010 3f02          	clr	c_lreg+2
 573  0012 3f01          	clr	c_lreg+1
 574  0014 3f00          	clr	c_lreg
 575  0016 96            	ldw	x,sp
 576  0017 5c            	incw	x
 577  0018 cd0000        	call	c_rtol
 579  001b ae2400        	ldw	x,#9216
 580  001e bf02          	ldw	c_lreg+2,x
 581  0020 ae00f4        	ldw	x,#244
 582  0023 bf00          	ldw	c_lreg,x
 583  0025 96            	ldw	x,sp
 584  0026 5c            	incw	x
 585  0027 cd0000        	call	c_ludv
 587  002a 96            	ldw	x,sp
 588  002b 1c0005        	addw	x,#OFST-4
 589  002e cd0000        	call	c_rtol
 591                     ; 190   return((uint32_t)clockfrequency);
 593  0031 96            	ldw	x,sp
 594  0032 1c0005        	addw	x,#OFST-4
 595  0035 cd0000        	call	c_ltor
 599  0038 5b09          	addw	sp,#9
 600  003a 81            	ret	
 625                     	xdef	_HSIDivFactor
 626                     	xdef	_CLK_GetClockFreq
 627                     	xdef	_CLK_CCOConfig
 628                     	xdef	_CLK_MasterPrescalerConfig
 629                     	xdef	_CLK_PeripheralClockConfig
 630                     	xdef	_CLK_CCOCmd
 631                     	xdef	_CLK_DeInit
 632                     	xref.b	c_lreg
 633                     	xref.b	c_x
 652                     	xref	c_ltor
 653                     	xref	c_ludv
 654                     	xref	c_rtol
 655                     	end
