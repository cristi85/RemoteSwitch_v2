   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  70                     ; 22 void I2C_Flush(u8 cycles)
  70                     ; 23 {
  72                     .text:	section	.text,new
  73  0000               _I2C_Flush:
  75  0000 88            	push	a
  76  0001 88            	push	a
  77       00000001      OFST:	set	1
  80                     ; 25   for(i = 0; i < cycles; i++)
  82  0002 0f01          	clr	(OFST+0,sp)
  84  0004 2018          	jra	L73
  85  0006               L33:
  86                     ; 27     SCL_LOW;
  88  0006 72155005      	bres	20485,#2
  89                     ; 28     DELAY_US(DELAY_6US);  /*2uS*/
  91  000a ae0020        	ldw	x,#32
  93  000d               L6:
  94  000d 5a            	decw	X
  95  000e 26fd          	jrne	L6
  96  0010 9d            	nop	
  98                     ; 29     SCL_HIGH;
 101  0011 72145005      	bset	20485,#2
 102                     ; 30     DELAY_US(DELAY_6US);  /*2uS*/
 104  0015 ae0020        	ldw	x,#32
 106  0018               L01:
 107  0018 5a            	decw	X
 108  0019 26fd          	jrne	L01
 109  001b 9d            	nop	
 111                     ; 25   for(i = 0; i < cycles; i++)
 114  001c 0c01          	inc	(OFST+0,sp)
 115  001e               L73:
 118  001e 7b01          	ld	a,(OFST+0,sp)
 119  0020 1102          	cp	a,(OFST+1,sp)
 120  0022 25e2          	jrult	L33
 121                     ; 32 }
 124  0024 85            	popw	x
 125  0025 81            	ret	
 159                     ; 37 void write_scl(u8 x)
 159                     ; 38 {
 160                     .text:	section	.text,new
 161  0000               _write_scl:
 165                     ; 39       if(x)
 167  0000 4d            	tnz	a
 168  0001 270a          	jreq	L16
 169                     ; 41         SCL_HIGH;
 171  0003 72145005      	bset	20485,#2
 173  0007               L56:
 174                     ; 43 	    while(!SCL_READ);
 176  0007 72055006fb    	btjf	20486,#2,L56
 179  000c 81            	ret	
 180  000d               L16:
 181                     ; 47         SCL_LOW; 
 183  000d 72155005      	bres	20485,#2
 184                     ; 49 }
 187  0011 81            	ret	
 211                     ; 53 u8 I2C_StartCond(void)
 211                     ; 54 {
 212                     .text:	section	.text,new
 213  0000               _I2C_StartCond:
 217                     ; 55   SDA_LOW;
 219  0000 72175005      	bres	20485,#3
 220                     ; 56   DELAY_US(I2C_DELAY);
 222  0004 ae0006        	ldw	x,#6
 224  0007               L61:
 225  0007 5a            	decw	X
 226  0008 26fd          	jrne	L61
 227  000a 9d            	nop	
 229                     ; 58   write_scl(0);	
 232  000b 4f            	clr	a
 233  000c cd0000        	call	_write_scl
 235                     ; 59   DELAY_US(I2C_DELAY);
 237  000f ae0006        	ldw	x,#6
 239  0012               L22:
 240  0012 5a            	decw	X
 241  0013 26fd          	jrne	L22
 242  0015 9d            	nop	
 244                     ; 60   return 1;  
 247  0016 a601          	ld	a,#1
 250  0018 81            	ret	
 273                     ; 65 void toggle_scl(void) 
 273                     ; 66 {
 274                     .text:	section	.text,new
 275  0000               _toggle_scl:
 279                     ; 67   if(SCL_READ)
 281  0000 7205500605    	btjf	20486,#2,L311
 282                     ; 69     SCL_LOW;
 284  0005 72155005      	bres	20485,#2
 286                     ; 76 }
 289  0009 81            	ret	
 290  000a               L311:
 291                     ; 73     SCL_HIGH;
 293  000a 72145005      	bset	20485,#2
 295  000e               L121:
 296                     ; 74     while(!SCL_READ);
 298  000e 72055006fb    	btjf	20486,#2,L121
 300  0013 81            	ret	
 344                     ; 82 u8 I2C_WriteByte(u8 data)
 344                     ; 83 {
 345                     .text:	section	.text,new
 346  0000               _I2C_WriteByte:
 348  0000 88            	push	a
 349  0001 88            	push	a
 350       00000001      OFST:	set	1
 353                     ; 85   for (bit = 0; bit < 8; bit++) 
 355  0002 0f01          	clr	(OFST+0,sp)
 356  0004               L741:
 357                     ; 87     if((data & 0x80) != 0)
 359  0004 7b02          	ld	a,(OFST+1,sp)
 360  0006 2a06          	jrpl	L551
 361                     ; 89 	  SDA_HIGH;
 363  0008 72165005      	bset	20485,#3
 365  000c 2004          	jra	L751
 366  000e               L551:
 367                     ; 93 	  SDA_LOW;
 369  000e 72175005      	bres	20485,#3
 370  0012               L751:
 371                     ; 95     toggle_scl();//goes high
 373  0012 cd0000        	call	_toggle_scl
 375                     ; 96     DELAY_US(I2C_DELAY);
 377  0015 ae0006        	ldw	x,#6
 379  0018               L23:
 380  0018 5a            	decw	X
 381  0019 26fd          	jrne	L23
 382  001b 9d            	nop	
 384                     ; 97     toggle_scl();//goes low
 387  001c cd0000        	call	_toggle_scl
 389                     ; 98     data <<= 1;
 391  001f 0802          	sll	(OFST+1,sp)
 392                     ; 99     DELAY_US(I2C_DELAY);
 394  0021 ae0006        	ldw	x,#6
 396  0024               L63:
 397  0024 5a            	decw	X
 398  0025 26fd          	jrne	L63
 400                     ; 85   for (bit = 0; bit < 8; bit++) 
 403  0027 0c01          	inc	(OFST+0,sp)
 404  0029 9d            	nop	
 407  002a 7b01          	ld	a,(OFST+0,sp)
 408  002c a108          	cp	a,#8
 409  002e 25d4          	jrult	L741
 410                     ; 102   SDA_HIGH;
 412  0030 72165005      	bset	20485,#3
 413                     ; 103   toggle_scl(); //goes high for the 9th clock
 415  0034 cd0000        	call	_toggle_scl
 417                     ; 105   if(SDA_READ)
 419  0037 7207500603    	btjf	20486,#3,L161
 420                     ; 107     return 0;			
 422  003c 4f            	clr	a
 424  003d 2013          	jra	L05
 425  003f               L161:
 426                     ; 109   DELAY_US(I2C_DELAY);
 428  003f ae0006        	ldw	x,#6
 430  0042               L24:
 431  0042 5a            	decw	X
 432  0043 26fd          	jrne	L24
 433  0045 9d            	nop	
 435                     ; 111   toggle_scl(); //end of byte with acknowledgment. 
 438  0046 cd0000        	call	_toggle_scl
 440                     ; 112   DELAY_US(I2C_DELAY); 
 442  0049 ae0006        	ldw	x,#6
 444  004c               L64:
 445  004c 5a            	decw	X
 446  004d 26fd          	jrne	L64
 447  004f 9d            	nop	
 449                     ; 113   return 1;
 452  0050 a601          	ld	a,#1
 454  0052               L05:
 456  0052 85            	popw	x
 457  0053 81            	ret	
 529                     ; 122 u8 I2C_ReadByte(u8* rcvdata, u8 bytes, u8 index)
 529                     ; 123 {
 530                     .text:	section	.text,new
 531  0000               _I2C_ReadByte:
 533  0000 89            	pushw	x
 534  0001 89            	pushw	x
 535       00000002      OFST:	set	2
 538                     ; 124   u8 byte = 0;
 540  0002 0f01          	clr	(OFST-1,sp)
 541                     ; 125   u8 bit = 0;
 543                     ; 127   SDA_HIGH;
 545  0004 72165005      	bset	20485,#3
 546                     ; 128   for (bit = 0; bit < 8; bit++) 
 548  0008 0f02          	clr	(OFST+0,sp)
 549  000a               L122:
 550                     ; 130     toggle_scl();//goes high
 552  000a cd0000        	call	_toggle_scl
 554                     ; 131     if(SDA_READ)
 556  000d 7207500613    	btjf	20486,#3,L722
 557                     ; 133 	  byte |= (u8)((1 << (7- bit)));
 559  0012 a607          	ld	a,#7
 560  0014 1002          	sub	a,(OFST+0,sp)
 561  0016 5f            	clrw	x
 562  0017 97            	ld	xl,a
 563  0018 a601          	ld	a,#1
 564  001a 5d            	tnzw	x
 565  001b 2704          	jreq	L65
 566  001d               L06:
 567  001d 48            	sll	a
 568  001e 5a            	decw	x
 569  001f 26fc          	jrne	L06
 570  0021               L65:
 571  0021 1a01          	or	a,(OFST-1,sp)
 572  0023 6b01          	ld	(OFST-1,sp),a
 573  0025               L722:
 574                     ; 135     DELAY_US(I2C_DELAY);
 576  0025 ae0006        	ldw	x,#6
 578  0028               L26:
 579  0028 5a            	decw	X
 580  0029 26fd          	jrne	L26
 581  002b 9d            	nop	
 583                     ; 136     toggle_scl();//goes low
 586  002c cd0000        	call	_toggle_scl
 588                     ; 137     DELAY_US(I2C_DELAY);
 590  002f ae0006        	ldw	x,#6
 592  0032               L66:
 593  0032 5a            	decw	X
 594  0033 26fd          	jrne	L66
 596                     ; 128   for (bit = 0; bit < 8; bit++) 
 599  0035 0c02          	inc	(OFST+0,sp)
 600  0037 9d            	nop	
 603  0038 7b02          	ld	a,(OFST+0,sp)
 604  003a a108          	cp	a,#8
 605  003c 25cc          	jrult	L122
 606                     ; 139   rcvdata[index] = byte;
 608  003e 7b03          	ld	a,(OFST+1,sp)
 609  0040 97            	ld	xl,a
 610  0041 7b04          	ld	a,(OFST+2,sp)
 611  0043 1b08          	add	a,(OFST+6,sp)
 612  0045 2401          	jrnc	L07
 613  0047 5c            	incw	x
 614  0048               L07:
 615  0048 02            	rlwa	x,a
 616  0049 7b01          	ld	a,(OFST-1,sp)
 617  004b f7            	ld	(x),a
 618                     ; 140   if(index < (bytes-1))
 620  004c 5f            	clrw	x
 621  004d 7b07          	ld	a,(OFST+5,sp)
 622  004f 97            	ld	xl,a
 623  0050 5a            	decw	x
 624  0051 7b08          	ld	a,(OFST+6,sp)
 625  0053 905f          	clrw	y
 626  0055 9097          	ld	yl,a
 627  0057 90bf00        	ldw	c_y,y
 628  005a b300          	cpw	x,c_y
 629  005c 2d1d          	jrsle	L132
 630                     ; 142     SDA_LOW;
 632  005e 72175005      	bres	20485,#3
 633                     ; 143     toggle_scl(); //goes high for the 9th clock
 635  0062 cd0000        	call	_toggle_scl
 637                     ; 144     DELAY_US(I2C_DELAY);
 639  0065 ae0006        	ldw	x,#6
 641  0068               L47:
 642  0068 5a            	decw	X
 643  0069 26fd          	jrne	L47
 644  006b 9d            	nop	
 646                     ; 146     toggle_scl(); //end of byte with acknowledgment. 
 649  006c cd0000        	call	_toggle_scl
 651                     ; 148     SDA_HIGH;
 653  006f 72165005      	bset	20485,#3
 654                     ; 149     DELAY_US(I2C_DELAY);
 656  0073 ae0006        	ldw	x,#6
 658  0076               L001:
 659  0076 5a            	decw	X
 660  0077 26fd          	jrne	L001
 664  0079 2017          	jra	L332
 665  007b               L132:
 666                     ; 153     SDA_HIGH;
 668  007b 72165005      	bset	20485,#3
 669                     ; 154     toggle_scl(); //goes high for the 9th clock
 671  007f cd0000        	call	_toggle_scl
 673                     ; 155     DELAY_US(I2C_DELAY);
 675  0082 ae0006        	ldw	x,#6
 677  0085               L401:
 678  0085 5a            	decw	X
 679  0086 26fd          	jrne	L401
 680  0088 9d            	nop	
 682                     ; 157     toggle_scl(); //end of byte with acknowledgment. 
 685  0089 cd0000        	call	_toggle_scl
 687                     ; 159     DELAY_US(I2C_DELAY);
 689  008c ae0006        	ldw	x,#6
 691  008f               L011:
 692  008f 5a            	decw	X
 693  0090 26fd          	jrne	L011
 695  0092               L332:
 696  0092 9d            	nop	
 697                     ; 161   return 1;
 699  0093 a601          	ld	a,#1
 702  0095 5b04          	addw	sp,#4
 703  0097 81            	ret	
 787                     ; 171 u8 I2C_WriteBytes(u8* indata, u8 bytes, u8 slave_adr, u8 slave_reg)
 787                     ; 172 {
 788                     .text:	section	.text,new
 789  0000               _I2C_WriteBytes:
 791  0000 89            	pushw	x
 792  0001 89            	pushw	x
 793       00000002      OFST:	set	2
 796                     ; 173 	u8 index, ack = 0;
 798  0002 0f01          	clr	(OFST-1,sp)
 799                     ; 175 	if(!I2C_StartCond())
 801  0004 cd0000        	call	_I2C_StartCond
 803  0007 4d            	tnz	a
 804                     ; 177 		return 0;
 807  0008 2708          	jreq	L231
 808                     ; 179 	if(!I2C_WriteByte((u8)(slave_adr | WRITE)))
 810  000a 7b08          	ld	a,(OFST+6,sp)
 811  000c cd0000        	call	_I2C_WriteByte
 813  000f 4d            	tnz	a
 814  0010 2603          	jrne	L103
 815                     ; 181 		return 0;	
 818  0012               L231:
 820  0012 5b04          	addw	sp,#4
 821  0014 81            	ret	
 822  0015               L103:
 823                     ; 183 	if(!I2C_WriteByte(slave_reg))
 825  0015 7b09          	ld	a,(OFST+7,sp)
 826  0017 cd0000        	call	_I2C_WriteByte
 828  001a 4d            	tnz	a
 829                     ; 185       return 0;	
 832  001b 27f5          	jreq	L231
 833                     ; 187 	for(index = 0; index < bytes; index++)
 835  001d 0f02          	clr	(OFST+0,sp)
 837  001f 2029          	jra	L113
 838  0021               L503:
 839                     ; 189 		 ack = I2C_WriteByte(indata[index]);
 841  0021 7b03          	ld	a,(OFST+1,sp)
 842  0023 97            	ld	xl,a
 843  0024 7b04          	ld	a,(OFST+2,sp)
 844  0026 1b02          	add	a,(OFST+0,sp)
 845  0028 2401          	jrnc	L421
 846  002a 5c            	incw	x
 847  002b               L421:
 848  002b 02            	rlwa	x,a
 849  002c f6            	ld	a,(x)
 850  002d cd0000        	call	_I2C_WriteByte
 852  0030 6b01          	ld	(OFST-1,sp),a
 853                     ; 190 		 if(!ack)
 855  0032 2614          	jrne	L513
 856                     ; 192 			break;	
 857  0034               L313:
 858                     ; 196 	write_scl(1);
 860  0034 a601          	ld	a,#1
 861  0036 cd0000        	call	_write_scl
 863                     ; 197 	DELAY_US(SCL_SDA_DELAY);
 865  0039 ae0008        	ldw	x,#8
 867  003c               L031:
 868  003c 5a            	decw	X
 869  003d 26fd          	jrne	L031
 871                     ; 198 	SDA_HIGH;
 874  003f 72165005      	bset	20485,#3
 875  0043 9d            	nop	
 876                     ; 199 	return ack;
 878  0044 7b01          	ld	a,(OFST-1,sp)
 880  0046 20ca          	jra	L231
 881  0048               L513:
 882                     ; 187 	for(index = 0; index < bytes; index++)
 884  0048 0c02          	inc	(OFST+0,sp)
 885  004a               L113:
 888  004a 7b02          	ld	a,(OFST+0,sp)
 889  004c 1107          	cp	a,(OFST+5,sp)
 890  004e 25d1          	jrult	L503
 891  0050 20e2          	jra	L313
 975                     ; 209 u8 I2C_ReadBytes(u8* data, u8 bytes, u8 slave_adr, u8 slave_reg)
 975                     ; 210 {
 976                     .text:	section	.text,new
 977  0000               _I2C_ReadBytes:
 979  0000 89            	pushw	x
 980  0001 89            	pushw	x
 981       00000002      OFST:	set	2
 984                     ; 211   u8 index, success = 0;
 986  0002 0f01          	clr	(OFST-1,sp)
 987                     ; 212   if(!I2C_StartCond())
 989  0004 cd0000        	call	_I2C_StartCond
 991  0007 4d            	tnz	a
 992                     ; 214     return 0;
 995  0008 2708          	jreq	L261
 996                     ; 216   if(!I2C_WriteByte((u8)(slave_adr | WRITE)))
 998  000a 7b08          	ld	a,(OFST+6,sp)
 999  000c cd0000        	call	_I2C_WriteByte
1001  000f 4d            	tnz	a
1002  0010 2603          	jrne	L363
1003                     ; 218     return 0;	
1006  0012               L261:
1008  0012 5b04          	addw	sp,#4
1009  0014 81            	ret	
1010  0015               L363:
1011                     ; 220   if(!I2C_WriteByte(slave_reg))
1013  0015 7b09          	ld	a,(OFST+7,sp)
1014  0017 cd0000        	call	_I2C_WriteByte
1016  001a 4d            	tnz	a
1017                     ; 222     return 0;	
1020  001b 27f5          	jreq	L261
1021                     ; 224   write_scl(1);
1023  001d a601          	ld	a,#1
1024  001f cd0000        	call	_write_scl
1026                     ; 225 	DELAY_US(SCL_SDA_DELAY);
1028  0022 ae0008        	ldw	x,#8
1030  0025               L641:
1031  0025 5a            	decw	X
1032  0026 26fd          	jrne	L641
1033  0028 9d            	nop	
1035                     ; 226 	SDA_HIGH;
1038  0029 72165005      	bset	20485,#3
1039                     ; 227   if(!I2C_StartCond())
1041  002d cd0000        	call	_I2C_StartCond
1043  0030 4d            	tnz	a
1044                     ; 229     return 0;
1047  0031 27df          	jreq	L261
1048                     ; 231   if(!I2C_WriteByte((u8)(slave_adr | READ)))
1050  0033 7b08          	ld	a,(OFST+6,sp)
1051  0035 aa01          	or	a,#1
1052  0037 cd0000        	call	_I2C_WriteByte
1054  003a 4d            	tnz	a
1055                     ; 233     return 0;	
1058  003b 27d5          	jreq	L261
1059                     ; 235   for(index = 0; index < bytes; index++)
1061  003d 0f02          	clr	(OFST+0,sp)
1063  003f 2024          	jra	L773
1064  0041               L373:
1065                     ; 237     success = I2C_ReadByte(data, bytes, index);
1067  0041 88            	push	a
1068  0042 7b08          	ld	a,(OFST+6,sp)
1069  0044 88            	push	a
1070  0045 1e05          	ldw	x,(OFST+3,sp)
1071  0047 cd0000        	call	_I2C_ReadByte
1073  004a 85            	popw	x
1074  004b 6b01          	ld	(OFST-1,sp),a
1075                     ; 238     if(!success)
1077  004d 2614          	jrne	L304
1078                     ; 240       break; 
1079  004f               L104:
1080                     ; 244   write_scl(1);
1082  004f a601          	ld	a,#1
1083  0051 cd0000        	call	_write_scl
1085                     ; 245   DELAY_US(SCL_SDA_DELAY);
1087  0054 ae0008        	ldw	x,#8
1089  0057               L061:
1090  0057 5a            	decw	X
1091  0058 26fd          	jrne	L061
1093                     ; 246   SDA_HIGH;
1096  005a 72165005      	bset	20485,#3
1097  005e 9d            	nop	
1098                     ; 247   return success;
1100  005f 7b01          	ld	a,(OFST-1,sp)
1102  0061 20af          	jra	L261
1103  0063               L304:
1104                     ; 235   for(index = 0; index < bytes; index++)
1106  0063 0c02          	inc	(OFST+0,sp)
1107  0065               L773:
1110  0065 7b02          	ld	a,(OFST+0,sp)
1111  0067 1107          	cp	a,(OFST+5,sp)
1112  0069 25d6          	jrult	L373
1113  006b 20e2          	jra	L104
1126                     	xdef	_I2C_ReadBytes
1127                     	xdef	_I2C_WriteBytes
1128                     	xdef	_I2C_ReadByte
1129                     	xdef	_I2C_WriteByte
1130                     	xdef	_toggle_scl
1131                     	xdef	_I2C_StartCond
1132                     	xdef	_write_scl
1133                     	xdef	_I2C_Flush
1134                     	xref.b	c_y
1153                     	end
