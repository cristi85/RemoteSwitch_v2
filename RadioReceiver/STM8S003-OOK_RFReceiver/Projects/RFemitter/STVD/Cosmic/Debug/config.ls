   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  72                     ; 3 void Config()
  72                     ; 4 {
  74                     .text:	section	.text,new
  75  0000               _Config:
  79                     ; 6   CLK_DeInit();
  81  0000 cd0000        	call	_CLK_DeInit
  83                     ; 7   CLK_CCOCmd(FALSE);
  85  0003 4f            	clr	a
  86  0004 cd0000        	call	_CLK_CCOCmd
  88                     ; 8   CLK_HSICmd(ENABLE);
  90  0007 a601          	ld	a,#1
  91  0009 cd0000        	call	_CLK_HSICmd
  94  000c               L32:
  95                     ; 9   while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);  //wait until HSI not ready
  97  000c ae0102        	ldw	x,#258
  98  000f cd0000        	call	_CLK_GetFlagStatus
 100  0012 4d            	tnz	a
 101  0013 27f7          	jreq	L32
 102                     ; 10   CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV2);             //set HSI prescaler to 2, 16/2 = 8 MHz
 104  0015 a608          	ld	a,#8
 105  0017 cd0000        	call	_CLK_SYSCLKConfig
 107                     ; 12   CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 109  001a a680          	ld	a,#128
 110  001c cd0000        	call	_CLK_SYSCLKConfig
 112                     ; 13   CLK_FastHaltWakeUpCmd(ENABLE);                       //this automatically selects the HSI clock as master clock after MCU wakeup from Halt or Active-halt
 114  001f a601          	ld	a,#1
 115  0021 cd0000        	call	_CLK_FastHaltWakeUpCmd
 117                     ; 16   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);   /* 8bit: timeouts */
 119  0024 ae0401        	ldw	x,#1025
 120  0027 cd0000        	call	_CLK_PeripheralClockConfig
 122                     ; 17   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);   /* delay_10us */
 124  002a ae0501        	ldw	x,#1281
 125  002d cd0000        	call	_CLK_PeripheralClockConfig
 127                     ; 18   CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);   /* RF pulses measurement */
 129  0030 ae0701        	ldw	x,#1793
 130  0033 cd0000        	call	_CLK_PeripheralClockConfig
 132                     ; 21   GPIO_Init(BTN_PORT, BTN_PIN, GPIO_MODE_IN_FL_NO_IT);
 134  0036 4b00          	push	#0
 135  0038 4b80          	push	#128
 136  003a ae5005        	ldw	x,#20485
 137  003d cd0000        	call	_GPIO_Init
 139  0040 85            	popw	x
 140                     ; 24   GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
 142  0041 4bf0          	push	#240
 143  0043 4b01          	push	#1
 144  0045 ae500f        	ldw	x,#20495
 145  0048 cd0000        	call	_GPIO_Init
 147  004b 85            	popw	x
 148                     ; 27   GPIO_Init(RFRCV_PORT, RFRCV_PIN, GPIO_MODE_IN_FL_NO_IT);         /* RF receive timer trigger reset and capture pin(falling) - input pullup */
 150  004c 4b00          	push	#0
 151  004e 4b04          	push	#4
 152  0050 ae500a        	ldw	x,#20490
 153  0053 cd0000        	call	_GPIO_Init
 155  0056 85            	popw	x
 156                     ; 33   GPIO_Init(LCD_RS_PORT, LCD_RS_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 158  0057 4be0          	push	#224
 159  0059 4b04          	push	#4
 160  005b ae500f        	ldw	x,#20495
 161  005e cd0000        	call	_GPIO_Init
 163  0061 85            	popw	x
 164                     ; 35   GPIO_Init(LCD_EN_PORT, LCD_EN_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 166  0062 4be0          	push	#224
 167  0064 4b08          	push	#8
 168  0066 ae500f        	ldw	x,#20495
 169  0069 cd0000        	call	_GPIO_Init
 171  006c 85            	popw	x
 172                     ; 37   GPIO_Init(LCD_D4_PORT, LCD_D4_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 174  006d 4be0          	push	#224
 175  006f 4b10          	push	#16
 176  0071 ae500f        	ldw	x,#20495
 177  0074 cd0000        	call	_GPIO_Init
 179  0077 85            	popw	x
 180                     ; 39   GPIO_Init(LCD_D5_PORT, LCD_D5_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 182  0078 4be0          	push	#224
 183  007a 4b20          	push	#32
 184  007c ae500f        	ldw	x,#20495
 185  007f cd0000        	call	_GPIO_Init
 187  0082 85            	popw	x
 188                     ; 41   GPIO_Init(LCD_D6_PORT, LCD_D6_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 190  0083 4be0          	push	#224
 191  0085 4b40          	push	#64
 192  0087 ae500f        	ldw	x,#20495
 193  008a cd0000        	call	_GPIO_Init
 195  008d 85            	popw	x
 196                     ; 43   GPIO_Init(LCD_D7_PORT, LCD_D7_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 198  008e 4be0          	push	#224
 199  0090 4b80          	push	#128
 200  0092 ae500f        	ldw	x,#20495
 201  0095 cd0000        	call	_GPIO_Init
 203  0098 85            	popw	x
 204                     ; 46   TIM4_DeInit();
 206  0099 cd0000        	call	_TIM4_DeInit
 208                     ; 47   TIM4_TimeBaseInit(TIM4_PRESCALER_64, 250);   // 2MS overflow interval
 210  009c ae06fa        	ldw	x,#1786
 211  009f cd0000        	call	_TIM4_TimeBaseInit
 213                     ; 48   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 215  00a2 ae0101        	ldw	x,#257
 216  00a5 cd0000        	call	_TIM4_ITConfig
 218                     ; 49   TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 220  00a8 a601          	ld	a,#1
 221  00aa cd0000        	call	_TIM4_ClearITPendingBit
 223                     ; 50   TIM4_Cmd(ENABLE);
 225  00ad a601          	ld	a,#1
 226  00af cd0000        	call	_TIM4_Cmd
 228                     ; 53   TIM2_DeInit();
 230  00b2 cd0000        	call	_TIM2_DeInit
 232                     ; 54   TIM2_ITConfig(TIM2_IT_UPDATE, DISABLE);
 234  00b5 ae0100        	ldw	x,#256
 235  00b8 cd0000        	call	_TIM2_ITConfig
 237                     ; 55   TIM2_TimeBaseInit(TIM4_PRESCALER_2, 40);   // 10us overflow interval
 239  00bb ae0028        	ldw	x,#40
 240  00be 89            	pushw	x
 241  00bf a601          	ld	a,#1
 242  00c1 cd0000        	call	_TIM2_TimeBaseInit
 244  00c4 4f            	clr	a
 245  00c5 85            	popw	x
 246                     ; 56   TIM2_Cmd(DISABLE);
 248  00c6 cd0000        	call	_TIM2_Cmd
 250                     ; 63   TIM1_DeInit();
 252  00c9 cd0000        	call	_TIM1_DeInit
 254                     ; 64   TIM1_TimeBaseInit(8, TIM1_COUNTERMODE_UP, 4000, 0x00);    // 4ms overflow period, 1us resolution                                                        
 256  00cc 4b00          	push	#0
 257  00ce ae0fa0        	ldw	x,#4000
 258  00d1 89            	pushw	x
 259  00d2 4b00          	push	#0
 260  00d4 ae0008        	ldw	x,#8
 261  00d7 cd0000        	call	_TIM1_TimeBaseInit
 263  00da 5b04          	addw	sp,#4
 264                     ; 65   TIM1->SMCR |= 0x04;                                        // Slave mode control register
 266  00dc 72145252      	bset	21074,#2
 267                     ; 72   TIM1->SMCR |= 0x60;                                        // Slave mode control register, Trigger selection, TS = 110
 269  00e0 c65252        	ld	a,21074
 270  00e3 aa60          	or	a,#96
 271  00e5 c75252        	ld	21074,a
 272                     ; 76   TIM1->CCMR2 |= 0x01;                                       // Capture/compare mode register 2, CC2S[1:0]: Capture/compare 2 selection, CC2S = 01
 274  00e8 72105259      	bset	21081,#0
 275                     ; 81   TIM1->CCER1 |= 0x10;                                       // Capture/compare enable register 1, CC2E = 1
 277  00ec 7218525c      	bset	21084,#4
 278                     ; 88   TIM1->CCER1 |= (u8)(0x20);                                 // Capture/compare enable register 1, CC2P = 1
 280  00f0 721a525c      	bset	21084,#5
 281                     ; 101   TIM1_ITConfig(TIM1_IT_CC2, ENABLE);                        // interrupt on timer capture compare 3 - falling edge of pulse
 283  00f4 ae0401        	ldw	x,#1025
 284  00f7 cd0000        	call	_TIM1_ITConfig
 286                     ; 102   TIM1_ClearITPendingBit(TIM1_FLAG_CC2);
 288  00fa a604          	ld	a,#4
 289  00fc cd0000        	call	_TIM1_ClearITPendingBit
 291                     ; 103   TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 293  00ff a601          	ld	a,#1
 294  0101 cd0000        	call	_TIM1_ClearITPendingBit
 296                     ; 104   TIM1_Cmd(ENABLE);
 298  0104 a601          	ld	a,#1
 300                     ; 105 }
 303  0106 cc0000        	jp	_TIM1_Cmd
 316                     	xdef	_Config
 317                     	xref	_TIM4_ClearITPendingBit
 318                     	xref	_TIM4_ITConfig
 319                     	xref	_TIM4_Cmd
 320                     	xref	_TIM4_TimeBaseInit
 321                     	xref	_TIM4_DeInit
 322                     	xref	_TIM2_ITConfig
 323                     	xref	_TIM2_Cmd
 324                     	xref	_TIM2_TimeBaseInit
 325                     	xref	_TIM2_DeInit
 326                     	xref	_TIM1_ClearITPendingBit
 327                     	xref	_TIM1_ITConfig
 328                     	xref	_TIM1_Cmd
 329                     	xref	_TIM1_TimeBaseInit
 330                     	xref	_TIM1_DeInit
 331                     	xref	_GPIO_Init
 332                     	xref	_CLK_GetFlagStatus
 333                     	xref	_CLK_SYSCLKConfig
 334                     	xref	_CLK_PeripheralClockConfig
 335                     	xref	_CLK_FastHaltWakeUpCmd
 336                     	xref	_CLK_CCOCmd
 337                     	xref	_CLK_HSICmd
 338                     	xref	_CLK_DeInit
 357                     	end
