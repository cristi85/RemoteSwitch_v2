   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  50                     ; 52 void TIM1_DeInit(void)
  50                     ; 53 {
  52                     .text:	section	.text,new
  53  0000               _TIM1_DeInit:
  57                     ; 54     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  59  0000 725f5250      	clr	21072
  60                     ; 55     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  62  0004 725f5251      	clr	21073
  63                     ; 56     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  65  0008 725f5252      	clr	21074
  66                     ; 57     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  68  000c 725f5253      	clr	21075
  69                     ; 58     TIM1->IER  = TIM1_IER_RESET_VALUE;
  71  0010 725f5254      	clr	21076
  72                     ; 59     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  74  0014 725f5256      	clr	21078
  75                     ; 61     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  77  0018 725f525c      	clr	21084
  78                     ; 62     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  80  001c 725f525d      	clr	21085
  81                     ; 64     TIM1->CCMR1 = 0x01;
  83  0020 35015258      	mov	21080,#1
  84                     ; 65     TIM1->CCMR2 = 0x01;
  86  0024 35015259      	mov	21081,#1
  87                     ; 66     TIM1->CCMR3 = 0x01;
  89  0028 3501525a      	mov	21082,#1
  90                     ; 67     TIM1->CCMR4 = 0x01;
  92  002c 3501525b      	mov	21083,#1
  93                     ; 69     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  95  0030 725f525c      	clr	21084
  96                     ; 70     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  98  0034 725f525d      	clr	21085
  99                     ; 71     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 101  0038 725f5258      	clr	21080
 102                     ; 72     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 104  003c 725f5259      	clr	21081
 105                     ; 73     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 107  0040 725f525a      	clr	21082
 108                     ; 74     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 110  0044 725f525b      	clr	21083
 111                     ; 75     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 113  0048 725f525e      	clr	21086
 114                     ; 76     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 116  004c 725f525f      	clr	21087
 117                     ; 77     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 119  0050 725f5260      	clr	21088
 120                     ; 78     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 122  0054 725f5261      	clr	21089
 123                     ; 79     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 125  0058 35ff5262      	mov	21090,#255
 126                     ; 80     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 128  005c 35ff5263      	mov	21091,#255
 129                     ; 81     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 131  0060 725f5265      	clr	21093
 132                     ; 82     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 134  0064 725f5266      	clr	21094
 135                     ; 83     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 137  0068 725f5267      	clr	21095
 138                     ; 84     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 140  006c 725f5268      	clr	21096
 141                     ; 85     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 143  0070 725f5269      	clr	21097
 144                     ; 86     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 146  0074 725f526a      	clr	21098
 147                     ; 87     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 149  0078 725f526b      	clr	21099
 150                     ; 88     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 152  007c 725f526c      	clr	21100
 153                     ; 89     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 155  0080 725f526f      	clr	21103
 156                     ; 90     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 158  0084 35015257      	mov	21079,#1
 159                     ; 91     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 161  0088 725f526e      	clr	21102
 162                     ; 92     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 164  008c 725f526d      	clr	21101
 165                     ; 93     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 167  0090 725f5264      	clr	21092
 168                     ; 94     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 170  0094 725f5255      	clr	21077
 171                     ; 95 }
 174  0098 81            	ret	
 283                     ; 105 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 283                     ; 106                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 283                     ; 107                        uint16_t TIM1_Period,
 283                     ; 108                        uint8_t TIM1_RepetitionCounter)
 283                     ; 109 {
 284                     .text:	section	.text,new
 285  0000               _TIM1_TimeBaseInit:
 287  0000 89            	pushw	x
 288       00000000      OFST:	set	0
 291                     ; 112     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 293                     ; 115     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 295  0001 7b06          	ld	a,(OFST+6,sp)
 296  0003 c75262        	ld	21090,a
 297                     ; 116     TIM1->ARRL = (uint8_t)(TIM1_Period);
 299  0006 7b07          	ld	a,(OFST+7,sp)
 300  0008 c75263        	ld	21091,a
 301                     ; 119     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 303  000b 9e            	ld	a,xh
 304  000c c75260        	ld	21088,a
 305                     ; 120     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 307  000f 9f            	ld	a,xl
 308  0010 c75261        	ld	21089,a
 309                     ; 123     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 309                     ; 124                            | (uint8_t)(TIM1_CounterMode));
 311  0013 c65250        	ld	a,21072
 312  0016 a48f          	and	a,#143
 313  0018 1a05          	or	a,(OFST+5,sp)
 314  001a c75250        	ld	21072,a
 315                     ; 127     TIM1->RCR = TIM1_RepetitionCounter;
 317  001d 7b08          	ld	a,(OFST+8,sp)
 318  001f c75264        	ld	21092,a
 319                     ; 129 }
 322  0022 85            	popw	x
 323  0023 81            	ret	
 608                     ; 150 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 608                     ; 151                   TIM1_OutputState_TypeDef TIM1_OutputState,
 608                     ; 152                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 608                     ; 153                   uint16_t TIM1_Pulse,
 608                     ; 154                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 608                     ; 155                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 608                     ; 156                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 608                     ; 157                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 608                     ; 158 {
 609                     .text:	section	.text,new
 610  0000               _TIM1_OC1Init:
 612  0000 89            	pushw	x
 613  0001 5203          	subw	sp,#3
 614       00000003      OFST:	set	3
 617                     ; 160     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 619                     ; 161     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 621                     ; 162     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 623                     ; 163     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 625                     ; 164     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 627                     ; 165     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 629                     ; 166     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 631                     ; 170     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 631                     ; 171                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 633  0003 c6525c        	ld	a,21084
 634  0006 a4f0          	and	a,#240
 635  0008 c7525c        	ld	21084,a
 636                     ; 174   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 636                     ; 175                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 636                     ; 176                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 636                     ; 177                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 638  000b 7b0c          	ld	a,(OFST+9,sp)
 639  000d a408          	and	a,#8
 640  000f 6b03          	ld	(OFST+0,sp),a
 641  0011 7b0b          	ld	a,(OFST+8,sp)
 642  0013 a402          	and	a,#2
 643  0015 1a03          	or	a,(OFST+0,sp)
 644  0017 6b02          	ld	(OFST-1,sp),a
 645  0019 7b08          	ld	a,(OFST+5,sp)
 646  001b a404          	and	a,#4
 647  001d 6b01          	ld	(OFST-2,sp),a
 648  001f 9f            	ld	a,xl
 649  0020 a401          	and	a,#1
 650  0022 1a01          	or	a,(OFST-2,sp)
 651  0024 1a02          	or	a,(OFST-1,sp)
 652  0026 ca525c        	or	a,21084
 653  0029 c7525c        	ld	21084,a
 654                     ; 180     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 654                     ; 181                             (uint8_t)TIM1_OCMode);
 656  002c c65258        	ld	a,21080
 657  002f a48f          	and	a,#143
 658  0031 1a04          	or	a,(OFST+1,sp)
 659  0033 c75258        	ld	21080,a
 660                     ; 184     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 662  0036 c6526f        	ld	a,21103
 663  0039 a4fc          	and	a,#252
 664  003b c7526f        	ld	21103,a
 665                     ; 186     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 665                     ; 187                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 667  003e 7b0e          	ld	a,(OFST+11,sp)
 668  0040 a402          	and	a,#2
 669  0042 6b03          	ld	(OFST+0,sp),a
 670  0044 7b0d          	ld	a,(OFST+10,sp)
 671  0046 a401          	and	a,#1
 672  0048 1a03          	or	a,(OFST+0,sp)
 673  004a ca526f        	or	a,21103
 674  004d c7526f        	ld	21103,a
 675                     ; 190     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 677  0050 7b09          	ld	a,(OFST+6,sp)
 678  0052 c75265        	ld	21093,a
 679                     ; 191     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 681  0055 7b0a          	ld	a,(OFST+7,sp)
 682  0057 c75266        	ld	21094,a
 683                     ; 192 }
 686  005a 5b05          	addw	sp,#5
 687  005c 81            	ret	
 791                     ; 213 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 791                     ; 214                   TIM1_OutputState_TypeDef TIM1_OutputState,
 791                     ; 215                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 791                     ; 216                   uint16_t TIM1_Pulse,
 791                     ; 217                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 791                     ; 218                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 791                     ; 219                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 791                     ; 220                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 791                     ; 221 {
 792                     .text:	section	.text,new
 793  0000               _TIM1_OC2Init:
 795  0000 89            	pushw	x
 796  0001 5203          	subw	sp,#3
 797       00000003      OFST:	set	3
 800                     ; 223     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 802                     ; 224     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 804                     ; 225     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 806                     ; 226     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 808                     ; 227     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 810                     ; 228     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 812                     ; 229     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 814                     ; 233     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 814                     ; 234                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 816  0003 c6525c        	ld	a,21084
 817  0006 a40f          	and	a,#15
 818  0008 c7525c        	ld	21084,a
 819                     ; 238     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 819                     ; 239                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 819                     ; 240                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 819                     ; 241                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 821  000b 7b0c          	ld	a,(OFST+9,sp)
 822  000d a480          	and	a,#128
 823  000f 6b03          	ld	(OFST+0,sp),a
 824  0011 7b0b          	ld	a,(OFST+8,sp)
 825  0013 a420          	and	a,#32
 826  0015 1a03          	or	a,(OFST+0,sp)
 827  0017 6b02          	ld	(OFST-1,sp),a
 828  0019 7b08          	ld	a,(OFST+5,sp)
 829  001b a440          	and	a,#64
 830  001d 6b01          	ld	(OFST-2,sp),a
 831  001f 9f            	ld	a,xl
 832  0020 a410          	and	a,#16
 833  0022 1a01          	or	a,(OFST-2,sp)
 834  0024 1a02          	or	a,(OFST-1,sp)
 835  0026 ca525c        	or	a,21084
 836  0029 c7525c        	ld	21084,a
 837                     ; 244     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 837                     ; 245                              (uint8_t)TIM1_OCMode);
 839  002c c65259        	ld	a,21081
 840  002f a48f          	and	a,#143
 841  0031 1a04          	or	a,(OFST+1,sp)
 842  0033 c75259        	ld	21081,a
 843                     ; 248     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 845  0036 c6526f        	ld	a,21103
 846  0039 a4f3          	and	a,#243
 847  003b c7526f        	ld	21103,a
 848                     ; 250     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 848                     ; 251                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 850  003e 7b0e          	ld	a,(OFST+11,sp)
 851  0040 a408          	and	a,#8
 852  0042 6b03          	ld	(OFST+0,sp),a
 853  0044 7b0d          	ld	a,(OFST+10,sp)
 854  0046 a404          	and	a,#4
 855  0048 1a03          	or	a,(OFST+0,sp)
 856  004a ca526f        	or	a,21103
 857  004d c7526f        	ld	21103,a
 858                     ; 254     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 860  0050 7b09          	ld	a,(OFST+6,sp)
 861  0052 c75267        	ld	21095,a
 862                     ; 255     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 864  0055 7b0a          	ld	a,(OFST+7,sp)
 865  0057 c75268        	ld	21096,a
 866                     ; 257 }
 869  005a 5b05          	addw	sp,#5
 870  005c 81            	ret	
 974                     ; 278 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 974                     ; 279                   TIM1_OutputState_TypeDef TIM1_OutputState,
 974                     ; 280                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 974                     ; 281                   uint16_t TIM1_Pulse,
 974                     ; 282                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 974                     ; 283                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 974                     ; 284                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 974                     ; 285                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 974                     ; 286 {
 975                     .text:	section	.text,new
 976  0000               _TIM1_OC3Init:
 978  0000 89            	pushw	x
 979  0001 5203          	subw	sp,#3
 980       00000003      OFST:	set	3
 983                     ; 288     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 985                     ; 289     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 987                     ; 290     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 989                     ; 291     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 991                     ; 292     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 993                     ; 293     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 995                     ; 294     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 997                     ; 298     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 997                     ; 299                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 999  0003 c6525d        	ld	a,21085
1000  0006 a4f0          	and	a,#240
1001  0008 c7525d        	ld	21085,a
1002                     ; 302     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1002                     ; 303                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1002                     ; 304                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1002                     ; 305                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1004  000b 7b0c          	ld	a,(OFST+9,sp)
1005  000d a408          	and	a,#8
1006  000f 6b03          	ld	(OFST+0,sp),a
1007  0011 7b0b          	ld	a,(OFST+8,sp)
1008  0013 a402          	and	a,#2
1009  0015 1a03          	or	a,(OFST+0,sp)
1010  0017 6b02          	ld	(OFST-1,sp),a
1011  0019 7b08          	ld	a,(OFST+5,sp)
1012  001b a404          	and	a,#4
1013  001d 6b01          	ld	(OFST-2,sp),a
1014  001f 9f            	ld	a,xl
1015  0020 a401          	and	a,#1
1016  0022 1a01          	or	a,(OFST-2,sp)
1017  0024 1a02          	or	a,(OFST-1,sp)
1018  0026 ca525d        	or	a,21085
1019  0029 c7525d        	ld	21085,a
1020                     ; 308     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1020                     ; 309                              (uint8_t)TIM1_OCMode);
1022  002c c6525a        	ld	a,21082
1023  002f a48f          	and	a,#143
1024  0031 1a04          	or	a,(OFST+1,sp)
1025  0033 c7525a        	ld	21082,a
1026                     ; 312     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1028  0036 c6526f        	ld	a,21103
1029  0039 a4cf          	and	a,#207
1030  003b c7526f        	ld	21103,a
1031                     ; 314     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1031                     ; 315                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1033  003e 7b0e          	ld	a,(OFST+11,sp)
1034  0040 a420          	and	a,#32
1035  0042 6b03          	ld	(OFST+0,sp),a
1036  0044 7b0d          	ld	a,(OFST+10,sp)
1037  0046 a410          	and	a,#16
1038  0048 1a03          	or	a,(OFST+0,sp)
1039  004a ca526f        	or	a,21103
1040  004d c7526f        	ld	21103,a
1041                     ; 318     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1043  0050 7b09          	ld	a,(OFST+6,sp)
1044  0052 c75269        	ld	21097,a
1045                     ; 319     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1047  0055 7b0a          	ld	a,(OFST+7,sp)
1048  0057 c7526a        	ld	21098,a
1049                     ; 321 }
1052  005a 5b05          	addw	sp,#5
1053  005c 81            	ret	
1127                     ; 336 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1127                     ; 337                   TIM1_OutputState_TypeDef TIM1_OutputState,
1127                     ; 338                   uint16_t TIM1_Pulse,
1127                     ; 339                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1127                     ; 340                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1127                     ; 341 {
1128                     .text:	section	.text,new
1129  0000               _TIM1_OC4Init:
1131  0000 89            	pushw	x
1132  0001 88            	push	a
1133       00000001      OFST:	set	1
1136                     ; 343     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1138                     ; 344     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1140                     ; 345     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1142                     ; 346     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1144                     ; 349     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1146  0002 c6525d        	ld	a,21085
1147  0005 a4cf          	and	a,#207
1148  0007 c7525d        	ld	21085,a
1149                     ; 351     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1149                     ; 352                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1151  000a 7b08          	ld	a,(OFST+7,sp)
1152  000c a420          	and	a,#32
1153  000e 6b01          	ld	(OFST+0,sp),a
1154  0010 9f            	ld	a,xl
1155  0011 a410          	and	a,#16
1156  0013 1a01          	or	a,(OFST+0,sp)
1157  0015 ca525d        	or	a,21085
1158  0018 c7525d        	ld	21085,a
1159                     ; 355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1159                     ; 356                             TIM1_OCMode);
1161  001b c6525b        	ld	a,21083
1162  001e a48f          	and	a,#143
1163  0020 1a02          	or	a,(OFST+1,sp)
1164  0022 c7525b        	ld	21083,a
1165                     ; 359     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1167  0025 7b09          	ld	a,(OFST+8,sp)
1168  0027 270a          	jreq	L534
1169                     ; 361         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1171  0029 c6526f        	ld	a,21103
1172  002c aadf          	or	a,#223
1173  002e c7526f        	ld	21103,a
1175  0031 2004          	jra	L734
1176  0033               L534:
1177                     ; 365         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1179  0033 721d526f      	bres	21103,#6
1180  0037               L734:
1181                     ; 369     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1183  0037 7b06          	ld	a,(OFST+5,sp)
1184  0039 c7526b        	ld	21099,a
1185                     ; 370     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1187  003c 7b07          	ld	a,(OFST+6,sp)
1188  003e c7526c        	ld	21100,a
1189                     ; 372 }
1192  0041 5b03          	addw	sp,#3
1193  0043 81            	ret	
1398                     ; 387 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1398                     ; 388                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1398                     ; 389                      uint8_t TIM1_DeadTime,
1398                     ; 390                      TIM1_BreakState_TypeDef TIM1_Break,
1398                     ; 391                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1398                     ; 392                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1398                     ; 393 {
1399                     .text:	section	.text,new
1400  0000               _TIM1_BDTRConfig:
1402  0000 89            	pushw	x
1403  0001 88            	push	a
1404       00000001      OFST:	set	1
1407                     ; 395     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1409                     ; 396     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1411                     ; 397     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1413                     ; 398     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1415                     ; 399     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1417                     ; 401     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1419  0002 7b06          	ld	a,(OFST+5,sp)
1420  0004 c7526e        	ld	21102,a
1421                     ; 405     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1421                     ; 406                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1421                     ; 407                             (uint8_t)TIM1_AutomaticOutput));
1423  0007 7b07          	ld	a,(OFST+6,sp)
1424  0009 1a08          	or	a,(OFST+7,sp)
1425  000b 1a09          	or	a,(OFST+8,sp)
1426  000d 6b01          	ld	(OFST+0,sp),a
1427  000f 9f            	ld	a,xl
1428  0010 1a02          	or	a,(OFST+1,sp)
1429  0012 1a01          	or	a,(OFST+0,sp)
1430  0014 c7526d        	ld	21101,a
1431                     ; 409 }
1434  0017 5b03          	addw	sp,#3
1435  0019 81            	ret	
1637                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1637                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1637                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1637                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1637                     ; 427                  uint8_t TIM1_ICFilter)
1637                     ; 428 {
1638                     .text:	section	.text,new
1639  0000               _TIM1_ICInit:
1641  0000 89            	pushw	x
1642       00000000      OFST:	set	0
1645                     ; 431     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1647                     ; 432     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1649                     ; 433     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1651                     ; 434     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1653                     ; 435     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1655                     ; 437     if (TIM1_Channel == TIM1_CHANNEL_1)
1657  0001 9e            	ld	a,xh
1658  0002 4d            	tnz	a
1659  0003 2614          	jrne	L766
1660                     ; 440         TI1_Config((uint8_t)TIM1_ICPolarity,
1660                     ; 441                    (uint8_t)TIM1_ICSelection,
1660                     ; 442                    (uint8_t)TIM1_ICFilter);
1662  0005 7b07          	ld	a,(OFST+7,sp)
1663  0007 88            	push	a
1664  0008 7b06          	ld	a,(OFST+6,sp)
1665  000a 97            	ld	xl,a
1666  000b 7b03          	ld	a,(OFST+3,sp)
1667  000d 95            	ld	xh,a
1668  000e cd0000        	call	L3_TI1_Config
1670  0011 84            	pop	a
1671                     ; 444         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1673  0012 7b06          	ld	a,(OFST+6,sp)
1674  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1677  0017 2044          	jra	L176
1678  0019               L766:
1679                     ; 446     else if (TIM1_Channel == TIM1_CHANNEL_2)
1681  0019 7b01          	ld	a,(OFST+1,sp)
1682  001b a101          	cp	a,#1
1683  001d 2614          	jrne	L376
1684                     ; 449         TI2_Config((uint8_t)TIM1_ICPolarity,
1684                     ; 450                    (uint8_t)TIM1_ICSelection,
1684                     ; 451                    (uint8_t)TIM1_ICFilter);
1686  001f 7b07          	ld	a,(OFST+7,sp)
1687  0021 88            	push	a
1688  0022 7b06          	ld	a,(OFST+6,sp)
1689  0024 97            	ld	xl,a
1690  0025 7b03          	ld	a,(OFST+3,sp)
1691  0027 95            	ld	xh,a
1692  0028 cd0000        	call	L5_TI2_Config
1694  002b 84            	pop	a
1695                     ; 453         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1697  002c 7b06          	ld	a,(OFST+6,sp)
1698  002e cd0000        	call	_TIM1_SetIC2Prescaler
1701  0031 202a          	jra	L176
1702  0033               L376:
1703                     ; 455     else if (TIM1_Channel == TIM1_CHANNEL_3)
1705  0033 a102          	cp	a,#2
1706  0035 2614          	jrne	L776
1707                     ; 458         TI3_Config((uint8_t)TIM1_ICPolarity,
1707                     ; 459                    (uint8_t)TIM1_ICSelection,
1707                     ; 460                    (uint8_t)TIM1_ICFilter);
1709  0037 7b07          	ld	a,(OFST+7,sp)
1710  0039 88            	push	a
1711  003a 7b06          	ld	a,(OFST+6,sp)
1712  003c 97            	ld	xl,a
1713  003d 7b03          	ld	a,(OFST+3,sp)
1714  003f 95            	ld	xh,a
1715  0040 cd0000        	call	L7_TI3_Config
1717  0043 84            	pop	a
1718                     ; 462         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1720  0044 7b06          	ld	a,(OFST+6,sp)
1721  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1724  0049 2012          	jra	L176
1725  004b               L776:
1726                     ; 467         TI4_Config((uint8_t)TIM1_ICPolarity,
1726                     ; 468                    (uint8_t)TIM1_ICSelection,
1726                     ; 469                    (uint8_t)TIM1_ICFilter);
1728  004b 7b07          	ld	a,(OFST+7,sp)
1729  004d 88            	push	a
1730  004e 7b06          	ld	a,(OFST+6,sp)
1731  0050 97            	ld	xl,a
1732  0051 7b03          	ld	a,(OFST+3,sp)
1733  0053 95            	ld	xh,a
1734  0054 cd0000        	call	L11_TI4_Config
1736  0057 84            	pop	a
1737                     ; 471         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1739  0058 7b06          	ld	a,(OFST+6,sp)
1740  005a cd0000        	call	_TIM1_SetIC4Prescaler
1742  005d               L176:
1743                     ; 474 }
1746  005d 85            	popw	x
1747  005e 81            	ret	
1843                     ; 490 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1843                     ; 491                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1843                     ; 492                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1843                     ; 493                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1843                     ; 494                      uint8_t TIM1_ICFilter)
1843                     ; 495 {
1844                     .text:	section	.text,new
1845  0000               _TIM1_PWMIConfig:
1847  0000 89            	pushw	x
1848  0001 89            	pushw	x
1849       00000002      OFST:	set	2
1852                     ; 496     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1854                     ; 497     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1856                     ; 500     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1858                     ; 501     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1860                     ; 502     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1862                     ; 503     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1864                     ; 506     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1866  0002 9f            	ld	a,xl
1867  0003 4a            	dec	a
1868  0004 2702          	jreq	L157
1869                     ; 508         icpolarity = TIM1_ICPOLARITY_FALLING;
1871  0006 a601          	ld	a,#1
1873  0008               L157:
1874                     ; 512         icpolarity = TIM1_ICPOLARITY_RISING;
1876  0008 6b01          	ld	(OFST-1,sp),a
1877                     ; 516     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1879  000a 7b07          	ld	a,(OFST+5,sp)
1880  000c 4a            	dec	a
1881  000d 2604          	jrne	L557
1882                     ; 518         icselection = TIM1_ICSELECTION_INDIRECTTI;
1884  000f a602          	ld	a,#2
1886  0011 2002          	jra	L757
1887  0013               L557:
1888                     ; 522         icselection = TIM1_ICSELECTION_DIRECTTI;
1890  0013 a601          	ld	a,#1
1891  0015               L757:
1892  0015 6b02          	ld	(OFST+0,sp),a
1893                     ; 525     if (TIM1_Channel == TIM1_CHANNEL_1)
1895  0017 7b03          	ld	a,(OFST+1,sp)
1896  0019 2626          	jrne	L167
1897                     ; 528         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1897                     ; 529                    (uint8_t)TIM1_ICFilter);
1899  001b 7b09          	ld	a,(OFST+7,sp)
1900  001d 88            	push	a
1901  001e 7b08          	ld	a,(OFST+6,sp)
1902  0020 97            	ld	xl,a
1903  0021 7b05          	ld	a,(OFST+3,sp)
1904  0023 95            	ld	xh,a
1905  0024 cd0000        	call	L3_TI1_Config
1907  0027 84            	pop	a
1908                     ; 532         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1910  0028 7b08          	ld	a,(OFST+6,sp)
1911  002a cd0000        	call	_TIM1_SetIC1Prescaler
1913                     ; 535         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1915  002d 7b09          	ld	a,(OFST+7,sp)
1916  002f 88            	push	a
1917  0030 7b03          	ld	a,(OFST+1,sp)
1918  0032 97            	ld	xl,a
1919  0033 7b02          	ld	a,(OFST+0,sp)
1920  0035 95            	ld	xh,a
1921  0036 cd0000        	call	L5_TI2_Config
1923  0039 84            	pop	a
1924                     ; 538         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1926  003a 7b08          	ld	a,(OFST+6,sp)
1927  003c cd0000        	call	_TIM1_SetIC2Prescaler
1930  003f 2024          	jra	L367
1931  0041               L167:
1932                     ; 543         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1932                     ; 544                    (uint8_t)TIM1_ICFilter);
1934  0041 7b09          	ld	a,(OFST+7,sp)
1935  0043 88            	push	a
1936  0044 7b08          	ld	a,(OFST+6,sp)
1937  0046 97            	ld	xl,a
1938  0047 7b05          	ld	a,(OFST+3,sp)
1939  0049 95            	ld	xh,a
1940  004a cd0000        	call	L5_TI2_Config
1942  004d 84            	pop	a
1943                     ; 547         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1945  004e 7b08          	ld	a,(OFST+6,sp)
1946  0050 cd0000        	call	_TIM1_SetIC2Prescaler
1948                     ; 550         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1950  0053 7b09          	ld	a,(OFST+7,sp)
1951  0055 88            	push	a
1952  0056 7b03          	ld	a,(OFST+1,sp)
1953  0058 97            	ld	xl,a
1954  0059 7b02          	ld	a,(OFST+0,sp)
1955  005b 95            	ld	xh,a
1956  005c cd0000        	call	L3_TI1_Config
1958  005f 84            	pop	a
1959                     ; 553         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1961  0060 7b08          	ld	a,(OFST+6,sp)
1962  0062 cd0000        	call	_TIM1_SetIC1Prescaler
1964  0065               L367:
1965                     ; 555 }
1968  0065 5b04          	addw	sp,#4
1969  0067 81            	ret	
2024                     ; 563 void TIM1_Cmd(FunctionalState NewState)
2024                     ; 564 {
2025                     .text:	section	.text,new
2026  0000               _TIM1_Cmd:
2030                     ; 566     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2032                     ; 569     if (NewState != DISABLE)
2034  0000 4d            	tnz	a
2035  0001 2705          	jreq	L3101
2036                     ; 571         TIM1->CR1 |= TIM1_CR1_CEN;
2038  0003 72105250      	bset	21072,#0
2041  0007 81            	ret	
2042  0008               L3101:
2043                     ; 575         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2045  0008 72115250      	bres	21072,#0
2046                     ; 577 }
2049  000c 81            	ret	
2085                     ; 585 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2085                     ; 586 {
2086                     .text:	section	.text,new
2087  0000               _TIM1_CtrlPWMOutputs:
2091                     ; 588     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2093                     ; 592     if (NewState != DISABLE)
2095  0000 4d            	tnz	a
2096  0001 2705          	jreq	L5301
2097                     ; 594         TIM1->BKR |= TIM1_BKR_MOE;
2099  0003 721e526d      	bset	21101,#7
2102  0007 81            	ret	
2103  0008               L5301:
2104                     ; 598         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2106  0008 721f526d      	bres	21101,#7
2107                     ; 600 }
2110  000c 81            	ret	
2217                     ; 619 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2217                     ; 620 {
2218                     .text:	section	.text,new
2219  0000               _TIM1_ITConfig:
2221  0000 89            	pushw	x
2222       00000000      OFST:	set	0
2225                     ; 622     assert_param(IS_TIM1_IT_OK(TIM1_IT));
2227                     ; 623     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2229                     ; 625     if (NewState != DISABLE)
2231  0001 9f            	ld	a,xl
2232  0002 4d            	tnz	a
2233  0003 2706          	jreq	L7011
2234                     ; 628         TIM1->IER |= (uint8_t)TIM1_IT;
2236  0005 9e            	ld	a,xh
2237  0006 ca5254        	or	a,21076
2239  0009 2006          	jra	L1111
2240  000b               L7011:
2241                     ; 633         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2243  000b 7b01          	ld	a,(OFST+1,sp)
2244  000d 43            	cpl	a
2245  000e c45254        	and	a,21076
2246  0011               L1111:
2247  0011 c75254        	ld	21076,a
2248                     ; 635 }
2251  0014 85            	popw	x
2252  0015 81            	ret	
2276                     ; 642 void TIM1_InternalClockConfig(void)
2276                     ; 643 {
2277                     .text:	section	.text,new
2278  0000               _TIM1_InternalClockConfig:
2282                     ; 645     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2284  0000 c65252        	ld	a,21074
2285  0003 a4f8          	and	a,#248
2286  0005 c75252        	ld	21074,a
2287                     ; 646 }
2290  0008 81            	ret	
2407                     ; 664 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2407                     ; 665                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2407                     ; 666                               uint8_t ExtTRGFilter)
2407                     ; 667 {
2408                     .text:	section	.text,new
2409  0000               _TIM1_ETRClockMode1Config:
2411  0000 89            	pushw	x
2412       00000000      OFST:	set	0
2415                     ; 669     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2417                     ; 670     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2419                     ; 673     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2421  0001 7b05          	ld	a,(OFST+5,sp)
2422  0003 88            	push	a
2423  0004 7b02          	ld	a,(OFST+2,sp)
2424  0006 95            	ld	xh,a
2425  0007 cd0000        	call	_TIM1_ETRConfig
2427  000a 84            	pop	a
2428                     ; 676     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2428                     ; 677                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2430  000b c65252        	ld	a,21074
2431  000e aa77          	or	a,#119
2432  0010 c75252        	ld	21074,a
2433                     ; 678 }
2436  0013 85            	popw	x
2437  0014 81            	ret	
2495                     ; 696 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2495                     ; 697                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2495                     ; 698                               uint8_t ExtTRGFilter)
2495                     ; 699 {
2496                     .text:	section	.text,new
2497  0000               _TIM1_ETRClockMode2Config:
2499  0000 89            	pushw	x
2500       00000000      OFST:	set	0
2503                     ; 701     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2505                     ; 702     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2507                     ; 705     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2509  0001 7b05          	ld	a,(OFST+5,sp)
2510  0003 88            	push	a
2511  0004 7b02          	ld	a,(OFST+2,sp)
2512  0006 95            	ld	xh,a
2513  0007 cd0000        	call	_TIM1_ETRConfig
2515  000a 721c5253      	bset	21075,#6
2516  000e 84            	pop	a
2517                     ; 708     TIM1->ETR |= TIM1_ETR_ECE;
2519                     ; 709 }
2522  000f 85            	popw	x
2523  0010 81            	ret	
2579                     ; 727 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2579                     ; 728                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2579                     ; 729                     uint8_t ExtTRGFilter)
2579                     ; 730 {
2580                     .text:	section	.text,new
2581  0000               _TIM1_ETRConfig:
2583  0000 89            	pushw	x
2584       00000000      OFST:	set	0
2587                     ; 732     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2589                     ; 734     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2589                     ; 735                       (uint8_t)ExtTRGFilter );
2591  0001 9f            	ld	a,xl
2592  0002 1a01          	or	a,(OFST+1,sp)
2593  0004 1a05          	or	a,(OFST+5,sp)
2594  0006 ca5253        	or	a,21075
2595  0009 c75253        	ld	21075,a
2596                     ; 736 }
2599  000c 85            	popw	x
2600  000d 81            	ret	
2689                     ; 753 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2689                     ; 754                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2689                     ; 755                                  uint8_t ICFilter)
2689                     ; 756 {
2690                     .text:	section	.text,new
2691  0000               _TIM1_TIxExternalClockConfig:
2693  0000 89            	pushw	x
2694       00000000      OFST:	set	0
2697                     ; 758     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2699                     ; 759     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2701                     ; 760     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2703                     ; 763     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2705  0001 9e            	ld	a,xh
2706  0002 a160          	cp	a,#96
2707  0004 260e          	jrne	L1131
2708                     ; 765         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2710  0006 7b05          	ld	a,(OFST+5,sp)
2711  0008 88            	push	a
2712  0009 ae0001        	ldw	x,#1
2713  000c 7b03          	ld	a,(OFST+3,sp)
2714  000e 95            	ld	xh,a
2715  000f cd0000        	call	L5_TI2_Config
2718  0012 200c          	jra	L3131
2719  0014               L1131:
2720                     ; 769         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2722  0014 7b05          	ld	a,(OFST+5,sp)
2723  0016 88            	push	a
2724  0017 ae0001        	ldw	x,#1
2725  001a 7b03          	ld	a,(OFST+3,sp)
2726  001c 95            	ld	xh,a
2727  001d cd0000        	call	L3_TI1_Config
2729  0020               L3131:
2730  0020 84            	pop	a
2731                     ; 773     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2733  0021 7b01          	ld	a,(OFST+1,sp)
2734  0023 cd0000        	call	_TIM1_SelectInputTrigger
2736                     ; 776     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2738  0026 c65252        	ld	a,21074
2739  0029 aa07          	or	a,#7
2740  002b c75252        	ld	21074,a
2741                     ; 777 }
2744  002e 85            	popw	x
2745  002f 81            	ret	
2830                     ; 789 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2830                     ; 790 {
2831                     .text:	section	.text,new
2832  0000               _TIM1_SelectInputTrigger:
2834  0000 88            	push	a
2835       00000000      OFST:	set	0
2838                     ; 792     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2840                     ; 795     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2842  0001 c65252        	ld	a,21074
2843  0004 a48f          	and	a,#143
2844  0006 1a01          	or	a,(OFST+1,sp)
2845  0008 c75252        	ld	21074,a
2846                     ; 796 }
2849  000b 84            	pop	a
2850  000c 81            	ret	
2886                     ; 806 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2886                     ; 807 {
2887                     .text:	section	.text,new
2888  0000               _TIM1_UpdateDisableConfig:
2892                     ; 809     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2894                     ; 812     if (NewState != DISABLE)
2896  0000 4d            	tnz	a
2897  0001 2705          	jreq	L1731
2898                     ; 814         TIM1->CR1 |= TIM1_CR1_UDIS;
2900  0003 72125250      	bset	21072,#1
2903  0007 81            	ret	
2904  0008               L1731:
2905                     ; 818         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2907  0008 72135250      	bres	21072,#1
2908                     ; 820 }
2911  000c 81            	ret	
2969                     ; 830 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2969                     ; 831 {
2970                     .text:	section	.text,new
2971  0000               _TIM1_UpdateRequestConfig:
2975                     ; 833     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2977                     ; 836     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2979  0000 4d            	tnz	a
2980  0001 2705          	jreq	L3241
2981                     ; 838         TIM1->CR1 |= TIM1_CR1_URS;
2983  0003 72145250      	bset	21072,#2
2986  0007 81            	ret	
2987  0008               L3241:
2988                     ; 842         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2990  0008 72155250      	bres	21072,#2
2991                     ; 844 }
2994  000c 81            	ret	
3030                     ; 853 void TIM1_SelectHallSensor(FunctionalState NewState)
3030                     ; 854 {
3031                     .text:	section	.text,new
3032  0000               _TIM1_SelectHallSensor:
3036                     ; 856     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3038                     ; 859     if (NewState != DISABLE)
3040  0000 4d            	tnz	a
3041  0001 2705          	jreq	L5441
3042                     ; 861         TIM1->CR2 |= TIM1_CR2_TI1S;
3044  0003 721e5251      	bset	21073,#7
3047  0007 81            	ret	
3048  0008               L5441:
3049                     ; 865         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3051  0008 721f5251      	bres	21073,#7
3052                     ; 867 }
3055  000c 81            	ret	
3112                     ; 878 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3112                     ; 879 {
3113                     .text:	section	.text,new
3114  0000               _TIM1_SelectOnePulseMode:
3118                     ; 881     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3120                     ; 884     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3122  0000 4d            	tnz	a
3123  0001 2705          	jreq	L7741
3124                     ; 886         TIM1->CR1 |= TIM1_CR1_OPM;
3126  0003 72165250      	bset	21072,#3
3129  0007 81            	ret	
3130  0008               L7741:
3131                     ; 890         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3133  0008 72175250      	bres	21072,#3
3134                     ; 893 }
3137  000c 81            	ret	
3235                     ; 909 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3235                     ; 910 {
3236                     .text:	section	.text,new
3237  0000               _TIM1_SelectOutputTrigger:
3239  0000 88            	push	a
3240       00000000      OFST:	set	0
3243                     ; 912     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3245                     ; 915     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3245                     ; 916                           (uint8_t) TIM1_TRGOSource);
3247  0001 c65251        	ld	a,21073
3248  0004 a48f          	and	a,#143
3249  0006 1a01          	or	a,(OFST+1,sp)
3250  0008 c75251        	ld	21073,a
3251                     ; 917 }
3254  000b 84            	pop	a
3255  000c 81            	ret	
3329                     ; 929 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3329                     ; 930 {
3330                     .text:	section	.text,new
3331  0000               _TIM1_SelectSlaveMode:
3333  0000 88            	push	a
3334       00000000      OFST:	set	0
3337                     ; 933     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3339                     ; 936     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3339                     ; 937                            (uint8_t)TIM1_SlaveMode);
3341  0001 c65252        	ld	a,21074
3342  0004 a4f8          	and	a,#248
3343  0006 1a01          	or	a,(OFST+1,sp)
3344  0008 c75252        	ld	21074,a
3345                     ; 939 }
3348  000b 84            	pop	a
3349  000c 81            	ret	
3385                     ; 947 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3385                     ; 948 {
3386                     .text:	section	.text,new
3387  0000               _TIM1_SelectMasterSlaveMode:
3391                     ; 950     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3393                     ; 953     if (NewState != DISABLE)
3395  0000 4d            	tnz	a
3396  0001 2705          	jreq	L3161
3397                     ; 955         TIM1->SMCR |= TIM1_SMCR_MSM;
3399  0003 721e5252      	bset	21074,#7
3402  0007 81            	ret	
3403  0008               L3161:
3404                     ; 959         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3406  0008 721f5252      	bres	21074,#7
3407                     ; 961 }
3410  000c 81            	ret	
3496                     ; 983 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3496                     ; 984                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3496                     ; 985                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3496                     ; 986 {
3497                     .text:	section	.text,new
3498  0000               _TIM1_EncoderInterfaceConfig:
3500  0000 89            	pushw	x
3501       00000000      OFST:	set	0
3504                     ; 990     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3506                     ; 991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3508                     ; 992     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3510                     ; 995     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3512  0001 9f            	ld	a,xl
3513  0002 4d            	tnz	a
3514  0003 2706          	jreq	L7561
3515                     ; 997         TIM1->CCER1 |= TIM1_CCER1_CC1P;
3517  0005 7212525c      	bset	21084,#1
3519  0009 2004          	jra	L1661
3520  000b               L7561:
3521                     ; 1001         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3523  000b 7213525c      	bres	21084,#1
3524  000f               L1661:
3525                     ; 1004     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3527  000f 7b05          	ld	a,(OFST+5,sp)
3528  0011 2706          	jreq	L3661
3529                     ; 1006         TIM1->CCER1 |= TIM1_CCER1_CC2P;
3531  0013 721a525c      	bset	21084,#5
3533  0017 2004          	jra	L5661
3534  0019               L3661:
3535                     ; 1010         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3537  0019 721b525c      	bres	21084,#5
3538  001d               L5661:
3539                     ; 1013     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3539                     ; 1014                            | (uint8_t) TIM1_EncoderMode);
3541  001d c65252        	ld	a,21074
3542  0020 a4f0          	and	a,#240
3543  0022 1a01          	or	a,(OFST+1,sp)
3544  0024 c75252        	ld	21074,a
3545                     ; 1017     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3545                     ; 1018                             | (uint8_t) CCMR_TIxDirect_Set);
3547  0027 c65258        	ld	a,21080
3548  002a a4fc          	and	a,#252
3549  002c aa01          	or	a,#1
3550  002e c75258        	ld	21080,a
3551                     ; 1019     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3551                     ; 1020                             | (uint8_t) CCMR_TIxDirect_Set);
3553  0031 c65259        	ld	a,21081
3554  0034 a4fc          	and	a,#252
3555  0036 aa01          	or	a,#1
3556  0038 c75259        	ld	21081,a
3557                     ; 1022 }
3560  003b 85            	popw	x
3561  003c 81            	ret	
3628                     ; 1035 void TIM1_PrescalerConfig(uint16_t Prescaler,
3628                     ; 1036                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3628                     ; 1037 {
3629                     .text:	section	.text,new
3630  0000               _TIM1_PrescalerConfig:
3632  0000 89            	pushw	x
3633       00000000      OFST:	set	0
3636                     ; 1039     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3638                     ; 1042     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3640  0001 9e            	ld	a,xh
3641  0002 c75260        	ld	21088,a
3642                     ; 1043     TIM1->PSCRL = (uint8_t)(Prescaler);
3644  0005 9f            	ld	a,xl
3645  0006 c75261        	ld	21089,a
3646                     ; 1046     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3648  0009 7b05          	ld	a,(OFST+5,sp)
3649  000b c75257        	ld	21079,a
3650                     ; 1048 }
3653  000e 85            	popw	x
3654  000f 81            	ret	
3690                     ; 1061 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3690                     ; 1062 {
3691                     .text:	section	.text,new
3692  0000               _TIM1_CounterModeConfig:
3694  0000 88            	push	a
3695       00000000      OFST:	set	0
3698                     ; 1064     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3700                     ; 1068     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3700                     ; 1069                           | (uint8_t)TIM1_CounterMode);
3702  0001 c65250        	ld	a,21072
3703  0004 a48f          	and	a,#143
3704  0006 1a01          	or	a,(OFST+1,sp)
3705  0008 c75250        	ld	21072,a
3706                     ; 1070 }
3709  000b 84            	pop	a
3710  000c 81            	ret	
3768                     ; 1081 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3768                     ; 1082 {
3769                     .text:	section	.text,new
3770  0000               _TIM1_ForcedOC1Config:
3772  0000 88            	push	a
3773       00000000      OFST:	set	0
3776                     ; 1084     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3778                     ; 1087     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3778                     ; 1088                              (uint8_t)TIM1_ForcedAction);
3780  0001 c65258        	ld	a,21080
3781  0004 a48f          	and	a,#143
3782  0006 1a01          	or	a,(OFST+1,sp)
3783  0008 c75258        	ld	21080,a
3784                     ; 1089 }
3787  000b 84            	pop	a
3788  000c 81            	ret	
3824                     ; 1100 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3824                     ; 1101 {
3825                     .text:	section	.text,new
3826  0000               _TIM1_ForcedOC2Config:
3828  0000 88            	push	a
3829       00000000      OFST:	set	0
3832                     ; 1103     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3834                     ; 1106     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3834                     ; 1107                               | (uint8_t)TIM1_ForcedAction);
3836  0001 c65259        	ld	a,21081
3837  0004 a48f          	and	a,#143
3838  0006 1a01          	or	a,(OFST+1,sp)
3839  0008 c75259        	ld	21081,a
3840                     ; 1108 }
3843  000b 84            	pop	a
3844  000c 81            	ret	
3880                     ; 1120 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3880                     ; 1121 {
3881                     .text:	section	.text,new
3882  0000               _TIM1_ForcedOC3Config:
3884  0000 88            	push	a
3885       00000000      OFST:	set	0
3888                     ; 1123     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3890                     ; 1126     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3890                     ; 1127                               | (uint8_t)TIM1_ForcedAction);
3892  0001 c6525a        	ld	a,21082
3893  0004 a48f          	and	a,#143
3894  0006 1a01          	or	a,(OFST+1,sp)
3895  0008 c7525a        	ld	21082,a
3896                     ; 1128 }
3899  000b 84            	pop	a
3900  000c 81            	ret	
3936                     ; 1140 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3936                     ; 1141 {
3937                     .text:	section	.text,new
3938  0000               _TIM1_ForcedOC4Config:
3940  0000 88            	push	a
3941       00000000      OFST:	set	0
3944                     ; 1143     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3946                     ; 1146     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3946                     ; 1147                               | (uint8_t)TIM1_ForcedAction);
3948  0001 c6525b        	ld	a,21083
3949  0004 a48f          	and	a,#143
3950  0006 1a01          	or	a,(OFST+1,sp)
3951  0008 c7525b        	ld	21083,a
3952                     ; 1148 }
3955  000b 84            	pop	a
3956  000c 81            	ret	
3992                     ; 1157 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3992                     ; 1158 {
3993                     .text:	section	.text,new
3994  0000               _TIM1_ARRPreloadConfig:
3998                     ; 1160     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4000                     ; 1163     if (NewState != DISABLE)
4002  0000 4d            	tnz	a
4003  0001 2705          	jreq	L5502
4004                     ; 1165         TIM1->CR1 |= TIM1_CR1_ARPE;
4006  0003 721e5250      	bset	21072,#7
4009  0007 81            	ret	
4010  0008               L5502:
4011                     ; 1169         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4013  0008 721f5250      	bres	21072,#7
4014                     ; 1171 }
4017  000c 81            	ret	
4052                     ; 1180 void TIM1_SelectCOM(FunctionalState NewState)
4052                     ; 1181 {
4053                     .text:	section	.text,new
4054  0000               _TIM1_SelectCOM:
4058                     ; 1183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4060                     ; 1186     if (NewState != DISABLE)
4062  0000 4d            	tnz	a
4063  0001 2705          	jreq	L7702
4064                     ; 1188         TIM1->CR2 |= TIM1_CR2_COMS;
4066  0003 72145251      	bset	21073,#2
4069  0007 81            	ret	
4070  0008               L7702:
4071                     ; 1192         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4073  0008 72155251      	bres	21073,#2
4074                     ; 1194 }
4077  000c 81            	ret	
4113                     ; 1202 void TIM1_CCPreloadControl(FunctionalState NewState)
4113                     ; 1203 {
4114                     .text:	section	.text,new
4115  0000               _TIM1_CCPreloadControl:
4119                     ; 1205     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4121                     ; 1208     if (NewState != DISABLE)
4123  0000 4d            	tnz	a
4124  0001 2705          	jreq	L1212
4125                     ; 1210         TIM1->CR2 |= TIM1_CR2_CCPC;
4127  0003 72105251      	bset	21073,#0
4130  0007 81            	ret	
4131  0008               L1212:
4132                     ; 1214         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4134  0008 72115251      	bres	21073,#0
4135                     ; 1216 }
4138  000c 81            	ret	
4174                     ; 1225 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4174                     ; 1226 {
4175                     .text:	section	.text,new
4176  0000               _TIM1_OC1PreloadConfig:
4180                     ; 1228     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4182                     ; 1231     if (NewState != DISABLE)
4184  0000 4d            	tnz	a
4185  0001 2705          	jreq	L3412
4186                     ; 1233         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4188  0003 72165258      	bset	21080,#3
4191  0007 81            	ret	
4192  0008               L3412:
4193                     ; 1237         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4195  0008 72175258      	bres	21080,#3
4196                     ; 1239 }
4199  000c 81            	ret	
4235                     ; 1248 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4235                     ; 1249 {
4236                     .text:	section	.text,new
4237  0000               _TIM1_OC2PreloadConfig:
4241                     ; 1251     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4243                     ; 1254     if (NewState != DISABLE)
4245  0000 4d            	tnz	a
4246  0001 2705          	jreq	L5612
4247                     ; 1256         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4249  0003 72165259      	bset	21081,#3
4252  0007 81            	ret	
4253  0008               L5612:
4254                     ; 1260         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4256  0008 72175259      	bres	21081,#3
4257                     ; 1262 }
4260  000c 81            	ret	
4296                     ; 1271 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4296                     ; 1272 {
4297                     .text:	section	.text,new
4298  0000               _TIM1_OC3PreloadConfig:
4302                     ; 1274     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4304                     ; 1277     if (NewState != DISABLE)
4306  0000 4d            	tnz	a
4307  0001 2705          	jreq	L7022
4308                     ; 1279         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4310  0003 7216525a      	bset	21082,#3
4313  0007 81            	ret	
4314  0008               L7022:
4315                     ; 1283         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4317  0008 7217525a      	bres	21082,#3
4318                     ; 1285 }
4321  000c 81            	ret	
4357                     ; 1295 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4357                     ; 1296 {
4358                     .text:	section	.text,new
4359  0000               _TIM1_OC4PreloadConfig:
4363                     ; 1298     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4365                     ; 1301     if (NewState != DISABLE)
4367  0000 4d            	tnz	a
4368  0001 2705          	jreq	L1322
4369                     ; 1303         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4371  0003 7216525b      	bset	21083,#3
4374  0007 81            	ret	
4375  0008               L1322:
4376                     ; 1307         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4378  0008 7217525b      	bres	21083,#3
4379                     ; 1309 }
4382  000c 81            	ret	
4417                     ; 1317 void TIM1_OC1FastConfig(FunctionalState NewState)
4417                     ; 1318 {
4418                     .text:	section	.text,new
4419  0000               _TIM1_OC1FastConfig:
4423                     ; 1320     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4425                     ; 1323     if (NewState != DISABLE)
4427  0000 4d            	tnz	a
4428  0001 2705          	jreq	L3522
4429                     ; 1325         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4431  0003 72145258      	bset	21080,#2
4434  0007 81            	ret	
4435  0008               L3522:
4436                     ; 1329         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4438  0008 72155258      	bres	21080,#2
4439                     ; 1331 }
4442  000c 81            	ret	
4477                     ; 1341 void TIM1_OC2FastConfig(FunctionalState NewState)
4477                     ; 1342 {
4478                     .text:	section	.text,new
4479  0000               _TIM1_OC2FastConfig:
4483                     ; 1344     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4485                     ; 1347     if (NewState != DISABLE)
4487  0000 4d            	tnz	a
4488  0001 2705          	jreq	L5722
4489                     ; 1349         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4491  0003 72145259      	bset	21081,#2
4494  0007 81            	ret	
4495  0008               L5722:
4496                     ; 1353         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4498  0008 72155259      	bres	21081,#2
4499                     ; 1355 }
4502  000c 81            	ret	
4537                     ; 1364 void TIM1_OC3FastConfig(FunctionalState NewState)
4537                     ; 1365 {
4538                     .text:	section	.text,new
4539  0000               _TIM1_OC3FastConfig:
4543                     ; 1367     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4545                     ; 1370     if (NewState != DISABLE)
4547  0000 4d            	tnz	a
4548  0001 2705          	jreq	L7132
4549                     ; 1372         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4551  0003 7214525a      	bset	21082,#2
4554  0007 81            	ret	
4555  0008               L7132:
4556                     ; 1376         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4558  0008 7215525a      	bres	21082,#2
4559                     ; 1378 }
4562  000c 81            	ret	
4597                     ; 1387 void TIM1_OC4FastConfig(FunctionalState NewState)
4597                     ; 1388 {
4598                     .text:	section	.text,new
4599  0000               _TIM1_OC4FastConfig:
4603                     ; 1390     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4605                     ; 1393     if (NewState != DISABLE)
4607  0000 4d            	tnz	a
4608  0001 2705          	jreq	L1432
4609                     ; 1395         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4611  0003 7214525b      	bset	21083,#2
4614  0007 81            	ret	
4615  0008               L1432:
4616                     ; 1399         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4618  0008 7215525b      	bres	21083,#2
4619                     ; 1401 }
4622  000c 81            	ret	
4727                     ; 1418 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4727                     ; 1419 {
4728                     .text:	section	.text,new
4729  0000               _TIM1_GenerateEvent:
4733                     ; 1421     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4735                     ; 1424     TIM1->EGR = (uint8_t)TIM1_EventSource;
4737  0000 c75257        	ld	21079,a
4738                     ; 1425 }
4741  0003 81            	ret	
4777                     ; 1436 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4777                     ; 1437 {
4778                     .text:	section	.text,new
4779  0000               _TIM1_OC1PolarityConfig:
4783                     ; 1439     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4785                     ; 1442     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4787  0000 4d            	tnz	a
4788  0001 2705          	jreq	L5242
4789                     ; 1444         TIM1->CCER1 |= TIM1_CCER1_CC1P;
4791  0003 7212525c      	bset	21084,#1
4794  0007 81            	ret	
4795  0008               L5242:
4796                     ; 1448         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4798  0008 7213525c      	bres	21084,#1
4799                     ; 1450 }
4802  000c 81            	ret	
4838                     ; 1461 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4838                     ; 1462 {
4839                     .text:	section	.text,new
4840  0000               _TIM1_OC1NPolarityConfig:
4844                     ; 1464     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4846                     ; 1467     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4848  0000 4d            	tnz	a
4849  0001 2705          	jreq	L7442
4850                     ; 1469         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4852  0003 7216525c      	bset	21084,#3
4855  0007 81            	ret	
4856  0008               L7442:
4857                     ; 1473         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4859  0008 7217525c      	bres	21084,#3
4860                     ; 1475 }
4863  000c 81            	ret	
4899                     ; 1486 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4899                     ; 1487 {
4900                     .text:	section	.text,new
4901  0000               _TIM1_OC2PolarityConfig:
4905                     ; 1489     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4907                     ; 1492     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4909  0000 4d            	tnz	a
4910  0001 2705          	jreq	L1742
4911                     ; 1494         TIM1->CCER1 |= TIM1_CCER1_CC2P;
4913  0003 721a525c      	bset	21084,#5
4916  0007 81            	ret	
4917  0008               L1742:
4918                     ; 1498         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4920  0008 721b525c      	bres	21084,#5
4921                     ; 1500 }
4924  000c 81            	ret	
4960                     ; 1510 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4960                     ; 1511 {
4961                     .text:	section	.text,new
4962  0000               _TIM1_OC2NPolarityConfig:
4966                     ; 1513     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4968                     ; 1516     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4970  0000 4d            	tnz	a
4971  0001 2705          	jreq	L3152
4972                     ; 1518         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4974  0003 721e525c      	bset	21084,#7
4977  0007 81            	ret	
4978  0008               L3152:
4979                     ; 1522         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4981  0008 721f525c      	bres	21084,#7
4982                     ; 1524 }
4985  000c 81            	ret	
5021                     ; 1535 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5021                     ; 1536 {
5022                     .text:	section	.text,new
5023  0000               _TIM1_OC3PolarityConfig:
5027                     ; 1538     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5029                     ; 1541     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5031  0000 4d            	tnz	a
5032  0001 2705          	jreq	L5352
5033                     ; 1543         TIM1->CCER2 |= TIM1_CCER2_CC3P;
5035  0003 7212525d      	bset	21085,#1
5038  0007 81            	ret	
5039  0008               L5352:
5040                     ; 1547         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5042  0008 7213525d      	bres	21085,#1
5043                     ; 1549 }
5046  000c 81            	ret	
5082                     ; 1560 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5082                     ; 1561 {
5083                     .text:	section	.text,new
5084  0000               _TIM1_OC3NPolarityConfig:
5088                     ; 1563     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5090                     ; 1566     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5092  0000 4d            	tnz	a
5093  0001 2705          	jreq	L7552
5094                     ; 1568         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5096  0003 7216525d      	bset	21085,#3
5099  0007 81            	ret	
5100  0008               L7552:
5101                     ; 1572         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5103  0008 7217525d      	bres	21085,#3
5104                     ; 1574 }
5107  000c 81            	ret	
5143                     ; 1584 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5143                     ; 1585 {
5144                     .text:	section	.text,new
5145  0000               _TIM1_OC4PolarityConfig:
5149                     ; 1587     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5151                     ; 1590     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5153  0000 4d            	tnz	a
5154  0001 2705          	jreq	L1062
5155                     ; 1592         TIM1->CCER2 |= TIM1_CCER2_CC4P;
5157  0003 721a525d      	bset	21085,#5
5160  0007 81            	ret	
5161  0008               L1062:
5162                     ; 1596         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5164  0008 721b525d      	bres	21085,#5
5165                     ; 1598 }
5168  000c 81            	ret	
5213                     ; 1613 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5213                     ; 1614 {
5214                     .text:	section	.text,new
5215  0000               _TIM1_CCxCmd:
5217  0000 89            	pushw	x
5218       00000000      OFST:	set	0
5221                     ; 1616     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5223                     ; 1617     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5225                     ; 1619     if (TIM1_Channel == TIM1_CHANNEL_1)
5227  0001 9e            	ld	a,xh
5228  0002 4d            	tnz	a
5229  0003 2610          	jrne	L7262
5230                     ; 1622         if (NewState != DISABLE)
5232  0005 9f            	ld	a,xl
5233  0006 4d            	tnz	a
5234  0007 2706          	jreq	L1362
5235                     ; 1624             TIM1->CCER1 |= TIM1_CCER1_CC1E;
5237  0009 7210525c      	bset	21084,#0
5239  000d 203e          	jra	L5362
5240  000f               L1362:
5241                     ; 1628             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5243  000f 7211525c      	bres	21084,#0
5244  0013 2038          	jra	L5362
5245  0015               L7262:
5246                     ; 1632     else if (TIM1_Channel == TIM1_CHANNEL_2)
5248  0015 7b01          	ld	a,(OFST+1,sp)
5249  0017 a101          	cp	a,#1
5250  0019 2610          	jrne	L7362
5251                     ; 1635         if (NewState != DISABLE)
5253  001b 7b02          	ld	a,(OFST+2,sp)
5254  001d 2706          	jreq	L1462
5255                     ; 1637             TIM1->CCER1 |= TIM1_CCER1_CC2E;
5257  001f 7218525c      	bset	21084,#4
5259  0023 2028          	jra	L5362
5260  0025               L1462:
5261                     ; 1641             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5263  0025 7219525c      	bres	21084,#4
5264  0029 2022          	jra	L5362
5265  002b               L7362:
5266                     ; 1644     else if (TIM1_Channel == TIM1_CHANNEL_3)
5268  002b a102          	cp	a,#2
5269  002d 2610          	jrne	L7462
5270                     ; 1647         if (NewState != DISABLE)
5272  002f 7b02          	ld	a,(OFST+2,sp)
5273  0031 2706          	jreq	L1562
5274                     ; 1649             TIM1->CCER2 |= TIM1_CCER2_CC3E;
5276  0033 7210525d      	bset	21085,#0
5278  0037 2014          	jra	L5362
5279  0039               L1562:
5280                     ; 1653             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5282  0039 7211525d      	bres	21085,#0
5283  003d 200e          	jra	L5362
5284  003f               L7462:
5285                     ; 1659         if (NewState != DISABLE)
5287  003f 7b02          	ld	a,(OFST+2,sp)
5288  0041 2706          	jreq	L7562
5289                     ; 1661             TIM1->CCER2 |= TIM1_CCER2_CC4E;
5291  0043 7218525d      	bset	21085,#4
5293  0047 2004          	jra	L5362
5294  0049               L7562:
5295                     ; 1665             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5297  0049 7219525d      	bres	21085,#4
5298  004d               L5362:
5299                     ; 1668 }
5302  004d 85            	popw	x
5303  004e 81            	ret	
5348                     ; 1681 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5348                     ; 1682 {
5349                     .text:	section	.text,new
5350  0000               _TIM1_CCxNCmd:
5352  0000 89            	pushw	x
5353       00000000      OFST:	set	0
5356                     ; 1684     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5358                     ; 1685     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5360                     ; 1687     if (TIM1_Channel == TIM1_CHANNEL_1)
5362  0001 9e            	ld	a,xh
5363  0002 4d            	tnz	a
5364  0003 2610          	jrne	L5072
5365                     ; 1690         if (NewState != DISABLE)
5367  0005 9f            	ld	a,xl
5368  0006 4d            	tnz	a
5369  0007 2706          	jreq	L7072
5370                     ; 1692             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5372  0009 7214525c      	bset	21084,#2
5374  000d 2029          	jra	L3172
5375  000f               L7072:
5376                     ; 1696             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5378  000f 7215525c      	bres	21084,#2
5379  0013 2023          	jra	L3172
5380  0015               L5072:
5381                     ; 1699     else if (TIM1_Channel == TIM1_CHANNEL_2)
5383  0015 7b01          	ld	a,(OFST+1,sp)
5384  0017 4a            	dec	a
5385  0018 2610          	jrne	L5172
5386                     ; 1702         if (NewState != DISABLE)
5388  001a 7b02          	ld	a,(OFST+2,sp)
5389  001c 2706          	jreq	L7172
5390                     ; 1704             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5392  001e 721c525c      	bset	21084,#6
5394  0022 2014          	jra	L3172
5395  0024               L7172:
5396                     ; 1708             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5398  0024 721d525c      	bres	21084,#6
5399  0028 200e          	jra	L3172
5400  002a               L5172:
5401                     ; 1714         if (NewState != DISABLE)
5403  002a 7b02          	ld	a,(OFST+2,sp)
5404  002c 2706          	jreq	L5272
5405                     ; 1716             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5407  002e 7214525d      	bset	21085,#2
5409  0032 2004          	jra	L3172
5410  0034               L5272:
5411                     ; 1720             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5413  0034 7215525d      	bres	21085,#2
5414  0038               L3172:
5415                     ; 1723 }
5418  0038 85            	popw	x
5419  0039 81            	ret	
5464                     ; 1747 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5464                     ; 1748 {
5465                     .text:	section	.text,new
5466  0000               _TIM1_SelectOCxM:
5468  0000 89            	pushw	x
5469       00000000      OFST:	set	0
5472                     ; 1750     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5474                     ; 1751     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5476                     ; 1753     if (TIM1_Channel == TIM1_CHANNEL_1)
5478  0001 9e            	ld	a,xh
5479  0002 4d            	tnz	a
5480  0003 2610          	jrne	L3572
5481                     ; 1756         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5483  0005 7211525c      	bres	21084,#0
5484                     ; 1759         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5484                     ; 1760                                 | (uint8_t)TIM1_OCMode);
5486  0009 c65258        	ld	a,21080
5487  000c a48f          	and	a,#143
5488  000e 1a02          	or	a,(OFST+2,sp)
5489  0010 c75258        	ld	21080,a
5491  0013 2038          	jra	L5572
5492  0015               L3572:
5493                     ; 1762     else if (TIM1_Channel == TIM1_CHANNEL_2)
5495  0015 7b01          	ld	a,(OFST+1,sp)
5496  0017 a101          	cp	a,#1
5497  0019 2610          	jrne	L7572
5498                     ; 1765         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5500  001b 7219525c      	bres	21084,#4
5501                     ; 1768         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5501                     ; 1769                                 | (uint8_t)TIM1_OCMode);
5503  001f c65259        	ld	a,21081
5504  0022 a48f          	and	a,#143
5505  0024 1a02          	or	a,(OFST+2,sp)
5506  0026 c75259        	ld	21081,a
5508  0029 2022          	jra	L5572
5509  002b               L7572:
5510                     ; 1771     else if (TIM1_Channel == TIM1_CHANNEL_3)
5512  002b a102          	cp	a,#2
5513  002d 2610          	jrne	L3672
5514                     ; 1774         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5516  002f 7211525d      	bres	21085,#0
5517                     ; 1777         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5517                     ; 1778                                 | (uint8_t)TIM1_OCMode);
5519  0033 c6525a        	ld	a,21082
5520  0036 a48f          	and	a,#143
5521  0038 1a02          	or	a,(OFST+2,sp)
5522  003a c7525a        	ld	21082,a
5524  003d 200e          	jra	L5572
5525  003f               L3672:
5526                     ; 1783         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5528  003f 7219525d      	bres	21085,#4
5529                     ; 1786         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5529                     ; 1787                                 | (uint8_t)TIM1_OCMode);
5531  0043 c6525b        	ld	a,21083
5532  0046 a48f          	and	a,#143
5533  0048 1a02          	or	a,(OFST+2,sp)
5534  004a c7525b        	ld	21083,a
5535  004d               L5572:
5536                     ; 1789 }
5539  004d 85            	popw	x
5540  004e 81            	ret	
5574                     ; 1798 void TIM1_SetCounter(uint16_t Counter)
5574                     ; 1799 {
5575                     .text:	section	.text,new
5576  0000               _TIM1_SetCounter:
5580                     ; 1801     TIM1->CNTRH = (uint8_t)(Counter >> 8);
5582  0000 9e            	ld	a,xh
5583  0001 c7525e        	ld	21086,a
5584                     ; 1802     TIM1->CNTRL = (uint8_t)(Counter);
5586  0004 9f            	ld	a,xl
5587  0005 c7525f        	ld	21087,a
5588                     ; 1804 }
5591  0008 81            	ret	
5625                     ; 1813 void TIM1_SetAutoreload(uint16_t Autoreload)
5625                     ; 1814 {
5626                     .text:	section	.text,new
5627  0000               _TIM1_SetAutoreload:
5631                     ; 1817     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5633  0000 9e            	ld	a,xh
5634  0001 c75262        	ld	21090,a
5635                     ; 1818     TIM1->ARRL = (uint8_t)(Autoreload);
5637  0004 9f            	ld	a,xl
5638  0005 c75263        	ld	21091,a
5639                     ; 1820 }
5642  0008 81            	ret	
5676                     ; 1829 void TIM1_SetCompare1(uint16_t Compare1)
5676                     ; 1830 {
5677                     .text:	section	.text,new
5678  0000               _TIM1_SetCompare1:
5682                     ; 1832     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5684  0000 9e            	ld	a,xh
5685  0001 c75265        	ld	21093,a
5686                     ; 1833     TIM1->CCR1L = (uint8_t)(Compare1);
5688  0004 9f            	ld	a,xl
5689  0005 c75266        	ld	21094,a
5690                     ; 1835 }
5693  0008 81            	ret	
5727                     ; 1844 void TIM1_SetCompare2(uint16_t Compare2)
5727                     ; 1845 {
5728                     .text:	section	.text,new
5729  0000               _TIM1_SetCompare2:
5733                     ; 1847     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5735  0000 9e            	ld	a,xh
5736  0001 c75267        	ld	21095,a
5737                     ; 1848     TIM1->CCR2L = (uint8_t)(Compare2);
5739  0004 9f            	ld	a,xl
5740  0005 c75268        	ld	21096,a
5741                     ; 1850 }
5744  0008 81            	ret	
5778                     ; 1859 void TIM1_SetCompare3(uint16_t Compare3)
5778                     ; 1860 {
5779                     .text:	section	.text,new
5780  0000               _TIM1_SetCompare3:
5784                     ; 1862     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5786  0000 9e            	ld	a,xh
5787  0001 c75269        	ld	21097,a
5788                     ; 1863     TIM1->CCR3L = (uint8_t)(Compare3);
5790  0004 9f            	ld	a,xl
5791  0005 c7526a        	ld	21098,a
5792                     ; 1865 }
5795  0008 81            	ret	
5829                     ; 1874 void TIM1_SetCompare4(uint16_t Compare4)
5829                     ; 1875 {
5830                     .text:	section	.text,new
5831  0000               _TIM1_SetCompare4:
5835                     ; 1877     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5837  0000 9e            	ld	a,xh
5838  0001 c7526b        	ld	21099,a
5839                     ; 1878     TIM1->CCR4L = (uint8_t)(Compare4);
5841  0004 9f            	ld	a,xl
5842  0005 c7526c        	ld	21100,a
5843                     ; 1879 }
5846  0008 81            	ret	
5882                     ; 1892 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5882                     ; 1893 {
5883                     .text:	section	.text,new
5884  0000               _TIM1_SetIC1Prescaler:
5886  0000 88            	push	a
5887       00000000      OFST:	set	0
5890                     ; 1895     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5892                     ; 1898     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5892                     ; 1899                             | (uint8_t)TIM1_IC1Prescaler);
5894  0001 c65258        	ld	a,21080
5895  0004 a4f3          	and	a,#243
5896  0006 1a01          	or	a,(OFST+1,sp)
5897  0008 c75258        	ld	21080,a
5898                     ; 1901 }
5901  000b 84            	pop	a
5902  000c 81            	ret	
5938                     ; 1913 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5938                     ; 1914 {
5939                     .text:	section	.text,new
5940  0000               _TIM1_SetIC2Prescaler:
5942  0000 88            	push	a
5943       00000000      OFST:	set	0
5946                     ; 1917     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5948                     ; 1920     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5948                     ; 1921                             | (uint8_t)TIM1_IC2Prescaler);
5950  0001 c65259        	ld	a,21081
5951  0004 a4f3          	and	a,#243
5952  0006 1a01          	or	a,(OFST+1,sp)
5953  0008 c75259        	ld	21081,a
5954                     ; 1922 }
5957  000b 84            	pop	a
5958  000c 81            	ret	
5994                     ; 1935 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5994                     ; 1936 {
5995                     .text:	section	.text,new
5996  0000               _TIM1_SetIC3Prescaler:
5998  0000 88            	push	a
5999       00000000      OFST:	set	0
6002                     ; 1939     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6004                     ; 1942     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6004                     ; 1943                             (uint8_t)TIM1_IC3Prescaler);
6006  0001 c6525a        	ld	a,21082
6007  0004 a4f3          	and	a,#243
6008  0006 1a01          	or	a,(OFST+1,sp)
6009  0008 c7525a        	ld	21082,a
6010                     ; 1944 }
6013  000b 84            	pop	a
6014  000c 81            	ret	
6050                     ; 1956 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6050                     ; 1957 {
6051                     .text:	section	.text,new
6052  0000               _TIM1_SetIC4Prescaler:
6054  0000 88            	push	a
6055       00000000      OFST:	set	0
6058                     ; 1960     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6060                     ; 1963     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6060                     ; 1964                             (uint8_t)TIM1_IC4Prescaler);
6062  0001 c6525b        	ld	a,21083
6063  0004 a4f3          	and	a,#243
6064  0006 1a01          	or	a,(OFST+1,sp)
6065  0008 c7525b        	ld	21083,a
6066                     ; 1965 }
6069  000b 84            	pop	a
6070  000c 81            	ret	
6122                     ; 1972 uint16_t TIM1_GetCapture1(void)
6122                     ; 1973 {
6123                     .text:	section	.text,new
6124  0000               _TIM1_GetCapture1:
6126  0000 5204          	subw	sp,#4
6127       00000004      OFST:	set	4
6130                     ; 1976     uint16_t tmpccr1 = 0;
6132                     ; 1977     uint8_t tmpccr1l=0, tmpccr1h=0;
6136                     ; 1979     tmpccr1h = TIM1->CCR1H;
6138  0002 c65265        	ld	a,21093
6139  0005 6b02          	ld	(OFST-2,sp),a
6140                     ; 1980     tmpccr1l = TIM1->CCR1L;
6142  0007 c65266        	ld	a,21094
6143  000a 6b01          	ld	(OFST-3,sp),a
6144                     ; 1982     tmpccr1 = (uint16_t)(tmpccr1l);
6146  000c 5f            	clrw	x
6147  000d 97            	ld	xl,a
6148  000e 1f03          	ldw	(OFST-1,sp),x
6149                     ; 1983     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6151  0010 5f            	clrw	x
6152  0011 7b02          	ld	a,(OFST-2,sp)
6153  0013 97            	ld	xl,a
6154  0014 7b04          	ld	a,(OFST+0,sp)
6155  0016 01            	rrwa	x,a
6156  0017 1a03          	or	a,(OFST-1,sp)
6157  0019 01            	rrwa	x,a
6158                     ; 1985     return (uint16_t)tmpccr1;
6162  001a 5b04          	addw	sp,#4
6163  001c 81            	ret	
6215                     ; 1993 uint16_t TIM1_GetCapture2(void)
6215                     ; 1994 {
6216                     .text:	section	.text,new
6217  0000               _TIM1_GetCapture2:
6219  0000 5204          	subw	sp,#4
6220       00000004      OFST:	set	4
6223                     ; 1997     uint16_t tmpccr2 = 0;
6225                     ; 1998     uint8_t tmpccr2l=0, tmpccr2h=0;
6229                     ; 2000     tmpccr2h = TIM1->CCR2H;
6231  0002 c65267        	ld	a,21095
6232  0005 6b02          	ld	(OFST-2,sp),a
6233                     ; 2001     tmpccr2l = TIM1->CCR2L;
6235  0007 c65268        	ld	a,21096
6236  000a 6b01          	ld	(OFST-3,sp),a
6237                     ; 2003     tmpccr2 = (uint16_t)(tmpccr2l);
6239  000c 5f            	clrw	x
6240  000d 97            	ld	xl,a
6241  000e 1f03          	ldw	(OFST-1,sp),x
6242                     ; 2004     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6244  0010 5f            	clrw	x
6245  0011 7b02          	ld	a,(OFST-2,sp)
6246  0013 97            	ld	xl,a
6247  0014 7b04          	ld	a,(OFST+0,sp)
6248  0016 01            	rrwa	x,a
6249  0017 1a03          	or	a,(OFST-1,sp)
6250  0019 01            	rrwa	x,a
6251                     ; 2006     return (uint16_t)tmpccr2;
6255  001a 5b04          	addw	sp,#4
6256  001c 81            	ret	
6308                     ; 2014 uint16_t TIM1_GetCapture3(void)
6308                     ; 2015 {
6309                     .text:	section	.text,new
6310  0000               _TIM1_GetCapture3:
6312  0000 5204          	subw	sp,#4
6313       00000004      OFST:	set	4
6316                     ; 2017     uint16_t tmpccr3 = 0;
6318                     ; 2018     uint8_t tmpccr3l=0, tmpccr3h=0;
6322                     ; 2020     tmpccr3h = TIM1->CCR3H;
6324  0002 c65269        	ld	a,21097
6325  0005 6b02          	ld	(OFST-2,sp),a
6326                     ; 2021     tmpccr3l = TIM1->CCR3L;
6328  0007 c6526a        	ld	a,21098
6329  000a 6b01          	ld	(OFST-3,sp),a
6330                     ; 2023     tmpccr3 = (uint16_t)(tmpccr3l);
6332  000c 5f            	clrw	x
6333  000d 97            	ld	xl,a
6334  000e 1f03          	ldw	(OFST-1,sp),x
6335                     ; 2024     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6337  0010 5f            	clrw	x
6338  0011 7b02          	ld	a,(OFST-2,sp)
6339  0013 97            	ld	xl,a
6340  0014 7b04          	ld	a,(OFST+0,sp)
6341  0016 01            	rrwa	x,a
6342  0017 1a03          	or	a,(OFST-1,sp)
6343  0019 01            	rrwa	x,a
6344                     ; 2026     return (uint16_t)tmpccr3;
6348  001a 5b04          	addw	sp,#4
6349  001c 81            	ret	
6401                     ; 2034 uint16_t TIM1_GetCapture4(void)
6401                     ; 2035 {
6402                     .text:	section	.text,new
6403  0000               _TIM1_GetCapture4:
6405  0000 5204          	subw	sp,#4
6406       00000004      OFST:	set	4
6409                     ; 2037     uint16_t tmpccr4 = 0;
6411                     ; 2038     uint8_t tmpccr4l=0, tmpccr4h=0;
6415                     ; 2040     tmpccr4h = TIM1->CCR4H;
6417  0002 c6526b        	ld	a,21099
6418  0005 6b02          	ld	(OFST-2,sp),a
6419                     ; 2041     tmpccr4l = TIM1->CCR4L;
6421  0007 c6526c        	ld	a,21100
6422  000a 6b01          	ld	(OFST-3,sp),a
6423                     ; 2043     tmpccr4 = (uint16_t)(tmpccr4l);
6425  000c 5f            	clrw	x
6426  000d 97            	ld	xl,a
6427  000e 1f03          	ldw	(OFST-1,sp),x
6428                     ; 2044     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6430  0010 5f            	clrw	x
6431  0011 7b02          	ld	a,(OFST-2,sp)
6432  0013 97            	ld	xl,a
6433  0014 7b04          	ld	a,(OFST+0,sp)
6434  0016 01            	rrwa	x,a
6435  0017 1a03          	or	a,(OFST-1,sp)
6436  0019 01            	rrwa	x,a
6437                     ; 2046     return (uint16_t)tmpccr4;
6441  001a 5b04          	addw	sp,#4
6442  001c 81            	ret	
6476                     ; 2054 uint16_t TIM1_GetCounter(void)
6476                     ; 2055 {
6477                     .text:	section	.text,new
6478  0000               _TIM1_GetCounter:
6480  0000 89            	pushw	x
6481       00000002      OFST:	set	2
6484                     ; 2056   uint16_t tmpcntr = 0;
6486                     ; 2058   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6488  0001 c6525e        	ld	a,21086
6489  0004 97            	ld	xl,a
6490  0005 4f            	clr	a
6491  0006 02            	rlwa	x,a
6492  0007 1f01          	ldw	(OFST-1,sp),x
6493                     ; 2061     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6495  0009 c6525f        	ld	a,21087
6496  000c 5f            	clrw	x
6497  000d 97            	ld	xl,a
6498  000e 01            	rrwa	x,a
6499  000f 1a02          	or	a,(OFST+0,sp)
6500  0011 01            	rrwa	x,a
6501  0012 1a01          	or	a,(OFST-1,sp)
6502  0014 01            	rrwa	x,a
6505  0015 5b02          	addw	sp,#2
6506  0017 81            	ret	
6540                     ; 2069 uint16_t TIM1_GetPrescaler(void)
6540                     ; 2070 {
6541                     .text:	section	.text,new
6542  0000               _TIM1_GetPrescaler:
6544  0000 89            	pushw	x
6545       00000002      OFST:	set	2
6548                     ; 2071    uint16_t temp = 0;
6550                     ; 2073    temp = ((uint16_t)TIM1->PSCRH << 8);
6552  0001 c65260        	ld	a,21088
6553  0004 97            	ld	xl,a
6554  0005 4f            	clr	a
6555  0006 02            	rlwa	x,a
6556  0007 1f01          	ldw	(OFST-1,sp),x
6557                     ; 2076     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6559  0009 c65261        	ld	a,21089
6560  000c 5f            	clrw	x
6561  000d 97            	ld	xl,a
6562  000e 01            	rrwa	x,a
6563  000f 1a02          	or	a,(OFST+0,sp)
6564  0011 01            	rrwa	x,a
6565  0012 1a01          	or	a,(OFST-1,sp)
6566  0014 01            	rrwa	x,a
6569  0015 5b02          	addw	sp,#2
6570  0017 81            	ret	
6744                     ; 2097 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6744                     ; 2098 {
6745                     .text:	section	.text,new
6746  0000               _TIM1_GetFlagStatus:
6748  0000 89            	pushw	x
6749  0001 89            	pushw	x
6750       00000002      OFST:	set	2
6753                     ; 2099     FlagStatus bitstatus = RESET;
6755                     ; 2100     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6759                     ; 2103     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6761                     ; 2105     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6763  0002 9f            	ld	a,xl
6764  0003 c45255        	and	a,21077
6765  0006 6b01          	ld	(OFST-1,sp),a
6766                     ; 2106     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6768  0008 7b03          	ld	a,(OFST+1,sp)
6769  000a 6b02          	ld	(OFST+0,sp),a
6770                     ; 2108     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6772  000c c45256        	and	a,21078
6773  000f 1a01          	or	a,(OFST-1,sp)
6774  0011 2702          	jreq	L5643
6775                     ; 2110         bitstatus = SET;
6777  0013 a601          	ld	a,#1
6779  0015               L5643:
6780                     ; 2114         bitstatus = RESET;
6782                     ; 2116     return (FlagStatus)(bitstatus);
6786  0015 5b04          	addw	sp,#4
6787  0017 81            	ret	
6822                     ; 2137 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6822                     ; 2138 {
6823                     .text:	section	.text,new
6824  0000               _TIM1_ClearFlag:
6826  0000 89            	pushw	x
6827       00000000      OFST:	set	0
6830                     ; 2140     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6832                     ; 2143     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6834  0001 9f            	ld	a,xl
6835  0002 43            	cpl	a
6836  0003 c75255        	ld	21077,a
6837                     ; 2144     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6837                     ; 2145                           (uint8_t)0x1E);
6839  0006 7b01          	ld	a,(OFST+1,sp)
6840  0008 43            	cpl	a
6841  0009 a41e          	and	a,#30
6842  000b c75256        	ld	21078,a
6843                     ; 2146 }
6846  000e 85            	popw	x
6847  000f 81            	ret	
6911                     ; 2162 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6911                     ; 2163 {
6912                     .text:	section	.text,new
6913  0000               _TIM1_GetITStatus:
6915  0000 88            	push	a
6916  0001 89            	pushw	x
6917       00000002      OFST:	set	2
6920                     ; 2164     ITStatus bitstatus = RESET;
6922                     ; 2165     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6926                     ; 2168     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6928                     ; 2170     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6930  0002 c45255        	and	a,21077
6931  0005 6b01          	ld	(OFST-1,sp),a
6932                     ; 2172     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6934  0007 c65254        	ld	a,21076
6935  000a 1403          	and	a,(OFST+1,sp)
6936  000c 6b02          	ld	(OFST+0,sp),a
6937                     ; 2174     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6939  000e 7b01          	ld	a,(OFST-1,sp)
6940  0010 2708          	jreq	L1453
6942  0012 7b02          	ld	a,(OFST+0,sp)
6943  0014 2704          	jreq	L1453
6944                     ; 2176         bitstatus = SET;
6946  0016 a601          	ld	a,#1
6948  0018 2001          	jra	L3453
6949  001a               L1453:
6950                     ; 2180         bitstatus = RESET;
6952  001a 4f            	clr	a
6953  001b               L3453:
6954                     ; 2182     return (ITStatus)(bitstatus);
6958  001b 5b03          	addw	sp,#3
6959  001d 81            	ret	
6995                     ; 2199 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6995                     ; 2200 {
6996                     .text:	section	.text,new
6997  0000               _TIM1_ClearITPendingBit:
7001                     ; 2202     assert_param(IS_TIM1_IT_OK(TIM1_IT));
7003                     ; 2205     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7005  0000 43            	cpl	a
7006  0001 c75255        	ld	21077,a
7007                     ; 2206 }
7010  0004 81            	ret	
7062                     ; 2224 static void TI1_Config(uint8_t TIM1_ICPolarity,
7062                     ; 2225                        uint8_t TIM1_ICSelection,
7062                     ; 2226                        uint8_t TIM1_ICFilter)
7062                     ; 2227 {
7063                     .text:	section	.text,new
7064  0000               L3_TI1_Config:
7066  0000 89            	pushw	x
7067  0001 88            	push	a
7068       00000001      OFST:	set	1
7071                     ; 2230     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7073  0002 7211525c      	bres	21084,#0
7074                     ; 2233     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7074                     ; 2234                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7076  0006 7b06          	ld	a,(OFST+5,sp)
7077  0008 97            	ld	xl,a
7078  0009 a610          	ld	a,#16
7079  000b 42            	mul	x,a
7080  000c 9f            	ld	a,xl
7081  000d 1a03          	or	a,(OFST+2,sp)
7082  000f 6b01          	ld	(OFST+0,sp),a
7083  0011 c65258        	ld	a,21080
7084  0014 a40c          	and	a,#12
7085  0016 1a01          	or	a,(OFST+0,sp)
7086  0018 c75258        	ld	21080,a
7087                     ; 2237     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7089  001b 7b02          	ld	a,(OFST+1,sp)
7090  001d 2706          	jreq	L1163
7091                     ; 2239         TIM1->CCER1 |= TIM1_CCER1_CC1P;
7093  001f 7212525c      	bset	21084,#1
7095  0023 2004          	jra	L3163
7096  0025               L1163:
7097                     ; 2243         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7099  0025 7213525c      	bres	21084,#1
7100  0029               L3163:
7101                     ; 2247     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7103  0029 7210525c      	bset	21084,#0
7104                     ; 2248 }
7107  002d 5b03          	addw	sp,#3
7108  002f 81            	ret	
7160                     ; 2266 static void TI2_Config(uint8_t TIM1_ICPolarity,
7160                     ; 2267                        uint8_t TIM1_ICSelection,
7160                     ; 2268                        uint8_t TIM1_ICFilter)
7160                     ; 2269 {
7161                     .text:	section	.text,new
7162  0000               L5_TI2_Config:
7164  0000 89            	pushw	x
7165  0001 88            	push	a
7166       00000001      OFST:	set	1
7169                     ; 2271     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7171  0002 7219525c      	bres	21084,#4
7172                     ; 2274     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7172                     ; 2275                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7174  0006 7b06          	ld	a,(OFST+5,sp)
7175  0008 97            	ld	xl,a
7176  0009 a610          	ld	a,#16
7177  000b 42            	mul	x,a
7178  000c 9f            	ld	a,xl
7179  000d 1a03          	or	a,(OFST+2,sp)
7180  000f 6b01          	ld	(OFST+0,sp),a
7181  0011 c65259        	ld	a,21081
7182  0014 a40c          	and	a,#12
7183  0016 1a01          	or	a,(OFST+0,sp)
7184  0018 c75259        	ld	21081,a
7185                     ; 2277     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7187  001b 7b02          	ld	a,(OFST+1,sp)
7188  001d 2706          	jreq	L3463
7189                     ; 2279         TIM1->CCER1 |= TIM1_CCER1_CC2P;
7191  001f 721a525c      	bset	21084,#5
7193  0023 2004          	jra	L5463
7194  0025               L3463:
7195                     ; 2283         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7197  0025 721b525c      	bres	21084,#5
7198  0029               L5463:
7199                     ; 2286     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7201  0029 7218525c      	bset	21084,#4
7202                     ; 2287 }
7205  002d 5b03          	addw	sp,#3
7206  002f 81            	ret	
7258                     ; 2305 static void TI3_Config(uint8_t TIM1_ICPolarity,
7258                     ; 2306                        uint8_t TIM1_ICSelection,
7258                     ; 2307                        uint8_t TIM1_ICFilter)
7258                     ; 2308 {
7259                     .text:	section	.text,new
7260  0000               L7_TI3_Config:
7262  0000 89            	pushw	x
7263  0001 88            	push	a
7264       00000001      OFST:	set	1
7267                     ; 2310     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7269  0002 7211525d      	bres	21085,#0
7270                     ; 2313     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7270                     ; 2314                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7272  0006 7b06          	ld	a,(OFST+5,sp)
7273  0008 97            	ld	xl,a
7274  0009 a610          	ld	a,#16
7275  000b 42            	mul	x,a
7276  000c 9f            	ld	a,xl
7277  000d 1a03          	or	a,(OFST+2,sp)
7278  000f 6b01          	ld	(OFST+0,sp),a
7279  0011 c6525a        	ld	a,21082
7280  0014 a40c          	and	a,#12
7281  0016 1a01          	or	a,(OFST+0,sp)
7282  0018 c7525a        	ld	21082,a
7283                     ; 2317     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7285  001b 7b02          	ld	a,(OFST+1,sp)
7286  001d 2706          	jreq	L5763
7287                     ; 2319         TIM1->CCER2 |= TIM1_CCER2_CC3P;
7289  001f 7212525d      	bset	21085,#1
7291  0023 2004          	jra	L7763
7292  0025               L5763:
7293                     ; 2323         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7295  0025 7213525d      	bres	21085,#1
7296  0029               L7763:
7297                     ; 2326     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7299  0029 7210525d      	bset	21085,#0
7300                     ; 2327 }
7303  002d 5b03          	addw	sp,#3
7304  002f 81            	ret	
7356                     ; 2346 static void TI4_Config(uint8_t TIM1_ICPolarity,
7356                     ; 2347                        uint8_t TIM1_ICSelection,
7356                     ; 2348                        uint8_t TIM1_ICFilter)
7356                     ; 2349 {
7357                     .text:	section	.text,new
7358  0000               L11_TI4_Config:
7360  0000 89            	pushw	x
7361  0001 88            	push	a
7362       00000001      OFST:	set	1
7365                     ; 2352     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7367  0002 7219525d      	bres	21085,#4
7368                     ; 2355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7368                     ; 2356                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7370  0006 7b06          	ld	a,(OFST+5,sp)
7371  0008 97            	ld	xl,a
7372  0009 a610          	ld	a,#16
7373  000b 42            	mul	x,a
7374  000c 9f            	ld	a,xl
7375  000d 1a03          	or	a,(OFST+2,sp)
7376  000f 6b01          	ld	(OFST+0,sp),a
7377  0011 c6525b        	ld	a,21083
7378  0014 a40c          	and	a,#12
7379  0016 1a01          	or	a,(OFST+0,sp)
7380  0018 c7525b        	ld	21083,a
7381                     ; 2359     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7383  001b 7b02          	ld	a,(OFST+1,sp)
7384  001d 2706          	jreq	L7273
7385                     ; 2361         TIM1->CCER2 |= TIM1_CCER2_CC4P;
7387  001f 721a525d      	bset	21085,#5
7389  0023 2004          	jra	L1373
7390  0025               L7273:
7391                     ; 2365         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7393  0025 721b525d      	bres	21085,#5
7394  0029               L1373:
7395                     ; 2369     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7397  0029 7218525d      	bset	21085,#4
7398                     ; 2370 }
7401  002d 5b03          	addw	sp,#3
7402  002f 81            	ret	
7415                     	xdef	_TIM1_ClearITPendingBit
7416                     	xdef	_TIM1_GetITStatus
7417                     	xdef	_TIM1_ClearFlag
7418                     	xdef	_TIM1_GetFlagStatus
7419                     	xdef	_TIM1_GetPrescaler
7420                     	xdef	_TIM1_GetCounter
7421                     	xdef	_TIM1_GetCapture4
7422                     	xdef	_TIM1_GetCapture3
7423                     	xdef	_TIM1_GetCapture2
7424                     	xdef	_TIM1_GetCapture1
7425                     	xdef	_TIM1_SetIC4Prescaler
7426                     	xdef	_TIM1_SetIC3Prescaler
7427                     	xdef	_TIM1_SetIC2Prescaler
7428                     	xdef	_TIM1_SetIC1Prescaler
7429                     	xdef	_TIM1_SetCompare4
7430                     	xdef	_TIM1_SetCompare3
7431                     	xdef	_TIM1_SetCompare2
7432                     	xdef	_TIM1_SetCompare1
7433                     	xdef	_TIM1_SetAutoreload
7434                     	xdef	_TIM1_SetCounter
7435                     	xdef	_TIM1_SelectOCxM
7436                     	xdef	_TIM1_CCxNCmd
7437                     	xdef	_TIM1_CCxCmd
7438                     	xdef	_TIM1_OC4PolarityConfig
7439                     	xdef	_TIM1_OC3NPolarityConfig
7440                     	xdef	_TIM1_OC3PolarityConfig
7441                     	xdef	_TIM1_OC2NPolarityConfig
7442                     	xdef	_TIM1_OC2PolarityConfig
7443                     	xdef	_TIM1_OC1NPolarityConfig
7444                     	xdef	_TIM1_OC1PolarityConfig
7445                     	xdef	_TIM1_GenerateEvent
7446                     	xdef	_TIM1_OC4FastConfig
7447                     	xdef	_TIM1_OC3FastConfig
7448                     	xdef	_TIM1_OC2FastConfig
7449                     	xdef	_TIM1_OC1FastConfig
7450                     	xdef	_TIM1_OC4PreloadConfig
7451                     	xdef	_TIM1_OC3PreloadConfig
7452                     	xdef	_TIM1_OC2PreloadConfig
7453                     	xdef	_TIM1_OC1PreloadConfig
7454                     	xdef	_TIM1_CCPreloadControl
7455                     	xdef	_TIM1_SelectCOM
7456                     	xdef	_TIM1_ARRPreloadConfig
7457                     	xdef	_TIM1_ForcedOC4Config
7458                     	xdef	_TIM1_ForcedOC3Config
7459                     	xdef	_TIM1_ForcedOC2Config
7460                     	xdef	_TIM1_ForcedOC1Config
7461                     	xdef	_TIM1_CounterModeConfig
7462                     	xdef	_TIM1_PrescalerConfig
7463                     	xdef	_TIM1_EncoderInterfaceConfig
7464                     	xdef	_TIM1_SelectMasterSlaveMode
7465                     	xdef	_TIM1_SelectSlaveMode
7466                     	xdef	_TIM1_SelectOutputTrigger
7467                     	xdef	_TIM1_SelectOnePulseMode
7468                     	xdef	_TIM1_SelectHallSensor
7469                     	xdef	_TIM1_UpdateRequestConfig
7470                     	xdef	_TIM1_UpdateDisableConfig
7471                     	xdef	_TIM1_SelectInputTrigger
7472                     	xdef	_TIM1_TIxExternalClockConfig
7473                     	xdef	_TIM1_ETRConfig
7474                     	xdef	_TIM1_ETRClockMode2Config
7475                     	xdef	_TIM1_ETRClockMode1Config
7476                     	xdef	_TIM1_InternalClockConfig
7477                     	xdef	_TIM1_ITConfig
7478                     	xdef	_TIM1_CtrlPWMOutputs
7479                     	xdef	_TIM1_Cmd
7480                     	xdef	_TIM1_PWMIConfig
7481                     	xdef	_TIM1_ICInit
7482                     	xdef	_TIM1_BDTRConfig
7483                     	xdef	_TIM1_OC4Init
7484                     	xdef	_TIM1_OC3Init
7485                     	xdef	_TIM1_OC2Init
7486                     	xdef	_TIM1_OC1Init
7487                     	xdef	_TIM1_TimeBaseInit
7488                     	xdef	_TIM1_DeInit
7507                     	end
