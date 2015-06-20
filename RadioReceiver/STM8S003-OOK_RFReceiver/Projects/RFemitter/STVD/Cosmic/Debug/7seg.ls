   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  61                     ; 4 void SevenSegInit()
  61                     ; 5 {
  63                     .text:	section	.text,new
  64  0000               _SevenSegInit:
  66  0000 88            	push	a
  67       00000001      OFST:	set	1
  70                     ; 7  DISP_SDI_1;
  72  0001 7214500f      	bset	20495,#2
  73                     ; 8  for(i = 0; i < 32; i++)
  75  0005 0f01          	clr	(OFST+0,sp)
  76  0007               L72:
  77                     ; 10   DISP_CLK_1;
  79  0007 721e500f      	bset	20495,#7
  80                     ; 11   DELAY_US(DELAY_6US);
  82  000b ae0020        	ldw	x,#32
  84  000e               L6:
  85  000e 5a            	decw	X
  86  000f 26fd          	jrne	L6
  87  0011 9d            	nop	
  89                     ; 12   DISP_CLK_0;
  92  0012 721f500f      	bres	20495,#7
  93                     ; 13   DELAY_US(DELAY_6US);
  95  0016 ae0020        	ldw	x,#32
  97  0019               L01:
  98  0019 5a            	decw	X
  99  001a 26fd          	jrne	L01
 101                     ; 8  for(i = 0; i < 32; i++)
 104  001c 0c01          	inc	(OFST+0,sp)
 105  001e 9d            	nop	
 108  001f 7b01          	ld	a,(OFST+0,sp)
 109  0021 a120          	cp	a,#32
 110  0023 25e2          	jrult	L72
 111                     ; 15  DELAY_US(DELAY_6US);
 113  0025 ae0020        	ldw	x,#32
 115  0028               L21:
 116  0028 5a            	decw	X
 117  0029 26fd          	jrne	L21
 118  002b 9d            	nop	
 120                     ; 16  DISP_LE_1;
 123  002c 7218500f      	bset	20495,#4
 124                     ; 17  DELAY_US(DELAY_6US);
 126  0030 ae0020        	ldw	x,#32
 128  0033               L41:
 129  0033 5a            	decw	X
 130  0034 26fd          	jrne	L41
 131  0036 9d            	nop	
 133                     ; 18  DISP_LE_0;
 136  0037 7219500f      	bres	20495,#4
 137                     ; 19 }
 140  003b 84            	pop	a
 141  003c 81            	ret	
 194                     ; 20 void SevenSegOut(u16 number)
 194                     ; 21 {
 195                     .text:	section	.text,new
 196  0000               _SevenSegOut:
 198  0000 89            	pushw	x
 199  0001 5203          	subw	sp,#3
 200       00000003      OFST:	set	3
 203                     ; 22  u16 tmp = 0x8000;
 205  0003 ae8000        	ldw	x,#32768
 206  0006 1f01          	ldw	(OFST-2,sp),x
 207                     ; 24  DISP_CLK_0;
 209  0008 721f500f      	bres	20495,#7
 210                     ; 25  for(i = 0; i < 16; i++)
 212  000c 0f03          	clr	(OFST+0,sp)
 213  000e               L36:
 214                     ; 27   DISP_SDI_0;
 216  000e 7215500f      	bres	20495,#2
 217                     ; 28   if(number & tmp) {
 219  0012 1e04          	ldw	x,(OFST+1,sp)
 220  0014 01            	rrwa	x,a
 221  0015 1402          	and	a,(OFST-1,sp)
 222  0017 01            	rrwa	x,a
 223  0018 1401          	and	a,(OFST-2,sp)
 224  001a 01            	rrwa	x,a
 225  001b 5d            	tnzw	x
 226  001c 2704          	jreq	L17
 227                     ; 29    DISP_SDI_1;
 229  001e 7214500f      	bset	20495,#2
 230  0022               L17:
 231                     ; 31   DELAY_US(DELAY_6US);
 233  0022 ae0020        	ldw	x,#32
 235  0025               L02:
 236  0025 5a            	decw	X
 237  0026 26fd          	jrne	L02
 238  0028 9d            	nop	
 240                     ; 32   DISP_CLK_1;
 243  0029 721e500f      	bset	20495,#7
 244                     ; 33   DELAY_US(DELAY_6US);
 246  002d ae0020        	ldw	x,#32
 248  0030               L22:
 249  0030 5a            	decw	X
 250  0031 26fd          	jrne	L22
 251  0033 9d            	nop	
 253                     ; 34   DISP_CLK_0;
 256  0034 721f500f      	bres	20495,#7
 257                     ; 35   DELAY_US(DELAY_6US);
 259  0038 ae0020        	ldw	x,#32
 261  003b               L42:
 262  003b 5a            	decw	X
 263  003c 26fd          	jrne	L42
 265                     ; 36   tmp >>= 1;
 268  003e 0401          	srl	(OFST-2,sp)
 269  0040 0602          	rrc	(OFST-1,sp)
 270                     ; 25  for(i = 0; i < 16; i++)
 272  0042 0c03          	inc	(OFST+0,sp)
 273  0044 9d            	nop	
 276  0045 7b03          	ld	a,(OFST+0,sp)
 277  0047 a110          	cp	a,#16
 278  0049 25c3          	jrult	L36
 279                     ; 38 }
 282  004b 5b05          	addw	sp,#5
 283  004d 81            	ret	
 306                     ; 40 void SevenSegRefresh()
 306                     ; 41 {
 307                     .text:	section	.text,new
 308  0000               _SevenSegRefresh:
 312                     ; 42  DISP_LE_0;
 314  0000 7219500f      	bres	20495,#4
 315                     ; 43  DELAY_US(DELAY_6US);
 317  0004 ae0020        	ldw	x,#32
 319  0007               L03:
 320  0007 5a            	decw	X
 321  0008 26fd          	jrne	L03
 322  000a 9d            	nop	
 324                     ; 44  DISP_LE_1;
 327  000b 7218500f      	bset	20495,#4
 328                     ; 45  DELAY_US(DELAY_6US);
 330  000f ae0020        	ldw	x,#32
 332  0012               L23:
 333  0012 5a            	decw	X
 334  0013 26fd          	jrne	L23
 335  0015 9d            	nop	
 337                     ; 46  DISP_LE_0;
 340  0016 7219500f      	bres	20495,#4
 341                     ; 47 }
 344  001a 81            	ret	
 357                     	xdef	_SevenSegRefresh
 358                     	xdef	_SevenSegOut
 359                     	xdef	_SevenSegInit
 378                     	end
