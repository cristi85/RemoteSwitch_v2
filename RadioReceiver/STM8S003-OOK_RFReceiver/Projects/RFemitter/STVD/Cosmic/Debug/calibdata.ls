   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  22                     	bsct
  23  0000               _Calib_Status:
  24  0000 00            	dc.b	0
 103                     ; 15 void CalibData_Update(u16 address, u8* data, u8 size)
 103                     ; 16 {
 105                     .text:	section	.text,new
 106  0000               _CalibData_Update:
 108  0000 89            	pushw	x
 109  0001 5204          	subw	sp,#4
 110       00000004      OFST:	set	4
 113                     ; 17   u8 i, CHKSUM = 0;
 115  0003 0f03          	clr	(OFST-1,sp)
 116                     ; 19   FLASH->PUKR = FLASH_RASS_KEY1;
 118  0005 35565062      	mov	20578,#86
 119                     ; 20   FLASH->PUKR = FLASH_RASS_KEY2;
 121  0009 35ae5062      	mov	20578,#174
 122                     ; 23   for(i = 0; i < size; i++)
 124  000d 0f04          	clr	(OFST+0,sp)
 126  000f 200c          	jra	L35
 127  0011               L74:
 128                     ; 25     CHKSUM += *data;
 130  0011 1e09          	ldw	x,(OFST+5,sp)
 131  0013 7b03          	ld	a,(OFST-1,sp)
 132  0015 fb            	add	a,(x)
 133  0016 6b03          	ld	(OFST-1,sp),a
 134                     ; 26     data++;
 136  0018 5c            	incw	x
 137  0019 1f09          	ldw	(OFST+5,sp),x
 138                     ; 23   for(i = 0; i < size; i++)
 140  001b 0c04          	inc	(OFST+0,sp)
 141  001d               L35:
 144  001d 7b04          	ld	a,(OFST+0,sp)
 145  001f 110b          	cp	a,(OFST+7,sp)
 146  0021 25ee          	jrult	L74
 147                     ; 28   CHKSUM = ~CHKSUM;
 149  0023 0303          	cpl	(OFST-1,sp)
 150                     ; 29   if(CHKSUM != *(data)) 
 152  0025 1e09          	ldw	x,(OFST+5,sp)
 153  0027 f6            	ld	a,(x)
 154  0028 1103          	cp	a,(OFST-1,sp)
 155  002a 2706          	jreq	L75
 156                     ; 31     Calib_Status.CRCDoNotMatch = 1;
 158  002c 72120000      	bset	_Calib_Status,#1
 159                     ; 33     FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_PROG;
 160                     ; 34     return;
 162  0030 2033          	jp	LC001
 163  0032               L75:
 164                     ; 36   data -= size;
 166  0032 7b0b          	ld	a,(OFST+7,sp)
 167  0034 5f            	clrw	x
 168  0035 97            	ld	xl,a
 169  0036 1f01          	ldw	(OFST-3,sp),x
 170  0038 1e09          	ldw	x,(OFST+5,sp)
 171  003a 72f001        	subw	x,(OFST-3,sp)
 172  003d 1f09          	ldw	(OFST+5,sp),x
 174  003f 202b          	jra	L36
 175  0041               L16:
 176                     ; 40     if(address >= CAL_Base_Address && address < CAL_MAX_Address)
 178  0041 1e05          	ldw	x,(OFST+1,sp)
 179  0043 a30000        	cpw	x,#_CAL
 180  0046 2519          	jrult	L76
 182  0048 a3000d        	cpw	x,#_CAL+13
 183  004b 2414          	jruge	L76
 184                     ; 42       *(PointerAttr u8*) (u16)address = *data;
 186  004d 1e09          	ldw	x,(OFST+5,sp)
 187  004f f6            	ld	a,(x)
 188  0050 1e05          	ldw	x,(OFST+1,sp)
 189  0052 f7            	ld	(x),a
 190                     ; 43       data++;
 192  0053 1e09          	ldw	x,(OFST+5,sp)
 193  0055 5c            	incw	x
 194  0056 1f09          	ldw	(OFST+5,sp),x
 195                     ; 44       address++;
 197  0058 1e05          	ldw	x,(OFST+1,sp)
 198  005a 5c            	incw	x
 199  005b 1f05          	ldw	(OFST+1,sp),x
 200                     ; 45       size--;
 202  005d 0a0b          	dec	(OFST+7,sp)
 204  005f 200b          	jra	L36
 205  0061               L76:
 206                     ; 49       Calib_Status.AddressOutOfRAnge = 1;
 208  0061 72100000      	bset	_Calib_Status,#0
 209                     ; 51       FLASH->IAPSR &= (uint8_t)FLASH_MEMTYPE_PROG;
 211  0065               LC001:
 213  0065 7213505f      	bres	20575,#1
 214                     ; 52       return;
 215  0069               L6:
 218  0069 5b06          	addw	sp,#6
 219  006b 81            	ret	
 220  006c               L36:
 221                     ; 38   while(size > 0)
 223  006c 7b0b          	ld	a,(OFST+7,sp)
 224  006e 26d1          	jrne	L16
 225                     ; 57 }
 227  0070 20f7          	jra	L6
 279                     	xdef	_CalibData_Update
 280                     	xdef	_Calib_Status
 281                     	xref	_CAL
 300                     	end
