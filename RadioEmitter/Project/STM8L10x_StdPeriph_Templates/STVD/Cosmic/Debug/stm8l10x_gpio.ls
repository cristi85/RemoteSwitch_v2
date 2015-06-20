   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
 115                     ; 57 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 115                     ; 58 {
 117                     .text:	section	.text,new
 118  0000               _GPIO_DeInit:
 122                     ; 59   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 124  0000 7f            	clr	(x)
 125                     ; 60   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 127  0001 6f02          	clr	(2,x)
 128                     ; 61   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 130  0003 6f03          	clr	(3,x)
 131                     ; 62   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 133  0005 6f04          	clr	(4,x)
 134                     ; 63 }
 137  0007 81            	ret	
 293                     ; 98 void GPIO_Init(GPIO_TypeDef* GPIOx,
 293                     ; 99                uint8_t GPIO_Pin,
 293                     ; 100                GPIO_Mode_TypeDef GPIO_Mode)
 293                     ; 101 {
 294                     .text:	section	.text,new
 295  0000               _GPIO_Init:
 297  0000 89            	pushw	x
 298       00000000      OFST:	set	0
 301                     ; 106   assert_param(IS_GPIO_MODE(GPIO_Mode));
 303                     ; 107   assert_param(IS_GPIO_PIN(GPIO_Pin));
 305                     ; 113   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 307  0001 7b06          	ld	a,(OFST+6,sp)
 308  0003 2a18          	jrpl	L541
 309                     ; 115     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 311  0005 a510          	bcp	a,#16
 312  0007 2705          	jreq	L741
 313                     ; 117       GPIOx->ODR |= GPIO_Pin;
 315  0009 f6            	ld	a,(x)
 316  000a 1a05          	or	a,(OFST+5,sp)
 318  000c 2006          	jra	L151
 319  000e               L741:
 320                     ; 120       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 322  000e 1e01          	ldw	x,(OFST+1,sp)
 323  0010 7b05          	ld	a,(OFST+5,sp)
 324  0012 43            	cpl	a
 325  0013 f4            	and	a,(x)
 326  0014               L151:
 327  0014 f7            	ld	(x),a
 328                     ; 123     GPIOx->DDR |= GPIO_Pin;
 330  0015 1e01          	ldw	x,(OFST+1,sp)
 331  0017 e602          	ld	a,(2,x)
 332  0019 1a05          	or	a,(OFST+5,sp)
 334  001b 2007          	jra	L351
 335  001d               L541:
 336                     ; 127     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 338  001d 1e01          	ldw	x,(OFST+1,sp)
 339  001f 7b05          	ld	a,(OFST+5,sp)
 340  0021 43            	cpl	a
 341  0022 e402          	and	a,(2,x)
 342  0024               L351:
 343  0024 e702          	ld	(2,x),a
 344                     ; 134   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 346  0026 7b06          	ld	a,(OFST+6,sp)
 347  0028 a540          	bcp	a,#64
 348  002a 2706          	jreq	L551
 349                     ; 136     GPIOx->CR1 |= GPIO_Pin;
 351  002c e603          	ld	a,(3,x)
 352  002e 1a05          	or	a,(OFST+5,sp)
 354  0030 2005          	jra	L751
 355  0032               L551:
 356                     ; 139     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 358  0032 7b05          	ld	a,(OFST+5,sp)
 359  0034 43            	cpl	a
 360  0035 e403          	and	a,(3,x)
 361  0037               L751:
 362  0037 e703          	ld	(3,x),a
 363                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 365  0039 7b06          	ld	a,(OFST+6,sp)
 366  003b a520          	bcp	a,#32
 367  003d 2706          	jreq	L161
 368                     ; 148     GPIOx->CR2 |= GPIO_Pin;
 370  003f e604          	ld	a,(4,x)
 371  0041 1a05          	or	a,(OFST+5,sp)
 373  0043 2005          	jra	L361
 374  0045               L161:
 375                     ; 151     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 377  0045 7b05          	ld	a,(OFST+5,sp)
 378  0047 43            	cpl	a
 379  0048 e404          	and	a,(4,x)
 380  004a               L361:
 381  004a e704          	ld	(4,x),a
 382                     ; 154 }
 385  004c 85            	popw	x
 386  004d 81            	ret	
 432                     ; 163 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 432                     ; 164 {
 433                     .text:	section	.text,new
 434  0000               _GPIO_Write:
 436  0000 89            	pushw	x
 437       00000000      OFST:	set	0
 440                     ; 165   GPIOx->ODR = GPIO_PortVal;
 442  0001 7b05          	ld	a,(OFST+5,sp)
 443  0003 1e01          	ldw	x,(OFST+1,sp)
 444  0005 f7            	ld	(x),a
 445                     ; 166 }
 448  0006 85            	popw	x
 449  0007 81            	ret	
 609                     ; 185 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 609                     ; 186 {
 610                     .text:	section	.text,new
 611  0000               _GPIO_WriteBit:
 613  0000 89            	pushw	x
 614       00000000      OFST:	set	0
 617                     ; 188   assert_param(IS_GPIO_PIN(GPIO_Pin));
 619                     ; 189   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 621                     ; 191   if (GPIO_BitVal != RESET)
 623  0001 7b06          	ld	a,(OFST+6,sp)
 624  0003 2714          	jreq	L303
 625                     ; 193     SetBit(GPIOx->ODR, GPIO_Pin);
 627  0005 7b05          	ld	a,(OFST+5,sp)
 628  0007 905f          	clrw	y
 629  0009 9097          	ld	yl,a
 630  000b a601          	ld	a,#1
 631  000d 905d          	tnzw	y
 632  000f 2705          	jreq	L41
 633  0011               L61:
 634  0011 48            	sll	a
 635  0012 905a          	decw	y
 636  0014 26fb          	jrne	L61
 637  0016               L41:
 638  0016 fa            	or	a,(x)
 640  0017 2015          	jra	L503
 641  0019               L303:
 642                     ; 198     ClrBit(GPIOx->ODR, GPIO_Pin);
 644  0019 1e01          	ldw	x,(OFST+1,sp)
 645  001b 7b05          	ld	a,(OFST+5,sp)
 646  001d 905f          	clrw	y
 647  001f 9097          	ld	yl,a
 648  0021 a601          	ld	a,#1
 649  0023 905d          	tnzw	y
 650  0025 2705          	jreq	L02
 651  0027               L22:
 652  0027 48            	sll	a
 653  0028 905a          	decw	y
 654  002a 26fb          	jrne	L22
 655  002c               L02:
 656  002c 43            	cpl	a
 657  002d f4            	and	a,(x)
 658  002e               L503:
 659  002e f7            	ld	(x),a
 660                     ; 200 }
 663  002f 85            	popw	x
 664  0030 81            	ret	
 710                     ; 218 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 710                     ; 219 {
 711                     .text:	section	.text,new
 712  0000               _GPIO_SetBits:
 714  0000 89            	pushw	x
 715       00000000      OFST:	set	0
 718                     ; 220   GPIOx->ODR |= GPIO_Pin;
 720  0001 f6            	ld	a,(x)
 721  0002 1a05          	or	a,(OFST+5,sp)
 722  0004 f7            	ld	(x),a
 723                     ; 221 }
 726  0005 85            	popw	x
 727  0006 81            	ret	
 773                     ; 239 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 773                     ; 240 {
 774                     .text:	section	.text,new
 775  0000               _GPIO_ResetBits:
 777  0000 89            	pushw	x
 778       00000000      OFST:	set	0
 781                     ; 241   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 783  0001 7b05          	ld	a,(OFST+5,sp)
 784  0003 43            	cpl	a
 785  0004 f4            	and	a,(x)
 786  0005 f7            	ld	(x),a
 787                     ; 242 }
 790  0006 85            	popw	x
 791  0007 81            	ret	
 837                     ; 251 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 837                     ; 252 {
 838                     .text:	section	.text,new
 839  0000               _GPIO_ToggleBits:
 841  0000 89            	pushw	x
 842       00000000      OFST:	set	0
 845                     ; 253   GPIOx->ODR ^= GPIO_Pin;
 847  0001 f6            	ld	a,(x)
 848  0002 1805          	xor	a,(OFST+5,sp)
 849  0004 f7            	ld	(x),a
 850                     ; 254 }
 853  0005 85            	popw	x
 854  0006 81            	ret	
 891                     ; 262 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 891                     ; 263 {
 892                     .text:	section	.text,new
 893  0000               _GPIO_ReadInputData:
 897                     ; 264   return ((uint8_t)GPIOx->IDR);
 899  0000 e601          	ld	a,(1,x)
 902  0002 81            	ret	
 940                     ; 273 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 940                     ; 274 {
 941                     .text:	section	.text,new
 942  0000               _GPIO_ReadOutputData:
 946                     ; 275   return ((uint8_t)GPIOx->ODR);
 948  0000 f6            	ld	a,(x)
 951  0001 81            	ret	
1000                     ; 294 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1000                     ; 295 {
1001                     .text:	section	.text,new
1002  0000               _GPIO_ReadInputDataBit:
1004  0000 89            	pushw	x
1005       00000000      OFST:	set	0
1008                     ; 296   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1010  0001 e601          	ld	a,(1,x)
1011  0003 1405          	and	a,(OFST+5,sp)
1014  0005 85            	popw	x
1015  0006 81            	ret	
1064                     ; 315 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1064                     ; 316 {
1065                     .text:	section	.text,new
1066  0000               _GPIO_ReadOutputDataBit:
1068  0000 89            	pushw	x
1069       00000000      OFST:	set	0
1072                     ; 317   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1074  0001 f6            	ld	a,(x)
1075  0002 1405          	and	a,(OFST+5,sp)
1078  0004 85            	popw	x
1079  0005 81            	ret	
1156                     ; 337 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
1156                     ; 338 {
1157                     .text:	section	.text,new
1158  0000               _GPIO_ExternalPullUpConfig:
1160  0000 89            	pushw	x
1161       00000000      OFST:	set	0
1164                     ; 340   assert_param(IS_GPIO_PIN(GPIO_Pin));
1166                     ; 341   assert_param(IS_FUNCTIONAL_STATE(NewState));
1168                     ; 343   if (NewState != DISABLE) /* External Pull-Up Set*/
1170  0001 7b06          	ld	a,(OFST+6,sp)
1171  0003 2706          	jreq	L355
1172                     ; 345     GPIOx->CR1 |= GPIO_Pin;
1174  0005 e603          	ld	a,(3,x)
1175  0007 1a05          	or	a,(OFST+5,sp)
1177  0009 2007          	jra	L555
1178  000b               L355:
1179                     ; 348     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1181  000b 1e01          	ldw	x,(OFST+1,sp)
1182  000d 7b05          	ld	a,(OFST+5,sp)
1183  000f 43            	cpl	a
1184  0010 e403          	and	a,(3,x)
1185  0012               L555:
1186  0012 e703          	ld	(3,x),a
1187                     ; 350 }
1190  0014 85            	popw	x
1191  0015 81            	ret	
1204                     	xdef	_GPIO_ExternalPullUpConfig
1205                     	xdef	_GPIO_ReadOutputDataBit
1206                     	xdef	_GPIO_ReadInputDataBit
1207                     	xdef	_GPIO_ReadOutputData
1208                     	xdef	_GPIO_ReadInputData
1209                     	xdef	_GPIO_ToggleBits
1210                     	xdef	_GPIO_ResetBits
1211                     	xdef	_GPIO_SetBits
1212                     	xdef	_GPIO_WriteBit
1213                     	xdef	_GPIO_Write
1214                     	xdef	_GPIO_Init
1215                     	xdef	_GPIO_DeInit
1234                     	end
