   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
  45                     ; 61 void I2C_DeInit(void)
  45                     ; 62 {
  47                     .text:	section	.text,new
  48  0000               _I2C_DeInit:
  52                     ; 63   I2C->CR1 = I2C_CR1_RESET_VALUE;
  54  0000 725f5210      	clr	21008
  55                     ; 64   I2C->CR2 = I2C_CR2_RESET_VALUE;
  57  0004 725f5211      	clr	21009
  58                     ; 65   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  60  0008 725f5212      	clr	21010
  61                     ; 66   I2C->OARL = I2C_OARL_RESET_VALUE;
  63  000c 725f5213      	clr	21011
  64                     ; 67   I2C->OARH = I2C_OARH_RESET_VALUE;
  66  0010 725f5214      	clr	21012
  67                     ; 68   I2C->ITR = I2C_ITR_RESET_VALUE;
  69  0014 725f521a      	clr	21018
  70                     ; 69   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  72  0018 725f521b      	clr	21019
  73                     ; 70   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  75  001c 725f521c      	clr	21020
  76                     ; 71   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  78  0020 3502521d      	mov	21021,#2
  79                     ; 72 }
  82  0024 81            	ret
 261                     .const:	section	.text
 262  0000               L01:
 263  0000 000186a1      	dc.l	100001
 264  0004               L21:
 265  0004 000f4240      	dc.l	1000000
 266                     ; 90 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 266                     ; 91               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 266                     ; 92               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 266                     ; 93 {
 267                     .text:	section	.text,new
 268  0000               _I2C_Init:
 270  0000 5209          	subw	sp,#9
 271       00000009      OFST:	set	9
 274                     ; 94   uint16_t result = 0x0004;
 276                     ; 95   uint16_t tmpval = 0;
 278                     ; 96   uint8_t tmpccrh = 0;
 280  0002 0f07          	clr	(OFST-2,sp)
 281                     ; 99   assert_param(IS_I2C_ACK_OK(Ack));
 283                     ; 100   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 285                     ; 101   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 287                     ; 102   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 289                     ; 103   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 291                     ; 104   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 293                     ; 109   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 295  0004 c65212        	ld	a,21010
 296  0007 a4c0          	and	a,#192
 297  0009 c75212        	ld	21010,a
 298                     ; 111   I2C->FREQR |= InputClockFrequencyMHz;
 300  000c c65212        	ld	a,21010
 301  000f 1a15          	or	a,(OFST+12,sp)
 302  0011 c75212        	ld	21010,a
 303                     ; 115   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 305  0014 72115210      	bres	21008,#0
 306                     ; 118   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 308  0018 c6521c        	ld	a,21020
 309  001b a430          	and	a,#48
 310  001d c7521c        	ld	21020,a
 311                     ; 119   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 313  0020 725f521b      	clr	21019
 314                     ; 122   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 316  0024 96            	ldw	x,sp
 317  0025 1c000c        	addw	x,#OFST+3
 318  0028 cd0000        	call	c_ltor
 320  002b ae0000        	ldw	x,#L01
 321  002e cd0000        	call	c_lcmp
 323  0031 2403          	jruge	L41
 324  0033 cc00c0        	jp	L131
 325  0036               L41:
 326                     ; 125     tmpccrh = I2C_CCRH_FS;
 328  0036 a680          	ld	a,#128
 329  0038 6b07          	ld	(OFST-2,sp),a
 330                     ; 127     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 332  003a 0d12          	tnz	(OFST+9,sp)
 333  003c 2630          	jrne	L331
 334                     ; 130       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 336  003e 96            	ldw	x,sp
 337  003f 1c000c        	addw	x,#OFST+3
 338  0042 cd0000        	call	c_ltor
 340  0045 a603          	ld	a,#3
 341  0047 cd0000        	call	c_smul
 343  004a 96            	ldw	x,sp
 344  004b 1c0001        	addw	x,#OFST-8
 345  004e cd0000        	call	c_rtol
 347  0051 7b15          	ld	a,(OFST+12,sp)
 348  0053 b703          	ld	c_lreg+3,a
 349  0055 3f02          	clr	c_lreg+2
 350  0057 3f01          	clr	c_lreg+1
 351  0059 3f00          	clr	c_lreg
 352  005b ae0004        	ldw	x,#L21
 353  005e cd0000        	call	c_lmul
 355  0061 96            	ldw	x,sp
 356  0062 1c0001        	addw	x,#OFST-8
 357  0065 cd0000        	call	c_ludv
 359  0068 be02          	ldw	x,c_lreg+2
 360  006a 1f08          	ldw	(OFST-1,sp),x
 362  006c 2034          	jra	L531
 363  006e               L331:
 364                     ; 135       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 366  006e 96            	ldw	x,sp
 367  006f 1c000c        	addw	x,#OFST+3
 368  0072 cd0000        	call	c_ltor
 370  0075 a619          	ld	a,#25
 371  0077 cd0000        	call	c_smul
 373  007a 96            	ldw	x,sp
 374  007b 1c0001        	addw	x,#OFST-8
 375  007e cd0000        	call	c_rtol
 377  0081 7b15          	ld	a,(OFST+12,sp)
 378  0083 b703          	ld	c_lreg+3,a
 379  0085 3f02          	clr	c_lreg+2
 380  0087 3f01          	clr	c_lreg+1
 381  0089 3f00          	clr	c_lreg
 382  008b ae0004        	ldw	x,#L21
 383  008e cd0000        	call	c_lmul
 385  0091 96            	ldw	x,sp
 386  0092 1c0001        	addw	x,#OFST-8
 387  0095 cd0000        	call	c_ludv
 389  0098 be02          	ldw	x,c_lreg+2
 390  009a 1f08          	ldw	(OFST-1,sp),x
 391                     ; 137       tmpccrh |= I2C_CCRH_DUTY;
 393  009c 7b07          	ld	a,(OFST-2,sp)
 394  009e aa40          	or	a,#64
 395  00a0 6b07          	ld	(OFST-2,sp),a
 396  00a2               L531:
 397                     ; 141     if (result < (uint16_t)0x01)
 399  00a2 1e08          	ldw	x,(OFST-1,sp)
 400  00a4 2605          	jrne	L731
 401                     ; 144       result = (uint16_t)0x0001;
 403  00a6 ae0001        	ldw	x,#1
 404  00a9 1f08          	ldw	(OFST-1,sp),x
 405  00ab               L731:
 406                     ; 150     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 408  00ab 7b15          	ld	a,(OFST+12,sp)
 409  00ad 97            	ld	xl,a
 410  00ae a603          	ld	a,#3
 411  00b0 42            	mul	x,a
 412  00b1 a60a          	ld	a,#10
 413  00b3 cd0000        	call	c_sdivx
 415  00b6 5c            	incw	x
 416  00b7 1f05          	ldw	(OFST-4,sp),x
 417                     ; 151     I2C->TRISER = (uint8_t)tmpval;
 419  00b9 7b06          	ld	a,(OFST-3,sp)
 420  00bb c7521d        	ld	21021,a
 422  00be 2043          	jra	L141
 423  00c0               L131:
 424                     ; 158     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 426  00c0 96            	ldw	x,sp
 427  00c1 1c000c        	addw	x,#OFST+3
 428  00c4 cd0000        	call	c_ltor
 430  00c7 3803          	sll	c_lreg+3
 431  00c9 3902          	rlc	c_lreg+2
 432  00cb 3901          	rlc	c_lreg+1
 433  00cd 3900          	rlc	c_lreg
 434  00cf 96            	ldw	x,sp
 435  00d0 1c0001        	addw	x,#OFST-8
 436  00d3 cd0000        	call	c_rtol
 438  00d6 7b15          	ld	a,(OFST+12,sp)
 439  00d8 b703          	ld	c_lreg+3,a
 440  00da 3f02          	clr	c_lreg+2
 441  00dc 3f01          	clr	c_lreg+1
 442  00de 3f00          	clr	c_lreg
 443  00e0 ae0004        	ldw	x,#L21
 444  00e3 cd0000        	call	c_lmul
 446  00e6 96            	ldw	x,sp
 447  00e7 1c0001        	addw	x,#OFST-8
 448  00ea cd0000        	call	c_ludv
 450  00ed be02          	ldw	x,c_lreg+2
 451  00ef 1f08          	ldw	(OFST-1,sp),x
 452                     ; 161     if (result < (uint16_t)0x0004)
 454  00f1 1e08          	ldw	x,(OFST-1,sp)
 455  00f3 a30004        	cpw	x,#4
 456  00f6 2405          	jruge	L341
 457                     ; 164       result = (uint16_t)0x0004;
 459  00f8 ae0004        	ldw	x,#4
 460  00fb 1f08          	ldw	(OFST-1,sp),x
 461  00fd               L341:
 462                     ; 170     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 464  00fd 7b15          	ld	a,(OFST+12,sp)
 465  00ff 4c            	inc	a
 466  0100 c7521d        	ld	21021,a
 467  0103               L141:
 468                     ; 175   I2C->CCRL = (uint8_t)result;
 470  0103 7b09          	ld	a,(OFST+0,sp)
 471  0105 c7521b        	ld	21019,a
 472                     ; 176   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 474  0108 7b08          	ld	a,(OFST-1,sp)
 475  010a a40f          	and	a,#15
 476  010c 1a07          	or	a,(OFST-2,sp)
 477  010e c7521c        	ld	21020,a
 478                     ; 179   I2C->CR1 |= I2C_CR1_PE;
 480  0111 72105210      	bset	21008,#0
 481                     ; 182   I2C_AcknowledgeConfig(Ack);
 483  0115 7b13          	ld	a,(OFST+10,sp)
 484  0117 cd0000        	call	_I2C_AcknowledgeConfig
 486                     ; 185   I2C->OARL = (uint8_t)(OwnAddress);
 488  011a 7b11          	ld	a,(OFST+8,sp)
 489  011c c75213        	ld	21011,a
 490                     ; 186   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 490                     ; 187                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 492  011f 7b10          	ld	a,(OFST+7,sp)
 493  0121 97            	ld	xl,a
 494  0122 7b11          	ld	a,(OFST+8,sp)
 495  0124 9f            	ld	a,xl
 496  0125 a403          	and	a,#3
 497  0127 97            	ld	xl,a
 498  0128 4f            	clr	a
 499  0129 02            	rlwa	x,a
 500  012a 4f            	clr	a
 501  012b 01            	rrwa	x,a
 502  012c 48            	sll	a
 503  012d 59            	rlcw	x
 504  012e 9f            	ld	a,xl
 505  012f 6b04          	ld	(OFST-5,sp),a
 506  0131 7b14          	ld	a,(OFST+11,sp)
 507  0133 aa40          	or	a,#64
 508  0135 1a04          	or	a,(OFST-5,sp)
 509  0137 c75214        	ld	21012,a
 510                     ; 188 }
 513  013a 5b09          	addw	sp,#9
 514  013c 81            	ret
 569                     ; 196 void I2C_Cmd(FunctionalState NewState)
 569                     ; 197 {
 570                     .text:	section	.text,new
 571  0000               _I2C_Cmd:
 575                     ; 200   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 577                     ; 202   if (NewState != DISABLE)
 579  0000 4d            	tnz	a
 580  0001 2706          	jreq	L371
 581                     ; 205     I2C->CR1 |= I2C_CR1_PE;
 583  0003 72105210      	bset	21008,#0
 585  0007 2004          	jra	L571
 586  0009               L371:
 587                     ; 210     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 589  0009 72115210      	bres	21008,#0
 590  000d               L571:
 591                     ; 212 }
 594  000d 81            	ret
 629                     ; 220 void I2C_GeneralCallCmd(FunctionalState NewState)
 629                     ; 221 {
 630                     .text:	section	.text,new
 631  0000               _I2C_GeneralCallCmd:
 635                     ; 224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 637                     ; 226   if (NewState != DISABLE)
 639  0000 4d            	tnz	a
 640  0001 2706          	jreq	L512
 641                     ; 229     I2C->CR1 |= I2C_CR1_ENGC;
 643  0003 721c5210      	bset	21008,#6
 645  0007 2004          	jra	L712
 646  0009               L512:
 647                     ; 234     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 649  0009 721d5210      	bres	21008,#6
 650  000d               L712:
 651                     ; 236 }
 654  000d 81            	ret
 689                     ; 246 void I2C_GenerateSTART(FunctionalState NewState)
 689                     ; 247 {
 690                     .text:	section	.text,new
 691  0000               _I2C_GenerateSTART:
 695                     ; 250   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 697                     ; 252   if (NewState != DISABLE)
 699  0000 4d            	tnz	a
 700  0001 2706          	jreq	L732
 701                     ; 255     I2C->CR2 |= I2C_CR2_START;
 703  0003 72105211      	bset	21009,#0
 705  0007 2004          	jra	L142
 706  0009               L732:
 707                     ; 260     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 709  0009 72115211      	bres	21009,#0
 710  000d               L142:
 711                     ; 262 }
 714  000d 81            	ret
 749                     ; 270 void I2C_GenerateSTOP(FunctionalState NewState)
 749                     ; 271 {
 750                     .text:	section	.text,new
 751  0000               _I2C_GenerateSTOP:
 755                     ; 274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 757                     ; 276   if (NewState != DISABLE)
 759  0000 4d            	tnz	a
 760  0001 2706          	jreq	L162
 761                     ; 279     I2C->CR2 |= I2C_CR2_STOP;
 763  0003 72125211      	bset	21009,#1
 765  0007 2004          	jra	L362
 766  0009               L162:
 767                     ; 284     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 769  0009 72135211      	bres	21009,#1
 770  000d               L362:
 771                     ; 286 }
 774  000d 81            	ret
 810                     ; 294 void I2C_SoftwareResetCmd(FunctionalState NewState)
 810                     ; 295 {
 811                     .text:	section	.text,new
 812  0000               _I2C_SoftwareResetCmd:
 816                     ; 297   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 818                     ; 299   if (NewState != DISABLE)
 820  0000 4d            	tnz	a
 821  0001 2706          	jreq	L303
 822                     ; 302     I2C->CR2 |= I2C_CR2_SWRST;
 824  0003 721e5211      	bset	21009,#7
 826  0007 2004          	jra	L503
 827  0009               L303:
 828                     ; 307     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 830  0009 721f5211      	bres	21009,#7
 831  000d               L503:
 832                     ; 309 }
 835  000d 81            	ret
 871                     ; 318 void I2C_StretchClockCmd(FunctionalState NewState)
 871                     ; 319 {
 872                     .text:	section	.text,new
 873  0000               _I2C_StretchClockCmd:
 877                     ; 321   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 879                     ; 323   if (NewState != DISABLE)
 881  0000 4d            	tnz	a
 882  0001 2706          	jreq	L523
 883                     ; 326     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 885  0003 721f5210      	bres	21008,#7
 887  0007 2004          	jra	L723
 888  0009               L523:
 889                     ; 332     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 891  0009 721e5210      	bset	21008,#7
 892  000d               L723:
 893                     ; 334 }
 896  000d 81            	ret
 932                     ; 343 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 932                     ; 344 {
 933                     .text:	section	.text,new
 934  0000               _I2C_AcknowledgeConfig:
 936  0000 88            	push	a
 937       00000000      OFST:	set	0
 940                     ; 347   assert_param(IS_I2C_ACK_OK(Ack));
 942                     ; 349   if (Ack == I2C_ACK_NONE)
 944  0001 4d            	tnz	a
 945  0002 2606          	jrne	L743
 946                     ; 352     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 948  0004 72155211      	bres	21009,#2
 950  0008 2014          	jra	L153
 951  000a               L743:
 952                     ; 357     I2C->CR2 |= I2C_CR2_ACK;
 954  000a 72145211      	bset	21009,#2
 955                     ; 359     if (Ack == I2C_ACK_CURR)
 957  000e 7b01          	ld	a,(OFST+1,sp)
 958  0010 a101          	cp	a,#1
 959  0012 2606          	jrne	L353
 960                     ; 362       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 962  0014 72175211      	bres	21009,#3
 964  0018 2004          	jra	L153
 965  001a               L353:
 966                     ; 367       I2C->CR2 |= I2C_CR2_POS;
 968  001a 72165211      	bset	21009,#3
 969  001e               L153:
 970                     ; 370 }
 973  001e 84            	pop	a
 974  001f 81            	ret
