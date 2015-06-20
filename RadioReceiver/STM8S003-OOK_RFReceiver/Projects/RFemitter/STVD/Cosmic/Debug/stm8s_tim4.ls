   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  50                     ; 43 void TIM4_DeInit(void)
  50                     ; 44 {
  52                     .text:	section	.text,new
  53  0000               _TIM4_DeInit:
  57                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  59  0000 725f5340      	clr	21312
  60                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  62  0004 725f5343      	clr	21315
  63                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  65  0008 725f5346      	clr	21318
  66                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  68  000c 725f5347      	clr	21319
  69                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  71  0010 35ff5348      	mov	21320,#255
  72                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  74  0014 725f5344      	clr	21316
  75                     ; 51 }
  78  0018 81            	ret	
 184                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 184                     ; 60 {
 185                     .text:	section	.text,new
 186  0000               _TIM4_TimeBaseInit:
 190                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 192                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 194  0000 9e            	ld	a,xh
 195  0001 c75347        	ld	21319,a
 196                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 198  0004 9f            	ld	a,xl
 199  0005 c75348        	ld	21320,a
 200                     ; 67 }
 203  0008 81            	ret	
 258                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 258                     ; 78 {
 259                     .text:	section	.text,new
 260  0000               _TIM4_Cmd:
 264                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 266                     ; 83     if (NewState != DISABLE)
 268  0000 4d            	tnz	a
 269  0001 2705          	jreq	L511
 270                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 272  0003 72105340      	bset	21312,#0
 275  0007 81            	ret	
 276  0008               L511:
 277                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 279  0008 72115340      	bres	21312,#0
 280                     ; 91 }
 283  000c 81            	ret	
 341                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 341                     ; 104 {
 342                     .text:	section	.text,new
 343  0000               _TIM4_ITConfig:
 345  0000 89            	pushw	x
 346       00000000      OFST:	set	0
 349                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 351                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 353                     ; 109     if (NewState != DISABLE)
 355  0001 9f            	ld	a,xl
 356  0002 4d            	tnz	a
 357  0003 2706          	jreq	L151
 358                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 360  0005 9e            	ld	a,xh
 361  0006 ca5343        	or	a,21315
 363  0009 2006          	jra	L351
 364  000b               L151:
 365                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 367  000b 7b01          	ld	a,(OFST+1,sp)
 368  000d 43            	cpl	a
 369  000e c45343        	and	a,21315
 370  0011               L351:
 371  0011 c75343        	ld	21315,a
 372                     ; 119 }
 375  0014 85            	popw	x
 376  0015 81            	ret	
 412                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 412                     ; 128 {
 413                     .text:	section	.text,new
 414  0000               _TIM4_UpdateDisableConfig:
 418                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 420                     ; 133     if (NewState != DISABLE)
 422  0000 4d            	tnz	a
 423  0001 2705          	jreq	L371
 424                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 426  0003 72125340      	bset	21312,#1
 429  0007 81            	ret	
 430  0008               L371:
 431                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 433  0008 72135340      	bres	21312,#1
 434                     ; 141 }
 437  000c 81            	ret	
 495                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 495                     ; 152 {
 496                     .text:	section	.text,new
 497  0000               _TIM4_UpdateRequestConfig:
 501                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 503                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 505  0000 4d            	tnz	a
 506  0001 2705          	jreq	L522
 507                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 509  0003 72145340      	bset	21312,#2
 512  0007 81            	ret	
 513  0008               L522:
 514                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 516  0008 72155340      	bres	21312,#2
 517                     ; 165 }
 520  000c 81            	ret	
 577                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 577                     ; 176 {
 578                     .text:	section	.text,new
 579  0000               _TIM4_SelectOnePulseMode:
 583                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 585                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 587  0000 4d            	tnz	a
 588  0001 2705          	jreq	L752
 589                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 591  0003 72165340      	bset	21312,#3
 594  0007 81            	ret	
 595  0008               L752:
 596                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 598  0008 72175340      	bres	21312,#3
 599                     ; 190 }
 602  000c 81            	ret	
 670                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 670                     ; 213 {
 671                     .text:	section	.text,new
 672  0000               _TIM4_PrescalerConfig:
 676                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 678                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 680                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 682  0000 9e            	ld	a,xh
 683  0001 c75347        	ld	21319,a
 684                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 686  0004 9f            	ld	a,xl
 687  0005 c75345        	ld	21317,a
 688                     ; 223 }
 691  0008 81            	ret	
 727                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 727                     ; 232 {
 728                     .text:	section	.text,new
 729  0000               _TIM4_ARRPreloadConfig:
 733                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 735                     ; 237     if (NewState != DISABLE)
 737  0000 4d            	tnz	a
 738  0001 2705          	jreq	L333
 739                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 741  0003 721e5340      	bset	21312,#7
 744  0007 81            	ret	
 745  0008               L333:
 746                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 748  0008 721f5340      	bres	21312,#7
 749                     ; 245 }
 752  000c 81            	ret	
 801                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 801                     ; 255 {
 802                     .text:	section	.text,new
 803  0000               _TIM4_GenerateEvent:
 807                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 809                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
 811  0000 c75345        	ld	21317,a
 812                     ; 261 }
 815  0003 81            	ret	
 849                     ; 270 void TIM4_SetCounter(uint8_t Counter)
 849                     ; 271 {
 850                     .text:	section	.text,new
 851  0000               _TIM4_SetCounter:
 855                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
 857  0000 c75346        	ld	21318,a
 858                     ; 274 }
 861  0003 81            	ret	
 895                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
 895                     ; 284 {
 896                     .text:	section	.text,new
 897  0000               _TIM4_SetAutoreload:
 901                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
 903  0000 c75348        	ld	21320,a
 904                     ; 287 }
 907  0003 81            	ret	
 930                     ; 294 uint8_t TIM4_GetCounter(void)
 930                     ; 295 {
 931                     .text:	section	.text,new
 932  0000               _TIM4_GetCounter:
 936                     ; 297     return (uint8_t)(TIM4->CNTR);
 938  0000 c65346        	ld	a,21318
 941  0003 81            	ret	
 965                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 965                     ; 306 {
 966                     .text:	section	.text,new
 967  0000               _TIM4_GetPrescaler:
 971                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 973  0000 c65347        	ld	a,21319
 976  0003 81            	ret	
1055                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1055                     ; 319 {
1056                     .text:	section	.text,new
1057  0000               _TIM4_GetFlagStatus:
1059  0000 88            	push	a
1060       00000001      OFST:	set	1
1063                     ; 320     FlagStatus bitstatus = RESET;
1065                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1067                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1069  0001 c45344        	and	a,21316
1070  0004 2702          	jreq	L774
1071                     ; 327     bitstatus = SET;
1073  0006 a601          	ld	a,#1
1075  0008               L774:
1076                     ; 331     bitstatus = RESET;
1078                     ; 333   return ((FlagStatus)bitstatus);
1082  0008 5b01          	addw	sp,#1
1083  000a 81            	ret	
1118                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1118                     ; 344 {
1119                     .text:	section	.text,new
1120  0000               _TIM4_ClearFlag:
1124                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1126                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1128  0000 43            	cpl	a
1129  0001 c75344        	ld	21316,a
1130                     ; 351 }
1133  0004 81            	ret	
1197                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1197                     ; 361 {
1198                     .text:	section	.text,new
1199  0000               _TIM4_GetITStatus:
1201  0000 88            	push	a
1202  0001 89            	pushw	x
1203       00000002      OFST:	set	2
1206                     ; 362     ITStatus bitstatus = RESET;
1208                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1212                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1214                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1216  0002 c45344        	and	a,21316
1217  0005 6b01          	ld	(OFST-1,sp),a
1218                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1220  0007 c65343        	ld	a,21315
1221  000a 1403          	and	a,(OFST+1,sp)
1222  000c 6b02          	ld	(OFST+0,sp),a
1223                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1225  000e 7b01          	ld	a,(OFST-1,sp)
1226  0010 2708          	jreq	L355
1228  0012 7b02          	ld	a,(OFST+0,sp)
1229  0014 2704          	jreq	L355
1230                     ; 375     bitstatus = (ITStatus)SET;
1232  0016 a601          	ld	a,#1
1234  0018 2001          	jra	L555
1235  001a               L355:
1236                     ; 379     bitstatus = (ITStatus)RESET;
1238  001a 4f            	clr	a
1239  001b               L555:
1240                     ; 381   return ((ITStatus)bitstatus);
1244  001b 5b03          	addw	sp,#3
1245  001d 81            	ret	
1281                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1281                     ; 392 {
1282                     .text:	section	.text,new
1283  0000               _TIM4_ClearITPendingBit:
1287                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1289                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1291  0000 43            	cpl	a
1292  0001 c75344        	ld	21316,a
1293                     ; 398 }
1296  0004 81            	ret	
1309                     	xdef	_TIM4_ClearITPendingBit
1310                     	xdef	_TIM4_GetITStatus
1311                     	xdef	_TIM4_ClearFlag
1312                     	xdef	_TIM4_GetFlagStatus
1313                     	xdef	_TIM4_GetPrescaler
1314                     	xdef	_TIM4_GetCounter
1315                     	xdef	_TIM4_SetAutoreload
1316                     	xdef	_TIM4_SetCounter
1317                     	xdef	_TIM4_GenerateEvent
1318                     	xdef	_TIM4_ARRPreloadConfig
1319                     	xdef	_TIM4_PrescalerConfig
1320                     	xdef	_TIM4_SelectOnePulseMode
1321                     	xdef	_TIM4_UpdateRequestConfig
1322                     	xdef	_TIM4_UpdateDisableConfig
1323                     	xdef	_TIM4_ITConfig
1324                     	xdef	_TIM4_Cmd
1325                     	xdef	_TIM4_TimeBaseInit
1326                     	xdef	_TIM4_DeInit
1345                     	end
