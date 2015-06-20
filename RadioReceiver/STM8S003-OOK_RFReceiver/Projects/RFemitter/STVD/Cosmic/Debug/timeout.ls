   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  22                     .bit:	section	.data,bit
  23  0000               _Timeout_istout1:
  24  0000 01            	dc.b	1
  25  0001               _Timeout_istout2:
  26  0001 01            	dc.b	1
  27  0002               _Timeout_istout3:
  28  0002 01            	dc.b	1
  29                     	bsct
  30  0000               _Timeout_toutcnt1:
  31  0000 0000          	dc.w	0
  32  0002               _Timeout_toutcnt2:
  33  0002 0000          	dc.w	0
  34  0004               _Timeout_toutcnt3:
  35  0004 0000          	dc.w	0
  36  0006               _Timeout_tout1:
  37  0006 0064          	dc.w	100
  38  0008               _Timeout_tout2:
  39  0008 0064          	dc.w	100
  40  000a               _Timeout_tout3:
  41  000a 0064          	dc.w	100
  85                     ; 17 void Timeout_SetTimeout1(u16 time)
  85                     ; 18 {
  87                     .text:	section	.text,new
  88  0000               _Timeout_SetTimeout1:
  92                     ; 19   Timeout_tout1 = time / TMR_REC;
  94  0000 bf06          	ldw	_Timeout_tout1,x
  95                     ; 20   Timeout_toutcnt1 = 0;
  97  0002 5f            	clrw	x
  98  0003 bf00          	ldw	_Timeout_toutcnt1,x
  99                     ; 21   Timeout_istout1 = FALSE;
 101  0005 72110000      	bres	_Timeout_istout1
 102                     ; 22 }
 105  0009 81            	ret	
 130                     ; 24 u16 Timeout_GetTimeout1()
 130                     ; 25 {
 131                     .text:	section	.text,new
 132  0000               _Timeout_GetTimeout1:
 136                     ; 26   return (2*Timeout_toutcnt1);
 138  0000 be00          	ldw	x,_Timeout_toutcnt1
 139  0002 58            	sllw	x
 142  0003 81            	ret	
 167                     ; 29 _Bool Timeout_IsTimeout1()
 167                     ; 30 {
 168                     .text:	section	.text,new
 169  0000               _Timeout_IsTimeout1:
 173                     ; 31   return Timeout_istout1;
 175  0000 7201000003    	btjf	_Timeout_istout1,L21
 176  0005 a601          	ld	a,#1
 178  0007 81            	ret	
 179  0008               L21:
 180  0008 4f            	clr	a
 183  0009 81            	ret	
 221                     ; 34 void Timeout_SetTimeout2(u16 time)
 221                     ; 35 {
 222                     .text:	section	.text,new
 223  0000               _Timeout_SetTimeout2:
 227                     ; 36   Timeout_tout2 = time / TMR_REC;
 229  0000 bf08          	ldw	_Timeout_tout2,x
 230                     ; 37   Timeout_toutcnt2 = 0;
 232  0002 5f            	clrw	x
 233  0003 bf02          	ldw	_Timeout_toutcnt2,x
 234                     ; 38   Timeout_istout2 = FALSE;
 236  0005 72110001      	bres	_Timeout_istout2
 237                     ; 39 }
 240  0009 81            	ret	
 265                     ; 41 u16 Timeout_GetTimeout2()
 265                     ; 42 {
 266                     .text:	section	.text,new
 267  0000               _Timeout_GetTimeout2:
 271                     ; 43   return (2*Timeout_toutcnt2);
 273  0000 be02          	ldw	x,_Timeout_toutcnt2
 274  0002 58            	sllw	x
 277  0003 81            	ret	
 302                     ; 46 _Bool Timeout_IsTimeout2()
 302                     ; 47 {
 303                     .text:	section	.text,new
 304  0000               _Timeout_IsTimeout2:
 308                     ; 48   return Timeout_istout2;
 310  0000 7201000103    	btjf	_Timeout_istout2,L42
 311  0005 a601          	ld	a,#1
 313  0007 81            	ret	
 314  0008               L42:
 315  0008 4f            	clr	a
 318  0009 81            	ret	
 356                     ; 51 void Timeout_SetTimeout3(u16 time)
 356                     ; 52 {
 357                     .text:	section	.text,new
 358  0000               _Timeout_SetTimeout3:
 362                     ; 53   Timeout_tout3 = time / TMR_REC;
 364  0000 bf0a          	ldw	_Timeout_tout3,x
 365                     ; 54   Timeout_toutcnt3 = 0;
 367  0002 5f            	clrw	x
 368  0003 bf04          	ldw	_Timeout_toutcnt3,x
 369                     ; 55   Timeout_istout3 = FALSE;
 371  0005 72110002      	bres	_Timeout_istout3
 372                     ; 56 }
 375  0009 81            	ret	
 400                     ; 58 u16 Timeout_GetTimeout3()
 400                     ; 59 {
 401                     .text:	section	.text,new
 402  0000               _Timeout_GetTimeout3:
 406                     ; 60   return (2*Timeout_toutcnt3);
 408  0000 be04          	ldw	x,_Timeout_toutcnt3
 409  0002 58            	sllw	x
 412  0003 81            	ret	
 437                     ; 63 _Bool Timeout_IsTimeout3()
 437                     ; 64 {
 438                     .text:	section	.text,new
 439  0000               _Timeout_IsTimeout3:
 443                     ; 65   return Timeout_istout3;
 445  0000 7201000203    	btjf	_Timeout_istout3,L63
 446  0005 a601          	ld	a,#1
 448  0007 81            	ret	
 449  0008               L63:
 450  0008 4f            	clr	a
 453  0009 81            	ret	
 552                     	xdef	_Timeout_IsTimeout3
 553                     	xdef	_Timeout_GetTimeout3
 554                     	xdef	_Timeout_SetTimeout3
 555                     	xdef	_Timeout_IsTimeout2
 556                     	xdef	_Timeout_GetTimeout2
 557                     	xdef	_Timeout_SetTimeout2
 558                     	xdef	_Timeout_IsTimeout1
 559                     	xdef	_Timeout_GetTimeout1
 560                     	xdef	_Timeout_SetTimeout1
 561                     	xdef	_Timeout_tout3
 562                     	xdef	_Timeout_tout2
 563                     	xdef	_Timeout_tout1
 564                     	xdef	_Timeout_toutcnt3
 565                     	xdef	_Timeout_toutcnt2
 566                     	xdef	_Timeout_toutcnt1
 567                     	xdef	_Timeout_istout3
 568                     	xdef	_Timeout_istout2
 569                     	xdef	_Timeout_istout1
 588                     	end
