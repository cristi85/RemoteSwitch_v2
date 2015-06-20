   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  55                     ; 3 void Config()
  55                     ; 4 {
  57                     .text:	section	.text,new
  58  0000               _Config:
  62                     ; 18   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);   // 8bit: used for delay calculation, IDD(TIM4) = 3uA/MHz
  64  0000 ae0401        	ldw	x,#1025
  65  0003 cd0000        	call	_CLK_PeripheralClockConfig
  67                     ; 19   TIM4_TimeBaseInit(TIM4_Prescaler_16, 125);                // Overflow at 1ms, 2MHz/16/125 = 1000
  69  0006 ae047d        	ldw	x,#1149
  70  0009 cd0000        	call	_TIM4_TimeBaseInit
  72                     ; 22   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);   // 16bit: system periodic flags and timeouts
  74  000c ae0101        	ldw	x,#257
  75  000f cd0000        	call	_CLK_PeripheralClockConfig
  77                     ; 23   TIM2_TimeBaseInit(TIM2_Prescaler_16, TIM2_CounterMode_Up, 125); // timebase of 1ms, 2MHz/16/125
  79  0012 ae007d        	ldw	x,#125
  80  0015 89            	pushw	x
  81  0016 ae0400        	ldw	x,#1024
  82  0019 cd0000        	call	_TIM2_TimeBaseInit
  84  001c 85            	popw	x
  85                     ; 24   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
  87  001d ae0101        	ldw	x,#257
  88  0020 cd0000        	call	_TIM2_ITConfig
  90                     ; 25   TIM2_Cmd(ENABLE);
  92  0023 a601          	ld	a,#1
  93  0025 cd0000        	call	_TIM2_Cmd
  95                     ; 28   GPIO_Init(LED_PORT, LED_PIN1, GPIO_Mode_Out_PP_Low_Slow);
  97  0028 4bc0          	push	#192
  98  002a 4b08          	push	#8
  99  002c ae500a        	ldw	x,#20490
 100  002f cd0000        	call	_GPIO_Init
 102  0032 85            	popw	x
 103                     ; 29   GPIO_Init(LED_PORT, LED_PIN2, GPIO_Mode_Out_PP_Low_Slow);
 105  0033 4bc0          	push	#192
 106  0035 4b10          	push	#16
 107  0037 ae500a        	ldw	x,#20490
 108  003a cd0000        	call	_GPIO_Init
 110  003d 85            	popw	x
 111                     ; 32   GPIO_Init(BTN1_PORT, BTN1_PIN, GPIO_Mode_In_FL_No_IT);
 113  003e 4b00          	push	#0
 114  0040 4b04          	push	#4
 115  0042 ae5000        	ldw	x,#20480
 116  0045 cd0000        	call	_GPIO_Init
 118  0048 85            	popw	x
 119                     ; 35   GPIO_Init(RF_OUT_PORT, RF_OUT_PIN, GPIO_Mode_Out_PP_Low_Fast);
 121  0049 4be0          	push	#224
 122  004b 4b80          	push	#128
 123  004d ae5005        	ldw	x,#20485
 124  0050 cd0000        	call	_GPIO_Init
 126  0053 85            	popw	x
 127                     ; 36 }
 130  0054 81            	ret	
 164                     ; 38 uint8_t spi_transfer(uint8_t tx)
 164                     ; 39 {
 165                     .text:	section	.text,new
 166  0000               _spi_transfer:
 170                     ; 40   SPI->DR = tx;
 172  0000 c75204        	ld	20996,a
 174  0003               L34:
 175                     ; 41   while(!(SPI->SR & SPI_FLAG_RXNE));
 177  0003 72015203fb    	btjf	20995,#0,L34
 178                     ; 42   return ((uint8_t)SPI->DR);
 180  0008 c65204        	ld	a,20996
 183  000b 81            	ret	
 196                     	xdef	_spi_transfer
 197                     	xdef	_Config
 198                     	xref	_TIM4_TimeBaseInit
 199                     	xref	_TIM2_ITConfig
 200                     	xref	_TIM2_Cmd
 201                     	xref	_TIM2_TimeBaseInit
 202                     	xref	_GPIO_Init
 203                     	xref	_CLK_PeripheralClockConfig
 222                     	end
