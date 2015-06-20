   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  22                     	bsct
  23  0000               _RFbytesReady:
  24  0000 00            	dc.b	0
  25  0001               L5_RFrcvTimeoutcnt:
  26  0001 00            	dc.b	0
  27  0002               L31_RF_bits:
  28  0002 00            	dc.b	0
  29  0003               L51_RF_bytes:
  30  0003 00            	dc.b	0
  31  0004               L71_RF_data:
  32  0004 00            	dc.b	0
  33  0005               L12_RF_PulsePeriod:
  34  0005 0000          	dc.w	0
  35  0007               L52_idx_temp2:
  36  0007 00            	dc.b	0
  37                     .bit:	section	.data,bit
  38  0000               L72_flag_RF_StartRec:
  39  0000 00            	dc.b	0
  40                     	bsct
  41  0008               L13_RF_rcvState:
  42  0008 00            	dc.b	0
  43                     	switch	.bit
  44  0001               _FLAG_UART_cmd_rcv:
  45  0001 00            	dc.b	0
  75                     ; 91 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  75                     ; 92 {
  76                     .text:	section	.text,new
  77  0000               f_NonHandledInterrupt:
  81                     ; 96 }
  84  0000 80            	iret	
 106                     ; 104 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
 106                     ; 105 {
 107                     .text:	section	.text,new
 108  0000               f_TRAP_IRQHandler:
 112                     ; 109 }
 115  0000 80            	iret	
 137                     ; 116 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 137                     ; 117 
 137                     ; 118 {
 138                     .text:	section	.text,new
 139  0000               f_TLI_IRQHandler:
 143                     ; 122 }
 146  0000 80            	iret	
 168                     ; 129 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 168                     ; 130 {
 169                     .text:	section	.text,new
 170  0000               f_AWU_IRQHandler:
 174                     ; 134 }
 177  0000 80            	iret	
 199                     ; 141 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 199                     ; 142 {
 200                     .text:	section	.text,new
 201  0000               f_CLK_IRQHandler:
 205                     ; 146 }
 208  0000 80            	iret	
 231                     ; 153 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 231                     ; 154 {
 232                     .text:	section	.text,new
 233  0000               f_EXTI_PORTA_IRQHandler:
 237                     ; 157 }
 240  0000 80            	iret	
 263                     ; 164 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 263                     ; 165 {
 264                     .text:	section	.text,new
 265  0000               f_EXTI_PORTB_IRQHandler:
 269                     ; 169 }
 272  0000 80            	iret	
 295                     ; 176 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 295                     ; 177 {
 296                     .text:	section	.text,new
 297  0000               f_EXTI_PORTC_IRQHandler:
 301                     ; 181 }
 304  0000 80            	iret	
 327                     ; 188 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 327                     ; 189 {
 328                     .text:	section	.text,new
 329  0000               f_EXTI_PORTD_IRQHandler:
 333                     ; 193 }
 336  0000 80            	iret	
 359                     ; 200 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 359                     ; 201 {
 360                     .text:	section	.text,new
 361  0000               f_EXTI_PORTE_IRQHandler:
 365                     ; 205 }
 368  0000 80            	iret	
 390                     ; 252 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 390                     ; 253 {
 391                     .text:	section	.text,new
 392  0000               f_SPI_IRQHandler:
 396                     ; 257 }
 399  0000 80            	iret	
 422                     ; 264 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 422                     ; 265 {
 423                     .text:	section	.text,new
 424  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 428                     ; 270 }
 431  0000 80            	iret	
 479                     ; 277 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 479                     ; 278 {
 480                     .text:	section	.text,new
 481  0000               f_TIM1_CAP_COM_IRQHandler:
 483       00000001      OFST:	set	1
 484  0000 88            	push	a
 487                     ; 282   if(TIM1->SR1 & TIM1_IT_CC2)
 489  0001 7204525504ac  	btjf	21077,#2,L522
 490                     ; 284     RFrcvTimeoutcnt = 0;  // reset RF timeout counter
 492  000a 3f01          	clr	L5_RFrcvTimeoutcnt
 493                     ; 285     _highB = TIM1->CCR2H;
 495  000c 555267003d    	mov	L7__highB,21095
 496                     ; 286     _lowB = TIM1->CCR2L;
 498  0011 555268003c    	mov	L11__lowB,21096
 499                     ; 287     RF_PulsePeriod = (u16)(_lowB);
 501  0016 b63c          	ld	a,L11__lowB
 502  0018 5f            	clrw	x
 503  0019 97            	ld	xl,a
 504  001a bf05          	ldw	L12_RF_PulsePeriod,x
 505                     ; 288     RF_PulsePeriod |= (u16)((u16)_highB << 8);
 507  001c 5f            	clrw	x
 508  001d b63d          	ld	a,L7__highB
 509  001f 97            	ld	xl,a
 510  0020 b606          	ld	a,L12_RF_PulsePeriod+1
 511  0022 01            	rrwa	x,a
 512  0023 ba05          	or	a,L12_RF_PulsePeriod
 513  0025 01            	rrwa	x,a
 514  0026 bf05          	ldw	L12_RF_PulsePeriod,x
 515                     ; 290     if(flag_RF_StartRec)
 517  0028 7201000010    	btjf	L72_flag_RF_StartRec,L722
 518                     ; 292       if(idx_temp2 < RFRECORDLEN)
 520  002d b607          	ld	a,L52_idx_temp2
 521  002f a11e          	cp	a,#30
 522  0031 240a          	jruge	L722
 523                     ; 294         temp2[idx_temp2++] = RF_PulsePeriod;
 525  0033 3c07          	inc	L52_idx_temp2
 526  0035 5f            	clrw	x
 527  0036 97            	ld	xl,a
 528  0037 58            	sllw	x
 529  0038 90be05        	ldw	y,L12_RF_PulsePeriod
 530  003b ef00          	ldw	(L32_temp2,x),y
 531  003d               L722:
 532                     ; 298     switch(RF_rcvState)
 534  003d b608          	ld	a,L13_RF_rcvState
 536                     ; 372       default: break;
 537  003f 2707          	jreq	L102
 538  0041 4a            	dec	a
 539  0042 271e          	jreq	L302
 540  0044 ace000e0      	jra	L532
 541  0048               L102:
 542                     ; 303         if(RF_PulsePeriod > (u16)1014 && RF_PulsePeriod < (u16)1191)
 544  0048 be05          	ldw	x,L12_RF_PulsePeriod
 545  004a a303f7        	cpw	x,#1015
 546  004d 25f5          	jrult	L532
 548  004f a304a7        	cpw	x,#1191
 549  0052 24f0          	jruge	L532
 550                     ; 305           RF_bits = 0;
 552  0054 b702          	ld	L31_RF_bits,a
 553                     ; 306           RF_bytes = 0;
 555  0056 b703          	ld	L51_RF_bytes,a
 556                     ; 307           RF_data = 0;
 558  0058 b704          	ld	L71_RF_data,a
 559                     ; 309           RF_rcvState = RF_RCVSTATE_REC8BITS;
 561  005a 35010008      	mov	L13_RF_rcvState,#1
 562  005e ace000e0      	jra	L532
 563  0062               L302:
 564                     ; 316         if(RF_PulsePeriod >= 1014) 
 566  0062 be05          	ldw	x,L12_RF_PulsePeriod
 567  0064 a303f6        	cpw	x,#1014
 568  0067 250c          	jrult	L142
 569                     ; 319           RF_bits = 0;
 571  0069 b702          	ld	L31_RF_bits,a
 572                     ; 320           RF_bytes = 0;
 574  006b b703          	ld	L51_RF_bytes,a
 575                     ; 321           RF_data = 0;
 577  006d b704          	ld	L71_RF_data,a
 578                     ; 322           flag_RF_StartRec = FALSE;
 580  006f 72110000      	bres	L72_flag_RF_StartRec
 582  0073 206b          	jra	L532
 583  0075               L142:
 584                     ; 326           if(RF_PulsePeriod >= RF_MIDDLEBIT)   // 0 bit = 500uS, 1 bit = 750uS
 586  0075 a30230        	cpw	x,#560
 587  0078 2504          	jrult	L542
 588                     ; 329             RF_data |= 0x01;
 590  007a 72100004      	bset	L71_RF_data,#0
 591  007e               L542:
 592                     ; 331           RF_bits++;
 594  007e 3c02          	inc	L31_RF_bits
 595                     ; 332           if(RF_bits < 8) RF_data <<= 1;
 597  0080 b602          	ld	a,L31_RF_bits
 598  0082 a108          	cp	a,#8
 599  0084 2402          	jruge	L742
 602  0086 3804          	sll	L71_RF_data
 603  0088               L742:
 604                     ; 333           if(RF_bits == 8)
 606  0088 a108          	cp	a,#8
 607  008a 2654          	jrne	L532
 608                     ; 336             RcvRFmsg.RFmsgarray[RF_bytes++] = RF_data;
 610  008c b603          	ld	a,L51_RF_bytes
 611  008e 3c03          	inc	L51_RF_bytes
 612  0090 5f            	clrw	x
 613  0091 97            	ld	xl,a
 614  0092 b604          	ld	a,L71_RF_data
 615  0094 e73f          	ld	(_RcvRFmsg,x),a
 616                     ; 337             RF_bits = 0;
 618  0096 3f02          	clr	L31_RF_bits
 619                     ; 338             RF_data = 0;
 621  0098 3f04          	clr	L71_RF_data
 622                     ; 339             if(RF_bytes == 2)
 624  009a b603          	ld	a,L51_RF_bytes
 625  009c a102          	cp	a,#2
 626  009e 2615          	jrne	L352
 627                     ; 341               if(RcvRFmsg.RFmsgmember.RFsyncValue != RFSYNCVAL)
 629  00a0 be3f          	ldw	x,_RcvRFmsg
 630  00a2 a381b3        	cpw	x,#33203
 631  00a5 2708          	jreq	L552
 632                     ; 344                 flag_RF_StartRec = FALSE;
 634  00a7 72110000      	bres	L72_flag_RF_StartRec
 635                     ; 345                 RF_rcvState = RF_RCVSTATE_WAITSTART;
 637  00ab 3f08          	clr	L13_RF_rcvState
 639  00ad 2006          	jra	L352
 640  00af               L552:
 641                     ; 349                 flag_RF_StartRec = TRUE;
 643  00af 72100000      	bset	L72_flag_RF_StartRec
 644                     ; 350                 idx_temp2 = 0;
 646  00b3 3f07          	clr	L52_idx_temp2
 647  00b5               L352:
 648                     ; 353             if(RF_bytes == RFSEND_DATALEN) 
 650  00b5 a105          	cp	a,#5
 651  00b7 2627          	jrne	L532
 652                     ; 355               RFrcvChksum = 0;
 654  00b9 3f3e          	clr	L3_RFrcvChksum
 655                     ; 356               for(i=0;i<RFSEND_DATALEN-1;i++)
 657  00bb 4f            	clr	a
 658  00bc 6b01          	ld	(OFST+0,sp),a
 659  00be               L362:
 660                     ; 358                 RFrcvChksum += RcvRFmsg.RFmsgarray[i];
 662  00be 5f            	clrw	x
 663  00bf 97            	ld	xl,a
 664  00c0 b63e          	ld	a,L3_RFrcvChksum
 665  00c2 eb3f          	add	a,(_RcvRFmsg,x)
 666  00c4 b73e          	ld	L3_RFrcvChksum,a
 667                     ; 356               for(i=0;i<RFSEND_DATALEN-1;i++)
 669  00c6 0c01          	inc	(OFST+0,sp)
 672  00c8 7b01          	ld	a,(OFST+0,sp)
 673  00ca a104          	cp	a,#4
 674  00cc 25f0          	jrult	L362
 675                     ; 360               RFrcvChksum = (u8)(~RFrcvChksum);
 677  00ce 333e          	cpl	L3_RFrcvChksum
 678                     ; 361               if(RFrcvChksum == RcvRFmsg.RFmsgmember.RFmsgCHKSUM)
 680  00d0 b643          	ld	a,_RcvRFmsg+4
 681  00d2 b13e          	cp	a,L3_RFrcvChksum
 682  00d4 2604          	jrne	L172
 683                     ; 363                 RFbytesReady = TRUE;  // set new RF data available flag
 685  00d6 35010000      	mov	_RFbytesReady,#1
 686  00da               L172:
 687                     ; 365               flag_RF_StartRec = FALSE;
 689  00da 72110000      	bres	L72_flag_RF_StartRec
 690                     ; 366               RF_rcvState = RF_RCVSTATE_WAITSTART;
 692  00de 3f08          	clr	L13_RF_rcvState
 693                     ; 372       default: break;
 695  00e0               L532:
 696                     ; 375     TIM1->SR1 = (u8)(~(u8)TIM1_IT_CC2);
 698  00e0 35fb5255      	mov	21077,#251
 699  00e4               L522:
 700                     ; 377 }
 703  00e4 84            	pop	a
 704  00e5 80            	iret	
 727                     ; 410 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 727                     ; 411 {
 728                     .text:	section	.text,new
 729  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 733                     ; 415 }
 736  0000 80            	iret	
 759                     ; 422 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 759                     ; 423 {
 760                     .text:	section	.text,new
 761  0000               f_TIM2_CAP_COM_IRQHandler:
 765                     ; 427 }
 768  0000 80            	iret	
 791                     ; 464 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 791                     ; 465 {
 792                     .text:	section	.text,new
 793  0000               f_UART1_TX_IRQHandler:
 797                     ; 469 }
 800  0000 80            	iret	
 823                     ; 476 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 823                     ; 477 {
 824                     .text:	section	.text,new
 825  0000               f_UART1_RX_IRQHandler:
 829  0000               L333:
 830  0000 20fe          	jra	L333
 852                     ; 490 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 852                     ; 491 {
 853                     .text:	section	.text,new
 854  0000               f_I2C_IRQHandler:
 858                     ; 495 }
 861  0000 80            	iret	
 883                     ; 569 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 883                     ; 570 {
 884                     .text:	section	.text,new
 885  0000               f_ADC1_IRQHandler:
 889                     ; 574 }
 892  0000 80            	iret	
 927                     ; 595 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)     /* once every 2MS */
 927                     ; 596 {
 928                     .text:	section	.text,new
 929  0000               f_TIM4_UPD_OVF_IRQHandler:
 931  0000 8a            	push	cc
 932  0001 84            	pop	a
 933  0002 a4bf          	and	a,#191
 934  0004 88            	push	a
 935  0005 86            	pop	cc
 936  0006 3b0002        	push	c_x+2
 937  0009 be00          	ldw	x,c_x
 938  000b 89            	pushw	x
 939  000c 3b0002        	push	c_y+2
 940  000f be00          	ldw	x,c_y
 941  0011 89            	pushw	x
 944                     ; 601     if(!Timeout_istout1)
 946  0012 720000000d    	btjt	_Timeout_istout1,L763
 947                     ; 603       Timeout_toutcnt1++;
 949  0017 be00          	ldw	x,_Timeout_toutcnt1
 950  0019 5c            	incw	x
 951  001a bf00          	ldw	_Timeout_toutcnt1,x
 952                     ; 604       if(Timeout_toutcnt1 >= Timeout_tout1) Timeout_istout1 = TRUE;
 954  001c b300          	cpw	x,_Timeout_tout1
 955  001e 2504          	jrult	L763
 958  0020 72100000      	bset	_Timeout_istout1
 959  0024               L763:
 960                     ; 606     if(!Timeout_istout2)
 962  0024 720000000d    	btjt	_Timeout_istout2,L373
 963                     ; 608       Timeout_toutcnt2++;
 965  0029 be00          	ldw	x,_Timeout_toutcnt2
 966  002b 5c            	incw	x
 967  002c bf00          	ldw	_Timeout_toutcnt2,x
 968                     ; 609       if(Timeout_toutcnt2 >= Timeout_tout2) Timeout_istout2 = TRUE;
 970  002e b300          	cpw	x,_Timeout_tout2
 971  0030 2504          	jrult	L373
 974  0032 72100000      	bset	_Timeout_istout2
 975  0036               L373:
 976                     ; 611     if(!Timeout_istout3)
 978  0036 720000000d    	btjt	_Timeout_istout3,L773
 979                     ; 613       Timeout_toutcnt3++;
 981  003b be00          	ldw	x,_Timeout_toutcnt3
 982  003d 5c            	incw	x
 983  003e bf00          	ldw	_Timeout_toutcnt3,x
 984                     ; 614       if(Timeout_toutcnt3 >= Timeout_tout3) Timeout_istout3 = TRUE;
 986  0040 b300          	cpw	x,_Timeout_tout3
 987  0042 2504          	jrult	L773
 990  0044 72100000      	bset	_Timeout_istout3
 991  0048               L773:
 992                     ; 617    if(RFrcvTimeoutcnt < 255) RFrcvTimeoutcnt++;
 994  0048 b601          	ld	a,L5_RFrcvTimeoutcnt
 995  004a a1ff          	cp	a,#255
 996  004c 2404          	jruge	L304
 999  004e 3c01          	inc	L5_RFrcvTimeoutcnt
1000  0050 b601          	ld	a,L5_RFrcvTimeoutcnt
1001  0052               L304:
1002                     ; 618    if(RFrcvTimeoutcnt >= RF_RCVTIMEOUT)
1004  0052 a164          	cp	a,#100
1005  0054 2502          	jrult	L504
1006                     ; 620      RF_rcvState = RF_RCVSTATE_WAITSTART;
1008  0056 3f08          	clr	L13_RF_rcvState
1009  0058               L504:
1010                     ; 622    TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
1012  0058 a601          	ld	a,#1
1013  005a cd0000        	call	_TIM4_ClearITPendingBit
1015                     ; 623 }
1018  005d 85            	popw	x
1019  005e bf00          	ldw	c_y,x
1020  0060 320002        	pop	c_y+2
1021  0063 85            	popw	x
1022  0064 bf00          	ldw	c_x,x
1023  0066 320002        	pop	c_x+2
1024  0069 80            	iret	
1047                     ; 631 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1047                     ; 632 {
1048                     .text:	section	.text,new
1049  0000               f_EEPROM_EEC_IRQHandler:
1053                     ; 636 }
1056  0000 80            	iret	
1294                     	xref.b	_Timeout_tout3
1295                     	xref.b	_Timeout_tout2
1296                     	xref.b	_Timeout_tout1
1297                     	xref.b	_Timeout_toutcnt3
1298                     	xref.b	_Timeout_toutcnt2
1299                     	xref.b	_Timeout_toutcnt1
1300                     	xbit	_Timeout_istout3
1301                     	xbit	_Timeout_istout2
1302                     	xbit	_Timeout_istout1
1303                     	xdef	_FLAG_UART_cmd_rcv
1304                     	switch	.ubsct
1305  0000               L32_temp2:
1306  0000 000000000000  	ds.b	60
1307  003c               L11__lowB:
1308  003c 00            	ds.b	1
1309  003d               L7__highB:
1310  003d 00            	ds.b	1
1311  003e               L3_RFrcvChksum:
1312  003e 00            	ds.b	1
1313                     	xdef	f_EEPROM_EEC_IRQHandler
1314                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1315                     	xdef	f_ADC1_IRQHandler
1316                     	xdef	f_I2C_IRQHandler
1317                     	xdef	f_UART1_RX_IRQHandler
1318                     	xdef	f_UART1_TX_IRQHandler
1319                     	xdef	f_TIM2_CAP_COM_IRQHandler
1320                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1321                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1322                     	xdef	f_TIM1_CAP_COM_IRQHandler
1323                     	xdef	f_SPI_IRQHandler
1324                     	xdef	f_EXTI_PORTE_IRQHandler
1325                     	xdef	f_EXTI_PORTD_IRQHandler
1326                     	xdef	f_EXTI_PORTC_IRQHandler
1327                     	xdef	f_EXTI_PORTB_IRQHandler
1328                     	xdef	f_EXTI_PORTA_IRQHandler
1329                     	xdef	f_CLK_IRQHandler
1330                     	xdef	f_AWU_IRQHandler
1331                     	xdef	f_TLI_IRQHandler
1332                     	xdef	f_TRAP_IRQHandler
1333                     	xdef	f_NonHandledInterrupt
1334                     	xdef	_RFbytesReady
1335  003f               _RcvRFmsg:
1336  003f 0000000000    	ds.b	5
1337                     	xdef	_RcvRFmsg
1338                     	xref	_TIM4_ClearITPendingBit
1339                     	xref.b	c_x
1340                     	xref.b	c_y
1360                     	end
