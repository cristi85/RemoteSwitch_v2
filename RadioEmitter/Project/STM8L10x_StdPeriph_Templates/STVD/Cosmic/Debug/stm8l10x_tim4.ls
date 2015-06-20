   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  49                     ; 56 void TIM4_DeInit(void)
  49                     ; 57 {
  51                     .text:	section	.text,new
  52  0000               _TIM4_DeInit:
  56                     ; 58   TIM4->CR1  = TIM4_CR1_RESET_VALUE;
  58  0000 725f52e0      	clr	21216
  59                     ; 59   TIM4->CR2  = TIM4_CR2_RESET_VALUE;
  61  0004 725f52e1      	clr	21217
  62                     ; 60   TIM4->SMCR  = TIM4_SMCR_RESET_VALUE;
  64  0008 725f52e2      	clr	21218
  65                     ; 61   TIM4->IER  = TIM4_IER_RESET_VALUE;
  67  000c 725f52e3      	clr	21219
  68                     ; 62   TIM4->CNTR  = TIM4_CNTR_RESET_VALUE;
  70  0010 725f52e6      	clr	21222
  71                     ; 63   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  73  0014 725f52e7      	clr	21223
  74                     ; 64   TIM4->ARR  = TIM4_ARR_RESET_VALUE;
  76  0018 35ff52e8      	mov	21224,#255
  77                     ; 65   TIM4->SR1  = TIM4_SR1_RESET_VALUE;
  79  001c 725f52e4      	clr	21220
  80                     ; 66 }
  83  0020 81            	ret	
 251                     ; 91 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 251                     ; 92                        uint8_t TIM4_Period)
 251                     ; 93 {
 252                     .text:	section	.text,new
 253  0000               _TIM4_TimeBaseInit:
 257                     ; 95   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
 259                     ; 97   TIM4->ARR = (uint8_t)(TIM4_Period);
 261  0000 9f            	ld	a,xl
 262  0001 c752e8        	ld	21224,a
 263                     ; 99   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 265  0004 9e            	ld	a,xh
 266  0005 c752e7        	ld	21223,a
 267                     ; 100 }
 270  0008 81            	ret	
 325                     ; 108 void TIM4_Cmd(FunctionalState NewState)
 325                     ; 109 {
 326                     .text:	section	.text,new
 327  0000               _TIM4_Cmd:
 331                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 333                     ; 114   if (NewState != DISABLE)
 335  0000 4d            	tnz	a
 336  0001 2705          	jreq	L531
 337                     ; 116     TIM4->CR1 |= TIM4_CR1_CEN ;
 339  0003 721052e0      	bset	21216,#0
 342  0007 81            	ret	
 343  0008               L531:
 344                     ; 120     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 346  0008 721152e0      	bres	21216,#0
 347                     ; 122 }
 350  000c 81            	ret	
 415                     ; 134 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 415                     ; 135 {
 416                     .text:	section	.text,new
 417  0000               _TIM4_ITConfig:
 419  0000 89            	pushw	x
 420       00000000      OFST:	set	0
 423                     ; 137   assert_param(IS_TIM4_IT(TIM4_IT));
 425                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 427                     ; 140   if (NewState != DISABLE)
 429  0001 9f            	ld	a,xl
 430  0002 4d            	tnz	a
 431  0003 2706          	jreq	L371
 432                     ; 143     TIM4->IER |= (uint8_t)TIM4_IT;
 434  0005 9e            	ld	a,xh
 435  0006 ca52e3        	or	a,21219
 437  0009 2006          	jra	L571
 438  000b               L371:
 439                     ; 148     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 441  000b 7b01          	ld	a,(OFST+1,sp)
 442  000d 43            	cpl	a
 443  000e c452e3        	and	a,21219
 444  0011               L571:
 445  0011 c752e3        	ld	21219,a
 446                     ; 150 }
 449  0014 85            	popw	x
 450  0015 81            	ret	
 474                     ; 157 void TIM4_InternalClockConfig(void)
 474                     ; 158 {
 475                     .text:	section	.text,new
 476  0000               _TIM4_InternalClockConfig:
 480                     ; 160   TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_SMS);
 482  0000 c652e2        	ld	a,21218
 483  0003 a4f8          	and	a,#248
 484  0005 c752e2        	ld	21218,a
 485                     ; 161 }
 488  0008 81            	ret	
 556                     ; 171 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
 556                     ; 172 {
 557                     .text:	section	.text,new
 558  0000               _TIM4_SelectInputTrigger:
 560  0000 88            	push	a
 561  0001 88            	push	a
 562       00000001      OFST:	set	1
 565                     ; 173   uint8_t tmpsmcr = 0;
 567                     ; 176   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
 569                     ; 178   tmpsmcr = TIM4->SMCR;
 571  0002 c652e2        	ld	a,21218
 572                     ; 181   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
 574  0005 a48f          	and	a,#143
 575                     ; 182   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
 577  0007 1a02          	or	a,(OFST+1,sp)
 578                     ; 184   TIM4->SMCR = (uint8_t)tmpsmcr;
 580  0009 c752e2        	ld	21218,a
 581                     ; 185 }
 584  000c 85            	popw	x
 585  000d 81            	ret	
 621                     ; 193 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 621                     ; 194 {
 622                     .text:	section	.text,new
 623  0000               _TIM4_UpdateDisableConfig:
 627                     ; 196   assert_param(IS_FUNCTIONAL_STATE(NewState));
 629                     ; 199   if (NewState != DISABLE)
 631  0000 4d            	tnz	a
 632  0001 2705          	jreq	L752
 633                     ; 201     TIM4->CR1 |= TIM4_CR1_UDIS ;
 635  0003 721252e0      	bset	21216,#1
 638  0007 81            	ret	
 639  0008               L752:
 640                     ; 205     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 642  0008 721352e0      	bres	21216,#1
 643                     ; 207 }
 646  000c 81            	ret	
 704                     ; 217 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 704                     ; 218 {
 705                     .text:	section	.text,new
 706  0000               _TIM4_UpdateRequestConfig:
 710                     ; 220   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 712                     ; 223   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 714  0000 4a            	dec	a
 715  0001 2605          	jrne	L113
 716                     ; 225     TIM4->CR1 |= TIM4_CR1_URS ;
 718  0003 721452e0      	bset	21216,#2
 721  0007 81            	ret	
 722  0008               L113:
 723                     ; 229     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 725  0008 721552e0      	bres	21216,#2
 726                     ; 231 }
 729  000c 81            	ret	
 786                     ; 241 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 786                     ; 242 {
 787                     .text:	section	.text,new
 788  0000               _TIM4_SelectOnePulseMode:
 792                     ; 244   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 794                     ; 247   if (TIM4_OPMode == TIM4_OPMode_Single)
 796  0000 4a            	dec	a
 797  0001 2605          	jrne	L343
 798                     ; 249     TIM4->CR1 |= TIM4_CR1_OPM ;
 800  0003 721652e0      	bset	21216,#3
 803  0007 81            	ret	
 804  0008               L343:
 805                     ; 253     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 807  0008 721752e0      	bres	21216,#3
 808                     ; 256 }
 811  000c 81            	ret	
 886                     ; 267 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
 886                     ; 268 {
 887                     .text:	section	.text,new
 888  0000               _TIM4_SelectOutputTrigger:
 890  0000 88            	push	a
 891  0001 88            	push	a
 892       00000001      OFST:	set	1
 895                     ; 269   uint8_t tmpcr2 = 0;
 897                     ; 272   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
 899                     ; 274   tmpcr2 = TIM4->CR2;
 901  0002 c652e1        	ld	a,21217
 902                     ; 277   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
 904  0005 a48f          	and	a,#143
 905                     ; 280   tmpcr2 |= (uint8_t)TIM4_TRGOSource;
 907  0007 1a02          	or	a,(OFST+1,sp)
 908                     ; 282   TIM4->CR2 = tmpcr2;
 910  0009 c752e1        	ld	21217,a
 911                     ; 283 }
 914  000c 85            	popw	x
 915  000d 81            	ret	
