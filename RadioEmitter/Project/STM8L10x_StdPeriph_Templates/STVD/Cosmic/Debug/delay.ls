   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  60                     ; 11 void delay_ms(u16 n_ms)
  60                     ; 12 {
  62                     .text:	section	.text,new
  63  0000               _delay_ms:
  65  0000 89            	pushw	x
  66       00000000      OFST:	set	0
  69                     ; 13   TIM4->CNTR = 0;
  71  0001 725f52e6      	clr	21222
  72                     ; 15   TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  74  0005 721152e4      	bres	21220,#0
  75                     ; 17   TIM4->CR1 |= TIM4_CR1_CEN;
  77  0009 721052e0      	bset	21216,#0
  79  000d 2009          	jra	L13
  80  000f               L73:
  81                     ; 20     while((TIM4->SR1 & TIM4_IT_Update) == 0) ;
  83  000f 720152e4fb    	btjf	21220,#0,L73
  84                     ; 21     TIM4->SR1 &= (u8)(~TIM4_IT_Update);
  86  0014 721152e4      	bres	21220,#0
  87  0018               L13:
  88                     ; 18   while(n_ms--)
  90  0018 1e01          	ldw	x,(OFST+1,sp)
  91  001a 5a            	decw	x
  92  001b 1f01          	ldw	(OFST+1,sp),x
  93  001d 5c            	incw	x
  94  001e 26ef          	jrne	L73
  95                     ; 24   TIM4->CR1 &= (u8)(~TIM4_CR1_CEN);
  97  0020 721152e0      	bres	21216,#0
  98                     ; 25 }
 101  0024 85            	popw	x
 102  0025 81            	ret	
 136                     ; 35 void delay_4us(u8 n_4us)
 136                     ; 36 {
 137                     .text:	section	.text,new
 138  0000               _delay_4us:
 142                     ; 37   TIM4->CNTR = 3;
 144  0000 350352e6      	mov	21222,#3
 145                     ; 38   TIM4->ARR = n_4us;
 147  0004 c752e8        	ld	21224,a
 148                     ; 39   TIM4->SR1 &= (u8)(~TIM4_FLAG_Update);   // clear update flag
 150  0007 721152e4      	bres	21220,#0
 151                     ; 40   TIM4->CR1 |= TIM4_CR1_CEN;   // Enable Counter
 153  000b 721052e0      	bset	21216,#0
 155  000f               L36:
 156                     ; 42   while((TIM4->SR1 & TIM4_FLAG_Update) == 0);
 158  000f 720152e4fb    	btjf	21220,#0,L36
 159                     ; 43   TIM4->SR1 &= (u8)(~TIM4_FLAG_Update);
 161  0014 721152e4      	bres	21220,#0
 162                     ; 45   TIM4->CR1 &= (u8)(~TIM4_CR1_CEN);   // Disable Counter
 164  0018 721152e0      	bres	21216,#0
 165                     ; 46 }
 168  001c 81            	ret	
 181                     	xdef	_delay_4us
 182                     	xdef	_delay_ms
 201                     	end
