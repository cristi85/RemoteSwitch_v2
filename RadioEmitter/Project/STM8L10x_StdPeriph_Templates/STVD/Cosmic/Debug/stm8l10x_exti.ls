   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 55 void EXTI_DeInit(void)
  49                     ; 56 {
  51                     .text:	section	.text,new
  52  0000               _EXTI_DeInit:
  56                     ; 57   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  58  0000 725f50a0      	clr	20640
  59                     ; 58   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  61  0004 725f50a1      	clr	20641
  62                     ; 59   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  64  0008 725f50a2      	clr	20642
  65                     ; 60   EXTI->SR1 = EXTI_SR1_RESET_VALUE;
  67  000c 725f50a3      	clr	20643
  68                     ; 61   EXTI->SR2 = EXTI_SR2_RESET_VALUE;
  70  0010 725f50a4      	clr	20644
  71                     ; 62   EXTI->CONF = EXTI_CONF_RESET_VALUE;
  73  0014 725f50a5      	clr	20645
  74                     ; 63 }
  77  0018 81            	ret	
 181                     ; 84 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 181                     ; 85                              EXTI_Trigger_TypeDef EXTI_TriggerValue)
 181                     ; 86 {
 182                     .text:	section	.text,new
 183  0000               _EXTI_SetPortSensitivity:
 185  0000 89            	pushw	x
 186       00000000      OFST:	set	0
 189                     ; 89   assert_param(IS_EXTI_PORT(EXTI_Port));
 191                     ; 90   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 193                     ; 93   if (EXTI_Port != EXTI_Port_B)
 195  0001 9e            	ld	a,xh
 196  0002 4d            	tnz	a
 197  0003 2707          	jreq	L76
 198                     ; 95     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PDIS);
 200  0005 c650a2        	ld	a,20642
 201  0008 a4f3          	and	a,#243
 203  000a 2005          	jra	L17
 204  000c               L76:
 205                     ; 99     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PBIS);
 207  000c c650a2        	ld	a,20642
 208  000f a4fc          	and	a,#252
 209  0011               L17:
 210  0011 c750a2        	ld	20642,a
 211                     ; 103   EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_Port);
 213  0014 7b01          	ld	a,(OFST+1,sp)
 214  0016 5f            	clrw	x
 215  0017 97            	ld	xl,a
 216  0018 7b02          	ld	a,(OFST+2,sp)
 217  001a 5d            	tnzw	x
 218  001b 2704          	jreq	L01
 219  001d               L21:
 220  001d 48            	sll	a
 221  001e 5a            	decw	x
 222  001f 26fc          	jrne	L21
 223  0021               L01:
 224  0021 ca50a2        	or	a,20642
 225  0024 c750a2        	ld	20642,a
 226                     ; 105 }
 229  0027 85            	popw	x
 230  0028 81            	ret	
 338                     ; 132 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum,
 338                     ; 133                             EXTI_Trigger_TypeDef EXTI_TriggerValue)
 338                     ; 134 {
 339                     .text:	section	.text,new
 340  0000               _EXTI_SetPinSensitivity:
 342  0000 89            	pushw	x
 343       00000000      OFST:	set	0
 346                     ; 137   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 348                     ; 138   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 350                     ; 141   switch (EXTI_PinNum)
 352  0001 9e            	ld	a,xh
 354                     ; 175     default:
 354                     ; 176       break;
 355  0002 4d            	tnz	a
 356  0003 2728          	jreq	L37
 357  0005 a002          	sub	a,#2
 358  0007 273b          	jreq	L57
 359  0009 a002          	sub	a,#2
 360  000b 274e          	jreq	L77
 361  000d a002          	sub	a,#2
 362  000f 2761          	jreq	L101
 363  0011 a00a          	sub	a,#10
 364  0013 277a          	jreq	L301
 365  0015 a002          	sub	a,#2
 366  0017 2603cc00a6    	jreq	L501
 367  001c a002          	sub	a,#2
 368  001e 2603cc00bd    	jreq	L701
 369  0023 a002          	sub	a,#2
 370  0025 2603cc00d4    	jreq	L111
 371  002a cc00ef        	jra	L561
 372  002d               L37:
 373                     ; 143     case EXTI_Pin_0:
 373                     ; 144       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P0IS);
 375  002d c650a0        	ld	a,20640
 376  0030 a4fc          	and	a,#252
 377  0032 c750a0        	ld	20640,a
 378                     ; 145       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 380  0035 7b01          	ld	a,(OFST+1,sp)
 381  0037 5f            	clrw	x
 382  0038 97            	ld	xl,a
 383  0039 7b02          	ld	a,(OFST+2,sp)
 384  003b 5d            	tnzw	x
 385  003c 2749          	jreq	L23
 386  003e               L02:
 387  003e 48            	sll	a
 388  003f 5a            	decw	x
 389  0040 26fc          	jrne	L02
 390                     ; 146       break;
 392  0042 2043          	jp	L23
 393  0044               L57:
 394                     ; 147     case EXTI_Pin_1:
 394                     ; 148       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P1IS);
 396  0044 c650a0        	ld	a,20640
 397  0047 a4f3          	and	a,#243
 398  0049 c750a0        	ld	20640,a
 399                     ; 149       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 401  004c 7b01          	ld	a,(OFST+1,sp)
 402  004e 5f            	clrw	x
 403  004f 97            	ld	xl,a
 404  0050 7b02          	ld	a,(OFST+2,sp)
 405  0052 5d            	tnzw	x
 406  0053 2732          	jreq	L23
 407  0055               L42:
 408  0055 48            	sll	a
 409  0056 5a            	decw	x
 410  0057 26fc          	jrne	L42
 411                     ; 150       break;
 413  0059 202c          	jp	L23
 414  005b               L77:
 415                     ; 151     case EXTI_Pin_2:
 415                     ; 152       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P2IS);
 417  005b c650a0        	ld	a,20640
 418  005e a4cf          	and	a,#207
 419  0060 c750a0        	ld	20640,a
 420                     ; 153       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 422  0063 7b01          	ld	a,(OFST+1,sp)
 423  0065 5f            	clrw	x
 424  0066 97            	ld	xl,a
 425  0067 7b02          	ld	a,(OFST+2,sp)
 426  0069 5d            	tnzw	x
 427  006a 271b          	jreq	L23
 428  006c               L03:
 429  006c 48            	sll	a
 430  006d 5a            	decw	x
 431  006e 26fc          	jrne	L03
 432                     ; 154       break;
 434  0070 2015          	jp	L23
 435  0072               L101:
 436                     ; 155     case EXTI_Pin_3:
 436                     ; 156       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P3IS);
 438  0072 c650a0        	ld	a,20640
 439  0075 a43f          	and	a,#63
 440  0077 c750a0        	ld	20640,a
 441                     ; 157       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 443  007a 7b01          	ld	a,(OFST+1,sp)
 444  007c 5f            	clrw	x
 445  007d 97            	ld	xl,a
 446  007e 7b02          	ld	a,(OFST+2,sp)
 447  0080 5d            	tnzw	x
 448  0081 2704          	jreq	L23
 449  0083               L43:
 450  0083 48            	sll	a
 451  0084 5a            	decw	x
 452  0085 26fc          	jrne	L43
 453  0087               L23:
 454  0087 ca50a0        	or	a,20640
 455  008a c750a0        	ld	20640,a
 456                     ; 158       break;
 458  008d 2060          	jra	L561
 459  008f               L301:
 460                     ; 159     case EXTI_Pin_4:
 460                     ; 160       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P4IS);
 462  008f c650a1        	ld	a,20641
 463  0092 a4fc          	and	a,#252
 464  0094 c750a1        	ld	20641,a
 465                     ; 161       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 467  0097 7b01          	ld	a,(OFST+1,sp)
 468  0099 ad56          	call	LC003
 469  009b 7b02          	ld	a,(OFST+2,sp)
 470  009d 5d            	tnzw	x
 471  009e 2749          	jreq	L25
 472  00a0               L04:
 473  00a0 48            	sll	a
 474  00a1 5a            	decw	x
 475  00a2 26fc          	jrne	L04
 476                     ; 162       break;
 478  00a4 2043          	jp	L25
 479  00a6               L501:
 480                     ; 163     case EXTI_Pin_5:
 480                     ; 164       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P5IS);
 482  00a6 c650a1        	ld	a,20641
 483  00a9 a4f3          	and	a,#243
 484  00ab c750a1        	ld	20641,a
 485                     ; 165       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 487  00ae 7b01          	ld	a,(OFST+1,sp)
 488  00b0 ad3f          	call	LC003
 489  00b2 7b02          	ld	a,(OFST+2,sp)
 490  00b4 5d            	tnzw	x
 491  00b5 2732          	jreq	L25
 492  00b7               L44:
 493  00b7 48            	sll	a
 494  00b8 5a            	decw	x
 495  00b9 26fc          	jrne	L44
 496                     ; 166       break;
 498  00bb 202c          	jp	L25
 499  00bd               L701:
 500                     ; 167     case EXTI_Pin_6:
 500                     ; 168       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P6IS);
 502  00bd c650a1        	ld	a,20641
 503  00c0 a4cf          	and	a,#207
 504  00c2 c750a1        	ld	20641,a
 505                     ; 169       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 507  00c5 7b01          	ld	a,(OFST+1,sp)
 508  00c7 ad28          	call	LC003
 509  00c9 7b02          	ld	a,(OFST+2,sp)
 510  00cb 5d            	tnzw	x
 511  00cc 271b          	jreq	L25
 512  00ce               L05:
 513  00ce 48            	sll	a
 514  00cf 5a            	decw	x
 515  00d0 26fc          	jrne	L05
 516                     ; 170       break;
 518  00d2 2015          	jp	L25
 519  00d4               L111:
 520                     ; 171     case EXTI_Pin_7:
 520                     ; 172       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P7IS);
 522  00d4 c650a1        	ld	a,20641
 523  00d7 a43f          	and	a,#63
 524  00d9 c750a1        	ld	20641,a
 525                     ; 173       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 527  00dc 7b01          	ld	a,(OFST+1,sp)
 528  00de ad11          	call	LC003
 529  00e0 7b02          	ld	a,(OFST+2,sp)
 530  00e2 5d            	tnzw	x
 531  00e3 2704          	jreq	L25
 532  00e5               L45:
 533  00e5 48            	sll	a
 534  00e6 5a            	decw	x
 535  00e7 26fc          	jrne	L45
 536  00e9               L25:
 537  00e9 ca50a1        	or	a,20641
 538  00ec c750a1        	ld	20641,a
 539                     ; 174       break;
 541                     ; 175     default:
 541                     ; 176       break;
 543  00ef               L561:
 544                     ; 178 }
 547  00ef 85            	popw	x
 548  00f0 81            	ret	
 549  00f1               LC003:
 550  00f1 a4ef          	and	a,#239
 551  00f3 5f            	clrw	x
 552  00f4 97            	ld	xl,a
 553  00f5 81            	ret	
 657                     ; 193 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 657                     ; 194                                FunctionalState NewState)
 657                     ; 195 {
 658                     .text:	section	.text,new
 659  0000               _EXTI_SetHalfPortSelection:
 661  0000 89            	pushw	x
 662       00000000      OFST:	set	0
 665                     ; 197   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 667                     ; 198   assert_param(IS_FUNCTIONAL_STATE(NewState));
 669                     ; 200   if (NewState != DISABLE)
 671  0001 9f            	ld	a,xl
 672  0002 4d            	tnz	a
 673  0003 2706          	jreq	L532
 674                     ; 202     EXTI->CONF |= (uint8_t)EXTI_HalfPort; /* Enable port interrupt selector */
 676  0005 9e            	ld	a,xh
 677  0006 ca50a5        	or	a,20645
 679  0009 2006          	jra	L732
 680  000b               L532:
 681                     ; 206     EXTI->CONF &= (uint8_t)(~(uint8_t)EXTI_HalfPort); /* Disable port interrupt selector */
 683  000b 7b01          	ld	a,(OFST+1,sp)
 684  000d 43            	cpl	a
 685  000e c450a5        	and	a,20645
 686  0011               L732:
 687  0011 c750a5        	ld	20645,a
 688                     ; 208 }
 691  0014 85            	popw	x
 692  0015 81            	ret	
 738                     ; 218 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
 738                     ; 219 {
 739                     .text:	section	.text,new
 740  0000               _EXTI_GetPortSensitivity:
 742  0000 88            	push	a
 743       00000001      OFST:	set	1
 746                     ; 220   uint8_t value = 0;
 748                     ; 223   assert_param(IS_EXTI_PORT(EXTI_Port));
 750                     ; 225   if (EXTI_Port != EXTI_Port_B)
 752  0001 4d            	tnz	a
 753  0002 2707          	jreq	L362
 754                     ; 227     value = (uint8_t)((EXTI->CR3 & EXTI_CR3_PDIS) >> 2);
 756  0004 c650a2        	ld	a,20642
 757  0007 44            	srl	a
 758  0008 44            	srl	a
 760  0009 2003          	jra	L562
 761  000b               L362:
 762                     ; 231     value = (uint8_t)(EXTI->CR3 & EXTI_CR3_PBIS);
 764  000b c650a2        	ld	a,20642
 765  000e               L562:
 766  000e a403          	and	a,#3
 767                     ; 233   return((EXTI_Trigger_TypeDef)value);
 771  0010 5b01          	addw	sp,#1
 772  0012 81            	ret	
 818                     ; 250 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum)
 818                     ; 251 {
 819                     .text:	section	.text,new
 820  0000               _EXTI_GetPinSensitivity:
 822  0000 88            	push	a
 823       00000001      OFST:	set	1
 826                     ; 252   uint8_t value = 0;
 828  0001 0f01          	clr	(OFST+0,sp)
 829                     ; 255   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 831                     ; 257   switch (EXTI_PinNum)
 834                     ; 283     default:
 834                     ; 284       break;
 835  0003 4d            	tnz	a
 836  0004 2720          	jreq	L762
 837  0006 a002          	sub	a,#2
 838  0008 2721          	jreq	L172
 839  000a a002          	sub	a,#2
 840  000c 2722          	jreq	L372
 841  000e a002          	sub	a,#2
 842  0010 2724          	jreq	L572
 843  0012 a00a          	sub	a,#10
 844  0014 2725          	jreq	L772
 845  0016 a002          	sub	a,#2
 846  0018 2726          	jreq	L103
 847  001a a002          	sub	a,#2
 848  001c 2727          	jreq	L303
 849  001e a002          	sub	a,#2
 850  0020 2729          	jreq	L503
 851  0022 7b01          	ld	a,(OFST+0,sp)
 852  0024 202d          	jra	L533
 853  0026               L762:
 854                     ; 259     case EXTI_Pin_0:
 854                     ; 260       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
 856  0026 c650a0        	ld	a,20640
 857                     ; 261       break;
 859  0029 2026          	jp	LC004
 860  002b               L172:
 861                     ; 262     case EXTI_Pin_1:
 861                     ; 263       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P1IS) >> (uint8_t)EXTI_Pin_1);
 863  002b c650a0        	ld	a,20640
 864                     ; 264       break;
 866  002e 201f          	jp	LC005
 867  0030               L372:
 868                     ; 265     case EXTI_Pin_2:
 868                     ; 266       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P2IS) >> (uint8_t)EXTI_Pin_2);
 870  0030 c650a0        	ld	a,20640
 871  0033 4e            	swap	a
 872                     ; 267       break;
 874  0034 201b          	jp	LC004
 875  0036               L572:
 876                     ; 268     case EXTI_Pin_3:
 876                     ; 269       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P3IS) >> (uint8_t)EXTI_Pin_3);
 878  0036 c650a0        	ld	a,20640
 879                     ; 270       break;
 881  0039 2013          	jp	LC006
 882  003b               L772:
 883                     ; 271     case EXTI_Pin_4:
 883                     ; 272       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
 885  003b c650a1        	ld	a,20641
 886                     ; 273       break;
 888  003e 2011          	jp	LC004
 889  0040               L103:
 890                     ; 274     case EXTI_Pin_5:
 890                     ; 275       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
 892  0040 c650a1        	ld	a,20641
 893                     ; 276       break;
 895  0043 200a          	jp	LC005
 896  0045               L303:
 897                     ; 277     case EXTI_Pin_6:
 897                     ; 278       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
 899  0045 c650a1        	ld	a,20641
 900  0048 4e            	swap	a
 901                     ; 279       break;
 903  0049 2006          	jp	LC004
 904  004b               L503:
 905                     ; 280     case EXTI_Pin_7:
 905                     ; 281       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
 907  004b c650a1        	ld	a,20641
 908  004e               LC006:
 909  004e 4e            	swap	a
 910  004f               LC005:
 911  004f 44            	srl	a
 912  0050 44            	srl	a
 913  0051               LC004:
 914  0051 a403          	and	a,#3
 915                     ; 282       break;
 917                     ; 283     default:
 917                     ; 284       break;
 919  0053               L533:
 920                     ; 286   return((EXTI_Trigger_TypeDef)value);
 924  0053 5b01          	addw	sp,#1
 925  0055 81            	ret	
 972                     ; 299 FunctionalState EXTI_GetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort)
 972                     ; 300 {
 973                     .text:	section	.text,new
 974  0000               _EXTI_GetHalfPortSelection:
 976  0000 88            	push	a
 977       00000001      OFST:	set	1
 980                     ; 301   FunctionalState value = DISABLE;
 982                     ; 303   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 984                     ; 304   if ((EXTI->CONF & (uint8_t)EXTI_HalfPort) != (uint8_t)DISABLE)
 986  0001 c450a5        	and	a,20645
 987  0004 2702          	jreq	L163
 988                     ; 306     value = ENABLE;
 990  0006 a601          	ld	a,#1
 992  0008               L163:
 993                     ; 310     value = DISABLE;
 995                     ; 313   return(value);
 999  0008 5b01          	addw	sp,#1
1000  000a 81            	ret	
1142                     ; 332 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1142                     ; 333 {
1143                     .text:	section	.text,new
1144  0000               _EXTI_GetITStatus:
1146  0000 88            	push	a
1147  0001 88            	push	a
1148       00000001      OFST:	set	1
1151                     ; 334   ITStatus status = RESET;
1153                     ; 336   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1155                     ; 338   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1157  0002 a4f0          	and	a,#240
1158  0004 a1f0          	cp	a,#240
1159  0006 2609          	jrne	L744
1160                     ; 340     status = (ITStatus)(EXTI->SR2 & ((uint8_t)EXTI_IT & (uint8_t)0x0F));
1162  0008 7b02          	ld	a,(OFST+1,sp)
1163  000a a40f          	and	a,#15
1164  000c c450a4        	and	a,20644
1166  000f 2005          	jra	L154
1167  0011               L744:
1168                     ; 344     status = (ITStatus)(EXTI->SR1 & (uint8_t)EXTI_IT);
1170  0011 c650a3        	ld	a,20643
1171  0014 1402          	and	a,(OFST+1,sp)
1172  0016               L154:
1173                     ; 346   return((ITStatus)status);
1177  0016 85            	popw	x
1178  0017 81            	ret	
1214                     ; 365 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1214                     ; 366 {
1215                     .text:	section	.text,new
1216  0000               _EXTI_ClearITPendingBit:
1218  0000 88            	push	a
1219       00000000      OFST:	set	0
1222                     ; 368   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1224                     ; 370   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1226  0001 a4f0          	and	a,#240
1227  0003 a1f0          	cp	a,#240
1228  0005 2609          	jrne	L174
1229                     ; 372     EXTI->SR2 = (uint8_t)((uint8_t)EXTI_IT & (uint8_t)0x0F);
1231  0007 7b01          	ld	a,(OFST+1,sp)
1232  0009 a40f          	and	a,#15
1233  000b c750a4        	ld	20644,a
1235  000e 2005          	jra	L374
1236  0010               L174:
1237                     ; 376     EXTI->SR1 = (uint8_t)EXTI_IT;
1239  0010 7b01          	ld	a,(OFST+1,sp)
1240  0012 c750a3        	ld	20643,a
1241  0015               L374:
1242                     ; 378 }
1245  0015 84            	pop	a
1246  0016 81            	ret	
1259                     	xdef	_EXTI_ClearITPendingBit
1260                     	xdef	_EXTI_GetITStatus
1261                     	xdef	_EXTI_GetHalfPortSelection
1262                     	xdef	_EXTI_GetPinSensitivity
1263                     	xdef	_EXTI_GetPortSensitivity
1264                     	xdef	_EXTI_SetHalfPortSelection
1265                     	xdef	_EXTI_SetPinSensitivity
1266                     	xdef	_EXTI_SetPortSensitivity
1267                     	xdef	_EXTI_DeInit
1286                     	end