1006                     ; 297 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1006                     ; 298 {
1007                     .text:	section	.text,new
1008  0000               _TIM4_SelectSlaveMode:
1010  0000 88            	push	a
1011  0001 88            	push	a
1012       00000001      OFST:	set	1
1015                     ; 299   uint8_t tmpsmcr = 0;
1017                     ; 302   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1019                     ; 304   tmpsmcr = TIM4->SMCR;
1021  0002 c652e2        	ld	a,21218
1022                     ; 307   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1024  0005 a4f8          	and	a,#248
1025                     ; 310   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1027  0007 1a02          	or	a,(OFST+1,sp)
1028                     ; 312   TIM4->SMCR = tmpsmcr;
1030  0009 c752e2        	ld	21218,a
1031                     ; 313 }
1034  000c 85            	popw	x
1035  000d 81            	ret	
1071                     ; 321 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1071                     ; 322 {
1072                     .text:	section	.text,new
1073  0000               _TIM4_SelectMasterSlaveMode:
1077                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1079                     ; 327   if (NewState != DISABLE)
1081  0000 4d            	tnz	a
1082  0001 2705          	jreq	L164
1083                     ; 329     TIM4->SMCR |= TIM4_SMCR_MSM;
1085  0003 721e52e2      	bset	21218,#7
1088  0007 81            	ret	
1089  0008               L164:
1090                     ; 333     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1092  0008 721f52e2      	bres	21218,#7
1093                     ; 335 }
1096  000c 81            	ret	
1164                     ; 363 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef TIM4_Prescaler,
1164                     ; 364                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
1164                     ; 365 {
1165                     .text:	section	.text,new
1166  0000               _TIM4_PrescalerConfig:
1170                     ; 367   assert_param(IS_TIM4_PRESCALER_RELOAD(TIM4_PSCReloadMode));
1172                     ; 368   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
1174                     ; 371   TIM4->PSCR = (uint8_t)TIM4_Prescaler;
1176  0000 9e            	ld	a,xh
1177  0001 c752e7        	ld	21223,a
1178                     ; 374   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
1180  0004 9f            	ld	a,xl
1181  0005 4a            	dec	a
1182  0006 2605          	jrne	L715
1183                     ; 376     TIM4->EGR |= TIM4_EGR_UG ;
1185  0008 721052e5      	bset	21221,#0
1188  000c 81            	ret	
1189  000d               L715:
1190                     ; 380     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
1192  000d 721152e5      	bres	21221,#0
1193                     ; 382 }
1196  0011 81            	ret	
1232                     ; 390 void TIM4_ARRPreloadConfig(FunctionalState NewState)
1232                     ; 391 {
1233                     .text:	section	.text,new
1234  0000               _TIM4_ARRPreloadConfig:
1238                     ; 393   assert_param(IS_FUNCTIONAL_STATE(NewState));
1240                     ; 396   if (NewState != DISABLE)
1242  0000 4d            	tnz	a
1243  0001 2705          	jreq	L145
1244                     ; 398     TIM4->CR1 |= TIM4_CR1_ARPE ;
1246  0003 721e52e0      	bset	21216,#7
1249  0007 81            	ret	
1250  0008               L145:
1251                     ; 402     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
1253  0008 721f52e0      	bres	21216,#7
1254                     ; 404 }
1257  000c 81            	ret	
1314                     ; 414 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1314                     ; 415 {
1315                     .text:	section	.text,new
1316  0000               _TIM4_GenerateEvent:
1320                     ; 417   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1322                     ; 420   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1324  0000 ca52e5        	or	a,21221
1325  0003 c752e5        	ld	21221,a
1326                     ; 421 }
1329  0006 81            	ret	
1363                     ; 429 void TIM4_SetCounter(uint8_t TIM4_Counter)
1363                     ; 430 {
1364                     .text:	section	.text,new
1365  0000               _TIM4_SetCounter:
1369                     ; 432   TIM4->CNTR = (uint8_t)(TIM4_Counter);
1371  0000 c752e6        	ld	21222,a
1372                     ; 433 }
1375  0003 81            	ret	
1409                     ; 441 void TIM4_SetAutoreload(uint8_t TIM4_Autoreload)
1409                     ; 442 {
1410                     .text:	section	.text,new
1411  0000               _TIM4_SetAutoreload:
1415                     ; 445   TIM4->ARR = (uint8_t)(TIM4_Autoreload);
1417  0000 c752e8        	ld	21224,a
1418                     ; 446 }
1421  0003 81            	ret	
1455                     ; 453 uint8_t TIM4_GetCounter(void)
1455                     ; 454 {
1456                     .text:	section	.text,new
1457  0000               _TIM4_GetCounter:
1459  0000 88            	push	a
1460       00000001      OFST:	set	1
1463                     ; 455   uint8_t tmpcntr = 0;
1465                     ; 456   tmpcntr = TIM4->CNTR;
1467  0001 c652e6        	ld	a,21222
1468                     ; 458   return ((uint8_t)tmpcntr);
1472  0004 5b01          	addw	sp,#1
1473  0006 81            	ret	
1497                     ; 482 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1497                     ; 483 {
1498                     .text:	section	.text,new
1499  0000               _TIM4_GetPrescaler:
1503                     ; 485   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
1505  0000 c652e7        	ld	a,21223
1508  0003 81            	ret	
1532                     ; 493 FunctionalState TIM4_GetStatus(void)
1532                     ; 494 {
1533                     .text:	section	.text,new
1534  0000               _TIM4_GetStatus:
1538                     ; 495   return ((FunctionalState)(TIM4->CR1 & TIM4_CR1_CEN));
1540  0000 c652e0        	ld	a,21216
1541  0003 a401          	and	a,#1
1544  0005 81            	ret	
1630                     ; 507 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1630                     ; 508 {
1631                     .text:	section	.text,new
1632  0000               _TIM4_GetFlagStatus:
1634  0000 88            	push	a
1635       00000001      OFST:	set	1
1638                     ; 509   __IO FlagStatus bitstatus = RESET;
1640  0001 0f01          	clr	(OFST+0,sp)
1641                     ; 512   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1643                     ; 514   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1645  0003 c452e4        	and	a,21220
1646  0006 2702          	jreq	L727
1647                     ; 516     bitstatus = SET;
1649  0008 a601          	ld	a,#1
1651  000a               L727:
1652                     ; 520     bitstatus = RESET;
1654  000a 6b01          	ld	(OFST+0,sp),a
1655                     ; 522   return ((FlagStatus)bitstatus);
1657  000c 7b01          	ld	a,(OFST+0,sp)
1660  000e 5b01          	addw	sp,#1
1661  0010 81            	ret	
1696                     ; 533 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1696                     ; 534 {
1697                     .text:	section	.text,new
1698  0000               _TIM4_ClearFlag:
1702                     ; 536   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1704                     ; 538   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1706  0000 43            	cpl	a
1707  0001 c752e4        	ld	21220,a
1708                     ; 539 }
1711  0004 81            	ret	
1775                     ; 550 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1775                     ; 551 {
1776                     .text:	section	.text,new
1777  0000               _TIM4_GetITStatus:
1779  0000 88            	push	a
1780  0001 5203          	subw	sp,#3
1781       00000003      OFST:	set	3
1784                     ; 552   __IO ITStatus bitstatus = RESET;
1786  0003 0f03          	clr	(OFST+0,sp)
1787                     ; 554   __IO uint8_t itStatus = 0x0, itEnable = 0x0;
1789  0005 0f01          	clr	(OFST-2,sp)
1792  0007 0f02          	clr	(OFST-1,sp)
1793                     ; 557   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1795                     ; 559   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1797  0009 c452e4        	and	a,21220
1798  000c 6b01          	ld	(OFST-2,sp),a
1799                     ; 561   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1801  000e c652e3        	ld	a,21219
1802  0011 1404          	and	a,(OFST+1,sp)
1803  0013 6b02          	ld	(OFST-1,sp),a
1804                     ; 563   if ((itStatus != (uint8_t)RESET) && (itEnable != (uint8_t)RESET))
1806  0015 0d01          	tnz	(OFST-2,sp)
1807  0017 270a          	jreq	L3001
1809  0019 0d02          	tnz	(OFST-1,sp)
1810  001b 2706          	jreq	L3001
1811                     ; 565     bitstatus = (ITStatus)SET;
1813  001d a601          	ld	a,#1
1814  001f 6b03          	ld	(OFST+0,sp),a
1816  0021 2002          	jra	L5001
1817  0023               L3001:
1818                     ; 569     bitstatus = (ITStatus)RESET;
1820  0023 0f03          	clr	(OFST+0,sp)
1821  0025               L5001:
1822                     ; 571   return ((ITStatus)bitstatus);
1824  0025 7b03          	ld	a,(OFST+0,sp)
1827  0027 5b04          	addw	sp,#4
1828  0029 81            	ret	
1864                     ; 582 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1864                     ; 583 {
1865                     .text:	section	.text,new
1866  0000               _TIM4_ClearITPendingBit:
1870                     ; 585   assert_param(IS_TIM4_IT(TIM4_IT));
1872                     ; 588   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1874  0000 43            	cpl	a
1875  0001 c752e4        	ld	21220,a
1876                     ; 589 }
1879  0004 81            	ret	
1892                     	xdef	_TIM4_ClearITPendingBit
1893                     	xdef	_TIM4_GetITStatus
1894                     	xdef	_TIM4_ClearFlag
1895                     	xdef	_TIM4_GetFlagStatus
1896                     	xdef	_TIM4_GetStatus
1897                     	xdef	_TIM4_GetPrescaler
1898                     	xdef	_TIM4_GetCounter
1899                     	xdef	_TIM4_SetAutoreload
1900                     	xdef	_TIM4_SetCounter
1901                     	xdef	_TIM4_GenerateEvent
1902                     	xdef	_TIM4_ARRPreloadConfig
1903                     	xdef	_TIM4_PrescalerConfig
1904                     	xdef	_TIM4_SelectMasterSlaveMode
1905                     	xdef	_TIM4_SelectSlaveMode
1906                     	xdef	_TIM4_SelectOutputTrigger
1907                     	xdef	_TIM4_SelectOnePulseMode
1908                     	xdef	_TIM4_UpdateRequestConfig
1909                     	xdef	_TIM4_UpdateDisableConfig
1910                     	xdef	_TIM4_SelectInputTrigger
1911                     	xdef	_TIM4_InternalClockConfig
1912                     	xdef	_TIM4_ITConfig
1913                     	xdef	_TIM4_Cmd
1914                     	xdef	_TIM4_TimeBaseInit
1915                     	xdef	_TIM4_DeInit
1934                     	end
