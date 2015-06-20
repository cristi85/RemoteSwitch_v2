   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     .bit:	section	.data,bit
  22  0000               _FLAG_250ms:
  23  0000 00            	dc.b	0
  24                     	bsct
  25  0000               _cnt_flag_250ms:
  26  0000 0000          	dc.w	0
  27                     	switch	.bit
  28  0001               _FLAG_500ms:
  29  0001 00            	dc.b	0
  30                     	bsct
  31  0002               _cnt_flag_500ms:
  32  0002 0000          	dc.w	0
  33                     	switch	.bit
  34  0002               _FLAG_1000ms:
  35  0002 00            	dc.b	0
  36                     	bsct
  37  0004               _cnt_flag_1000ms:
  38  0004 0000          	dc.w	0
  39  0006               _btn1_0_cnt:
  40  0006 00            	dc.b	0
  41  0007               _btn1_1_cnt:
  42  0007 00            	dc.b	0
  43  0008               _BTN1_DEB_STATE:
  44  0008 00            	dc.b	0
  45                     	switch	.bit
  46  0003               _BTN1_DELAY_FLAG:
  47  0003 00            	dc.b	0
  48                     	bsct
  49  0009               _btn1_delay_cnt:
  50  0009 00            	dc.b	0
  51  000a               _BTN1_press_timer:
  52  000a 0000          	dc.w	0
  53  000c               _cnt_state_redLED:
  54  000c 0000          	dc.w	0
  55  000e               _cnt_state_greenLED:
  56  000e 0000          	dc.w	0
  57  0010               _cnt_blink_redLED:
  58  0010 00            	dc.b	0
  59  0011               _cnt_blink_greenLED:
  60  0011 00            	dc.b	0
  61  0012               _blink_redLED_times:
  62  0012 00            	dc.b	0
  63  0013               _blink_greenLED_times:
  64  0013 00            	dc.b	0
  65                     	switch	.bit
  66  0004               _flag_blink_on_off:
  67  0004 01            	dc.b	1
  68  0005               _flag_blink_redLED:
  69  0005 00            	dc.b	0
  70  0006               _flag_blink_greenLED:
  71  0006 00            	dc.b	0
  72  0007               _flag_blink_unlimited:
  73  0007 01            	dc.b	1
 103                     ; 96 INTERRUPT_HANDLER(NonHandledInterrupt,0)
 103                     ; 97 {
 104                     .text:	section	.text,new
 105  0000               f_NonHandledInterrupt:
 109                     ; 101 }
 112  0000 80            	iret	
 134                     ; 109 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 134                     ; 110 {
 135                     .text:	section	.text,new
 136  0000               f_TRAP_IRQHandler:
 140                     ; 114 }
 143  0000 80            	iret	
 165                     ; 121 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 165                     ; 122 {
 166                     .text:	section	.text,new
 167  0000               f_FLASH_IRQHandler:
 171                     ; 126 }
 174  0000 80            	iret	
 196                     ; 133 INTERRUPT_HANDLER(AWU_IRQHandler,4)
 196                     ; 134 {
 197                     .text:	section	.text,new
 198  0000               f_AWU_IRQHandler:
 202                     ; 138 }
 205  0000 80            	iret	
 227                     ; 145 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 227                     ; 146 {
 228                     .text:	section	.text,new
 229  0000               f_EXTIB_IRQHandler:
 233                     ; 150 }
 236  0000 80            	iret	
 258                     ; 157 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 258                     ; 158 {
 259                     .text:	section	.text,new
 260  0000               f_EXTID_IRQHandler:
 264                     ; 162 }
 267  0000 80            	iret	
 289                     ; 169 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 289                     ; 170 {
 290                     .text:	section	.text,new
 291  0000               f_EXTI0_IRQHandler:
 295                     ; 174 }
 298  0000 80            	iret	
 320                     ; 181 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 320                     ; 182 {
 321                     .text:	section	.text,new
 322  0000               f_EXTI1_IRQHandler:
 326                     ; 186 }
 329  0000 80            	iret	
 351                     ; 193 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 351                     ; 194 {
 352                     .text:	section	.text,new
 353  0000               f_EXTI2_IRQHandler:
 357                     ; 198 }
 360  0000 80            	iret	
 382                     ; 205 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 382                     ; 206 {
 383                     .text:	section	.text,new
 384  0000               f_EXTI3_IRQHandler:
 388                     ; 210 }
 391  0000 80            	iret	
 413                     ; 217 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 413                     ; 218 {
 414                     .text:	section	.text,new
 415  0000               f_EXTI4_IRQHandler:
 419                     ; 222 }
 422  0000 80            	iret	
 444                     ; 229 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 444                     ; 230 {
 445                     .text:	section	.text,new
 446  0000               f_EXTI5_IRQHandler:
 450                     ; 234 }
 453  0000 80            	iret	
 475                     ; 241 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 475                     ; 242 
 475                     ; 243 {
 476                     .text:	section	.text,new
 477  0000               f_EXTI6_IRQHandler:
 481                     ; 247 }
 484  0000 80            	iret	
 506                     ; 254 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 506                     ; 255 {
 507                     .text:	section	.text,new
 508  0000               f_EXTI7_IRQHandler:
 512                     ; 259 }
 515  0000 80            	iret	
 537                     ; 266 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
 537                     ; 267 {
 538                     .text:	section	.text,new
 539  0000               f_COMP_IRQHandler:
 543                     ; 271 }
 546  0000 80            	iret	
 603                     ; 278 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 603                     ; 279 {
 604                     .text:	section	.text,new
 605  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 607  0000 8a            	push	cc
 608  0001 84            	pop	a
 609  0002 a4bf          	and	a,#191
 610  0004 88            	push	a
 611  0005 86            	pop	cc
 612  0006 3b0002        	push	c_x+2
 613  0009 be00          	ldw	x,c_x
 614  000b 89            	pushw	x
 615  000c 3b0002        	push	c_y+2
 616  000f be00          	ldw	x,c_y
 617  0011 89            	pushw	x
 620                     ; 283   interrupt_status = 1;
 622  0012 35010000      	mov	L3_interrupt_status,#1
 623                     ; 284   if(TIM2_GetITStatus(TIM2_IT_Update))  //1ms
 625  0016 a601          	ld	a,#1
 626  0018 cd0000        	call	_TIM2_GetITStatus
 628  001b 4d            	tnz	a
 629  001c 2604ac9c019c  	jreq	L312
 630                     ; 287     if(cnt_flag_250ms < U16_MAX) cnt_flag_250ms++;
 632  0022 be00          	ldw	x,_cnt_flag_250ms
 633  0024 a3ffff        	cpw	x,#65535
 634  0027 2403          	jruge	L512
 637  0029 5c            	incw	x
 638  002a bf00          	ldw	_cnt_flag_250ms,x
 639  002c               L512:
 640                     ; 288     if(cnt_flag_250ms >= CNTVAL_250MS) 
 642  002c a300fa        	cpw	x,#250
 643  002f 2507          	jrult	L712
 644                     ; 290       cnt_flag_250ms = 0;
 646  0031 5f            	clrw	x
 647  0032 bf00          	ldw	_cnt_flag_250ms,x
 648                     ; 291       FLAG_250ms = TRUE;
 650  0034 72100000      	bset	_FLAG_250ms
 651  0038               L712:
 652                     ; 293     if(cnt_flag_500ms < U16_MAX) cnt_flag_500ms++;
 654  0038 be02          	ldw	x,_cnt_flag_500ms
 655  003a a3ffff        	cpw	x,#65535
 656  003d 2403          	jruge	L122
 659  003f 5c            	incw	x
 660  0040 bf02          	ldw	_cnt_flag_500ms,x
 661  0042               L122:
 662                     ; 294     if(cnt_flag_500ms >= CNTVAL_500MS) 
 664  0042 a301f4        	cpw	x,#500
 665  0045 2507          	jrult	L322
 666                     ; 296       cnt_flag_500ms = 0;
 668  0047 5f            	clrw	x
 669  0048 bf02          	ldw	_cnt_flag_500ms,x
 670                     ; 297       FLAG_500ms = TRUE;
 672  004a 72100001      	bset	_FLAG_500ms
 673  004e               L322:
 674                     ; 299     if(cnt_flag_1000ms < U16_MAX) cnt_flag_1000ms++;
 676  004e be04          	ldw	x,_cnt_flag_1000ms
 677  0050 a3ffff        	cpw	x,#65535
 678  0053 2403          	jruge	L522
 681  0055 5c            	incw	x
 682  0056 bf04          	ldw	_cnt_flag_1000ms,x
 683  0058               L522:
 684                     ; 300     if(cnt_flag_1000ms >= CNTVAL_1000MS) 
 686  0058 a303e8        	cpw	x,#1000
 687  005b 2507          	jrult	L722
 688                     ; 302       cnt_flag_1000ms = 0;
 690  005d 5f            	clrw	x
 691  005e bf04          	ldw	_cnt_flag_1000ms,x
 692                     ; 303       FLAG_1000ms = TRUE;
 694  0060 72100002      	bset	_FLAG_1000ms
 695  0064               L722:
 696                     ; 306     if(!Timeout_istout1)
 698  0064 720000000d    	btjt	_Timeout_istout1,L132
 699                     ; 308       Timeout_toutcnt1++;
 701  0069 be00          	ldw	x,_Timeout_toutcnt1
 702  006b 5c            	incw	x
 703  006c bf00          	ldw	_Timeout_toutcnt1,x
 704                     ; 309       if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
 706  006e b300          	cpw	x,_Timeout_tout1
 707  0070 2504          	jrult	L132
 710  0072 72100000      	bset	_Timeout_istout1
 711  0076               L132:
 712                     ; 311     if(!Timeout_istout2)
 714  0076 720000000d    	btjt	_Timeout_istout2,L532
 715                     ; 313       Timeout_toutcnt2++;
 717  007b be00          	ldw	x,_Timeout_toutcnt2
 718  007d 5c            	incw	x
 719  007e bf00          	ldw	_Timeout_toutcnt2,x
 720                     ; 314       if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
 722  0080 b300          	cpw	x,_Timeout_tout2
 723  0082 2504          	jrult	L532
 726  0084 72100000      	bset	_Timeout_istout2
 727  0088               L532:
 728                     ; 316     if(!Timeout_istout3)
 730  0088 720000000d    	btjt	_Timeout_istout3,L142
 731                     ; 318       Timeout_toutcnt3++;
 733  008d be00          	ldw	x,_Timeout_toutcnt3
 734  008f 5c            	incw	x
 735  0090 bf00          	ldw	_Timeout_toutcnt3,x
 736                     ; 319       if(Timeout_toutcnt3 >= Timeout_tout3) Timeout_istout3 = TRUE;
 738  0092 b300          	cpw	x,_Timeout_tout3
 739  0094 2504          	jrult	L142
 742  0096 72100000      	bset	_Timeout_istout3
 743  009a               L142:
 744                     ; 323     if(!BTN1_STATE)
 746  009a 7204500116    	btjt	20481,#2,L542
 747                     ; 325       if(btn1_0_cnt < U8_MAX) btn1_0_cnt++;
 749  009f b606          	ld	a,_btn1_0_cnt
 750  00a1 a1ff          	cp	a,#255
 751  00a3 2402          	jruge	L742
 754  00a5 3c06          	inc	_btn1_0_cnt
 755  00a7               L742:
 756                     ; 326       btn1_1_cnt = 0;
 758  00a7 3f07          	clr	_btn1_1_cnt
 759                     ; 327       if(btn1_0_cnt >= DIG_IN_DEB_TIME)
 761  00a9 b606          	ld	a,_btn1_0_cnt
 762  00ab a11e          	cp	a,#30
 763  00ad 2518          	jrult	L352
 764                     ; 329         BTN1_DEB_STATE = BTN_PRESSED;
 766  00af 35010008      	mov	_BTN1_DEB_STATE,#1
 767  00b3 2012          	jra	L352
 768  00b5               L542:
 769                     ; 334       if(btn1_1_cnt < U8_MAX) btn1_1_cnt++;
 771  00b5 b607          	ld	a,_btn1_1_cnt
 772  00b7 a1ff          	cp	a,#255
 773  00b9 2402          	jruge	L552
 776  00bb 3c07          	inc	_btn1_1_cnt
 777  00bd               L552:
 778                     ; 335       btn1_0_cnt = 0;
 780  00bd 3f06          	clr	_btn1_0_cnt
 781                     ; 336       if(btn1_1_cnt >= DIG_IN_DEB_TIME)
 783  00bf b607          	ld	a,_btn1_1_cnt
 784  00c1 a11e          	cp	a,#30
 785  00c3 2502          	jrult	L352
 786                     ; 338         BTN1_DEB_STATE = BTN_DEPRESSED;
 788  00c5 3f08          	clr	_BTN1_DEB_STATE
 789  00c7               L352:
 790                     ; 344     if(BTN1_DEB_STATE == BTN_PRESSED)
 792  00c7 b608          	ld	a,_BTN1_DEB_STATE
 793  00c9 4a            	dec	a
 794  00ca 260a          	jrne	L162
 795                     ; 346       if(BTN1_press_timer < U16_MAX) BTN1_press_timer++;
 797  00cc be0a          	ldw	x,_BTN1_press_timer
 798  00ce a3ffff        	cpw	x,#65535
 799  00d1 2403          	jruge	L162
 802  00d3 5c            	incw	x
 803  00d4 bf0a          	ldw	_BTN1_press_timer,x
 804  00d6               L162:
 805                     ; 349     if(!BTN1_DELAY_FLAG)
 807  00d6 720000030e    	btjt	_BTN1_DELAY_FLAG,L562
 808                     ; 351       btn1_delay_cnt++;
 810  00db 3c09          	inc	_btn1_delay_cnt
 811                     ; 352       if(btn1_delay_cnt == BTN_DELAY)
 813  00dd b609          	ld	a,_btn1_delay_cnt
 814  00df a196          	cp	a,#150
 815  00e1 2606          	jrne	L562
 816                     ; 354         btn1_delay_cnt = 0;
 818  00e3 3f09          	clr	_btn1_delay_cnt
 819                     ; 355         BTN1_DELAY_FLAG = TRUE;
 821  00e5 72100003      	bset	_BTN1_DELAY_FLAG
 822  00e9               L562:
 823                     ; 361     if(flag_blink_redLED)
 825  00e9 7201000550    	btjf	_flag_blink_redLED,L172
 826                     ; 363       if(cnt_state_redLED < U16_MAX) cnt_state_redLED++;
 828  00ee be0c          	ldw	x,_cnt_state_redLED
 829  00f0 a3ffff        	cpw	x,#65535
 830  00f3 2403          	jruge	L372
 833  00f5 5c            	incw	x
 834  00f6 bf0c          	ldw	_cnt_state_redLED,x
 835  00f8               L372:
 836                     ; 364       if(flag_blink_on_off)
 838  00f8 7201000412    	btjf	_flag_blink_on_off,L572
 839                     ; 366         if(cnt_state_redLED >= LEDBLINK_ONTIME)
 841  00fd a30032        	cpw	x,#50
 842  0100 253c          	jrult	L172
 843                     ; 368           flag_blink_on_off = FALSE;
 845  0102 72110004      	bres	_flag_blink_on_off
 846                     ; 369           cnt_state_redLED = 0;
 848  0106 5f            	clrw	x
 849  0107 bf0c          	ldw	_cnt_state_redLED,x
 850                     ; 370           LED_OFF;
 852  0109 7217500a      	bres	20490,#3
 855  010d 202b          	jpf	LC001
 856  010f               L572:
 857                     ; 375         if(cnt_state_redLED >= LEDBLINK_OFFTIME)
 859  010f a300c8        	cpw	x,#200
 860  0112 252a          	jrult	L172
 861                     ; 377           if(cnt_blink_redLED < U8_MAX) cnt_blink_redLED++;
 863  0114 b610          	ld	a,_cnt_blink_redLED
 864  0116 a1ff          	cp	a,#255
 865  0118 2402          	jruge	L503
 868  011a 3c10          	inc	_cnt_blink_redLED
 869  011c               L503:
 870                     ; 378           flag_blink_on_off = TRUE;
 872  011c 72100004      	bset	_flag_blink_on_off
 873                     ; 379           cnt_state_redLED = 0;
 875  0120 5f            	clrw	x
 876  0121 bf0c          	ldw	_cnt_state_redLED,x
 877                     ; 380           if(cnt_blink_redLED >= blink_redLED_times && !flag_blink_unlimited)
 879  0123 b610          	ld	a,_cnt_blink_redLED
 880  0125 b112          	cp	a,_blink_redLED_times
 881  0127 250d          	jrult	L703
 883  0129 7200000708    	btjt	_flag_blink_unlimited,L703
 884                     ; 382             flag_blink_redLED = FALSE;
 886  012e 72110005      	bres	_flag_blink_redLED
 887                     ; 383             cnt_blink_redLED = 0;
 889  0132 3f10          	clr	_cnt_blink_redLED
 891  0134 2008          	jra	L172
 892  0136               L703:
 893                     ; 387             LED_RED_ON;
 895  0136 7216500a      	bset	20490,#3
 898  013a               LC001:
 900  013a 7219500a      	bres	20490,#4
 902  013e               L172:
 903                     ; 392     if(flag_blink_greenLED)
 905  013e 7201000654    	btjf	_flag_blink_greenLED,L313
 906                     ; 394       if(cnt_state_greenLED < U16_MAX) cnt_state_greenLED++;
 908  0143 be0e          	ldw	x,_cnt_state_greenLED
 909  0145 a3ffff        	cpw	x,#65535
 910  0148 2403          	jruge	L513
 913  014a 5c            	incw	x
 914  014b bf0e          	ldw	_cnt_state_greenLED,x
 915  014d               L513:
 916                     ; 395       if(flag_blink_on_off)
 918  014d 7201000416    	btjf	_flag_blink_on_off,L713
 919                     ; 397         if(cnt_state_greenLED >= LEDBLINK_ONTIME)
 921  0152 a30032        	cpw	x,#50
 922  0155 2540          	jrult	L313
 923                     ; 399           flag_blink_on_off = FALSE;
 925  0157 72110004      	bres	_flag_blink_on_off
 926                     ; 400           cnt_state_greenLED = 0;
 928  015b 5f            	clrw	x
 929  015c bf0e          	ldw	_cnt_state_greenLED,x
 930                     ; 401           LED_OFF;
 932  015e 7217500a      	bres	20490,#3
 935  0162 7219500a      	bres	20490,#4
 937  0166 202f          	jra	L313
 938  0168               L713:
 939                     ; 406         if(cnt_state_greenLED >= LEDBLINK_OFFTIME)
 941  0168 a300c8        	cpw	x,#200
 942  016b 252a          	jrult	L313
 943                     ; 408           if(cnt_blink_greenLED < U8_MAX) cnt_blink_greenLED++;
 945  016d b611          	ld	a,_cnt_blink_greenLED
 946  016f a1ff          	cp	a,#255
 947  0171 2402          	jruge	L723
 950  0173 3c11          	inc	_cnt_blink_greenLED
 951  0175               L723:
 952                     ; 409           flag_blink_on_off = TRUE;
 954  0175 72100004      	bset	_flag_blink_on_off
 955                     ; 410           cnt_state_greenLED = 0;
 957  0179 5f            	clrw	x
 958  017a bf0e          	ldw	_cnt_state_greenLED,x
 959                     ; 411           if(cnt_blink_greenLED >= blink_greenLED_times && !flag_blink_unlimited)
 961  017c b611          	ld	a,_cnt_blink_greenLED
 962  017e b113          	cp	a,_blink_greenLED_times
 963  0180 250d          	jrult	L133
 965  0182 7200000708    	btjt	_flag_blink_unlimited,L133
 966                     ; 413             flag_blink_greenLED = FALSE;
 968  0187 72110006      	bres	_flag_blink_greenLED
 969                     ; 414             cnt_blink_greenLED = 0;
 971  018b 3f11          	clr	_cnt_blink_greenLED
 973  018d 2008          	jra	L313
 974  018f               L133:
 975                     ; 418             LED_GREEN_ON;
 977  018f 7217500a      	bres	20490,#3
 980  0193 7218500a      	bset	20490,#4
 982  0197               L313:
 983                     ; 424     TIM2_ClearITPendingBit(TIM2_IT_Update);        // clear TIM2 update interrupt flag
 985  0197 a601          	ld	a,#1
 986  0199 cd0000        	call	_TIM2_ClearITPendingBit
 988  019c               L312:
 989                     ; 426   interrupt_status = 0;
 991  019c 3f00          	clr	L3_interrupt_status
 992                     ; 427 }
 995  019e 85            	popw	x
 996  019f bf00          	ldw	c_y,x
 997  01a1 320002        	pop	c_y+2
 998  01a4 85            	popw	x
 999  01a5 bf00          	ldw	c_x,x
