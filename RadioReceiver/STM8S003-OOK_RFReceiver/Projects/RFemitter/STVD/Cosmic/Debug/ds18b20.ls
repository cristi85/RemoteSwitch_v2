   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  52                     ; 21 u8 DS18B20_All_init(void)
  52                     ; 22 {
  54                     .text:	section	.text,new
  55  0000               _DS18B20_All_init:
  59                     ; 23   if(!OW_reset()) return 0;
  61  0000 cd0000        	call	_OW_reset
  63  0003 4d            	tnz	a
  64  0004 2601          	jrne	L12
  69  0006 81            	ret	
  70  0007               L12:
  71                     ; 24   OW_write_8(SKIP_ROM);           /* SKIP ROM command - used when only one sensor on bus */
  73  0007 a6cc          	ld	a,#204
  74  0009 cd0000        	call	_OW_write_8
  76                     ; 25   OW_write_8(WRITE_SCRATCHPAD);   /* WRITE SCRATCHPAD command */
  78  000c a64e          	ld	a,#78
  79  000e cd0000        	call	_OW_write_8
  81                     ; 26   OW_write_8(0x00);               /* TH register or User Byte 1 */
  83  0011 4f            	clr	a
  84  0012 cd0000        	call	_OW_write_8
  86                     ; 27   OW_write_8(0x00);               /* TL register or User Byte 2 */
  88  0015 4f            	clr	a
  89  0016 cd0000        	call	_OW_write_8
  91                     ; 28   OW_write_8(0x7F);               /* configuration register: 12 bit resolution - 750ms conversion time */
  93  0019 a67f          	ld	a,#127
  94  001b cd0000        	call	_OW_write_8
  96                     ; 29   return 1;
  98  001e a601          	ld	a,#1
 101  0020 81            	ret	
 127                     ; 35 u8 DS18B20_All_convert(void)
 127                     ; 36 {
 128                     .text:	section	.text,new
 129  0000               _DS18B20_All_convert:
 133                     ; 37   if(!OW_reset()) return 0;
 135  0000 cd0000        	call	_OW_reset
 137  0003 4d            	tnz	a
 138  0004 2601          	jrne	L33
 143  0006 81            	ret	
 144  0007               L33:
 145                     ; 38   OW_write_8(SKIP_ROM);
 147  0007 a6cc          	ld	a,#204
 148  0009 cd0000        	call	_OW_write_8
 150                     ; 39   OW_write_8(CONVERT_T);
 152  000c a644          	ld	a,#68
 153  000e cd0000        	call	_OW_write_8
 155                     ; 40   return 1;
 157  0011 a601          	ld	a,#1
 160  0013 81            	ret	
 208                     ; 51 u8 DS18B20_All_Read_Temp(s16* result)
 208                     ; 52 {
 209                     .text:	section	.text,new
 210  0000               _DS18B20_All_Read_Temp:
 212  0000 89            	pushw	x
 213  0001 89            	pushw	x
 214       00000002      OFST:	set	2
 217                     ; 54   if(!OW_reset()) return 0;
 219  0002 cd0000        	call	_OW_reset
 221  0005 4d            	tnz	a
 225  0006 2725          	jreq	L64
 226                     ; 55   OW_write_8(SKIP_ROM);
 228  0008 a6cc          	ld	a,#204
 229  000a cd0000        	call	_OW_write_8
 231                     ; 56   OW_write_8(READ_SCRATCHPAD);
 233  000d a6be          	ld	a,#190
 234  000f cd0000        	call	_OW_write_8
 236                     ; 57   tmp = OW_read_8();
 238  0012 cd0000        	call	_OW_read_8
 240  0015 5f            	clrw	x
 241  0016 97            	ld	xl,a
 242  0017 1f01          	ldw	(OFST-1,sp),x
 243                     ; 58   tmp |= OW_read_8() << 8;
 245  0019 cd0000        	call	_OW_read_8
 247  001c 5f            	clrw	x
 248  001d 97            	ld	xl,a
 249  001e 7b02          	ld	a,(OFST+0,sp)
 250  0020 01            	rrwa	x,a
 251  0021 1a01          	or	a,(OFST-1,sp)
 252  0023 01            	rrwa	x,a
 253  0024 1f01          	ldw	(OFST-1,sp),x
 254                     ; 59   *result = tmp;
 256  0026 1e03          	ldw	x,(OFST+1,sp)
 257  0028 1601          	ldw	y,(OFST-1,sp)
 258  002a ff            	ldw	(x),y
 259                     ; 60   return 1;
 261  002b a601          	ld	a,#1
 263  002d               L64:
 265  002d 5b04          	addw	sp,#4
 266  002f 81            	ret	
 305                     ; 67 u8 DS18B20_All_Read_Byte(u8* result)
 305                     ; 68 {
 306                     .text:	section	.text,new
 307  0000               _DS18B20_All_Read_Byte:
 309  0000 89            	pushw	x
 310       00000000      OFST:	set	0
 313                     ; 69   if(!OW_reset()) return 0;
 315  0001 cd0000        	call	_OW_reset
 317  0004 4d            	tnz	a
 321  0005 2712          	jreq	L26
 322                     ; 70   OW_write_8(SKIP_ROM);
 324  0007 a6cc          	ld	a,#204
 325  0009 cd0000        	call	_OW_write_8
 327                     ; 71   OW_write_8(READ_SCRATCHPAD);
 329  000c a6be          	ld	a,#190
 330  000e cd0000        	call	_OW_write_8
 332                     ; 72   *result = OW_read_8();
 334  0011 cd0000        	call	_OW_read_8
 336  0014 1e01          	ldw	x,(OFST+1,sp)
 337  0016 f7            	ld	(x),a
 338                     ; 73   return 1;
 340  0017 a601          	ld	a,#1
 342  0019               L26:
 344  0019 85            	popw	x
 345  001a 81            	ret	
 411                     ; 80 u8 DS18B20_Read_Temp(s16* result, u8* ROM_ID)
 411                     ; 81 {
 412                     .text:	section	.text,new
 413  0000               _DS18B20_Read_Temp:
 415  0000 89            	pushw	x
 416  0001 89            	pushw	x
 417       00000002      OFST:	set	2
 420                     ; 83   if(!OW_reset()) return 0;
 422  0002 cd0000        	call	_OW_reset
 424  0005 4d            	tnz	a
 428  0006 2739          	jreq	L201
 429                     ; 84   OW_write_8(MATCH_ROM);
 431  0008 a655          	ld	a,#85
 432  000a cd0000        	call	_OW_write_8
 434                     ; 85   for(i = 0; i < 8; i++)
 436  000d 5f            	clrw	x
 437  000e 1f01          	ldw	(OFST-1,sp),x
 438  0010               L531:
 439                     ; 86     OW_write_8(ROM_ID[i]);
 441  0010 72fb07        	addw	x,(OFST+5,sp)
 442  0013 f6            	ld	a,(x)
 443  0014 cd0000        	call	_OW_write_8
 445                     ; 85   for(i = 0; i < 8; i++)
 447  0017 1e01          	ldw	x,(OFST-1,sp)
 448  0019 5c            	incw	x
 449  001a 1f01          	ldw	(OFST-1,sp),x
 452  001c a30008        	cpw	x,#8
 453  001f 2fef          	jrslt	L531
 454                     ; 87   OW_write_8(READ_SCRATCHPAD);
 456  0021 a6be          	ld	a,#190
 457  0023 cd0000        	call	_OW_write_8
 459                     ; 88   tmp = OW_read_8();
 461  0026 cd0000        	call	_OW_read_8
 463  0029 5f            	clrw	x
 464  002a 97            	ld	xl,a
 465  002b 1f01          	ldw	(OFST-1,sp),x
 466                     ; 89   tmp |= OW_read_8() << 8;
 468  002d cd0000        	call	_OW_read_8
 470  0030 5f            	clrw	x
 471  0031 97            	ld	xl,a
 472  0032 7b02          	ld	a,(OFST+0,sp)
 473  0034 01            	rrwa	x,a
 474  0035 1a01          	or	a,(OFST-1,sp)
 475  0037 01            	rrwa	x,a
 476  0038 1f01          	ldw	(OFST-1,sp),x
 477                     ; 90   *result = tmp;
 479  003a 1e03          	ldw	x,(OFST+1,sp)
 480  003c 1601          	ldw	y,(OFST-1,sp)
 481  003e ff            	ldw	(x),y
 482                     ; 91   return 1;
 484  003f a601          	ld	a,#1
 486  0041               L201:
 488  0041 5b04          	addw	sp,#4
 489  0043 81            	ret	
 537                     ; 99 u8 DS18B20_Read_ROM_ID(u8* ROM_ID)
 537                     ; 100 {
 538                     .text:	section	.text,new
 539  0000               _DS18B20_Read_ROM_ID:
 541  0000 89            	pushw	x
 542  0001 89            	pushw	x
 543       00000002      OFST:	set	2
 546                     ; 102   if(!OW_reset()) return 0;
 548  0002 cd0000        	call	_OW_reset
 550  0005 4d            	tnz	a
 554  0006 271d          	jreq	L411
 555                     ; 103   OW_write_8(READ_ROM);
 557  0008 a633          	ld	a,#51
 558  000a cd0000        	call	_OW_write_8
 560                     ; 104   for(i = 0; i < 8; i++)
 562  000d 5f            	clrw	x
 563  000e 1f01          	ldw	(OFST-1,sp),x
 564  0010               L761:
 565                     ; 105     ROM_ID[i] = OW_read_8();
 567  0010 cd0000        	call	_OW_read_8
 569  0013 1e01          	ldw	x,(OFST-1,sp)
 570  0015 72fb03        	addw	x,(OFST+1,sp)
 571  0018 f7            	ld	(x),a
 572                     ; 104   for(i = 0; i < 8; i++)
 574  0019 1e01          	ldw	x,(OFST-1,sp)
 575  001b 5c            	incw	x
 576  001c 1f01          	ldw	(OFST-1,sp),x
 579  001e a30008        	cpw	x,#8
 580  0021 2fed          	jrslt	L761
 581                     ; 106   return 1;
 583  0023 a601          	ld	a,#1
 585  0025               L411:
 587  0025 5b04          	addw	sp,#4
 588  0027 81            	ret	
 601                     	xdef	_DS18B20_Read_ROM_ID
 602                     	xdef	_DS18B20_Read_Temp
 603                     	xdef	_DS18B20_All_Read_Byte
 604                     	xdef	_DS18B20_All_Read_Temp
 605                     	xdef	_DS18B20_All_convert
 606                     	xdef	_DS18B20_All_init
 607                     	xref	_OW_read_8
 608                     	xref	_OW_write_8
 609                     	xref	_OW_reset
 628                     	end
