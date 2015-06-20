   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  50                     ; 46 void TIM2_DeInit(void)
  50                     ; 47 {
  52                     .text:	section	.text,new
  53  0000               _TIM2_DeInit:
  57                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  59  0000 725f5300      	clr	21248
  60                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  62  0004 725f5303      	clr	21251
  63                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  65  0008 725f5305      	clr	21253
  66                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  68  000c 725f530a      	clr	21258
  69                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  71  0010 725f530b      	clr	21259
  72                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  74  0014 725f530a      	clr	21258
  75                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  77  0018 725f530b      	clr	21259
  78                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  80  001c 725f5307      	clr	21255
  81                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  83  0020 725f5308      	clr	21256
  84                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  86  0024 725f5309      	clr	21257
  87                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  89  0028 725f530c      	clr	21260
  90                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  92  002c 725f530d      	clr	21261
  93                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  95  0030 725f530e      	clr	21262
  96                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  98  0034 35ff530f      	mov	21263,#255
  99                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
 101  0038 35ff5310      	mov	21264,#255
 102                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 104  003c 725f5311      	clr	21265
 105                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 107  0040 725f5312      	clr	21266
 108                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 110  0044 725f5313      	clr	21267
 111                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 113  0048 725f5314      	clr	21268
 114                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 116  004c 725f5315      	clr	21269
 117                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 119  0050 725f5316      	clr	21270
 120                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 122  0054 725f5304      	clr	21252
 123                     ; 76 }
 126  0058 81            	ret	
 294                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 294                     ; 86                         uint16_t TIM2_Period)
 294                     ; 87 {
 295                     .text:	section	.text,new
 296  0000               _TIM2_TimeBaseInit:
 298  0000 88            	push	a
 299       00000000      OFST:	set	0
 302                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 304  0001 c7530e        	ld	21262,a
 305                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 307  0004 7b04          	ld	a,(OFST+4,sp)
 308  0006 c7530f        	ld	21263,a
 309                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 311  0009 7b05          	ld	a,(OFST+5,sp)
 312  000b c75310        	ld	21264,a
 313                     ; 93 }
 316  000e 84            	pop	a
 317  000f 81            	ret	
 474                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 474                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 474                     ; 106                   uint16_t TIM2_Pulse,
 474                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 474                     ; 108 {
 475                     .text:	section	.text,new
 476  0000               _TIM2_OC1Init:
 478  0000 89            	pushw	x
 479  0001 88            	push	a
 480       00000001      OFST:	set	1
 483                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 485                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 487                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 489                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 491  0002 c6530a        	ld	a,21258
 492  0005 a4fc          	and	a,#252
 493  0007 c7530a        	ld	21258,a
 494                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 494                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 496  000a 7b08          	ld	a,(OFST+7,sp)
 497  000c a402          	and	a,#2
 498  000e 6b01          	ld	(OFST+0,sp),a
 499  0010 9f            	ld	a,xl
 500  0011 a401          	and	a,#1
 501  0013 1a01          	or	a,(OFST+0,sp)
 502  0015 ca530a        	or	a,21258
 503  0018 c7530a        	ld	21258,a
 504                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 504                     ; 122                             (uint8_t)TIM2_OCMode);
 506  001b c65307        	ld	a,21255
 507  001e a48f          	and	a,#143
 508  0020 1a02          	or	a,(OFST+1,sp)
 509  0022 c75307        	ld	21255,a
 510                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 512  0025 7b06          	ld	a,(OFST+5,sp)
 513  0027 c75311        	ld	21265,a
 514                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 516  002a 7b07          	ld	a,(OFST+6,sp)
 517  002c c75312        	ld	21266,a
 518                     ; 127 }
 521  002f 5b03          	addw	sp,#3
 522  0031 81            	ret	
 586                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 586                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 586                     ; 140                   uint16_t TIM2_Pulse,
 586                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 586                     ; 142 {
 587                     .text:	section	.text,new
 588  0000               _TIM2_OC2Init:
 590  0000 89            	pushw	x
 591  0001 88            	push	a
 592       00000001      OFST:	set	1
 595                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 597                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 599                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 601                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 603  0002 c6530a        	ld	a,21258
 604  0005 a4cf          	and	a,#207
 605  0007 c7530a        	ld	21258,a
 606                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 606                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 608  000a 7b08          	ld	a,(OFST+7,sp)
 609  000c a420          	and	a,#32
 610  000e 6b01          	ld	(OFST+0,sp),a
 611  0010 9f            	ld	a,xl
 612  0011 a410          	and	a,#16
 613  0013 1a01          	or	a,(OFST+0,sp)
 614  0015 ca530a        	or	a,21258
 615  0018 c7530a        	ld	21258,a
 616                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 616                     ; 158                             (uint8_t)TIM2_OCMode);
 618  001b c65308        	ld	a,21256
 619  001e a48f          	and	a,#143
 620  0020 1a02          	or	a,(OFST+1,sp)
 621  0022 c75308        	ld	21256,a
 622                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 624  0025 7b06          	ld	a,(OFST+5,sp)
 625  0027 c75313        	ld	21267,a
 626                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 628  002a 7b07          	ld	a,(OFST+6,sp)
 629  002c c75314        	ld	21268,a
 630                     ; 164 }
 633  002f 5b03          	addw	sp,#3
 634  0031 81            	ret	
 698                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 698                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 698                     ; 177                   uint16_t TIM2_Pulse,
 698                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 698                     ; 179 {
 699                     .text:	section	.text,new
 700  0000               _TIM2_OC3Init:
 702  0000 89            	pushw	x
 703  0001 88            	push	a
 704       00000001      OFST:	set	1
 707                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 709                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 711                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 713                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 715  0002 c6530b        	ld	a,21259
 716  0005 a4fc          	and	a,#252
 717  0007 c7530b        	ld	21259,a
 718                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 718                     ; 188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 720  000a 7b08          	ld	a,(OFST+7,sp)
 721  000c a402          	and	a,#2
 722  000e 6b01          	ld	(OFST+0,sp),a
 723  0010 9f            	ld	a,xl
 724  0011 a401          	and	a,#1
 725  0013 1a01          	or	a,(OFST+0,sp)
 726  0015 ca530b        	or	a,21259
 727  0018 c7530b        	ld	21259,a
 728                     ; 191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 728                     ; 192                             (uint8_t)TIM2_OCMode);
 730  001b c65309        	ld	a,21257
 731  001e a48f          	and	a,#143
 732  0020 1a02          	or	a,(OFST+1,sp)
 733  0022 c75309        	ld	21257,a
 734                     ; 195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 736  0025 7b06          	ld	a,(OFST+5,sp)
 737  0027 c75315        	ld	21269,a
 738                     ; 196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 740  002a 7b07          	ld	a,(OFST+6,sp)
 741  002c c75316        	ld	21270,a
 742                     ; 198 }
 745  002f 5b03          	addw	sp,#3
 746  0031 81            	ret	
 939                     ; 210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 939                     ; 211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 939                     ; 212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 939                     ; 213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 939                     ; 214                  uint8_t TIM2_ICFilter)
 939                     ; 215 {
 940                     .text:	section	.text,new
 941  0000               _TIM2_ICInit:
 943  0000 89            	pushw	x
 944       00000000      OFST:	set	0
 947                     ; 217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 949                     ; 218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 951                     ; 219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 953                     ; 220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 955                     ; 221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 957                     ; 223     if (TIM2_Channel == TIM2_CHANNEL_1)
 959  0001 9e            	ld	a,xh
 960  0002 4d            	tnz	a
 961  0003 2614          	jrne	L104
 962                     ; 226         TI1_Config((uint8_t)TIM2_ICPolarity,
 962                     ; 227                    (uint8_t)TIM2_ICSelection,
 962                     ; 228                    (uint8_t)TIM2_ICFilter);
 964  0005 7b07          	ld	a,(OFST+7,sp)
 965  0007 88            	push	a
 966  0008 7b06          	ld	a,(OFST+6,sp)
 967  000a 97            	ld	xl,a
 968  000b 7b03          	ld	a,(OFST+3,sp)
 969  000d 95            	ld	xh,a
 970  000e cd0000        	call	L3_TI1_Config
 972  0011 84            	pop	a
 973                     ; 231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 975  0012 7b06          	ld	a,(OFST+6,sp)
 976  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 979  0017 202b          	jra	L304
 980  0019               L104:
 981                     ; 233     else if (TIM2_Channel == TIM2_CHANNEL_2)
 983  0019 7b01          	ld	a,(OFST+1,sp)
 984  001b 4a            	dec	a
 985  001c 2614          	jrne	L504
 986                     ; 236         TI2_Config((uint8_t)TIM2_ICPolarity,
 986                     ; 237                    (uint8_t)TIM2_ICSelection,
 986                     ; 238                    (uint8_t)TIM2_ICFilter);
 988  001e 7b07          	ld	a,(OFST+7,sp)
 989  0020 88            	push	a
 990  0021 7b06          	ld	a,(OFST+6,sp)
 991  0023 97            	ld	xl,a
 992  0024 7b03          	ld	a,(OFST+3,sp)
 993  0026 95            	ld	xh,a
 994  0027 cd0000        	call	L5_TI2_Config
 996  002a 84            	pop	a
 997                     ; 241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 999  002b 7b06          	ld	a,(OFST+6,sp)
1000  002d cd0000        	call	_TIM2_SetIC2Prescaler
1003  0030 2012          	jra	L304
1004  0032               L504:
1005                     ; 246         TI3_Config((uint8_t)TIM2_ICPolarity,
1005                     ; 247                    (uint8_t)TIM2_ICSelection,
1005                     ; 248                    (uint8_t)TIM2_ICFilter);
1007  0032 7b07          	ld	a,(OFST+7,sp)
1008  0034 88            	push	a
1009  0035 7b06          	ld	a,(OFST+6,sp)
1010  0037 97            	ld	xl,a
1011  0038 7b03          	ld	a,(OFST+3,sp)
1012  003a 95            	ld	xh,a
1013  003b cd0000        	call	L7_TI3_Config
1015  003e 84            	pop	a
1016                     ; 251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1018  003f 7b06          	ld	a,(OFST+6,sp)
1019  0041 cd0000        	call	_TIM2_SetIC3Prescaler
1021  0044               L304:
1022                     ; 253 }
1025  0044 85            	popw	x
1026  0045 81            	ret	
1122                     ; 265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1122                     ; 266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1122                     ; 267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1122                     ; 268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1122                     ; 269                      uint8_t TIM2_ICFilter)
1122                     ; 270 {
1123                     .text:	section	.text,new
1124  0000               _TIM2_PWMIConfig:
1126  0000 89            	pushw	x
1127  0001 89            	pushw	x
1128       00000002      OFST:	set	2
1131                     ; 271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1133                     ; 272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1135                     ; 275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1137                     ; 276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1139                     ; 277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1141                     ; 278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1143                     ; 281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1145  0002 9f            	ld	a,xl
1146  0003 a144          	cp	a,#68
1147  0005 2706          	jreq	L754
1148                     ; 283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1150  0007 a644          	ld	a,#68
1151  0009 6b01          	ld	(OFST-1,sp),a
1153  000b 2002          	jra	L164
1154  000d               L754:
1155                     ; 287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1157  000d 0f01          	clr	(OFST-1,sp)
1158  000f               L164:
1159                     ; 291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1161  000f 7b07          	ld	a,(OFST+5,sp)
1162  0011 4a            	dec	a
1163  0012 2604          	jrne	L364
1164                     ; 293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1166  0014 a602          	ld	a,#2
1168  0016 2002          	jra	L564
1169  0018               L364:
1170                     ; 297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1172  0018 a601          	ld	a,#1
1173  001a               L564:
1174  001a 6b02          	ld	(OFST+0,sp),a
1175                     ; 300     if (TIM2_Channel == TIM2_CHANNEL_1)
1177  001c 7b03          	ld	a,(OFST+1,sp)
1178  001e 2626          	jrne	L764
1179                     ; 303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1179                     ; 304                    (uint8_t)TIM2_ICFilter);
1181  0020 7b09          	ld	a,(OFST+7,sp)
1182  0022 88            	push	a
1183  0023 7b08          	ld	a,(OFST+6,sp)
1184  0025 97            	ld	xl,a
1185  0026 7b05          	ld	a,(OFST+3,sp)
1186  0028 95            	ld	xh,a
1187  0029 cd0000        	call	L3_TI1_Config
1189  002c 84            	pop	a
1190                     ; 307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1192  002d 7b08          	ld	a,(OFST+6,sp)
1193  002f cd0000        	call	_TIM2_SetIC1Prescaler
1195                     ; 310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1197  0032 7b09          	ld	a,(OFST+7,sp)
1198  0034 88            	push	a
1199  0035 7b03          	ld	a,(OFST+1,sp)
1200  0037 97            	ld	xl,a
1201  0038 7b02          	ld	a,(OFST+0,sp)
1202  003a 95            	ld	xh,a
1203  003b cd0000        	call	L5_TI2_Config
1205  003e 84            	pop	a
1206                     ; 313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1208  003f 7b08          	ld	a,(OFST+6,sp)
1209  0041 cd0000        	call	_TIM2_SetIC2Prescaler
1212  0044 2024          	jra	L174
1213  0046               L764:
1214                     ; 318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1214                     ; 319                    (uint8_t)TIM2_ICFilter);
1216  0046 7b09          	ld	a,(OFST+7,sp)
1217  0048 88            	push	a
1218  0049 7b08          	ld	a,(OFST+6,sp)
1219  004b 97            	ld	xl,a
1220  004c 7b05          	ld	a,(OFST+3,sp)
1221  004e 95            	ld	xh,a
1222  004f cd0000        	call	L5_TI2_Config
1224  0052 84            	pop	a
1225                     ; 322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1227  0053 7b08          	ld	a,(OFST+6,sp)
1228  0055 cd0000        	call	_TIM2_SetIC2Prescaler
1230                     ; 325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1232  0058 7b09          	ld	a,(OFST+7,sp)
1233  005a 88            	push	a
1234  005b 7b03          	ld	a,(OFST+1,sp)
1235  005d 97            	ld	xl,a
1236  005e 7b02          	ld	a,(OFST+0,sp)
1237  0060 95            	ld	xh,a
1238  0061 cd0000        	call	L3_TI1_Config
1240  0064 84            	pop	a
1241                     ; 328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1243  0065 7b08          	ld	a,(OFST+6,sp)
1244  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1246  006a               L174:
1247                     ; 330 }
1250  006a 5b04          	addw	sp,#4
1251  006c 81            	ret	
1306                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1306                     ; 340 {
1307                     .text:	section	.text,new
1308  0000               _TIM2_Cmd:
1312                     ; 342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1314                     ; 345     if (NewState != DISABLE)
1316  0000 4d            	tnz	a
1317  0001 2705          	jreq	L125
1318                     ; 347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1320  0003 72105300      	bset	21248,#0
1323  0007 81            	ret	
1324  0008               L125:
1325                     ; 351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1327  0008 72115300      	bres	21248,#0
1328                     ; 353 }
1331  000c 81            	ret	
1410                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1410                     ; 370 {
1411                     .text:	section	.text,new
1412  0000               _TIM2_ITConfig:
1414  0000 89            	pushw	x
1415       00000000      OFST:	set	0
1418                     ; 372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1420                     ; 373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1422                     ; 375     if (NewState != DISABLE)
1424  0001 9f            	ld	a,xl
1425  0002 4d            	tnz	a
1426  0003 2706          	jreq	L365
1427                     ; 378         TIM2->IER |= (uint8_t)TIM2_IT;
1429  0005 9e            	ld	a,xh
1430  0006 ca5303        	or	a,21251
1432  0009 2006          	jra	L565
1433  000b               L365:
1434                     ; 383         TIM2->IER &= (uint8_t)(~TIM2_IT);
1436  000b 7b01          	ld	a,(OFST+1,sp)
1437  000d 43            	cpl	a
1438  000e c45303        	and	a,21251
1439  0011               L565:
1440  0011 c75303        	ld	21251,a
1441                     ; 385 }
1444  0014 85            	popw	x
1445  0015 81            	ret	
1481                     ; 394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1481                     ; 395 {
1482                     .text:	section	.text,new
1483  0000               _TIM2_UpdateDisableConfig:
1487                     ; 397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1489                     ; 400     if (NewState != DISABLE)
1491  0000 4d            	tnz	a
1492  0001 2705          	jreq	L506
1493                     ; 402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1495  0003 72125300      	bset	21248,#1
1498  0007 81            	ret	
1499  0008               L506:
1500                     ; 406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1502  0008 72135300      	bres	21248,#1
1503                     ; 408 }
1506  000c 81            	ret	
1564                     ; 418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1564                     ; 419 {
1565                     .text:	section	.text,new
1566  0000               _TIM2_UpdateRequestConfig:
1570                     ; 421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1572                     ; 424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1574  0000 4d            	tnz	a
1575  0001 2705          	jreq	L736
1576                     ; 426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1578  0003 72145300      	bset	21248,#2
1581  0007 81            	ret	
1582  0008               L736:
1583                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1585  0008 72155300      	bres	21248,#2
1586                     ; 432 }
1589  000c 81            	ret	
1646                     ; 443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1646                     ; 444 {
1647                     .text:	section	.text,new
1648  0000               _TIM2_SelectOnePulseMode:
1652                     ; 446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1654                     ; 449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1656  0000 4d            	tnz	a
1657  0001 2705          	jreq	L176
1658                     ; 451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1660  0003 72165300      	bset	21248,#3
1663  0007 81            	ret	
1664  0008               L176:
1665                     ; 455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1667  0008 72175300      	bres	21248,#3
1668                     ; 458 }
1671  000c 81            	ret	
1739                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1739                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1739                     ; 491 {
1740                     .text:	section	.text,new
1741  0000               _TIM2_PrescalerConfig:
1745                     ; 493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1747                     ; 494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1749                     ; 497     TIM2->PSCR = (uint8_t)Prescaler;
1751  0000 9e            	ld	a,xh
1752  0001 c7530e        	ld	21262,a
1753                     ; 500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1755  0004 9f            	ld	a,xl
1756  0005 c75306        	ld	21254,a
1757                     ; 501 }
1760  0008 81            	ret	
1818                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1818                     ; 513 {
1819                     .text:	section	.text,new
1820  0000               _TIM2_ForcedOC1Config:
1822  0000 88            	push	a
1823       00000000      OFST:	set	0
1826                     ; 515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1828                     ; 518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1828                     ; 519                               | (uint8_t)TIM2_ForcedAction);
1830  0001 c65307        	ld	a,21255
1831  0004 a48f          	and	a,#143
1832  0006 1a01          	or	a,(OFST+1,sp)
1833  0008 c75307        	ld	21255,a
1834                     ; 520 }
1837  000b 84            	pop	a
1838  000c 81            	ret	
1874                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1874                     ; 532 {
1875                     .text:	section	.text,new
1876  0000               _TIM2_ForcedOC2Config:
1878  0000 88            	push	a
1879       00000000      OFST:	set	0
1882                     ; 534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1884                     ; 537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1884                     ; 538                             | (uint8_t)TIM2_ForcedAction);
1886  0001 c65308        	ld	a,21256
1887  0004 a48f          	and	a,#143
1888  0006 1a01          	or	a,(OFST+1,sp)
1889  0008 c75308        	ld	21256,a
1890                     ; 539 }
1893  000b 84            	pop	a
1894  000c 81            	ret	
1930                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1930                     ; 551 {
1931                     .text:	section	.text,new
1932  0000               _TIM2_ForcedOC3Config:
1934  0000 88            	push	a
1935       00000000      OFST:	set	0
1938                     ; 553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1940                     ; 556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1940                     ; 557                               | (uint8_t)TIM2_ForcedAction);
1942  0001 c65309        	ld	a,21257
1943  0004 a48f          	and	a,#143
1944  0006 1a01          	or	a,(OFST+1,sp)
1945  0008 c75309        	ld	21257,a
1946                     ; 558 }
1949  000b 84            	pop	a
1950  000c 81            	ret	
1986                     ; 567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1986                     ; 568 {
1987                     .text:	section	.text,new
1988  0000               _TIM2_ARRPreloadConfig:
1992                     ; 570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1994                     ; 573     if (NewState != DISABLE)
1996  0000 4d            	tnz	a
1997  0001 2705          	jreq	L7201
1998                     ; 575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2000  0003 721e5300      	bset	21248,#7
2003  0007 81            	ret	
2004  0008               L7201:
2005                     ; 579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2007  0008 721f5300      	bres	21248,#7
2008                     ; 581 }
2011  000c 81            	ret	
2047                     ; 590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2047                     ; 591 {
2048                     .text:	section	.text,new
2049  0000               _TIM2_OC1PreloadConfig:
2053                     ; 593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2055                     ; 596     if (NewState != DISABLE)
2057  0000 4d            	tnz	a
2058  0001 2705          	jreq	L1501
2059                     ; 598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2061  0003 72165307      	bset	21255,#3
2064  0007 81            	ret	
2065  0008               L1501:
2066                     ; 602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2068  0008 72175307      	bres	21255,#3
2069                     ; 604 }
2072  000c 81            	ret	
2108                     ; 613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2108                     ; 614 {
2109                     .text:	section	.text,new
2110  0000               _TIM2_OC2PreloadConfig:
2114                     ; 616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2116                     ; 619     if (NewState != DISABLE)
2118  0000 4d            	tnz	a
2119  0001 2705          	jreq	L3701
2120                     ; 621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2122  0003 72165308      	bset	21256,#3
2125  0007 81            	ret	
2126  0008               L3701:
2127                     ; 625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2129  0008 72175308      	bres	21256,#3
2130                     ; 627 }
2133  000c 81            	ret	
2169                     ; 636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2169                     ; 637 {
2170                     .text:	section	.text,new
2171  0000               _TIM2_OC3PreloadConfig:
2175                     ; 639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2177                     ; 642     if (NewState != DISABLE)
2179  0000 4d            	tnz	a
2180  0001 2705          	jreq	L5111
2181                     ; 644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2183  0003 72165309      	bset	21257,#3
2186  0007 81            	ret	
2187  0008               L5111:
2188                     ; 648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2190  0008 72175309      	bres	21257,#3
2191                     ; 650 }
2194  000c 81            	ret	
2267                     ; 663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2267                     ; 664 {
2268                     .text:	section	.text,new
2269  0000               _TIM2_GenerateEvent:
2273                     ; 666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2275                     ; 669     TIM2->EGR = (uint8_t)TIM2_EventSource;
2277  0000 c75306        	ld	21254,a
2278                     ; 670 }
2281  0003 81            	ret	
2317                     ; 681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2317                     ; 682 {
2318                     .text:	section	.text,new
2319  0000               _TIM2_OC1PolarityConfig:
2323                     ; 684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2325                     ; 687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2327  0000 4d            	tnz	a
2328  0001 2705          	jreq	L1711
2329                     ; 689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2331  0003 7212530a      	bset	21258,#1
2334  0007 81            	ret	
2335  0008               L1711:
2336                     ; 693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2338  0008 7213530a      	bres	21258,#1
2339                     ; 695 }
2342  000c 81            	ret	
2378                     ; 706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2378                     ; 707 {
2379                     .text:	section	.text,new
2380  0000               _TIM2_OC2PolarityConfig:
2384                     ; 709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2386                     ; 712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2388  0000 4d            	tnz	a
2389  0001 2705          	jreq	L3121
2390                     ; 714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
2392  0003 721a530a      	bset	21258,#5
2395  0007 81            	ret	
2396  0008               L3121:
2397                     ; 718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2399  0008 721b530a      	bres	21258,#5
2400                     ; 720 }
2403  000c 81            	ret	
2439                     ; 731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2439                     ; 732 {
2440                     .text:	section	.text,new
2441  0000               _TIM2_OC3PolarityConfig:
2445                     ; 734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2447                     ; 737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2449  0000 4d            	tnz	a
2450  0001 2705          	jreq	L5321
2451                     ; 739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2453  0003 7212530b      	bset	21259,#1
2456  0007 81            	ret	
2457  0008               L5321:
2458                     ; 743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2460  0008 7213530b      	bres	21259,#1
2461                     ; 745 }
2464  000c 81            	ret	
2509                     ; 759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2509                     ; 760 {
2510                     .text:	section	.text,new
2511  0000               _TIM2_CCxCmd:
2513  0000 89            	pushw	x
2514       00000000      OFST:	set	0
2517                     ; 762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2519                     ; 763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2521                     ; 765     if (TIM2_Channel == TIM2_CHANNEL_1)
2523  0001 9e            	ld	a,xh
2524  0002 4d            	tnz	a
2525  0003 2610          	jrne	L3621
2526                     ; 768         if (NewState != DISABLE)
2528  0005 9f            	ld	a,xl
2529  0006 4d            	tnz	a
2530  0007 2706          	jreq	L5621
2531                     ; 770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2533  0009 7210530a      	bset	21258,#0
2535  000d 2029          	jra	L1721
2536  000f               L5621:
2537                     ; 774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2539  000f 7211530a      	bres	21258,#0
2540  0013 2023          	jra	L1721
2541  0015               L3621:
2542                     ; 778     else if (TIM2_Channel == TIM2_CHANNEL_2)
2544  0015 7b01          	ld	a,(OFST+1,sp)
2545  0017 4a            	dec	a
2546  0018 2610          	jrne	L3721
2547                     ; 781         if (NewState != DISABLE)
2549  001a 7b02          	ld	a,(OFST+2,sp)
2550  001c 2706          	jreq	L5721
2551                     ; 783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2553  001e 7218530a      	bset	21258,#4
2555  0022 2014          	jra	L1721
2556  0024               L5721:
2557                     ; 787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2559  0024 7219530a      	bres	21258,#4
2560  0028 200e          	jra	L1721
2561  002a               L3721:
2562                     ; 793         if (NewState != DISABLE)
2564  002a 7b02          	ld	a,(OFST+2,sp)
2565  002c 2706          	jreq	L3031
2566                     ; 795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2568  002e 7210530b      	bset	21259,#0
2570  0032 2004          	jra	L1721
2571  0034               L3031:
2572                     ; 799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2574  0034 7211530b      	bres	21259,#0
2575  0038               L1721:
2576                     ; 802 }
2579  0038 85            	popw	x
2580  0039 81            	ret	
2625                     ; 824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2625                     ; 825 {
2626                     .text:	section	.text,new
2627  0000               _TIM2_SelectOCxM:
2629  0000 89            	pushw	x
2630       00000000      OFST:	set	0
2633                     ; 827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2635                     ; 828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2637                     ; 830     if (TIM2_Channel == TIM2_CHANNEL_1)
2639  0001 9e            	ld	a,xh
2640  0002 4d            	tnz	a
2641  0003 2610          	jrne	L1331
2642                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2644  0005 7211530a      	bres	21258,#0
2645                     ; 836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2645                     ; 837                                | (uint8_t)TIM2_OCMode);
2647  0009 c65307        	ld	a,21255
2648  000c a48f          	and	a,#143
2649  000e 1a02          	or	a,(OFST+2,sp)
2650  0010 c75307        	ld	21255,a
2652  0013 2023          	jra	L3331
2653  0015               L1331:
2654                     ; 839     else if (TIM2_Channel == TIM2_CHANNEL_2)
2656  0015 7b01          	ld	a,(OFST+1,sp)
2657  0017 4a            	dec	a
2658  0018 2610          	jrne	L5331
2659                     ; 842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2661  001a 7219530a      	bres	21258,#4
2662                     ; 845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2662                     ; 846                                 | (uint8_t)TIM2_OCMode);
2664  001e c65308        	ld	a,21256
2665  0021 a48f          	and	a,#143
2666  0023 1a02          	or	a,(OFST+2,sp)
2667  0025 c75308        	ld	21256,a
2669  0028 200e          	jra	L3331
2670  002a               L5331:
2671                     ; 851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2673  002a 7211530b      	bres	21259,#0
2674                     ; 854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2674                     ; 855                                 | (uint8_t)TIM2_OCMode);
2676  002e c65309        	ld	a,21257
2677  0031 a48f          	and	a,#143
2678  0033 1a02          	or	a,(OFST+2,sp)
2679  0035 c75309        	ld	21257,a
2680  0038               L3331:
2681                     ; 857 }
2684  0038 85            	popw	x
2685  0039 81            	ret	
2719                     ; 866 void TIM2_SetCounter(uint16_t Counter)
2719                     ; 867 {
2720                     .text:	section	.text,new
2721  0000               _TIM2_SetCounter:
2725                     ; 869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
2727  0000 9e            	ld	a,xh
2728  0001 c7530c        	ld	21260,a
2729                     ; 870     TIM2->CNTRL = (uint8_t)(Counter);
2731  0004 9f            	ld	a,xl
2732  0005 c7530d        	ld	21261,a
2733                     ; 872 }
2736  0008 81            	ret	
2770                     ; 881 void TIM2_SetAutoreload(uint16_t Autoreload)
2770                     ; 882 {
2771                     .text:	section	.text,new
2772  0000               _TIM2_SetAutoreload:
2776                     ; 885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2778  0000 9e            	ld	a,xh
2779  0001 c7530f        	ld	21263,a
2780                     ; 886     TIM2->ARRL = (uint8_t)(Autoreload);
2782  0004 9f            	ld	a,xl
2783  0005 c75310        	ld	21264,a
2784                     ; 888 }
2787  0008 81            	ret	
2821                     ; 897 void TIM2_SetCompare1(uint16_t Compare1)
2821                     ; 898 {
2822                     .text:	section	.text,new
2823  0000               _TIM2_SetCompare1:
2827                     ; 900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2829  0000 9e            	ld	a,xh
2830  0001 c75311        	ld	21265,a
2831                     ; 901     TIM2->CCR1L = (uint8_t)(Compare1);
2833  0004 9f            	ld	a,xl
2834  0005 c75312        	ld	21266,a
2835                     ; 903 }
2838  0008 81            	ret	
2872                     ; 912 void TIM2_SetCompare2(uint16_t Compare2)
2872                     ; 913 {
2873                     .text:	section	.text,new
2874  0000               _TIM2_SetCompare2:
2878                     ; 915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2880  0000 9e            	ld	a,xh
2881  0001 c75313        	ld	21267,a
2882                     ; 916     TIM2->CCR2L = (uint8_t)(Compare2);
2884  0004 9f            	ld	a,xl
2885  0005 c75314        	ld	21268,a
2886                     ; 918 }
2889  0008 81            	ret	
2923                     ; 927 void TIM2_SetCompare3(uint16_t Compare3)
2923                     ; 928 {
2924                     .text:	section	.text,new
2925  0000               _TIM2_SetCompare3:
2929                     ; 930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2931  0000 9e            	ld	a,xh
2932  0001 c75315        	ld	21269,a
2933                     ; 931     TIM2->CCR3L = (uint8_t)(Compare3);
2935  0004 9f            	ld	a,xl
2936  0005 c75316        	ld	21270,a
2937                     ; 933 }
2940  0008 81            	ret	
2976                     ; 946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2976                     ; 947 {
2977                     .text:	section	.text,new
2978  0000               _TIM2_SetIC1Prescaler:
2980  0000 88            	push	a
2981       00000000      OFST:	set	0
2984                     ; 949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2986                     ; 952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2986                     ; 953                             | (uint8_t)TIM2_IC1Prescaler);
2988  0001 c65307        	ld	a,21255
2989  0004 a4f3          	and	a,#243
2990  0006 1a01          	or	a,(OFST+1,sp)
2991  0008 c75307        	ld	21255,a
2992                     ; 954 }
2995  000b 84            	pop	a
2996  000c 81            	ret	
3032                     ; 966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3032                     ; 967 {
3033                     .text:	section	.text,new
3034  0000               _TIM2_SetIC2Prescaler:
3036  0000 88            	push	a
3037       00000000      OFST:	set	0
3040                     ; 969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3042                     ; 972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3042                     ; 973                             | (uint8_t)TIM2_IC2Prescaler);
3044  0001 c65308        	ld	a,21256
3045  0004 a4f3          	and	a,#243
3046  0006 1a01          	or	a,(OFST+1,sp)
3047  0008 c75308        	ld	21256,a
3048                     ; 974 }
3051  000b 84            	pop	a
3052  000c 81            	ret	
3088                     ; 986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3088                     ; 987 {
3089                     .text:	section	.text,new
3090  0000               _TIM2_SetIC3Prescaler:
3092  0000 88            	push	a
3093       00000000      OFST:	set	0
3096                     ; 990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3098                     ; 992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3098                     ; 993                             | (uint8_t)TIM2_IC3Prescaler);
3100  0001 c65309        	ld	a,21257
3101  0004 a4f3          	and	a,#243
3102  0006 1a01          	or	a,(OFST+1,sp)
3103  0008 c75309        	ld	21257,a
3104                     ; 994 }
3107  000b 84            	pop	a
3108  000c 81            	ret	
3160                     ; 1001 uint16_t TIM2_GetCapture1(void)
3160                     ; 1002 {
3161                     .text:	section	.text,new
3162  0000               _TIM2_GetCapture1:
3164  0000 5204          	subw	sp,#4
3165       00000004      OFST:	set	4
3168                     ; 1004     uint16_t tmpccr1 = 0;
3170                     ; 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
3174                     ; 1007     tmpccr1h = TIM2->CCR1H;
3176  0002 c65311        	ld	a,21265
3177  0005 6b02          	ld	(OFST-2,sp),a
3178                     ; 1008     tmpccr1l = TIM2->CCR1L;
3180  0007 c65312        	ld	a,21266
3181  000a 6b01          	ld	(OFST-3,sp),a
3182                     ; 1010     tmpccr1 = (uint16_t)(tmpccr1l);
3184  000c 5f            	clrw	x
3185  000d 97            	ld	xl,a
3186  000e 1f03          	ldw	(OFST-1,sp),x
3187                     ; 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3189  0010 5f            	clrw	x
3190  0011 7b02          	ld	a,(OFST-2,sp)
3191  0013 97            	ld	xl,a
3192  0014 7b04          	ld	a,(OFST+0,sp)
3193  0016 01            	rrwa	x,a
3194  0017 1a03          	or	a,(OFST-1,sp)
3195  0019 01            	rrwa	x,a
3196                     ; 1013     return (uint16_t)tmpccr1;
3200  001a 5b04          	addw	sp,#4
3201  001c 81            	ret	
3253                     ; 1021 uint16_t TIM2_GetCapture2(void)
3253                     ; 1022 {
3254                     .text:	section	.text,new
3255  0000               _TIM2_GetCapture2:
3257  0000 5204          	subw	sp,#4
3258       00000004      OFST:	set	4
3261                     ; 1024     uint16_t tmpccr2 = 0;
3263                     ; 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
3267                     ; 1027     tmpccr2h = TIM2->CCR2H;
3269  0002 c65313        	ld	a,21267
3270  0005 6b02          	ld	(OFST-2,sp),a
3271                     ; 1028     tmpccr2l = TIM2->CCR2L;
3273  0007 c65314        	ld	a,21268
3274  000a 6b01          	ld	(OFST-3,sp),a
3275                     ; 1030     tmpccr2 = (uint16_t)(tmpccr2l);
3277  000c 5f            	clrw	x
3278  000d 97            	ld	xl,a
3279  000e 1f03          	ldw	(OFST-1,sp),x
3280                     ; 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3282  0010 5f            	clrw	x
3283  0011 7b02          	ld	a,(OFST-2,sp)
3284  0013 97            	ld	xl,a
3285  0014 7b04          	ld	a,(OFST+0,sp)
3286  0016 01            	rrwa	x,a
3287  0017 1a03          	or	a,(OFST-1,sp)
3288  0019 01            	rrwa	x,a
3289                     ; 1033     return (uint16_t)tmpccr2;
3293  001a 5b04          	addw	sp,#4
3294  001c 81            	ret	
3346                     ; 1041 uint16_t TIM2_GetCapture3(void)
3346                     ; 1042 {
3347                     .text:	section	.text,new
3348  0000               _TIM2_GetCapture3:
3350  0000 5204          	subw	sp,#4
3351       00000004      OFST:	set	4
3354                     ; 1044     uint16_t tmpccr3 = 0;
3356                     ; 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
3360                     ; 1047     tmpccr3h = TIM2->CCR3H;
3362  0002 c65315        	ld	a,21269
3363  0005 6b02          	ld	(OFST-2,sp),a
3364                     ; 1048     tmpccr3l = TIM2->CCR3L;
3366  0007 c65316        	ld	a,21270
3367  000a 6b01          	ld	(OFST-3,sp),a
3368                     ; 1050     tmpccr3 = (uint16_t)(tmpccr3l);
3370  000c 5f            	clrw	x
3371  000d 97            	ld	xl,a
3372  000e 1f03          	ldw	(OFST-1,sp),x
3373                     ; 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3375  0010 5f            	clrw	x
3376  0011 7b02          	ld	a,(OFST-2,sp)
3377  0013 97            	ld	xl,a
3378  0014 7b04          	ld	a,(OFST+0,sp)
3379  0016 01            	rrwa	x,a
3380  0017 1a03          	or	a,(OFST-1,sp)
3381  0019 01            	rrwa	x,a
3382                     ; 1053     return (uint16_t)tmpccr3;
3386  001a 5b04          	addw	sp,#4
3387  001c 81            	ret	
3421                     ; 1061 uint16_t TIM2_GetCounter(void)
3421                     ; 1062 {
3422                     .text:	section	.text,new
3423  0000               _TIM2_GetCounter:
3425  0000 89            	pushw	x
3426       00000002      OFST:	set	2
3429                     ; 1063      uint16_t tmpcntr = 0;
3431                     ; 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3433  0001 c6530c        	ld	a,21260
3434  0004 97            	ld	xl,a
3435  0005 4f            	clr	a
3436  0006 02            	rlwa	x,a
3437  0007 1f01          	ldw	(OFST-1,sp),x
3438                     ; 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3440  0009 c6530d        	ld	a,21261
3441  000c 5f            	clrw	x
3442  000d 97            	ld	xl,a
3443  000e 01            	rrwa	x,a
3444  000f 1a02          	or	a,(OFST+0,sp)
3445  0011 01            	rrwa	x,a
3446  0012 1a01          	or	a,(OFST-1,sp)
3447  0014 01            	rrwa	x,a
3450  0015 5b02          	addw	sp,#2
3451  0017 81            	ret	
3475                     ; 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3475                     ; 1077 {
3476                     .text:	section	.text,new
3477  0000               _TIM2_GetPrescaler:
3481                     ; 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3483  0000 c6530e        	ld	a,21262
3486  0003 81            	ret	
3625                     ; 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3625                     ; 1097 {
3626                     .text:	section	.text,new
3627  0000               _TIM2_GetFlagStatus:
3629  0000 89            	pushw	x
3630  0001 89            	pushw	x
3631       00000002      OFST:	set	2
3634                     ; 1098     FlagStatus bitstatus = RESET;
3636                     ; 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3640                     ; 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3642                     ; 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3644  0002 9f            	ld	a,xl
3645  0003 c45304        	and	a,21252
3646  0006 6b01          	ld	(OFST-1,sp),a
3647                     ; 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3649  0008 7b03          	ld	a,(OFST+1,sp)
3650  000a 6b02          	ld	(OFST+0,sp),a
3651                     ; 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3653  000c c45305        	and	a,21253
3654  000f 1a01          	or	a,(OFST-1,sp)
3655  0011 2702          	jreq	L5371
3656                     ; 1109         bitstatus = SET;
3658  0013 a601          	ld	a,#1
3660  0015               L5371:
3661                     ; 1113         bitstatus = RESET;
3663                     ; 1115     return (FlagStatus)bitstatus;
3667  0015 5b04          	addw	sp,#4
3668  0017 81            	ret	
3703                     ; 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3703                     ; 1133 {
3704                     .text:	section	.text,new
3705  0000               _TIM2_ClearFlag:
3709                     ; 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3711                     ; 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3713  0000 9f            	ld	a,xl
3714  0001 43            	cpl	a
3715  0002 c75304        	ld	21252,a
3716                     ; 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3718  0005 35ff5305      	mov	21253,#255
3719                     ; 1140 }
3722  0009 81            	ret	
3786                     ; 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3786                     ; 1155 {
3787                     .text:	section	.text,new
3788  0000               _TIM2_GetITStatus:
3790  0000 88            	push	a
3791  0001 89            	pushw	x
3792       00000002      OFST:	set	2
3795                     ; 1156     ITStatus bitstatus = RESET;
3797                     ; 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3801                     ; 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3803                     ; 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3805  0002 c45304        	and	a,21252
3806  0005 6b01          	ld	(OFST-1,sp),a
3807                     ; 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3809  0007 c65303        	ld	a,21251
3810  000a 1403          	and	a,(OFST+1,sp)
3811  000c 6b02          	ld	(OFST+0,sp),a
3812                     ; 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3814  000e 7b01          	ld	a,(OFST-1,sp)
3815  0010 2708          	jreq	L1102
3817  0012 7b02          	ld	a,(OFST+0,sp)
3818  0014 2704          	jreq	L1102
3819                     ; 1168         bitstatus = SET;
3821  0016 a601          	ld	a,#1
3823  0018 2001          	jra	L3102
3824  001a               L1102:
3825                     ; 1172         bitstatus = RESET;
3827  001a 4f            	clr	a
3828  001b               L3102:
3829                     ; 1174     return (ITStatus)(bitstatus);
3833  001b 5b03          	addw	sp,#3
3834  001d 81            	ret	
3870                     ; 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3870                     ; 1189 {
3871                     .text:	section	.text,new
3872  0000               _TIM2_ClearITPendingBit:
3876                     ; 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
3878                     ; 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
3880  0000 43            	cpl	a
3881  0001 c75304        	ld	21252,a
3882                     ; 1195 }
3885  0004 81            	ret	
3937                     ; 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
3937                     ; 1215                        uint8_t TIM2_ICSelection,
3937                     ; 1216                        uint8_t TIM2_ICFilter)
3937                     ; 1217 {
3938                     .text:	section	.text,new
3939  0000               L3_TI1_Config:
3941  0000 89            	pushw	x
3942  0001 88            	push	a
3943       00000001      OFST:	set	1
3946                     ; 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3948  0002 7211530a      	bres	21258,#0
3949                     ; 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3949                     ; 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3951  0006 7b06          	ld	a,(OFST+5,sp)
3952  0008 97            	ld	xl,a
3953  0009 a610          	ld	a,#16
3954  000b 42            	mul	x,a
3955  000c 9f            	ld	a,xl
3956  000d 1a03          	or	a,(OFST+2,sp)
3957  000f 6b01          	ld	(OFST+0,sp),a
3958  0011 c65307        	ld	a,21255
3959  0014 a40c          	and	a,#12
3960  0016 1a01          	or	a,(OFST+0,sp)
3961  0018 c75307        	ld	21255,a
3962                     ; 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3964  001b 7b02          	ld	a,(OFST+1,sp)
3965  001d 2706          	jreq	L1602
3966                     ; 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
3968  001f 7212530a      	bset	21258,#1
3970  0023 2004          	jra	L3602
3971  0025               L1602:
3972                     ; 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3974  0025 7213530a      	bres	21258,#1
3975  0029               L3602:
3976                     ; 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
3978  0029 7210530a      	bset	21258,#0
3979                     ; 1236 }
3982  002d 5b03          	addw	sp,#3
3983  002f 81            	ret	
4035                     ; 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
4035                     ; 1256                        uint8_t TIM2_ICSelection,
4035                     ; 1257                        uint8_t TIM2_ICFilter)
4035                     ; 1258 {
4036                     .text:	section	.text,new
4037  0000               L5_TI2_Config:
4039  0000 89            	pushw	x
4040  0001 88            	push	a
4041       00000001      OFST:	set	1
4044                     ; 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4046  0002 7219530a      	bres	21258,#4
4047                     ; 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4047                     ; 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4049  0006 7b06          	ld	a,(OFST+5,sp)
4050  0008 97            	ld	xl,a
4051  0009 a610          	ld	a,#16
4052  000b 42            	mul	x,a
4053  000c 9f            	ld	a,xl
4054  000d 1a03          	or	a,(OFST+2,sp)
4055  000f 6b01          	ld	(OFST+0,sp),a
4056  0011 c65308        	ld	a,21256
4057  0014 a40c          	and	a,#12
4058  0016 1a01          	or	a,(OFST+0,sp)
4059  0018 c75308        	ld	21256,a
4060                     ; 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4062  001b 7b02          	ld	a,(OFST+1,sp)
4063  001d 2706          	jreq	L3112
4064                     ; 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
4066  001f 721a530a      	bset	21258,#5
4068  0023 2004          	jra	L5112
4069  0025               L3112:
4070                     ; 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4072  0025 721b530a      	bres	21258,#5
4073  0029               L5112:
4074                     ; 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
4076  0029 7218530a      	bset	21258,#4
4077                     ; 1280 }
4080  002d 5b03          	addw	sp,#3
4081  002f 81            	ret	
4133                     ; 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4133                     ; 1297                        uint8_t TIM2_ICFilter)
4133                     ; 1298 {
4134                     .text:	section	.text,new
4135  0000               L7_TI3_Config:
4137  0000 89            	pushw	x
4138  0001 88            	push	a
4139       00000001      OFST:	set	1
4142                     ; 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4144  0002 7211530b      	bres	21259,#0
4145                     ; 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4145                     ; 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4147  0006 7b06          	ld	a,(OFST+5,sp)
4148  0008 97            	ld	xl,a
4149  0009 a610          	ld	a,#16
4150  000b 42            	mul	x,a
4151  000c 9f            	ld	a,xl
4152  000d 1a03          	or	a,(OFST+2,sp)
4153  000f 6b01          	ld	(OFST+0,sp),a
4154  0011 c65309        	ld	a,21257
4155  0014 a40c          	and	a,#12
4156  0016 1a01          	or	a,(OFST+0,sp)
4157  0018 c75309        	ld	21257,a
4158                     ; 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4160  001b 7b02          	ld	a,(OFST+1,sp)
4161  001d 2706          	jreq	L5412
4162                     ; 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
4164  001f 7212530b      	bset	21259,#1
4166  0023 2004          	jra	L7412
4167  0025               L5412:
4168                     ; 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4170  0025 7213530b      	bres	21259,#1
4171  0029               L7412:
4172                     ; 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
4174  0029 7210530b      	bset	21259,#0
4175                     ; 1318 }
4178  002d 5b03          	addw	sp,#3
4179  002f 81            	ret	
4192                     	xdef	_TIM2_ClearITPendingBit
4193                     	xdef	_TIM2_GetITStatus
4194                     	xdef	_TIM2_ClearFlag
4195                     	xdef	_TIM2_GetFlagStatus
4196                     	xdef	_TIM2_GetPrescaler
4197                     	xdef	_TIM2_GetCounter
4198                     	xdef	_TIM2_GetCapture3
4199                     	xdef	_TIM2_GetCapture2
4200                     	xdef	_TIM2_GetCapture1
4201                     	xdef	_TIM2_SetIC3Prescaler
4202                     	xdef	_TIM2_SetIC2Prescaler
4203                     	xdef	_TIM2_SetIC1Prescaler
4204                     	xdef	_TIM2_SetCompare3
4205                     	xdef	_TIM2_SetCompare2
4206                     	xdef	_TIM2_SetCompare1
4207                     	xdef	_TIM2_SetAutoreload
4208                     	xdef	_TIM2_SetCounter
4209                     	xdef	_TIM2_SelectOCxM
4210                     	xdef	_TIM2_CCxCmd
4211                     	xdef	_TIM2_OC3PolarityConfig
4212                     	xdef	_TIM2_OC2PolarityConfig
4213                     	xdef	_TIM2_OC1PolarityConfig
4214                     	xdef	_TIM2_GenerateEvent
4215                     	xdef	_TIM2_OC3PreloadConfig
4216                     	xdef	_TIM2_OC2PreloadConfig
4217                     	xdef	_TIM2_OC1PreloadConfig
4218                     	xdef	_TIM2_ARRPreloadConfig
4219                     	xdef	_TIM2_ForcedOC3Config
4220                     	xdef	_TIM2_ForcedOC2Config
4221                     	xdef	_TIM2_ForcedOC1Config
4222                     	xdef	_TIM2_PrescalerConfig
4223                     	xdef	_TIM2_SelectOnePulseMode
4224                     	xdef	_TIM2_UpdateRequestConfig
4225                     	xdef	_TIM2_UpdateDisableConfig
4226                     	xdef	_TIM2_ITConfig
4227                     	xdef	_TIM2_Cmd
4228                     	xdef	_TIM2_PWMIConfig
4229                     	xdef	_TIM2_ICInit
4230                     	xdef	_TIM2_OC3Init
4231                     	xdef	_TIM2_OC2Init
4232                     	xdef	_TIM2_OC1Init
4233                     	xdef	_TIM2_TimeBaseInit
4234                     	xdef	_TIM2_DeInit
4253                     	end
