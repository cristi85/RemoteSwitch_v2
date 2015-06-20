   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 63 void TIM2_DeInit(void)
  49                     ; 64 {
  51                     .text:	section	.text,new
  52  0000               _TIM2_DeInit:
  56                     ; 65   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  58  0000 725f5250      	clr	21072
  59                     ; 66   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  61  0004 725f5251      	clr	21073
  62                     ; 67   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  64  0008 725f5252      	clr	21074
  65                     ; 68   TIM2->ETR = TIM_ETR_RESET_VALUE;
  67  000c 725f5253      	clr	21075
  68                     ; 69   TIM2->IER = TIM_IER_RESET_VALUE;
  70  0010 725f5254      	clr	21076
  71                     ; 70   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  73  0014 725f5256      	clr	21078
  74                     ; 73   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  76  0018 725f525a      	clr	21082
  77                     ; 75   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  79  001c 35015258      	mov	21080,#1
  80                     ; 76   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  82  0020 35015259      	mov	21081,#1
  83                     ; 79   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  85  0024 725f525a      	clr	21082
  86                     ; 80   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  88  0028 725f5258      	clr	21080
  89                     ; 81   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  91  002c 725f5259      	clr	21081
  92                     ; 83   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  94  0030 725f525b      	clr	21083
  95                     ; 84   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  97  0034 725f525c      	clr	21084
  98                     ; 86   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
 100  0038 725f525d      	clr	21085
 101                     ; 88   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
 103  003c 35ff525e      	mov	21086,#255
 104                     ; 89   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
 106  0040 35ff525f      	mov	21087,#255
 107                     ; 91   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 109  0044 725f5260      	clr	21088
 110                     ; 92   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 112  0048 725f5261      	clr	21089
 113                     ; 93   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 115  004c 725f5262      	clr	21090
 116                     ; 94   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 118  0050 725f5263      	clr	21091
 119                     ; 96   TIM2->OISR = TIM_OISR_RESET_VALUE;
 121  0054 725f5265      	clr	21093
 122                     ; 97   TIM2->EGR = 0x01;/*TIM_EGR_UG;*/
 124  0058 35015257      	mov	21079,#1
 125                     ; 98   TIM2->BKR = TIM_BKR_RESET_VALUE;
 127  005c 725f5264      	clr	21092
 128                     ; 99   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 130  0060 725f5255      	clr	21077
 131                     ; 100 }
 134  0064 81            	ret	
 296                     ; 124 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 296                     ; 125                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 296                     ; 126                        uint16_t TIM2_Period)
 296                     ; 127 {
 297                     .text:	section	.text,new
 298  0000               _TIM2_TimeBaseInit:
 300  0000 89            	pushw	x
 301       00000000      OFST:	set	0
 304                     ; 129   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 306                     ; 130   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 308                     ; 133   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 310  0001 7b05          	ld	a,(OFST+5,sp)
 311  0003 c7525e        	ld	21086,a
 312                     ; 134   TIM2->ARRL = (uint8_t)(TIM2_Period);
 314  0006 7b06          	ld	a,(OFST+6,sp)
 315  0008 c7525f        	ld	21087,a
 316                     ; 137   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 318  000b 9e            	ld	a,xh
 319  000c c7525d        	ld	21085,a
 320                     ; 140   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 322  000f c65250        	ld	a,21072
 323  0012 a48f          	and	a,#143
 324  0014 c75250        	ld	21072,a
 325                     ; 141   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 327  0017 9f            	ld	a,xl
 328  0018 ca5250        	or	a,21072
 329  001b c75250        	ld	21072,a
 330                     ; 142 }
 333  001e 85            	popw	x
 334  001f 81            	ret	
 532                     ; 169 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 532                     ; 170                   TIM2_OutputState_TypeDef TIM2_OutputState,
 532                     ; 171                   uint16_t TIM2_Pulse,
 532                     ; 172                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 532                     ; 173                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 532                     ; 174 {
 533                     .text:	section	.text,new
 534  0000               _TIM2_OC1Init:
 536  0000 89            	pushw	x
 537  0001 88            	push	a
 538       00000001      OFST:	set	1
 541                     ; 175   uint8_t tmpccmr1 = 0;
 543                     ; 178   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 545                     ; 179   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 547                     ; 180   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 549                     ; 181   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 551                     ; 183   tmpccmr1 = TIM2->CCMR1;
 553  0002 c65258        	ld	a,21080
 554  0005 6b01          	ld	(OFST+0,sp),a
 555                     ; 186   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 557  0007 7211525a      	bres	21082,#0
 558                     ; 188   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 560  000b a48f          	and	a,#143
 561  000d 6b01          	ld	(OFST+0,sp),a
 562                     ; 191   tmpccmr1 |= (uint8_t)TIM2_OCMode;
 564  000f 9e            	ld	a,xh
 565  0010 1a01          	or	a,(OFST+0,sp)
 566  0012 6b01          	ld	(OFST+0,sp),a
 567                     ; 193   TIM2->CCMR1 = tmpccmr1;
 569  0014 c75258        	ld	21080,a
 570                     ; 196   if (TIM2_OutputState == TIM2_OutputState_Enable)
 572  0017 9f            	ld	a,xl
 573  0018 4a            	dec	a
 574  0019 2606          	jrne	L722
 575                     ; 198     TIM2->CCER1 |= TIM_CCER1_CC1E;
 577  001b 7210525a      	bset	21082,#0
 579  001f 2004          	jra	L132
 580  0021               L722:
 581                     ; 202     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 583  0021 7211525a      	bres	21082,#0
 584  0025               L132:
 585                     ; 206   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 587  0025 7b08          	ld	a,(OFST+7,sp)
 588  0027 4a            	dec	a
 589  0028 2606          	jrne	L332
 590                     ; 208     TIM2->CCER1 |= TIM_CCER1_CC1P;
 592  002a 7212525a      	bset	21082,#1
 594  002e 2004          	jra	L532
 595  0030               L332:
 596                     ; 212     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 598  0030 7213525a      	bres	21082,#1
 599  0034               L532:
 600                     ; 216   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 602  0034 7b09          	ld	a,(OFST+8,sp)
 603  0036 4a            	dec	a
 604  0037 2606          	jrne	L732
 605                     ; 218     TIM2->OISR |= TIM_OISR_OIS1;
 607  0039 72105265      	bset	21093,#0
 609  003d 2004          	jra	L142
 610  003f               L732:
 611                     ; 222     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 613  003f 72115265      	bres	21093,#0
 614  0043               L142:
 615                     ; 226   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 617  0043 7b06          	ld	a,(OFST+5,sp)
 618  0045 c75260        	ld	21088,a
 619                     ; 227   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 621  0048 7b07          	ld	a,(OFST+6,sp)
 622  004a c75261        	ld	21089,a
 623                     ; 228 }
 626  004d 5b03          	addw	sp,#3
 627  004f 81            	ret	
 710                     ; 255 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 710                     ; 256                   TIM2_OutputState_TypeDef TIM2_OutputState,
 710                     ; 257                   uint16_t TIM2_Pulse,
 710                     ; 258                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 710                     ; 259                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 710                     ; 260 {
 711                     .text:	section	.text,new
 712  0000               _TIM2_OC2Init:
 714  0000 89            	pushw	x
 715  0001 88            	push	a
 716       00000001      OFST:	set	1
 719                     ; 261   uint8_t tmpccmr2 = 0;
 721                     ; 264   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 723                     ; 265   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 725                     ; 266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 727                     ; 267   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 729                     ; 269   tmpccmr2 = TIM2->CCMR2;
 731  0002 c65259        	ld	a,21081
 732  0005 6b01          	ld	(OFST+0,sp),a
 733                     ; 272   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 735  0007 7219525a      	bres	21082,#4
 736                     ; 275   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 738  000b a48f          	and	a,#143
 739  000d 6b01          	ld	(OFST+0,sp),a
 740                     ; 278   tmpccmr2 |= (uint8_t)TIM2_OCMode;
 742  000f 9e            	ld	a,xh
 743  0010 1a01          	or	a,(OFST+0,sp)
 744  0012 6b01          	ld	(OFST+0,sp),a
 745                     ; 280   TIM2->CCMR2 = tmpccmr2;
 747  0014 c75259        	ld	21081,a
 748                     ; 283   if (TIM2_OutputState == TIM2_OutputState_Enable)
 750  0017 9f            	ld	a,xl
 751  0018 4a            	dec	a
 752  0019 2606          	jrne	L503
 753                     ; 285     TIM2->CCER1 |= TIM_CCER1_CC2E;
 755  001b 7218525a      	bset	21082,#4
 757  001f 2004          	jra	L703
 758  0021               L503:
 759                     ; 289     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 761  0021 7219525a      	bres	21082,#4
 762  0025               L703:
 763                     ; 293   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 765  0025 7b08          	ld	a,(OFST+7,sp)
 766  0027 4a            	dec	a
 767  0028 2606          	jrne	L113
 768                     ; 295     TIM2->CCER1 |= TIM_CCER1_CC2P;
 770  002a 721a525a      	bset	21082,#5
 772  002e 2004          	jra	L313
 773  0030               L113:
 774                     ; 299     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 776  0030 721b525a      	bres	21082,#5
 777  0034               L313:
 778                     ; 304   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 780  0034 7b09          	ld	a,(OFST+8,sp)
 781  0036 4a            	dec	a
 782  0037 2606          	jrne	L513
 783                     ; 306     TIM2->OISR |= TIM_OISR_OIS2;
 785  0039 72145265      	bset	21093,#2
 787  003d 2004          	jra	L713
 788  003f               L513:
 789                     ; 310     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 791  003f 72155265      	bres	21093,#2
 792  0043               L713:
 793                     ; 314   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 795  0043 7b06          	ld	a,(OFST+5,sp)
 796  0045 c75262        	ld	21090,a
 797                     ; 315   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 799  0048 7b07          	ld	a,(OFST+6,sp)
 800  004a c75263        	ld	21091,a
 801                     ; 316 }
 804  004d 5b03          	addw	sp,#3
 805  004f 81            	ret	
