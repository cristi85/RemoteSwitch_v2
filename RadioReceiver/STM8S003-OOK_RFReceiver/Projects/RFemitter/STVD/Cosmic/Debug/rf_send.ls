   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  70                     ; 6 void send_rf_byte(unsigned char txdat)
  70                     ; 7 {
  72                     .text:	section	.text,new
  73  0000               _send_rf_byte:
  75  0000 88            	push	a
  76       00000001      OFST:	set	1
  79                     ; 27   for(tbit=0; tbit<8; tbit++)
  81  0001 0f01          	clr	(OFST+0,sp)
  82  0003               L33:
  85  0003 0c01          	inc	(OFST+0,sp)
  88  0005 7b01          	ld	a,(OFST+0,sp)
  89  0007 a108          	cp	a,#8
  90  0009 25f8          	jrult	L33
  91                     ; 36 }
  94  000b 84            	pop	a
  95  000c 81            	ret	
 108                     	xdef	_send_rf_byte
 127                     	end
