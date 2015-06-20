   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  50                     ; 46 void UART1_DeInit(void)
  50                     ; 47 {
  52                     .text:	section	.text,new
  53  0000               _UART1_DeInit:
  57                     ; 50     (void)UART1->SR;
  59  0000 c65230        	ld	a,21040
  60                     ; 51     (void)UART1->DR;
  62  0003 c65231        	ld	a,21041
  63                     ; 53     UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  65  0006 725f5233      	clr	21043
  66                     ; 54     UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  68  000a 725f5232      	clr	21042
  69                     ; 56     UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  71  000e 725f5234      	clr	21044
  72                     ; 57     UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  74  0012 725f5235      	clr	21045
  75                     ; 58     UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  77  0016 725f5236      	clr	21046
  78                     ; 59     UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  80  001a 725f5237      	clr	21047
  81                     ; 60     UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  83  001e 725f5238      	clr	21048
  84                     ; 62     UART1->GTR = UART1_GTR_RESET_VALUE;
  86  0022 725f5239      	clr	21049
  87                     ; 63     UART1->PSCR = UART1_PSCR_RESET_VALUE;
  89  0026 725f523a      	clr	21050
  90                     ; 64 }
  93  002a 81            	ret	
 396                     .const:	section	.text
 397  0000               L41:
 398  0000 00000064      	dc.l	100
 399                     ; 83 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 399                     ; 84                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 399                     ; 85                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 399                     ; 86 {
 400                     .text:	section	.text,new
 401  0000               _UART1_Init:
 403  0000 520c          	subw	sp,#12
 404       0000000c      OFST:	set	12
 407                     ; 87     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 411                     ; 90     assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 413                     ; 91     assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 415                     ; 92     assert_param(IS_UART1_STOPBITS_OK(StopBits));
 417                     ; 93     assert_param(IS_UART1_PARITY_OK(Parity));
 419                     ; 94     assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 421                     ; 95     assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 423                     ; 98     UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 425  0002 72195234      	bres	21044,#4
 426                     ; 101     UART1->CR1 |= (uint8_t)WordLength;
 428  0006 c65234        	ld	a,21044
 429  0009 1a13          	or	a,(OFST+7,sp)
 430  000b c75234        	ld	21044,a
 431                     ; 104     UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 433  000e c65236        	ld	a,21046
 434  0011 a4cf          	and	a,#207
 435  0013 c75236        	ld	21046,a
 436                     ; 106     UART1->CR3 |= (uint8_t)StopBits;  
 438  0016 c65236        	ld	a,21046
 439  0019 1a14          	or	a,(OFST+8,sp)
 440  001b c75236        	ld	21046,a
 441                     ; 109     UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 443  001e c65234        	ld	a,21044
 444  0021 a4f9          	and	a,#249
 445  0023 c75234        	ld	21044,a
 446                     ; 111     UART1->CR1 |= (uint8_t)Parity;  
 448  0026 c65234        	ld	a,21044
 449  0029 1a15          	or	a,(OFST+9,sp)
 450  002b c75234        	ld	21044,a
 451                     ; 114     UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 453  002e 725f5232      	clr	21042
 454                     ; 116     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 456  0032 c65233        	ld	a,21043
 457  0035 a40f          	and	a,#15
 458  0037 c75233        	ld	21043,a
 459                     ; 118     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 461  003a c65233        	ld	a,21043
 462  003d a4f0          	and	a,#240
 463  003f c75233        	ld	21043,a
 464                     ; 121     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 466  0042 96            	ldw	x,sp
 467  0043 cd011c        	call	LC001
 469  0046 96            	ldw	x,sp
 470  0047 5c            	incw	x
 471  0048 cd0000        	call	c_rtol
 473  004b cd0000        	call	_CLK_GetClockFreq
 475  004e 96            	ldw	x,sp
 476  004f 5c            	incw	x
 477  0050 cd0000        	call	c_ludv
 479  0053 96            	ldw	x,sp
 480  0054 1c0009        	addw	x,#OFST-3
 481  0057 cd0000        	call	c_rtol
 483                     ; 122     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 485  005a 96            	ldw	x,sp
 486  005b cd011c        	call	LC001
 488  005e 96            	ldw	x,sp
 489  005f 5c            	incw	x
 490  0060 cd0000        	call	c_rtol
 492  0063 cd0000        	call	_CLK_GetClockFreq
 494  0066 a664          	ld	a,#100
 495  0068 cd0000        	call	c_smul
 497  006b 96            	ldw	x,sp
 498  006c 5c            	incw	x
 499  006d cd0000        	call	c_ludv
 501  0070 96            	ldw	x,sp
 502  0071 1c0005        	addw	x,#OFST-7
 503  0074 cd0000        	call	c_rtol
 505                     ; 124     UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 507  0077 96            	ldw	x,sp
 508  0078 1c0009        	addw	x,#OFST-3
 509  007b cd0000        	call	c_ltor
 511  007e a664          	ld	a,#100
 512  0080 cd0000        	call	c_smul
 514  0083 96            	ldw	x,sp
 515  0084 5c            	incw	x
 516  0085 cd0000        	call	c_rtol
 518  0088 96            	ldw	x,sp
 519  0089 1c0005        	addw	x,#OFST-7
 520  008c cd0000        	call	c_ltor
 522  008f 96            	ldw	x,sp
 523  0090 5c            	incw	x
 524  0091 cd0000        	call	c_lsub
 526  0094 a604          	ld	a,#4
 527  0096 cd0000        	call	c_llsh
 529  0099 ae0000        	ldw	x,#L41
 530  009c cd0000        	call	c_ludv
 532  009f b603          	ld	a,c_lreg+3
 533  00a1 a40f          	and	a,#15
 534  00a3 ca5233        	or	a,21043
 535  00a6 c75233        	ld	21043,a
 536                     ; 126     UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 538  00a9 96            	ldw	x,sp
 539  00aa 1c0009        	addw	x,#OFST-3
 540  00ad cd0000        	call	c_ltor
 542  00b0 a604          	ld	a,#4
 543  00b2 cd0000        	call	c_lursh
 545  00b5 b603          	ld	a,c_lreg+3
 546  00b7 a4f0          	and	a,#240
 547  00b9 b703          	ld	c_lreg+3,a
 548  00bb 3f02          	clr	c_lreg+2
 549  00bd 3f01          	clr	c_lreg+1
 550  00bf 3f00          	clr	c_lreg
 551  00c1 ca5233        	or	a,21043
 552  00c4 c75233        	ld	21043,a
 553                     ; 128     UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 555  00c7 c65232        	ld	a,21042
 556  00ca 1a0c          	or	a,(OFST+0,sp)
 557  00cc c75232        	ld	21042,a
 558                     ; 131     UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 560  00cf c65235        	ld	a,21045
 561  00d2 a4f3          	and	a,#243
 562  00d4 c75235        	ld	21045,a
 563                     ; 133     UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 565  00d7 c65236        	ld	a,21046
 566  00da a4f8          	and	a,#248
 567  00dc c75236        	ld	21046,a
 568                     ; 135     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 568                     ; 136                                               UART1_CR3_CPHA | UART1_CR3_LBCL));  
 570  00df 7b16          	ld	a,(OFST+10,sp)
 571  00e1 a407          	and	a,#7
 572  00e3 ca5236        	or	a,21046
 573  00e6 c75236        	ld	21046,a
 574                     ; 138     if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 576  00e9 7b17          	ld	a,(OFST+11,sp)
 577  00eb a504          	bcp	a,#4
 578  00ed 2706          	jreq	L371
 579                     ; 141         UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 581  00ef 72165235      	bset	21045,#3
 583  00f3 2004          	jra	L571
 584  00f5               L371:
 585                     ; 146         UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 587  00f5 72175235      	bres	21045,#3
 588  00f9               L571:
 589                     ; 148     if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 591  00f9 a508          	bcp	a,#8
 592  00fb 2706          	jreq	L771
 593                     ; 151         UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 595  00fd 72145235      	bset	21045,#2
 597  0101 2004          	jra	L102
 598  0103               L771:
 599                     ; 156         UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 601  0103 72155235      	bres	21045,#2
 602  0107               L102:
 603                     ; 160     if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 605  0107 7b16          	ld	a,(OFST+10,sp)
 606  0109 2a06          	jrpl	L302
 607                     ; 163         UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 609  010b 72175236      	bres	21046,#3
 611  010f 2008          	jra	L502
 612  0111               L302:
 613                     ; 167         UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 615  0111 a408          	and	a,#8
 616  0113 ca5236        	or	a,21046
 617  0116 c75236        	ld	21046,a
 618  0119               L502:
 619                     ; 169 }
 622  0119 5b0c          	addw	sp,#12
 623  011b 81            	ret	
 624  011c               LC001:
 625  011c 1c000f        	addw	x,#OFST+3
 626  011f cd0000        	call	c_ltor
 628  0122 a604          	ld	a,#4
 629  0124 cc0000        	jp	c_llsh
 684                     ; 177 void UART1_Cmd(FunctionalState NewState)
 684                     ; 178 {
 685                     .text:	section	.text,new
 686  0000               _UART1_Cmd:
 690                     ; 179     if (NewState != DISABLE)
 692  0000 4d            	tnz	a
 693  0001 2705          	jreq	L532
 694                     ; 182         UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 696  0003 721b5234      	bres	21044,#5
 699  0007 81            	ret	
 700  0008               L532:
 701                     ; 187         UART1->CR1 |= UART1_CR1_UARTD;  
 703  0008 721a5234      	bset	21044,#5
 704                     ; 189 }
 707  000c 81            	ret	
 832                     ; 205 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 832                     ; 206 {
 833                     .text:	section	.text,new
 834  0000               _UART1_ITConfig:
 836  0000 89            	pushw	x
 837  0001 89            	pushw	x
 838       00000002      OFST:	set	2
 841                     ; 207     uint8_t uartreg = 0, itpos = 0x00;
 845                     ; 210     assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 847                     ; 211     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 849                     ; 214     uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 851  0002 9e            	ld	a,xh
 852  0003 6b01          	ld	(OFST-1,sp),a
 853                     ; 216     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 855  0005 9f            	ld	a,xl
 856  0006 a40f          	and	a,#15
 857  0008 5f            	clrw	x
 858  0009 97            	ld	xl,a
 859  000a a601          	ld	a,#1
 860  000c 5d            	tnzw	x
 861  000d 2704          	jreq	L22
 862  000f               L42:
 863  000f 48            	sll	a
 864  0010 5a            	decw	x
 865  0011 26fc          	jrne	L42
 866  0013               L22:
 867  0013 6b02          	ld	(OFST+0,sp),a
 868                     ; 218     if (NewState != DISABLE)
 870  0015 7b07          	ld	a,(OFST+5,sp)
 871  0017 271f          	jreq	L713
 872                     ; 221         if (uartreg == 0x01)
 874  0019 7b01          	ld	a,(OFST-1,sp)
 875  001b a101          	cp	a,#1
 876  001d 2607          	jrne	L123
 877                     ; 223             UART1->CR1 |= itpos;
 879  001f c65234        	ld	a,21044
 880  0022 1a02          	or	a,(OFST+0,sp)
 882  0024 201e          	jp	LC003
 883  0026               L123:
 884                     ; 225         else if (uartreg == 0x02)
 886  0026 a102          	cp	a,#2
 887  0028 2607          	jrne	L523
 888                     ; 227             UART1->CR2 |= itpos;
 890  002a c65235        	ld	a,21045
 891  002d 1a02          	or	a,(OFST+0,sp)
 893  002f 2022          	jp	LC004
 894  0031               L523:
 895                     ; 231             UART1->CR4 |= itpos;
 897  0031 c65237        	ld	a,21047
 898  0034 1a02          	or	a,(OFST+0,sp)
 899  0036 2026          	jp	LC002
 900  0038               L713:
 901                     ; 237         if (uartreg == 0x01)
 903  0038 7b01          	ld	a,(OFST-1,sp)
 904  003a a101          	cp	a,#1
 905  003c 260b          	jrne	L333
 906                     ; 239             UART1->CR1 &= (uint8_t)(~itpos);
 908  003e 7b02          	ld	a,(OFST+0,sp)
 909  0040 43            	cpl	a
 910  0041 c45234        	and	a,21044
 911  0044               LC003:
 912  0044 c75234        	ld	21044,a
 914  0047 2018          	jra	L133
 915  0049               L333:
 916                     ; 241         else if (uartreg == 0x02)
 918  0049 a102          	cp	a,#2
 919  004b 260b          	jrne	L733
 920                     ; 243             UART1->CR2 &= (uint8_t)(~itpos);
 922  004d 7b02          	ld	a,(OFST+0,sp)
 923  004f 43            	cpl	a
 924  0050 c45235        	and	a,21045
 925  0053               LC004:
 926  0053 c75235        	ld	21045,a
 928  0056 2009          	jra	L133
 929  0058               L733:
 930                     ; 247             UART1->CR4 &= (uint8_t)(~itpos);
 932  0058 7b02          	ld	a,(OFST+0,sp)
 933  005a 43            	cpl	a
 934  005b c45237        	and	a,21047
 935  005e               LC002:
 936  005e c75237        	ld	21047,a
 937  0061               L133:
 938                     ; 251 }
 941  0061 5b04          	addw	sp,#4
 942  0063 81            	ret	
 978                     ; 258 void UART1_HalfDuplexCmd(FunctionalState NewState)
 978                     ; 259 {
 979                     .text:	section	.text,new
 980  0000               _UART1_HalfDuplexCmd:
 984                     ; 260     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 986                     ; 262     if (NewState != DISABLE)
 988  0000 4d            	tnz	a
 989  0001 2705          	jreq	L163
 990                     ; 264         UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 992  0003 72165238      	bset	21048,#3
 995  0007 81            	ret	
 996  0008               L163:
 997                     ; 268         UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
 999  0008 72175238      	bres	21048,#3
1000                     ; 270 }
1003  000c 81            	ret	
1060                     ; 278 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1060                     ; 279 {
1061                     .text:	section	.text,new
1062  0000               _UART1_IrDAConfig:
1066                     ; 280     assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1068                     ; 282     if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1070  0000 4d            	tnz	a
1071  0001 2705          	jreq	L314
1072                     ; 284         UART1->CR5 |= UART1_CR5_IRLP;
1074  0003 72145238      	bset	21048,#2
1077  0007 81            	ret	
1078  0008               L314:
1079                     ; 288         UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1081  0008 72155238      	bres	21048,#2
1082                     ; 290 }
1085  000c 81            	ret	
1120                     ; 298 void UART1_IrDACmd(FunctionalState NewState)
1120                     ; 299 {
1121                     .text:	section	.text,new
1122  0000               _UART1_IrDACmd:
1126                     ; 302     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1128                     ; 304     if (NewState != DISABLE)
1130  0000 4d            	tnz	a
1131  0001 2705          	jreq	L534
1132                     ; 307         UART1->CR5 |= UART1_CR5_IREN;
1134  0003 72125238      	bset	21048,#1
1137  0007 81            	ret	
1138  0008               L534:
1139                     ; 312         UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1141  0008 72135238      	bres	21048,#1
1142                     ; 314 }
1145  000c 81            	ret	
1204                     ; 323 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1204                     ; 324 {
1205                     .text:	section	.text,new
1206  0000               _UART1_LINBreakDetectionConfig:
1210                     ; 325     assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1212                     ; 327     if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1214  0000 4d            	tnz	a
1215  0001 2705          	jreq	L764
1216                     ; 329         UART1->CR4 |= UART1_CR4_LBDL;
1218  0003 721a5237      	bset	21047,#5
1221  0007 81            	ret	
1222  0008               L764:
1223                     ; 333         UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1225  0008 721b5237      	bres	21047,#5
1226                     ; 335 }
1229  000c 81            	ret	
1264                     ; 343 void UART1_LINCmd(FunctionalState NewState)
1264                     ; 344 {
1265                     .text:	section	.text,new
1266  0000               _UART1_LINCmd:
1270                     ; 345     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1272                     ; 347     if (NewState != DISABLE)
1274  0000 4d            	tnz	a
1275  0001 2705          	jreq	L115
1276                     ; 350         UART1->CR3 |= UART1_CR3_LINEN;
1278  0003 721c5236      	bset	21046,#6
1281  0007 81            	ret	
1282  0008               L115:
1283                     ; 355         UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1285  0008 721d5236      	bres	21046,#6
1286                     ; 357 }
1289  000c 81            	ret	
1324                     ; 364 void UART1_SmartCardCmd(FunctionalState NewState)
1324                     ; 365 {
1325                     .text:	section	.text,new
1326  0000               _UART1_SmartCardCmd:
1330                     ; 366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1332                     ; 368     if (NewState != DISABLE)
1334  0000 4d            	tnz	a
1335  0001 2705          	jreq	L335
1336                     ; 371         UART1->CR5 |= UART1_CR5_SCEN;
1338  0003 721a5238      	bset	21048,#5
1341  0007 81            	ret	
1342  0008               L335:
1343                     ; 376         UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1345  0008 721b5238      	bres	21048,#5
1346                     ; 378 }
1349  000c 81            	ret	
1385                     ; 387 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1385                     ; 388 {
1386                     .text:	section	.text,new
1387  0000               _UART1_SmartCardNACKCmd:
1391                     ; 389     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1393                     ; 391     if (NewState != DISABLE)
1395  0000 4d            	tnz	a
1396  0001 2705          	jreq	L555
1397                     ; 394         UART1->CR5 |= UART1_CR5_NACK;
1399  0003 72185238      	bset	21048,#4
1402  0007 81            	ret	
1403  0008               L555:
1404                     ; 399         UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1406  0008 72195238      	bres	21048,#4
1407                     ; 401 }
1410  000c 81            	ret	
1467                     ; 409 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1467                     ; 410 {
1468                     .text:	section	.text,new
1469  0000               _UART1_WakeUpConfig:
1473                     ; 411     assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1475                     ; 413     UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1477  0000 72175234      	bres	21044,#3
1478                     ; 414     UART1->CR1 |= (uint8_t)UART1_WakeUp;
1480  0004 ca5234        	or	a,21044
1481  0007 c75234        	ld	21044,a
1482                     ; 415 }
1485  000a 81            	ret	
1521                     ; 422 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1521                     ; 423 {
1522                     .text:	section	.text,new
1523  0000               _UART1_ReceiverWakeUpCmd:
1527                     ; 424     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1529                     ; 426     if (NewState != DISABLE)
1531  0000 4d            	tnz	a
1532  0001 2705          	jreq	L526
1533                     ; 429         UART1->CR2 |= UART1_CR2_RWU;
1535  0003 72125235      	bset	21045,#1
1538  0007 81            	ret	
1539  0008               L526:
1540                     ; 434         UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1542  0008 72135235      	bres	21045,#1
1543                     ; 436 }
1546  000c 81            	ret	
1569                     ; 443 uint8_t UART1_ReceiveData8(void)
1569                     ; 444 {
1570                     .text:	section	.text,new
1571  0000               _UART1_ReceiveData8:
1575                     ; 445     return ((uint8_t)UART1->DR);
1577  0000 c65231        	ld	a,21041
1580  0003 81            	ret	
1614                     ; 453 uint16_t UART1_ReceiveData9(void)
1614                     ; 454 {
1615                     .text:	section	.text,new
1616  0000               _UART1_ReceiveData9:
1618  0000 89            	pushw	x
1619       00000002      OFST:	set	2
1622                     ; 455   uint16_t temp = 0;
1624                     ; 457   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1626  0001 c65234        	ld	a,21044
1627  0004 a480          	and	a,#128
1628  0006 5f            	clrw	x
1629  0007 02            	rlwa	x,a
1630  0008 58            	sllw	x
1631  0009 1f01          	ldw	(OFST-1,sp),x
1632                     ; 458   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1634  000b c65231        	ld	a,21041
1635  000e 5f            	clrw	x
1636  000f 97            	ld	xl,a
1637  0010 01            	rrwa	x,a
1638  0011 1a02          	or	a,(OFST+0,sp)
1639  0013 01            	rrwa	x,a
1640  0014 1a01          	or	a,(OFST-1,sp)
1641  0016 a401          	and	a,#1
1642  0018 01            	rrwa	x,a
1645  0019 5b02          	addw	sp,#2
1646  001b 81            	ret	
1680                     ; 466 void UART1_SendData8(uint8_t Data)
1680                     ; 467 {
1681                     .text:	section	.text,new
1682  0000               _UART1_SendData8:
1686                     ; 469     UART1->DR = Data;
1688  0000 c75231        	ld	21041,a
1689                     ; 470 }
1692  0003 81            	ret	
1726                     ; 478 void UART1_SendData9(uint16_t Data)
1726                     ; 479 {
1727                     .text:	section	.text,new
1728  0000               _UART1_SendData9:
1730  0000 89            	pushw	x
1731       00000000      OFST:	set	0
1734                     ; 481     UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1736  0001 721d5234      	bres	21044,#6
1737                     ; 483     UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1739  0005 54            	srlw	x
1740  0006 54            	srlw	x
1741  0007 9f            	ld	a,xl
1742  0008 a440          	and	a,#64
1743  000a ca5234        	or	a,21044
1744  000d c75234        	ld	21044,a
1745                     ; 485     UART1->DR   = (uint8_t)(Data);
1747  0010 7b02          	ld	a,(OFST+2,sp)
1748  0012 c75231        	ld	21041,a
1749                     ; 486 }
1752  0015 85            	popw	x
1753  0016 81            	ret	
1776                     ; 493 void UART1_SendBreak(void)
1776                     ; 494 {
1777                     .text:	section	.text,new
1778  0000               _UART1_SendBreak:
1782                     ; 495     UART1->CR2 |= UART1_CR2_SBK;
1784  0000 72105235      	bset	21045,#0
1785                     ; 496 }
1788  0004 81            	ret	
1822                     ; 503 void UART1_SetAddress(uint8_t UART1_Address)
1822                     ; 504 {
1823                     .text:	section	.text,new
1824  0000               _UART1_SetAddress:
1826  0000 88            	push	a
1827       00000000      OFST:	set	0
1830                     ; 506     assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1832                     ; 509     UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1834  0001 c65237        	ld	a,21047
1835  0004 a4f0          	and	a,#240
1836  0006 c75237        	ld	21047,a
1837                     ; 511     UART1->CR4 |= UART1_Address;
1839  0009 c65237        	ld	a,21047
1840  000c 1a01          	or	a,(OFST+1,sp)
1841  000e c75237        	ld	21047,a
1842                     ; 512 }
1845  0011 84            	pop	a
1846  0012 81            	ret	
1880                     ; 520 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1880                     ; 521 {
1881                     .text:	section	.text,new
1882  0000               _UART1_SetGuardTime:
1886                     ; 523     UART1->GTR = UART1_GuardTime;
1888  0000 c75239        	ld	21049,a
1889                     ; 524 }
1892  0003 81            	ret	
1926                     ; 548 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1926                     ; 549 {
1927                     .text:	section	.text,new
1928  0000               _UART1_SetPrescaler:
1932                     ; 551     UART1->PSCR = UART1_Prescaler;
1934  0000 c7523a        	ld	21050,a
1935                     ; 552 }
1938  0003 81            	ret	
2081                     ; 560 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2081                     ; 561 {
2082                     .text:	section	.text,new
2083  0000               _UART1_GetFlagStatus:
2085  0000 89            	pushw	x
2086  0001 88            	push	a
2087       00000001      OFST:	set	1
2090                     ; 562     FlagStatus status = RESET;
2092                     ; 565     assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2094                     ; 569     if (UART1_FLAG == UART1_FLAG_LBDF)
2096  0002 a30210        	cpw	x,#528
2097  0005 2608          	jrne	L7501
2098                     ; 571         if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2100  0007 9f            	ld	a,xl
2101  0008 c45237        	and	a,21047
2102  000b 271e          	jreq	L5601
2103                     ; 574             status = SET;
2105  000d 2017          	jp	LC007
2106                     ; 579             status = RESET;
2107  000f               L7501:
2108                     ; 582     else if (UART1_FLAG == UART1_FLAG_SBK)
2110  000f 1e02          	ldw	x,(OFST+1,sp)
2111  0011 a30101        	cpw	x,#257
2112  0014 2609          	jrne	L7601
2113                     ; 584         if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2115  0016 c65235        	ld	a,21045
2116  0019 1503          	bcp	a,(OFST+2,sp)
2117  001b 270d          	jreq	L7701
2118                     ; 587             status = SET;
2120  001d 2007          	jp	LC007
2121                     ; 592             status = RESET;
2122  001f               L7601:
2123                     ; 597         if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2125  001f c65230        	ld	a,21040
2126  0022 1503          	bcp	a,(OFST+2,sp)
2127  0024 2704          	jreq	L7701
2128                     ; 600             status = SET;
2130  0026               LC007:
2133  0026 a601          	ld	a,#1
2136  0028 2001          	jra	L5601
2137  002a               L7701:
2138                     ; 605             status = RESET;
2141  002a 4f            	clr	a
2142  002b               L5601:
2143                     ; 609     return status;
2147  002b 5b03          	addw	sp,#3
2148  002d 81            	ret	
2183                     ; 639 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2183                     ; 640 {
2184                     .text:	section	.text,new
2185  0000               _UART1_ClearFlag:
2189                     ; 641     assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2191                     ; 644     if (UART1_FLAG == UART1_FLAG_RXNE)
2193  0000 a30020        	cpw	x,#32
2194  0003 2605          	jrne	L1211
2195                     ; 646         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2197  0005 35df5230      	mov	21040,#223
2200  0009 81            	ret	
2201  000a               L1211:
2202                     ; 651         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2204  000a 72195237      	bres	21047,#4
2205                     ; 653 }
2208  000e 81            	ret	
2290                     ; 668 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2290                     ; 669 {
2291                     .text:	section	.text,new
2292  0000               _UART1_GetITStatus:
2294  0000 89            	pushw	x
2295  0001 89            	pushw	x
2296       00000002      OFST:	set	2
2299                     ; 670     ITStatus pendingbitstatus = RESET;
2301                     ; 671     uint8_t itpos = 0;
2303                     ; 672     uint8_t itmask1 = 0;
2305                     ; 673     uint8_t itmask2 = 0;
2307                     ; 674     uint8_t enablestatus = 0;
2309                     ; 677     assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2311                     ; 680     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2313  0002 9f            	ld	a,xl
2314  0003 a40f          	and	a,#15
2315  0005 5f            	clrw	x
2316  0006 97            	ld	xl,a
2317  0007 a601          	ld	a,#1
2318  0009 5d            	tnzw	x
2319  000a 2704          	jreq	L67
2320  000c               L001:
2321  000c 48            	sll	a
2322  000d 5a            	decw	x
2323  000e 26fc          	jrne	L001
2324  0010               L67:
2325  0010 6b01          	ld	(OFST-1,sp),a
2326                     ; 682     itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2328  0012 7b04          	ld	a,(OFST+2,sp)
2329  0014 4e            	swap	a
2330  0015 a40f          	and	a,#15
2331  0017 6b02          	ld	(OFST+0,sp),a
2332                     ; 684     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2334  0019 5f            	clrw	x
2335  001a 97            	ld	xl,a
2336  001b a601          	ld	a,#1
2337  001d 5d            	tnzw	x
2338  001e 2704          	jreq	L201
2339  0020               L401:
2340  0020 48            	sll	a
2341  0021 5a            	decw	x
2342  0022 26fc          	jrne	L401
2343  0024               L201:
2344  0024 6b02          	ld	(OFST+0,sp),a
2345                     ; 688     if (UART1_IT == UART1_IT_PE)
2347  0026 1e03          	ldw	x,(OFST+1,sp)
2348  0028 a30100        	cpw	x,#256
2349  002b 260c          	jrne	L7611
2350                     ; 691         enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2352  002d c65234        	ld	a,21044
2353  0030 1402          	and	a,(OFST+0,sp)
2354  0032 6b02          	ld	(OFST+0,sp),a
2355                     ; 694         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2357  0034 c65230        	ld	a,21040
2359                     ; 697             pendingbitstatus = SET;
2361  0037 200f          	jp	LC010
2362                     ; 702             pendingbitstatus = RESET;
2363  0039               L7611:
2364                     ; 706     else if (UART1_IT == UART1_IT_LBDF)
2366  0039 a30346        	cpw	x,#838
2367  003c 2616          	jrne	L7711
2368                     ; 709         enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2370  003e c65237        	ld	a,21047
2371  0041 1402          	and	a,(OFST+0,sp)
2372  0043 6b02          	ld	(OFST+0,sp),a
2373                     ; 711         if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2375  0045 c65237        	ld	a,21047
2377  0048               LC010:
2378  0048 1501          	bcp	a,(OFST-1,sp)
2379  004a 271a          	jreq	L7021
2380  004c 7b02          	ld	a,(OFST+0,sp)
2381  004e 2716          	jreq	L7021
2382                     ; 714             pendingbitstatus = SET;
2384  0050               LC009:
2387  0050 a601          	ld	a,#1
2389  0052 2013          	jra	L5711
2390                     ; 719             pendingbitstatus = RESET;
2391  0054               L7711:
2392                     ; 725         enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2394  0054 c65235        	ld	a,21045
2395  0057 1402          	and	a,(OFST+0,sp)
2396  0059 6b02          	ld	(OFST+0,sp),a
2397                     ; 727         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2399  005b c65230        	ld	a,21040
2400  005e 1501          	bcp	a,(OFST-1,sp)
2401  0060 2704          	jreq	L7021
2403  0062 7b02          	ld	a,(OFST+0,sp)
2404                     ; 730             pendingbitstatus = SET;
2406  0064 26ea          	jrne	LC009
2407  0066               L7021:
2408                     ; 735             pendingbitstatus = RESET;
2412  0066 4f            	clr	a
2413  0067               L5711:
2414                     ; 740     return  pendingbitstatus;
2418  0067 5b04          	addw	sp,#4
2419  0069 81            	ret	
2455                     ; 768 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2455                     ; 769 {
2456                     .text:	section	.text,new
2457  0000               _UART1_ClearITPendingBit:
2461                     ; 770     assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2463                     ; 773     if (UART1_IT == UART1_IT_RXNE)
2465  0000 a30255        	cpw	x,#597
2466  0003 2605          	jrne	L1321
2467                     ; 775         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2469  0005 35df5230      	mov	21040,#223
2472  0009 81            	ret	
2473  000a               L1321:
2474                     ; 780         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2476  000a 72195237      	bres	21047,#4
2477                     ; 782 }
2480  000e 81            	ret	
2493                     	xdef	_UART1_ClearITPendingBit
2494                     	xdef	_UART1_GetITStatus
2495                     	xdef	_UART1_ClearFlag
2496                     	xdef	_UART1_GetFlagStatus
2497                     	xdef	_UART1_SetPrescaler
2498                     	xdef	_UART1_SetGuardTime
2499                     	xdef	_UART1_SetAddress
2500                     	xdef	_UART1_SendBreak
2501                     	xdef	_UART1_SendData9
2502                     	xdef	_UART1_SendData8
2503                     	xdef	_UART1_ReceiveData9
2504                     	xdef	_UART1_ReceiveData8
2505                     	xdef	_UART1_ReceiverWakeUpCmd
2506                     	xdef	_UART1_WakeUpConfig
2507                     	xdef	_UART1_SmartCardNACKCmd
2508                     	xdef	_UART1_SmartCardCmd
2509                     	xdef	_UART1_LINCmd
2510                     	xdef	_UART1_LINBreakDetectionConfig
2511                     	xdef	_UART1_IrDACmd
2512                     	xdef	_UART1_IrDAConfig
2513                     	xdef	_UART1_HalfDuplexCmd
2514                     	xdef	_UART1_ITConfig
2515                     	xdef	_UART1_Cmd
2516                     	xdef	_UART1_Init
2517                     	xdef	_UART1_DeInit
2518                     	xref	_CLK_GetClockFreq
2519                     	xref.b	c_lreg
2520                     	xref.b	c_x
2539                     	xref	c_lursh
2540                     	xref	c_lsub
2541                     	xref	c_smul
2542                     	xref	c_ludv
2543                     	xref	c_rtol
2544                     	xref	c_llsh
2545                     	xref	c_ltor
2546                     	end
