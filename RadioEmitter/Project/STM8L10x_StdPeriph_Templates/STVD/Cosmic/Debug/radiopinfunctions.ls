   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  50                     ; 15 void nrf24_setupPins()
  50                     ; 16 {
  52                     .text:	section	.text,new
  53  0000               _nrf24_setupPins:
  57                     ; 18 }
  60  0000 81            	ret	
  95                     ; 20 void nrf24_ce_digitalWrite(u8 state)
  95                     ; 21 {
  96                     .text:	section	.text,new
  97  0000               _nrf24_ce_digitalWrite:
 101                     ; 22   NRF_CE(state);
 103  0000 4d            	tnz	a
 104  0001 2608          	jrne	L01
 105  0003 72175005      	bres	20485,#3
 106  0007 c65005        	ld	a,20485
 108  000a 81            	ret	
 109  000b               L01:
 110  000b 72165005      	bset	20485,#3
 111  000f c65005        	ld	a,20485
 112                     ; 23 }
 115  0012 81            	ret	
 150                     ; 25 void nrf24_csn_digitalWrite(u8 state)
 150                     ; 26 {
 151                     .text:	section	.text,new
 152  0000               _nrf24_csn_digitalWrite:
 156                     ; 27     NRF_CSN(state);
 158  0000 4d            	tnz	a
 159  0001 2608          	jrne	L61
 160  0003 72135005      	bres	20485,#1
 161  0007 c65005        	ld	a,20485
 163  000a 81            	ret	
 164  000b               L61:
 165  000b 72125005      	bset	20485,#1
 166  000f c65005        	ld	a,20485
 167                     ; 28 }
 170  0012 81            	ret	
 183                     	xdef	_nrf24_csn_digitalWrite
 184                     	xdef	_nrf24_ce_digitalWrite
 185                     	xdef	_nrf24_setupPins
 204                     	end
