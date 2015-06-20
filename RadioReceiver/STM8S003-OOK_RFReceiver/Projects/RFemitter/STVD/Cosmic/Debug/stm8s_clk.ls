   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  22                     .const:	section	.text
  23  0000               _HSIDivFactor:
  24  0000 01            	dc.b	1
  25  0001 02            	dc.b	2
  26  0002 04            	dc.b	4
  27  0003 08            	dc.b	8
  28  0004               _CLKPrescTable:
  29  0004 01            	dc.b	1
  30  0005 02            	dc.b	2
  31  0006 04            	dc.b	4
  32  0007 08            	dc.b	8
  33  0008 0a            	dc.b	10
  34  0009 10            	dc.b	16
  35  000a 14            	dc.b	20
  36  000b 28            	dc.b	40
  65                     ; 66 void CLK_DeInit(void)
  65                     ; 67 {
  67                     .text:	section	.text,new
  68  0000               _CLK_DeInit:
  72                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  74  0000 350150c0      	mov	20672,#1
  75                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  77  0004 725f50c1      	clr	20673
  78                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  80  0008 35e150c4      	mov	20676,#225
  81                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  83  000c 725f50c5      	clr	20677
  84                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  86  0010 351850c6      	mov	20678,#24
  87                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  89  0014 35ff50c7      	mov	20679,#255
  90                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  92  0018 35ff50ca      	mov	20682,#255
  93                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  95  001c 725f50c8      	clr	20680
  96                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  98  0020 725f50c9      	clr	20681
 100  0024               L52:
 101                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 103  0024 720050c9fb    	btjt	20681,#0,L52
 104                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 106  0029 725f50c9      	clr	20681
 107                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 109  002d 725f50cc      	clr	20684
 110                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 112  0031 725f50cd      	clr	20685
 113                     ; 84 }
 116  0035 81            	ret	
 172                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 172                     ; 96 {
 173                     .text:	section	.text,new
 174  0000               _CLK_FastHaltWakeUpCmd:
 178                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 180                     ; 101     if (NewState != DISABLE)
 182  0000 4d            	tnz	a
 183  0001 2705          	jreq	L75
 184                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 186  0003 721450c0      	bset	20672,#2
 189  0007 81            	ret	
 190  0008               L75:
 191                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 193  0008 721550c0      	bres	20672,#2
 194                     ; 112 }
 197  000c 81            	ret	
 232                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 232                     ; 120 {
 233                     .text:	section	.text,new
 234  0000               _CLK_HSECmd:
 238                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 240                     ; 125     if (NewState != DISABLE)
 242  0000 4d            	tnz	a
 243  0001 2705          	jreq	L101
 244                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 246  0003 721050c1      	bset	20673,#0
 249  0007 81            	ret	
 250  0008               L101:
 251                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 253  0008 721150c1      	bres	20673,#0
 254                     ; 136 }
 257  000c 81            	ret	
 292                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 292                     ; 144 {
 293                     .text:	section	.text,new
 294  0000               _CLK_HSICmd:
 298                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 300                     ; 149     if (NewState != DISABLE)
 302  0000 4d            	tnz	a
 303  0001 2705          	jreq	L321
 304                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 306  0003 721050c0      	bset	20672,#0
 309  0007 81            	ret	
 310  0008               L321:
 311                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 313  0008 721150c0      	bres	20672,#0
 314                     ; 160 }
 317  000c 81            	ret	
 352                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 352                     ; 168 {
 353                     .text:	section	.text,new
 354  0000               _CLK_LSICmd:
 358                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 360                     ; 173     if (NewState != DISABLE)
 362  0000 4d            	tnz	a
 363  0001 2705          	jreq	L541
 364                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 366  0003 721650c0      	bset	20672,#3
 369  0007 81            	ret	
 370  0008               L541:
 371                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 373  0008 721750c0      	bres	20672,#3
 374                     ; 184 }
 377  000c 81            	ret	
 412                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 412                     ; 193 {
 413                     .text:	section	.text,new
 414  0000               _CLK_CCOCmd:
 418                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 420                     ; 198     if (NewState != DISABLE)
 422  0000 4d            	tnz	a
 423  0001 2705          	jreq	L761
 424                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 426  0003 721050c9      	bset	20681,#0
 429  0007 81            	ret	
 430  0008               L761:
 431                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 433  0008 721150c9      	bres	20681,#0
 434                     ; 209 }
 437  000c 81            	ret	
 472                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 472                     ; 219 {
 473                     .text:	section	.text,new
 474  0000               _CLK_ClockSwitchCmd:
 478                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 480                     ; 224     if (NewState != DISABLE )
 482  0000 4d            	tnz	a
 483  0001 2705          	jreq	L112
 484                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 486  0003 721250c5      	bset	20677,#1
 489  0007 81            	ret	
 490  0008               L112:
 491                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 493  0008 721350c5      	bres	20677,#1
 494                     ; 235 }
 497  000c 81            	ret	
 533                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 533                     ; 246 {
 534                     .text:	section	.text,new
 535  0000               _CLK_SlowActiveHaltWakeUpCmd:
 539                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 541                     ; 251     if (NewState != DISABLE)
 543  0000 4d            	tnz	a
 544  0001 2705          	jreq	L332
 545                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 547  0003 721a50c0      	bset	20672,#5
 550  0007 81            	ret	
 551  0008               L332:
 552                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 554  0008 721b50c0      	bres	20672,#5
 555                     ; 262 }
 558  000c 81            	ret	
 717                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 717                     ; 273 {
 718                     .text:	section	.text,new
 719  0000               _CLK_PeripheralClockConfig:
 721  0000 89            	pushw	x
 722       00000000      OFST:	set	0
 725                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 727                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 729                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 731  0001 9e            	ld	a,xh
 732  0002 a510          	bcp	a,#16
 733  0004 2626          	jrne	L123
 734                     ; 281         if (NewState != DISABLE)
 736  0006 7b02          	ld	a,(OFST+2,sp)
 737  0008 270f          	jreq	L323
 738                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 740  000a 7b01          	ld	a,(OFST+1,sp)
 741  000c ad44          	call	LC003
 742  000e 2704          	jreq	L62
 743  0010               L03:
 744  0010 48            	sll	a
 745  0011 5a            	decw	x
 746  0012 26fc          	jrne	L03
 747  0014               L62:
 748  0014 ca50c7        	or	a,20679
 750  0017 200e          	jp	LC002
 751  0019               L323:
 752                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 754  0019 7b01          	ld	a,(OFST+1,sp)
 755  001b ad35          	call	LC003
 756  001d 2704          	jreq	L23
 757  001f               L43:
 758  001f 48            	sll	a
 759  0020 5a            	decw	x
 760  0021 26fc          	jrne	L43
 761  0023               L23:
 762  0023 43            	cpl	a
 763  0024 c450c7        	and	a,20679
 764  0027               LC002:
 765  0027 c750c7        	ld	20679,a
 766  002a 2024          	jra	L723
 767  002c               L123:
 768                     ; 294         if (NewState != DISABLE)
 770  002c 7b02          	ld	a,(OFST+2,sp)
 771  002e 270f          	jreq	L133
 772                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 774  0030 7b01          	ld	a,(OFST+1,sp)
 775  0032 ad1e          	call	LC003
 776  0034 2704          	jreq	L63
 777  0036               L04:
 778  0036 48            	sll	a
 779  0037 5a            	decw	x
 780  0038 26fc          	jrne	L04
 781  003a               L63:
 782  003a ca50ca        	or	a,20682
 784  003d 200e          	jp	LC001
 785  003f               L133:
 786                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 788  003f 7b01          	ld	a,(OFST+1,sp)
 789  0041 ad0f          	call	LC003
 790  0043 2704          	jreq	L24
 791  0045               L44:
 792  0045 48            	sll	a
 793  0046 5a            	decw	x
 794  0047 26fc          	jrne	L44
 795  0049               L24:
 796  0049 43            	cpl	a
 797  004a c450ca        	and	a,20682
 798  004d               LC001:
 799  004d c750ca        	ld	20682,a
 800  0050               L723:
 801                     ; 306 }
 804  0050 85            	popw	x
 805  0051 81            	ret	
 806  0052               LC003:
 807  0052 a40f          	and	a,#15
 808  0054 5f            	clrw	x
 809  0055 97            	ld	xl,a
 810  0056 a601          	ld	a,#1
 811  0058 5d            	tnzw	x
 812  0059 81            	ret	
