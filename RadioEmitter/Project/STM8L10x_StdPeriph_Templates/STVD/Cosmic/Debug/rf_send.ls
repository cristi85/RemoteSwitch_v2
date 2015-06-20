   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  69                     ; 9 void RFPULSE(u16 LOW, u16 HIGH) 
  69                     ; 10 { 
  71                     .text:	section	.text,new
  72  0000               _RFPULSE:
  74  0000 89            	pushw	x
  75       00000000      OFST:	set	0
  78                     ; 11   DELAY_US(LOW);
  81  0001               L6:
  82  0001 5a            	decw	X
  83  0002 26fd          	jrne	L6
  84  0004 9d            	nop	
  86                     ; 12   RF_OUT(1);
  89  0005 721e5005      	bset	20485,#7
  90                     ; 13   DELAY_US(HIGH);
  92  0009 1e05          	ldw	x,(OFST+5,sp)
  94  000b               L01:
  95  000b 5a            	decw	X
  96  000c 26fd          	jrne	L01
  97  000e 9d            	nop	
  99                     ; 14   RF_OUT(0);
 102  000f 721f5005      	bres	20485,#7
 103                     ; 15 }         
 106  0013 85            	popw	x
 107  0014 81            	ret	
 192                     ; 17 void RF_Send(RF_Cmd_TypeDef RFcmd)
 192                     ; 18 {
 193                     .text:	section	.text,new
 194  0000               _RF_Send:
 196  0000 5203          	subw	sp,#3
 197       00000003      OFST:	set	3
 200                     ; 20   RFmsg.RFmsgmember.RFsyncValue = RFSYNCVAL;
 202  0002 ae81b3        	ldw	x,#33203
 203  0005 bf01          	ldw	L3_RFmsg,x
 204                     ; 21   RFmsg.RFmsgmember.RFNodeId = RFNODEID;
 206  0007 35560003      	mov	L3_RFmsg+2,#86
 207                     ; 22   RFmsg.RFmsgmember.RFcmd = RFcmd;
 209  000b b704          	ld	L3_RFmsg+3,a
 210                     ; 24   chksum = 0;
 212  000d 3f00          	clr	L5_chksum
 213                     ; 26   for(i=0; i<RFSEND_DATALEN-1; i++)
 215  000f 4f            	clr	a
 216  0010 6b03          	ld	(OFST+0,sp),a
 217  0012               L101:
 218                     ; 28     chksum += RFmsg.RFmsgarray[i];
 220  0012 5f            	clrw	x
 221  0013 97            	ld	xl,a
 222  0014 b600          	ld	a,L5_chksum
 223  0016 eb01          	add	a,(L3_RFmsg,x)
 224  0018 b700          	ld	L5_chksum,a
 225                     ; 26   for(i=0; i<RFSEND_DATALEN-1; i++)
 227  001a 0c03          	inc	(OFST+0,sp)
 230  001c 7b03          	ld	a,(OFST+0,sp)
 231  001e a104          	cp	a,#4
 232  0020 25f0          	jrult	L101
 233                     ; 30   chksum = (u8)(~chksum);
 235  0022 3300          	cpl	L5_chksum
 236                     ; 31   RFmsg.RFmsgmember.RFmsgCHKSUM = chksum;
 238  0024 450005        	mov	L3_RFmsg+4,L5_chksum
 239                     ; 33   for(i=0; i<12; i++)
 241  0027 0f03          	clr	(OFST+0,sp)
 242  0029               L701:
 243                     ; 35     RFPULSE(DELAY_350US, DELAY_350US);
 245  0029 ae00e9        	ldw	x,#233
 246  002c 89            	pushw	x
 247  002d cd0000        	call	_RFPULSE
 249  0030 85            	popw	x
 250                     ; 33   for(i=0; i<12; i++)
 252  0031 0c03          	inc	(OFST+0,sp)
 255  0033 7b03          	ld	a,(OFST+0,sp)
 256  0035 a10c          	cp	a,#12
 257  0037 25f0          	jrult	L701
 258                     ; 39   RFPULSE(DELAY_850US, DELAY_400US);
 260  0039 ae010b        	ldw	x,#267
 261  003c 89            	pushw	x
 262  003d ae0237        	ldw	x,#567
 263  0040 cd0000        	call	_RFPULSE
 265  0043 85            	popw	x
 266                     ; 42   for(i=0; i<RFSEND_DATALEN; i++)
 268  0044 0f03          	clr	(OFST+0,sp)
 269  0046               L511:
 270                     ; 44     mask = 0x80;
 272  0046 a680          	ld	a,#128
 273  0048 6b02          	ld	(OFST-1,sp),a
 274                     ; 45     for(j=0; j<8; j++)
 276  004a 0f01          	clr	(OFST-2,sp)
 277  004c               L321:
 278                     ; 47       if(RFmsg.RFmsgarray[i] & mask)
 280  004c 7b03          	ld	a,(OFST+0,sp)
 281  004e 5f            	clrw	x
 282  004f 97            	ld	xl,a
 283  0050 e601          	ld	a,(L3_RFmsg,x)
 284  0052 1502          	bcp	a,(OFST-1,sp)
 285  0054 2709          	jreq	L131
 286                     ; 50         RFPULSE(DELAY_350US, DELAY_400US);
 288  0056 ae010b        	ldw	x,#267
 289  0059 89            	pushw	x
 290  005a ae00e9        	ldw	x,#233
 293  005d 2007          	jra	L331
 294  005f               L131:
 295                     ; 55         RFPULSE(DELAY_100US, DELAY_400US);
 297  005f ae010b        	ldw	x,#267
 298  0062 89            	pushw	x
 299  0063 ae003c        	ldw	x,#60
 301  0066               L331:
 302  0066 cd0000        	call	_RFPULSE
 303  0069 85            	popw	x
 304                     ; 57       mask >>= 1;
 306  006a 0402          	srl	(OFST-1,sp)
 307                     ; 45     for(j=0; j<8; j++)
 309  006c 0c01          	inc	(OFST-2,sp)
 312  006e 7b01          	ld	a,(OFST-2,sp)
 313  0070 a108          	cp	a,#8
 314  0072 25d8          	jrult	L321
 315                     ; 42   for(i=0; i<RFSEND_DATALEN; i++)
 317  0074 0c03          	inc	(OFST+0,sp)
 320  0076 7b03          	ld	a,(OFST+0,sp)
 321  0078 a105          	cp	a,#5
 322  007a 25ca          	jrult	L511
 323                     ; 60 }
 326  007c 5b03          	addw	sp,#3
 327  007e 81            	ret	
 423                     	xdef	_RFPULSE
 424                     	switch	.ubsct
 425  0000               L5_chksum:
 426  0000 00            	ds.b	1
 427  0001               L3_RFmsg:
 428  0001 0000000000    	ds.b	5
 429                     	xdef	_RF_Send
 449                     	end
