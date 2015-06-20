   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  22                     	bsct
  23  0000               _RTC_sec:
  24  0000 00            	dc.b	0
  25  0001               _RTC_min:
  26  0001 00            	dc.b	0
  27  0002               _RTC_hour:
  28  0002 00            	dc.b	0
  29  0003               _RTC_day:
  30  0003 00            	dc.b	0
  31  0004               _RTC_date:
  32  0004 00            	dc.b	0
  33  0005               _RTC_month:
  34  0005 00            	dc.b	0
  35  0006               _RTC_year:
  36  0006 00            	dc.b	0
  37  0007               _RTC_temp:
  38  0007 0000          	dc.w	0
  79                     ; 29 void DS3231M_Flush(u8 cycles)
  79                     ; 30 {
  81                     .text:	section	.text,new
  82  0000               _DS3231M_Flush:
  86                     ; 31   I2C_Flush(cycles);
  89                     ; 32 }
  92  0000 cc0000        	jp	_I2C_Flush
 140                     ; 34 u8 DS3231M_GetTime(void)
 140                     ; 35 {
 141                     .text:	section	.text,new
 142  0000               _DS3231M_GetTime:
 144  0000 5204          	subw	sp,#4
 145       00000004      OFST:	set	4
 148                     ; 36   u8 tmp[3], status = 0;
 150                     ; 37   status = I2C_ReadBytes(tmp, 3, DS3231M_ADR, 0x00);
 152  0002 4b00          	push	#0
 153  0004 4bd0          	push	#208
 154  0006 4b03          	push	#3
 155  0008 96            	ldw	x,sp
 156  0009 1c0005        	addw	x,#OFST+1
 157  000c cd0000        	call	_I2C_ReadBytes
 159  000f 5b03          	addw	sp,#3
 160  0011 6b01          	ld	(OFST-3,sp),a
 161                     ; 38   if(status)
 163  0013 270e          	jreq	L15
 164                     ; 40     RTC_sec = tmp[0];
 166  0015 7b02          	ld	a,(OFST-2,sp)
 167  0017 b700          	ld	_RTC_sec,a
 168                     ; 41     RTC_min = tmp[1];
 170  0019 7b03          	ld	a,(OFST-1,sp)
 171  001b b701          	ld	_RTC_min,a
 172                     ; 42     RTC_hour = tmp[2];
 174  001d 7b04          	ld	a,(OFST+0,sp)
 175  001f b702          	ld	_RTC_hour,a
 176  0021 7b01          	ld	a,(OFST-3,sp)
 177  0023               L15:
 178                     ; 44   return status;
 182  0023 5b04          	addw	sp,#4
 183  0025 81            	ret	
 232                     ; 47 u8 DS3231M_GetDate(void)
 232                     ; 48 {
 233                     .text:	section	.text,new
 234  0000               _DS3231M_GetDate:
 236  0000 5205          	subw	sp,#5
 237       00000005      OFST:	set	5
 240                     ; 49   u8 tmp[4], status = 0;
 242                     ; 50   status = I2C_ReadBytes(tmp, 4, DS3231M_ADR, 0x03);
 244  0002 4b03          	push	#3
 245  0004 4bd0          	push	#208
 246  0006 4b04          	push	#4
 247  0008 96            	ldw	x,sp
 248  0009 1c0005        	addw	x,#OFST+0
 249  000c cd0000        	call	_I2C_ReadBytes
 251  000f 5b03          	addw	sp,#3
 252  0011 6b01          	ld	(OFST-4,sp),a
 253                     ; 51   if(status)
 255  0013 2712          	jreq	L57
 256                     ; 53     RTC_day = tmp[0];
 258  0015 7b02          	ld	a,(OFST-3,sp)
 259  0017 b703          	ld	_RTC_day,a
 260                     ; 54     RTC_date = tmp[1];
 262  0019 7b03          	ld	a,(OFST-2,sp)
 263  001b b704          	ld	_RTC_date,a
 264                     ; 55     RTC_month = tmp[2];
 266  001d 7b04          	ld	a,(OFST-1,sp)
 267  001f b705          	ld	_RTC_month,a
 268                     ; 56 	  RTC_year = tmp[3];
 270  0021 7b05          	ld	a,(OFST+0,sp)
 271  0023 b706          	ld	_RTC_year,a
 272  0025 7b01          	ld	a,(OFST-4,sp)
 273  0027               L57:
 274                     ; 58   return status; 
 278  0027 5b05          	addw	sp,#5
 279  0029 81            	ret	
 326                     ; 61 u8 DS3231M_GetTemperature(void)
 326                     ; 62 {
 327                     .text:	section	.text,new
 328  0000               _DS3231M_GetTemperature:
 330  0000 5205          	subw	sp,#5
 331       00000005      OFST:	set	5
 334                     ; 63   u8 tmp[2], status = 0;
 336                     ; 64   status = I2C_ReadBytes(tmp, 2, DS3231M_ADR, 0x11);
 338  0002 4b11          	push	#17
 339  0004 4bd0          	push	#208
 340  0006 4b02          	push	#2
 341  0008 96            	ldw	x,sp
 342  0009 1c0007        	addw	x,#OFST+2
 343  000c cd0000        	call	_I2C_ReadBytes
 345  000f 5b03          	addw	sp,#3
 346  0011 6b03          	ld	(OFST-2,sp),a
 347                     ; 65   if(status)
 349  0013 2723          	jreq	L121
 350                     ; 67 	RTC_temp =  (s16) ((u16)((tmp[0]&0x7F)<<2) | ((tmp[1]>>6)&0x03));
 352  0015 7b05          	ld	a,(OFST+0,sp)
 353  0017 4e            	swap	a
 354  0018 a40c          	and	a,#12
 355  001a 44            	srl	a
 356  001b 44            	srl	a
 357  001c 5f            	clrw	x
 358  001d 97            	ld	xl,a
 359  001e 1f01          	ldw	(OFST-4,sp),x
 360  0020 7b04          	ld	a,(OFST-1,sp)
 361  0022 a47f          	and	a,#127
 362  0024 97            	ld	xl,a
 363  0025 a604          	ld	a,#4
 364  0027 42            	mul	x,a
 365  0028 01            	rrwa	x,a
 366  0029 1a02          	or	a,(OFST-3,sp)
 367  002b 01            	rrwa	x,a
 368  002c 1a01          	or	a,(OFST-4,sp)
 369  002e 01            	rrwa	x,a
 370  002f bf07          	ldw	_RTC_temp,x
 371                     ; 68 	if(tmp[0] & 0x80) RTC_temp = -RTC_temp;
 373  0031 7b04          	ld	a,(OFST-1,sp)
 374  0033 2a03          	jrpl	L121
 377  0035 50            	negw	x
 378  0036 bf07          	ldw	_RTC_temp,x
 379  0038               L121:
 380                     ; 70   return status;
 382  0038 7b03          	ld	a,(OFST-2,sp)
 385  003a 5b05          	addw	sp,#5
 386  003c 81            	ret	
 434                     ; 73 u8 DS3231M_SetTime(void)
 434                     ; 74 {
 435                     .text:	section	.text,new
 436  0000               _DS3231M_SetTime:
 438  0000 5204          	subw	sp,#4
 439       00000004      OFST:	set	4
 442                     ; 75   u8 tmp[3], status = 0;
 444                     ; 76   tmp[0] = RTC_sec;
 446  0002 b600          	ld	a,_RTC_sec
 447  0004 6b02          	ld	(OFST-2,sp),a
 448                     ; 77   tmp[1] = RTC_min;
 450  0006 b601          	ld	a,_RTC_min
 451  0008 6b03          	ld	(OFST-1,sp),a
 452                     ; 78   tmp[2] = RTC_hour;
 454  000a b602          	ld	a,_RTC_hour
 455  000c 6b04          	ld	(OFST+0,sp),a
 456                     ; 79   status = I2C_WriteBytes(tmp, 3, DS3231M_ADR, 0x00);
 458  000e 4b00          	push	#0
 459  0010 4bd0          	push	#208
 460  0012 4b03          	push	#3
 461  0014 96            	ldw	x,sp
 462  0015 1c0005        	addw	x,#OFST+1
 463  0018 cd0000        	call	_I2C_WriteBytes
 465  001b 5b07          	addw	sp,#7
 466                     ; 80   return status;
 470  001d 81            	ret	
 519                     ; 83 u8 DS3231M_SetDate(void)
 519                     ; 84 {
 520                     .text:	section	.text,new
 521  0000               _DS3231M_SetDate:
 523  0000 5205          	subw	sp,#5
 524       00000005      OFST:	set	5
 527                     ; 85   u8 tmp[4], status = 0;
 529                     ; 86   tmp[0] = RTC_day;
 531  0002 b603          	ld	a,_RTC_day
 532  0004 6b02          	ld	(OFST-3,sp),a
 533                     ; 87   tmp[1] = RTC_date;
 535  0006 b604          	ld	a,_RTC_date
 536  0008 6b03          	ld	(OFST-2,sp),a
 537                     ; 88   tmp[2] = RTC_month;
 539  000a b605          	ld	a,_RTC_month
 540  000c 6b04          	ld	(OFST-1,sp),a
 541                     ; 89   tmp[3] = RTC_year;
 543  000e b606          	ld	a,_RTC_year
 544  0010 6b05          	ld	(OFST+0,sp),a
 545                     ; 90   status = I2C_WriteBytes(tmp, 4, DS3231M_ADR, 0x03);
 547  0012 4b03          	push	#3
 548  0014 4bd0          	push	#208
 549  0016 4b04          	push	#4
 550  0018 96            	ldw	x,sp
 551  0019 1c0005        	addw	x,#OFST+0
 552  001c cd0000        	call	_I2C_WriteBytes
 554  001f 5b08          	addw	sp,#8
 555                     ; 91   return status;
 559  0021 81            	ret	
 605                     ; 95 u8 DS3231M_EnableOsc(void)
 605                     ; 96 {
 606                     .text:	section	.text,new
 607  0000               _DS3231M_EnableOsc:
 609  0000 5203          	subw	sp,#3
 610       00000003      OFST:	set	3
 613                     ; 97   u8 tmp[2], status = 0;
 615                     ; 98   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
 617  0002 4b0e          	push	#14
 618  0004 4bd0          	push	#208
 619  0006 4b01          	push	#1
 620  0008 96            	ldw	x,sp
 621  0009 1c0005        	addw	x,#OFST+2
 622  000c cd0000        	call	_I2C_ReadBytes
 624  000f 5b03          	addw	sp,#3
 625  0011 6b01          	ld	(OFST-2,sp),a
 626                     ; 99   if(tmp[0] & nEOSC)   //if nEOSC bit is set, reset it
 628  0013 7b02          	ld	a,(OFST-1,sp)
 629  0015 2a15          	jrpl	L312
 630                     ; 101     tmp[0] &= (u8)(~nEOSC);
 632  0017 a47f          	and	a,#127
 633  0019 6b02          	ld	(OFST-1,sp),a
 634                     ; 102     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
 636  001b 4b0e          	push	#14
 637  001d 4bd0          	push	#208
 638  001f 4b01          	push	#1
 639  0021 96            	ldw	x,sp
 640  0022 1c0005        	addw	x,#OFST+2
 641  0025 cd0000        	call	_I2C_WriteBytes
 643  0028 5b03          	addw	sp,#3
 644  002a 6b01          	ld	(OFST-2,sp),a
 645  002c               L312:
 646                     ; 104   return status;
 648  002c 7b01          	ld	a,(OFST-2,sp)
 651  002e 5b03          	addw	sp,#3
 652  0030 81            	ret	
 698                     ; 107 u8 DS3231M_DisableOsc(void)
 698                     ; 108 {
 699                     .text:	section	.text,new
 700  0000               _DS3231M_DisableOsc:
 702  0000 5203          	subw	sp,#3
 703       00000003      OFST:	set	3
 706                     ; 109   u8 tmp[2], status = 0;
 708                     ; 110   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
 710  0002 4b0e          	push	#14
 711  0004 4bd0          	push	#208
 712  0006 4b01          	push	#1
 713  0008 96            	ldw	x,sp
 714  0009 1c0005        	addw	x,#OFST+2
 715  000c cd0000        	call	_I2C_ReadBytes
 717  000f 5b03          	addw	sp,#3
 718  0011 6b01          	ld	(OFST-2,sp),a
 719                     ; 111   if(!(tmp[0] & nEOSC))  //if nEOSC bit is reset, set it
 721  0013 7b02          	ld	a,(OFST-1,sp)
 722  0015 2b15          	jrmi	L732
 723                     ; 113     tmp[0] |= nEOSC;
 725  0017 aa80          	or	a,#128
 726  0019 6b02          	ld	(OFST-1,sp),a
 727                     ; 114     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
 729  001b 4b0e          	push	#14
 730  001d 4bd0          	push	#208
 731  001f 4b01          	push	#1
 732  0021 96            	ldw	x,sp
 733  0022 1c0005        	addw	x,#OFST+2
 734  0025 cd0000        	call	_I2C_WriteBytes
 736  0028 5b03          	addw	sp,#3
 737  002a 6b01          	ld	(OFST-2,sp),a
 738  002c               L732:
 739                     ; 116   return status;
 741  002c 7b01          	ld	a,(OFST-2,sp)
 744  002e 5b03          	addw	sp,#3
 745  0030 81            	ret	
 792                     ; 119 u8 DS3231M_EnableBBSQW(void)
 792                     ; 120 {
 793                     .text:	section	.text,new
 794  0000               _DS3231M_EnableBBSQW:
 796  0000 5203          	subw	sp,#3
 797       00000003      OFST:	set	3
 800                     ; 121   u8 tmp[2], status = 0;
 802                     ; 122   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
 804  0002 4b0e          	push	#14
 805  0004 4bd0          	push	#208
 806  0006 4b01          	push	#1
 807  0008 96            	ldw	x,sp
 808  0009 1c0005        	addw	x,#OFST+2
 809  000c cd0000        	call	_I2C_ReadBytes
 811  000f 5b03          	addw	sp,#3
 812  0011 6b01          	ld	(OFST-2,sp),a
 813                     ; 123   if(!(tmp[0] & BBSQW))   //if BBSQW bit is reset, set it
 815  0013 7b02          	ld	a,(OFST-1,sp)
 816  0015 a540          	bcp	a,#64
 817  0017 2615          	jrne	L362
 818                     ; 125     tmp[0] |= BBSQW;
 820  0019 aa40          	or	a,#64
 821  001b 6b02          	ld	(OFST-1,sp),a
 822                     ; 126     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
 824  001d 4b0e          	push	#14
 825  001f 4bd0          	push	#208
 826  0021 4b01          	push	#1
 827  0023 96            	ldw	x,sp
 828  0024 1c0005        	addw	x,#OFST+2
 829  0027 cd0000        	call	_I2C_WriteBytes
 831  002a 5b03          	addw	sp,#3
 832  002c 6b01          	ld	(OFST-2,sp),a
 833  002e               L362:
 834                     ; 128   return status;
 836  002e 7b01          	ld	a,(OFST-2,sp)
 839  0030 5b03          	addw	sp,#3
 840  0032 81            	ret	
 887                     ; 131 u8 DS3231M_DisableBBSQW(void)
 887                     ; 132 {
 888                     .text:	section	.text,new
 889  0000               _DS3231M_DisableBBSQW:
 891  0000 5203          	subw	sp,#3
 892       00000003      OFST:	set	3
 895                     ; 133   u8 tmp[2], status = 0;
 897                     ; 134   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
 899  0002 4b0e          	push	#14
 900  0004 4bd0          	push	#208
 901  0006 4b01          	push	#1
 902  0008 96            	ldw	x,sp
 903  0009 1c0005        	addw	x,#OFST+2
 904  000c cd0000        	call	_I2C_ReadBytes
 906  000f 5b03          	addw	sp,#3
 907  0011 6b01          	ld	(OFST-2,sp),a
 908                     ; 135   if(tmp[0] & BBSQW)  //if BBSQW bit is set, reset it
 910  0013 7b02          	ld	a,(OFST-1,sp)
 911  0015 a540          	bcp	a,#64
 912  0017 2715          	jreq	L703
 913                     ; 137     tmp[0] &= (u8)(~BBSQW);
 915  0019 a4bf          	and	a,#191
 916  001b 6b02          	ld	(OFST-1,sp),a
 917                     ; 138     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
 919  001d 4b0e          	push	#14
 920  001f 4bd0          	push	#208
 921  0021 4b01          	push	#1
 922  0023 96            	ldw	x,sp
 923  0024 1c0005        	addw	x,#OFST+2
 924  0027 cd0000        	call	_I2C_WriteBytes
 926  002a 5b03          	addw	sp,#3
 927  002c 6b01          	ld	(OFST-2,sp),a
 928  002e               L703:
 929                     ; 140   return status;
 931  002e 7b01          	ld	a,(OFST-2,sp)
 934  0030 5b03          	addw	sp,#3
 935  0032 81            	ret	
 982                     ; 143 u8 DS3231M_ConvertTemp(void)
 982                     ; 144 {
 983                     .text:	section	.text,new
 984  0000               _DS3231M_ConvertTemp:
 986  0000 5203          	subw	sp,#3
 987       00000003      OFST:	set	3
 990                     ; 145   u8 tmp[2], status = 0;
 992                     ; 146   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
 994  0002 4b0e          	push	#14
 995  0004 4bd0          	push	#208
 996  0006 4b01          	push	#1
 997  0008 96            	ldw	x,sp
 998  0009 1c0005        	addw	x,#OFST+2
 999  000c cd0000        	call	_I2C_ReadBytes
1001  000f 5b03          	addw	sp,#3
1002  0011 6b01          	ld	(OFST-2,sp),a
1003                     ; 147   if(!(tmp[0] & CONV))   //if CONV bit is reset, set it
1005  0013 7b02          	ld	a,(OFST-1,sp)
1006  0015 a520          	bcp	a,#32
1007  0017 2615          	jrne	L333
1008                     ; 149     tmp[0] |= CONV;
1010  0019 aa20          	or	a,#32
1011  001b 6b02          	ld	(OFST-1,sp),a
1012                     ; 150     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
1014  001d 4b0e          	push	#14
1015  001f 4bd0          	push	#208
1016  0021 4b01          	push	#1
1017  0023 96            	ldw	x,sp
1018  0024 1c0005        	addw	x,#OFST+2
1019  0027 cd0000        	call	_I2C_WriteBytes
1021  002a 5b03          	addw	sp,#3
1022  002c 6b01          	ld	(OFST-2,sp),a
1023  002e               L333:
1024                     ; 152   return status;
1026  002e 7b01          	ld	a,(OFST-2,sp)
1029  0030 5b03          	addw	sp,#3
1030  0032 81            	ret	
1076                     ; 155 u8 DS3231M_SetINTCN(void)
1076                     ; 156 {
1077                     .text:	section	.text,new
1078  0000               _DS3231M_SetINTCN:
1080  0000 5203          	subw	sp,#3
1081       00000003      OFST:	set	3
1084                     ; 157   u8 tmp[2], status = 0;
1086                     ; 158   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
1088  0002 4b0e          	push	#14
1089  0004 4bd0          	push	#208
1090  0006 4b01          	push	#1
1091  0008 96            	ldw	x,sp
1092  0009 1c0005        	addw	x,#OFST+2
1093  000c cd0000        	call	_I2C_ReadBytes
1095  000f 5b03          	addw	sp,#3
1096  0011 6b01          	ld	(OFST-2,sp),a
1097                     ; 159   if(!(tmp[0] & INTCN))   //if INTCN bit is reset, set it
1099  0013 7b02          	ld	a,(OFST-1,sp)
1100  0015 a504          	bcp	a,#4
1101  0017 2615          	jrne	L753
1102                     ; 161     tmp[0] |= INTCN;
1104  0019 aa04          	or	a,#4
1105  001b 6b02          	ld	(OFST-1,sp),a
1106                     ; 162     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
1108  001d 4b0e          	push	#14
1109  001f 4bd0          	push	#208
1110  0021 4b01          	push	#1
1111  0023 96            	ldw	x,sp
1112  0024 1c0005        	addw	x,#OFST+2
1113  0027 cd0000        	call	_I2C_WriteBytes
1115  002a 5b03          	addw	sp,#3
1116  002c 6b01          	ld	(OFST-2,sp),a
1117  002e               L753:
1118                     ; 164   return status;
1120  002e 7b01          	ld	a,(OFST-2,sp)
1123  0030 5b03          	addw	sp,#3
1124  0032 81            	ret	
1170                     ; 167 u8 DS3231M_ResetINTCN(void)
1170                     ; 168 {
1171                     .text:	section	.text,new
1172  0000               _DS3231M_ResetINTCN:
1174  0000 5203          	subw	sp,#3
1175       00000003      OFST:	set	3
1178                     ; 169   u8 tmp[2], status = 0;
1180                     ; 170   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
1182  0002 4b0e          	push	#14
1183  0004 4bd0          	push	#208
1184  0006 4b01          	push	#1
1185  0008 96            	ldw	x,sp
1186  0009 1c0005        	addw	x,#OFST+2
1187  000c cd0000        	call	_I2C_ReadBytes
1189  000f 5b03          	addw	sp,#3
1190  0011 6b01          	ld	(OFST-2,sp),a
1191                     ; 171   if(tmp[0] & INTCN)  //if INTCN bit is set, reset it
1193  0013 7b02          	ld	a,(OFST-1,sp)
1194  0015 a504          	bcp	a,#4
1195  0017 2715          	jreq	L304
1196                     ; 173     tmp[0] &= (u8)(~INTCN);
1198  0019 a4fb          	and	a,#251
1199  001b 6b02          	ld	(OFST-1,sp),a
1200                     ; 174     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
1202  001d 4b0e          	push	#14
1203  001f 4bd0          	push	#208
1204  0021 4b01          	push	#1
1205  0023 96            	ldw	x,sp
1206  0024 1c0005        	addw	x,#OFST+2
1207  0027 cd0000        	call	_I2C_WriteBytes
1209  002a 5b03          	addw	sp,#3
1210  002c 6b01          	ld	(OFST-2,sp),a
1211  002e               L304:
1212                     ; 176   return status;
1214  002e 7b01          	ld	a,(OFST-2,sp)
1217  0030 5b03          	addw	sp,#3
1218  0032 81            	ret	
1265                     ; 179 u8 DS3231M_EnableAlarm1Intr(void)
1265                     ; 180 {
1266                     .text:	section	.text,new
1267  0000               _DS3231M_EnableAlarm1Intr:
1269  0000 5203          	subw	sp,#3
1270       00000003      OFST:	set	3
1273                     ; 181   u8 tmp[2], status = 0;
1275                     ; 182   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
1277  0002 4b0e          	push	#14
1278  0004 4bd0          	push	#208
1279  0006 4b01          	push	#1
1280  0008 96            	ldw	x,sp
1281  0009 1c0005        	addw	x,#OFST+2
1282  000c cd0000        	call	_I2C_ReadBytes
1284  000f 5b03          	addw	sp,#3
1285  0011 6b01          	ld	(OFST-2,sp),a
1286                     ; 183   if(!(tmp[0] & A1IE))   //if A1IE bit is reset, set it
1288  0013 7b02          	ld	a,(OFST-1,sp)
1289  0015 a501          	bcp	a,#1
1290  0017 2615          	jrne	L724
1291                     ; 185     tmp[0] |= A1IE;
1293  0019 aa01          	or	a,#1
1294  001b 6b02          	ld	(OFST-1,sp),a
1295                     ; 186     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
1297  001d 4b0e          	push	#14
1298  001f 4bd0          	push	#208
1299  0021 4b01          	push	#1
1300  0023 96            	ldw	x,sp
1301  0024 1c0005        	addw	x,#OFST+2
1302  0027 cd0000        	call	_I2C_WriteBytes
1304  002a 5b03          	addw	sp,#3
1305  002c 6b01          	ld	(OFST-2,sp),a
1306  002e               L724:
1307                     ; 188   return status;
1309  002e 7b01          	ld	a,(OFST-2,sp)
1312  0030 5b03          	addw	sp,#3
1313  0032 81            	ret	
1360                     ; 191 u8 DS3231M_DisableAlarm1Intr(void)
1360                     ; 192 {
1361                     .text:	section	.text,new
1362  0000               _DS3231M_DisableAlarm1Intr:
1364  0000 5203          	subw	sp,#3
1365       00000003      OFST:	set	3
1368                     ; 193   u8 tmp[2], status = 0;
1370                     ; 194   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
1372  0002 4b0e          	push	#14
1373  0004 4bd0          	push	#208
1374  0006 4b01          	push	#1
1375  0008 96            	ldw	x,sp
1376  0009 1c0005        	addw	x,#OFST+2
1377  000c cd0000        	call	_I2C_ReadBytes
1379  000f 5b03          	addw	sp,#3
1380  0011 6b01          	ld	(OFST-2,sp),a
1381                     ; 195   if(tmp[0] & A1IE)  //if A1IE bit is set, reset it
1383  0013 7b02          	ld	a,(OFST-1,sp)
1384  0015 a501          	bcp	a,#1
1385  0017 2715          	jreq	L354
1386                     ; 197     tmp[0] &= (u8)(~A1IE);
1388  0019 a4fe          	and	a,#254
1389  001b 6b02          	ld	(OFST-1,sp),a
1390                     ; 198     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
1392  001d 4b0e          	push	#14
1393  001f 4bd0          	push	#208
1394  0021 4b01          	push	#1
1395  0023 96            	ldw	x,sp
1396  0024 1c0005        	addw	x,#OFST+2
1397  0027 cd0000        	call	_I2C_WriteBytes
1399  002a 5b03          	addw	sp,#3
1400  002c 6b01          	ld	(OFST-2,sp),a
1401  002e               L354:
1402                     ; 200   return status;
1404  002e 7b01          	ld	a,(OFST-2,sp)
1407  0030 5b03          	addw	sp,#3
1408  0032 81            	ret	
1455                     ; 203 u8 DS3231M_EnableAlarm2Intr(void)
1455                     ; 204 {
1456                     .text:	section	.text,new
1457  0000               _DS3231M_EnableAlarm2Intr:
1459  0000 5203          	subw	sp,#3
1460       00000003      OFST:	set	3
1463                     ; 205   u8 tmp[2], status = 0;
1465                     ; 206   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
1467  0002 4b0e          	push	#14
1468  0004 4bd0          	push	#208
1469  0006 4b01          	push	#1
1470  0008 96            	ldw	x,sp
1471  0009 1c0005        	addw	x,#OFST+2
1472  000c cd0000        	call	_I2C_ReadBytes
1474  000f 5b03          	addw	sp,#3
1475  0011 6b01          	ld	(OFST-2,sp),a
1476                     ; 207   if(!(tmp[0] & A2IE))   //if A2IE bit is reset, set it
1478  0013 7b02          	ld	a,(OFST-1,sp)
1479  0015 a502          	bcp	a,#2
1480  0017 2615          	jrne	L774
1481                     ; 209     tmp[0] |= A2IE;
1483  0019 aa02          	or	a,#2
1484  001b 6b02          	ld	(OFST-1,sp),a
1485                     ; 210     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
1487  001d 4b0e          	push	#14
1488  001f 4bd0          	push	#208
1489  0021 4b01          	push	#1
1490  0023 96            	ldw	x,sp
1491  0024 1c0005        	addw	x,#OFST+2
1492  0027 cd0000        	call	_I2C_WriteBytes
1494  002a 5b03          	addw	sp,#3
1495  002c 6b01          	ld	(OFST-2,sp),a
1496  002e               L774:
1497                     ; 212   return status;
1499  002e 7b01          	ld	a,(OFST-2,sp)
1502  0030 5b03          	addw	sp,#3
1503  0032 81            	ret	
1550                     ; 215 u8 DS3231M_DisableAlarm2Intr(void)
1550                     ; 216 {
1551                     .text:	section	.text,new
1552  0000               _DS3231M_DisableAlarm2Intr:
1554  0000 5203          	subw	sp,#3
1555       00000003      OFST:	set	3
1558                     ; 217   u8 tmp[2], status = 0;
1560                     ; 218   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0E);
1562  0002 4b0e          	push	#14
1563  0004 4bd0          	push	#208
1564  0006 4b01          	push	#1
1565  0008 96            	ldw	x,sp
1566  0009 1c0005        	addw	x,#OFST+2
1567  000c cd0000        	call	_I2C_ReadBytes
1569  000f 5b03          	addw	sp,#3
1570  0011 6b01          	ld	(OFST-2,sp),a
1571                     ; 219   if(tmp[0] & A2IE)  //if A2IE bit is set, reset it
1573  0013 7b02          	ld	a,(OFST-1,sp)
1574  0015 a502          	bcp	a,#2
1575  0017 2715          	jreq	L325
1576                     ; 221     tmp[0] &= (u8)(~A2IE);
1578  0019 a4fd          	and	a,#253
1579  001b 6b02          	ld	(OFST-1,sp),a
1580                     ; 222     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0E);
1582  001d 4b0e          	push	#14
1583  001f 4bd0          	push	#208
1584  0021 4b01          	push	#1
1585  0023 96            	ldw	x,sp
1586  0024 1c0005        	addw	x,#OFST+2
1587  0027 cd0000        	call	_I2C_WriteBytes
1589  002a 5b03          	addw	sp,#3
1590  002c 6b01          	ld	(OFST-2,sp),a
1591  002e               L325:
1592                     ; 224   return status;
1594  002e 7b01          	ld	a,(OFST-2,sp)
1597  0030 5b03          	addw	sp,#3
1598  0032 81            	ret	
1644                     ; 228 u8 DS3231M_GetOscStopFlag(void)
1644                     ; 229 {
1645                     .text:	section	.text,new
1646  0000               _DS3231M_GetOscStopFlag:
1648  0000 5203          	subw	sp,#3
1649       00000003      OFST:	set	3
1652                     ; 230   u8 tmp[2], status = 0;
1654                     ; 231   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0F);
1656  0002 4b0f          	push	#15
1657  0004 4bd0          	push	#208
1658  0006 4b01          	push	#1
1659  0008 96            	ldw	x,sp
1660  0009 1c0004        	addw	x,#OFST+1
1661  000c cd0000        	call	_I2C_ReadBytes
1663  000f 5b03          	addw	sp,#3
1664  0011 6b03          	ld	(OFST+0,sp),a
1665                     ; 232   if(!status) return 2;
1667  0013 2604          	jrne	L745
1670  0015 a602          	ld	a,#2
1672  0017 2006          	jra	L241
1673  0019               L745:
1674                     ; 233   if(tmp[0] & OSF) return 1;
1676  0019 7b01          	ld	a,(OFST-2,sp)
1677  001b 2a05          	jrpl	L155
1680  001d a601          	ld	a,#1
1682  001f               L241:
1684  001f 5b03          	addw	sp,#3
1685  0021 81            	ret	
1686  0022               L155:
1687                     ; 234   else return 0;
1689  0022 4f            	clr	a
1691  0023 20fa          	jra	L241
1738                     ; 237 u8 DS3231M_ResetOscStopFlag(void)
1738                     ; 238 {
1739                     .text:	section	.text,new
1740  0000               _DS3231M_ResetOscStopFlag:
1742  0000 5203          	subw	sp,#3
1743       00000003      OFST:	set	3
1746                     ; 239   u8 tmp[2], status = 0;
1748                     ; 240   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0F);
1750  0002 4b0f          	push	#15
1751  0004 4bd0          	push	#208
1752  0006 4b01          	push	#1
1753  0008 96            	ldw	x,sp
1754  0009 1c0005        	addw	x,#OFST+2
1755  000c cd0000        	call	_I2C_ReadBytes
1757  000f 5b03          	addw	sp,#3
1758  0011 6b01          	ld	(OFST-2,sp),a
1759                     ; 241   if(tmp[0] & A2IE)  //if A2IE bit is set, reset it
1761  0013 7b02          	ld	a,(OFST-1,sp)
1762  0015 a502          	bcp	a,#2
1763  0017 2715          	jreq	L775
1764                     ; 243     tmp[0] &= (u8)(~A2IE);
1766  0019 a4fd          	and	a,#253
1767  001b 6b02          	ld	(OFST-1,sp),a
1768                     ; 244     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0F);
1770  001d 4b0f          	push	#15
1771  001f 4bd0          	push	#208
1772  0021 4b01          	push	#1
1773  0023 96            	ldw	x,sp
1774  0024 1c0005        	addw	x,#OFST+2
1775  0027 cd0000        	call	_I2C_WriteBytes
1777  002a 5b03          	addw	sp,#3
1778  002c 6b01          	ld	(OFST-2,sp),a
1779  002e               L775:
1780                     ; 246   return status;
1782  002e 7b01          	ld	a,(OFST-2,sp)
1785  0030 5b03          	addw	sp,#3
1786  0032 81            	ret	
1833                     ; 249 u8 DS3231M_Enable32KHzOut(void)
1833                     ; 250 {
1834                     .text:	section	.text,new
1835  0000               _DS3231M_Enable32KHzOut:
1837  0000 5203          	subw	sp,#3
1838       00000003      OFST:	set	3
1841                     ; 251   u8 tmp[2], status = 0;
1843                     ; 252   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0F);
1845  0002 4b0f          	push	#15
1846  0004 4bd0          	push	#208
1847  0006 4b01          	push	#1
1848  0008 96            	ldw	x,sp
1849  0009 1c0005        	addw	x,#OFST+2
1850  000c cd0000        	call	_I2C_ReadBytes
1852  000f 5b03          	addw	sp,#3
1853  0011 6b01          	ld	(OFST-2,sp),a
1854                     ; 253   if(!(tmp[0] & EN32KHZ))   //if EN32KHZ bit is reset, set it
1856  0013 7b02          	ld	a,(OFST-1,sp)
1857  0015 a508          	bcp	a,#8
1858  0017 2615          	jrne	L326
1859                     ; 255     tmp[0] |= EN32KHZ;
1861  0019 aa08          	or	a,#8
1862  001b 6b02          	ld	(OFST-1,sp),a
1863                     ; 256     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0F);
1865  001d 4b0f          	push	#15
1866  001f 4bd0          	push	#208
1867  0021 4b01          	push	#1
1868  0023 96            	ldw	x,sp
1869  0024 1c0005        	addw	x,#OFST+2
1870  0027 cd0000        	call	_I2C_WriteBytes
1872  002a 5b03          	addw	sp,#3
1873  002c 6b01          	ld	(OFST-2,sp),a
1874  002e               L326:
1875                     ; 258   return status;
1877  002e 7b01          	ld	a,(OFST-2,sp)
1880  0030 5b03          	addw	sp,#3
1881  0032 81            	ret	
1928                     ; 261 u8 DS3231M_Disable32KHzOut(void)
1928                     ; 262 {
1929                     .text:	section	.text,new
1930  0000               _DS3231M_Disable32KHzOut:
1932  0000 5203          	subw	sp,#3
1933       00000003      OFST:	set	3
1936                     ; 263   u8 tmp[2], status = 0;
1938                     ; 264   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0F);
1940  0002 4b0f          	push	#15
1941  0004 4bd0          	push	#208
1942  0006 4b01          	push	#1
1943  0008 96            	ldw	x,sp
1944  0009 1c0005        	addw	x,#OFST+2
1945  000c cd0000        	call	_I2C_ReadBytes
1947  000f 5b03          	addw	sp,#3
1948  0011 6b01          	ld	(OFST-2,sp),a
1949                     ; 265   if(tmp[0] & EN32KHZ)  //if EN32KHZ bit is set, reset it
1951  0013 7b02          	ld	a,(OFST-1,sp)
1952  0015 a508          	bcp	a,#8
1953  0017 2715          	jreq	L746
1954                     ; 267     tmp[0] &= (u8)(~EN32KHZ);
1956  0019 a4f7          	and	a,#247
1957  001b 6b02          	ld	(OFST-1,sp),a
1958                     ; 268     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0F);
1960  001d 4b0f          	push	#15
1961  001f 4bd0          	push	#208
1962  0021 4b01          	push	#1
1963  0023 96            	ldw	x,sp
1964  0024 1c0005        	addw	x,#OFST+2
1965  0027 cd0000        	call	_I2C_WriteBytes
1967  002a 5b03          	addw	sp,#3
1968  002c 6b01          	ld	(OFST-2,sp),a
1969  002e               L746:
1970                     ; 270   return status;
1972  002e 7b01          	ld	a,(OFST-2,sp)
1975  0030 5b03          	addw	sp,#3
1976  0032 81            	ret	
2023                     ; 273 u8 DS3231M_ResetAlarm1(void)
2023                     ; 274 {
2024                     .text:	section	.text,new
2025  0000               _DS3231M_ResetAlarm1:
2027  0000 5203          	subw	sp,#3
2028       00000003      OFST:	set	3
2031                     ; 275   u8 tmp[2], status = 0;
2033                     ; 276   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0F);
2035  0002 4b0f          	push	#15
2036  0004 4bd0          	push	#208
2037  0006 4b01          	push	#1
2038  0008 96            	ldw	x,sp
2039  0009 1c0005        	addw	x,#OFST+2
2040  000c cd0000        	call	_I2C_ReadBytes
2042  000f 5b03          	addw	sp,#3
2043  0011 6b01          	ld	(OFST-2,sp),a
2044                     ; 277   if(tmp[0] & A1F)  //if A1F bit is set, reset it
2046  0013 7b02          	ld	a,(OFST-1,sp)
2047  0015 a501          	bcp	a,#1
2048  0017 2715          	jreq	L376
2049                     ; 279     tmp[0] &= (u8)(~A1F);
2051  0019 a4fe          	and	a,#254
2052  001b 6b02          	ld	(OFST-1,sp),a
2053                     ; 280     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0F);
2055  001d 4b0f          	push	#15
2056  001f 4bd0          	push	#208
2057  0021 4b01          	push	#1
2058  0023 96            	ldw	x,sp
2059  0024 1c0005        	addw	x,#OFST+2
2060  0027 cd0000        	call	_I2C_WriteBytes
2062  002a 5b03          	addw	sp,#3
2063  002c 6b01          	ld	(OFST-2,sp),a
2064  002e               L376:
2065                     ; 282   return status;
2067  002e 7b01          	ld	a,(OFST-2,sp)
2070  0030 5b03          	addw	sp,#3
2071  0032 81            	ret	
2118                     ; 285 u8 DS3231M_ResetAlarm2(void)
2118                     ; 286 {
2119                     .text:	section	.text,new
2120  0000               _DS3231M_ResetAlarm2:
2122  0000 5203          	subw	sp,#3
2123       00000003      OFST:	set	3
2126                     ; 287   u8 tmp[2], status = 0;
2128                     ; 288   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0F);
2130  0002 4b0f          	push	#15
2131  0004 4bd0          	push	#208
2132  0006 4b01          	push	#1
2133  0008 96            	ldw	x,sp
2134  0009 1c0005        	addw	x,#OFST+2
2135  000c cd0000        	call	_I2C_ReadBytes
2137  000f 5b03          	addw	sp,#3
2138  0011 6b01          	ld	(OFST-2,sp),a
2139                     ; 289   if(tmp[0] & A2F)  //if A2F bit is set, reset it
2141  0013 7b02          	ld	a,(OFST-1,sp)
2142  0015 a502          	bcp	a,#2
2143  0017 2715          	jreq	L717
2144                     ; 291     tmp[0] &= (u8)(~A2F);
2146  0019 a4fd          	and	a,#253
2147  001b 6b02          	ld	(OFST-1,sp),a
2148                     ; 292     status = I2C_WriteBytes(tmp, 1, DS3231M_ADR, 0x0F);
2150  001d 4b0f          	push	#15
2151  001f 4bd0          	push	#208
2152  0021 4b01          	push	#1
2153  0023 96            	ldw	x,sp
2154  0024 1c0005        	addw	x,#OFST+2
2155  0027 cd0000        	call	_I2C_WriteBytes
2157  002a 5b03          	addw	sp,#3
2158  002c 6b01          	ld	(OFST-2,sp),a
2159  002e               L717:
2160                     ; 294   return status;
2162  002e 7b01          	ld	a,(OFST-2,sp)
2165  0030 5b03          	addw	sp,#3
2166  0032 81            	ret	
2212                     ; 297 u8 DS3231M_GetBusyFlag(void)
2212                     ; 298 {
2213                     .text:	section	.text,new
2214  0000               _DS3231M_GetBusyFlag:
2216  0000 5203          	subw	sp,#3
2217       00000003      OFST:	set	3
2220                     ; 299   u8 tmp[2], status = 0;
2222                     ; 300   status = I2C_ReadBytes(tmp, 1, DS3231M_ADR, 0x0F);
2224  0002 4b0f          	push	#15
2225  0004 4bd0          	push	#208
2226  0006 4b01          	push	#1
2227  0008 96            	ldw	x,sp
2228  0009 1c0004        	addw	x,#OFST+1
2229  000c cd0000        	call	_I2C_ReadBytes
2231  000f 5b03          	addw	sp,#3
2232  0011 6b03          	ld	(OFST+0,sp),a
2233                     ; 301   if(!status) return 2;
2235  0013 2604          	jrne	L347
2238  0015 a602          	ld	a,#2
2240  0017 2008          	jra	L602
2241  0019               L347:
2242                     ; 302   if(tmp[0] & BSY) return 1;
2244  0019 7b01          	ld	a,(OFST-2,sp)
2245  001b a504          	bcp	a,#4
2246  001d 2705          	jreq	L547
2249  001f a601          	ld	a,#1
2251  0021               L602:
2253  0021 5b03          	addw	sp,#3
2254  0023 81            	ret	
2255  0024               L547:
2256                     ; 303   else return 0;
2258  0024 4f            	clr	a
2260  0025 20fa          	jra	L602
2347                     	xdef	_DS3231M_GetBusyFlag
2348                     	xdef	_DS3231M_ResetAlarm2
2349                     	xdef	_DS3231M_ResetAlarm1
2350                     	xdef	_DS3231M_Disable32KHzOut
2351                     	xdef	_DS3231M_Enable32KHzOut
2352                     	xdef	_DS3231M_ResetOscStopFlag
2353                     	xdef	_DS3231M_GetOscStopFlag
2354                     	xdef	_DS3231M_DisableAlarm2Intr
2355                     	xdef	_DS3231M_EnableAlarm2Intr
2356                     	xdef	_DS3231M_DisableAlarm1Intr
2357                     	xdef	_DS3231M_EnableAlarm1Intr
2358                     	xdef	_DS3231M_ResetINTCN
2359                     	xdef	_DS3231M_SetINTCN
2360                     	xdef	_DS3231M_ConvertTemp
2361                     	xdef	_DS3231M_DisableBBSQW
2362                     	xdef	_DS3231M_EnableBBSQW
2363                     	xdef	_DS3231M_DisableOsc
2364                     	xdef	_DS3231M_EnableOsc
2365                     	xdef	_DS3231M_SetDate
2366                     	xdef	_DS3231M_SetTime
2367                     	xdef	_DS3231M_GetTemperature
2368                     	xdef	_DS3231M_GetDate
2369                     	xdef	_DS3231M_GetTime
2370                     	xdef	_DS3231M_Flush
2371                     	xdef	_RTC_temp
2372                     	xdef	_RTC_year
2373                     	xdef	_RTC_month
2374                     	xdef	_RTC_date
2375                     	xdef	_RTC_day
2376                     	xdef	_RTC_hour
2377                     	xdef	_RTC_min
2378                     	xdef	_RTC_sec
2379                     	xref	_I2C_ReadBytes
2380                     	xref	_I2C_WriteBytes
2381                     	xref	_I2C_Flush
2400                     	end
