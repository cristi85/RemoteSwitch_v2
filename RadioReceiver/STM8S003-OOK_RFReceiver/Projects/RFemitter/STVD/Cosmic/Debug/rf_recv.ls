   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  88                     ; 10 void receive_rf_packet(void)
  88                     ; 11 {
  90                     .text:	section	.text,new
  91  0000               _receive_rf_packet:
  93  0000 5204          	subw	sp,#4
  94       00000004      OFST:	set	4
  97                     ; 24   rrp_bytes = 0;
  99  0002               LC001:
 101  0002 0f03          	clr	(OFST-1,sp)
 102  0004               L15:
 103                     ; 35       if(rrp_period < 100) rrp_bytes = 0;   // clear bytecount if still receiving noise
 105  0004 7b02          	ld	a,(OFST-2,sp)
 106  0006 a164          	cp	a,#100
 109  0008 25f8          	jrult	LC001
 110                     ; 41     rrp_bits = 8;
 112  000a a608          	ld	a,#8
 113  000c 6b04          	ld	(OFST+0,sp),a
 114  000e               L16:
 115                     ; 49       if(rrp_period >= 100) break;  // if >=200uS, is unexpected start pulse!
 117  000e 7b02          	ld	a,(OFST-2,sp)
 118  0010 a164          	cp	a,#100
 119  0012 2410          	jruge	L56
 122                     ; 51       if(rrp_period >= 61) rrp_data |= 0x01;    // 61 = 122uS  set LSB bit
 124  0014 a13d          	cp	a,#61
 125  0016 2506          	jrult	L17
 128  0018 7b01          	ld	a,(OFST-3,sp)
 129  001a aa01          	or	a,#1
 130  001c 6b01          	ld	(OFST-3,sp),a
 131  001e               L17:
 132                     ; 53       rrp_data <<= 1;               // save the good bit into rrp_data
 134  001e 0801          	sll	(OFST-3,sp)
 135                     ; 54       rrp_bits--;                   // and record 1 more good bit done
 137  0020 0a04          	dec	(OFST+0,sp)
 138                     ; 42     while(rrp_bits)
 138                     ; 43     {
 138                     ; 44       //while(!PORTC.F7);         // wait for input / edge
 138                     ; 45       //while(PORTC.F7);          // wait for input \ edge
 138                     ; 46       //rrp_period = TMR0L;           // grab the pulse period!
 138                     ; 47       //TMR0L = 0;                    // and ready to record next period
 138                     ; 48 
 138                     ; 49       if(rrp_period >= 100) break;  // if >=200uS, is unexpected start pulse!
 138                     ; 50 
 138                     ; 51       if(rrp_period >= 61) rrp_data |= 0x01;    // 61 = 122uS  set LSB bit
 138                     ; 52 
 138                     ; 53       rrp_data <<= 1;               // save the good bit into rrp_data
 138                     ; 54       rrp_bits--;                   // and record 1 more good bit done
 140  0022 26ea          	jrne	L16
 141  0024               L56:
 142                     ; 59     if(rrp_bits)      // if error
 144  0024 7b04          	ld	a,(OFST+0,sp)
 145  0026 2704          	jreq	L37
 146                     ; 61       rrp_bytes = 0;  // reset bytes, must run from start of a new packet again!
 148  0028 0f03          	clr	(OFST-1,sp)
 150  002a 2002          	jra	L57
 151  002c               L37:
 152                     ; 66       rrp_bytes++;                  // record another good byte was saved
 154  002c 0c03          	inc	(OFST-1,sp)
 155  002e               L57:
 156                     ; 25   while(rrp_bytes < BYTES_TO_RCV)   // loop until it has received 10 contiguous RF bytes
 158  002e 7b03          	ld	a,(OFST-1,sp)
 159  0030 a10a          	cp	a,#10
 160  0032 25d0          	jrult	L15
 161                     ; 69 }
 164  0034 5b04          	addw	sp,#4
 165  0036 81            	ret	
 190                     	xdef	_receive_rf_packet
 191                     	switch	.ubsct
 192  0000               _rxdat:
 193  0000 000000000000  	ds.b	10
 194                     	xdef	_rxdat
 214                     	end
