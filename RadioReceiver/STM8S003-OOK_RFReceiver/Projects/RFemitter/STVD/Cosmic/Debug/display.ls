   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  22                     .const:	section	.text
  23  0000               L3_SymbCommaA:
  24  0000 80            	dc.b	128
  25  0001               L5_SymbCommaB:
  26  0001 01            	dc.b	1
  27  0002               L7_SymbU:
  28  0002 0c70          	dc.w	3184
  29  0004               L11_SymbMinusA:
  30  0004 0100          	dc.w	256
  31  0006               L31_SymbMinusB:
  32  0006 8000          	dc.w	-32768
  33  0008               L51_SymbSpace:
  34  0008 0000          	dc.w	0
  35  000a               L71_Char_E_A:
  36  000a 0730          	dc.w	1840
  37  000c               L12_Char_E_B:
  38  000c e00c          	dc.w	-8180
  39  000e               L32_Char_c_A:
  40  000e 0130          	dc.w	304
  41  0010               L52_Char_c_B:
  42  0010 800c          	dc.w	-32756
  43  0012               L72_A:
  44  0012 0e70          	dc.w	3696
  45  0014 0840          	dc.w	2112
  46  0016 0b30          	dc.w	2864
  47  0018 0b50          	dc.w	2896
  48  001a 0d40          	dc.w	3392
  49  001c 0750          	dc.w	1872
  50  001e 0770          	dc.w	1904
  51  0020 0a40          	dc.w	2624
  52  0022 0f70          	dc.w	3952
  53  0024 0f50          	dc.w	3920
  54  0026               L13_B:
  55  0026 700e          	dc.w	28686
  56  0028 1002          	dc.w	4098
  57  002a d00c          	dc.w	-12276
  58  002c d00a          	dc.w	-12278
  59  002e b002          	dc.w	-20478
  60  0030 e00a          	dc.w	-8182
  61  0032 e00e          	dc.w	-8178
  62  0034 5002          	dc.w	20482
  63  0036 f00e          	dc.w	-4082
  64  0038 f00a          	dc.w	-4086
  65  003a               L53_ScreenTime:
  66  003a 02            	dc.b	2
  67  003b 02            	dc.b	2
  68  003c 01            	dc.b	1
 114                     ; 90 void Display_Init()
 114                     ; 91 {
 116                     .text:	section	.text,new
 117  0000               _Display_Init:
 119  0000 88            	push	a
 120       00000001      OFST:	set	1
 123                     ; 93   for(i = 0; i < SCREEN_NUM; i++)
 125  0001 4f            	clr	a
 126  0002 6b01          	ld	(OFST+0,sp),a
 127  0004               L17:
 128                     ; 96     Screen[i].display32b = 0;
 130  0004 97            	ld	xl,a
 131  0005 a604          	ld	a,#4
 132  0007 42            	mul	x,a
 133  0008 4f            	clr	a
 134  0009 e705          	ld	(L33_Screen+3,x),a
 135  000b e704          	ld	(L33_Screen+2,x),a
 136  000d e703          	ld	(L33_Screen+1,x),a
 137  000f e702          	ld	(L33_Screen,x),a
 138                     ; 93   for(i = 0; i < SCREEN_NUM; i++)
 140  0011 0c01          	inc	(OFST+0,sp)
 143  0013 7b01          	ld	a,(OFST+0,sp)
 144  0015 a103          	cp	a,#3
 145  0017 25eb          	jrult	L17
 146                     ; 98   _disp_cnt = 0;
 148  0019 3f01          	clr	L73__disp_cnt
 149                     ; 99   _disp_curr_scr = 0;
 151  001b 3f00          	clr	L14__disp_curr_scr
 152                     ; 100   FLAG_ScreensArrayEmpty = TRUE;
 154  001d 72100000      	bset	L34_FLAG_ScreensArrayEmpty
 155                     ; 101   SevenSegInit();
 157  0021 cd0000        	call	_SevenSegInit
 159                     ; 102   SevenSegRefresh();
 161  0024 cd0000        	call	_SevenSegRefresh
 163                     ; 103 }
 166  0027 84            	pop	a
 167  0028 81            	ret	
 197                     ; 105 void Display_Cyclic()
 197                     ; 106 {
 198                     .text:	section	.text,new
 199  0000               _Display_Cyclic:
 203                     ; 107   if( !FLAG_ScreensArrayEmpty )
 205  0000 7200000040    	btjt	L34_FLAG_ScreensArrayEmpty,L701
 207  0005 200a          	jra	L311
 208  0007               L111:
 209                     ; 112 	  _disp_curr_scr++;
 211  0007 3c00          	inc	L14__disp_curr_scr
 212                     ; 113 	  if(_disp_curr_scr == SCREEN_NUM) 
 214  0009 b600          	ld	a,L14__disp_curr_scr
 215  000b a103          	cp	a,#3
 216  000d 2602          	jrne	L311
 217                     ; 115 	    _disp_curr_scr = 0;
 219  000f 3f00          	clr	L14__disp_curr_scr
 220  0011               L311:
 221                     ; 110 	while(Screen[_disp_curr_scr].display32b == 0)
 223  0011 ad33          	call	LC001
 224  0013 1c0002        	addw	x,#L33_Screen
 225  0016 cd0000        	call	c_lzmp
 227  0019 27ec          	jreq	L111
 228                     ; 119     SevenSegOut(Screen[_disp_curr_scr].display16b.RightDigits);
 230  001b ad29          	call	LC001
 231  001d ee04          	ldw	x,(L33_Screen+2,x)
 232  001f cd0000        	call	_SevenSegOut
 234                     ; 120     SevenSegOut(Screen[_disp_curr_scr].display16b.LeftDigits);
 236  0022 ad22          	call	LC001
 237  0024 ee02          	ldw	x,(L33_Screen,x)
 238  0026 cd0000        	call	_SevenSegOut
 240                     ; 121     SevenSegRefresh();
 242  0029 cd0000        	call	_SevenSegRefresh
 244                     ; 123     _disp_cnt++;
 246  002c 3c01          	inc	L73__disp_cnt
 247                     ; 125 	if(_disp_cnt == ScreenTime[_disp_curr_scr])
 249  002e 5f            	clrw	x
 250  002f b600          	ld	a,L14__disp_curr_scr
 251  0031 97            	ld	xl,a
 252  0032 d6003a        	ld	a,(L53_ScreenTime,x)
 253  0035 b101          	cp	a,L73__disp_cnt
 254  0037 260c          	jrne	L701
 255                     ; 127 	  _disp_cnt = 0;
 257  0039 3f01          	clr	L73__disp_cnt
 258                     ; 128 	  _disp_curr_scr++;
 260  003b 3c00          	inc	L14__disp_curr_scr
 261                     ; 129 	  if(_disp_curr_scr == SCREEN_NUM) 
 263  003d b600          	ld	a,L14__disp_curr_scr
 264  003f a103          	cp	a,#3
 265  0041 2602          	jrne	L701
 266                     ; 131 	    _disp_curr_scr = 0;
 268  0043 3f00          	clr	L14__disp_curr_scr
 269  0045               L701:
 270                     ; 135 }
 273  0045 81            	ret	
 274  0046               LC001:
 275  0046 b600          	ld	a,L14__disp_curr_scr
 276  0048 97            	ld	xl,a
 277  0049 a604          	ld	a,#4
 278  004b 42            	mul	x,a
 279  004c 81            	ret	
 325                     ; 137 void Display_SetScreen32(u8 _scr_num, u32 _scr_val)
 325                     ; 138 {
 326                     .text:	section	.text,new
 327  0000               _Display_SetScreen32:
 329  0000 88            	push	a
 330       00000000      OFST:	set	0
 333                     ; 139   Screen[_scr_num].display32b = _scr_val;
 335  0001 97            	ld	xl,a
 336  0002 a604          	ld	a,#4
 337  0004 42            	mul	x,a
 338  0005 7b07          	ld	a,(OFST+7,sp)
 339  0007 e705          	ld	(L33_Screen+3,x),a
 340  0009 7b06          	ld	a,(OFST+6,sp)
 341  000b e704          	ld	(L33_Screen+2,x),a
 342  000d 7b05          	ld	a,(OFST+5,sp)
 343  000f e703          	ld	(L33_Screen+1,x),a
 344  0011 7b04          	ld	a,(OFST+4,sp)
 345  0013 e702          	ld	(L33_Screen,x),a
 346                     ; 140   FLAG_ScreensArrayEmpty = FALSE;
 348                     ; 141 }
 351  0015 84            	pop	a
 352  0016 72110000      	bres	L34_FLAG_ScreensArrayEmpty
 353  001a 81            	ret	
 408                     ; 143 void Display_SetScreen16(u8 _scr_num, u16 _scr_leftdig, u16 _scr_rightdig)
 408                     ; 144 {
 409                     .text:	section	.text,new
 410  0000               _Display_SetScreen16:
 412  0000 88            	push	a
 413       00000000      OFST:	set	0
 416                     ; 145   Screen[_scr_num].display16b.LeftDigits = _scr_leftdig;
 418  0001 97            	ld	xl,a
 419  0002 a604          	ld	a,#4
 420  0004 42            	mul	x,a
 421  0005 1604          	ldw	y,(OFST+4,sp)
 422  0007 ef02          	ldw	(L33_Screen,x),y
 423                     ; 146   Screen[_scr_num].display16b.RightDigits = _scr_rightdig;
 425  0009 7b01          	ld	a,(OFST+1,sp)
 426  000b 97            	ld	xl,a
 427  000c a604          	ld	a,#4
 428  000e 42            	mul	x,a
 429  000f 1606          	ldw	y,(OFST+6,sp)
 430  0011 ef04          	ldw	(L33_Screen+2,x),y
 431                     ; 147   FLAG_ScreensArrayEmpty = FALSE;
 433                     ; 148 }
 436  0013 84            	pop	a
 437  0014 72110000      	bres	L34_FLAG_ScreensArrayEmpty
 438  0018 81            	ret	
 503                     ; 150 void Display_MapCharToPos(u8 _scr_num, u8 pos, u16* A_val, u16* B_val)
 503                     ; 151 {
 504                     .text:	section	.text,new
 505  0000               _Display_MapCharToPos:
 507  0000 89            	pushw	x
 508       00000000      OFST:	set	0
 511                     ; 152   switch(pos)
 513  0001 9f            	ld	a,xl
 515                     ; 160     case 3: {Screen[_scr_num].display16b.RightDigits |= *B_val; break;}
 516  0002 4d            	tnz	a
 517  0003 270b          	jreq	L571
 518  0005 4a            	dec	a
 519  0006 271a          	jreq	L771
 520  0008 4a            	dec	a
 521  0009 272f          	jreq	L102
 522  000b 4a            	dec	a
 523  000c 273e          	jreq	L302
 524  000e 2052          	jra	L142
 525  0010               L571:
 526                     ; 154     case 0: {Screen[_scr_num].display16b.LeftDigits = *A_val; break;}
 528  0010 1e05          	ldw	x,(OFST+5,sp)
 529  0012 7b01          	ld	a,(OFST+1,sp)
 530  0014 905f          	clrw	y
 531  0016 9097          	ld	yl,a
 532  0018 9058          	sllw	y
 533  001a 9058          	sllw	y
 534  001c fe            	ldw	x,(x)
 535  001d 90ef02        	ldw	(L33_Screen,y),x
 538  0020 2040          	jra	L142
 539  0022               L771:
 540                     ; 156     case 1: {Screen[_scr_num].display16b.LeftDigits |= *B_val; break;}
 542  0022 7b01          	ld	a,(OFST+1,sp)
 543  0024 97            	ld	xl,a
 544  0025 a604          	ld	a,#4
 545  0027 1607          	ldw	y,(OFST+7,sp)
 546  0029 42            	mul	x,a
 547  002a 90fe          	ldw	y,(y)
 548  002c 9001          	rrwa	y,a
 549  002e ea03          	or	a,(L33_Screen+1,x)
 550  0030 9001          	rrwa	y,a
 551  0032 ea02          	or	a,(L33_Screen,x)
 552  0034 9001          	rrwa	y,a
 553  0036 ef02          	ldw	(L33_Screen,x),y
 556  0038 2028          	jra	L142
 557  003a               L102:
 558                     ; 158     case 2: {Screen[_scr_num].display16b.RightDigits = *A_val; break;}
 560  003a 1e05          	ldw	x,(OFST+5,sp)
 561  003c 7b01          	ld	a,(OFST+1,sp)
 562  003e 905f          	clrw	y
 563  0040 9097          	ld	yl,a
 564  0042 9058          	sllw	y
 565  0044 9058          	sllw	y
 566  0046 fe            	ldw	x,(x)
 567  0047 90ef04        	ldw	(L33_Screen+2,y),x
 570  004a 2016          	jra	L142
 571  004c               L302:
 572                     ; 160     case 3: {Screen[_scr_num].display16b.RightDigits |= *B_val; break;}
 574  004c 7b01          	ld	a,(OFST+1,sp)
 575  004e 97            	ld	xl,a
 576  004f a604          	ld	a,#4
 577  0051 1607          	ldw	y,(OFST+7,sp)
 578  0053 42            	mul	x,a
 579  0054 90fe          	ldw	y,(y)
 580  0056 9001          	rrwa	y,a
 581  0058 ea05          	or	a,(L33_Screen+3,x)
 582  005a 9001          	rrwa	y,a
 583  005c ea04          	or	a,(L33_Screen+2,x)
 584  005e 9001          	rrwa	y,a
 585  0060 ef04          	ldw	(L33_Screen+2,x),y
 588  0062               L142:
 589                     ; 162 }
 592  0062 85            	popw	x
 593  0063 81            	ret	
 669                     ; 168 void Display_SetScreen(u8 _scr_num, char* _scr_val, u8 commapos)
 669                     ; 169 {
 670                     .text:	section	.text,new
 671  0000               _Display_SetScreen:
 673  0000 88            	push	a
 674  0001 88            	push	a
 675       00000001      OFST:	set	1
 678                     ; 171   for(i = 0; i < 4; i++)
 680  0002 0f01          	clr	(OFST+0,sp)
 681  0004               L503:
 682                     ; 173     if(*_scr_val != 0)
 684  0004 1e05          	ldw	x,(OFST+4,sp)
 685  0006 f6            	ld	a,(x)
 686  0007 275f          	jreq	L313
 687                     ; 175       if((*_scr_val) < 48)
 689  0009 a130          	cp	a,#48
 690  000b 2417          	jruge	L513
 691                     ; 177         switch(*_scr_val)
 694                     ; 181           case ' ': { Display_MapCharToPos(_scr_num, i, &SymbSpace, &SymbSpace); break; }
 695  000d a020          	sub	a,#32
 696  000f 270d          	jreq	L542
 697  0011 a00d          	sub	a,#13
 698  0013 2653          	jrne	L313
 699                     ; 179           case '-': { Display_MapCharToPos(_scr_num, i, &SymbMinusA, &SymbMinusB); break; }
 701  0015 ae0006        	ldw	x,#L31_SymbMinusB
 702  0018 89            	pushw	x
 703  0019 ae0004        	ldw	x,#L11_SymbMinusA
 707  001c 203c          	jp	LC002
 708  001e               L542:
 709                     ; 181           case ' ': { Display_MapCharToPos(_scr_num, i, &SymbSpace, &SymbSpace); break; }
 711  001e ae0008        	ldw	x,#L51_SymbSpace
 712  0021 89            	pushw	x
 716  0022 2036          	jp	LC002
 718  0024               L513:
 719                     ; 184       else if((*_scr_val) < 58)
 721  0024 a13a          	cp	a,#58
 722  0026 2418          	jruge	L523
 723                     ; 186         Display_MapCharToPos(_scr_num, i, &A[*_scr_val - 48], &B[*_scr_val - 48]);
 725  0028 5f            	clrw	x
 726  0029 97            	ld	xl,a
 727  002a 58            	sllw	x
 728  002b 1d0060        	subw	x,#96
 729  002e 1c0026        	addw	x,#L13_B
 730  0031 89            	pushw	x
 731  0032 1e07          	ldw	x,(OFST+6,sp)
 732  0034 f6            	ld	a,(x)
 733  0035 5f            	clrw	x
 734  0036 97            	ld	xl,a
 735  0037 58            	sllw	x
 736  0038 1d0060        	subw	x,#96
 737  003b 1c0012        	addw	x,#L72_A
 740  003e 201a          	jp	LC002
 741  0040               L523:
 742                     ; 190         switch(*_scr_val)
 745                     ; 218           case 'c': { Display_MapCharToPos(_scr_num, i, &Char_c_A, &Char_c_B); break; }
 746  0040 a045          	sub	a,#69
 747  0042 2706          	jreq	L742
 748  0044 a01e          	sub	a,#30
 749  0046 270b          	jreq	L152
 750  0048 201e          	jra	L313
 751  004a               L742:
 752                     ; 198           case 'E': { Display_MapCharToPos(_scr_num, i, &Char_E_A, &Char_E_B); break; }
 754  004a ae000c        	ldw	x,#L12_Char_E_B
 755  004d 89            	pushw	x
 756  004e ae000a        	ldw	x,#L71_Char_E_A
 760  0051 2007          	jp	LC002
 761  0053               L152:
 762                     ; 218           case 'c': { Display_MapCharToPos(_scr_num, i, &Char_c_A, &Char_c_B); break; }
 764  0053 ae0010        	ldw	x,#L52_Char_c_B
 765  0056 89            	pushw	x
 766  0057 ae000e        	ldw	x,#L32_Char_c_A
 768  005a               LC002:
 769  005a 89            	pushw	x
 770  005b 7b05          	ld	a,(OFST+4,sp)
 771  005d 97            	ld	xl,a
 772  005e 7b06          	ld	a,(OFST+5,sp)
 773  0060 95            	ld	xh,a
 774  0061 cd0000        	call	_Display_MapCharToPos
 775  0064 5b04          	addw	sp,#4
 778  0066 1e05          	ldw	x,(OFST+4,sp)
 779  0068               L313:
 780                     ; 238   _scr_val++;
 782  0068 5c            	incw	x
 783  0069 1f05          	ldw	(OFST+4,sp),x
 784                     ; 171   for(i = 0; i < 4; i++)
 786  006b 0c01          	inc	(OFST+0,sp)
 789  006d 7b01          	ld	a,(OFST+0,sp)
 790  006f a104          	cp	a,#4
 791  0071 2591          	jrult	L503
 792                     ; 240   if(commapos & COMMAPOS1) Screen[_scr_num].display16b.LeftDigits |= SymbCommaA;
 794  0073 7b07          	ld	a,(OFST+6,sp)
 795  0075 a501          	bcp	a,#1
 796  0077 270b          	jreq	L533
 799  0079 7b02          	ld	a,(OFST+1,sp)
 800  007b ad5a          	call	LC005
 801  007d c60000        	ld	a,L3_SymbCommaA
 802  0080 ad44          	call	LC004
 803  0082 7b07          	ld	a,(OFST+6,sp)
 804  0084               L533:
 805                     ; 241   if(commapos & COMMAPOS2) Screen[_scr_num].display16b.LeftDigits |= SymbCommaB;
 807  0084 a502          	bcp	a,#2
 808  0086 270b          	jreq	L733
 811  0088 7b02          	ld	a,(OFST+1,sp)
 812  008a ad4b          	call	LC005
 813  008c c60001        	ld	a,L5_SymbCommaB
 814  008f ad35          	call	LC004
 815  0091 7b07          	ld	a,(OFST+6,sp)
 816  0093               L733:
 817                     ; 242   if(commapos & COMMAPOS3) Screen[_scr_num].display16b.RightDigits |= SymbCommaA;
 819  0093 a504          	bcp	a,#4
 820  0095 270b          	jreq	L143
 823  0097 7b02          	ld	a,(OFST+1,sp)
 824  0099 ad3c          	call	LC005
 825  009b c60000        	ld	a,L3_SymbCommaA
 826  009e ad15          	call	LC003
 827  00a0 7b07          	ld	a,(OFST+6,sp)
 828  00a2               L143:
 829                     ; 243   if(commapos & COMMAPOS4) Screen[_scr_num].display16b.RightDigits |= SymbCommaB;
 831  00a2 a508          	bcp	a,#8
 832  00a4 2709          	jreq	L343
 835  00a6 7b02          	ld	a,(OFST+1,sp)
 836  00a8 ad2d          	call	LC005
 837  00aa c60001        	ld	a,L5_SymbCommaB
 838  00ad ad06          	call	LC003
 839  00af               L343:
 840                     ; 245   FLAG_ScreensArrayEmpty = FALSE;
 842  00af 72110000      	bres	L34_FLAG_ScreensArrayEmpty
 843                     ; 246 }
 846  00b3 85            	popw	x
 847  00b4 81            	ret	
 848  00b5               LC003:
 849  00b5 905f          	clrw	y
 850  00b7 9097          	ld	yl,a
 851  00b9 9001          	rrwa	y,a
 852  00bb ea05          	or	a,(L33_Screen+3,x)
 853  00bd 9001          	rrwa	y,a
 854  00bf ea04          	or	a,(L33_Screen+2,x)
 855  00c1 9001          	rrwa	y,a
 856  00c3 ef04          	ldw	(L33_Screen+2,x),y
 857  00c5 81            	ret	
 858  00c6               LC004:
 859  00c6 905f          	clrw	y
 860  00c8 9097          	ld	yl,a
 861  00ca 9001          	rrwa	y,a
 862  00cc ea03          	or	a,(L33_Screen+1,x)
 863  00ce 9001          	rrwa	y,a
 864  00d0 ea02          	or	a,(L33_Screen,x)
 865  00d2 9001          	rrwa	y,a
 866  00d4 ef02          	ldw	(L33_Screen,x),y
 867  00d6 81            	ret	
 868  00d7               LC005:
 869  00d7 97            	ld	xl,a
 870  00d8 a604          	ld	a,#4
 871  00da 42            	mul	x,a
 872  00db 81            	ret	
 918                     ; 248 void Display_DisableScreen(u8 _scr_num)
 918                     ; 249 {
 919                     .text:	section	.text,new
 920  0000               _Display_DisableScreen:
 922  0000 88            	push	a
 923       00000001      OFST:	set	1
 926                     ; 251   Screen[_scr_num].display32b = 0;
 928  0001 97            	ld	xl,a
 929  0002 a604          	ld	a,#4
 930  0004 42            	mul	x,a
 931  0005 4f            	clr	a
 932  0006 e705          	ld	(L33_Screen+3,x),a
 933  0008 e704          	ld	(L33_Screen+2,x),a
 934  000a e703          	ld	(L33_Screen+1,x),a
 935  000c e702          	ld	(L33_Screen,x),a
 936                     ; 253   FLAG_ScreensArrayEmpty = TRUE;
 938  000e 72100000      	bset	L34_FLAG_ScreensArrayEmpty
 939                     ; 254   for(i = 0; i < SCREEN_NUM; i++)
 941  0012 6b01          	ld	(OFST+0,sp),a
 942  0014               L763:
 943                     ; 256     if(Screen[i].display32b != 0)
 945  0014 97            	ld	xl,a
 946  0015 a604          	ld	a,#4
 947  0017 42            	mul	x,a
 948  0018 1c0002        	addw	x,#L33_Screen
 949  001b cd0000        	call	c_lzmp
 951  001e 2706          	jreq	L573
 952                     ; 258 	  FLAG_ScreensArrayEmpty = FALSE;
 954  0020 72110000      	bres	L34_FLAG_ScreensArrayEmpty
 955                     ; 259 	  break;
 957  0024 2008          	jra	L373
 958  0026               L573:
 959                     ; 254   for(i = 0; i < SCREEN_NUM; i++)
 961  0026 0c01          	inc	(OFST+0,sp)
 964  0028 7b01          	ld	a,(OFST+0,sp)
 965  002a a103          	cp	a,#3
 966  002c 25e6          	jrult	L763
 967  002e               L373:
 968                     ; 262 }
 971  002e 84            	pop	a
 972  002f 81            	ret	