1000                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1000                     ; 320 {
1001                     .text:	section	.text,new
1002  0000               _CLK_ClockSwitchConfig:
1004  0000 89            	pushw	x
1005  0001 5204          	subw	sp,#4
1006       00000004      OFST:	set	4
1009                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1011  0003 ae0491        	ldw	x,#1169
1012  0006 1f03          	ldw	(OFST-1,sp),x
1013                     ; 324     ErrorStatus Swif = ERROR;
1015                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1017                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1019                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1021                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1023                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1025  0008 c650c3        	ld	a,20675
1026  000b 6b01          	ld	(OFST-3,sp),a
1027                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1029  000d 7b05          	ld	a,(OFST+1,sp)
1030  000f 4a            	dec	a
1031  0010 262d          	jrne	L544
1032                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1034  0012 721250c5      	bset	20677,#1
1035                     ; 343         if (ITState != DISABLE)
1037  0016 7b09          	ld	a,(OFST+5,sp)
1038  0018 2706          	jreq	L744
1039                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1041  001a 721450c5      	bset	20677,#2
1043  001e 2004          	jra	L154
1044  0020               L744:
1045                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1047  0020 721550c5      	bres	20677,#2
1048  0024               L154:
1049                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1051  0024 7b06          	ld	a,(OFST+2,sp)
1052  0026 c750c4        	ld	20676,a
1054  0029 2003          	jra	L754
1055  002b               L354:
1056                     ; 357             DownCounter--;
1058  002b 5a            	decw	x
1059  002c 1f03          	ldw	(OFST-1,sp),x
1060  002e               L754:
1061                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1063  002e 720150c504    	btjf	20677,#0,L364
1065  0033 1e03          	ldw	x,(OFST-1,sp)
1066  0035 26f4          	jrne	L354
1067  0037               L364:
1068                     ; 360         if (DownCounter != 0)
1070  0037 1e03          	ldw	x,(OFST-1,sp)
1071                     ; 362             Swif = SUCCESS;
1073  0039 2617          	jrne	LC004
1074                     ; 366             Swif = ERROR;
1076  003b 0f02          	clr	(OFST-2,sp)
1077  003d 2017          	jra	L174
1078  003f               L544:
1079                     ; 374         if (ITState != DISABLE)
1081  003f 7b09          	ld	a,(OFST+5,sp)
1082  0041 2706          	jreq	L374
1083                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1085  0043 721450c5      	bset	20677,#2
1087  0047 2004          	jra	L574
1088  0049               L374:
1089                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1091  0049 721550c5      	bres	20677,#2
1092  004d               L574:
1093                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1095  004d 7b06          	ld	a,(OFST+2,sp)
1096  004f c750c4        	ld	20676,a
1097                     ; 388         Swif = SUCCESS;
1099  0052               LC004:
1101  0052 a601          	ld	a,#1
1102  0054 6b02          	ld	(OFST-2,sp),a
1103  0056               L174:
1104                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1106  0056 7b0a          	ld	a,(OFST+6,sp)
1107  0058 260c          	jrne	L774
1109  005a 7b01          	ld	a,(OFST-3,sp)
1110  005c a1e1          	cp	a,#225
1111  005e 2606          	jrne	L774
1112                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1114  0060 721150c0      	bres	20672,#0
1116  0064 201e          	jra	L105
1117  0066               L774:
1118                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1120  0066 7b0a          	ld	a,(OFST+6,sp)
1121  0068 260c          	jrne	L305
1123  006a 7b01          	ld	a,(OFST-3,sp)
1124  006c a1d2          	cp	a,#210
1125  006e 2606          	jrne	L305
1126                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1128  0070 721750c0      	bres	20672,#3
1130  0074 200e          	jra	L105
1131  0076               L305:
1132                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1134  0076 7b0a          	ld	a,(OFST+6,sp)
1135  0078 260a          	jrne	L105
1137  007a 7b01          	ld	a,(OFST-3,sp)
1138  007c a1b4          	cp	a,#180
1139  007e 2604          	jrne	L105
1140                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1142  0080 721150c1      	bres	20673,#0
1143  0084               L105:
1144                     ; 406     return(Swif);
1146  0084 7b02          	ld	a,(OFST-2,sp)
1149  0086 5b06          	addw	sp,#6
1150  0088 81            	ret	
1288                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1288                     ; 417 {
1289                     .text:	section	.text,new
1290  0000               _CLK_HSIPrescalerConfig:
1292  0000 88            	push	a
1293       00000000      OFST:	set	0
1296                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1298                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1300  0001 c650c6        	ld	a,20678
1301  0004 a4e7          	and	a,#231
1302  0006 c750c6        	ld	20678,a
1303                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1305  0009 c650c6        	ld	a,20678
1306  000c 1a01          	or	a,(OFST+1,sp)
1307  000e c750c6        	ld	20678,a
1308                     ; 428 }
1311  0011 84            	pop	a
1312  0012 81            	ret	
1447                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1447                     ; 440 {
1448                     .text:	section	.text,new
1449  0000               _CLK_CCOConfig:
1451  0000 88            	push	a
1452       00000000      OFST:	set	0
1455                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1457                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1459  0001 c650c9        	ld	a,20681
1460  0004 a4e1          	and	a,#225
1461  0006 c750c9        	ld	20681,a
1462                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1464  0009 c650c9        	ld	a,20681
1465  000c 1a01          	or	a,(OFST+1,sp)
1466  000e c750c9        	ld	20681,a
1467                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1469  0011 721050c9      	bset	20681,#0
1470                     ; 454 }
1473  0015 84            	pop	a
1474  0016 81            	ret	
1539                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1539                     ; 465 {
1540                     .text:	section	.text,new
1541  0000               _CLK_ITConfig:
1543  0000 89            	pushw	x
1544       00000000      OFST:	set	0
1547                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1549                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1551                     ; 471     if (NewState != DISABLE)
1553  0001 9f            	ld	a,xl
1554  0002 4d            	tnz	a
1555  0003 2715          	jreq	L507
1556                     ; 473         switch (CLK_IT)
1558  0005 9e            	ld	a,xh
1560                     ; 481         default:
1560                     ; 482             break;
1561  0006 a00c          	sub	a,#12
1562  0008 270a          	jreq	L146
1563  000a a010          	sub	a,#16
1564  000c 2620          	jrne	L317
1565                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1565                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1567  000e 721450c5      	bset	20677,#2
1568                     ; 477             break;
1570  0012 201a          	jra	L317
1571  0014               L146:
1572                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1572                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1574  0014 721450c8      	bset	20680,#2
1575                     ; 480             break;
1577  0018 2014          	jra	L317
1578                     ; 481         default:
1578                     ; 482             break;
1581  001a               L507:
1582                     ; 487         switch (CLK_IT)
1584  001a 7b01          	ld	a,(OFST+1,sp)
1586                     ; 495         default:
1586                     ; 496             break;
1587  001c a00c          	sub	a,#12
1588  001e 270a          	jreq	L746
1589  0020 a010          	sub	a,#16
1590  0022 260a          	jrne	L317
1591                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1591                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1593  0024 721550c5      	bres	20677,#2
1594                     ; 491             break;
1596  0028 2004          	jra	L317
1597  002a               L746:
1598                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1598                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1600  002a 721550c8      	bres	20680,#2
1601                     ; 494             break;
1602  002e               L317:
1603                     ; 500 }
1606  002e 85            	popw	x
1607  002f 81            	ret	
1608                     ; 495         default:
1608                     ; 496             break;
1644                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1644                     ; 508 {
1645                     .text:	section	.text,new
1646  0000               _CLK_SYSCLKConfig:
1648  0000 88            	push	a
1649       00000000      OFST:	set	0
1652                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1654                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1656  0001 a580          	bcp	a,#128
1657  0003 260e          	jrne	L737
1658                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1660  0005 c650c6        	ld	a,20678
1661  0008 a4e7          	and	a,#231
1662  000a c750c6        	ld	20678,a
1663                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1665  000d 7b01          	ld	a,(OFST+1,sp)
1666  000f a418          	and	a,#24
1668  0011 200c          	jra	L147
1669  0013               L737:
1670                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1672  0013 c650c6        	ld	a,20678
1673  0016 a4f8          	and	a,#248
1674  0018 c750c6        	ld	20678,a
1675                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1677  001b 7b01          	ld	a,(OFST+1,sp)
1678  001d a407          	and	a,#7
1679  001f               L147:
1680  001f ca50c6        	or	a,20678
1681  0022 c750c6        	ld	20678,a
1682                     ; 524 }
1685  0025 84            	pop	a
1686  0026 81            	ret	
1742                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1742                     ; 532 {
1743                     .text:	section	.text,new
1744  0000               _CLK_SWIMConfig:
1748                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1750                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1752  0000 4d            	tnz	a
1753  0001 2705          	jreq	L177
1754                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1756  0003 721050cd      	bset	20685,#0
1759  0007 81            	ret	
1760  0008               L177:
1761                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1763  0008 721150cd      	bres	20685,#0
1764                     ; 548 }
1767  000c 81            	ret	
1791                     ; 557 void CLK_ClockSecuritySystemEnable(void)
1791                     ; 558 {
1792                     .text:	section	.text,new
1793  0000               _CLK_ClockSecuritySystemEnable:
1797                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
1799  0000 721050c8      	bset	20680,#0
1800                     ; 561 }
1803  0004 81            	ret	
1828                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1828                     ; 570 {
1829                     .text:	section	.text,new
1830  0000               _CLK_GetSYSCLKSource:
1834                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
1836  0000 c650c3        	ld	a,20675
1839  0003 81            	ret	
1902                     ; 579 uint32_t CLK_GetClockFreq(void)
1902                     ; 580 {
1903                     .text:	section	.text,new
1904  0000               _CLK_GetClockFreq:
1906  0000 5209          	subw	sp,#9
1907       00000009      OFST:	set	9
1910                     ; 582     uint32_t clockfrequency = 0;
1912                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1914                     ; 584     uint8_t tmp = 0, presc = 0;
1918                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1920  0002 c650c3        	ld	a,20675
1921  0005 6b09          	ld	(OFST+0,sp),a
1922                     ; 589     if (clocksource == CLK_SOURCE_HSI)
1924  0007 a1e1          	cp	a,#225
1925  0009 2634          	jrne	L7401
1926                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1928  000b c650c6        	ld	a,20678
1929  000e a418          	and	a,#24
1930  0010 44            	srl	a
1931  0011 44            	srl	a
1932  0012 44            	srl	a
1933                     ; 592         tmp = (uint8_t)(tmp >> 3);
1935                     ; 593         presc = HSIDivFactor[tmp];
1937  0013 5f            	clrw	x
1938  0014 97            	ld	xl,a
1939  0015 d60000        	ld	a,(_HSIDivFactor,x)
1940  0018 6b09          	ld	(OFST+0,sp),a
1941                     ; 594         clockfrequency = HSI_VALUE / presc;
1943  001a b703          	ld	c_lreg+3,a
1944  001c 3f02          	clr	c_lreg+2
1945  001e 3f01          	clr	c_lreg+1
1946  0020 3f00          	clr	c_lreg
1947  0022 96            	ldw	x,sp
1948  0023 5c            	incw	x
1949  0024 cd0000        	call	c_rtol
1951  0027 ae2400        	ldw	x,#9216
1952  002a bf02          	ldw	c_lreg+2,x
1953  002c ae00f4        	ldw	x,#244
1954  002f bf00          	ldw	c_lreg,x
1955  0031 96            	ldw	x,sp
1956  0032 5c            	incw	x
1957  0033 cd0000        	call	c_ludv
1959  0036 96            	ldw	x,sp
1960  0037 1c0005        	addw	x,#OFST-4
1961  003a cd0000        	call	c_rtol
1964  003d 2018          	jra	L1501
1965  003f               L7401:
1966                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
1968  003f a1d2          	cp	a,#210
1969  0041 260a          	jrne	L3501
1970                     ; 598         clockfrequency = LSI_VALUE;
1972  0043 aef400        	ldw	x,#62464
1973  0046 1f07          	ldw	(OFST-2,sp),x
1974  0048 ae0001        	ldw	x,#1
1976  004b 2008          	jp	LC005
1977  004d               L3501:
1978                     ; 602         clockfrequency = HSE_VALUE;
1980  004d ae2400        	ldw	x,#9216
1981  0050 1f07          	ldw	(OFST-2,sp),x
1982  0052 ae00f4        	ldw	x,#244
1983  0055               LC005:
1984  0055 1f05          	ldw	(OFST-4,sp),x
1985  0057               L1501:
1986                     ; 605     return((uint32_t)clockfrequency);
1988  0057 96            	ldw	x,sp
1989  0058 1c0005        	addw	x,#OFST-4
1990  005b cd0000        	call	c_ltor
1994  005e 5b09          	addw	sp,#9
1995  0060 81            	ret	
2094                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2094                     ; 617 {
2095                     .text:	section	.text,new
2096  0000               _CLK_AdjustHSICalibrationValue:
2098  0000 88            	push	a
2099       00000000      OFST:	set	0
2102                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2104                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2106  0001 c650cc        	ld	a,20684
2107  0004 a4f8          	and	a,#248
2108  0006 1a01          	or	a,(OFST+1,sp)
2109  0008 c750cc        	ld	20684,a
2110                     ; 625 }
2113  000b 84            	pop	a
2114  000c 81            	ret	
2138                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2138                     ; 637 {
2139                     .text:	section	.text,new
2140  0000               _CLK_SYSCLKEmergencyClear:
2144                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2146  0000 721150c5      	bres	20677,#0
2147                     ; 639 }
2150  0004 81            	ret	
2303                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2303                     ; 649 {
2304                     .text:	section	.text,new
2305  0000               _CLK_GetFlagStatus:
2307  0000 89            	pushw	x
2308  0001 5203          	subw	sp,#3
2309       00000003      OFST:	set	3
2312                     ; 651     uint16_t statusreg = 0;
2314                     ; 652     uint8_t tmpreg = 0;
2316                     ; 653     FlagStatus bitstatus = RESET;
2318                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2320                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2322  0003 01            	rrwa	x,a
2323  0004 4f            	clr	a
2324  0005 02            	rlwa	x,a
2325  0006 1f01          	ldw	(OFST-2,sp),x
2326                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2328  0008 a30100        	cpw	x,#256
2329  000b 2605          	jrne	L1221
2330                     ; 664         tmpreg = CLK->ICKR;
2332  000d c650c0        	ld	a,20672
2334  0010 2021          	jra	L3221
2335  0012               L1221:
2336                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2338  0012 a30200        	cpw	x,#512
2339  0015 2605          	jrne	L5221
2340                     ; 668         tmpreg = CLK->ECKR;
2342  0017 c650c1        	ld	a,20673
2344  001a 2017          	jra	L3221
2345  001c               L5221:
2346                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2348  001c a30300        	cpw	x,#768
2349  001f 2605          	jrne	L1321
2350                     ; 672         tmpreg = CLK->SWCR;
2352  0021 c650c5        	ld	a,20677
2354  0024 200d          	jra	L3221
2355  0026               L1321:
2356                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2358  0026 a30400        	cpw	x,#1024
2359  0029 2605          	jrne	L5321
2360                     ; 676         tmpreg = CLK->CSSR;
2362  002b c650c8        	ld	a,20680
2364  002e 2003          	jra	L3221
2365  0030               L5321:
2366                     ; 680         tmpreg = CLK->CCOR;
2368  0030 c650c9        	ld	a,20681
2369  0033               L3221:
2370  0033 6b03          	ld	(OFST+0,sp),a
2371                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2373  0035 7b05          	ld	a,(OFST+2,sp)
2374  0037 1503          	bcp	a,(OFST+0,sp)
2375  0039 2704          	jreq	L1421
2376                     ; 685         bitstatus = SET;
2378  003b a601          	ld	a,#1
2380  003d 2001          	jra	L3421
2381  003f               L1421:
2382                     ; 689         bitstatus = RESET;
2384  003f 4f            	clr	a
2385  0040               L3421:
2386                     ; 693     return((FlagStatus)bitstatus);
2390  0040 5b05          	addw	sp,#5
2391  0042 81            	ret	
2437                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2437                     ; 704 {
2438                     .text:	section	.text,new
2439  0000               _CLK_GetITStatus:
2441  0000 88            	push	a
2442  0001 88            	push	a
2443       00000001      OFST:	set	1
2446                     ; 706     ITStatus bitstatus = RESET;
2448                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
2450                     ; 711     if (CLK_IT == CLK_IT_SWIF)
2452  0002 a11c          	cp	a,#28
2453  0004 2609          	jrne	L7621
2454                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2456  0006 c450c5        	and	a,20677
2457  0009 a10c          	cp	a,#12
2458  000b 260f          	jrne	L7721
2459                     ; 716             bitstatus = SET;
2461  000d 2009          	jp	LC007
2462                     ; 720             bitstatus = RESET;
2463  000f               L7621:
2464                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2466  000f c650c8        	ld	a,20680
2467  0012 1402          	and	a,(OFST+1,sp)
2468  0014 a10c          	cp	a,#12
2469  0016 2604          	jrne	L7721
2470                     ; 728             bitstatus = SET;
2472  0018               LC007:
2474  0018 a601          	ld	a,#1
2476  001a 2001          	jra	L5721
2477  001c               L7721:
2478                     ; 732             bitstatus = RESET;
2481  001c 4f            	clr	a
2482  001d               L5721:
2483                     ; 737     return bitstatus;
2487  001d 85            	popw	x
2488  001e 81            	ret	
2524                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2524                     ; 748 {
2525                     .text:	section	.text,new
2526  0000               _CLK_ClearITPendingBit:
2530                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
2532                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2534  0000 a10c          	cp	a,#12
2535  0002 2605          	jrne	L1231
2536                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2538  0004 721750c8      	bres	20680,#3
2541  0008 81            	ret	
2542  0009               L1231:
2543                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2545  0009 721750c5      	bres	20677,#3
2546                     ; 764 }
2549  000d 81            	ret	
2584                     	xdef	_CLKPrescTable
2585                     	xdef	_HSIDivFactor
2586                     	xdef	_CLK_ClearITPendingBit
2587                     	xdef	_CLK_GetITStatus
2588                     	xdef	_CLK_GetFlagStatus
2589                     	xdef	_CLK_GetSYSCLKSource
2590                     	xdef	_CLK_GetClockFreq
2591                     	xdef	_CLK_AdjustHSICalibrationValue
2592                     	xdef	_CLK_SYSCLKEmergencyClear
2593                     	xdef	_CLK_ClockSecuritySystemEnable
2594                     	xdef	_CLK_SWIMConfig
2595                     	xdef	_CLK_SYSCLKConfig
2596                     	xdef	_CLK_ITConfig
2597                     	xdef	_CLK_CCOConfig
2598                     	xdef	_CLK_HSIPrescalerConfig
2599                     	xdef	_CLK_ClockSwitchConfig
2600                     	xdef	_CLK_PeripheralClockConfig
2601                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2602                     	xdef	_CLK_FastHaltWakeUpCmd
2603                     	xdef	_CLK_ClockSwitchCmd
2604                     	xdef	_CLK_CCOCmd
2605                     	xdef	_CLK_LSICmd
2606                     	xdef	_CLK_HSICmd
2607                     	xdef	_CLK_HSECmd
2608                     	xdef	_CLK_DeInit
2609                     	xref.b	c_lreg
2610                     	xref.b	c_x
2629                     	xref	c_ltor
2630                     	xref	c_ludv
2631                     	xref	c_rtol
2632                     	end