1003                     ; 344 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1003                     ; 345                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1003                     ; 346                     TIM2_BreakState_TypeDef TIM2_BreakState,
1003                     ; 347                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1003                     ; 348                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1003                     ; 349 
1003                     ; 350 {
1004                     .text:	section	.text,new
1005  0000               _TIM2_BKRConfig:
1007  0000 89            	pushw	x
1008       00000000      OFST:	set	0
1011                     ; 352   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1013                     ; 353   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1015                     ; 354   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1017                     ; 355   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1019                     ; 356   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1021                     ; 361   TIM2->BKR = (uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel | \
1021                     ; 362                         (uint8_t)TIM2_BreakState | (uint8_t)TIM2_BreakPolarity | \
1021                     ; 363                         (uint8_t)TIM2_AutomaticOutput);
1023  0001 9f            	ld	a,xl
1024  0002 1a01          	or	a,(OFST+1,sp)
1025  0004 1a05          	or	a,(OFST+5,sp)
1026  0006 1a06          	or	a,(OFST+6,sp)
1027  0008 1a07          	or	a,(OFST+7,sp)
1028  000a c75264        	ld	21092,a
1029                     ; 364 }
1032  000d 85            	popw	x
1033  000e 81            	ret	
1217                     ; 390 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1217                     ; 391                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1217                     ; 392                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1217                     ; 393                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1217                     ; 394                  uint8_t TIM2_ICFilter)
1217                     ; 395 {
1218                     .text:	section	.text,new
1219  0000               _TIM2_ICInit:
1221  0000 89            	pushw	x
1222       00000000      OFST:	set	0
1225                     ; 397   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1227                     ; 399   if (TIM2_Channel == TIM2_Channel_1)
1229  0001 9e            	ld	a,xh
1230  0002 4d            	tnz	a
1231  0003 2614          	jrne	L735
1232                     ; 402     TI1_Config(TIM2_ICPolarity,
1232                     ; 403                TIM2_ICSelection,
1232                     ; 404                TIM2_ICFilter);
1234  0005 7b07          	ld	a,(OFST+7,sp)
1235  0007 88            	push	a
1236  0008 7b06          	ld	a,(OFST+6,sp)
1237  000a 97            	ld	xl,a
1238  000b 7b03          	ld	a,(OFST+3,sp)
1239  000d 95            	ld	xh,a
1240  000e cd0000        	call	L3_TI1_Config
1242  0011 84            	pop	a
1243                     ; 407     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1245  0012 7b06          	ld	a,(OFST+6,sp)
1246  0014 cd0000        	call	_TIM2_SetIC1Prescaler
1249  0017 2012          	jra	L145
1250  0019               L735:
1251                     ; 412     TI2_Config(TIM2_ICPolarity,
1251                     ; 413                TIM2_ICSelection,
1251                     ; 414                TIM2_ICFilter);
1253  0019 7b07          	ld	a,(OFST+7,sp)
1254  001b 88            	push	a
1255  001c 7b06          	ld	a,(OFST+6,sp)
1256  001e 97            	ld	xl,a
1257  001f 7b03          	ld	a,(OFST+3,sp)
1258  0021 95            	ld	xh,a
1259  0022 cd0000        	call	L5_TI2_Config
1261  0025 84            	pop	a
1262                     ; 416     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1264  0026 7b06          	ld	a,(OFST+6,sp)
1265  0028 cd0000        	call	_TIM2_SetIC2Prescaler
1267  002b               L145:
1268                     ; 418 }
1271  002b 85            	popw	x
1272  002c 81            	ret	
1368                     ; 444 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1368                     ; 445                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1368                     ; 446                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1368                     ; 447                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1368                     ; 448                      uint8_t TIM2_ICFilter)
1368                     ; 449 {
1369                     .text:	section	.text,new
1370  0000               _TIM2_PWMIConfig:
1372  0000 89            	pushw	x
1373  0001 89            	pushw	x
1374       00000002      OFST:	set	2
1377                     ; 450   uint8_t icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1379                     ; 451   uint8_t icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1381                     ; 454   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1383                     ; 457   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
1385  0002 9f            	ld	a,xl
1386  0003 4d            	tnz	a
1387  0004 2605          	jrne	L116
1388                     ; 459     icpolarity = (uint8_t)TIM2_ICPolarity_Falling;
1390  0006 4c            	inc	a
1391  0007 6b01          	ld	(OFST-1,sp),a
1393  0009 2002          	jra	L316
1394  000b               L116:
1395                     ; 463     icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1397  000b 0f01          	clr	(OFST-1,sp)
1398  000d               L316:
1399                     ; 467   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
1401  000d 7b07          	ld	a,(OFST+5,sp)
1402  000f 4a            	dec	a
1403  0010 2604          	jrne	L516
1404                     ; 469     icselection = (uint8_t)TIM2_ICSelection_IndirectTI;
1406  0012 a602          	ld	a,#2
1408  0014 2002          	jra	L716
1409  0016               L516:
1410                     ; 473     icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1412  0016 a601          	ld	a,#1
1413  0018               L716:
1414  0018 6b02          	ld	(OFST+0,sp),a
1415                     ; 476   if (TIM2_Channel == TIM2_Channel_1)
1417  001a 7b03          	ld	a,(OFST+1,sp)
1418  001c 2626          	jrne	L126
1419                     ; 479     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
1419                     ; 480                TIM2_ICFilter);
1421  001e 7b09          	ld	a,(OFST+7,sp)
1422  0020 88            	push	a
1423  0021 7b08          	ld	a,(OFST+6,sp)
1424  0023 97            	ld	xl,a
1425  0024 7b05          	ld	a,(OFST+3,sp)
1426  0026 95            	ld	xh,a
1427  0027 cd0000        	call	L3_TI1_Config
1429  002a 84            	pop	a
1430                     ; 483     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1432  002b 7b08          	ld	a,(OFST+6,sp)
1433  002d cd0000        	call	_TIM2_SetIC1Prescaler
1435                     ; 486     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1437  0030 7b09          	ld	a,(OFST+7,sp)
1438  0032 88            	push	a
1439  0033 7b03          	ld	a,(OFST+1,sp)
1440  0035 97            	ld	xl,a
1441  0036 7b02          	ld	a,(OFST+0,sp)
1442  0038 95            	ld	xh,a
1443  0039 cd0000        	call	L5_TI2_Config
1445  003c 84            	pop	a
1446                     ; 489     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1448  003d 7b08          	ld	a,(OFST+6,sp)
1449  003f cd0000        	call	_TIM2_SetIC2Prescaler
1452  0042 2024          	jra	L326
1453  0044               L126:
1454                     ; 494     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
1454                     ; 495                TIM2_ICFilter);
1456  0044 7b09          	ld	a,(OFST+7,sp)
1457  0046 88            	push	a
1458  0047 7b08          	ld	a,(OFST+6,sp)
1459  0049 97            	ld	xl,a
1460  004a 7b05          	ld	a,(OFST+3,sp)
1461  004c 95            	ld	xh,a
1462  004d cd0000        	call	L5_TI2_Config
1464  0050 84            	pop	a
1465                     ; 498     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1467  0051 7b08          	ld	a,(OFST+6,sp)
1468  0053 cd0000        	call	_TIM2_SetIC2Prescaler
1470                     ; 501     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1472  0056 7b09          	ld	a,(OFST+7,sp)
1473  0058 88            	push	a
1474  0059 7b03          	ld	a,(OFST+1,sp)
1475  005b 97            	ld	xl,a
1476  005c 7b02          	ld	a,(OFST+0,sp)
1477  005e 95            	ld	xh,a
1478  005f cd0000        	call	L3_TI1_Config
1480  0062 84            	pop	a
1481                     ; 504     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1483  0063 7b08          	ld	a,(OFST+6,sp)
1484  0065 cd0000        	call	_TIM2_SetIC1Prescaler
1486  0068               L326:
1487                     ; 506 }
1490  0068 5b04          	addw	sp,#4
1491  006a 81            	ret	
1546                     ; 514 void TIM2_Cmd(FunctionalState NewState)
1546                     ; 515 {
1547                     .text:	section	.text,new
1548  0000               _TIM2_Cmd:
1552                     ; 517   assert_param(IS_FUNCTIONAL_STATE(NewState));
1554                     ; 520   if (NewState != DISABLE)
1556  0000 4d            	tnz	a
1557  0001 2705          	jreq	L356
1558                     ; 522     TIM2->CR1 |= TIM_CR1_CEN;
1560  0003 72105250      	bset	21072,#0
1563  0007 81            	ret	
1564  0008               L356:
1565                     ; 526     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1567  0008 72115250      	bres	21072,#0
1568                     ; 528 }
1571  000c 81            	ret	
1607                     ; 536 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1607                     ; 537 {
1608                     .text:	section	.text,new
1609  0000               _TIM2_CtrlPWMOutputs:
1613                     ; 539   assert_param(IS_FUNCTIONAL_STATE(NewState));
1615                     ; 543   if (NewState != DISABLE)
1617  0000 4d            	tnz	a
1618  0001 2705          	jreq	L576
1619                     ; 545     TIM2->BKR |= TIM_BKR_MOE ;
1621  0003 721e5264      	bset	21092,#7
1624  0007 81            	ret	
1625  0008               L576:
1626                     ; 549     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1628  0008 721f5264      	bres	21092,#7
1629                     ; 551 }
1632  000c 81            	ret	
1718                     ; 566 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1718                     ; 567 {
1719                     .text:	section	.text,new
1720  0000               _TIM2_ITConfig:
1722  0000 89            	pushw	x
1723       00000000      OFST:	set	0
1726                     ; 569   assert_param(IS_TIM2_IT(TIM2_IT));
1728                     ; 570   assert_param(IS_FUNCTIONAL_STATE(NewState));
1730                     ; 572   if (NewState != DISABLE)
1732  0001 9f            	ld	a,xl
1733  0002 4d            	tnz	a
1734  0003 2706          	jreq	L147
1735                     ; 575     TIM2->IER |= (uint8_t)TIM2_IT;
1737  0005 9e            	ld	a,xh
1738  0006 ca5254        	or	a,21076
1740  0009 2006          	jra	L347
1741  000b               L147:
1742                     ; 580     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
1744  000b 7b01          	ld	a,(OFST+1,sp)
1745  000d 43            	cpl	a
1746  000e c45254        	and	a,21076
1747  0011               L347:
1748  0011 c75254        	ld	21076,a
1749                     ; 582 }
1752  0014 85            	popw	x
1753  0015 81            	ret	
1777                     ; 589 void TIM2_InternalClockConfig(void)
1777                     ; 590 {
1778                     .text:	section	.text,new
1779  0000               _TIM2_InternalClockConfig:
1783                     ; 592   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1785  0000 c65252        	ld	a,21074
1786  0003 a4f8          	and	a,#248
1787  0005 c75252        	ld	21074,a
1788                     ; 593 }
1791  0008 81            	ret	
1908                     ; 611 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
1908                     ; 612                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
1908                     ; 613                               uint8_t TIM2_ExtTRGFilter)
1908                     ; 614 {
1909                     .text:	section	.text,new
1910  0000               _TIM2_ETRClockMode1Config:
1912  0000 89            	pushw	x
1913       00000000      OFST:	set	0
1916                     ; 616   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
1918  0001 7b05          	ld	a,(OFST+5,sp)
1919  0003 88            	push	a
1920  0004 7b02          	ld	a,(OFST+2,sp)
1921  0006 95            	ld	xh,a
1922  0007 cd0000        	call	_TIM2_ETRConfig
1924  000a 84            	pop	a
1925                     ; 619   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1927  000b c65252        	ld	a,21074
1928  000e a4f8          	and	a,#248
1929  0010 c75252        	ld	21074,a
1930                     ; 620   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
1932  0013 c65252        	ld	a,21074
1933  0016 aa07          	or	a,#7
1934  0018 c75252        	ld	21074,a
1935                     ; 623   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1937  001b c65252        	ld	a,21074
1938  001e a48f          	and	a,#143
1939  0020 c75252        	ld	21074,a
1940                     ; 624   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
1942  0023 c65252        	ld	a,21074
1943  0026 aa70          	or	a,#112
1944  0028 c75252        	ld	21074,a
1945                     ; 625 }
1948  002b 85            	popw	x
1949  002c 81            	ret	
2007                     ; 634 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2007                     ; 635                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2007                     ; 636                               uint8_t TIM2_ExtTRGFilter)
2007                     ; 637 {
2008                     .text:	section	.text,new
2009  0000               _TIM2_ETRClockMode2Config:
2011  0000 89            	pushw	x
2012       00000000      OFST:	set	0
2015                     ; 639   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
2017  0001 7b05          	ld	a,(OFST+5,sp)
2018  0003 88            	push	a
2019  0004 7b02          	ld	a,(OFST+2,sp)
2020  0006 95            	ld	xh,a
2021  0007 cd0000        	call	_TIM2_ETRConfig
2023  000a 721c5253      	bset	21075,#6
2024  000e 84            	pop	a
2025                     ; 642   TIM2->ETR |= TIM_ETR_ECE ;
2027                     ; 643 }
2030  000f 85            	popw	x
2031  0010 81            	ret	
2087                     ; 660 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2087                     ; 661                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2087                     ; 662                     uint8_t TIM2_ExtTRGFilter)
2087                     ; 663 {
2088                     .text:	section	.text,new
2089  0000               _TIM2_ETRConfig:
2091  0000 89            	pushw	x
2092       00000000      OFST:	set	0
2095                     ; 665   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
2097                     ; 666   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
2099                     ; 667   assert_param(IS_TIM2_EXT_FILTER(TIM2_ExtTRGFilter));
2101                     ; 669   TIM2->ETR |= (uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | (uint8_t)TIM2_ExtTRGPolarity | (uint8_t)TIM2_ExtTRGFilter);
2103  0001 9f            	ld	a,xl
2104  0002 1a01          	or	a,(OFST+1,sp)
2105  0004 1a05          	or	a,(OFST+5,sp)
2106  0006 ca5253        	or	a,21075
2107  0009 c75253        	ld	21075,a
2108                     ; 670 }
2111  000c 85            	popw	x
2112  000d 81            	ret	
2201                     ; 687 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
2201                     ; 688                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2201                     ; 689                                  uint8_t TIM2_ICFilter)
2201                     ; 690 {
2202                     .text:	section	.text,new
2203  0000               _TIM2_TIxExternalClockConfig:
2205  0000 89            	pushw	x
2206       00000000      OFST:	set	0
2209                     ; 692   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
2211                     ; 693   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
2213                     ; 694   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
2215                     ; 697   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
2217  0001 9e            	ld	a,xh
2218  0002 a160          	cp	a,#96
2219  0004 260e          	jrne	L3411
2220                     ; 699     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2222  0006 7b05          	ld	a,(OFST+5,sp)
2223  0008 88            	push	a
2224  0009 ae0001        	ldw	x,#1
2225  000c 7b03          	ld	a,(OFST+3,sp)
2226  000e 95            	ld	xh,a
2227  000f cd0000        	call	L5_TI2_Config
2230  0012 200c          	jra	L5411
2231  0014               L3411:
2232                     ; 703     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2234  0014 7b05          	ld	a,(OFST+5,sp)
2235  0016 88            	push	a
2236  0017 ae0001        	ldw	x,#1
2237  001a 7b03          	ld	a,(OFST+3,sp)
2238  001c 95            	ld	xh,a
2239  001d cd0000        	call	L3_TI1_Config
2241  0020               L5411:
2242  0020 84            	pop	a
2243                     ; 707   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
2245  0021 7b01          	ld	a,(OFST+1,sp)
2246  0023 cd0000        	call	_TIM2_SelectInputTrigger
2248                     ; 710   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2250  0026 c65252        	ld	a,21074
2251  0029 aa07          	or	a,#7
2252  002b c75252        	ld	21074,a
2253                     ; 711 }
2256  002e 85            	popw	x
2257  002f 81            	ret	
2357                     ; 727 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
2357                     ; 728 {
2358                     .text:	section	.text,new
2359  0000               _TIM2_SelectInputTrigger:
2361  0000 88            	push	a
2362  0001 88            	push	a
2363       00000001      OFST:	set	1
2366                     ; 729   uint8_t tmpsmcr = 0;
2368                     ; 732   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
2370                     ; 734   tmpsmcr = TIM2->SMCR;
2372  0002 c65252        	ld	a,21074
2373                     ; 737   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2375  0005 a48f          	and	a,#143
2376                     ; 738   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
2378  0007 1a02          	or	a,(OFST+1,sp)
2379                     ; 740   TIM2->SMCR = (uint8_t)tmpsmcr;
2381  0009 c75252        	ld	21074,a
2382                     ; 741 }
2385  000c 85            	popw	x
2386  000d 81            	ret	
2422                     ; 749 void TIM2_UpdateDisableConfig(FunctionalState NewState)
2422                     ; 750 {
2423                     .text:	section	.text,new
2424  0000               _TIM2_UpdateDisableConfig:
2428                     ; 752   assert_param(IS_FUNCTIONAL_STATE(NewState));
2430                     ; 755   if (NewState != DISABLE)
2432  0000 4d            	tnz	a
2433  0001 2705          	jreq	L7221
2434                     ; 757     TIM2->CR1 |= TIM_CR1_UDIS;
2436  0003 72125250      	bset	21072,#1
2439  0007 81            	ret	
2440  0008               L7221:
2441                     ; 761     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2443  0008 72135250      	bres	21072,#1
2444                     ; 763 }
2447  000c 81            	ret	
2505                     ; 773 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2505                     ; 774 {
2506                     .text:	section	.text,new
2507  0000               _TIM2_UpdateRequestConfig:
2511                     ; 776   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
2513                     ; 779   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
2515  0000 4a            	dec	a
2516  0001 2605          	jrne	L1621
2517                     ; 781     TIM2->CR1 |= TIM_CR1_URS ;
2519  0003 72145250      	bset	21072,#2
2522  0007 81            	ret	
2523  0008               L1621:
2524                     ; 785     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
2526  0008 72155250      	bres	21072,#2
2527                     ; 787 }
2530  000c 81            	ret	
2566                     ; 795 void TIM2_SelectHallSensor(FunctionalState NewState)
2566                     ; 796 {
2567                     .text:	section	.text,new
2568  0000               _TIM2_SelectHallSensor:
2572                     ; 798   assert_param(IS_FUNCTIONAL_STATE(NewState));
2574                     ; 801   if (NewState != DISABLE)
2576  0000 4d            	tnz	a
2577  0001 2705          	jreq	L3031
2578                     ; 803     TIM2->CR2 |= TIM_CR2_TI1S;
2580  0003 721e5251      	bset	21073,#7
2583  0007 81            	ret	
2584  0008               L3031:
2585                     ; 807     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2587  0008 721f5251      	bres	21073,#7
2588                     ; 809 }
2591  000c 81            	ret	
2648                     ; 819 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2648                     ; 820 {
2649                     .text:	section	.text,new
2650  0000               _TIM2_SelectOnePulseMode:
2654                     ; 822   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
2656                     ; 825   if (TIM2_OPMode == TIM2_OPMode_Single)
2658  0000 4a            	dec	a
2659  0001 2605          	jrne	L5331
2660                     ; 827     TIM2->CR1 |= TIM_CR1_OPM ;
2662  0003 72165250      	bset	21072,#3
2665  0007 81            	ret	
2666  0008               L5331:
2667                     ; 831     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2669  0008 72175250      	bres	21072,#3
2670                     ; 833 }
2673  000c 81            	ret	
2772                     ; 847 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
2772                     ; 848 {
2773                     .text:	section	.text,new
2774  0000               _TIM2_SelectOutputTrigger:
2776  0000 88            	push	a
2777  0001 88            	push	a
2778       00000001      OFST:	set	1
2781                     ; 849   uint8_t tmpcr2 = 0;
2783                     ; 852   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
2785                     ; 854   tmpcr2 = TIM2->CR2;
2787  0002 c65251        	ld	a,21073
2788                     ; 857   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2790  0005 a48f          	and	a,#143
2791                     ; 860   tmpcr2 |= (uint8_t)TIM2_TRGOSource;
2793  0007 1a02          	or	a,(OFST+1,sp)
2794                     ; 862   TIM2->CR2 = tmpcr2;
2796  0009 c75251        	ld	21073,a
2797                     ; 863 }
2800  000c 85            	popw	x
2801  000d 81            	ret	
2884                     ; 875 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
2884                     ; 876 {
2885                     .text:	section	.text,new
2886  0000               _TIM2_SelectSlaveMode:
2888  0000 88            	push	a
2889  0001 88            	push	a
2890       00000001      OFST:	set	1
2893                     ; 877   uint8_t tmpsmcr = 0;
2895                     ; 880   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
2897                     ; 882   tmpsmcr = TIM2->SMCR;
2899  0002 c65252        	ld	a,21074
2900                     ; 885   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2902  0005 a4f8          	and	a,#248
2903                     ; 888   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
2905  0007 1a02          	or	a,(OFST+1,sp)
2906                     ; 890   TIM2->SMCR = tmpsmcr;
2908  0009 c75252        	ld	21074,a
2909                     ; 891 }
2912  000c 85            	popw	x
2913  000d 81            	ret	
2949                     ; 899 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
2949                     ; 900 {
2950                     .text:	section	.text,new
2951  0000               _TIM2_SelectMasterSlaveMode:
2955                     ; 902   assert_param(IS_FUNCTIONAL_STATE(NewState));
2957                     ; 905   if (NewState != DISABLE)
2959  0000 4d            	tnz	a
2960  0001 2705          	jreq	L7541
2961                     ; 907     TIM2->SMCR |= TIM_SMCR_MSM;
2963  0003 721e5252      	bset	21074,#7
2966  0007 81            	ret	
2967  0008               L7541:
2968                     ; 911     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2970  0008 721f5252      	bres	21074,#7
2971                     ; 913 }
2974  000c 81            	ret	
3087                     ; 932 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
3087                     ; 933                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
3087                     ; 934                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
3087                     ; 935 {
3088                     .text:	section	.text,new
3089  0000               _TIM2_EncoderInterfaceConfig:
3091  0000 89            	pushw	x
3092  0001 5203          	subw	sp,#3
3093       00000003      OFST:	set	3
3096                     ; 936   uint8_t tmpsmcr = 0;
3098                     ; 937   uint8_t tmpccmr1 = 0;
3100                     ; 938   uint8_t tmpccmr2 = 0;
3102                     ; 941   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
3104                     ; 942   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
3106                     ; 943   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
3108                     ; 945   tmpsmcr = TIM2->SMCR;
3110  0003 c65252        	ld	a,21074
3111  0006 6b01          	ld	(OFST-2,sp),a
3112                     ; 946   tmpccmr1 = TIM2->CCMR1;
3114  0008 c65258        	ld	a,21080
3115  000b 6b02          	ld	(OFST-1,sp),a
3116                     ; 947   tmpccmr2 = TIM2->CCMR2;
3118  000d c65259        	ld	a,21081
3119  0010 6b03          	ld	(OFST+0,sp),a
3120                     ; 950   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3122  0012 7b01          	ld	a,(OFST-2,sp)
3123  0014 a4f0          	and	a,#240
3124  0016 6b01          	ld	(OFST-2,sp),a
3125                     ; 951   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
3127  0018 9e            	ld	a,xh
3128  0019 1a01          	or	a,(OFST-2,sp)
3129  001b 6b01          	ld	(OFST-2,sp),a
3130                     ; 954   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3132  001d 7b02          	ld	a,(OFST-1,sp)
3133  001f a4fc          	and	a,#252
3134  0021 6b02          	ld	(OFST-1,sp),a
3135                     ; 955   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3137  0023 7b03          	ld	a,(OFST+0,sp)
3138  0025 a4fc          	and	a,#252
3139  0027 6b03          	ld	(OFST+0,sp),a
3140                     ; 956   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3142  0029 7b02          	ld	a,(OFST-1,sp)
3143  002b aa01          	or	a,#1
3144  002d 6b02          	ld	(OFST-1,sp),a
3145                     ; 957   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3147  002f 7b03          	ld	a,(OFST+0,sp)
3148  0031 aa01          	or	a,#1
3149  0033 6b03          	ld	(OFST+0,sp),a
3150                     ; 960   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
3152  0035 9f            	ld	a,xl
3153  0036 4a            	dec	a
3154  0037 2606          	jrne	L7351
3155                     ; 962     TIM2->CCER1 |= TIM_CCER1_CC1P ;
3157  0039 7212525a      	bset	21082,#1
3159  003d 2004          	jra	L1451
3160  003f               L7351:
3161                     ; 966     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3163  003f 7213525a      	bres	21082,#1
3164  0043               L1451:
3165                     ; 969   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
3167  0043 7b08          	ld	a,(OFST+5,sp)
3168  0045 4a            	dec	a
3169  0046 2606          	jrne	L3451
3170                     ; 971     TIM2->CCER1 |= TIM_CCER1_CC2P ;
3172  0048 721a525a      	bset	21082,#5
3174  004c 2004          	jra	L5451
3175  004e               L3451:
3176                     ; 975     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3178  004e 721b525a      	bres	21082,#5
3179  0052               L5451:
3180                     ; 978   TIM2->SMCR = tmpsmcr;
3182  0052 7b01          	ld	a,(OFST-2,sp)
3183  0054 c75252        	ld	21074,a
3184                     ; 979   TIM2->CCMR1 = tmpccmr1;
3186  0057 7b02          	ld	a,(OFST-1,sp)
3187  0059 c75258        	ld	21080,a
3188                     ; 980   TIM2->CCMR2 = tmpccmr2;
3190  005c 7b03          	ld	a,(OFST+0,sp)
3191  005e c75259        	ld	21081,a
3192                     ; 981 }
3195  0061 5b05          	addw	sp,#5
3196  0063 81            	ret	
3264                     ; 1001 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef TIM2_Prescaler,
3264                     ; 1002                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
3264                     ; 1003 {
3265                     .text:	section	.text,new
3266  0000               _TIM2_PrescalerConfig:
3270                     ; 1005   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
3272                     ; 1006   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
3274                     ; 1009   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
3276  0000 9e            	ld	a,xh
3277  0001 c7525d        	ld	21085,a
3278                     ; 1012   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
3280  0004 9f            	ld	a,xl
3281  0005 4a            	dec	a
3282  0006 2605          	jrne	L1061
3283                     ; 1014     TIM2->EGR |= TIM_EGR_UG ;
3285  0008 72105257      	bset	21079,#0
3288  000c 81            	ret	
3289  000d               L1061:
3290                     ; 1018     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3292  000d 72115257      	bres	21079,#0
3293                     ; 1020 }
3296  0011 81            	ret	
3341                     ; 1033 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
3341                     ; 1034 {
3342                     .text:	section	.text,new
3343  0000               _TIM2_CounterModeConfig:
3345  0000 88            	push	a
3346  0001 88            	push	a
3347       00000001      OFST:	set	1
3350                     ; 1035   uint8_t tmpcr1 = 0;
3352                     ; 1038   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
3354                     ; 1040   tmpcr1 = TIM2->CR1;
3356  0002 c65250        	ld	a,21072
3357                     ; 1043   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3359  0005 a48f          	and	a,#143
3360                     ; 1046   tmpcr1 |= (uint8_t)TIM2_CounterMode;
3362  0007 1a02          	or	a,(OFST+1,sp)
3363                     ; 1048   TIM2->CR1 = tmpcr1;
3365  0009 c75250        	ld	21072,a
3366                     ; 1049 }
3369  000c 85            	popw	x
3370  000d 81            	ret	
3437                     ; 1059 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3437                     ; 1060 {
3438                     .text:	section	.text,new
3439  0000               _TIM2_ForcedOC1Config:
3441  0000 88            	push	a
3442  0001 88            	push	a
3443       00000001      OFST:	set	1
3446                     ; 1061   uint8_t tmpccmr1 = 0;
3448                     ; 1064   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3450                     ; 1066   tmpccmr1 = TIM2->CCMR1;
3452  0002 c65258        	ld	a,21080
3453                     ; 1069   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3455  0005 a48f          	and	a,#143
3456                     ; 1072   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
3458  0007 1a02          	or	a,(OFST+1,sp)
3459                     ; 1074   TIM2->CCMR1 = tmpccmr1;
3461  0009 c75258        	ld	21080,a
3462                     ; 1075 }
3465  000c 85            	popw	x
3466  000d 81            	ret	
3511                     ; 1085 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3511                     ; 1086 {
3512                     .text:	section	.text,new
3513  0000               _TIM2_ForcedOC2Config:
3515  0000 88            	push	a
3516  0001 88            	push	a
3517       00000001      OFST:	set	1
3520                     ; 1087   uint8_t tmpccmr2 = 0;
3522                     ; 1090   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3524                     ; 1092   tmpccmr2 = TIM2->CCMR2;
3526  0002 c65259        	ld	a,21081
3527                     ; 1095   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3529  0005 a48f          	and	a,#143
3530                     ; 1098   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
3532  0007 1a02          	or	a,(OFST+1,sp)
3533                     ; 1100   TIM2->CCMR2 = tmpccmr2;
3535  0009 c75259        	ld	21081,a
3536                     ; 1101 }
3539  000c 85            	popw	x
3540  000d 81            	ret	
3576                     ; 1109 void TIM2_ARRPreloadConfig(FunctionalState NewState)
3576                     ; 1110 {
3577                     .text:	section	.text,new
3578  0000               _TIM2_ARRPreloadConfig:
3582                     ; 1112   assert_param(IS_FUNCTIONAL_STATE(NewState));
3584                     ; 1115   if (NewState != DISABLE)
3586  0000 4d            	tnz	a
3587  0001 2705          	jreq	L1271
3588                     ; 1117     TIM2->CR1 |= TIM_CR1_ARPE;
3590  0003 721e5250      	bset	21072,#7
3593  0007 81            	ret	
3594  0008               L1271:
3595                     ; 1121     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3597  0008 721f5250      	bres	21072,#7
3598                     ; 1123 }
3601  000c 81            	ret	
3637                     ; 1131 void TIM2_OC1PreloadConfig(FunctionalState NewState)
3637                     ; 1132 {
3638                     .text:	section	.text,new
3639  0000               _TIM2_OC1PreloadConfig:
3643                     ; 1134   assert_param(IS_FUNCTIONAL_STATE(NewState));
3645                     ; 1137   if (NewState != DISABLE)
3647  0000 4d            	tnz	a
3648  0001 2705          	jreq	L3471
3649                     ; 1139     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
3651  0003 72165258      	bset	21080,#3
3654  0007 81            	ret	
3655  0008               L3471:
3656                     ; 1143     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3658  0008 72175258      	bres	21080,#3
3659                     ; 1145 }
3662  000c 81            	ret	
3698                     ; 1153 void TIM2_OC2PreloadConfig(FunctionalState NewState)
3698                     ; 1154 {
3699                     .text:	section	.text,new
3700  0000               _TIM2_OC2PreloadConfig:
3704                     ; 1156   assert_param(IS_FUNCTIONAL_STATE(NewState));
3706                     ; 1159   if (NewState != DISABLE)
3708  0000 4d            	tnz	a
3709  0001 2705          	jreq	L5671
3710                     ; 1161     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
3712  0003 72165259      	bset	21081,#3
3715  0007 81            	ret	
3716  0008               L5671:
3717                     ; 1165     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3719  0008 72175259      	bres	21081,#3
3720                     ; 1167 }
3723  000c 81            	ret	
3758                     ; 1174 void TIM2_OC1FastCmd(FunctionalState NewState)
3758                     ; 1175 {
3759                     .text:	section	.text,new
3760  0000               _TIM2_OC1FastCmd:
3764                     ; 1177   assert_param(IS_FUNCTIONAL_STATE(NewState));
3766                     ; 1180   if (NewState != DISABLE)
3768  0000 4d            	tnz	a
3769  0001 2705          	jreq	L7002
3770                     ; 1182     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
3772  0003 72145258      	bset	21080,#2
3775  0007 81            	ret	
3776  0008               L7002:
3777                     ; 1186     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3779  0008 72155258      	bres	21080,#2
3780                     ; 1188 }
3783  000c 81            	ret	
3818                     ; 1195 void TIM2_OC2FastCmd(FunctionalState NewState)
3818                     ; 1196 {
3819                     .text:	section	.text,new
3820  0000               _TIM2_OC2FastCmd:
3824                     ; 1198   assert_param(IS_FUNCTIONAL_STATE(NewState));
3826                     ; 1201   if (NewState != DISABLE)
3828  0000 4d            	tnz	a
3829  0001 2705          	jreq	L1302
3830                     ; 1203     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
3832  0003 72145259      	bset	21081,#2
3835  0007 81            	ret	
3836  0008               L1302:
3837                     ; 1207     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3839  0008 72155259      	bres	21081,#2
3840                     ; 1209 }
3843  000c 81            	ret	
3924                     ; 1222 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3924                     ; 1223 {
3925                     .text:	section	.text,new
3926  0000               _TIM2_GenerateEvent:
3930                     ; 1225   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
3932                     ; 1228   TIM2->EGR |= (uint8_t)TIM2_EventSource;
3934  0000 ca5257        	or	a,21079
3935  0003 c75257        	ld	21079,a
3936                     ; 1229 }
3939  0006 81            	ret	
3975                     ; 1239 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3975                     ; 1240 {
3976                     .text:	section	.text,new
3977  0000               _TIM2_OC1PolarityConfig:
3981                     ; 1242   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
3983                     ; 1245   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
3985  0000 4a            	dec	a
3986  0001 2605          	jrne	L7012
3987                     ; 1247     TIM2->CCER1 |= TIM_CCER1_CC1P ;
3989  0003 7212525a      	bset	21082,#1
3992  0007 81            	ret	
3993  0008               L7012:
3994                     ; 1251     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3996  0008 7213525a      	bres	21082,#1
3997                     ; 1253 }
4000  000c 81            	ret	
4036                     ; 1263 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4036                     ; 1264 {
4037                     .text:	section	.text,new
4038  0000               _TIM2_OC2PolarityConfig:
4042                     ; 1266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4044                     ; 1269   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4046  0000 4a            	dec	a
4047  0001 2605          	jrne	L1312
4048                     ; 1271     TIM2->CCER1 |= TIM_CCER1_CC2P ;
4050  0003 721a525a      	bset	21082,#5
4053  0007 81            	ret	
4054  0008               L1312:
4055                     ; 1275     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4057  0008 721b525a      	bres	21082,#5
4058                     ; 1277 }
4061  000c 81            	ret	
4106                     ; 1289 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
4106                     ; 1290                  FunctionalState NewState)
4106                     ; 1291 {
4107                     .text:	section	.text,new
4108  0000               _TIM2_CCxCmd:
4110  0000 89            	pushw	x
4111       00000000      OFST:	set	0
4114                     ; 1293   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4116                     ; 1294   assert_param(IS_FUNCTIONAL_STATE(NewState));
4118                     ; 1296   if (TIM2_Channel == TIM2_Channel_1)
4120  0001 9e            	ld	a,xh
4121  0002 4d            	tnz	a
4122  0003 2610          	jrne	L7512
4123                     ; 1299     if (NewState != DISABLE)
4125  0005 9f            	ld	a,xl
4126  0006 4d            	tnz	a
4127  0007 2706          	jreq	L1612
4128                     ; 1301       TIM2->CCER1 |= TIM_CCER1_CC1E ;
4130  0009 7210525a      	bset	21082,#0
4132  000d 2014          	jra	L5612
4133  000f               L1612:
4134                     ; 1305       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4136  000f 7211525a      	bres	21082,#0
4137  0013 200e          	jra	L5612
4138  0015               L7512:
4139                     ; 1312     if (NewState != DISABLE)
4141  0015 7b02          	ld	a,(OFST+2,sp)
4142  0017 2706          	jreq	L7612
4143                     ; 1314       TIM2->CCER1 |= TIM_CCER1_CC2E;
4145  0019 7218525a      	bset	21082,#4
4147  001d 2004          	jra	L5612
4148  001f               L7612:
4149                     ; 1318       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4151  001f 7219525a      	bres	21082,#4
4152  0023               L5612:
4153                     ; 1322 }
4156  0023 85            	popw	x
4157  0024 81            	ret	
4202                     ; 1342 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
4202                     ; 1343                      TIM2_OCMode_TypeDef TIM2_OCMode)
4202                     ; 1344 {
4203                     .text:	section	.text,new
4204  0000               _TIM2_SelectOCxM:
4206  0000 89            	pushw	x
4207       00000000      OFST:	set	0
4210                     ; 1346   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4212                     ; 1347   assert_param(IS_TIM2_OCM(TIM2_OCMode));
4214                     ; 1349   if (TIM2_Channel == TIM2_Channel_1)
4216  0001 9e            	ld	a,xh
4217  0002 4d            	tnz	a
4218  0003 2615          	jrne	L5122
4219                     ; 1352     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4221  0005 7211525a      	bres	21082,#0
4222                     ; 1355     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4224  0009 c65258        	ld	a,21080
4225  000c a48f          	and	a,#143
4226  000e c75258        	ld	21080,a
4227                     ; 1358     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
4229  0011 9f            	ld	a,xl
4230  0012 ca5258        	or	a,21080
4231  0015 c75258        	ld	21080,a
4233  0018 2014          	jra	L7122
4234  001a               L5122:
4235                     ; 1363     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4237  001a 7219525a      	bres	21082,#4
4238                     ; 1366     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4240  001e c65259        	ld	a,21081
4241  0021 a48f          	and	a,#143
4242  0023 c75259        	ld	21081,a
4243                     ; 1369     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
4245  0026 c65259        	ld	a,21081
4246  0029 1a02          	or	a,(OFST+2,sp)
4247  002b c75259        	ld	21081,a
4248  002e               L7122:
4249                     ; 1371 }
4252  002e 85            	popw	x
4253  002f 81            	ret	
4287                     ; 1379 void TIM2_SetCounter(uint16_t TIM2_Counter)
4287                     ; 1380 {
4288                     .text:	section	.text,new
4289  0000               _TIM2_SetCounter:
4293                     ; 1383   TIM2->CNTRH = (uint8_t)(TIM2_Counter >> 8);
4295  0000 9e            	ld	a,xh
4296  0001 c7525b        	ld	21083,a
4297                     ; 1384   TIM2->CNTRL = (uint8_t)(TIM2_Counter);
4299  0004 9f            	ld	a,xl
4300  0005 c7525c        	ld	21084,a
4301                     ; 1385 }
4304  0008 81            	ret	
4338                     ; 1393 void TIM2_SetAutoreload(uint16_t TIM2_Autoreload)
4338                     ; 1394 {
4339                     .text:	section	.text,new
4340  0000               _TIM2_SetAutoreload:
4344                     ; 1396   TIM2->ARRH = (uint8_t)(TIM2_Autoreload >> 8);
4346  0000 9e            	ld	a,xh
4347  0001 c7525e        	ld	21086,a
4348                     ; 1397   TIM2->ARRL = (uint8_t)(TIM2_Autoreload);
4350  0004 9f            	ld	a,xl
4351  0005 c7525f        	ld	21087,a
4352                     ; 1398 }
4355  0008 81            	ret	
4389                     ; 1406 void TIM2_SetCompare1(uint16_t TIM2_Compare)
4389                     ; 1407 {
4390                     .text:	section	.text,new
4391  0000               _TIM2_SetCompare1:
4395                     ; 1409   TIM2->CCR1H = (uint8_t)(TIM2_Compare >> 8);
4397  0000 9e            	ld	a,xh
4398  0001 c75260        	ld	21088,a
4399                     ; 1410   TIM2->CCR1L = (uint8_t)(TIM2_Compare);
4401  0004 9f            	ld	a,xl
4402  0005 c75261        	ld	21089,a
4403                     ; 1411 }
4406  0008 81            	ret	
4440                     ; 1419 void TIM2_SetCompare2(uint16_t TIM2_Compare)
4440                     ; 1420 {
4441                     .text:	section	.text,new
4442  0000               _TIM2_SetCompare2:
4446                     ; 1422   TIM2->CCR2H = (uint8_t)(TIM2_Compare >> 8);
4448  0000 9e            	ld	a,xh
4449  0001 c75262        	ld	21090,a
4450                     ; 1423   TIM2->CCR2L = (uint8_t)(TIM2_Compare);
4452  0004 9f            	ld	a,xl
4453  0005 c75263        	ld	21091,a
4454                     ; 1424 }
4457  0008 81            	ret	
4502                     ; 1436 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
4502                     ; 1437 {
4503                     .text:	section	.text,new
4504  0000               _TIM2_SetIC1Prescaler:
4506  0000 88            	push	a
4507  0001 88            	push	a
4508       00000001      OFST:	set	1
4511                     ; 1438   uint8_t tmpccmr1 = 0;
4513                     ; 1441   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
4515                     ; 1443   tmpccmr1 = TIM2->CCMR1;
4517  0002 c65258        	ld	a,21080
4518                     ; 1446   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4520  0005 a4f3          	and	a,#243
4521                     ; 1449   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
4523  0007 1a02          	or	a,(OFST+1,sp)
4524                     ; 1451   TIM2->CCMR1 = tmpccmr1;
4526  0009 c75258        	ld	21080,a
4527                     ; 1452 }
4530  000c 85            	popw	x
4531  000d 81            	ret	
4576                     ; 1464 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
4576                     ; 1465 {
4577                     .text:	section	.text,new
4578  0000               _TIM2_SetIC2Prescaler:
4580  0000 88            	push	a
4581  0001 88            	push	a
4582       00000001      OFST:	set	1
4585                     ; 1466   uint8_t tmpccmr2 = 0;
4587                     ; 1469   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
4589                     ; 1471   tmpccmr2 = TIM2->CCMR2;
4591  0002 c65259        	ld	a,21081
4592                     ; 1474   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4594  0005 a4f3          	and	a,#243
4595                     ; 1477   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
4597  0007 1a02          	or	a,(OFST+1,sp)
4598                     ; 1479   TIM2->CCMR2 = tmpccmr2;
4600  0009 c75259        	ld	21081,a
4601                     ; 1480 }
4604  000c 85            	popw	x
4605  000d 81            	ret	
4657                     ; 1487 uint16_t TIM2_GetCapture1(void)
4657                     ; 1488 {
4658                     .text:	section	.text,new
4659  0000               _TIM2_GetCapture1:
4661  0000 5204          	subw	sp,#4
4662       00000004      OFST:	set	4
4665                     ; 1489   uint16_t tmpccr1 = 0;
4667                     ; 1492   tmpccr1h = TIM2->CCR1H;
4669  0002 c65260        	ld	a,21088
4670  0005 6b02          	ld	(OFST-2,sp),a
4671                     ; 1493   tmpccr1l = TIM2->CCR1L;
4673  0007 c65261        	ld	a,21089
4674  000a 6b01          	ld	(OFST-3,sp),a
4675                     ; 1495   tmpccr1 = (uint16_t)(tmpccr1l);
4677  000c 5f            	clrw	x
4678  000d 97            	ld	xl,a
4679  000e 1f03          	ldw	(OFST-1,sp),x
4680                     ; 1496   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4682  0010 5f            	clrw	x
4683  0011 7b02          	ld	a,(OFST-2,sp)
4684  0013 97            	ld	xl,a
4685  0014 7b04          	ld	a,(OFST+0,sp)
4686  0016 01            	rrwa	x,a
4687  0017 1a03          	or	a,(OFST-1,sp)
4688  0019 01            	rrwa	x,a
4689                     ; 1498   return ((uint16_t)tmpccr1);
4693  001a 5b04          	addw	sp,#4
4694  001c 81            	ret	
4746                     ; 1506 uint16_t TIM2_GetCapture2(void)
4746                     ; 1507 {
4747                     .text:	section	.text,new
4748  0000               _TIM2_GetCapture2:
4750  0000 5204          	subw	sp,#4
4751       00000004      OFST:	set	4
4754                     ; 1508   uint16_t tmpccr2 = 0;
4756                     ; 1511   tmpccr2h = TIM2->CCR2H;
4758  0002 c65262        	ld	a,21090
4759  0005 6b02          	ld	(OFST-2,sp),a
4760                     ; 1512   tmpccr2l = TIM2->CCR2L;
4762  0007 c65263        	ld	a,21091
4763  000a 6b01          	ld	(OFST-3,sp),a
4764                     ; 1514   tmpccr2 = (uint16_t)(tmpccr2l);
4766  000c 5f            	clrw	x
4767  000d 97            	ld	xl,a
4768  000e 1f03          	ldw	(OFST-1,sp),x
4769                     ; 1515   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4771  0010 5f            	clrw	x
4772  0011 7b02          	ld	a,(OFST-2,sp)
4773  0013 97            	ld	xl,a
4774  0014 7b04          	ld	a,(OFST+0,sp)
4775  0016 01            	rrwa	x,a
4776  0017 1a03          	or	a,(OFST-1,sp)
4777  0019 01            	rrwa	x,a
4778                     ; 1517   return ((uint16_t)tmpccr2);
4782  001a 5b04          	addw	sp,#4
4783  001c 81            	ret	
4835                     ; 1525 uint16_t TIM2_GetCounter(void)
4835                     ; 1526 {
4836                     .text:	section	.text,new
4837  0000               _TIM2_GetCounter:
4839  0000 5204          	subw	sp,#4
4840       00000004      OFST:	set	4
4843                     ; 1527   uint16_t tmpcnt = 0;
4845                     ; 1530   tmpcntrh = TIM2->CNTRH;
4847  0002 c6525b        	ld	a,21083
4848  0005 6b02          	ld	(OFST-2,sp),a
4849                     ; 1531   tmpcntrl = TIM2->CNTRL;
4851  0007 c6525c        	ld	a,21084
4852  000a 6b01          	ld	(OFST-3,sp),a
4853                     ; 1533   tmpcnt = (uint16_t)(tmpcntrl);
4855  000c 5f            	clrw	x
4856  000d 97            	ld	xl,a
4857  000e 1f03          	ldw	(OFST-1,sp),x
4858                     ; 1534   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4860  0010 5f            	clrw	x
4861  0011 7b02          	ld	a,(OFST-2,sp)
4862  0013 97            	ld	xl,a
4863  0014 7b04          	ld	a,(OFST+0,sp)
4864  0016 01            	rrwa	x,a
4865  0017 1a03          	or	a,(OFST-1,sp)
4866  0019 01            	rrwa	x,a
4867                     ; 1536   return ((uint16_t)tmpcnt);
4871  001a 5b04          	addw	sp,#4
4872  001c 81            	ret	
4896                     ; 1544 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4896                     ; 1545 {
4897                     .text:	section	.text,new
4898  0000               _TIM2_GetPrescaler:
4902                     ; 1547   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
4904  0000 c6525d        	ld	a,21085
4907  0003 81            	ret	
5046                     ; 1563 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
5046                     ; 1564 {
5047                     .text:	section	.text,new
5048  0000               _TIM2_GetFlagStatus:
5050  0000 89            	pushw	x
5051  0001 89            	pushw	x
5052       00000002      OFST:	set	2
5055                     ; 1565   FlagStatus bitstatus = RESET;
5057                     ; 1569   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
5059                     ; 1571   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
5061  0002 9f            	ld	a,xl
5062  0003 c45255        	and	a,21077
5063  0006 6b01          	ld	(OFST-1,sp),a
5064                     ; 1572   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
5066  0008 c65256        	ld	a,21078
5067  000b 1403          	and	a,(OFST+1,sp)
5068  000d 6b02          	ld	(OFST+0,sp),a
5069                     ; 1574   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
5071  000f 1a01          	or	a,(OFST-1,sp)
5072  0011 2702          	jreq	L3552
5073                     ; 1576     bitstatus = SET;
5075  0013 a601          	ld	a,#1
5077  0015               L3552:
5078                     ; 1580     bitstatus = RESET;
5080                     ; 1582   return ((FlagStatus)bitstatus);
5084  0015 5b04          	addw	sp,#4
5085  0017 81            	ret	
5120                     ; 1596 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
5120                     ; 1597 {
5121                     .text:	section	.text,new
5122  0000               _TIM2_ClearFlag:
5124  0000 89            	pushw	x
5125       00000000      OFST:	set	0
5128                     ; 1599   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
5130                     ; 1601   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
5132  0001 9f            	ld	a,xl
5133  0002 43            	cpl	a
5134  0003 c75255        	ld	21077,a
5135                     ; 1602   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
5137  0006 7b01          	ld	a,(OFST+1,sp)
5138  0008 43            	cpl	a
5139  0009 c75256        	ld	21078,a
5140                     ; 1603 }
5143  000c 85            	popw	x
5144  000d 81            	ret	
5208                     ; 1616 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
5208                     ; 1617 {
5209                     .text:	section	.text,new
5210  0000               _TIM2_GetITStatus:
5212  0000 88            	push	a
5213  0001 5203          	subw	sp,#3
5214       00000003      OFST:	set	3
5217                     ; 1618   __IO ITStatus bitstatus = RESET;
5219  0003 0f03          	clr	(OFST+0,sp)
5220                     ; 1620   __IO uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
5222  0005 0f01          	clr	(OFST-2,sp)
5225  0007 0f02          	clr	(OFST-1,sp)
5226                     ; 1623   assert_param(IS_TIM2_GET_IT(TIM2_IT));
5228                     ; 1625   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
5230  0009 c45255        	and	a,21077
5231  000c 6b01          	ld	(OFST-2,sp),a
5232                     ; 1627   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
5234  000e c65254        	ld	a,21076
5235  0011 1404          	and	a,(OFST+1,sp)
5236  0013 6b02          	ld	(OFST-1,sp),a
5237                     ; 1629   if ((TIM2_itStatus != (uint8_t)RESET) && (TIM2_itEnable != (uint8_t)RESET))
5239  0015 0d01          	tnz	(OFST-2,sp)
5240  0017 270a          	jreq	L7262
5242  0019 0d02          	tnz	(OFST-1,sp)
5243  001b 2706          	jreq	L7262
5244                     ; 1631     bitstatus = (ITStatus)SET;
5246  001d a601          	ld	a,#1
5247  001f 6b03          	ld	(OFST+0,sp),a
5249  0021 2002          	jra	L1362
5250  0023               L7262:
5251                     ; 1635     bitstatus = (ITStatus)RESET;
5253  0023 0f03          	clr	(OFST+0,sp)
5254  0025               L1362:
5255                     ; 1637   return ((ITStatus)bitstatus);
5257  0025 7b03          	ld	a,(OFST+0,sp)
5260  0027 5b04          	addw	sp,#4
5261  0029 81            	ret	
5297                     ; 1651 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
5297                     ; 1652 {
5298                     .text:	section	.text,new
5299  0000               _TIM2_ClearITPendingBit:
5303                     ; 1654   assert_param(IS_TIM2_IT(TIM2_IT));
5305                     ; 1657   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
5307  0000 43            	cpl	a
5308  0001 c75255        	ld	21077,a
5309                     ; 1658 }
5312  0004 81            	ret	
5384                     ; 1675 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5384                     ; 1676                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5384                     ; 1677                        uint8_t TIM2_ICFilter)
5384                     ; 1678 {
5385                     .text:	section	.text,new
5386  0000               L3_TI1_Config:
5388  0000 89            	pushw	x
5389  0001 89            	pushw	x
5390       00000002      OFST:	set	2
5393                     ; 1679   uint8_t tmpccmr1 = 0;
5395                     ; 1680   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5397  0002 9e            	ld	a,xh
5398  0003 6b01          	ld	(OFST-1,sp),a
5399                     ; 1681   tmpccmr1 = TIM2->CCMR1;
5401  0005 c65258        	ld	a,21080
5402  0008 6b02          	ld	(OFST+0,sp),a
5403                     ; 1684   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5405                     ; 1685   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5407                     ; 1686   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5409                     ; 1689   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5411  000a 7211525a      	bres	21082,#0
5412                     ; 1692   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5414  000e a40c          	and	a,#12
5415  0010 6b02          	ld	(OFST+0,sp),a
5416                     ; 1693   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5418  0012 7b07          	ld	a,(OFST+5,sp)
5419  0014 97            	ld	xl,a
5420  0015 a610          	ld	a,#16
5421  0017 42            	mul	x,a
5422  0018 9f            	ld	a,xl
5423  0019 1a04          	or	a,(OFST+2,sp)
5424  001b 1a02          	or	a,(OFST+0,sp)
5425  001d 6b02          	ld	(OFST+0,sp),a
5426                     ; 1695   TIM2->CCMR1 = tmpccmr1;
5428  001f c75258        	ld	21080,a
5429                     ; 1698   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5431  0022 7b01          	ld	a,(OFST-1,sp)
5432  0024 4a            	dec	a
5433  0025 2606          	jrne	L7072
5434                     ; 1700     TIM2->CCER1 |= TIM_CCER1_CC1P;
5436  0027 7212525a      	bset	21082,#1
5438  002b 2004          	jra	L1172
5439  002d               L7072:
5440                     ; 1704     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5442  002d 7213525a      	bres	21082,#1
5443  0031               L1172:
5444                     ; 1708   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5446  0031 7210525a      	bset	21082,#0
5447                     ; 1709 }
5450  0035 5b04          	addw	sp,#4
5451  0037 81            	ret	
5523                     ; 1726 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5523                     ; 1727                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5523                     ; 1728                        uint8_t TIM2_ICFilter)
5523                     ; 1729 {
5524                     .text:	section	.text,new
5525  0000               L5_TI2_Config:
5527  0000 89            	pushw	x
5528  0001 89            	pushw	x
5529       00000002      OFST:	set	2
5532                     ; 1730   uint8_t tmpccmr2 = 0;
5534                     ; 1731   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5536  0002 9e            	ld	a,xh
5537  0003 6b01          	ld	(OFST-1,sp),a
5538                     ; 1734   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5540                     ; 1735   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5542                     ; 1736   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5544                     ; 1738   tmpccmr2 = TIM2->CCMR2;
5546  0005 c65259        	ld	a,21081
5547  0008 6b02          	ld	(OFST+0,sp),a
5548                     ; 1741   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5550  000a 7219525a      	bres	21082,#4
5551                     ; 1744   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5553  000e a40c          	and	a,#12
5554  0010 6b02          	ld	(OFST+0,sp),a
5555                     ; 1745   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5557  0012 7b07          	ld	a,(OFST+5,sp)
5558  0014 97            	ld	xl,a
5559  0015 a610          	ld	a,#16
5560  0017 42            	mul	x,a
5561  0018 9f            	ld	a,xl
5562  0019 1a04          	or	a,(OFST+2,sp)
5563  001b 1a02          	or	a,(OFST+0,sp)
5564  001d 6b02          	ld	(OFST+0,sp),a
5565                     ; 1747   TIM2->CCMR2 = tmpccmr2;
5567  001f c75259        	ld	21081,a
5568                     ; 1750   if (tmpicpolarity == (uint8_t)TIM2_ICPolarity_Falling)
5570  0022 7b01          	ld	a,(OFST-1,sp)
5571  0024 4a            	dec	a
5572  0025 2606          	jrne	L1572
5573                     ; 1752     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5575  0027 721a525a      	bset	21082,#5
5577  002b 2004          	jra	L3572
5578  002d               L1572:
5579                     ; 1756     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5581  002d 721b525a      	bres	21082,#5
5582  0031               L3572:
5583                     ; 1760   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5585  0031 7218525a      	bset	21082,#4
5586                     ; 1761 }
5589  0035 5b04          	addw	sp,#4
5590  0037 81            	ret	
5658                     ; 1771 uint32_t TIM2_ComputeLsiClockFreq(uint32_t TIM2_TimerClockFreq)
5658                     ; 1772 {
5659                     .text:	section	.text,new
5660  0000               _TIM2_ComputeLsiClockFreq:
5662  0000 520c          	subw	sp,#12
5663       0000000c      OFST:	set	12
5666                     ; 1777   TIM2_ICInit(TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_Div8, 0x0);
5668  0002 4b00          	push	#0
5669  0004 4b0c          	push	#12
5670  0006 4b01          	push	#1
5671  0008 5f            	clrw	x
5672  0009 cd0000        	call	_TIM2_ICInit
5674  000c 5b03          	addw	sp,#3
5675                     ; 1780   TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
5677  000e ae0201        	ldw	x,#513
5678  0011 cd0000        	call	_TIM2_ITConfig
5680                     ; 1783   TIM2_Cmd(ENABLE);
5682  0014 a601          	ld	a,#1
5683  0016 cd0000        	call	_TIM2_Cmd
5685                     ; 1785   TIM2->SR1 = 0x00;
5687  0019 725f5255      	clr	21077
5688                     ; 1786   TIM2->SR2 = 0x00;
5690  001d 725f5256      	clr	21078
5691                     ; 1789   TIM2_ClearFlag(TIM2_FLAG_CC1);
5693  0021 ae0002        	ldw	x,#2
5694  0024 cd0000        	call	_TIM2_ClearFlag
5697  0027               L1103:
5698                     ; 1792   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5700  0027 72035255fb    	btjf	21077,#1,L1103
5701                     ; 1795   ICValue1 = TIM2_GetCapture1();
5703  002c cd0000        	call	_TIM2_GetCapture1
5705  002f 1f09          	ldw	(OFST-3,sp),x
5706                     ; 1796   TIM2_ClearFlag(TIM2_FLAG_CC1);
5708  0031 ae0002        	ldw	x,#2
5709  0034 cd0000        	call	_TIM2_ClearFlag
5712  0037               L7103:
5713                     ; 1799   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5715  0037 72035255fb    	btjf	21077,#1,L7103
5716                     ; 1802   ICValue2 = TIM2_GetCapture1();
5718  003c cd0000        	call	_TIM2_GetCapture1
5720  003f 1f0b          	ldw	(OFST-1,sp),x
5721                     ; 1803   TIM2_ClearFlag(TIM2_FLAG_CC1);
5723  0041 ae0002        	ldw	x,#2
5724  0044 cd0000        	call	_TIM2_ClearFlag
5726                     ; 1806   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5728  0047 7211525a      	bres	21082,#0
5729                     ; 1808   TIM2->CCMR1 = 0x00;
5731  004b 725f5258      	clr	21080
5732                     ; 1810   TIM2_Cmd(DISABLE);
5734  004f 4f            	clr	a
5735  0050 cd0000        	call	_TIM2_Cmd
5737                     ; 1813   LSIClockFreq = (8 * TIM2_TimerClockFreq) / (ICValue2 - ICValue1);
5739  0053 1e0b          	ldw	x,(OFST-1,sp)
5740  0055 72f009        	subw	x,(OFST-3,sp)
5741  0058 cd0000        	call	c_uitolx
5743  005b 96            	ldw	x,sp
5744  005c 5c            	incw	x
5745  005d cd0000        	call	c_rtol
5747  0060 96            	ldw	x,sp
5748  0061 1c000f        	addw	x,#OFST+3
5749  0064 cd0000        	call	c_ltor
5751  0067 a603          	ld	a,#3
5752  0069 cd0000        	call	c_llsh
5754  006c 96            	ldw	x,sp
5755  006d 5c            	incw	x
5756  006e cd0000        	call	c_ludv
5758  0071 96            	ldw	x,sp
5759  0072 1c0005        	addw	x,#OFST-7
5760  0075 cd0000        	call	c_rtol
5762                     ; 1814   return LSIClockFreq;
5764  0078 96            	ldw	x,sp
5765  0079 1c0005        	addw	x,#OFST-7
5766  007c cd0000        	call	c_ltor
5770  007f 5b0c          	addw	sp,#12
5771  0081 81            	ret	
5795                     ; 1822 FunctionalState TIM2_GetStatus(void)
5795                     ; 1823 {
5796                     .text:	section	.text,new
5797  0000               _TIM2_GetStatus:
5801                     ; 1824   return ((FunctionalState)(TIM2->CR1 & TIM_CR1_CEN));
5803  0000 c65250        	ld	a,21072
5804  0003 a401          	and	a,#1
5807  0005 81            	ret	
5820                     	xdef	_TIM2_GetStatus
5821                     	xdef	_TIM2_ComputeLsiClockFreq
5822                     	xdef	_TIM2_ClearITPendingBit
5823                     	xdef	_TIM2_GetITStatus
5824                     	xdef	_TIM2_ClearFlag
5825                     	xdef	_TIM2_GetFlagStatus
5826                     	xdef	_TIM2_GetPrescaler
5827                     	xdef	_TIM2_GetCounter
5828                     	xdef	_TIM2_GetCapture2
5829                     	xdef	_TIM2_GetCapture1
5830                     	xdef	_TIM2_SetIC2Prescaler
5831                     	xdef	_TIM2_SetIC1Prescaler
5832                     	xdef	_TIM2_SetCompare2
5833                     	xdef	_TIM2_SetCompare1
5834                     	xdef	_TIM2_SetAutoreload
5835                     	xdef	_TIM2_SetCounter
5836                     	xdef	_TIM2_SelectOCxM
5837                     	xdef	_TIM2_CCxCmd
5838                     	xdef	_TIM2_OC2PolarityConfig
5839                     	xdef	_TIM2_OC1PolarityConfig
5840                     	xdef	_TIM2_GenerateEvent
5841                     	xdef	_TIM2_OC2FastCmd
5842                     	xdef	_TIM2_OC1FastCmd
5843                     	xdef	_TIM2_OC2PreloadConfig
5844                     	xdef	_TIM2_OC1PreloadConfig
5845                     	xdef	_TIM2_ARRPreloadConfig
5846                     	xdef	_TIM2_ForcedOC2Config
5847                     	xdef	_TIM2_ForcedOC1Config
5848                     	xdef	_TIM2_CounterModeConfig
5849                     	xdef	_TIM2_PrescalerConfig
5850                     	xdef	_TIM2_EncoderInterfaceConfig
5851                     	xdef	_TIM2_SelectMasterSlaveMode
5852                     	xdef	_TIM2_SelectSlaveMode
5853                     	xdef	_TIM2_SelectOutputTrigger
5854                     	xdef	_TIM2_SelectOnePulseMode
5855                     	xdef	_TIM2_SelectHallSensor
5856                     	xdef	_TIM2_UpdateRequestConfig
5857                     	xdef	_TIM2_UpdateDisableConfig
5858                     	xdef	_TIM2_SelectInputTrigger
5859                     	xdef	_TIM2_TIxExternalClockConfig
5860                     	xdef	_TIM2_ETRConfig
5861                     	xdef	_TIM2_ETRClockMode2Config
5862                     	xdef	_TIM2_ETRClockMode1Config
5863                     	xdef	_TIM2_InternalClockConfig
5864                     	xdef	_TIM2_ITConfig
5865                     	xdef	_TIM2_CtrlPWMOutputs
5866                     	xdef	_TIM2_Cmd
5867                     	xdef	_TIM2_PWMIConfig
5868                     	xdef	_TIM2_ICInit
5869                     	xdef	_TIM2_BKRConfig
5870                     	xdef	_TIM2_OC2Init
5871                     	xdef	_TIM2_OC1Init
5872                     	xdef	_TIM2_TimeBaseInit
5873                     	xdef	_TIM2_DeInit
5874                     	xref.b	c_x
5893                     	xref	c_ludv
5894                     	xref	c_rtol
5895                     	xref	c_uitolx
5896                     	xref	c_llsh
5897                     	xref	c_ltor
5898                     	end
