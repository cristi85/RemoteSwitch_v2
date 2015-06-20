   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     .bit:	section	.data,bit
  22  0000               _Timeout_istout1:
  23  0000 01            	dc.b	1
  24  0001               _Timeout_istout2:
  25  0001 01            	dc.b	1
  26  0002               _Timeout_istout3:
  27  0002 01            	dc.b	1
  28                     	bsct
  29  0000               _Timeout_toutcnt1:
  30  0000 0000          	dc.w	0
  31  0002               _Timeout_toutcnt2:
  32  0002 0000          	dc.w	0
  33  0004               _Timeout_toutcnt3:
  34  0004 0000          	dc.w	0
  35  0006               _Timeout_tout1:
  36  0006 0064          	dc.w	100
  37  0008               _Timeout_tout2:
  38  0008 0064          	dc.w	100
  39  000a               _Timeout_tout3:
  40  000a 0064          	dc.w	100
  84                     ; 17 void Timeout_SetTimeout1(u16 time)
  84                     ; 18 {
  86                     .text:	section	.text,new
  87  0000               _Timeout_SetTimeout1:
  91                     ; 19   Timeout_tout1 = time / TMR_REC;
  93  0000 bf06          	ldw	_Timeout_tout1,x
  94                     ; 20   Timeout_toutcnt1 = 0;
  96  0002 5f            	clrw	x
  97  0003 bf00          	ldw	_Timeout_toutcnt1,x
  98                     ; 21   Timeout_istout1 = FALSE;
 100  0005 72110000      	bres	_Timeout_istout1
 101                     ; 22 }
 104  0009 81            	ret	
 129                     ; 24 u16 Timeout_GetTimeout1()
 129                     ; 25 {
 130                     .text:	section	.text,new
 131  0000               _Timeout_GetTimeout1:
 135                     ; 26   return (2*Timeout_toutcnt1);
 137  0000 be00          	ldw	x,_Timeout_toutcnt1
 138  0002 58            	sllw	x
 141  0003 81            	ret	
 166                     ; 29 _Bool Timeout_IsTimeout1()
 166                     ; 30 {
 167                     .text:	section	.text,new
 168  0000               _Timeout_IsTimeout1:
 172                     ; 31   return Timeout_istout1;
 174  0000 7201000003    	btjf	_Timeout_istout1,L21
 175  0005 a601          	ld	a,#1
 177  0007 81            	ret	
 178  0008               L21:
 179  0008 4f            	clr	a
 182  0009 81            	ret	
 220                     ; 34 void Timeout_SetTimeout2(u16 time)
 220                     ; 35 {
 221                     .text:	section	.text,new
 222  0000               _Timeout_SetTimeout2:
 226                     ; 36   Timeout_tout2 = time / TMR_REC;
 228  0000 bf08          	ldw	_Timeout_tout2,x
 229                     ; 37   Timeout_toutcnt2 = 0;
 231  0002 5f            	clrw	x
 232  0003 bf02          	ldw	_Timeout_toutcnt2,x
 233                     ; 38   Timeout_istout2 = FALSE;
 235  0005 72110001      	bres	_Timeout_istout2
 236                     ; 39 }
 239  0009 81            	ret	
 264                     ; 41 u16 Timeout_GetTimeout2()
 264                     ; 42 {
 265                     .text:	section	.text,new
 266  0000               _Timeout_GetTimeout2:
 270                     ; 43   return (2*Timeout_toutcnt2);
 272  0000 be02          	ldw	x,_Timeout_toutcnt2
 273  0002 58            	sllw	x
 276  0003 81            	ret	
 301                     ; 46 _Bool Timeout_IsTimeout2()
 301                     ; 47 {
 302                     .text:	section	.text,new
 303  0000               _Timeout_IsTimeout2:
 307                     ; 48   return Timeout_istout2;
 309  0000 7201000103    	btjf	_Timeout_istout2,L42
 310  0005 a601          	ld	a,#1
 312  0007 81            	ret	
 313  0008               L42:
 314  0008 4f            	clr	a
 317  0009 81            	ret	
 355                     ; 51 void Timeout_SetTimeout3(u16 time)
 355                     ; 52 {
 356                     .text:	section	.text,new
 357  0000               _Timeout_SetTimeout3:
 361                     ; 53   Timeout_tout3 = time / TMR_REC;
 363  0000 bf0a          	ldw	_Timeout_tout3,x
 364                     ; 54   Timeout_toutcnt3 = 0;
 366  0002 5f            	clrw	x
 367  0003 bf04          	ldw	_Timeout_toutcnt3,x
 368                     ; 55   Timeout_istout3 = FALSE;
 370  0005 72110002      	bres	_Timeout_istout3
 371                     ; 56 }
 374  0009 81            	ret	
 399                     ; 58 u16 Timeout_GetTimeout3()
 399                     ; 59 {
 400                     .text:	section	.text,new
 401  0000               _Timeout_GetTimeout3:
 405                     ; 60   return (2*Timeout_toutcnt3);
 407  0000 be04          	ldw	x,_Timeout_toutcnt3
 408  0002 58            	sllw	x
 411  0003 81            	ret	
 436                     ; 63 _Bool Timeout_IsTimeout3()
 436                     ; 64 {
 437                     .text:	section	.text,new
 438  0000               _Timeout_IsTimeout3:
 442                     ; 65   return Timeout_istout3;
 444  0000 7201000203    	btjf	_Timeout_istout3,L63
 445  0005 a601          	ld	a,#1
 447  0007 81            	ret	
 448  0008               L63:
 449  0008 4f            	clr	a
 452  0009 81            	ret	
 551                     	xdef	_Timeout_IsTimeout3
 552                     	xdef	_Timeout_GetTimeout3
 553                     	xdef	_Timeout_SetTimeout3
 554                     	xdef	_Timeout_IsTimeout2
 555                     	xdef	_Timeout_GetTimeout2
 556                     	xdef	_Timeout_SetTimeout2
 557                     	xdef	_Timeout_IsTimeout1
 558                     	xdef	_Timeout_GetTimeout1
 559                     	xdef	_Timeout_SetTimeout1
 560                     	xdef	_Timeout_tout3
 561                     	xdef	_Timeout_tout2
 562                     	xdef	_Timeout_tout1
 563                     	xdef	_Timeout_toutcnt3
 564                     	xdef	_Timeout_toutcnt2
 565                     	xdef	_Timeout_toutcnt1
 566                     	xdef	_Timeout_istout3
 567                     	xdef	_Timeout_istout2
 568                     	xdef	_Timeout_istout1
 587                     	end
