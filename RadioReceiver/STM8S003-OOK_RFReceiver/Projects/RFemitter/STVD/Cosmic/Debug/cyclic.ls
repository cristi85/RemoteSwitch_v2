   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  21                     	bsct
  22  0000               L3_delay_cnt_100ms:
  23  0000 00            	dc.b	0
  24                     .bit:	section	.data,bit
  25  0000               _CYCLIC_100ms:
  26  0000 00            	dc.b	0
  27                     	bsct
  28  0001               L5_delay_cnt_1s:
  29  0001 0000          	dc.w	0
  30                     	switch	.bit
  31  0001               _CYCLIC_1s:
  32  0001 00            	dc.b	0
  65                     ; 34 void Cyclic_tick(void)
  65                     ; 35 {
  67                     .text:	section	.text,new
  68  0000               _Cyclic_tick:
  72                     ; 48   if(CYCLIC_100ms == FALSE) delay_cnt_100ms++;
  74  0000 7200000002    	btjt	_CYCLIC_100ms,L52
  77  0005 3c00          	inc	L3_delay_cnt_100ms
  78  0007               L52:
  79                     ; 49   if(delay_cnt_100ms >= DELAY_CNT_100MS)
  81  0007 b600          	ld	a,L3_delay_cnt_100ms
  82  0009 a132          	cp	a,#50
  83  000b 2506          	jrult	L72
  84                     ; 51     CYCLIC_100ms = TRUE;
  86  000d 72100000      	bset	_CYCLIC_100ms
  87                     ; 52     delay_cnt_100ms = 0; 
  89  0011 3f00          	clr	L3_delay_cnt_100ms
  90  0013               L72:
  91                     ; 58   if(CYCLIC_1s == FALSE) delay_cnt_1s++;
  93  0013 7200000105    	btjt	_CYCLIC_1s,L13
  96  0018 be01          	ldw	x,L5_delay_cnt_1s
  97  001a 5c            	incw	x
  98  001b bf01          	ldw	L5_delay_cnt_1s,x
  99  001d               L13:
 100                     ; 59   if(delay_cnt_1s >= DELAY_CNT_1S)
 102  001d be01          	ldw	x,L5_delay_cnt_1s
 103  001f a301f4        	cpw	x,#500
 104  0022 2507          	jrult	L33
 105                     ; 61     CYCLIC_1s = TRUE;
 107  0024 72100001      	bset	_CYCLIC_1s
 108                     ; 62     delay_cnt_1s = 0; 
 110  0028 5f            	clrw	x
 111  0029 bf01          	ldw	L5_delay_cnt_1s,x
 112  002b               L33:
 113                     ; 65 }
 116  002b 81            	ret	
 143                     ; 67 void Cyclic_Start()
 143                     ; 68 {
 144                     .text:	section	.text,new
 145  0000               _Cyclic_Start:
 149  0000               L54:
 150                     ; 82     if(CYCLIC_100ms)
 152  0000 7201000007    	btjf	_CYCLIC_100ms,L15
 153                     ; 84 	  TASK_100mS();
 155  0005 cd0000        	call	_TASK_100mS
 157                     ; 85 	  CYCLIC_100ms = FALSE;
 159  0008 72110000      	bres	_CYCLIC_100ms
 160  000c               L15:
 161                     ; 91     if(CYCLIC_1s)
 163  000c 72010001ef    	btjf	_CYCLIC_1s,L54
 164                     ; 93 	  TASK_1000mS();
 166  0011 cd0000        	call	_TASK_1000mS
 168                     ; 94 	  CYCLIC_1s = FALSE;
 170  0014 72110001      	bres	_CYCLIC_1s
 171  0018 20e6          	jra	L54
 224                     	xdef	_Cyclic_Start
 225                     	xdef	_Cyclic_tick
 226                     	xdef	_CYCLIC_1s
 227                     	xdef	_CYCLIC_100ms
 228                     	xref	_TASK_1000mS
 229                     	xref	_TASK_100mS
 248                     	end
