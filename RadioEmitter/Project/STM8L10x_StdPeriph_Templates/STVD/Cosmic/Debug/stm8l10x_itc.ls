   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 57 uint8_t ITC_GetCPUCC(void)
  49                     ; 58 {
  51                     .text:	section	.text,new
  52  0000               _ITC_GetCPUCC:
  56                     ; 60   _asm("push cc");
  59  0000 8a            	push	cc
  61                     ; 61   _asm("pop a");
  64  0001 84            	pop	a
  66                     ; 62   return; /* Ignore compiler warning, the returned value is in A register */
  69  0002 81            	ret	
  92                     ; 76 void ITC_DeInit(void)
  92                     ; 77 {
  93                     .text:	section	.text,new
  94  0000               _ITC_DeInit:
  98                     ; 78   ITC->ISPR1 = ITC_SPR1_RESET_VALUE;
 100  0000 35ff7f70      	mov	32624,#255
 101                     ; 79   ITC->ISPR2 = ITC_SPR2_RESET_VALUE;
 103  0004 35ff7f71      	mov	32625,#255
 104                     ; 80   ITC->ISPR3 = ITC_SPR3_RESET_VALUE;
 106  0008 35ff7f72      	mov	32626,#255
 107                     ; 81   ITC->ISPR4 = ITC_SPR4_RESET_VALUE;
 109  000c 35ff7f73      	mov	32627,#255
 110                     ; 82   ITC->ISPR5 = ITC_SPR5_RESET_VALUE;
 112  0010 35ff7f74      	mov	32628,#255
 113                     ; 83   ITC->ISPR6 = ITC_SPR6_RESET_VALUE;
 115  0014 35ff7f75      	mov	32629,#255
 116                     ; 84   ITC->ISPR7 = ITC_SPR7_RESET_VALUE;
 118  0018 35ff7f76      	mov	32630,#255
 119                     ; 85   ITC->ISPR8 = ITC_SPR8_RESET_VALUE;
 121  001c 35ff7f77      	mov	32631,#255
 122                     ; 86 }
 125  0020 81            	ret	
 150                     ; 93 uint8_t ITC_GetSoftIntStatus(void)
 150                     ; 94 {
 151                     .text:	section	.text,new
 152  0000               _ITC_GetSoftIntStatus:
 156                     ; 95   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 158  0000 cd0000        	call	_ITC_GetCPUCC
 160  0003 a428          	and	a,#40
 163  0005 81            	ret	
 418                     .const:	section	.text
 419  0000               L42:
 420  0000 0022          	dc.w	L14
 421  0002 004c          	dc.w	L702
 422  0004 004c          	dc.w	L702
 423  0006 0027          	dc.w	L34
 424  0008 004c          	dc.w	L702
 425  000a 0027          	dc.w	L34
 426  000c 0027          	dc.w	L34
 427  000e 002c          	dc.w	L54
 428  0010 002c          	dc.w	L54
 429  0012 002c          	dc.w	L54
 430  0014 002c          	dc.w	L54
 431  0016 0031          	dc.w	L74
 432  0018 0031          	dc.w	L74
 433  001a 0031          	dc.w	L74
 434  001c 0031          	dc.w	L74
 435  001e 004c          	dc.w	L702
 436  0020 004c          	dc.w	L702
 437  0022 0036          	dc.w	L15
 438  0024 0036          	dc.w	L15
 439  0026 003b          	dc.w	L35
 440  0028 003b          	dc.w	L35
 441  002a 003b          	dc.w	L35
 442  002c 004c          	dc.w	L702
 443  002e 004c          	dc.w	L702
 444  0030 0040          	dc.w	L55
 445  0032 0040          	dc.w	L55
 446  0034 0040          	dc.w	L55
 447  0036 0045          	dc.w	L75
 448  0038 0045          	dc.w	L75
 449                     ; 126 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 449                     ; 127 {
 450                     .text:	section	.text,new
 451  0000               _ITC_GetSoftwarePriority:
 453  0000 88            	push	a
 454  0001 89            	pushw	x
 455       00000002      OFST:	set	2
 458                     ; 128   uint8_t Value = 0;
 460  0002 0f02          	clr	(OFST+0,sp)
 461                     ; 129   uint8_t Mask = 0;
 463                     ; 132   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 465                     ; 135   Mask = (uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U));
 467  0004 a403          	and	a,#3
 468  0006 48            	sll	a
 469  0007 5f            	clrw	x
 470  0008 97            	ld	xl,a
 471  0009 a603          	ld	a,#3
 472  000b 5d            	tnzw	x
 473  000c 2704          	jreq	L61
 474  000e               L02:
 475  000e 48            	sll	a
 476  000f 5a            	decw	x
 477  0010 26fc          	jrne	L02
 478  0012               L61:
 479  0012 6b01          	ld	(OFST-1,sp),a
 480                     ; 137   switch (IRQn)
 482  0014 7b03          	ld	a,(OFST+1,sp)
 484                     ; 185     default:
 484                     ; 186       break;
 485  0016 4a            	dec	a
 486  0017 a11d          	cp	a,#29
 487  0019 2431          	jruge	L702
 488  001b 5f            	clrw	x
 489  001c 97            	ld	xl,a
 490  001d 58            	sllw	x
 491  001e de0000        	ldw	x,(L42,x)
 492  0021 fc            	jp	(x)
 493  0022               L14:
 494                     ; 139     case FLASH_IRQn:
 494                     ; 140       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 496  0022 c67f70        	ld	a,32624
 497                     ; 141       break;
 499  0025 2021          	jp	LC001
 500  0027               L34:
 501                     ; 143     case AWU_IRQn:
 501                     ; 144     case EXTIB_IRQn:
 501                     ; 145     case EXTID_IRQn:
 501                     ; 146       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 503  0027 c67f71        	ld	a,32625
 504                     ; 147       break;
 506  002a 201c          	jp	LC001
 507  002c               L54:
 508                     ; 149     case EXTI0_IRQn:
 508                     ; 150     case EXTI1_IRQn:
 508                     ; 151     case EXTI2_IRQn:
 508                     ; 152     case EXTI3_IRQn:
 508                     ; 153       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 510  002c c67f72        	ld	a,32626
 511                     ; 154       break;
 513  002f 2017          	jp	LC001
 514  0031               L74:
 515                     ; 156     case EXTI4_IRQn:
 515                     ; 157     case EXTI5_IRQn:
 515                     ; 158     case EXTI6_IRQn:
 515                     ; 159     case EXTI7_IRQn:
 515                     ; 160       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 517  0031 c67f73        	ld	a,32627
 518                     ; 161       break;
 520  0034 2012          	jp	LC001
 521  0036               L15:
 522                     ; 163     case COMP_IRQn:
 522                     ; 164     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 522                     ; 165       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 524  0036 c67f74        	ld	a,32628
 525                     ; 166       break;
 527  0039 200d          	jp	LC001
 528  003b               L35:
 529                     ; 168     case TIM2_CAP_IRQn:
 529                     ; 169     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 529                     ; 170     case TIM3_CAP_IRQn:
 529                     ; 171       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 531  003b c67f75        	ld	a,32629
 532                     ; 172       break;
 534  003e 2008          	jp	LC001
 535  0040               L55:
 536                     ; 174     case TIM4_UPD_OVF_IRQn:
 536                     ; 175     case SPI_IRQn:
 536                     ; 176     case USART_TX_IRQn:
 536                     ; 177       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 538  0040 c67f76        	ld	a,32630
 539                     ; 178       break;
 541  0043 2003          	jp	LC001
 542  0045               L75:
 543                     ; 180     case USART_RX_IRQn:
 543                     ; 181     case I2C_IRQn:
 543                     ; 182       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 545  0045 c67f77        	ld	a,32631
 546  0048               LC001:
 547  0048 1401          	and	a,(OFST-1,sp)
 548  004a 6b02          	ld	(OFST+0,sp),a
 549                     ; 183       break;
 551                     ; 185     default:
 551                     ; 186       break;
 553  004c               L702:
 554                     ; 189   Value >>= (uint8_t)(((uint8_t)IRQn % 4u) * 2u);
 556  004c 7b03          	ld	a,(OFST+1,sp)
 557  004e a403          	and	a,#3
 558  0050 48            	sll	a
 559  0051 5f            	clrw	x
 560  0052 97            	ld	xl,a
 561  0053 7b02          	ld	a,(OFST+0,sp)
 562  0055 5d            	tnzw	x
 563  0056 2704          	jreq	L62
 564  0058               L03:
 565  0058 44            	srl	a
 566  0059 5a            	decw	x
 567  005a 26fc          	jrne	L03
 568  005c               L62:
 569                     ; 191   return((ITC_PriorityLevel_TypeDef)Value);
 573  005c 5b03          	addw	sp,#3
 574  005e 81            	ret	
 638                     	switch	.const
 639  003a               L64:
 640  003a 0037          	dc.w	L112
 641  003c 00c5          	dc.w	L762
 642  003e 00c5          	dc.w	L762
 643  0040 0049          	dc.w	L312
 644  0042 00c5          	dc.w	L762
 645  0044 0049          	dc.w	L312
 646  0046 0049          	dc.w	L312
 647  0048 005b          	dc.w	L512
 648  004a 005b          	dc.w	L512
 649  004c 005b          	dc.w	L512
 650  004e 005b          	dc.w	L512
 651  0050 006d          	dc.w	L712
 652  0052 006d          	dc.w	L712
 653  0054 006d          	dc.w	L712
 654  0056 006d          	dc.w	L712
 655  0058 00c5          	dc.w	L762
 656  005a 00c5          	dc.w	L762
 657  005c 007f          	dc.w	L122
 658  005e 007f          	dc.w	L122
 659  0060 0091          	dc.w	L322
 660  0062 0091          	dc.w	L322
 661  0064 0091          	dc.w	L322
 662  0066 00c5          	dc.w	L762
 663  0068 00c5          	dc.w	L762
 664  006a 00a3          	dc.w	L522
 665  006c 00a3          	dc.w	L522
 666  006e 00a3          	dc.w	L522
 667  0070 00b5          	dc.w	L722
 668  0072 00b5          	dc.w	L722
 669                     ; 234 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 669                     ; 235 {
 670                     .text:	section	.text,new
 671  0000               _ITC_SetSoftwarePriority:
 673  0000 89            	pushw	x
 674  0001 89            	pushw	x
 675       00000002      OFST:	set	2
 678                     ; 236   uint8_t Mask = 0;
 680                     ; 237   uint8_t NewPriority = 0;
 682                     ; 240   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 684                     ; 241   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 686                     ; 244   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 688                     ; 248   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U)));
 690  0002 9e            	ld	a,xh
 691  0003 a403          	and	a,#3
 692  0005 48            	sll	a
 693  0006 5f            	clrw	x
 694  0007 97            	ld	xl,a
 695  0008 a603          	ld	a,#3
 696  000a 5d            	tnzw	x
 697  000b 2704          	jreq	L43
 698  000d               L63:
 699  000d 48            	sll	a
 700  000e 5a            	decw	x
 701  000f 26fc          	jrne	L63
 702  0011               L43:
 703  0011 43            	cpl	a
 704  0012 6b01          	ld	(OFST-1,sp),a
 705                     ; 251   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << (((uint8_t)IRQn % 4U) * 2U));
 707  0014 7b03          	ld	a,(OFST+1,sp)
 708  0016 a403          	and	a,#3
 709  0018 48            	sll	a
 710  0019 5f            	clrw	x
 711  001a 97            	ld	xl,a
 712  001b 7b04          	ld	a,(OFST+2,sp)
 713  001d 5d            	tnzw	x
 714  001e 2704          	jreq	L04
 715  0020               L24:
 716  0020 48            	sll	a
 717  0021 5a            	decw	x
 718  0022 26fc          	jrne	L24
 719  0024               L04:
 720  0024 6b02          	ld	(OFST+0,sp),a
 721                     ; 253   switch (IRQn)
 723  0026 7b03          	ld	a,(OFST+1,sp)
 725                     ; 309     default:
 725                     ; 310       break;
 726  0028 4a            	dec	a
 727  0029 a11d          	cp	a,#29
 728  002b 2503cc00c5    	jruge	L762
 729  0030 5f            	clrw	x
 730  0031 97            	ld	xl,a
 731  0032 58            	sllw	x
 732  0033 de003a        	ldw	x,(L64,x)
 733  0036 fc            	jp	(x)
 734  0037               L112:
 735                     ; 255     case FLASH_IRQn:
 735                     ; 256       ITC->ISPR1 &= Mask;
 737  0037 c67f70        	ld	a,32624
 738  003a 1401          	and	a,(OFST-1,sp)
 739  003c c77f70        	ld	32624,a
 740                     ; 257       ITC->ISPR1 |= NewPriority;
 742  003f c67f70        	ld	a,32624
 743  0042 1a02          	or	a,(OFST+0,sp)
 744  0044 c77f70        	ld	32624,a
 745                     ; 258       break;
 747  0047 207c          	jra	L762
 748  0049               L312:
 749                     ; 260     case AWU_IRQn:
 749                     ; 261     case EXTIB_IRQn:
 749                     ; 262     case EXTID_IRQn:
 749                     ; 263       ITC->ISPR2 &= Mask;
 751  0049 c67f71        	ld	a,32625
 752  004c 1401          	and	a,(OFST-1,sp)
 753  004e c77f71        	ld	32625,a
 754                     ; 264       ITC->ISPR2 |= NewPriority;
 756  0051 c67f71        	ld	a,32625
 757  0054 1a02          	or	a,(OFST+0,sp)
 758  0056 c77f71        	ld	32625,a
 759                     ; 265       break;
 761  0059 206a          	jra	L762
 762  005b               L512:
 763                     ; 267     case EXTI0_IRQn:
 763                     ; 268     case EXTI1_IRQn:
 763                     ; 269     case EXTI2_IRQn:
 763                     ; 270     case EXTI3_IRQn:
 763                     ; 271       ITC->ISPR3 &= Mask;
 765  005b c67f72        	ld	a,32626
 766  005e 1401          	and	a,(OFST-1,sp)
 767  0060 c77f72        	ld	32626,a
 768                     ; 272       ITC->ISPR3 |= NewPriority;
 770  0063 c67f72        	ld	a,32626
 771  0066 1a02          	or	a,(OFST+0,sp)
 772  0068 c77f72        	ld	32626,a
 773                     ; 273       break;
 775  006b 2058          	jra	L762
 776  006d               L712:
 777                     ; 275     case EXTI4_IRQn:
 777                     ; 276     case EXTI5_IRQn:
 777                     ; 277     case EXTI6_IRQn:
 777                     ; 278     case EXTI7_IRQn:
 777                     ; 279       ITC->ISPR4 &= Mask;
 779  006d c67f73        	ld	a,32627
 780  0070 1401          	and	a,(OFST-1,sp)
 781  0072 c77f73        	ld	32627,a
 782                     ; 280       ITC->ISPR4 |= NewPriority;
 784  0075 c67f73        	ld	a,32627
 785  0078 1a02          	or	a,(OFST+0,sp)
 786  007a c77f73        	ld	32627,a
 787                     ; 281       break;
 789  007d 2046          	jra	L762
 790  007f               L122:
 791                     ; 283     case COMP_IRQn:
 791                     ; 284     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 791                     ; 285       ITC->ISPR5 &= Mask;
 793  007f c67f74        	ld	a,32628
 794  0082 1401          	and	a,(OFST-1,sp)
 795  0084 c77f74        	ld	32628,a
 796                     ; 286       ITC->ISPR5 |= NewPriority;
 798  0087 c67f74        	ld	a,32628
 799  008a 1a02          	or	a,(OFST+0,sp)
 800  008c c77f74        	ld	32628,a
 801                     ; 287       break;
 803  008f 2034          	jra	L762
 804  0091               L322:
 805                     ; 289     case TIM2_CAP_IRQn:
 805                     ; 290     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 805                     ; 291     case TIM3_CAP_IRQn:
 805                     ; 292       ITC->ISPR6 &= Mask;
 807  0091 c67f75        	ld	a,32629
 808  0094 1401          	and	a,(OFST-1,sp)
 809  0096 c77f75        	ld	32629,a
 810                     ; 293       ITC->ISPR6 |= NewPriority;
 812  0099 c67f75        	ld	a,32629
 813  009c 1a02          	or	a,(OFST+0,sp)
 814  009e c77f75        	ld	32629,a
 815                     ; 294       break;
 817  00a1 2022          	jra	L762
 818  00a3               L522:
 819                     ; 296     case TIM4_UPD_OVF_IRQn:
 819                     ; 297     case SPI_IRQn:
 819                     ; 298     case USART_TX_IRQn:
 819                     ; 299       ITC->ISPR7 &= Mask;
 821  00a3 c67f76        	ld	a,32630
 822  00a6 1401          	and	a,(OFST-1,sp)
 823  00a8 c77f76        	ld	32630,a
 824                     ; 300       ITC->ISPR7 |= NewPriority;
 826  00ab c67f76        	ld	a,32630
 827  00ae 1a02          	or	a,(OFST+0,sp)
 828  00b0 c77f76        	ld	32630,a
 829                     ; 301       break;
 831  00b3 2010          	jra	L762
 832  00b5               L722:
 833                     ; 303     case USART_RX_IRQn:
 833                     ; 304     case I2C_IRQn:
 833                     ; 305       ITC->ISPR8 &= Mask;
 835  00b5 c67f77        	ld	a,32631
 836  00b8 1401          	and	a,(OFST-1,sp)
 837  00ba c77f77        	ld	32631,a
 838                     ; 306       ITC->ISPR8 |= NewPriority;
 840  00bd c67f77        	ld	a,32631
 841  00c0 1a02          	or	a,(OFST+0,sp)
 842  00c2 c77f77        	ld	32631,a
 843                     ; 307       break;
 845                     ; 309     default:
 845                     ; 310       break;
 847  00c5               L762:
 848                     ; 312 }
 851  00c5 5b04          	addw	sp,#4
 852  00c7 81            	ret	
 865                     	xdef	_ITC_SetSoftwarePriority
 866                     	xdef	_ITC_GetSoftwarePriority
 867                     	xdef	_ITC_GetSoftIntStatus
 868                     	xdef	_ITC_DeInit
 869                     	xdef	_ITC_GetCPUCC
 888                     	end
