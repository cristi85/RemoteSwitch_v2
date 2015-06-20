   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  62                     ; 4 u8 OW_reset(void)
  62                     ; 5 {
  64                     .text:	section	.text,new
  65  0000               _OW_reset:
  67  0000 88            	push	a
  68       00000001      OFST:	set	1
  71                     ; 7   OW_LOW();                /* master - drive bus low */
  73  0001 721d5005      	bres	20485,#6
  74                     ; 8   DELAY_US(DELAY_480US);   /* master - wait for 480us (H-480,480,640) */
  76  0005 ae0a00        	ldw	x,#2560
  78  0008               L6:
  79  0008 5a            	decw	X
  80  0009 26fd          	jrne	L6
  81  000b 9d            	nop	
  83                     ; 9   OW_HIGH();               /* master - release bus */
  86  000c 721c5005      	bset	20485,#6
  87                     ; 10   DELAY_US(DELAY_70US);    /* master - wait for 70us (I-63,70,78) */
  89  0010 ae0175        	ldw	x,#373
  91  0013               L01:
  92  0013 5a            	decw	X
  93  0014 26fd          	jrne	L01
  94  0016 9d            	nop	
  96                     ; 11   result = OW_READ();
  99  0017 c65006        	ld	a,20486
 100  001a a440          	and	a,#64
 101  001c 6b01          	ld	(OFST+0,sp),a
 102                     ; 12   DELAY_US(DELAY_410US);   /* master - wait for 410us (J-410,410,N/A) */
 104  001e ae088b        	ldw	x,#2187
 106  0021               L21:
 107  0021 5a            	decw	X
 108  0022 26fd          	jrne	L21
 110                     ; 13   OW_HIGH();               /* master - release bus */
 113  0024 721c5005      	bset	20485,#6
 114  0028 9d            	nop	
 115                     ; 14   return (u8)(result == (u8)0);
 117  0029 7b01          	ld	a,(OFST+0,sp)
 118  002b 2603          	jrne	L41
 119  002d 4c            	inc	a
 120  002e 2001          	jra	L61
 121  0030               L41:
 122  0030 4f            	clr	a
 123  0031               L61:
 126  0031 5b01          	addw	sp,#1
 127  0033 81            	ret	
 170                     ; 17 void OW_write_8(u8 data)
 170                     ; 18 {
 171                     .text:	section	.text,new
 172  0000               _OW_write_8:
 174  0000 88            	push	a
 175  0001 88            	push	a
 176       00000001      OFST:	set	1
 179                     ; 20   for(i=0; i<8; i++)
 181  0002 0f01          	clr	(OFST+0,sp)
 182  0004               L15:
 183                     ; 22     if(data & 0x01)
 185  0004 7b02          	ld	a,(OFST+1,sp)
 186  0006 a501          	bcp	a,#1
 187  0008 2717          	jreq	L75
 188                     ; 24       OW_LOW();               /* master - drive bus low */
 190  000a 721d5005      	bres	20485,#6
 191                     ; 25       DELAY_US(DELAY_6US);    /* master - wait 6us (A-5,6,15) */
 193  000e ae0020        	ldw	x,#32
 195  0011               L22:
 196  0011 5a            	decw	X
 197  0012 26fd          	jrne	L22
 198  0014 9d            	nop	
 200                     ; 26       OW_HIGH();              /* master - release bus */
 203  0015 721c5005      	bset	20485,#6
 204                     ; 27       DELAY_US(DELAY_64US);   /* master - wait 64us (B-59,64,N/A) */
 206  0019 ae0155        	ldw	x,#341
 208  001c               L42:
 209  001c 5a            	decw	X
 210  001d 26fd          	jrne	L42
 214  001f 2015          	jra	L16
 215  0021               L75:
 216                     ; 31       OW_LOW();                /* master - drive bus low */
 218  0021 721d5005      	bres	20485,#6
 219                     ; 32       DELAY_US(DELAY_60US);    /* master - wait 60us (C-60,60,120) */
 221  0025 ae0140        	ldw	x,#320
 223  0028               L62:
 224  0028 5a            	decw	X
 225  0029 26fd          	jrne	L62
 226  002b 9d            	nop	
 228                     ; 33       OW_HIGH();               /* master - release bus */
 231  002c 721c5005      	bset	20485,#6
 232                     ; 34       DELAY_US(DELAY_10US);    /* master - wait 10us (D-8,10,N/A) */
 234  0030 ae0035        	ldw	x,#53
 236  0033               L03:
 237  0033 5a            	decw	X
 238  0034 26fd          	jrne	L03
 240  0036               L16:
 241                     ; 36     data >>= 1;
 243  0036 0402          	srl	(OFST+1,sp)
 244                     ; 20   for(i=0; i<8; i++)
 246  0038 0c01          	inc	(OFST+0,sp)
 247  003a 9d            	nop	
 250  003b 7b01          	ld	a,(OFST+0,sp)
 251  003d a108          	cp	a,#8
 252  003f 25c3          	jrult	L15
 253                     ; 38 }
 256  0041 85            	popw	x
 257  0042 81            	ret	
 301                     ; 39 u8 OW_read_8(void)
 301                     ; 40 {
 302                     .text:	section	.text,new
 303  0000               _OW_read_8:
 305  0000 89            	pushw	x
 306       00000002      OFST:	set	2
 309                     ; 42   u8 result = 0;
 311  0001 0f02          	clr	(OFST+0,sp)
 312                     ; 44   for(i=0; i<8; i++)
 314  0003 0f01          	clr	(OFST-1,sp)
 315  0005               L501:
 316                     ; 46     result >>= 1;
 318  0005 0402          	srl	(OFST+0,sp)
 319                     ; 47     OW_LOW();                 /* master - drive bus low */
 321                     ; 48     DELAY_US(DELAY_6US);      /* master - wait 6us (A-5,6,15) */
 323  0007 ae0020        	ldw	x,#32
 324  000a 721d5005      	bres	20485,#6
 326  000e               L43:
 327  000e 5a            	decw	X
 328  000f 26fd          	jrne	L43
 329  0011 9d            	nop	
 331                     ; 49     OW_HIGH();                /* master - release bus */
 334  0012 721c5005      	bset	20485,#6
 335                     ; 50     DELAY_US(DELAY_9US);      /* master - wait 9us (E-5,9,12) */
 337  0016 ae0030        	ldw	x,#48
 339  0019               L63:
 340  0019 5a            	decw	X
 341  001a 26fd          	jrne	L63
 342  001c 9d            	nop	
 344                     ; 51     if(OW_READ())  result |= 0x80;
 347  001d 720d500606    	btjf	20486,#6,L311
 350  0022 7b02          	ld	a,(OFST+0,sp)
 351  0024 aa80          	or	a,#128
 352  0026 6b02          	ld	(OFST+0,sp),a
 353  0028               L311:
 354                     ; 52     DELAY_US(DELAY_55US);     /* master - wait 55us (F-50,55,N/A) */
 356  0028 ae0125        	ldw	x,#293
 358  002b               L04:
 359  002b 5a            	decw	X
 360  002c 26fd          	jrne	L04
 362                     ; 44   for(i=0; i<8; i++)
 365  002e 0c01          	inc	(OFST-1,sp)
 366  0030 9d            	nop	
 369  0031 7b01          	ld	a,(OFST-1,sp)
 370  0033 a108          	cp	a,#8
 371  0035 25ce          	jrult	L501
 372                     ; 54   return (result);
 374  0037 7b02          	ld	a,(OFST+0,sp)
 377  0039 85            	popw	x
 378  003a 81            	ret	
 391                     	xdef	_OW_read_8
 392                     	xdef	_OW_write_8
 393                     	xdef	_OW_reset
 412                     	end
