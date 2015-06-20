   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 55 void SPI_DeInit(void)
  49                     ; 56 {
  51                     .text:	section	.text,new
  52  0000               _SPI_DeInit:
  56                     ; 57   SPI->CR1 = SPI_CR1_RESET_VALUE;
  58  0000 725f5200      	clr	20992
  59                     ; 58   SPI->CR2 = SPI_CR2_RESET_VALUE;
  61  0004 725f5201      	clr	20993
  62                     ; 59   SPI->ICR = SPI_ICR_RESET_VALUE;
  64  0008 725f5202      	clr	20994
  65                     ; 60   SPI->SR = SPI_SR_RESET_VALUE;
  67  000c 35025203      	mov	20995,#2
  68                     ; 61 }
  71  0010 81            	ret	
 375                     ; 103 void SPI_Init(SPI_FirstBit_TypeDef SPI_FirstBit, SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 375                     ; 104               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL, SPI_CPHA_TypeDef SPI_CPHA,
 375                     ; 105               SPI_DirectionMode_TypeDef SPI_DirectionMode, SPI_NSS_TypeDef SPI_NSS)
 375                     ; 106 {
 376                     .text:	section	.text,new
 377  0000               _SPI_Init:
 379  0000 89            	pushw	x
 380       00000000      OFST:	set	0
 383                     ; 109   assert_param(IS_SPI_FIRST_BIT(SPI_FirstBit));
 385                     ; 110   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 387                     ; 111   assert_param(IS_SPI_MODE(SPI_Mode));
 389                     ; 112   assert_param(IS_SPI_CPOL(SPI_CPOL));
 391                     ; 113   assert_param(IS_SPI_CPHA(SPI_CPHA));
 393                     ; 114   assert_param(IS_SPI_DIRECTION_MODE(SPI_DirectionMode));
 395                     ; 115   assert_param(IS_SPI_NSS(SPI_NSS));
 397                     ; 118   SPI->CR1 = (uint8_t)((uint8_t)(SPI_FirstBit) |
 397                     ; 119                        (uint8_t)(SPI_BaudRatePrescaler) |
 397                     ; 120                        (uint8_t)(SPI_CPOL) |
 397                     ; 121                        (uint8_t)(SPI_CPHA));
 399  0001 9f            	ld	a,xl
 400  0002 1a01          	or	a,(OFST+1,sp)
 401  0004 1a06          	or	a,(OFST+6,sp)
 402  0006 1a07          	or	a,(OFST+7,sp)
 403  0008 c75200        	ld	20992,a
 404                     ; 124   SPI->CR2 = (uint8_t)((uint8_t)(SPI_DirectionMode) | (uint8_t)(SPI_NSS));
 406  000b 7b08          	ld	a,(OFST+8,sp)
 407  000d 1a09          	or	a,(OFST+9,sp)
 408  000f c75201        	ld	20993,a
 409                     ; 126   if (SPI_Mode == SPI_Mode_Master)
 411  0012 7b05          	ld	a,(OFST+5,sp)
 412  0014 a104          	cp	a,#4
 413  0016 2606          	jrne	L771
 414                     ; 128     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 416  0018 72105201      	bset	20993,#0
 418  001c 2004          	jra	L102
 419  001e               L771:
 420                     ; 132     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 422  001e 72115201      	bres	20993,#0
 423  0022               L102:
 424                     ; 136   SPI->CR1 |= (uint8_t)(SPI_Mode);
 426  0022 c65200        	ld	a,20992
 427  0025 1a05          	or	a,(OFST+5,sp)
 428  0027 c75200        	ld	20992,a
 429                     ; 137 }
 432  002a 85            	popw	x
 433  002b 81            	ret	
 488                     ; 145 void SPI_Cmd(FunctionalState NewState)
 488                     ; 146 {
 489                     .text:	section	.text,new
 490  0000               _SPI_Cmd:
 494                     ; 149   assert_param(IS_FUNCTIONAL_STATE(NewState));
 496                     ; 151   if (NewState != DISABLE)
 498  0000 4d            	tnz	a
 499  0001 2705          	jreq	L132
 500                     ; 153     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral */
 502  0003 721c5200      	bset	20992,#6
 505  0007 81            	ret	
 506  0008               L132:
 507                     ; 157     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral */
 509  0008 721d5200      	bres	20992,#6
 510                     ; 160 }
 513  000c 81            	ret	
 615                     ; 174 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 615                     ; 175 {
 616                     .text:	section	.text,new
 617  0000               _SPI_ITConfig:
 619  0000 89            	pushw	x
 620  0001 88            	push	a
 621       00000001      OFST:	set	1
 624                     ; 176   uint8_t itpos = 0;
 626                     ; 178   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
 628                     ; 179   assert_param(IS_FUNCTIONAL_STATE(NewState));
 630                     ; 182   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 632  0002 9e            	ld	a,xh
 633  0003 a40f          	and	a,#15
 634  0005 5f            	clrw	x
 635  0006 97            	ld	xl,a
 636  0007 a601          	ld	a,#1
 637  0009 5d            	tnzw	x
 638  000a 2704          	jreq	L41
 639  000c               L61:
 640  000c 48            	sll	a
 641  000d 5a            	decw	x
 642  000e 26fc          	jrne	L61
 643  0010               L41:
 644  0010 6b01          	ld	(OFST+0,sp),a
 645                     ; 184   if (NewState != DISABLE)
 647  0012 0d03          	tnz	(OFST+2,sp)
 648  0014 2707          	jreq	L303
 649                     ; 186     SPI->ICR |= itpos; /* Enable interrupt*/
 651  0016 c65202        	ld	a,20994
 652  0019 1a01          	or	a,(OFST+0,sp)
 654  001b 2004          	jra	L503
 655  001d               L303:
 656                     ; 190     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 658  001d 43            	cpl	a
 659  001e c45202        	and	a,20994
 660  0021               L503:
 661  0021 c75202        	ld	20994,a
 662                     ; 192 }
 665  0024 5b03          	addw	sp,#3
 666  0026 81            	ret	
 700                     ; 199 void SPI_SendData(uint8_t Data)
 700                     ; 200 {
 701                     .text:	section	.text,new
 702  0000               _SPI_SendData:
 706                     ; 201   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 708  0000 c75204        	ld	20996,a
 709                     ; 202 }
 712  0003 81            	ret	
 735                     ; 209 uint8_t SPI_ReceiveData(void)
 735                     ; 210 {
 736                     .text:	section	.text,new
 737  0000               _SPI_ReceiveData:
 741                     ; 211   return ((uint8_t)SPI->DR); /* Return the data in the DR register */
 743  0000 c65204        	ld	a,20996
 746  0003 81            	ret	
 782                     ; 221 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 782                     ; 222 {
 783                     .text:	section	.text,new
 784  0000               _SPI_NSSInternalSoftwareCmd:
 788                     ; 225   assert_param(IS_FUNCTIONAL_STATE(NewState));
 790                     ; 227   if (NewState != DISABLE)
 792  0000 4d            	tnz	a
 793  0001 2705          	jreq	L353
 794                     ; 229     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software */
 796  0003 72105201      	bset	20993,#0
 799  0007 81            	ret	
 800  0008               L353:
 801                     ; 233     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software */
 803  0008 72115201      	bres	20993,#0
 804                     ; 236 }
 807  000c 81            	ret	
 863                     ; 246 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
 863                     ; 247 {
 864                     .text:	section	.text,new
 865  0000               _SPI_BiDirectionalLineConfig:
 869                     ; 250   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 871                     ; 251   if (SPI_Direction != SPI_Direction_Rx)
 873  0000 4d            	tnz	a
 874  0001 2705          	jreq	L504
 875                     ; 253     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 877  0003 721c5201      	bset	20993,#6
 880  0007 81            	ret	
 881  0008               L504:
 882                     ; 257     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 884  0008 721d5201      	bres	20993,#6
 885                     ; 259 }
 888  000c 81            	ret	
1002                     ; 275 FlagStatus SPI_GetFlagStatus(SPI_FLAG_TypeDef SPI_FLAG)
1002                     ; 276 {
1003                     .text:	section	.text,new
1004  0000               _SPI_GetFlagStatus:
1006  0000 88            	push	a
1007       00000001      OFST:	set	1
1010                     ; 277   FlagStatus status = RESET;
1012                     ; 279   assert_param(IS_SPI_FLAG(SPI_FLAG));
1014                     ; 282   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1016  0001 c45203        	and	a,20995
1017  0004 2702          	jreq	L364
1018                     ; 284     status = SET; /* SPI_FLAG is set */
1020  0006 a601          	ld	a,#1
1022  0008               L364:
1023                     ; 288     status = RESET; /* SPI_FLAG is reset*/
1025                     ; 292   return status;
1029  0008 5b01          	addw	sp,#1
1030  000a 81            	ret	
1053                     ; 306 void SPI_ClearFlag(void)
1053                     ; 307 {
1054                     .text:	section	.text,new
1055  0000               _SPI_ClearFlag:
1059                     ; 309   SPI->SR = (uint8_t)(~SPI_SR_WKUP);
1061  0000 35f75203      	mov	20995,#247
1062                     ; 310 }
1065  0004 81            	ret	
1147                     ; 323 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1147                     ; 324 {
1148                     .text:	section	.text,new
1149  0000               _SPI_GetITStatus:
1151  0000 88            	push	a
1152  0001 89            	pushw	x
1153       00000002      OFST:	set	2
1156                     ; 325   ITStatus pendingbitstatus = RESET;
1158                     ; 326   uint8_t itpos = 0;
1160                     ; 327   uint8_t itmask1 = 0;
1162                     ; 328   uint8_t itmask2 = 0;
1164                     ; 329   uint8_t enablestatus = 0;
1166                     ; 330   assert_param(IS_SPI_GET_IT(SPI_IT));
1168                     ; 332   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1170  0002 a40f          	and	a,#15
1171  0004 5f            	clrw	x
1172  0005 97            	ld	xl,a
1173  0006 a601          	ld	a,#1
1174  0008 5d            	tnzw	x
1175  0009 2704          	jreq	L63
1176  000b               L04:
1177  000b 48            	sll	a
1178  000c 5a            	decw	x
1179  000d 26fc          	jrne	L04
1180  000f               L63:
1181  000f 6b01          	ld	(OFST-1,sp),a
1182                     ; 335   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1184  0011 7b03          	ld	a,(OFST+1,sp)
1185  0013 4e            	swap	a
1186  0014 a40f          	and	a,#15
1187  0016 6b02          	ld	(OFST+0,sp),a
1188                     ; 337   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1190  0018 5f            	clrw	x
1191  0019 97            	ld	xl,a
1192  001a a601          	ld	a,#1
1193  001c 5d            	tnzw	x
1194  001d 2704          	jreq	L24
1195  001f               L44:
1196  001f 48            	sll	a
1197  0020 5a            	decw	x
1198  0021 26fc          	jrne	L44
1199  0023               L24:
1200                     ; 339   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1202  0023 c45203        	and	a,20995
1203  0026 6b02          	ld	(OFST+0,sp),a
1204                     ; 341   if (((SPI->ICR & itpos) != (uint8_t)RESET) && enablestatus)
1206  0028 c65202        	ld	a,20994
1207  002b 1501          	bcp	a,(OFST-1,sp)
1208  002d 2708          	jreq	L145
1210  002f 7b02          	ld	a,(OFST+0,sp)
1211  0031 2704          	jreq	L145
1212                     ; 344     pendingbitstatus = SET;
1214  0033 a601          	ld	a,#1
1216  0035 2001          	jra	L345
1217  0037               L145:
1218                     ; 349     pendingbitstatus = RESET;
1220  0037 4f            	clr	a
1221  0038               L345:
1222                     ; 352   return  pendingbitstatus;
1226  0038 5b03          	addw	sp,#3
1227  003a 81            	ret	
1251                     ; 367 void SPI_ClearITPendingBit(void)
1251                     ; 368 {
1252                     .text:	section	.text,new
1253  0000               _SPI_ClearITPendingBit:
1257                     ; 370   SPI->SR = (uint8_t)(~SPI_SR_WKUP);
1259  0000 35f75203      	mov	20995,#247
1260                     ; 371 }
1263  0004 81            	ret	
1276                     	xdef	_SPI_ClearITPendingBit
1277                     	xdef	_SPI_ClearFlag
1278                     	xdef	_SPI_GetITStatus
1279                     	xdef	_SPI_GetFlagStatus
1280                     	xdef	_SPI_ReceiveData
1281                     	xdef	_SPI_SendData
1282                     	xdef	_SPI_BiDirectionalLineConfig
1283                     	xdef	_SPI_NSSInternalSoftwareCmd
1284                     	xdef	_SPI_ITConfig
1285                     	xdef	_SPI_Cmd
1286                     	xdef	_SPI_Init
1287                     	xdef	_SPI_DeInit
1306                     	end
