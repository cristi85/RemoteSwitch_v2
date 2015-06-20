   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
 116                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 116                     ; 48 {
 118                     .text:	section	.text,new
 119  0000               _GPIO_DeInit:
 123                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 125  0000 7f            	clr	(x)
 126                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 128  0001 6f02          	clr	(2,x)
 129                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 131  0003 6f03          	clr	(3,x)
 132                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 134  0005 6f04          	clr	(4,x)
 135                     ; 53 }
 138  0007 81            	ret	
 378                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 378                     ; 66 {
 379                     .text:	section	.text,new
 380  0000               _GPIO_Init:
 382  0000 89            	pushw	x
 383       00000000      OFST:	set	0
 386                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 388                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 390                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 392  0001 7b05          	ld	a,(OFST+5,sp)
 393  0003 43            	cpl	a
 394  0004 e404          	and	a,(4,x)
 395  0006 e704          	ld	(4,x),a
 396                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 398  0008 7b06          	ld	a,(OFST+6,sp)
 399  000a 2a18          	jrpl	L771
 400                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 402  000c a510          	bcp	a,#16
 403  000e 2705          	jreq	L102
 404                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 406  0010 f6            	ld	a,(x)
 407  0011 1a05          	or	a,(OFST+5,sp)
 409  0013 2006          	jra	L302
 410  0015               L102:
 411                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 413  0015 1e01          	ldw	x,(OFST+1,sp)
 414  0017 7b05          	ld	a,(OFST+5,sp)
 415  0019 43            	cpl	a
 416  001a f4            	and	a,(x)
 417  001b               L302:
 418  001b f7            	ld	(x),a
 419                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 421  001c 1e01          	ldw	x,(OFST+1,sp)
 422  001e e602          	ld	a,(2,x)
 423  0020 1a05          	or	a,(OFST+5,sp)
 425  0022 2007          	jra	L502
 426  0024               L771:
 427                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 429  0024 1e01          	ldw	x,(OFST+1,sp)
 430  0026 7b05          	ld	a,(OFST+5,sp)
 431  0028 43            	cpl	a
 432  0029 e402          	and	a,(2,x)
 433  002b               L502:
 434  002b e702          	ld	(2,x),a
 435                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 437  002d 7b06          	ld	a,(OFST+6,sp)
 438  002f a540          	bcp	a,#64
 439  0031 2706          	jreq	L702
 440                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 442  0033 e603          	ld	a,(3,x)
 443  0035 1a05          	or	a,(OFST+5,sp)
 445  0037 2005          	jra	L112
 446  0039               L702:
 447                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 449  0039 7b05          	ld	a,(OFST+5,sp)
 450  003b 43            	cpl	a
 451  003c e403          	and	a,(3,x)
 452  003e               L112:
 453  003e e703          	ld	(3,x),a
 454                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 456  0040 7b06          	ld	a,(OFST+6,sp)
 457  0042 a520          	bcp	a,#32
 458  0044 2706          	jreq	L312
 459                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 461  0046 e604          	ld	a,(4,x)
 462  0048 1a05          	or	a,(OFST+5,sp)
 464  004a 2005          	jra	L512
 465  004c               L312:
 466                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 468  004c 7b05          	ld	a,(OFST+5,sp)
 469  004e 43            	cpl	a
 470  004f e404          	and	a,(4,x)
 471  0051               L512:
 472  0051 e704          	ld	(4,x),a
 473                     ; 125 }
 476  0053 85            	popw	x
 477  0054 81            	ret	
 523                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 523                     ; 136 {
 524                     .text:	section	.text,new
 525  0000               _GPIO_Write:
 527  0000 89            	pushw	x
 528       00000000      OFST:	set	0
 531                     ; 137     GPIOx->ODR = PortVal;
 533  0001 7b05          	ld	a,(OFST+5,sp)
 534  0003 1e01          	ldw	x,(OFST+1,sp)
 535  0005 f7            	ld	(x),a
 536                     ; 138 }
 539  0006 85            	popw	x
 540  0007 81            	ret	
 587                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 587                     ; 149 {
 588                     .text:	section	.text,new
 589  0000               _GPIO_WriteHigh:
 591  0000 89            	pushw	x
 592       00000000      OFST:	set	0
 595                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 597  0001 f6            	ld	a,(x)
 598  0002 1a05          	or	a,(OFST+5,sp)
 599  0004 f7            	ld	(x),a
 600                     ; 151 }
 603  0005 85            	popw	x
 604  0006 81            	ret	
 651                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 651                     ; 162 {
 652                     .text:	section	.text,new
 653  0000               _GPIO_WriteLow:
 655  0000 89            	pushw	x
 656       00000000      OFST:	set	0
 659                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 661  0001 7b05          	ld	a,(OFST+5,sp)
 662  0003 43            	cpl	a
 663  0004 f4            	and	a,(x)
 664  0005 f7            	ld	(x),a
 665                     ; 164 }
 668  0006 85            	popw	x
 669  0007 81            	ret	
 716                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 716                     ; 175 {
 717                     .text:	section	.text,new
 718  0000               _GPIO_WriteReverse:
 720  0000 89            	pushw	x
 721       00000000      OFST:	set	0
 724                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 726  0001 f6            	ld	a,(x)
 727  0002 1805          	xor	a,(OFST+5,sp)
 728  0004 f7            	ld	(x),a
 729                     ; 177 }
 732  0005 85            	popw	x
 733  0006 81            	ret	
 771                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 771                     ; 186 {
 772                     .text:	section	.text,new
 773  0000               _GPIO_ReadOutputData:
 777                     ; 187     return ((uint8_t)GPIOx->ODR);
 779  0000 f6            	ld	a,(x)
 782  0001 81            	ret	
 819                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 819                     ; 197 {
 820                     .text:	section	.text,new
 821  0000               _GPIO_ReadInputData:
 825                     ; 198     return ((uint8_t)GPIOx->IDR);
 827  0000 e601          	ld	a,(1,x)
 830  0002 81            	ret	
 898                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 898                     ; 208 {
 899                     .text:	section	.text,new
 900  0000               _GPIO_ReadInputPin:
 902  0000 89            	pushw	x
 903       00000000      OFST:	set	0
 906                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 908  0001 e601          	ld	a,(1,x)
 909  0003 1405          	and	a,(OFST+5,sp)
 912  0005 85            	popw	x
 913  0006 81            	ret	
 991                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 991                     ; 220 {
 992                     .text:	section	.text,new
 993  0000               _GPIO_ExternalPullUpConfig:
 995  0000 89            	pushw	x
 996       00000000      OFST:	set	0
 999                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1001                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1003                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1005  0001 7b06          	ld	a,(OFST+6,sp)
1006  0003 2706          	jreq	L374
1007                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1009  0005 e603          	ld	a,(3,x)
1010  0007 1a05          	or	a,(OFST+5,sp)
1012  0009 2007          	jra	L574
1013  000b               L374:
1014                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1016  000b 1e01          	ldw	x,(OFST+1,sp)
1017  000d 7b05          	ld	a,(OFST+5,sp)
1018  000f 43            	cpl	a
1019  0010 e403          	and	a,(3,x)
1020  0012               L574:
1021  0012 e703          	ld	(3,x),a
1022                     ; 232 }
1025  0014 85            	popw	x
1026  0015 81            	ret	
1039                     	xdef	_GPIO_ExternalPullUpConfig
1040                     	xdef	_GPIO_ReadInputPin
1041                     	xdef	_GPIO_ReadOutputData
1042                     	xdef	_GPIO_ReadInputData
1043                     	xdef	_GPIO_WriteReverse
1044                     	xdef	_GPIO_WriteLow
1045                     	xdef	_GPIO_WriteHigh
1046                     	xdef	_GPIO_Write
1047                     	xdef	_GPIO_Init
1048                     	xdef	_GPIO_DeInit
1067                     	end