1000  01a7 320002        	pop	c_x+2
1001  01aa 80            	iret	
1024                     ; 434 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
1024                     ; 435 {
1025                     .text:	section	.text,new
1026  0000               f_TIM2_CAP_IRQHandler:
1030                     ; 439 }
1033  0000 80            	iret	
1056                     ; 447 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
1056                     ; 448 {
1057                     .text:	section	.text,new
1058  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
1062                     ; 452 }
1065  0000 80            	iret	
1088                     ; 458 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
1088                     ; 459 {
1089                     .text:	section	.text,new
1090  0000               f_TIM3_CAP_IRQHandler:
1094                     ; 463 }
1097  0000 80            	iret	
1120                     ; 469 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
1120                     ; 470 {
1121                     .text:	section	.text,new
1122  0000               f_TIM4_UPD_OVF_IRQHandler:
1126                     ; 474 }
1129  0000 80            	iret	
1151                     ; 481 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
1151                     ; 482 {
1152                     .text:	section	.text,new
1153  0000               f_SPI_IRQHandler:
1157                     ; 486 }
1160  0000 80            	iret	
1183                     ; 492 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
1183                     ; 493 {
1184                     .text:	section	.text,new
1185  0000               f_USART_TX_IRQHandler:
1189                     ; 497 }
1192  0000 80            	iret	
1215                     ; 504 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
1215                     ; 505 {
1216                     .text:	section	.text,new
1217  0000               f_USART_RX_IRQHandler:
1221                     ; 509 }
1224  0000 80            	iret	
1246                     ; 517 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
1246                     ; 518 {
1247                     .text:	section	.text,new
1248  0000               f_I2C_IRQHandler:
1252                     ; 522 }
1255  0000 80            	iret	
1487                     	xdef	_cnt_blink_greenLED
1488                     	xdef	_cnt_blink_redLED
1489                     	switch	.ubsct
1490  0000               L3_interrupt_status:
1491  0000 00            	ds.b	1
1492                     	xref.b	_Timeout_tout3
1493                     	xref.b	_Timeout_tout2
1494                     	xref.b	_Timeout_tout1
1495                     	xref.b	_Timeout_toutcnt3
1496                     	xref.b	_Timeout_toutcnt2
1497                     	xref.b	_Timeout_toutcnt1
1498                     	xbit	_Timeout_istout3
1499                     	xbit	_Timeout_istout2
1500                     	xbit	_Timeout_istout1
1501                     	xdef	_btn1_delay_cnt
1502                     	xdef	_btn1_1_cnt
1503                     	xdef	_btn1_0_cnt
1504                     	xdef	_cnt_flag_1000ms
1505                     	xdef	_cnt_flag_500ms
1506                     	xdef	_cnt_flag_250ms
1507                     	xdef	f_I2C_IRQHandler
1508                     	xdef	f_USART_RX_IRQHandler
1509                     	xdef	f_USART_TX_IRQHandler
1510                     	xdef	f_SPI_IRQHandler
1511                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1512                     	xdef	f_TIM3_CAP_IRQHandler
1513                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
1514                     	xdef	f_TIM2_CAP_IRQHandler
1515                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
1516                     	xdef	f_COMP_IRQHandler
1517                     	xdef	f_EXTI7_IRQHandler
1518                     	xdef	f_EXTI6_IRQHandler
1519                     	xdef	f_EXTI5_IRQHandler
1520                     	xdef	f_EXTI4_IRQHandler
1521                     	xdef	f_EXTI3_IRQHandler
1522                     	xdef	f_EXTI2_IRQHandler
1523                     	xdef	f_EXTI1_IRQHandler
1524                     	xdef	f_EXTI0_IRQHandler
1525                     	xdef	f_EXTID_IRQHandler
1526                     	xdef	f_EXTIB_IRQHandler
1527                     	xdef	f_AWU_IRQHandler
1528                     	xdef	f_FLASH_IRQHandler
1529                     	xdef	f_TRAP_IRQHandler
1530                     	xdef	f_NonHandledInterrupt
1531                     	xdef	_flag_blink_unlimited
1532                     	xdef	_flag_blink_greenLED
1533                     	xdef	_flag_blink_redLED
1534                     	xdef	_flag_blink_on_off
1535                     	xdef	_cnt_state_greenLED
1536                     	xdef	_cnt_state_redLED
1537                     	xdef	_blink_greenLED_times
1538                     	xdef	_blink_redLED_times
1539                     	xdef	_FLAG_1000ms
1540                     	xdef	_FLAG_500ms
1541                     	xdef	_FLAG_250ms
1542                     	xdef	_BTN1_press_timer
1543                     	xdef	_BTN1_DELAY_FLAG
1544                     	xdef	_BTN1_DEB_STATE
1545                     	xref	_TIM2_ClearITPendingBit
1546                     	xref	_TIM2_GetITStatus
1547                     	xref.b	c_x
1548                     	xref.b	c_y
1568                     	end
