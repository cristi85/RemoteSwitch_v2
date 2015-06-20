   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  61                     ; 11 void delay_ms(u16 n_ms)
  61                     ; 12 {
  63                     .text:	section	.text,new
  64  0000               _delay_ms:
  66  0000 89            	pushw	x
  67       00000000      OFST:	set	0
  70                     ; 14   TIM2->PSCR = (u8)(TIM2_PRESCALER_64);
  72  0001 3506530e      	mov	21262,#6
  73                     ; 15   TIM2->ARRH = 0;
  75  0005 725f530f      	clr	21263
  76                     ; 16   TIM2->ARRL = 125;
  78  0009 357d5310      	mov	21264,#125
  79                     ; 19   TIM2->CNTRH = 0;
  81  000d 725f530c      	clr	21260
  82                     ; 20   TIM2->CNTRL = 0;
  84  0011 725f530d      	clr	21261
  85                     ; 23   TIM2->SR1 &= (u8)(~TIM2_IT_UPDATE);
  87  0015 72115304      	bres	21252,#0
  88                     ; 26   TIM2->CR1 |= TIM2_CR1_CEN;
  90  0019 72105300      	bset	21248,#0
  92  001d 2009          	jra	L13
  93  001f               L73:
  94                     ; 30     while((TIM2->SR1 & TIM2_IT_UPDATE) == 0) ;
  96  001f 72015304fb    	btjf	21252,#0,L73
  97                     ; 31     TIM2->SR1 &= (u8)(~TIM2_IT_UPDATE);
  99  0024 72115304      	bres	21252,#0
 100  0028               L13:
 101                     ; 28   while(n_ms--)
 103  0028 1e01          	ldw	x,(OFST+1,sp)
 104  002a 5a            	decw	x
 105  002b 1f01          	ldw	(OFST+1,sp),x
 106  002d 5c            	incw	x
 107  002e 26ef          	jrne	L73
 108                     ; 35   TIM2->CR1 &= (u8)(~TIM2_CR1_CEN);
 110  0030 72115300      	bres	21248,#0
 111                     ; 36 }
 114  0034 85            	popw	x
 115  0035 81            	ret	
 149                     ; 44 void delay_10us(u16 n_10us)
 149                     ; 45 {
 150                     .text:	section	.text,new
 151  0000               _delay_10us:
 153  0000 89            	pushw	x
 154       00000000      OFST:	set	0
 157                     ; 47   TIM2->CNTRH = 0;
 159  0001 725f530c      	clr	21260
 160                     ; 48   TIM2->CNTRL = 0;
 162  0005 725f530d      	clr	21261
 163                     ; 51   TIM2->SR1 &= (u8)(~TIM2_IT_UPDATE);
 165  0009 72115304      	bres	21252,#0
 166                     ; 54   TIM2->CR1 |= TIM2_CR1_CEN;
 168  000d 72105300      	bset	21248,#0
 170  0011 2009          	jra	L36
 171  0013               L17:
 172                     ; 58     while((TIM2->SR1 & TIM2_IT_UPDATE) == 0) ;
 174  0013 72015304fb    	btjf	21252,#0,L17
 175                     ; 59     TIM2->SR1 &= (u8)(~TIM2_IT_UPDATE);
 177  0018 72115304      	bres	21252,#0
 178  001c               L36:
 179                     ; 56   while(n_10us--)
 181  001c 1e01          	ldw	x,(OFST+1,sp)
 182  001e 5a            	decw	x
 183  001f 1f01          	ldw	(OFST+1,sp),x
 184  0021 5c            	incw	x
 185  0022 26ef          	jrne	L17
 186                     ; 63   TIM2->CR1 &= (u8)(~TIM2_CR1_CEN);
 188  0024 72115300      	bres	21248,#0
 189                     ; 64 }
 192  0028 85            	popw	x
 193  0029 81            	ret	
 206                     	xdef	_delay_10us
 207                     	xdef	_delay_ms
 226                     	end
