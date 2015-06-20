   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     .const:	section	.text
  22  0000               L5_error_cnt_thr:
  23  0000 01            	dc.b	1
  24  0001 01            	dc.b	1
  25  0002 01            	dc.b	1
  26  0003 01            	dc.b	1
  27  0004 01            	dc.b	1
  28  0005 01            	dc.b	1
  70                     ; 8 void Errors_Init()
  70                     ; 9 {
  72                     .text:	section	.text,new
  73  0000               _Errors_Init:
  75  0000 88            	push	a
  76       00000001      OFST:	set	1
  79                     ; 11   for(i = 0; i < ERRORS; i++)
  81  0001 4f            	clr	a
  82  0002 6b01          	ld	(OFST+0,sp),a
  83  0004               L53:
  84                     ; 13     error_cnt[i] = 0;
  86  0004 5f            	clrw	x
  87  0005 97            	ld	xl,a
  88  0006 6f06          	clr	(L3_error_cnt,x)
  89                     ; 14     error_state[i] = 0;
  91  0008 5f            	clrw	x
  92  0009 97            	ld	xl,a
  93  000a 6f00          	clr	(L7_error_state,x)
  94                     ; 11   for(i = 0; i < ERRORS; i++)
  96  000c 0c01          	inc	(OFST+0,sp)
  99  000e 7b01          	ld	a,(OFST+0,sp)
 100  0010 a106          	cp	a,#6
 101  0012 25f0          	jrult	L53
 102                     ; 16 }
 105  0014 84            	pop	a
 106  0015 81            	ret	
 143                     ; 17 void Errors_SetError(u8 ErrorID)
 143                     ; 18 {
 144                     .text:	section	.text,new
 145  0000               _Errors_SetError:
 147  0000 88            	push	a
 148       00000000      OFST:	set	0
 151                     ; 19   if(error_cnt[ErrorID] < U8_MAX) error_cnt[ErrorID]++;
 153  0001 5f            	clrw	x
 154  0002 97            	ld	xl,a
 155  0003 e606          	ld	a,(L3_error_cnt,x)
 156  0005 a1ff          	cp	a,#255
 157  0007 2406          	jruge	L16
 160  0009 7b01          	ld	a,(OFST+1,sp)
 161  000b 5f            	clrw	x
 162  000c 97            	ld	xl,a
 163  000d 6c06          	inc	(L3_error_cnt,x)
 164  000f               L16:
 165                     ; 20   if(error_cnt[ErrorID] >= error_cnt_thr[ErrorID])
 167  000f 7b01          	ld	a,(OFST+1,sp)
 168  0011 5f            	clrw	x
 169  0012 97            	ld	xl,a
 170  0013 905f          	clrw	y
 171  0015 9097          	ld	yl,a
 172  0017 90e606        	ld	a,(L3_error_cnt,y)
 173  001a d10000        	cp	a,(L5_error_cnt_thr,x)
 174  001d 2508          	jrult	L36
 175                     ; 22     error_state[ErrorID] = TRUE;
 177  001f 7b01          	ld	a,(OFST+1,sp)
 178  0021 5f            	clrw	x
 179  0022 97            	ld	xl,a
 180  0023 a601          	ld	a,#1
 181  0025 e700          	ld	(L7_error_state,x),a
 182  0027               L36:
 183                     ; 24 }
 186  0027 84            	pop	a
 187  0028 81            	ret	
 223                     ; 25 void Errors_ResetError(u8 ErrorID)
 223                     ; 26 {
 224                     .text:	section	.text,new
 225  0000               _Errors_ResetError:
 227  0000 88            	push	a
 228       00000000      OFST:	set	0
 231                     ; 27   if(error_cnt[ErrorID] > 0) error_cnt[ErrorID]--;
 233  0001 5f            	clrw	x
 234  0002 97            	ld	xl,a
 235  0003 6d06          	tnz	(L3_error_cnt,x)
 236  0005 2704          	jreq	L301
 239  0007 5f            	clrw	x
 240  0008 97            	ld	xl,a
 241  0009 6a06          	dec	(L3_error_cnt,x)
 242  000b               L301:
 243                     ; 28   if(error_cnt[ErrorID] == 0)
 245  000b 7b01          	ld	a,(OFST+1,sp)
 246  000d 5f            	clrw	x
 247  000e 97            	ld	xl,a
 248  000f 6d06          	tnz	(L3_error_cnt,x)
 249  0011 2604          	jrne	L501
 250                     ; 30     error_state[ErrorID] = FALSE;
 252  0013 5f            	clrw	x
 253  0014 97            	ld	xl,a
 254  0015 6f00          	clr	(L7_error_state,x)
 255  0017               L501:
 256                     ; 32 }
 259  0017 84            	pop	a
 260  0018 81            	ret	
 316                     ; 33 bool Errors_CheckError(u8 ErrorID)
 316                     ; 34 {
 317                     .text:	section	.text,new
 318  0000               _Errors_CheckError:
 322                     ; 35   return error_state[ErrorID];
 324  0000 5f            	clrw	x
 325  0001 97            	ld	xl,a
 326  0002 e600          	ld	a,(L7_error_state,x)
 329  0004 81            	ret	
 365                     ; 38 bool Errors_IsError()
 365                     ; 39 {
 366                     .text:	section	.text,new
 367  0000               _Errors_IsError:
 369  0000 88            	push	a
 370       00000001      OFST:	set	1
 373                     ; 41   for(i = 0; i < ERRORS; i++)
 375  0001 4f            	clr	a
 376  0002 6b01          	ld	(OFST+0,sp),a
 377  0004               L351:
 378                     ; 43     if(error_state[i]) return TRUE;
 380  0004 5f            	clrw	x
 381  0005 97            	ld	xl,a
 382  0006 e600          	ld	a,(L7_error_state,x)
 383  0008 2705          	jreq	L161
 386  000a a601          	ld	a,#1
 389  000c 5b01          	addw	sp,#1
 390  000e 81            	ret	
 391  000f               L161:
 392                     ; 41   for(i = 0; i < ERRORS; i++)
 394  000f 0c01          	inc	(OFST+0,sp)
 397  0011 7b01          	ld	a,(OFST+0,sp)
 398  0013 a106          	cp	a,#6
 399  0015 25ed          	jrult	L351
 400                     ; 45   return FALSE;
 402  0017 4f            	clr	a
 405  0018 5b01          	addw	sp,#1
 406  001a 81            	ret	
 450                     ; 48 u8 Errors_NumErrors(void)
 450                     ; 49 {
 451                     .text:	section	.text,new
 452  0000               _Errors_NumErrors:
 454  0000 89            	pushw	x
 455       00000002      OFST:	set	2
 458                     ; 50   u8 i, numerrors = 0;
 460  0001 0f01          	clr	(OFST-1,sp)
 461                     ; 51   for(i = 0; i < ERRORS; i++)
 463  0003 4f            	clr	a
 464  0004 6b02          	ld	(OFST+0,sp),a
 465  0006               L502:
 466                     ; 53     if(error_state[i]) numerrors++;
 468  0006 5f            	clrw	x
 469  0007 97            	ld	xl,a
 470  0008 e600          	ld	a,(L7_error_state,x)
 471  000a 2702          	jreq	L312
 474  000c 0c01          	inc	(OFST-1,sp)
 475  000e               L312:
 476                     ; 51   for(i = 0; i < ERRORS; i++)
 478  000e 0c02          	inc	(OFST+0,sp)
 481  0010 7b02          	ld	a,(OFST+0,sp)
 482  0012 a106          	cp	a,#6
 483  0014 25f0          	jrult	L502
 484                     ; 55   return numerrors;
 486  0016 7b01          	ld	a,(OFST-1,sp)
 489  0018 85            	popw	x
 490  0019 81            	ret	
 535                     	switch	.ubsct
 536  0000               L7_error_state:
 537  0000 000000000000  	ds.b	6
 538  0006               L3_error_cnt:
 539  0006 000000000000  	ds.b	6
 540                     	xdef	_Errors_NumErrors
 541                     	xdef	_Errors_IsError
 542                     	xdef	_Errors_CheckError
 543                     	xdef	_Errors_ResetError
 544                     	xdef	_Errors_SetError
 545                     	xdef	_Errors_Init
 565                     	end
