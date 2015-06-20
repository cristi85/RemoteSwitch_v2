   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  53                     ; 39 void SST25VF016_Init(void)
  53                     ; 40 {
  55                     .text:	section	.text,new
  56  0000               _SST25VF016_Init:
  60                     ; 41   SPI_DeInit();
  62  0000 cd0000        	call	_SPI_DeInit
  64                     ; 42   SPI_Init(SPI_FIRSTBIT_MSB, 
  64                     ; 43            SPI_BAUDRATEPRESCALER_32, 
  64                     ; 44            SPI_MODE_MASTER, 
  64                     ; 45            SPI_CLOCKPOLARITY_LOW, 
  64                     ; 46            SPI_CLOCKPHASE_1EDGE, 
  64                     ; 47            SPI_DATADIRECTION_2LINES_FULLDUPLEX, 
  64                     ; 48            SPI_NSS_SOFT, 0x07);
  66  0003 4b07          	push	#7
  67  0005 4b02          	push	#2
  68  0007 4b00          	push	#0
  69  0009 4b00          	push	#0
  70  000b 4b00          	push	#0
  71  000d 4b04          	push	#4
  72  000f ae0020        	ldw	x,#32
  73  0012 cd0000        	call	_SPI_Init
  75  0015 5b06          	addw	sp,#6
  76                     ; 49  SPI_Cmd(ENABLE);
  78  0017 a601          	ld	a,#1
  80                     ; 50 }
  83  0019 cc0000        	jp	_SPI_Cmd
 215                     ; 59 void SST25VF016_Read(ExtFlashAdr addr, u8* buffer, u16 nr_bytes)
 215                     ; 60 {
 216                     .text:	section	.text,new
 217  0000               _SST25VF016_Read:
 219  0000 5203          	subw	sp,#3
 220       00000003      OFST:	set	3
 223                     ; 63   SPI_CS_LOW;
 225  0002 7219500a      	bres	20490,#4
 226                     ; 64   DELAY_US(SPI_CS_LOW_DELAY);
 228  0006 ae000c        	ldw	x,#12
 230  0009               L61:
 231  0009 5a            	decw	X
 232  000a 26fd          	jrne	L61
 233  000c 9d            	nop	
 235                     ; 65   SPI->DR = RD;
 238  000d 35035204      	mov	20996,#3
 240  0011               L111:
 241                     ; 66   while(!(SPI->SR & SPI_SR_RXNE));
 243  0011 72015203fb    	btjf	20995,#0,L111
 244                     ; 67   tmp = SPI->DR;
 246  0016 c65204        	ld	a,20996
 248  0019               L711:
 249                     ; 68   while(!(SPI->SR & SPI_SR_TXE));
 251  0019 72035203fb    	btjf	20995,#1,L711
 252                     ; 69   SPI->DR = addr.adr8b.HighByte;
 254  001e 7b07          	ld	a,(OFST+4,sp)
 255  0020 c75204        	ld	20996,a
 257  0023               L721:
 258                     ; 70   while(!(SPI->SR & SPI_SR_RXNE));
 260  0023 72015203fb    	btjf	20995,#0,L721
 261                     ; 71   tmp = SPI->DR;
 263  0028 c65204        	ld	a,20996
 265  002b               L531:
 266                     ; 72   while(!(SPI->SR & SPI_SR_TXE));
 268  002b 72035203fb    	btjf	20995,#1,L531
 269                     ; 73   SPI->DR = addr.adr8b.MidByte;
 271  0030 7b08          	ld	a,(OFST+5,sp)
 272  0032 c75204        	ld	20996,a
 274  0035               L541:
 275                     ; 74   while(!(SPI->SR & SPI_SR_RXNE));
 277  0035 72015203fb    	btjf	20995,#0,L541
 278                     ; 75   tmp = SPI->DR;
 280  003a c65204        	ld	a,20996
 282  003d               L351:
 283                     ; 76   while(!(SPI->SR & SPI_SR_TXE));
 285  003d 72035203fb    	btjf	20995,#1,L351
 286                     ; 77   SPI->DR = addr.adr8b.LowByte;
 288  0042 7b09          	ld	a,(OFST+6,sp)
 289  0044 c75204        	ld	20996,a
 291  0047               L361:
 292                     ; 78   while(!(SPI->SR & SPI_SR_RXNE));
 294  0047 72015203fb    	btjf	20995,#0,L361
 295                     ; 79   tmp = SPI->DR;
 297  004c c65204        	ld	a,20996
 299  004f               L171:
 300                     ; 80   while(!(SPI->SR & SPI_SR_TXE));
 302  004f 72035203fb    	btjf	20995,#1,L171
 303                     ; 81   for(i = 0; i < nr_bytes; i++)
 305  0054 5f            	clrw	x
 307  0055 201a          	jra	L102
 308  0057               L571:
 309                     ; 83     SPI->DR = DUMMY;   /* dummy byte */
 311  0057 35ff5204      	mov	20996,#255
 313  005b               L112:
 314                     ; 84     while(!(SPI->SR & SPI_SR_RXNE));
 316  005b 72015203fb    	btjf	20995,#0,L112
 317                     ; 85     buffer[i] = SPI->DR;
 319  0060 1e0a          	ldw	x,(OFST+7,sp)
 320  0062 72fb02        	addw	x,(OFST-1,sp)
 321  0065 c65204        	ld	a,20996
 322  0068 f7            	ld	(x),a
 324  0069               L122:
 325                     ; 86     while(!(SPI->SR & SPI_SR_TXE));
 327  0069 72035203fb    	btjf	20995,#1,L122
 328                     ; 81   for(i = 0; i < nr_bytes; i++)
 330  006e 1e02          	ldw	x,(OFST-1,sp)
 331  0070 5c            	incw	x
 332  0071               L102:
 333  0071 1f02          	ldw	(OFST-1,sp),x
 336  0073 130c          	cpw	x,(OFST+9,sp)
 337  0075 25e0          	jrult	L571
 339  0077               L722:
 340                     ; 88   while(SPI->SR & SPI_SR_BSY);
 342  0077 720e5203fb    	btjt	20995,#7,L722
 343                     ; 89   SPI_CS_HIGH;
 345  007c 7218500a      	bset	20490,#4
 346                     ; 90 }
 349  0080 5b03          	addw	sp,#3
 350  0082 81            	ret	
 396                     ; 92 u8 SST25VF016_Read_Byte(ExtFlashAdr addr)
 396                     ; 93 {
 397                     .text:	section	.text,new
 398  0000               _SST25VF016_Read_Byte:
 400  0000 88            	push	a
 401       00000001      OFST:	set	1
 404                     ; 95   SPI_CS_LOW;
 406  0001 7219500a      	bres	20490,#4
 407                     ; 96   DELAY_US(SPI_CS_LOW_DELAY);
 409  0005 ae000c        	ldw	x,#12
 411  0008               L22:
 412  0008 5a            	decw	X
 413  0009 26fd          	jrne	L22
 414  000b 9d            	nop	
 416                     ; 97   SPI->DR = RD;
 419  000c 35035204      	mov	20996,#3
 421  0010               L162:
 422                     ; 98   while(!(SPI->SR & SPI_SR_RXNE));
 424  0010 72015203fb    	btjf	20995,#0,L162
 425                     ; 99   tmp = SPI->DR;
 427  0015 c65204        	ld	a,20996
 429  0018               L762:
 430                     ; 100   while(!(SPI->SR & SPI_SR_TXE));
 432  0018 72035203fb    	btjf	20995,#1,L762
 433                     ; 101   SPI->DR =  addr.adr8b.HighByte;
 435  001d 7b05          	ld	a,(OFST+4,sp)
 436  001f c75204        	ld	20996,a
 438  0022               L772:
 439                     ; 102   while(!(SPI->SR & SPI_SR_RXNE));
 441  0022 72015203fb    	btjf	20995,#0,L772
 442                     ; 103   tmp = SPI->DR;
 444  0027 c65204        	ld	a,20996
 446  002a               L503:
 447                     ; 104   while(!(SPI->SR & SPI_SR_TXE));
 449  002a 72035203fb    	btjf	20995,#1,L503
 450                     ; 105   SPI->DR =  addr.adr8b.MidByte;
 452  002f 7b06          	ld	a,(OFST+5,sp)
 453  0031 c75204        	ld	20996,a
 455  0034               L513:
 456                     ; 106   while(!(SPI->SR & SPI_SR_RXNE));
 458  0034 72015203fb    	btjf	20995,#0,L513
 459                     ; 107   tmp = SPI->DR;
 461  0039 c65204        	ld	a,20996
 463  003c               L323:
 464                     ; 108   while(!(SPI->SR & SPI_SR_TXE));
 466  003c 72035203fb    	btjf	20995,#1,L323
 467                     ; 109   SPI->DR =  addr.adr8b.LowByte;
 469  0041 7b07          	ld	a,(OFST+6,sp)
 470  0043 c75204        	ld	20996,a
 472  0046               L333:
 473                     ; 110   while(!(SPI->SR & SPI_SR_RXNE));
 475  0046 72015203fb    	btjf	20995,#0,L333
 476                     ; 111   tmp = SPI->DR;
 478  004b c65204        	ld	a,20996
 480  004e               L143:
 481                     ; 112   while(!(SPI->SR & SPI_SR_TXE));
 483  004e 72035203fb    	btjf	20995,#1,L143
 484                     ; 113   SPI->DR = DUMMY;   /* dummy byte */
 486  0053 35ff5204      	mov	20996,#255
 488  0057               L153:
 489                     ; 114   while(!(SPI->SR & SPI_SR_RXNE));
 491  0057 72015203fb    	btjf	20995,#0,L153
 492                     ; 115   tmp = SPI->DR;     //Read byte
 494  005c c65204        	ld	a,20996
 495  005f 6b01          	ld	(OFST+0,sp),a
 497  0061               L163:
 498                     ; 116   while(!(SPI->SR & SPI_SR_TXE));
 500  0061 72035203fb    	btjf	20995,#1,L163
 502  0066               L763:
 503                     ; 117   while(SPI->SR & SPI_SR_BSY);
 505  0066 720e5203fb    	btjt	20995,#7,L763
 506                     ; 118   SPI_CS_HIGH;
 508  006b 7218500a      	bset	20490,#4
 509                     ; 119   return tmp;
 513  006f 5b01          	addw	sp,#1
 514  0071 81            	ret	
 587                     ; 130 void SST25VF016_Read_HS(ExtFlashAdr addr, u8* buffer, u16 nr_bytes)
 587                     ; 131 {
 588                     .text:	section	.text,new
 589  0000               _SST25VF016_Read_HS:
 591  0000 5203          	subw	sp,#3
 592       00000003      OFST:	set	3
 595                     ; 134   SPI_CS_LOW;
 597  0002 7219500a      	bres	20490,#4
 598                     ; 135   DELAY_US(SPI_CS_LOW_DELAY);
 600  0006 ae000c        	ldw	x,#12
 602  0009               L62:
 603  0009 5a            	decw	X
 604  000a 26fd          	jrne	L62
 605  000c 9d            	nop	
 607                     ; 136   SPI->DR = RD;
 610  000d 35035204      	mov	20996,#3
 612  0011               L534:
 613                     ; 137   while(!(SPI->SR & SPI_SR_RXNE));
 615  0011 72015203fb    	btjf	20995,#0,L534
 616                     ; 138   tmp = SPI->DR;
 618  0016 c65204        	ld	a,20996
 620  0019               L344:
 621                     ; 139   while(!(SPI->SR & SPI_SR_TXE));
 623  0019 72035203fb    	btjf	20995,#1,L344
 624                     ; 140   SPI->DR = addr.adr8b.HighByte;
 626  001e 7b07          	ld	a,(OFST+4,sp)
 627  0020 c75204        	ld	20996,a
 629  0023               L354:
 630                     ; 141   while(!(SPI->SR & SPI_SR_RXNE));
 632  0023 72015203fb    	btjf	20995,#0,L354
 633                     ; 142   tmp = SPI->DR;
 635  0028 c65204        	ld	a,20996
 637  002b               L164:
 638                     ; 143   while(!(SPI->SR & SPI_SR_TXE));
 640  002b 72035203fb    	btjf	20995,#1,L164
 641                     ; 144   SPI->DR = addr.adr8b.MidByte;
 643  0030 7b08          	ld	a,(OFST+5,sp)
 644  0032 c75204        	ld	20996,a
 646  0035               L174:
 647                     ; 145   while(!(SPI->SR & SPI_SR_RXNE));
 649  0035 72015203fb    	btjf	20995,#0,L174
 650                     ; 146   tmp = SPI->DR;
 652  003a c65204        	ld	a,20996
 654  003d               L774:
 655                     ; 147   while(!(SPI->SR & SPI_SR_TXE));
 657  003d 72035203fb    	btjf	20995,#1,L774
 658                     ; 148   SPI->DR = addr.adr8b.LowByte;
 660  0042 7b09          	ld	a,(OFST+6,sp)
 661  0044 c75204        	ld	20996,a
 663  0047               L705:
 664                     ; 149   while(!(SPI->SR & SPI_SR_RXNE));
 666  0047 72015203fb    	btjf	20995,#0,L705
 667                     ; 150   tmp = SPI->DR;
 669  004c c65204        	ld	a,20996
 671  004f               L515:
 672                     ; 151   while(!(SPI->SR & SPI_SR_TXE));
 674  004f 72035203fb    	btjf	20995,#1,L515
 675                     ; 152   for(i = 0; i < nr_bytes; i++)
 677  0054 5f            	clrw	x
 679  0055 201a          	jra	L525
 680  0057               L125:
 681                     ; 154     SPI->DR = DUMMY;   /* dummy byte */
 683  0057 35ff5204      	mov	20996,#255
 685  005b               L535:
 686                     ; 155     while(!(SPI->SR & SPI_SR_RXNE));
 688  005b 72015203fb    	btjf	20995,#0,L535
 689                     ; 156     buffer[i] = SPI->DR;
 691  0060 1e0a          	ldw	x,(OFST+7,sp)
 692  0062 72fb02        	addw	x,(OFST-1,sp)
 693  0065 c65204        	ld	a,20996
 694  0068 f7            	ld	(x),a
 696  0069               L545:
 697                     ; 157     while(!(SPI->SR & SPI_SR_TXE));
 699  0069 72035203fb    	btjf	20995,#1,L545
 700                     ; 152   for(i = 0; i < nr_bytes; i++)
 702  006e 1e02          	ldw	x,(OFST-1,sp)
 703  0070 5c            	incw	x
 704  0071               L525:
 705  0071 1f02          	ldw	(OFST-1,sp),x
 708  0073 130c          	cpw	x,(OFST+9,sp)
 709  0075 25e0          	jrult	L125
 711  0077               L355:
 712                     ; 159   while(SPI->SR & SPI_SR_BSY);
 714  0077 720e5203fb    	btjt	20995,#7,L355
 715                     ; 160   SPI_CS_HIGH;
 717  007c 7218500a      	bset	20490,#4
 718                     ; 161 }
 721  0080 5b03          	addw	sp,#3
 722  0082 81            	ret	
 777                     ; 170 void SST25VF016_Program_Byte(ExtFlashAdr addr, u8 data)
 777                     ; 171 {
 778                     .text:	section	.text,new
 779  0000               _SST25VF016_Program_Byte:
 781  0000 88            	push	a
 782       00000001      OFST:	set	1
 785                     ; 173   SPI_CS_LOW;
 787  0001 7219500a      	bres	20490,#4
 788                     ; 174   DELAY_US(SPI_CS_LOW_DELAY);
 790  0005 ae000c        	ldw	x,#12
 792  0008               L23:
 793  0008 5a            	decw	X
 794  0009 26fd          	jrne	L23
 795  000b 9d            	nop	
 797                     ; 175   SPI->DR = WR_EN;
 800  000c 35065204      	mov	20996,#6
 802  0010               L116:
 803                     ; 176   while(!(SPI->SR & SPI_SR_RXNE));
 805  0010 72015203fb    	btjf	20995,#0,L116
 806                     ; 177   tmp = SPI->DR;
 808  0015 c65204        	ld	a,20996
 810  0018               L716:
 811                     ; 178   while(!(SPI->SR & SPI_SR_TXE));
 813  0018 72035203fb    	btjf	20995,#1,L716
 814                     ; 179   SPI_CS_HIGH;
 816  001d 7218500a      	bset	20490,#4
 817                     ; 180   DELAY_US(SPI_CS_LOW_DELAY);
 819  0021 ae000c        	ldw	x,#12
 821  0024               L43:
 822  0024 5a            	decw	X
 823  0025 26fd          	jrne	L43
 824  0027 9d            	nop	
 826                     ; 182   SPI_CS_LOW;
 829  0028 7219500a      	bres	20490,#4
 830                     ; 183   DELAY_US(SPI_CS_LOW_DELAY);
 832  002c ae000c        	ldw	x,#12
 834  002f               L63:
 835  002f 5a            	decw	X
 836  0030 26fd          	jrne	L63
 837  0032 9d            	nop	
 839                     ; 184   SPI->DR = BYTE_PROGRAM;
 842  0033 35025204      	mov	20996,#2
 844  0037               L726:
 845                     ; 185   while(!(SPI->SR & SPI_SR_RXNE));
 847  0037 72015203fb    	btjf	20995,#0,L726
 848                     ; 186   tmp = SPI->DR;
 850  003c c65204        	ld	a,20996
 852  003f               L536:
 853                     ; 187   while(!(SPI->SR & SPI_SR_TXE));
 855  003f 72035203fb    	btjf	20995,#1,L536
 856                     ; 188   SPI->DR = addr.adr8b.HighByte;
 858  0044 7b05          	ld	a,(OFST+4,sp)
 859  0046 c75204        	ld	20996,a
 861  0049               L546:
 862                     ; 189   while(!(SPI->SR & SPI_SR_RXNE));
 864  0049 72015203fb    	btjf	20995,#0,L546
 865                     ; 190   tmp = SPI->DR;
 867  004e c65204        	ld	a,20996
 869  0051               L356:
 870                     ; 191   while(!(SPI->SR & SPI_SR_TXE));
 872  0051 72035203fb    	btjf	20995,#1,L356
 873                     ; 192   SPI->DR = addr.adr8b.MidByte;
 875  0056 7b06          	ld	a,(OFST+5,sp)
 876  0058 c75204        	ld	20996,a
 878  005b               L366:
 879                     ; 193   while(!(SPI->SR & SPI_SR_RXNE));
 881  005b 72015203fb    	btjf	20995,#0,L366
 882                     ; 194   tmp = SPI->DR;
 884  0060 c65204        	ld	a,20996
 886  0063               L176:
 887                     ; 195   while(!(SPI->SR & SPI_SR_TXE));
 889  0063 72035203fb    	btjf	20995,#1,L176
 890                     ; 196   SPI->DR = addr.adr8b.LowByte;
 892  0068 7b07          	ld	a,(OFST+6,sp)
 893  006a c75204        	ld	20996,a
 895  006d               L107:
 896                     ; 197   while(!(SPI->SR & SPI_SR_RXNE));
 898  006d 72015203fb    	btjf	20995,#0,L107
 899                     ; 198   tmp = SPI->DR;
 901  0072 c65204        	ld	a,20996
 903  0075               L707:
 904                     ; 199   while(!(SPI->SR & SPI_SR_TXE));
 906  0075 72035203fb    	btjf	20995,#1,L707
 907                     ; 200   SPI->DR = data;
 909  007a 7b08          	ld	a,(OFST+7,sp)
 910  007c c75204        	ld	20996,a
 912  007f               L717:
 913                     ; 201   while(!(SPI->SR & SPI_SR_RXNE));
 915  007f 72015203fb    	btjf	20995,#0,L717
 916                     ; 202   tmp = SPI->DR;
 918  0084 c65204        	ld	a,20996
 920  0087               L527:
 921                     ; 203   while(!(SPI->SR & SPI_SR_TXE));
 923  0087 72035203fb    	btjf	20995,#1,L527
 925  008c               L337:
 926                     ; 204   while(SPI->SR & SPI_SR_BSY);
 928  008c 720e5203fb    	btjt	20995,#7,L337
 929                     ; 205   SPI_CS_HIGH;
 931  0091 7218500a      	bset	20490,#4
 932                     ; 206   DELAY_US(DELAY_15US);
 934  0095 ae0050        	ldw	x,#80
 936  0098               L04:
 937  0098 5a            	decw	X
 938  0099 26fd          	jrne	L04
 939  009b 9d            	nop	
 941                     ; 207 }
 945  009c 84            	pop	a
 946  009d 81            	ret	
 982                     ; 217 void SST25VF016_Enable_SY(void)
 982                     ; 218 {
 983                     .text:	section	.text,new
 984  0000               _SST25VF016_Enable_SY:
 986       00000001      OFST:	set	1
 989                     ; 220   SPI_CS_LOW;
 991  0000 7219500a      	bres	20490,#4
 992                     ; 221   DELAY_US(SPI_CS_LOW_DELAY);
 994  0004 ae000c        	ldw	x,#12
 996  0007               L44:
 997  0007 5a            	decw	X
 998  0008 26fd          	jrne	L44
 999  000a 9d            	nop	
1001                     ; 222   SPI->DR = EN_SY;
1004  000b 35705204      	mov	20996,#112
1006  000f               L167:
1007                     ; 223   while(!(SPI->SR & SPI_SR_RXNE));
1009  000f 72015203fb    	btjf	20995,#0,L167
1010                     ; 224   tmp = SPI->DR;
1012  0014 c65204        	ld	a,20996
1014  0017               L767:
1015                     ; 225   while(!(SPI->SR & SPI_SR_TXE));
1017  0017 72035203fb    	btjf	20995,#1,L767
1019  001c               L577:
1020                     ; 226   while(SPI->SR & SPI_SR_BSY);
1022  001c 720e5203fb    	btjt	20995,#7,L577
1023                     ; 227   SPI_CS_HIGH;
1025  0021 7218500a      	bset	20490,#4
1026                     ; 228 }
1029  0025 81            	ret	
1065                     ; 230 void SST25VF016_Disable_SY(void)
1065                     ; 231 {
1066                     .text:	section	.text,new
1067  0000               _SST25VF016_Disable_SY:
1069       00000001      OFST:	set	1
1072                     ; 233   SPI_CS_LOW;
1074  0000 7219500a      	bres	20490,#4
1075                     ; 234   DELAY_US(SPI_CS_LOW_DELAY);
1077  0004 ae000c        	ldw	x,#12
1079  0007               L05:
1080  0007 5a            	decw	X
1081  0008 26fd          	jrne	L05
1082  000a 9d            	nop	
1084                     ; 235   SPI->DR = DIS_SY;
1087  000b 35805204      	mov	20996,#128
1089  000f               L3201:
1090                     ; 236   while(!(SPI->SR & SPI_SR_RXNE));
1092  000f 72015203fb    	btjf	20995,#0,L3201
1093                     ; 237   tmp = SPI->DR;
1095  0014 c65204        	ld	a,20996
1097  0017               L1301:
1098                     ; 238   while(!(SPI->SR & SPI_SR_TXE));
1100  0017 72035203fb    	btjf	20995,#1,L1301
1102  001c               L7301:
1103                     ; 239   while(SPI->SR & SPI_SR_BSY);
1105  001c 720e5203fb    	btjt	20995,#7,L7301
1106                     ; 240   SPI_CS_HIGH;
1108  0021 7218500a      	bset	20490,#4
1109                     ; 241 }
1112  0025 81            	ret	
1186                     ; 258 void SST25VF016_AAI_Word_Program(ExtFlashAdr addr, u8* data, u16 nr_words)
1186                     ; 259 {
1187                     .text:	section	.text,new
1188  0000               _SST25VF016_AAI_Word_Program:
1190  0000 5203          	subw	sp,#3
1191       00000003      OFST:	set	3
1194                     ; 262   SPI_CS_LOW;
1196  0002 7219500a      	bres	20490,#4
1197                     ; 263   DELAY_US(SPI_CS_LOW_DELAY);
1199  0006 ae000c        	ldw	x,#12
1201  0009               L45:
1202  0009 5a            	decw	X
1203  000a 26fd          	jrne	L45
1204  000c 9d            	nop	
1206                     ; 264   SPI->DR = WR_EN;
1209  000d 35065204      	mov	20996,#6
1211  0011               L5011:
1212                     ; 265   while(!(SPI->SR & SPI_SR_RXNE));
1214  0011 72015203fb    	btjf	20995,#0,L5011
1215                     ; 266   tmp = SPI->DR;
1217  0016 c65204        	ld	a,20996
1219  0019               L3111:
1220                     ; 267   while(!(SPI->SR & SPI_SR_TXE));
1222  0019 72035203fb    	btjf	20995,#1,L3111
1223                     ; 268   SPI_CS_HIGH;
1225  001e 7218500a      	bset	20490,#4
1226                     ; 269   DELAY_US(SPI_CS_LOW_DELAY);
1228  0022 ae000c        	ldw	x,#12
1230  0025               L65:
1231  0025 5a            	decw	X
1232  0026 26fd          	jrne	L65
1233  0028 9d            	nop	
1235                     ; 271   SPI_CS_LOW;
1238  0029 7219500a      	bres	20490,#4
1239                     ; 272   DELAY_US(SPI_CS_LOW_DELAY);
1241  002d ae000c        	ldw	x,#12
1243  0030               L06:
1244  0030 5a            	decw	X
1245  0031 26fd          	jrne	L06
1246  0033 9d            	nop	
1248                     ; 273   SPI->DR = AAI_WORD_PROGRAM;
1251  0034 35ad5204      	mov	20996,#173
1253  0038               L3211:
1254                     ; 274   while(!(SPI->SR & SPI_SR_RXNE));
1256  0038 72015203fb    	btjf	20995,#0,L3211
1257                     ; 275   tmp = SPI->DR;
1259  003d c65204        	ld	a,20996
1261  0040               L1311:
1262                     ; 276   while(!(SPI->SR & SPI_SR_TXE));
1264  0040 72035203fb    	btjf	20995,#1,L1311
1265                     ; 277   SPI->DR = addr.adr8b.HighByte;
1267  0045 7b07          	ld	a,(OFST+4,sp)
1268  0047 c75204        	ld	20996,a
1270  004a               L1411:
1271                     ; 278   while(!(SPI->SR & SPI_SR_RXNE));
1273  004a 72015203fb    	btjf	20995,#0,L1411
1274                     ; 279   tmp = SPI->DR;
1276  004f c65204        	ld	a,20996
1278  0052               L7411:
1279                     ; 280   while(!(SPI->SR & SPI_SR_TXE));
1281  0052 72035203fb    	btjf	20995,#1,L7411
1282                     ; 281   SPI->DR = addr.adr8b.MidByte;
1284  0057 7b08          	ld	a,(OFST+5,sp)
1285  0059 c75204        	ld	20996,a
1287  005c               L7511:
1288                     ; 282   while(!(SPI->SR & SPI_SR_RXNE));
1290  005c 72015203fb    	btjf	20995,#0,L7511
1291                     ; 283   tmp = SPI->DR;
1293  0061 c65204        	ld	a,20996
1295  0064               L5611:
1296                     ; 284   while(!(SPI->SR & SPI_SR_TXE));
1298  0064 72035203fb    	btjf	20995,#1,L5611
1299                     ; 285   SPI->DR = addr.adr8b.LowByte;
1301  0069 7b09          	ld	a,(OFST+6,sp)
1302  006b c75204        	ld	20996,a
1304  006e               L5711:
1305                     ; 286   while(!(SPI->SR & SPI_SR_RXNE));
1307  006e 72015203fb    	btjf	20995,#0,L5711
1308                     ; 287   tmp = SPI->DR;
1310  0073 c65204        	ld	a,20996
1312  0076               L3021:
1313                     ; 288   while(!(SPI->SR & SPI_SR_TXE));
1315  0076 72035203fb    	btjf	20995,#1,L3021
1316                     ; 289   SPI->DR = data[0]; 
1318  007b 1e0a          	ldw	x,(OFST+7,sp)
1319  007d f6            	ld	a,(x)
1320  007e c75204        	ld	20996,a
1322  0081               L3121:
1323                     ; 290   while(!(SPI->SR & SPI_SR_RXNE));
1325  0081 72015203fb    	btjf	20995,#0,L3121
1326                     ; 291   tmp = SPI->DR;
1328  0086 c65204        	ld	a,20996
1330  0089               L1221:
1331                     ; 292   while(!(SPI->SR & SPI_SR_TXE));
1333  0089 72035203fb    	btjf	20995,#1,L1221
1334                     ; 293   SPI->DR = data[1];
1336  008e e601          	ld	a,(1,x)
1337  0090 c75204        	ld	20996,a
1339  0093               L1321:
1340                     ; 294   while(!(SPI->SR & SPI_SR_RXNE));
1342  0093 72015203fb    	btjf	20995,#0,L1321
1343                     ; 295   tmp = SPI->DR;
1345  0098 c65204        	ld	a,20996
1347  009b               L7321:
1348                     ; 296   while(!(SPI->SR & SPI_SR_TXE));
1350  009b 72035203fb    	btjf	20995,#1,L7321
1351                     ; 297   SPI_CS_HIGH;
1353  00a0 7218500a      	bset	20490,#4
1354                     ; 298   DELAY_US(DELAY_15US);
1356  00a4 ae0050        	ldw	x,#80
1358  00a7               L26:
1359  00a7 5a            	decw	X
1360  00a8 26fd          	jrne	L26
1361  00aa 9d            	nop	
1363                     ; 299   for(i = 2; i < nr_words*2;)
1366  00ab ae0002        	ldw	x,#2
1367  00ae 1f01          	ldw	(OFST-2,sp),x
1369  00b0 205b          	jra	L7421
1370  00b2               L3421:
1371                     ; 301     SPI_CS_LOW;
1373  00b2 7219500a      	bres	20490,#4
1374                     ; 302     DELAY_US(SPI_CS_LOW_DELAY);
1376  00b6 ae000c        	ldw	x,#12
1378  00b9               L46:
1379  00b9 5a            	decw	X
1380  00ba 26fd          	jrne	L46
1381  00bc 9d            	nop	
1383                     ; 303     SPI->DR = AAI_WORD_PROGRAM;
1386  00bd 35ad5204      	mov	20996,#173
1388  00c1               L7521:
1389                     ; 304     while(!(SPI->SR & SPI_SR_RXNE));
1391  00c1 72015203fb    	btjf	20995,#0,L7521
1392                     ; 305     tmp = SPI->DR;
1394  00c6 c65204        	ld	a,20996
1396  00c9               L5621:
1397                     ; 306     while(!(SPI->SR & SPI_SR_TXE));
1399  00c9 72035203fb    	btjf	20995,#1,L5621
1400                     ; 307     SPI->DR = data[i++]; 
1402  00ce 1e01          	ldw	x,(OFST-2,sp)
1403  00d0 5c            	incw	x
1404  00d1 1f01          	ldw	(OFST-2,sp),x
1405  00d3 5a            	decw	x
1406  00d4 72fb0a        	addw	x,(OFST+7,sp)
1407  00d7 f6            	ld	a,(x)
1408  00d8 c75204        	ld	20996,a
1410  00db               L5721:
1411                     ; 308     while(!(SPI->SR & SPI_SR_RXNE));
1413  00db 72015203fb    	btjf	20995,#0,L5721
1414                     ; 309     tmp = SPI->DR;
1416  00e0 c65204        	ld	a,20996
1418  00e3               L3031:
1419                     ; 310     while(!(SPI->SR & SPI_SR_TXE));
1421  00e3 72035203fb    	btjf	20995,#1,L3031
1422                     ; 311     SPI->DR = data[i++];
1424  00e8 1e01          	ldw	x,(OFST-2,sp)
1425  00ea 5c            	incw	x
1426  00eb 1f01          	ldw	(OFST-2,sp),x
1427  00ed 5a            	decw	x
1428  00ee 72fb0a        	addw	x,(OFST+7,sp)
1429  00f1 f6            	ld	a,(x)
1430  00f2 c75204        	ld	20996,a
1432  00f5               L3131:
1433                     ; 312     while(!(SPI->SR & SPI_SR_RXNE));
1435  00f5 72015203fb    	btjf	20995,#0,L3131
1436                     ; 313     tmp = SPI->DR;
1438  00fa c65204        	ld	a,20996
1440  00fd               L1231:
1441                     ; 314     while(!(SPI->SR & SPI_SR_TXE));
1443  00fd 72035203fb    	btjf	20995,#1,L1231
1444                     ; 315     SPI_CS_HIGH;
1446  0102 7218500a      	bset	20490,#4
1447                     ; 316     DELAY_US(DELAY_15US);
1449  0106 ae0050        	ldw	x,#80
1451  0109               L66:
1452  0109 5a            	decw	X
1453  010a 26fd          	jrne	L66
1454  010c 9d            	nop	
1457  010d               L7421:
1458                     ; 299   for(i = 2; i < nr_words*2;)
1460  010d 1e0c          	ldw	x,(OFST+9,sp)
1461  010f 58            	sllw	x
1462  0110 1301          	cpw	x,(OFST-2,sp)
1463  0112 229e          	jrugt	L3421
1464                     ; 319   SPI_CS_LOW;
1466  0114 7219500a      	bres	20490,#4
1467                     ; 320   DELAY_US(SPI_CS_LOW_DELAY);
1469  0118 ae000c        	ldw	x,#12
1471  011b               L07:
1472  011b 5a            	decw	X
1473  011c 26fd          	jrne	L07
1474  011e 9d            	nop	
1476                     ; 321   SPI->DR = WR_DIS;    /* Exit AAI mode */
1479  011f 35045204      	mov	20996,#4
1481  0123               L1331:
1482                     ; 322   while(!(SPI->SR & SPI_SR_RXNE));
1484  0123 72015203fb    	btjf	20995,#0,L1331
1485                     ; 323   tmp = SPI->DR;
1487  0128 c65204        	ld	a,20996
1489  012b               L7331:
1490                     ; 324   while(!(SPI->SR & SPI_SR_TXE));
1492  012b 72035203fb    	btjf	20995,#1,L7331
1494  0130               L5431:
1495                     ; 325   while(SPI->SR & SPI_SR_BSY);
1497  0130 720e5203fb    	btjt	20995,#7,L5431
1498                     ; 326   SPI_CS_HIGH;
1500  0135 7218500a      	bset	20490,#4
1501                     ; 327   DELAY_US(DELAY_15US);
1503  0139 ae0050        	ldw	x,#80
1505  013c               L27:
1506  013c 5a            	decw	X
1507  013d 26fd          	jrne	L27
1508  013f 9d            	nop	
1510                     ; 328 }
1514  0140 5b03          	addw	sp,#3
1515  0142 81            	ret	
1561                     ; 339 void SST25VF016_Sector_Erase_4KB(ExtFlashAdr addr)
1561                     ; 340 {
1562                     .text:	section	.text,new
1563  0000               _SST25VF016_Sector_Erase_4KB:
1565  0000 88            	push	a
1566       00000001      OFST:	set	1
1569                     ; 342   SPI_CS_LOW;
1571  0001 7219500a      	bres	20490,#4
1572                     ; 343   DELAY_US(SPI_CS_LOW_DELAY);
1574  0005 ae000c        	ldw	x,#12
1576  0008               L67:
1577  0008 5a            	decw	X
1578  0009 26fd          	jrne	L67
1579  000b 9d            	nop	
1581                     ; 344   SPI->DR = WR_EN;
1584  000c 35065204      	mov	20996,#6
1586  0010               L7731:
1587                     ; 345   while(!(SPI->SR & SPI_SR_RXNE));
1589  0010 72015203fb    	btjf	20995,#0,L7731
1590                     ; 346   tmp = SPI->DR;
1592  0015 c65204        	ld	a,20996
1594  0018               L5041:
1595                     ; 347   while(!(SPI->SR & SPI_SR_TXE));
1597  0018 72035203fb    	btjf	20995,#1,L5041
1598                     ; 348   SPI_CS_HIGH;
1600  001d 7218500a      	bset	20490,#4
1601                     ; 349   DELAY_US(SPI_CS_LOW_DELAY);
1603  0021 ae000c        	ldw	x,#12
1605  0024               L001:
1606  0024 5a            	decw	X
1607  0025 26fd          	jrne	L001
1608  0027 9d            	nop	
1610                     ; 351   SPI_CS_LOW;
1613  0028 7219500a      	bres	20490,#4
1614                     ; 352   DELAY_US(SPI_CS_LOW_DELAY);
1616  002c ae000c        	ldw	x,#12
1618  002f               L201:
1619  002f 5a            	decw	X
1620  0030 26fd          	jrne	L201
1621  0032 9d            	nop	
1623                     ; 353   SPI->DR = SEC_ERASE_4KB;
1626  0033 35205204      	mov	20996,#32
1628  0037               L5141:
1629                     ; 354   while(!(SPI->SR & SPI_SR_RXNE));
1631  0037 72015203fb    	btjf	20995,#0,L5141
1632                     ; 355   tmp = SPI->DR;
1634  003c c65204        	ld	a,20996
1636  003f               L3241:
1637                     ; 356   while(!(SPI->SR & SPI_SR_TXE));
1639  003f 72035203fb    	btjf	20995,#1,L3241
1640                     ; 357   SPI->DR = addr.adr8b.HighByte;
1642  0044 7b05          	ld	a,(OFST+4,sp)
1643  0046 c75204        	ld	20996,a
1645  0049               L3341:
1646                     ; 358   while(!(SPI->SR & SPI_SR_RXNE));
1648  0049 72015203fb    	btjf	20995,#0,L3341
1649                     ; 359   tmp = SPI->DR;
1651  004e c65204        	ld	a,20996
1653  0051               L1441:
1654                     ; 360   while(!(SPI->SR & SPI_SR_TXE));
1656  0051 72035203fb    	btjf	20995,#1,L1441
1657                     ; 361   SPI->DR = addr.adr8b.MidByte;
1659  0056 7b06          	ld	a,(OFST+5,sp)
1660  0058 c75204        	ld	20996,a
1662  005b               L1541:
1663                     ; 362   while(!(SPI->SR & SPI_SR_RXNE));
1665  005b 72015203fb    	btjf	20995,#0,L1541
1666                     ; 363   tmp = SPI->DR;
1668  0060 c65204        	ld	a,20996
1670  0063               L7541:
1671                     ; 364   while(!(SPI->SR & SPI_SR_TXE));
1673  0063 72035203fb    	btjf	20995,#1,L7541
1674                     ; 365   SPI->DR = addr.adr8b.LowByte;
1676  0068 7b07          	ld	a,(OFST+6,sp)
1677  006a c75204        	ld	20996,a
1679  006d               L7641:
1680                     ; 366   while(!(SPI->SR & SPI_SR_RXNE));
1682  006d 72015203fb    	btjf	20995,#0,L7641
1683                     ; 367   tmp = SPI->DR;
1685  0072 c65204        	ld	a,20996
1687  0075               L5741:
1688                     ; 368   while(!(SPI->SR & SPI_SR_TXE));
1690  0075 72035203fb    	btjf	20995,#1,L5741
1692  007a               L3051:
1693                     ; 369   while(SPI->SR & SPI_SR_BSY);
1695  007a 720e5203fb    	btjt	20995,#7,L3051
1696                     ; 370   SPI_CS_HIGH;
1698  007f 7218500a      	bset	20490,#4
1699                     ; 371 }
1702  0083 84            	pop	a
1703  0084 81            	ret	
1749                     ; 386 void SST25VF016_Block_Erase_32KB(ExtFlashAdr addr)
1749                     ; 387 {
1750                     .text:	section	.text,new
1751  0000               _SST25VF016_Block_Erase_32KB:
1753  0000 88            	push	a
1754       00000001      OFST:	set	1
1757                     ; 389   SPI_CS_LOW;
1759  0001 7219500a      	bres	20490,#4
1760                     ; 390   DELAY_US(SPI_CS_LOW_DELAY);
1762  0005 ae000c        	ldw	x,#12
1764  0008               L601:
1765  0008 5a            	decw	X
1766  0009 26fd          	jrne	L601
1767  000b 9d            	nop	
1769                     ; 391   SPI->DR = WR_EN;
1772  000c 35065204      	mov	20996,#6
1774  0010               L5351:
1775                     ; 392   while(!(SPI->SR & SPI_SR_RXNE));
1777  0010 72015203fb    	btjf	20995,#0,L5351
1778                     ; 393   tmp = SPI->DR;
1780  0015 c65204        	ld	a,20996
1782  0018               L3451:
1783                     ; 394   while(!(SPI->SR & SPI_SR_TXE));
1785  0018 72035203fb    	btjf	20995,#1,L3451
1786                     ; 395   SPI_CS_HIGH;
1788  001d 7218500a      	bset	20490,#4
1789                     ; 396   DELAY_US(SPI_CS_LOW_DELAY);
1791  0021 ae000c        	ldw	x,#12
1793  0024               L011:
1794  0024 5a            	decw	X
1795  0025 26fd          	jrne	L011
1796  0027 9d            	nop	
1798                     ; 398   SPI_CS_LOW;
1801  0028 7219500a      	bres	20490,#4
1802                     ; 399   DELAY_US(SPI_CS_LOW_DELAY);
1804  002c ae000c        	ldw	x,#12
1806  002f               L211:
1807  002f 5a            	decw	X
1808  0030 26fd          	jrne	L211
1809  0032 9d            	nop	
1811                     ; 400   SPI->DR = SEC_ERASE_32KB;
1814  0033 35525204      	mov	20996,#82
1816  0037               L3551:
1817                     ; 401   while(!(SPI->SR & SPI_SR_RXNE));
1819  0037 72015203fb    	btjf	20995,#0,L3551
1820                     ; 402   tmp = SPI->DR;
1822  003c c65204        	ld	a,20996
1824  003f               L1651:
1825                     ; 403   while(!(SPI->SR & SPI_SR_TXE));
1827  003f 72035203fb    	btjf	20995,#1,L1651
1828                     ; 404   SPI->DR = addr.adr8b.HighByte;
1830  0044 7b05          	ld	a,(OFST+4,sp)
1831  0046 c75204        	ld	20996,a
1833  0049               L1751:
1834                     ; 405   while(!(SPI->SR & SPI_SR_RXNE));
1836  0049 72015203fb    	btjf	20995,#0,L1751
1837                     ; 406   tmp = SPI->DR;
1839  004e c65204        	ld	a,20996
1841  0051               L7751:
1842                     ; 407   while(!(SPI->SR & SPI_SR_TXE));
1844  0051 72035203fb    	btjf	20995,#1,L7751
1845                     ; 408   SPI->DR = addr.adr8b.MidByte;
1847  0056 7b06          	ld	a,(OFST+5,sp)
1848  0058 c75204        	ld	20996,a
1850  005b               L7061:
1851                     ; 409   while(!(SPI->SR & SPI_SR_RXNE));
1853  005b 72015203fb    	btjf	20995,#0,L7061
1854                     ; 410   tmp = SPI->DR;
1856  0060 c65204        	ld	a,20996
1858  0063               L5161:
1859                     ; 411   while(!(SPI->SR & SPI_SR_TXE));
1861  0063 72035203fb    	btjf	20995,#1,L5161
1862                     ; 412   SPI->DR = addr.adr8b.LowByte;
1864  0068 7b07          	ld	a,(OFST+6,sp)
1865  006a c75204        	ld	20996,a
1867  006d               L5261:
1868                     ; 413   while(!(SPI->SR & SPI_SR_RXNE));
1870  006d 72015203fb    	btjf	20995,#0,L5261
1871                     ; 414   tmp = SPI->DR;
1873  0072 c65204        	ld	a,20996
1875  0075               L3361:
1876                     ; 415   while(!(SPI->SR & SPI_SR_TXE));
1878  0075 72035203fb    	btjf	20995,#1,L3361
1880  007a               L1461:
1881                     ; 416   while(SPI->SR & SPI_SR_BSY);
1883  007a 720e5203fb    	btjt	20995,#7,L1461
1884                     ; 417   SPI_CS_HIGH;
1886  007f 7218500a      	bset	20490,#4
1887                     ; 418 }
1890  0083 84            	pop	a
1891  0084 81            	ret	
1937                     ; 420 void SST25VF016_Block_Erase_64KB(ExtFlashAdr addr)
1937                     ; 421 {
1938                     .text:	section	.text,new
1939  0000               _SST25VF016_Block_Erase_64KB:
1941  0000 88            	push	a
1942       00000001      OFST:	set	1
1945                     ; 423   SPI_CS_LOW;
1947  0001 7219500a      	bres	20490,#4
1948                     ; 424   DELAY_US(SPI_CS_LOW_DELAY);
1950  0005 ae000c        	ldw	x,#12
1952  0008               L611:
1953  0008 5a            	decw	X
1954  0009 26fd          	jrne	L611
1955  000b 9d            	nop	
1957                     ; 425   SPI->DR = WR_EN;
1960  000c 35065204      	mov	20996,#6
1962  0010               L3761:
1963                     ; 426   while(!(SPI->SR & SPI_SR_RXNE));
1965  0010 72015203fb    	btjf	20995,#0,L3761
1966                     ; 427   tmp = SPI->DR;
1968  0015 c65204        	ld	a,20996
1970  0018               L1071:
1971                     ; 428   while(!(SPI->SR & SPI_SR_TXE));
1973  0018 72035203fb    	btjf	20995,#1,L1071
1974                     ; 429   SPI_CS_HIGH;
1976  001d 7218500a      	bset	20490,#4
1977                     ; 430   DELAY_US(SPI_CS_LOW_DELAY);
1979  0021 ae000c        	ldw	x,#12
1981  0024               L021:
1982  0024 5a            	decw	X
1983  0025 26fd          	jrne	L021
1984  0027 9d            	nop	
1986                     ; 432   SPI_CS_LOW;
1989  0028 7219500a      	bres	20490,#4
1990                     ; 433   DELAY_US(SPI_CS_LOW_DELAY);
1992  002c ae000c        	ldw	x,#12
1994  002f               L221:
1995  002f 5a            	decw	X
1996  0030 26fd          	jrne	L221
1997  0032 9d            	nop	
1999                     ; 434   SPI->DR = SEC_ERASE_64KB;
2002  0033 35d85204      	mov	20996,#216
2004  0037               L1171:
2005                     ; 435   while(!(SPI->SR & SPI_SR_RXNE));
2007  0037 72015203fb    	btjf	20995,#0,L1171
2008                     ; 436   tmp = SPI->DR;
2010  003c c65204        	ld	a,20996
2012  003f               L7171:
2013                     ; 437   while(!(SPI->SR & SPI_SR_TXE));
2015  003f 72035203fb    	btjf	20995,#1,L7171
2016                     ; 438   SPI->DR = addr.adr8b.HighByte;
2018  0044 7b05          	ld	a,(OFST+4,sp)
2019  0046 c75204        	ld	20996,a
2021  0049               L7271:
2022                     ; 439   while(!(SPI->SR & SPI_SR_RXNE));
2024  0049 72015203fb    	btjf	20995,#0,L7271
2025                     ; 440   tmp = SPI->DR;
2027  004e c65204        	ld	a,20996
2029  0051               L5371:
2030                     ; 441   while(!(SPI->SR & SPI_SR_TXE));
2032  0051 72035203fb    	btjf	20995,#1,L5371
2033                     ; 442   SPI->DR = addr.adr8b.MidByte;
2035  0056 7b06          	ld	a,(OFST+5,sp)
2036  0058 c75204        	ld	20996,a
2038  005b               L5471:
2039                     ; 443   while(!(SPI->SR & SPI_SR_RXNE));
2041  005b 72015203fb    	btjf	20995,#0,L5471
2042                     ; 444   tmp = SPI->DR;
2044  0060 c65204        	ld	a,20996
2046  0063               L3571:
2047                     ; 445   while(!(SPI->SR & SPI_SR_TXE));
2049  0063 72035203fb    	btjf	20995,#1,L3571
2050                     ; 446   SPI->DR = addr.adr8b.LowByte;
2052  0068 7b07          	ld	a,(OFST+6,sp)
2053  006a c75204        	ld	20996,a
2055  006d               L3671:
2056                     ; 447   while(!(SPI->SR & SPI_SR_RXNE));
2058  006d 72015203fb    	btjf	20995,#0,L3671
2059                     ; 448   tmp = SPI->DR;
2061  0072 c65204        	ld	a,20996
2063  0075               L1771:
2064                     ; 449   while(!(SPI->SR & SPI_SR_TXE));
2066  0075 72035203fb    	btjf	20995,#1,L1771
2068  007a               L7771:
2069                     ; 450   while(SPI->SR & SPI_SR_BSY);
2071  007a 720e5203fb    	btjt	20995,#7,L7771
2072                     ; 451   SPI_CS_HIGH;
2074  007f 7218500a      	bset	20490,#4
2075                     ; 452 }
2078  0083 84            	pop	a
2079  0084 81            	ret	
2115                     ; 461 void SST25VF016_Chip_Erase()
2115                     ; 462 {
2116                     .text:	section	.text,new
2117  0000               _SST25VF016_Chip_Erase:
2119       00000001      OFST:	set	1
2122                     ; 464   SPI_CS_LOW;
2124  0000 7219500a      	bres	20490,#4
2125                     ; 465   DELAY_US(SPI_CS_LOW_DELAY);
2127  0004 ae000c        	ldw	x,#12
2129  0007               L621:
2130  0007 5a            	decw	X
2131  0008 26fd          	jrne	L621
2132  000a 9d            	nop	
2134                     ; 466   SPI->DR = WR_EN;
2137  000b 35065204      	mov	20996,#6
2139  000f               L5202:
2140                     ; 467   while(!(SPI->SR & SPI_SR_RXNE));
2142  000f 72015203fb    	btjf	20995,#0,L5202
2143                     ; 468   tmp = SPI->DR;
2145  0014 c65204        	ld	a,20996
2147  0017               L3302:
2148                     ; 469   while(!(SPI->SR & SPI_SR_TXE));
2150  0017 72035203fb    	btjf	20995,#1,L3302
2151                     ; 470   SPI_CS_HIGH;
2153  001c 7218500a      	bset	20490,#4
2154                     ; 471   DELAY_US(SPI_CS_LOW_DELAY);
2156  0020 ae000c        	ldw	x,#12
2158  0023               L031:
2159  0023 5a            	decw	X
2160  0024 26fd          	jrne	L031
2161  0026 9d            	nop	
2163                     ; 473   SPI_CS_LOW;
2166  0027 7219500a      	bres	20490,#4
2167                     ; 474   DELAY_US(SPI_CS_LOW_DELAY);
2169  002b ae000c        	ldw	x,#12
2171  002e               L231:
2172  002e 5a            	decw	X
2173  002f 26fd          	jrne	L231
2174  0031 9d            	nop	
2176                     ; 475   SPI->DR = CHIP_ERASE;
2179  0032 35605204      	mov	20996,#96
2181  0036               L3402:
2182                     ; 476   while(!(SPI->SR & SPI_SR_RXNE));
2184  0036 72015203fb    	btjf	20995,#0,L3402
2185                     ; 477   tmp = SPI->DR;
2187  003b c65204        	ld	a,20996
2189  003e               L1502:
2190                     ; 478   while(!(SPI->SR & SPI_SR_TXE));
2192  003e 72035203fb    	btjf	20995,#1,L1502
2194  0043               L7502:
2195                     ; 479   while(SPI->SR & SPI_SR_BSY);
2197  0043 720e5203fb    	btjt	20995,#7,L7502
2198                     ; 480   SPI_CS_HIGH;
2200  0048 7218500a      	bset	20490,#4
2201                     ; 481 }
2204  004c 81            	ret	
2249                     ; 494 void SST25VF016_Write_Status_Register(u8 data)
2249                     ; 495 {
2250                     .text:	section	.text,new
2251  0000               _SST25VF016_Write_Status_Register:
2253  0000 88            	push	a
2254  0001 88            	push	a
2255       00000001      OFST:	set	1
2258                     ; 497   SPI_CS_LOW;
2260  0002 7219500a      	bres	20490,#4
2261                     ; 498   DELAY_US(SPI_CS_LOW_DELAY);
2263  0006 ae000c        	ldw	x,#12
2265  0009               L631:
2266  0009 5a            	decw	X
2267  000a 26fd          	jrne	L631
2268  000c 9d            	nop	
2270                     ; 499   SPI->DR = EN_WR_STAT_REG;
2273  000d 35505204      	mov	20996,#80
2275  0011               L1112:
2276                     ; 500   while(!(SPI->SR & SPI_SR_RXNE));
2278  0011 72015203fb    	btjf	20995,#0,L1112
2279                     ; 501   tmp = SPI->DR;
2281  0016 c65204        	ld	a,20996
2283  0019               L7112:
2284                     ; 502   while(!(SPI->SR & SPI_SR_TXE));
2286  0019 72035203fb    	btjf	20995,#1,L7112
2287                     ; 503   SPI_CS_HIGH;
2289  001e 7218500a      	bset	20490,#4
2290                     ; 504   DELAY_US(SPI_CS_LOW_DELAY);
2292  0022 ae000c        	ldw	x,#12
2294  0025               L041:
2295  0025 5a            	decw	X
2296  0026 26fd          	jrne	L041
2297  0028 9d            	nop	
2299                     ; 506   SPI_CS_LOW;
2302  0029 7219500a      	bres	20490,#4
2303                     ; 507   DELAY_US(SPI_CS_LOW_DELAY);
2305  002d ae000c        	ldw	x,#12
2307  0030               L241:
2308  0030 5a            	decw	X
2309  0031 26fd          	jrne	L241
2310  0033 9d            	nop	
2312                     ; 508   SPI->DR = WR_STAT_REG;
2315  0034 35015204      	mov	20996,#1
2317  0038               L7212:
2318                     ; 509   while(!(SPI->SR & SPI_SR_RXNE));
2320  0038 72015203fb    	btjf	20995,#0,L7212
2321                     ; 510   tmp = SPI->DR;
2323  003d c65204        	ld	a,20996
2325  0040               L5312:
2326                     ; 511   while(!(SPI->SR & SPI_SR_TXE));
2328  0040 72035203fb    	btjf	20995,#1,L5312
2329                     ; 512   SPI->DR = data;
2331  0045 7b02          	ld	a,(OFST+1,sp)
2332  0047 c75204        	ld	20996,a
2334  004a               L5412:
2335                     ; 513   while(!(SPI->SR & SPI_SR_RXNE));
2337  004a 72015203fb    	btjf	20995,#0,L5412
2338                     ; 514   tmp = SPI->DR;
2340  004f c65204        	ld	a,20996
2342  0052               L3512:
2343                     ; 515   while(!(SPI->SR & SPI_SR_TXE));
2345  0052 72035203fb    	btjf	20995,#1,L3512
2347  0057               L1612:
2348                     ; 516   while(SPI->SR & SPI_SR_BSY);
2350  0057 720e5203fb    	btjt	20995,#7,L1612
2351                     ; 517   SPI_CS_HIGH;
2353  005c 7218500a      	bset	20490,#4
2354                     ; 518 }
2357  0060 85            	popw	x
2358  0061 81            	ret	
2394                     ; 526 u8 SST25VF016_Read_Status_Register()
2394                     ; 527 {
2395                     .text:	section	.text,new
2396  0000               _SST25VF016_Read_Status_Register:
2398  0000 88            	push	a
2399       00000001      OFST:	set	1
2402                     ; 529   SPI_CS_LOW;
2404  0001 7219500a      	bres	20490,#4
2405                     ; 530   DELAY_US(SPI_CS_LOW_DELAY);
2407  0005 ae000c        	ldw	x,#12
2409  0008               L641:
2410  0008 5a            	decw	X
2411  0009 26fd          	jrne	L641
2412  000b 9d            	nop	
2414                     ; 531   SPI->DR = RD_STAT_REG;
2417  000c 35055204      	mov	20996,#5
2419  0010               L7022:
2420                     ; 532   while(!(SPI->SR & SPI_SR_RXNE));
2422  0010 72015203fb    	btjf	20995,#0,L7022
2423                     ; 533   tmp = SPI->DR;
2425  0015 c65204        	ld	a,20996
2427  0018               L5122:
2428                     ; 534   while(!(SPI->SR & SPI_SR_TXE));
2430  0018 72035203fb    	btjf	20995,#1,L5122
2431                     ; 535   SPI->DR = DUMMY;   //dummy
2433  001d 35ff5204      	mov	20996,#255
2435  0021               L5222:
2436                     ; 536   while(!(SPI->SR & SPI_SR_RXNE));
2438  0021 72015203fb    	btjf	20995,#0,L5222
2439                     ; 537   tmp = SPI->DR;     //read status register
2441  0026 c65204        	ld	a,20996
2442  0029 6b01          	ld	(OFST+0,sp),a
2444  002b               L5322:
2445                     ; 538   while(!(SPI->SR & SPI_SR_TXE));
2447  002b 72035203fb    	btjf	20995,#1,L5322
2449  0030               L3422:
2450                     ; 539   while(SPI->SR & SPI_SR_BSY);
2452  0030 720e5203fb    	btjt	20995,#7,L3422
2453                     ; 540   SPI_CS_HIGH;
2455  0035 7218500a      	bset	20490,#4
2456                     ; 541   return tmp;
2460  0039 5b01          	addw	sp,#1
2461  003b 81            	ret	
2507                     ; 551 void SST25VF016_Read_JEDEC_ID(u8* buffer)
2507                     ; 552 {
2508                     .text:	section	.text,new
2509  0000               _SST25VF016_Read_JEDEC_ID:
2511  0000 89            	pushw	x
2512  0001 88            	push	a
2513       00000001      OFST:	set	1
2516                     ; 554   SPI_CS_LOW;
2518  0002 7219500a      	bres	20490,#4
2519                     ; 555   DELAY_US(SPI_CS_LOW_DELAY);
2521  0006 ae000c        	ldw	x,#12
2523  0009               L251:
2524  0009 5a            	decw	X
2525  000a 26fd          	jrne	L251
2526  000c 9d            	nop	
2528                     ; 556   SPI->DR = RD_JEDEC_ID;
2531  000d 359f5204      	mov	20996,#159
2533  0011               L5722:
2534                     ; 557   while(!(SPI->SR & SPI_SR_RXNE));
2536  0011 72015203fb    	btjf	20995,#0,L5722
2537                     ; 558   tmp = SPI->DR;
2539  0016 c65204        	ld	a,20996
2541  0019               L3032:
2542                     ; 559   while(!(SPI->SR & SPI_SR_TXE));
2544  0019 72035203fb    	btjf	20995,#1,L3032
2545                     ; 560   SPI->DR = DUMMY;   //dummy
2547  001e 35ff5204      	mov	20996,#255
2549  0022               L3132:
2550                     ; 561   while(!(SPI->SR & SPI_SR_RXNE));
2552  0022 72015203fb    	btjf	20995,#0,L3132
2553                     ; 562   buffer[0] = SPI->DR;
2555  0027 1e02          	ldw	x,(OFST+1,sp)
2556  0029 c65204        	ld	a,20996
2557  002c f7            	ld	(x),a
2559  002d               L3232:
2560                     ; 563   while(!(SPI->SR & SPI_SR_TXE));
2562  002d 72035203fb    	btjf	20995,#1,L3232
2563                     ; 564   SPI->DR = DUMMY;   //dummy
2565  0032 35ff5204      	mov	20996,#255
2567  0036               L3332:
2568                     ; 565   while(!(SPI->SR & SPI_SR_RXNE));
2570  0036 72015203fb    	btjf	20995,#0,L3332
2571                     ; 566   buffer[1] = SPI->DR;
2573  003b c65204        	ld	a,20996
2574  003e e701          	ld	(1,x),a
2576  0040               L3432:
2577                     ; 567   while(!(SPI->SR & SPI_SR_TXE));
2579  0040 72035203fb    	btjf	20995,#1,L3432
2580                     ; 568   SPI->DR = DUMMY;   //dummy
2582  0045 35ff5204      	mov	20996,#255
2584  0049               L3532:
2585                     ; 569   while(!(SPI->SR & SPI_SR_RXNE));
2587  0049 72015203fb    	btjf	20995,#0,L3532
2588                     ; 570   buffer[2] = SPI->DR;
2590  004e c65204        	ld	a,20996
2591  0051 e702          	ld	(2,x),a
2593  0053               L3632:
2594                     ; 571   while(!(SPI->SR & SPI_SR_TXE));
2596  0053 72035203fb    	btjf	20995,#1,L3632
2598  0058               L1732:
2599                     ; 572   while(SPI->SR & SPI_SR_BSY);
2601  0058 720e5203fb    	btjt	20995,#7,L1732
2602                     ; 573   SPI_CS_HIGH;
2604  005d 7218500a      	bset	20490,#4
2605                     ; 574 }
2608  0061 5b03          	addw	sp,#3
2609  0063 81            	ret	
2654                     ; 583 void SST25VF016_Read_ID(u8* buffer)
2654                     ; 584 {
2655                     .text:	section	.text,new
2656  0000               _SST25VF016_Read_ID:
2658  0000 89            	pushw	x
2659  0001 88            	push	a
2660       00000001      OFST:	set	1
2663                     ; 586   SPI_CS_LOW;
2665  0002 7219500a      	bres	20490,#4
2666                     ; 587   DELAY_US(SPI_CS_LOW_DELAY);
2668  0006 ae000c        	ldw	x,#12
2670  0009               L651:
2671  0009 5a            	decw	X
2672  000a 26fd          	jrne	L651
2673  000c 9d            	nop	
2675                     ; 588   SPI->DR = RD_ID;
2678  000d 35905204      	mov	20996,#144
2680  0011               L3242:
2681                     ; 589   while(!(SPI->SR & SPI_SR_RXNE));
2683  0011 72015203fb    	btjf	20995,#0,L3242
2684                     ; 590   tmp = SPI->DR;
2686  0016 c65204        	ld	a,20996
2688  0019               L1342:
2689                     ; 591   while(!(SPI->SR & SPI_SR_TXE));
2691  0019 72035203fb    	btjf	20995,#1,L1342
2692                     ; 592   SPI->DR = 0x00;    //address
2694  001e 725f5204      	clr	20996
2696  0022               L1442:
2697                     ; 593   while(!(SPI->SR & SPI_SR_RXNE));
2699  0022 72015203fb    	btjf	20995,#0,L1442
2700                     ; 594   tmp = SPI->DR;
2702  0027 c65204        	ld	a,20996
2704  002a               L7442:
2705                     ; 595   while(!(SPI->SR & SPI_SR_TXE));
2707  002a 72035203fb    	btjf	20995,#1,L7442
2708                     ; 596   SPI->DR = 0x00;   //address
2710  002f 725f5204      	clr	20996
2712  0033               L7542:
2713                     ; 597   while(!(SPI->SR & SPI_SR_RXNE));
2715  0033 72015203fb    	btjf	20995,#0,L7542
2716                     ; 598   tmp = SPI->DR;
2718  0038 c65204        	ld	a,20996
2720  003b               L5642:
2721                     ; 599   while(!(SPI->SR & SPI_SR_TXE));
2723  003b 72035203fb    	btjf	20995,#1,L5642
2724                     ; 600   SPI->DR = 0x00;   //address
2726  0040 725f5204      	clr	20996
2728  0044               L5742:
2729                     ; 601   while(!(SPI->SR & SPI_SR_RXNE)); 
2731  0044 72015203fb    	btjf	20995,#0,L5742
2732                     ; 602   tmp = SPI->DR; 
2734  0049 c65204        	ld	a,20996
2736  004c               L3052:
2737                     ; 603   while(!(SPI->SR & SPI_SR_TXE));
2739  004c 72035203fb    	btjf	20995,#1,L3052
2740                     ; 604   SPI->DR = DUMMY;   //dummy
2742  0051 35ff5204      	mov	20996,#255
2744  0055               L3152:
2745                     ; 605   while(!(SPI->SR & SPI_SR_RXNE));
2747  0055 72015203fb    	btjf	20995,#0,L3152
2748                     ; 606   buffer[0] = SPI->DR;
2750  005a 1e02          	ldw	x,(OFST+1,sp)
2751  005c c65204        	ld	a,20996
2752  005f f7            	ld	(x),a
2754  0060               L3252:
2755                     ; 607   while(!(SPI->SR & SPI_SR_TXE));
2757  0060 72035203fb    	btjf	20995,#1,L3252
2758                     ; 608   SPI->DR = DUMMY;   //dummy
2760  0065 35ff5204      	mov	20996,#255
2762  0069               L3352:
2763                     ; 609   while(!(SPI->SR & SPI_SR_RXNE));
2765  0069 72015203fb    	btjf	20995,#0,L3352
2766                     ; 610   buffer[1] = SPI->DR;
2768  006e c65204        	ld	a,20996
2769  0071 e701          	ld	(1,x),a
2771  0073               L3452:
2772                     ; 611   while(!(SPI->SR & SPI_SR_TXE));
2774  0073 72035203fb    	btjf	20995,#1,L3452
2776  0078               L1552:
2777                     ; 612   while(SPI->SR & SPI_SR_BSY);
2779  0078 720e5203fb    	btjt	20995,#7,L1552
2780                     ; 613   SPI_CS_HIGH;
2782  007d 7218500a      	bset	20490,#4
2783                     ; 614 }
2786  0081 5b03          	addw	sp,#3
2787  0083 81            	ret	
2800                     	xdef	_SST25VF016_Read_ID
2801                     	xdef	_SST25VF016_Read_JEDEC_ID
2802                     	xdef	_SST25VF016_Read_Status_Register
2803                     	xdef	_SST25VF016_Write_Status_Register
2804                     	xdef	_SST25VF016_Chip_Erase
2805                     	xdef	_SST25VF016_Block_Erase_64KB
2806                     	xdef	_SST25VF016_Block_Erase_32KB
2807                     	xdef	_SST25VF016_Sector_Erase_4KB
2808                     	xdef	_SST25VF016_AAI_Word_Program
2809                     	xdef	_SST25VF016_Disable_SY
2810                     	xdef	_SST25VF016_Enable_SY
2811                     	xdef	_SST25VF016_Program_Byte
2812                     	xdef	_SST25VF016_Read_HS
2813                     	xdef	_SST25VF016_Read_Byte
2814                     	xdef	_SST25VF016_Read
2815                     	xdef	_SST25VF016_Init
2816                     	xref	_SPI_Cmd
2817                     	xref	_SPI_Init
2818                     	xref	_SPI_DeInit
2837                     	end
