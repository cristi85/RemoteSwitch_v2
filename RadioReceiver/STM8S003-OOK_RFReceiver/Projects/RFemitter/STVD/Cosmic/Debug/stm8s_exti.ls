   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 47 void EXTI_DeInit(void)
  50                     ; 48 {
  52                     .text:	section	.text,new
  53  0000               _EXTI_DeInit:
  57                     ; 49     EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  59  0000 725f50a0      	clr	20640
  60                     ; 50     EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  62  0004 725f50a1      	clr	20641
  63                     ; 51 }
  66  0008 81            	ret	
 191                     ; 64 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 191                     ; 65 {
 192                     .text:	section	.text,new
 193  0000               _EXTI_SetExtIntSensitivity:
 195  0000 89            	pushw	x
 196       00000000      OFST:	set	0
 199                     ; 68     assert_param(IS_EXTI_PORT_OK(Port));
 201                     ; 69     assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 203                     ; 72     switch (Port)
 205  0001 9e            	ld	a,xh
 207                     ; 94     default:
 207                     ; 95         break;
 208  0002 4d            	tnz	a
 209  0003 270e          	jreq	L12
 210  0005 4a            	dec	a
 211  0006 271a          	jreq	L32
 212  0008 4a            	dec	a
 213  0009 2725          	jreq	L52
 214  000b 4a            	dec	a
 215  000c 2731          	jreq	L72
 216  000e 4a            	dec	a
 217  000f 2745          	jreq	L13
 218  0011 2053          	jra	L311
 219  0013               L12:
 220                     ; 74     case EXTI_PORT_GPIOA:
 220                     ; 75         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 222  0013 c650a0        	ld	a,20640
 223  0016 a4fc          	and	a,#252
 224  0018 c750a0        	ld	20640,a
 225                     ; 76         EXTI->CR1 |= (uint8_t)(SensitivityValue);
 227  001b c650a0        	ld	a,20640
 228  001e 1a02          	or	a,(OFST+2,sp)
 229                     ; 77         break;
 231  0020 202f          	jp	LC001
 232  0022               L32:
 233                     ; 78     case EXTI_PORT_GPIOB:
 233                     ; 79         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 235  0022 c650a0        	ld	a,20640
 236  0025 a4f3          	and	a,#243
 237  0027 c750a0        	ld	20640,a
 238                     ; 80         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 240  002a 7b02          	ld	a,(OFST+2,sp)
 241  002c 48            	sll	a
 242  002d 48            	sll	a
 243                     ; 81         break;
 245  002e 201e          	jp	LC002
 246  0030               L52:
 247                     ; 82     case EXTI_PORT_GPIOC:
 247                     ; 83         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 249  0030 c650a0        	ld	a,20640
 250  0033 a4cf          	and	a,#207
 251  0035 c750a0        	ld	20640,a
 252                     ; 84         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 254  0038 7b02          	ld	a,(OFST+2,sp)
 255  003a 97            	ld	xl,a
 256  003b a610          	ld	a,#16
 257                     ; 85         break;
 259  003d 200d          	jp	LC003
 260  003f               L72:
 261                     ; 86     case EXTI_PORT_GPIOD:
 261                     ; 87         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 263  003f c650a0        	ld	a,20640
 264  0042 a43f          	and	a,#63
 265  0044 c750a0        	ld	20640,a
 266                     ; 88         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 268  0047 7b02          	ld	a,(OFST+2,sp)
 269  0049 97            	ld	xl,a
 270  004a a640          	ld	a,#64
 271  004c               LC003:
 272  004c 42            	mul	x,a
 273  004d 9f            	ld	a,xl
 274  004e               LC002:
 275  004e ca50a0        	or	a,20640
 276  0051               LC001:
 277  0051 c750a0        	ld	20640,a
 278                     ; 89         break;
 280  0054 2010          	jra	L311
 281  0056               L13:
 282                     ; 90     case EXTI_PORT_GPIOE:
 282                     ; 91         EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 284  0056 c650a1        	ld	a,20641
 285  0059 a4fc          	and	a,#252
 286  005b c750a1        	ld	20641,a
 287                     ; 92         EXTI->CR2 |= (uint8_t)(SensitivityValue);
 289  005e c650a1        	ld	a,20641
 290  0061 1a02          	or	a,(OFST+2,sp)
 291  0063 c750a1        	ld	20641,a
 292                     ; 93         break;
 294                     ; 94     default:
 294                     ; 95         break;
 296  0066               L311:
 297                     ; 97 }
 300  0066 85            	popw	x
 301  0067 81            	ret	
 359                     ; 106 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 359                     ; 107 {
 360                     .text:	section	.text,new
 361  0000               _EXTI_SetTLISensitivity:
 365                     ; 109     assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 367                     ; 112     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 369  0000 721550a1      	bres	20641,#2
 370                     ; 113     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 372  0004 ca50a1        	or	a,20641
 373  0007 c750a1        	ld	20641,a
 374                     ; 114 }
 377  000a 81            	ret	
 423                     ; 121 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 423                     ; 122 {
 424                     .text:	section	.text,new
 425  0000               _EXTI_GetExtIntSensitivity:
 427  0000 88            	push	a
 428       00000001      OFST:	set	1
 431                     ; 123     uint8_t value = 0;
 433  0001 0f01          	clr	(OFST+0,sp)
 434                     ; 126     assert_param(IS_EXTI_PORT_OK(Port));
 436                     ; 128     switch (Port)
 439                     ; 145     default:
 439                     ; 146         break;
 440  0003 4d            	tnz	a
 441  0004 2710          	jreq	L341
 442  0006 4a            	dec	a
 443  0007 2712          	jreq	L541
 444  0009 4a            	dec	a
 445  000a 2718          	jreq	L741
 446  000c 4a            	dec	a
 447  000d 271b          	jreq	L151
 448  000f 4a            	dec	a
 449  0010 2722          	jreq	L351
 450  0012 7b01          	ld	a,(OFST+0,sp)
 451  0014 2023          	jra	LC004
 452  0016               L341:
 453                     ; 130     case EXTI_PORT_GPIOA:
 453                     ; 131         value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 455  0016 c650a0        	ld	a,20640
 456                     ; 132         break;
 458  0019 201c          	jp	LC005
 459  001b               L541:
 460                     ; 133     case EXTI_PORT_GPIOB:
 460                     ; 134         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 462  001b c650a0        	ld	a,20640
 463  001e a40c          	and	a,#12
 464  0020 44            	srl	a
 465  0021 44            	srl	a
 466                     ; 135         break;
 468  0022 2015          	jp	LC004
 469  0024               L741:
 470                     ; 136     case EXTI_PORT_GPIOC:
 470                     ; 137         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 472  0024 c650a0        	ld	a,20640
 473  0027 4e            	swap	a
 474                     ; 138         break;
 476  0028 200d          	jp	LC005
 477  002a               L151:
 478                     ; 139     case EXTI_PORT_GPIOD:
 478                     ; 140         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 480  002a c650a0        	ld	a,20640
 481  002d 4e            	swap	a
 482  002e a40c          	and	a,#12
 483  0030 44            	srl	a
 484  0031 44            	srl	a
 485                     ; 141         break;
 487  0032 2003          	jp	LC005
 488  0034               L351:
 489                     ; 142     case EXTI_PORT_GPIOE:
 489                     ; 143         value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 491  0034 c650a1        	ld	a,20641
 492  0037               LC005:
 493  0037 a403          	and	a,#3
 494  0039               LC004:
 495                     ; 144         break;
 497                     ; 145     default:
 497                     ; 146         break;
 499                     ; 149     return((EXTI_Sensitivity_TypeDef)value);
 503  0039 5b01          	addw	sp,#1
 504  003b 81            	ret	
 540                     ; 157 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 540                     ; 158 {
 541                     .text:	section	.text,new
 542  0000               _EXTI_GetTLISensitivity:
 544  0000 88            	push	a
 545       00000001      OFST:	set	1
 548                     ; 160     uint8_t value = 0;
 550                     ; 163     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 552  0001 c650a1        	ld	a,20641
 553  0004 a404          	and	a,#4
 554                     ; 165     return((EXTI_TLISensitivity_TypeDef)value);
 558  0006 5b01          	addw	sp,#1
 559  0008 81            	ret	
 572                     	xdef	_EXTI_GetTLISensitivity
 573                     	xdef	_EXTI_GetExtIntSensitivity
 574                     	xdef	_EXTI_SetTLISensitivity
 575                     	xdef	_EXTI_SetExtIntSensitivity
 576                     	xdef	_EXTI_DeInit
 595                     	end
