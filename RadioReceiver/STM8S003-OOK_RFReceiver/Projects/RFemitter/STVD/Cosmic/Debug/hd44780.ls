   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  51                     ; 8 void LCD_Clock()
  51                     ; 9 {
  53                     .text:	section	.text,new
  54  0000               _LCD_Clock:
  58                     ; 10   LCD_EN(1);
  60  0000 7216500f      	bset	20495,#3
  61                     ; 11   delay_10us(LCD_CK_DEL/10);
  63  0004 ae0005        	ldw	x,#5
  64  0007 cd0000        	call	_delay_10us
  66                     ; 12   LCD_EN(0);
  68  000a 7217500f      	bres	20495,#3
  69                     ; 13 }
  72  000e 81            	ret	
 108                     ; 15 void LCD_Write(u8 c)
 108                     ; 16 {
 109                     .text:	section	.text,new
 110  0000               _LCD_Write:
 112  0000 88            	push	a
 113       00000000      OFST:	set	0
 116                     ; 17   LCD_D7((u8)((c >> 7) & 0x01));
 118  0001 49            	rlc	a
 119  0002 4f            	clr	a
 120  0003 49            	rlc	a
 121  0004 2609          	jrne	L21
 122  0006 721f500f      	bres	20495,#7
 123  000a c6500f        	ld	a,20495
 124  000d 2008          	jra	L41
 125  000f               L21:
 126  000f 721e500f      	bset	20495,#7
 127  0013 c6500f        	ld	a,20495
 128  0016 97            	ld	xl,a
 129  0017               L41:
 130                     ; 18   LCD_D6((u8)((c >> 6) & 0x01));
 132  0017 7b01          	ld	a,(OFST+1,sp)
 133  0019 4e            	swap	a
 134  001a a40c          	and	a,#12
 135  001c 44            	srl	a
 136  001d 44            	srl	a
 137  001e a501          	bcp	a,#1
 138  0020 2609          	jrne	L61
 139  0022 721d500f      	bres	20495,#6
 140  0026 c6500f        	ld	a,20495
 141  0029 2008          	jra	L02
 142  002b               L61:
 143  002b 721c500f      	bset	20495,#6
 144  002f c6500f        	ld	a,20495
 145  0032 97            	ld	xl,a
 146  0033               L02:
 147                     ; 19   LCD_D5((u8)((c >> 5) & 0x01));
 149  0033 7b01          	ld	a,(OFST+1,sp)
 150  0035 4e            	swap	a
 151  0036 a40e          	and	a,#14
 152  0038 44            	srl	a
 153  0039 a501          	bcp	a,#1
 154  003b 2609          	jrne	L22
 155  003d 721b500f      	bres	20495,#5
 156  0041 c6500f        	ld	a,20495
 157  0044 2008          	jra	L42
 158  0046               L22:
 159  0046 721a500f      	bset	20495,#5
 160  004a c6500f        	ld	a,20495
 161  004d 97            	ld	xl,a
 162  004e               L42:
 163                     ; 20   LCD_D4((u8)((c >> 4) & 0x01));
 165  004e 7b01          	ld	a,(OFST+1,sp)
 166  0050 4e            	swap	a
 167  0051 a40f          	and	a,#15
 168  0053 a501          	bcp	a,#1
 169  0055 2609          	jrne	L62
 170  0057 7219500f      	bres	20495,#4
 171  005b c6500f        	ld	a,20495
 172  005e 2008          	jra	L03
 173  0060               L62:
 174  0060 7218500f      	bset	20495,#4
 175  0064 c6500f        	ld	a,20495
 176  0067 97            	ld	xl,a
 177  0068               L03:
 178                     ; 21   LCD_Clock();  // 4-bit only
 180  0068 cd0000        	call	_LCD_Clock
 182                     ; 22   LCD_D7((u8)((c >> 3) & 0x01));
 184  006b 7b01          	ld	a,(OFST+1,sp)
 185  006d 44            	srl	a
 186  006e 44            	srl	a
 187  006f 44            	srl	a
 188  0070 a501          	bcp	a,#1
 189  0072 2609          	jrne	L43
 190  0074 721f500f      	bres	20495,#7
 191  0078 c6500f        	ld	a,20495
 192  007b 2008          	jra	L63
 193  007d               L43:
 194  007d 721e500f      	bset	20495,#7
 195  0081 c6500f        	ld	a,20495
 196  0084 97            	ld	xl,a
 197  0085               L63:
 198                     ; 23   LCD_D6((u8)((c >> 2) & 0x01));
 200  0085 7b01          	ld	a,(OFST+1,sp)
 201  0087 44            	srl	a
 202  0088 44            	srl	a
 203  0089 a501          	bcp	a,#1
 204  008b 2609          	jrne	L04
 205  008d 721d500f      	bres	20495,#6
 206  0091 c6500f        	ld	a,20495
 207  0094 2008          	jra	L24
 208  0096               L04:
 209  0096 721c500f      	bset	20495,#6
 210  009a c6500f        	ld	a,20495
 211  009d 97            	ld	xl,a
 212  009e               L24:
 213                     ; 24   LCD_D5((u8)((c >> 1) & 0x01));
 215  009e 7b01          	ld	a,(OFST+1,sp)
 216  00a0 44            	srl	a
 217  00a1 a501          	bcp	a,#1
 218  00a3 2609          	jrne	L44
 219  00a5 721b500f      	bres	20495,#5
 220  00a9 c6500f        	ld	a,20495
 221  00ac 2008          	jra	L64
 222  00ae               L44:
 223  00ae 721a500f      	bset	20495,#5
 224  00b2 c6500f        	ld	a,20495
 225  00b5 97            	ld	xl,a
 226  00b6               L64:
 227                     ; 25   LCD_D4((u8)((c >> 0) & 0x01));
 229  00b6 7b01          	ld	a,(OFST+1,sp)
 230  00b8 a501          	bcp	a,#1
 231  00ba 2609          	jrne	L05
 232  00bc 7219500f      	bres	20495,#4
 233  00c0 c6500f        	ld	a,20495
 234  00c3 2008          	jra	L25
 235  00c5               L05:
 236  00c5 7218500f      	bset	20495,#4
 237  00c9 c6500f        	ld	a,20495
 238  00cc 97            	ld	xl,a
 239  00cd               L25:
 240                     ; 26   LCD_Clock();
 242  00cd cd0000        	call	_LCD_Clock
 244                     ; 27   delay_10us(10);
 246  00d0 ae000a        	ldw	x,#10
 247  00d3 cd0000        	call	_delay_10us
 249                     ; 28 }
 252  00d6 84            	pop	a
 253  00d7 81            	ret	
 279                     ; 30 void LCD_Initialize()
 279                     ; 31 {
 280                     .text:	section	.text,new
 281  0000               _LCD_Initialize:
 285                     ; 32   LCD_RS(0);
 287  0000 7215500f      	bres	20495,#2
 288                     ; 33   LCD_EN(0);
 290  0004 7217500f      	bres	20495,#3
 291                     ; 35   LCD_D7(0);
 293  0008 ad41          	call	LC002
 294                     ; 38   LCD_D4(1);
 296  000a 7218500f      	bset	20495,#4
 297                     ; 39   LCD_Clock();
 299  000e cd0000        	call	_LCD_Clock
 301                     ; 40   delay_10us(500);
 303  0011 ae01f4        	ldw	x,#500
 304  0014 cd0000        	call	_delay_10us
 306                     ; 42   LCD_Clock();
 308  0017 ad29          	call	LC001
 310                     ; 45   LCD_Clock();
 312  0019 ad27          	call	LC001
 314                     ; 48   LCD_D7(0);
 316  001b ad2e          	call	LC002
 317                     ; 51   LCD_D4(0);
 319  001d 7219500f      	bres	20495,#4
 320                     ; 52   LCD_Clock();
 322  0021 ad1f          	call	LC001
 324                     ; 60   LCD_Write((((LCD_DL<<4)&0x10)+((LCD_N<<3)&0x08)+((LCD_F <<2)&0x04)) | 0x20);
 326  0023 a628          	ld	a,#40
 327  0025 cd0000        	call	_LCD_Write
 329                     ; 65   LCD_Write(0x08);   //Display is off, cursor off, cursor blink off
 331  0028 a608          	ld	a,#8
 332  002a cd0000        	call	_LCD_Write
 334                     ; 68   LCD_Write(0x01);   
 336  002d a601          	ld	a,#1
 337  002f cd0000        	call	_LCD_Write
 339                     ; 70   delay_10us(400);   //Wait for more than 3ms or until busy flag is clear
 341  0032 ae0190        	ldw	x,#400
 342  0035 cd0000        	call	_delay_10us
 344                     ; 75   LCD_Write((((LCD_ID<<1)&0x02)+(LCD_S&0x01)) | 0x04);
 346  0038 a604          	ld	a,#4
 347  003a cd0000        	call	_LCD_Write
 349                     ; 82   LCD_Write((((LCD_D<<2)&0x04)+((LCD_C<<1)&0x02)+(LCD_B&0x01)) | 0x08);
 351  003d a60c          	ld	a,#12
 353                     ; 88 }
 356  003f cc0000        	jp	_LCD_Write
 357  0042               LC001:
 358  0042 cd0000        	call	_LCD_Clock
 360                     ; 53   delay_10us(100);
 362  0045 ae0064        	ldw	x,#100
 363  0048 cc0000        	jp	_delay_10us
 364  004b               LC002:
 365  004b 721f500f      	bres	20495,#7
 366                     ; 49   LCD_D6(0);
 368  004f 721d500f      	bres	20495,#6
 369                     ; 50   LCD_D5(1);
 371  0053 721a500f      	bset	20495,#5
 372  0057 81            	ret	
 375                     	switch	.ubsct
 376  0000               L74_numstr:
 377  0000 000000000000  	ds.b	10
 429                     .const:	section	.text
 430  0000               L221:
 431  0000 0000000a      	dc.l	10
 432                     ; 93 void LCD_WriteNumber(u32 num)
 432                     ; 94 {
 433                     .text:	section	.text,new
 434  0000               _LCD_WriteNumber:
 436  0000 88            	push	a
 437       00000001      OFST:	set	1
 440                     ; 95   LCD_RS(1);    // Data send
 442  0001 7214500f      	bset	20495,#2
 443                     ; 96   if (num == 0) LCD_Write('0');
 445  0005 96            	ldw	x,sp
 446  0006 1c0004        	addw	x,#OFST+3
 447  0009 cd0000        	call	c_lzmp
 449  000c 2607          	jrne	L77
 452  000e a630          	ld	a,#48
 453  0010 cd0000        	call	_LCD_Write
 456  0013               L101:
 457                     ; 110 }
 460  0013 84            	pop	a
 461  0014 81            	ret	
 462  0015               L77:
 463                     ; 100     u8 CurPos=0;
 465  0015 0f01          	clr	(OFST+0,sp)
 467  0017 202f          	jra	L701
 468  0019               L301:
 469                     ; 103       numstr[CurPos] = (u8)((u8)(num%10) + 48);
 471  0019 7b01          	ld	a,(OFST+0,sp)
 472  001b 5f            	clrw	x
 473  001c 97            	ld	xl,a
 474  001d 89            	pushw	x
 475  001e 96            	ldw	x,sp
 476  001f 1c0006        	addw	x,#OFST+5
 477  0022 cd0000        	call	c_ltor
 479  0025 ae0000        	ldw	x,#L221
 480  0028 cd0000        	call	c_lumd
 482  002b b603          	ld	a,c_lreg+3
 483  002d 85            	popw	x
 484  002e ab30          	add	a,#48
 485  0030 e700          	ld	(L74_numstr,x),a
 486                     ; 104       num /= 10;
 488  0032 96            	ldw	x,sp
 489  0033 1c0004        	addw	x,#OFST+3
 490  0036 cd0000        	call	c_ltor
 492  0039 ae0000        	ldw	x,#L221
 493  003c cd0000        	call	c_ludv
 495  003f 96            	ldw	x,sp
 496  0040 1c0004        	addw	x,#OFST+3
 497  0043 cd0000        	call	c_rtol
 499                     ; 105       CurPos++;
 501  0046 0c01          	inc	(OFST+0,sp)
 502  0048               L701:
 503                     ; 101     while (num != 0)
 505  0048 96            	ldw	x,sp
 506  0049 1c0004        	addw	x,#OFST+3
 507  004c cd0000        	call	c_lzmp
 509  004f 26c8          	jrne	L301
 511  0051 2009          	jra	L511
 512  0053               L311:
 513                     ; 108     while (CurPos--) LCD_Write(numstr[CurPos]);
 515  0053 7b01          	ld	a,(OFST+0,sp)
 516  0055 5f            	clrw	x
 517  0056 97            	ld	xl,a
 518  0057 e600          	ld	a,(L74_numstr,x)
 519  0059 cd0000        	call	_LCD_Write
 521  005c               L511:
 524  005c 7b01          	ld	a,(OFST+0,sp)
 525  005e 0a01          	dec	(OFST+0,sp)
 526  0060 4d            	tnz	a
 527  0061 26f0          	jrne	L311
 528  0063 20ae          	jra	L101
 573                     ; 112 void LCD_WriteByte(u8 num, _Bool prefix)
 573                     ; 113 {
 574                     .text:	section	.text,new
 575  0000               _LCD_WriteByte:
 577  0000 89            	pushw	x
 578       00000000      OFST:	set	0
 581                     ; 114   LCD_RS(1);    // Data send
 583  0001 7214500f      	bset	20495,#2
 584                     ; 115   if(prefix)
 586  0005 7b02          	ld	a,(OFST+2,sp)
 587  0007 a501          	bcp	a,#1
 588  0009 270a          	jreq	L341
 589                     ; 117     LCD_Write('0');
 591  000b a630          	ld	a,#48
 592  000d cd0000        	call	_LCD_Write
 594                     ; 118     LCD_Write('x');
 596  0010 a678          	ld	a,#120
 597  0012 cd0000        	call	_LCD_Write
 599  0015               L341:
 600                     ; 120   if(((num & 0xF0) >> 4) < 10) LCD_Write(((num & 0xF0) >> 4) + 48);
 602  0015 7b01          	ld	a,(OFST+1,sp)
 603  0017 4e            	swap	a
 604  0018 a40f          	and	a,#15
 605  001a 5f            	clrw	x
 606  001b 97            	ld	xl,a
 607  001c a3000a        	cpw	x,#10
 608  001f 2e09          	jrsge	L541
 611  0021 7b01          	ld	a,(OFST+1,sp)
 612  0023 4e            	swap	a
 613  0024 a40f          	and	a,#15
 614  0026 ab30          	add	a,#48
 617  0028 2007          	jra	L741
 618  002a               L541:
 619                     ; 121   else LCD_Write(((num & 0xF0) >> 4) + 55);
 621  002a 7b01          	ld	a,(OFST+1,sp)
 622  002c 4e            	swap	a
 623  002d a40f          	and	a,#15
 624  002f ab37          	add	a,#55
 626  0031               L741:
 627  0031 cd0000        	call	_LCD_Write
 628                     ; 122   if((num & 0x0F) < 10) LCD_Write((num & 0x0F) + 48);
 630  0034 7b01          	ld	a,(OFST+1,sp)
 631  0036 a40f          	and	a,#15
 632  0038 a10a          	cp	a,#10
 633  003a 7b01          	ld	a,(OFST+1,sp)
 634  003c a40f          	and	a,#15
 635  003e 2404          	jruge	L151
 638  0040 ab30          	add	a,#48
 641  0042 2002          	jra	L351
 642  0044               L151:
 643                     ; 123   else LCD_Write((num & 0x0F) + 55);
 645  0044 ab37          	add	a,#55
 647  0046               L351:
 648  0046 cd0000        	call	_LCD_Write
 649                     ; 124 }
 652  0049 85            	popw	x
 653  004a 81            	ret	
 690                     ; 126 void LCD_WriteString(const char* s)
 690                     ; 127 {
 691                     .text:	section	.text,new
 692  0000               _LCD_WriteString:
 694  0000 89            	pushw	x
 695       00000000      OFST:	set	0
 698                     ; 128   LCD_RS(1);  // Data send
 700  0001 7214500f      	bset	20495,#2
 702  0005 1e01          	ldw	x,(OFST+1,sp)
 703  0007 2013          	jra	L571
 704  0009               L371:
 705                     ; 131     if (*s != '\n') LCD_Write(*s);
 707  0009 a10a          	cp	a,#10
 708  000b 2705          	jreq	L102
 711  000d cd0000        	call	_LCD_Write
 714  0010 2005          	jra	L302
 715  0012               L102:
 716                     ; 132     else LCD_GoTo(0x40);
 718  0012 a640          	ld	a,#64
 719  0014 cd0000        	call	_LCD_GoTo
 721  0017               L302:
 722                     ; 134     s++;
 724  0017 1e01          	ldw	x,(OFST+1,sp)
 725  0019 5c            	incw	x
 726  001a 1f01          	ldw	(OFST+1,sp),x
 727  001c               L571:
 728                     ; 129   while(*s)
 730  001c f6            	ld	a,(x)
 731  001d 26ea          	jrne	L371
 732                     ; 136 }
 735  001f 85            	popw	x
 736  0020 81            	ret	
 761                     ; 138 void LCD_Clear(void)
 761                     ; 139 {
 762                     .text:	section	.text,new
 763  0000               _LCD_Clear:
 767                     ; 140   LCD_RS(0);    // Command send
 769  0000 7215500f      	bres	20495,#2
 770                     ; 141   LCD_Write(0x01);
 772  0004 a601          	ld	a,#1
 773  0006 cd0000        	call	_LCD_Write
 775                     ; 142   LCD_RS(1);
 777  0009 7214500f      	bset	20495,#2
 778                     ; 143   delay_10us(200);
 780  000d ae00c8        	ldw	x,#200
 782                     ; 144 }
 785  0010 cc0000        	jp	_delay_10us
 810                     ; 146 void LCD_Home(void)
 810                     ; 147 {
 811                     .text:	section	.text,new
 812  0000               _LCD_Home:
 816                     ; 148   LCD_RS(0);    // Command send
 818  0000 7215500f      	bres	20495,#2
 819                     ; 149   LCD_Write(0x02);
 821  0004 a602          	ld	a,#2
 822  0006 cd0000        	call	_LCD_Write
 824                     ; 150   LCD_RS(1);
 826  0009 7214500f      	bset	20495,#2
 827                     ; 151   delay_10us(200);
 829  000d ae00c8        	ldw	x,#200
 831                     ; 152 }
 834  0010 cc0000        	jp	_delay_10us
 870                     ; 154 void LCD_GoTo(u8 P)
 870                     ; 155 {
 871                     .text:	section	.text,new
 872  0000               _LCD_GoTo:
 876                     ; 156   LCD_RS(0);    // Command send
 878  0000 7215500f      	bres	20495,#2
 879                     ; 157   LCD_Write((u8)(0x80+P));
 881  0004 ab80          	add	a,#128
 882  0006 cd0000        	call	_LCD_Write
 884                     ; 158   LCD_RS(1);
 886  0009 7214500f      	bset	20495,#2
 887                     ; 159   delay_10us(200);
 889  000d ae00c8        	ldw	x,#200
 891                     ; 160 }
 894  0010 cc0000        	jp	_delay_10us
 939                     ; 162 void LCD_Move_Cursor(u8 row, u8 col)
 939                     ; 163 {
 940                     .text:	section	.text,new
 941  0000               _LCD_Move_Cursor:
 943  0000 89            	pushw	x
 944  0001 88            	push	a
 945       00000001      OFST:	set	1
 948                     ; 164   LCD_RS(0);    // Command send
 950  0002 7215500f      	bres	20495,#2
 951                     ; 165   LCD_Write((u8)(0x80 + 0x40*(row-1) + (col-1)));
 953  0006 9f            	ld	a,xl
 954  0007 4a            	dec	a
 955  0008 6b01          	ld	(OFST+0,sp),a
 956  000a 7b02          	ld	a,(OFST+1,sp)
 957  000c 97            	ld	xl,a
 958  000d a640          	ld	a,#64
 959  000f 42            	mul	x,a
 960  0010 9f            	ld	a,xl
 961  0011 1b01          	add	a,(OFST+0,sp)
 962  0013 ab40          	add	a,#64
 963  0015 cd0000        	call	_LCD_Write
 965                     ; 166   LCD_RS(1);
 967  0018 7214500f      	bset	20495,#2
 968                     ; 167   delay_10us(200);
 970  001c ae00c8        	ldw	x,#200
 971  001f cd0000        	call	_delay_10us
 973                     ; 168 }
 976  0022 5b03          	addw	sp,#3
 977  0024 81            	ret	
 990                     	xdef	_LCD_Move_Cursor
 991                     	xdef	_LCD_Clear
 992                     	xdef	_LCD_GoTo
 993                     	xdef	_LCD_Home
 994                     	xdef	_LCD_WriteString
 995                     	xdef	_LCD_WriteByte
 996                     	xdef	_LCD_WriteNumber
 997                     	xdef	_LCD_Initialize
 998                     	xdef	_LCD_Write
 999                     	xdef	_LCD_Clock
1000                     	xref	_delay_10us
1001                     	xref.b	c_lreg
1002                     	xref.b	c_x
1021                     	xref	c_rtol
1022                     	xref	c_ludv
1023                     	xref	c_lumd
1024                     	xref	c_ltor
1025                     	xref	c_lzmp
1026                     	end
