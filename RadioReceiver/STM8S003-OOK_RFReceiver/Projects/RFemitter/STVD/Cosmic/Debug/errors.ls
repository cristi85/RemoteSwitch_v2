   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  22                     .const:	section	.text
  23  0000               L5_error_cnt_thr:
  24  0000 01            	dc.b	1
  25  0001 01            	dc.b	1
  26  0002 01            	dc.b	1
  27  0003 01            	dc.b	1
  28  0004 01            	dc.b	1
  29  0005 01            	dc.b	1
  71                     ; 8 void Errors_Init()
  71                     ; 9 {
  73                     .text:	section	.text,new
  74  0000               _Errors_Init:
  76  0000 88            	push	a
  77       00000001      OFST:	set	1
  80                     ; 11   for(i = 0; i < ERRORS; i++)
  82  0001 4f            	clr	a
  83  0002 6b01          	ld	(OFST+0,sp),a
  84  0004               L53:
  85                     ; 13     error_cnt[i] = 0;
  87  0004 5f            	clrw	x
  88  0005 97            	ld	xl,a
  89  0006 6f06          	clr	(L3_error_cnt,x)
  90                     ; 14     error_state[i] = 0;
  92  0008 5f            	clrw	x
  93  0009 97            	ld	xl,a
  94  000a 6f00          	clr	(L7_error_state,x)
  95                     ; 11   for(i = 0; i < ERRORS; i++)
  97  000c 0c01          	inc	(OFST+0,sp)
 100  000e 7b01          	ld	a,(OFST+0,sp)
 101  0010 a106          	cp	a,#6
 102  0012 25f0          	jrult	L53
 103                     ; 16 }
 106  0014 84            	pop	a
 107  0015 81            	ret	
 144                     ; 17 void Errors_SetError(u8 ErrorID)
 144                     ; 18 {
 145                     .text:	section	.text,new
 146  0000               _Errors_SetError:
 148  0000 88            	push	a
 149       00000000      OFST:	set	0
 152                     ; 19   if(error_cnt[ErrorID] < U8_MAX) error_cnt[ErrorID]++;
 154  0001 5f            	clrw	x
 155  0002 97            	ld	xl,a
 156  0003 e606          	ld	a,(L3_error_cnt,x)
 157  0005 a1ff          	cp	a,#255
 158  0007 2406          	jruge	L16
 161  0009 7b01          	ld	a,(OFST+1,sp)
 162  000b 5f            	clrw	x
 163  000c 97            	ld	xl,a
 164  000d 6c06          	inc	(L3_error_cnt,x)
 165  000f               L16:
 166                     ; 20   if(error_cnt[ErrorID] >= error_cnt_thr[ErrorID])
 168  000f 7b01          	ld	a,(OFST+1,sp)
 169  0011 5f            	clrw	x
 170  0012 97            	ld	xl,a
 171  0013 905f          	clrw	y
 172  0015 9097          	ld	yl,a
 173  0017 90e606        	ld	a,(L3_error_cnt,y)
 174  001a d10000        	cp	a,(L5_error_cnt_thr,x)
 175  001d 2508          	jrult	L36
 176                     ; 22     error_state[ErrorID] = TRUE;
 178  001f 7b01          	ld	a,(OFST+1,sp)
 179  0021 5f            	clrw	x
 180  0022 97            	ld	xl,a
 181  0023 a601          	ld	a,#1
 182  0025 e700          	ld	(L7_error_state,x),a
 183  0027               L36:
 184                     ; 24 }
 187  0027 84            	pop	a
 188  0028 81            	ret	
 224                     ; 25 void Errors_ResetError(u8 ErrorID)
 224                     ; 26 {
 225                     .text:	section	.text,new
 226  0000               _Errors_ResetError:
 228  0000 88            	push	a
 229       00000000      OFST:	set	0
 232                     ; 27   if(error_cnt[ErrorID] > 0) error_cnt[ErrorID]--;
 234  0001 5f            	clrw	x
 235  0002 97            	ld	xl,a
 236  0003 6d06          	tnz	(L3_error_cnt,x)
 237  0005 2704          	jreq	L301
 240  0007 5f            	clrw	x
 241  0008 97            	ld	xl,a
 242  0009 6a06          	dec	(L3_error_cnt,x)
 243  000b               L301:
 244                     ; 28   if(error_cnt[ErrorID] == 0)
 246  000b 7b01          	ld	a,(OFST+1,sp)
 247  000d 5f            	clrw	x
 248  000e 97            	ld	xl,a
 249  000f 6d06          	tnz	(L3_error_cnt,x)
 250  0011 2604          	jrne	L501
 251                     ; 30     error_state[ErrorID] = FALSE;
 253  0013 5f            	clrw	x
 254  0014 97            	ld	xl,a
 255  0015 6f00          	clr	(L7_error_state,x)
 256  0017               L501:
 257                     ; 32 }
 260  0017 84            	pop	a
 261  0018 81            	ret	
 317                     ; 33 bool Errors_CheckError(u8 ErrorID)
 317                     ; 34 {
 318                     .text:	section	.text,new
 319  0000               _Errors_CheckError:
 323                     ; 35   return error_state[ErrorID];
 325  0000 5f            	clrw	x
 326  0001 97            	ld	xl,a
 327  0002 e600          	ld	a,(L7_error_state,x)
 330  0004 81            	ret	
 366                     ; 38 bool Errors_IsError()
 366                     ; 39 {
 367                     .text:	section	.text,new
 368  0000               _Errors_IsError:
 370  0000 88            	push	a
 371       00000001      OFST:	set	1
 374                     ; 41   for(i = 0; i < ERRORS; i++)
 376  0001 4f            	clr	a
 377  0002 6b01          	ld	(OFST+0,sp),a
 378  0004               L351:
 379                     ; 43     if(error_state[i]) return TRUE;
 381  0004 5f            	clrw	x
 382  0005 97            	ld	xl,a
 383  0006 e600          	ld	a,(L7_error_state,x)
 384  0008 2705          	jreq	L161
 387  000a a601          	ld	a,#1
 390  000c 5b01          	addw	sp,#1
 391  000e 81            	ret	
 392  000f               L161:
 393                     ; 41   for(i = 0; i < ERRORS; i++)
 395  000f 0c01          	inc	(OFST+0,sp)
 398  0011 7b01          	ld	a,(OFST+0,sp)
 399  0013 a106          	cp	a,#6
 400  0015 25ed          	jrult	L351
 401                     ; 45   return FALSE;
 403  0017 4f            	clr	a
 406  0018 5b01          	addw	sp,#1
 407  001a 81            	ret	
 451                     ; 48 u8 Errors_NumErrors(void)
 451                     ; 49 {
 452                     .text:	section	.text,new
 453  0000               _Errors_NumErrors:
 455  0000 89            	pushw	x
 456       00000002      OFST:	set	2
 459                     ; 50   u8 i, numerrors = 0;
 461  0001 0f01          	clr	(OFST-1,sp)
 462                     ; 51   for(i = 0; i < ERRORS; i++)
 464  0003 4f            	clr	a
 465  0004 6b02          	ld	(OFST+0,sp),a
 466  0006               L502:
 467                     ; 53     if(error_state[i]) numerrors++;
 469  0006 5f            	clrw	x
 470  0007 97            	ld	xl,a
 471  0008 e600          	ld	a,(L7_error_state,x)
 472  000a 2702          	jreq	L312
 475  000c 0c01          	inc	(OFST-1,sp)
 476  000e               L312:
 477                     ; 51   for(i = 0; i < ERRORS; i++)
 479  000e 0c02          	inc	(OFST+0,sp)
 482  0010 7b02          	ld	a,(OFST+0,sp)
 483  0012 a106          	cp	a,#6
 484  0014 25f0          	jrult	L502
 485                     ; 55   return numerrors;
 487  0016 7b01          	ld	a,(OFST-1,sp)
 490  0018 85            	popw	x
 491  0019 81            	ret	
 536                     	switch	.ubsct
 537  0000               L7_error_state:
 538  0000 000000000000  	ds.b	6
 539  0006               L3_error_cnt:
 540  0006 000000000000  	ds.b	6
 541                     	xdef	_Errors_NumErrors
 542                     	xdef	_Errors_IsError
 543                     	xdef	_Errors_CheckError
 544                     	xdef	_Errors_ResetError
 545                     	xdef	_Errors_SetError
 546                     	xdef	_Errors_Init
 566                     	end