1007                     ; 266 void Display_SetBrightness(u16 dimmval)
1007                     ; 267 {
1008                     .text:	section	.text,new
1009  0000               _Display_SetBrightness:
1013                     ; 268   TIM2->CCR2H = (u8)(dimmval >> 8);
1015  0000 9e            	ld	a,xh
1016  0001 c75313        	ld	21267,a
1017                     ; 269   TIM2->CCR2L = (u8)(dimmval);
1019  0004 9f            	ld	a,xl
1020  0005 c75314        	ld	21268,a
1021                     ; 270 }
1024  0008 81            	ret	
1245                     	xdef	_Display_SetBrightness
1246                     	xdef	_Display_DisableScreen
1247                     	xdef	_Display_SetScreen
1248                     	xdef	_Display_MapCharToPos
1249                     	xdef	_Display_SetScreen16
1250                     	xdef	_Display_SetScreen32
1251                     	xdef	_Display_Cyclic
1252                     	xdef	_Display_Init
1253                     .bit:	section	.data,bit
1254  0000               L34_FLAG_ScreensArrayEmpty:
1255  0000 00            	ds.b	1
1256                     	switch	.ubsct
1257  0000               L14__disp_curr_scr:
1258  0000 00            	ds.b	1
1259  0001               L73__disp_cnt:
1260  0001 00            	ds.b	1
1261  0002               L33_Screen:
1262  0002 000000000000  	ds.b	12
1263                     	xref	_SevenSegInit
1264                     	xref	_SevenSegRefresh
1265                     	xref	_SevenSegOut
1285                     	xref	c_lzmp
1286                     	end