1046                     ; 380 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1046                     ; 381 {
1047                     .text:	section	.text,new
1048  0000               _I2C_ITConfig:
1050  0000 89            	pushw	x
1051       00000000      OFST:	set	0
1054                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1056                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1058                     ; 387   if (NewState != DISABLE)
1060  0001 9f            	ld	a,xl
1061  0002 4d            	tnz	a
1062  0003 2709          	jreq	L314
1063                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1065  0005 9e            	ld	a,xh
1066  0006 ca521a        	or	a,21018
1067  0009 c7521a        	ld	21018,a
1069  000c 2009          	jra	L514
1070  000e               L314:
1071                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1073  000e 7b01          	ld	a,(OFST+1,sp)
1074  0010 43            	cpl	a
1075  0011 c4521a        	and	a,21018
1076  0014 c7521a        	ld	21018,a
1077  0017               L514:
1078                     ; 397 }
1081  0017 85            	popw	x
1082  0018 81            	ret
1118                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1118                     ; 406 {
1119                     .text:	section	.text,new
1120  0000               _I2C_FastModeDutyCycleConfig:
1124                     ; 409   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1126                     ; 411   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1128  0000 a140          	cp	a,#64
1129  0002 2606          	jrne	L534
1130                     ; 414     I2C->CCRH |= I2C_CCRH_DUTY;
1132  0004 721c521c      	bset	21020,#6
1134  0008 2004          	jra	L734
1135  000a               L534:
1136                     ; 419     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1138  000a 721d521c      	bres	21020,#6
1139  000e               L734:
1140                     ; 421 }
1143  000e 81            	ret
1166                     ; 428 uint8_t I2C_ReceiveData(void)
1166                     ; 429 {
1167                     .text:	section	.text,new
1168  0000               _I2C_ReceiveData:
1172                     ; 431   return ((uint8_t)I2C->DR);
1174  0000 c65216        	ld	a,21014
1177  0003 81            	ret
1242                     ; 441 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1242                     ; 442 {
1243                     .text:	section	.text,new
1244  0000               _I2C_Send7bitAddress:
1246  0000 89            	pushw	x
1247       00000000      OFST:	set	0
1250                     ; 444   assert_param(IS_I2C_ADDRESS_OK(Address));
1252                     ; 445   assert_param(IS_I2C_DIRECTION_OK(Direction));
1254                     ; 448   Address &= (uint8_t)0xFE;
1256  0001 7b01          	ld	a,(OFST+1,sp)
1257  0003 a4fe          	and	a,#254
1258  0005 6b01          	ld	(OFST+1,sp),a
1259                     ; 451   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1261  0007 7b01          	ld	a,(OFST+1,sp)
1262  0009 1a02          	or	a,(OFST+2,sp)
1263  000b c75216        	ld	21014,a
1264                     ; 452 }
1267  000e 85            	popw	x
1268  000f 81            	ret
1302                     ; 459 void I2C_SendData(uint8_t Data)
1302                     ; 460 {
1303                     .text:	section	.text,new
1304  0000               _I2C_SendData:
1308                     ; 462   I2C->DR = Data;
1310  0000 c75216        	ld	21014,a
1311                     ; 463 }
1314  0003 81            	ret
1538                     ; 579 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1538                     ; 580 {
1539                     .text:	section	.text,new
1540  0000               _I2C_CheckEvent:
1542  0000 89            	pushw	x
1543  0001 5206          	subw	sp,#6
1544       00000006      OFST:	set	6
1547                     ; 581   __IO uint16_t lastevent = 0x00;
1549  0003 5f            	clrw	x
1550  0004 1f04          	ldw	(OFST-2,sp),x
1551                     ; 582   uint8_t flag1 = 0x00 ;
1553                     ; 583   uint8_t flag2 = 0x00;
1555                     ; 584   ErrorStatus status = ERROR;
1557                     ; 587   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1559                     ; 589   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1561  0006 1e07          	ldw	x,(OFST+1,sp)
1562  0008 a30004        	cpw	x,#4
1563  000b 260b          	jrne	L136
1564                     ; 591     lastevent = I2C->SR2 & I2C_SR2_AF;
1566  000d c65218        	ld	a,21016
1567  0010 a404          	and	a,#4
1568  0012 5f            	clrw	x
1569  0013 97            	ld	xl,a
1570  0014 1f04          	ldw	(OFST-2,sp),x
1572  0016 201f          	jra	L336
1573  0018               L136:
1574                     ; 595     flag1 = I2C->SR1;
1576  0018 c65217        	ld	a,21015
1577  001b 6b03          	ld	(OFST-3,sp),a
1578                     ; 596     flag2 = I2C->SR3;
1580  001d c65219        	ld	a,21017
1581  0020 6b06          	ld	(OFST+0,sp),a
1582                     ; 597     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1584  0022 7b03          	ld	a,(OFST-3,sp)
1585  0024 5f            	clrw	x
1586  0025 97            	ld	xl,a
1587  0026 1f01          	ldw	(OFST-5,sp),x
1588  0028 7b06          	ld	a,(OFST+0,sp)
1589  002a 5f            	clrw	x
1590  002b 97            	ld	xl,a
1591  002c 4f            	clr	a
1592  002d 02            	rlwa	x,a
1593  002e 01            	rrwa	x,a
1594  002f 1a02          	or	a,(OFST-4,sp)
1595  0031 01            	rrwa	x,a
1596  0032 1a01          	or	a,(OFST-5,sp)
1597  0034 01            	rrwa	x,a
1598  0035 1f04          	ldw	(OFST-2,sp),x
1599  0037               L336:
1600                     ; 600   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1602  0037 1e04          	ldw	x,(OFST-2,sp)
1603  0039 01            	rrwa	x,a
1604  003a 1408          	and	a,(OFST+2,sp)
1605  003c 01            	rrwa	x,a
1606  003d 1407          	and	a,(OFST+1,sp)
1607  003f 01            	rrwa	x,a
1608  0040 1307          	cpw	x,(OFST+1,sp)
1609  0042 2606          	jrne	L536
1610                     ; 603     status = SUCCESS;
1612  0044 a601          	ld	a,#1
1613  0046 6b06          	ld	(OFST+0,sp),a
1615  0048 2002          	jra	L736
1616  004a               L536:
1617                     ; 608     status = ERROR;
1619  004a 0f06          	clr	(OFST+0,sp)
1620  004c               L736:
1621                     ; 612   return status;
1623  004c 7b06          	ld	a,(OFST+0,sp)
1626  004e 5b08          	addw	sp,#8
1627  0050 81            	ret
1680                     ; 629 I2C_Event_TypeDef I2C_GetLastEvent(void)
1680                     ; 630 {
1681                     .text:	section	.text,new
1682  0000               _I2C_GetLastEvent:
1684  0000 5206          	subw	sp,#6
1685       00000006      OFST:	set	6
1688                     ; 631   __IO uint16_t lastevent = 0;
1690  0002 5f            	clrw	x
1691  0003 1f05          	ldw	(OFST-1,sp),x
1692                     ; 632   uint16_t flag1 = 0;
1694                     ; 633   uint16_t flag2 = 0;
1696                     ; 635   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1698  0005 c65218        	ld	a,21016
1699  0008 a504          	bcp	a,#4
1700  000a 2707          	jreq	L766
1701                     ; 637     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1703  000c ae0004        	ldw	x,#4
1704  000f 1f05          	ldw	(OFST-1,sp),x
1706  0011 201b          	jra	L176
1707  0013               L766:
1708                     ; 642     flag1 = I2C->SR1;
1710  0013 c65217        	ld	a,21015
1711  0016 5f            	clrw	x
1712  0017 97            	ld	xl,a
1713  0018 1f01          	ldw	(OFST-5,sp),x
1714                     ; 643     flag2 = I2C->SR3;
1716  001a c65219        	ld	a,21017
1717  001d 5f            	clrw	x
1718  001e 97            	ld	xl,a
1719  001f 1f03          	ldw	(OFST-3,sp),x
1720                     ; 646     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1722  0021 1e03          	ldw	x,(OFST-3,sp)
1723  0023 4f            	clr	a
1724  0024 02            	rlwa	x,a
1725  0025 01            	rrwa	x,a
1726  0026 1a02          	or	a,(OFST-4,sp)
1727  0028 01            	rrwa	x,a
1728  0029 1a01          	or	a,(OFST-5,sp)
1729  002b 01            	rrwa	x,a
1730  002c 1f05          	ldw	(OFST-1,sp),x
1731  002e               L176:
1732                     ; 649   return (I2C_Event_TypeDef)lastevent;
1734  002e 1e05          	ldw	x,(OFST-1,sp)
1737  0030 5b06          	addw	sp,#6
1738  0032 81            	ret
1953                     ; 680 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1953                     ; 681 {
1954                     .text:	section	.text,new
1955  0000               _I2C_GetFlagStatus:
1957  0000 89            	pushw	x
1958  0001 89            	pushw	x
1959       00000002      OFST:	set	2
1962                     ; 682   uint8_t tempreg = 0;
1964  0002 0f02          	clr	(OFST+0,sp)
1965                     ; 683   uint8_t regindex = 0;
1967                     ; 684   FlagStatus bitstatus = RESET;
1969                     ; 687   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1971                     ; 690   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1973  0004 9e            	ld	a,xh
1974  0005 6b01          	ld	(OFST-1,sp),a
1975                     ; 692   switch (regindex)
1977  0007 7b01          	ld	a,(OFST-1,sp)
1979                     ; 709     default:
1979                     ; 710       break;
1980  0009 4a            	dec	a
1981  000a 2708          	jreq	L376
1982  000c 4a            	dec	a
1983  000d 270c          	jreq	L576
1984  000f 4a            	dec	a
1985  0010 2710          	jreq	L776
1986  0012 2013          	jra	L3101
1987  0014               L376:
1988                     ; 695     case 0x01:
1988                     ; 696       tempreg = (uint8_t)I2C->SR1;
1990  0014 c65217        	ld	a,21015
1991  0017 6b02          	ld	(OFST+0,sp),a
1992                     ; 697       break;
1994  0019 200c          	jra	L3101
1995  001b               L576:
1996                     ; 700     case 0x02:
1996                     ; 701       tempreg = (uint8_t)I2C->SR2;
1998  001b c65218        	ld	a,21016
1999  001e 6b02          	ld	(OFST+0,sp),a
2000                     ; 702       break;
2002  0020 2005          	jra	L3101
2003  0022               L776:
2004                     ; 705     case 0x03:
2004                     ; 706       tempreg = (uint8_t)I2C->SR3;
2006  0022 c65219        	ld	a,21017
2007  0025 6b02          	ld	(OFST+0,sp),a
2008                     ; 707       break;
2010  0027               L107:
2011                     ; 709     default:
2011                     ; 710       break;
2013  0027               L3101:
2014                     ; 714   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2016  0027 7b04          	ld	a,(OFST+2,sp)
2017  0029 1502          	bcp	a,(OFST+0,sp)
2018  002b 2706          	jreq	L5101
2019                     ; 717     bitstatus = SET;
2021  002d a601          	ld	a,#1
2022  002f 6b02          	ld	(OFST+0,sp),a
2024  0031 2002          	jra	L7101
2025  0033               L5101:
2026                     ; 722     bitstatus = RESET;
2028  0033 0f02          	clr	(OFST+0,sp)
2029  0035               L7101:
2030                     ; 725   return bitstatus;
2032  0035 7b02          	ld	a,(OFST+0,sp)
2035  0037 5b04          	addw	sp,#4
2036  0039 81            	ret
2080                     ; 760 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2080                     ; 761 {
2081                     .text:	section	.text,new
2082  0000               _I2C_ClearFlag:
2084  0000 89            	pushw	x
2085       00000002      OFST:	set	2
2088                     ; 762   uint16_t flagpos = 0;
2090                     ; 764   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2092                     ; 767   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2094  0001 01            	rrwa	x,a
2095  0002 a4ff          	and	a,#255
2096  0004 5f            	clrw	x
2097  0005 02            	rlwa	x,a
2098  0006 1f01          	ldw	(OFST-1,sp),x
2099  0008 01            	rrwa	x,a
2100                     ; 769   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2102  0009 7b02          	ld	a,(OFST+0,sp)
2103  000b 43            	cpl	a
2104  000c c75218        	ld	21016,a
2105                     ; 770 }
2108  000f 85            	popw	x
2109  0010 81            	ret
2275                     ; 792 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2275                     ; 793 {
2276                     .text:	section	.text,new
2277  0000               _I2C_GetITStatus:
2279  0000 89            	pushw	x
2280  0001 5204          	subw	sp,#4
2281       00000004      OFST:	set	4
2284                     ; 794   ITStatus bitstatus = RESET;
2286                     ; 795   __IO uint8_t enablestatus = 0;
2288  0003 0f03          	clr	(OFST-1,sp)
2289                     ; 796   uint16_t tempregister = 0;
2291                     ; 799     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2293                     ; 801   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2295  0005 01            	rrwa	x,a
2296  0006 9f            	ld	a,xl
2297  0007 a407          	and	a,#7
2298  0009 97            	ld	xl,a
2299  000a 4f            	clr	a
2300  000b 02            	rlwa	x,a
2301  000c 4f            	clr	a
2302  000d 01            	rrwa	x,a
2303  000e 9f            	ld	a,xl
2304  000f 5f            	clrw	x
2305  0010 97            	ld	xl,a
2306  0011 1f01          	ldw	(OFST-3,sp),x
2307                     ; 804   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2309  0013 c6521a        	ld	a,21018
2310  0016 1402          	and	a,(OFST-2,sp)
2311  0018 6b03          	ld	(OFST-1,sp),a
2312                     ; 806   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2314  001a 7b05          	ld	a,(OFST+1,sp)
2315  001c 97            	ld	xl,a
2316  001d 7b06          	ld	a,(OFST+2,sp)
2317  001f 9f            	ld	a,xl
2318  0020 a430          	and	a,#48
2319  0022 97            	ld	xl,a
2320  0023 4f            	clr	a
2321  0024 02            	rlwa	x,a
2322  0025 a30100        	cpw	x,#256
2323  0028 2615          	jrne	L1311
2324                     ; 809     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2326  002a c65217        	ld	a,21015
2327  002d 1506          	bcp	a,(OFST+2,sp)
2328  002f 270a          	jreq	L3311
2330  0031 0d03          	tnz	(OFST-1,sp)
2331  0033 2706          	jreq	L3311
2332                     ; 812       bitstatus = SET;
2334  0035 a601          	ld	a,#1
2335  0037 6b04          	ld	(OFST+0,sp),a
2337  0039 2017          	jra	L7311
2338  003b               L3311:
2339                     ; 817       bitstatus = RESET;
2341  003b 0f04          	clr	(OFST+0,sp)
2342  003d 2013          	jra	L7311
2343  003f               L1311:
2344                     ; 823     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2346  003f c65218        	ld	a,21016
2347  0042 1506          	bcp	a,(OFST+2,sp)
2348  0044 270a          	jreq	L1411
2350  0046 0d03          	tnz	(OFST-1,sp)
2351  0048 2706          	jreq	L1411
2352                     ; 826       bitstatus = SET;
2354  004a a601          	ld	a,#1
2355  004c 6b04          	ld	(OFST+0,sp),a
2357  004e 2002          	jra	L7311
2358  0050               L1411:
2359                     ; 831       bitstatus = RESET;
2361  0050 0f04          	clr	(OFST+0,sp)
2362  0052               L7311:
2363                     ; 835   return  bitstatus;
2365  0052 7b04          	ld	a,(OFST+0,sp)
2368  0054 5b06          	addw	sp,#6
2369  0056 81            	ret
2414                     ; 873 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2414                     ; 874 {
2415                     .text:	section	.text,new
2416  0000               _I2C_ClearITPendingBit:
2418  0000 89            	pushw	x
2419       00000002      OFST:	set	2
2422                     ; 875   uint16_t flagpos = 0;
2424                     ; 878   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2426                     ; 881   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2428  0001 01            	rrwa	x,a
2429  0002 a4ff          	and	a,#255
2430  0004 5f            	clrw	x
2431  0005 02            	rlwa	x,a
2432  0006 1f01          	ldw	(OFST-1,sp),x
2433  0008 01            	rrwa	x,a
2434                     ; 884   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2436  0009 7b02          	ld	a,(OFST+0,sp)
2437  000b 43            	cpl	a
2438  000c c75218        	ld	21016,a
2439                     ; 885 }
2442  000f 85            	popw	x
2443  0010 81            	ret
2456                     	xdef	_I2C_ClearITPendingBit
2457                     	xdef	_I2C_GetITStatus
2458                     	xdef	_I2C_ClearFlag
2459                     	xdef	_I2C_GetFlagStatus
2460                     	xdef	_I2C_GetLastEvent
2461                     	xdef	_I2C_CheckEvent
2462                     	xdef	_I2C_SendData
2463                     	xdef	_I2C_Send7bitAddress
2464                     	xdef	_I2C_ReceiveData
2465                     	xdef	_I2C_ITConfig
2466                     	xdef	_I2C_FastModeDutyCycleConfig
2467                     	xdef	_I2C_AcknowledgeConfig
2468                     	xdef	_I2C_StretchClockCmd
2469                     	xdef	_I2C_SoftwareResetCmd
2470                     	xdef	_I2C_GenerateSTOP
2471                     	xdef	_I2C_GenerateSTART
2472                     	xdef	_I2C_GeneralCallCmd
2473                     	xdef	_I2C_Cmd
2474                     	xdef	_I2C_Init
2475                     	xdef	_I2C_DeInit
2476                     	xref.b	c_lreg
2477                     	xref.b	c_x
2496                     	xref	c_sdivx
2497                     	xref	c_ludv
2498                     	xref	c_rtol
2499                     	xref	c_smul
2500                     	xref	c_lmul
2501                     	xref	c_lcmp
2502                     	xref	c_ltor
2503                     	end
