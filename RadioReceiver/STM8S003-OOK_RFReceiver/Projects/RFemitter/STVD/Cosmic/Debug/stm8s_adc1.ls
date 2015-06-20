   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 48 void ADC1_DeInit(void)
  50                     ; 49 {
  52                     .text:	section	.text,new
  53  0000               _ADC1_DeInit:
  57                     ; 50     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  59  0000 725f5400      	clr	21504
  60                     ; 51     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  62  0004 725f5401      	clr	21505
  63                     ; 52     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  65  0008 725f5402      	clr	21506
  66                     ; 53     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  68  000c 725f5403      	clr	21507
  69                     ; 54     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  71  0010 725f5406      	clr	21510
  72                     ; 55     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  74  0014 725f5407      	clr	21511
  75                     ; 56     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  77  0018 35ff5408      	mov	21512,#255
  78                     ; 57     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  80  001c 35035409      	mov	21513,#3
  81                     ; 58     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  83  0020 725f540a      	clr	21514
  84                     ; 59     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  86  0024 725f540b      	clr	21515
  87                     ; 60     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  89  0028 725f540e      	clr	21518
  90                     ; 61     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  92  002c 725f540f      	clr	21519
  93                     ; 62 }
  96  0030 81            	ret	
 547                     ; 85 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 547                     ; 86 {
 548                     .text:	section	.text,new
 549  0000               _ADC1_Init:
 551  0000 89            	pushw	x
 552       00000000      OFST:	set	0
 555                     ; 89     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 557                     ; 90     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 559                     ; 91     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 561                     ; 92     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 563                     ; 93     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 565                     ; 94     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 567                     ; 95     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 569                     ; 96     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 571                     ; 101     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 573  0001 7b08          	ld	a,(OFST+8,sp)
 574  0003 88            	push	a
 575  0004 7b02          	ld	a,(OFST+2,sp)
 576  0006 95            	ld	xh,a
 577  0007 cd0000        	call	_ADC1_ConversionConfig
 579  000a 84            	pop	a
 580                     ; 103     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 582  000b 7b05          	ld	a,(OFST+5,sp)
 583  000d cd0000        	call	_ADC1_PrescalerConfig
 585                     ; 108     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 587  0010 7b07          	ld	a,(OFST+7,sp)
 588  0012 97            	ld	xl,a
 589  0013 7b06          	ld	a,(OFST+6,sp)
 590  0015 95            	ld	xh,a
 591  0016 cd0000        	call	_ADC1_ExternalTriggerConfig
 593                     ; 113     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 595  0019 7b0a          	ld	a,(OFST+10,sp)
 596  001b 97            	ld	xl,a
 597  001c 7b09          	ld	a,(OFST+9,sp)
 598  001e 95            	ld	xh,a
 599  001f cd0000        	call	_ADC1_SchmittTriggerConfig
 601                     ; 116     ADC1->CR1 |= ADC1_CR1_ADON;
 603  0022 72105401      	bset	21505,#0
 604                     ; 118 }
 607  0026 85            	popw	x
 608  0027 81            	ret	
 643                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 643                     ; 127 {
 644                     .text:	section	.text,new
 645  0000               _ADC1_Cmd:
 649                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 651                     ; 132     if (NewState != DISABLE)
 653  0000 4d            	tnz	a
 654  0001 2705          	jreq	L362
 655                     ; 134         ADC1->CR1 |= ADC1_CR1_ADON;
 657  0003 72105401      	bset	21505,#0
 660  0007 81            	ret	
 661  0008               L362:
 662                     ; 138         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 664  0008 72115401      	bres	21505,#0
 665                     ; 141 }
 668  000c 81            	ret	
 703                     ; 148 void ADC1_ScanModeCmd(FunctionalState NewState)
 703                     ; 149 {
 704                     .text:	section	.text,new
 705  0000               _ADC1_ScanModeCmd:
 709                     ; 152     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 711                     ; 154     if (NewState != DISABLE)
 713  0000 4d            	tnz	a
 714  0001 2705          	jreq	L503
 715                     ; 156         ADC1->CR2 |= ADC1_CR2_SCAN;
 717  0003 72125402      	bset	21506,#1
 720  0007 81            	ret	
 721  0008               L503:
 722                     ; 160         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 724  0008 72135402      	bres	21506,#1
 725                     ; 163 }
 728  000c 81            	ret	
 763                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
 763                     ; 171 {
 764                     .text:	section	.text,new
 765  0000               _ADC1_DataBufferCmd:
 769                     ; 174     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 771                     ; 176     if (NewState != DISABLE)
 773  0000 4d            	tnz	a
 774  0001 2705          	jreq	L723
 775                     ; 178         ADC1->CR3 |= ADC1_CR3_DBUF;
 777  0003 721e5403      	bset	21507,#7
 780  0007 81            	ret	
 781  0008               L723:
 782                     ; 182         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 784  0008 721f5403      	bres	21507,#7
 785                     ; 185 }
 788  000c 81            	ret	
 944                     ; 196 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 944                     ; 197 {
 945                     .text:	section	.text,new
 946  0000               _ADC1_ITConfig:
 948  0000 89            	pushw	x
 949       00000000      OFST:	set	0
 952                     ; 200     assert_param(IS_ADC1_IT_OK(ADC1_IT));
 954                     ; 201     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 956                     ; 203     if (NewState != DISABLE)
 958  0001 7b05          	ld	a,(OFST+5,sp)
 959  0003 2706          	jreq	L714
 960                     ; 206         ADC1->CSR |= (uint8_t)ADC1_IT;
 962  0005 9f            	ld	a,xl
 963  0006 ca5400        	or	a,21504
 965  0009 2006          	jra	L124
 966  000b               L714:
 967                     ; 211         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 969  000b 7b02          	ld	a,(OFST+2,sp)
 970  000d 43            	cpl	a
 971  000e c45400        	and	a,21504
 972  0011               L124:
 973  0011 c75400        	ld	21504,a
 974                     ; 214 }
 977  0014 85            	popw	x
 978  0015 81            	ret	
1014                     ; 222 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1014                     ; 223 {
1015                     .text:	section	.text,new
1016  0000               _ADC1_PrescalerConfig:
1018  0000 88            	push	a
1019       00000000      OFST:	set	0
1022                     ; 226     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1024                     ; 229     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1026  0001 c65401        	ld	a,21505
1027  0004 a48f          	and	a,#143
1028  0006 c75401        	ld	21505,a
1029                     ; 231     ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1031  0009 c65401        	ld	a,21505
1032  000c 1a01          	or	a,(OFST+1,sp)
1033  000e c75401        	ld	21505,a
1034                     ; 233 }
1037  0011 84            	pop	a
1038  0012 81            	ret	
1085                     ; 244 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1085                     ; 245 {
1086                     .text:	section	.text,new
1087  0000               _ADC1_SchmittTriggerConfig:
1089  0000 89            	pushw	x
1090       00000000      OFST:	set	0
1093                     ; 248     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1095                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1097                     ; 251     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1099  0001 9e            	ld	a,xh
1100  0002 4c            	inc	a
1101  0003 261d          	jrne	L364
1102                     ; 253         if (NewState != DISABLE)
1104  0005 9f            	ld	a,xl
1105  0006 4d            	tnz	a
1106  0007 270a          	jreq	L564
1107                     ; 255             ADC1->TDRL &= (uint8_t)0x0;
1109  0009 725f5407      	clr	21511
1110                     ; 256             ADC1->TDRH &= (uint8_t)0x0;
1112  000d 725f5406      	clr	21510
1114  0011 2059          	jra	L174
1115  0013               L564:
1116                     ; 260             ADC1->TDRL |= (uint8_t)0xFF;
1118  0013 c65407        	ld	a,21511
1119  0016 aaff          	or	a,#255
1120  0018 c75407        	ld	21511,a
1121                     ; 261             ADC1->TDRH |= (uint8_t)0xFF;
1123  001b c65406        	ld	a,21510
1124  001e aaff          	or	a,#255
1125  0020 2047          	jp	LC001
1126  0022               L364:
1127                     ; 264     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1129  0022 7b01          	ld	a,(OFST+1,sp)
1130  0024 a108          	cp	a,#8
1131  0026 0d02          	tnz	(OFST+2,sp)
1132  0028 2420          	jruge	L374
1133                     ; 266         if (NewState != DISABLE)
1135  002a 2711          	jreq	L574
1136                     ; 268             ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1138  002c ad40          	call	LC003
1139  002e 2704          	jreq	L43
1140  0030               L63:
1141  0030 48            	sll	a
1142  0031 5a            	decw	x
1143  0032 26fc          	jrne	L63
1144  0034               L43:
1145  0034 43            	cpl	a
1146  0035 c45407        	and	a,21511
1147  0038               LC002:
1148  0038 c75407        	ld	21511,a
1150  003b 202f          	jra	L174
1151  003d               L574:
1152                     ; 272             ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1154  003d ad2f          	call	LC003
1155  003f 2704          	jreq	L04
1156  0041               L24:
1157  0041 48            	sll	a
1158  0042 5a            	decw	x
1159  0043 26fc          	jrne	L24
1160  0045               L04:
1161  0045 ca5407        	or	a,21511
1162  0048 20ee          	jp	LC002
1163  004a               L374:
1164                     ; 277         if (NewState != DISABLE)
1166  004a 2710          	jreq	L305
1167                     ; 279             ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1169  004c a008          	sub	a,#8
1170  004e ad1e          	call	LC003
1171  0050 2704          	jreq	L44
1172  0052               L64:
1173  0052 48            	sll	a
1174  0053 5a            	decw	x
1175  0054 26fc          	jrne	L64
1176  0056               L44:
1177  0056 43            	cpl	a
1178  0057 c45406        	and	a,21510
1180  005a 200d          	jp	LC001
1181  005c               L305:
1182                     ; 283             ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1184  005c a008          	sub	a,#8
1185  005e ad0e          	call	LC003
1186  0060 2704          	jreq	L05
1187  0062               L25:
1188  0062 48            	sll	a
1189  0063 5a            	decw	x
1190  0064 26fc          	jrne	L25
1191  0066               L05:
1192  0066 ca5406        	or	a,21510
1193  0069               LC001:
1194  0069 c75406        	ld	21510,a
1195  006c               L174:
1196                     ; 287 }
1199  006c 85            	popw	x
1200  006d 81            	ret	
1201  006e               LC003:
1202  006e 5f            	clrw	x
1203  006f 97            	ld	xl,a
1204  0070 a601          	ld	a,#1
1205  0072 5d            	tnzw	x
1206  0073 81            	ret	
1263                     ; 300 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1263                     ; 301 {
1264                     .text:	section	.text,new
1265  0000               _ADC1_ConversionConfig:
1267  0000 89            	pushw	x
1268       00000000      OFST:	set	0
1271                     ; 304     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1273                     ; 305     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1275                     ; 306     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1277                     ; 309     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1279  0001 72175402      	bres	21506,#3
1280                     ; 311     ADC1->CR2 |= (uint8_t)(ADC1_Align);
1282  0005 c65402        	ld	a,21506
1283  0008 1a05          	or	a,(OFST+5,sp)
1284  000a c75402        	ld	21506,a
1285                     ; 313     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1287  000d 9e            	ld	a,xh
1288  000e 4a            	dec	a
1289  000f 2606          	jrne	L535
1290                     ; 316         ADC1->CR1 |= ADC1_CR1_CONT;
1292  0011 72125401      	bset	21505,#1
1294  0015 2004          	jra	L735
1295  0017               L535:
1296                     ; 321         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1298  0017 72135401      	bres	21505,#1
1299  001b               L735:
1300                     ; 325     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1302  001b c65400        	ld	a,21504
1303  001e a4f0          	and	a,#240
1304  0020 c75400        	ld	21504,a
1305                     ; 327     ADC1->CSR |= (uint8_t)(ADC1_Channel);
1307  0023 c65400        	ld	a,21504
1308  0026 1a02          	or	a,(OFST+2,sp)
1309  0028 c75400        	ld	21504,a
1310                     ; 329 }
1313  002b 85            	popw	x
1314  002c 81            	ret	
1360                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1360                     ; 343 {
1361                     .text:	section	.text,new
1362  0000               _ADC1_ExternalTriggerConfig:
1364  0000 89            	pushw	x
1365       00000000      OFST:	set	0
1368                     ; 346     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1370                     ; 347     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1372                     ; 350     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1374  0001 c65402        	ld	a,21506
1375  0004 a4cf          	and	a,#207
1376  0006 c75402        	ld	21506,a
1377                     ; 352     if (NewState != DISABLE)
1379  0009 9f            	ld	a,xl
1380  000a 4d            	tnz	a
1381  000b 2706          	jreq	L365
1382                     ; 355         ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1384  000d 721c5402      	bset	21506,#6
1386  0011 2004          	jra	L565
1387  0013               L365:
1388                     ; 360         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1390  0013 721d5402      	bres	21506,#6
1391  0017               L565:
1392                     ; 364     ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1394  0017 c65402        	ld	a,21506
1395  001a 1a01          	or	a,(OFST+1,sp)
1396  001c c75402        	ld	21506,a
1397                     ; 366 }
1400  001f 85            	popw	x
1401  0020 81            	ret	
1425                     ; 378 void ADC1_StartConversion(void)
1425                     ; 379 {
1426                     .text:	section	.text,new
1427  0000               _ADC1_StartConversion:
1431                     ; 380     ADC1->CR1 |= ADC1_CR1_ADON;
1433  0000 72105401      	bset	21505,#0
1434                     ; 381 }
1437  0004 81            	ret	
1481                     ; 390 uint16_t ADC1_GetConversionValue(void)
1481                     ; 391 {
1482                     .text:	section	.text,new
1483  0000               _ADC1_GetConversionValue:
1485  0000 5205          	subw	sp,#5
1486       00000005      OFST:	set	5
1489                     ; 393     uint16_t temph = 0;
1491                     ; 394     uint8_t templ = 0;
1493                     ; 396     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1495  0002 720754020e    	btjf	21506,#3,L126
1496                     ; 399         templ = ADC1->DRL;
1498  0007 c65405        	ld	a,21509
1499  000a 6b03          	ld	(OFST-2,sp),a
1500                     ; 401         temph = ADC1->DRH;
1502  000c c65404        	ld	a,21508
1503  000f 97            	ld	xl,a
1504                     ; 403         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1506  0010 7b03          	ld	a,(OFST-2,sp)
1507  0012 02            	rlwa	x,a
1509  0013 201a          	jra	L326
1510  0015               L126:
1511                     ; 408         temph = ADC1->DRH;
1513  0015 c65404        	ld	a,21508
1514  0018 97            	ld	xl,a
1515                     ; 410         templ = ADC1->DRL;
1517  0019 c65405        	ld	a,21509
1518  001c 6b03          	ld	(OFST-2,sp),a
1519                     ; 412         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1521  001e 4f            	clr	a
1522  001f 02            	rlwa	x,a
1523  0020 1f01          	ldw	(OFST-4,sp),x
1524  0022 7b03          	ld	a,(OFST-2,sp)
1525  0024 97            	ld	xl,a
1526  0025 a640          	ld	a,#64
1527  0027 42            	mul	x,a
1528  0028 01            	rrwa	x,a
1529  0029 1a02          	or	a,(OFST-3,sp)
1530  002b 01            	rrwa	x,a
1531  002c 1a01          	or	a,(OFST-4,sp)
1532  002e 01            	rrwa	x,a
1533  002f               L326:
1534                     ; 415     return ((uint16_t)temph);
1538  002f 5b05          	addw	sp,#5
1539  0031 81            	ret	
1585                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1585                     ; 428 {
1586                     .text:	section	.text,new
1587  0000               _ADC1_AWDChannelConfig:
1589  0000 89            	pushw	x
1590       00000000      OFST:	set	0
1593                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1595                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1597                     ; 433     if (Channel < (uint8_t)8)
1599  0001 9e            	ld	a,xh
1600  0002 a108          	cp	a,#8
1601  0004 2425          	jruge	L746
1602                     ; 435         if (NewState != DISABLE)
1604  0006 9f            	ld	a,xl
1605  0007 4d            	tnz	a
1606  0008 270e          	jreq	L156
1607                     ; 437             ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1609  000a 9e            	ld	a,xh
1610  000b ad48          	call	LC006
1611  000d 2704          	jreq	L66
1612  000f               L07:
1613  000f 48            	sll	a
1614  0010 5a            	decw	x
1615  0011 26fc          	jrne	L07
1616  0013               L66:
1617  0013 ca540f        	or	a,21519
1619  0016 200e          	jp	LC005
1620  0018               L156:
1621                     ; 441             ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1623  0018 7b01          	ld	a,(OFST+1,sp)
1624  001a ad39          	call	LC006
1625  001c 2704          	jreq	L27
1626  001e               L47:
1627  001e 48            	sll	a
1628  001f 5a            	decw	x
1629  0020 26fc          	jrne	L47
1630  0022               L27:
1631  0022 43            	cpl	a
1632  0023 c4540f        	and	a,21519
1633  0026               LC005:
1634  0026 c7540f        	ld	21519,a
1635  0029 2028          	jra	L556
1636  002b               L746:
1637                     ; 446         if (NewState != DISABLE)
1639  002b 7b02          	ld	a,(OFST+2,sp)
1640  002d 2711          	jreq	L756
1641                     ; 448             ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1643  002f 7b01          	ld	a,(OFST+1,sp)
1644  0031 a008          	sub	a,#8
1645  0033 ad20          	call	LC006
1646  0035 2704          	jreq	L67
1647  0037               L001:
1648  0037 48            	sll	a
1649  0038 5a            	decw	x
1650  0039 26fc          	jrne	L001
1651  003b               L67:
1652  003b ca540e        	or	a,21518
1654  003e 2010          	jp	LC004
1655  0040               L756:
1656                     ; 452             ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1658  0040 7b01          	ld	a,(OFST+1,sp)
1659  0042 a008          	sub	a,#8
1660  0044 ad0f          	call	LC006
1661  0046 2704          	jreq	L201
1662  0048               L401:
1663  0048 48            	sll	a
1664  0049 5a            	decw	x
1665  004a 26fc          	jrne	L401
1666  004c               L201:
1667  004c 43            	cpl	a
1668  004d c4540e        	and	a,21518
1669  0050               LC004:
1670  0050 c7540e        	ld	21518,a
1671  0053               L556:
1672                     ; 455 }
1675  0053 85            	popw	x
1676  0054 81            	ret	
1677  0055               LC006:
1678  0055 5f            	clrw	x
1679  0056 97            	ld	xl,a
1680  0057 a601          	ld	a,#1
1681  0059 5d            	tnzw	x
1682  005a 81            	ret	
1717                     ; 463 void ADC1_SetHighThreshold(uint16_t Threshold)
1717                     ; 464 {
1718                     .text:	section	.text,new
1719  0000               _ADC1_SetHighThreshold:
1721  0000 89            	pushw	x
1722       00000000      OFST:	set	0
1725                     ; 465     ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1727  0001 54            	srlw	x
1728  0002 54            	srlw	x
1729  0003 9f            	ld	a,xl
1730  0004 c75408        	ld	21512,a
1731                     ; 466     ADC1->HTRL = (uint8_t)Threshold;
1733  0007 7b02          	ld	a,(OFST+2,sp)
1734  0009 c75409        	ld	21513,a
1735                     ; 467 }
1738  000c 85            	popw	x
1739  000d 81            	ret	
1774                     ; 475 void ADC1_SetLowThreshold(uint16_t Threshold)
1774                     ; 476 {
1775                     .text:	section	.text,new
1776  0000               _ADC1_SetLowThreshold:
1780                     ; 477     ADC1->LTRL = (uint8_t)Threshold;
1782  0000 9f            	ld	a,xl
1783  0001 c7540b        	ld	21515,a
1784                     ; 478     ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1786  0004 54            	srlw	x
1787  0005 54            	srlw	x
1788  0006 9f            	ld	a,xl
1789  0007 c7540a        	ld	21514,a
1790                     ; 479 }
1793  000a 81            	ret	
1846                     ; 488 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1846                     ; 489 {
1847                     .text:	section	.text,new
1848  0000               _ADC1_GetBufferValue:
1850  0000 88            	push	a
1851  0001 5205          	subw	sp,#5
1852       00000005      OFST:	set	5
1855                     ; 491     uint16_t temph = 0;
1857                     ; 492     uint8_t templ = 0;
1859                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
1861                     ; 497     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1863  0003 7b06          	ld	a,(OFST+1,sp)
1864  0005 48            	sll	a
1865  0006 5f            	clrw	x
1866  0007 97            	ld	xl,a
1867  0008 7207540213    	btjf	21506,#3,L547
1868                     ; 500         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1870  000d d653e1        	ld	a,(21473,x)
1871  0010 6b03          	ld	(OFST-2,sp),a
1872                     ; 502         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1874  0012 7b06          	ld	a,(OFST+1,sp)
1875  0014 48            	sll	a
1876  0015 5f            	clrw	x
1877  0016 97            	ld	xl,a
1878  0017 d653e0        	ld	a,(21472,x)
1879  001a 97            	ld	xl,a
1880                     ; 504         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1882  001b 7b03          	ld	a,(OFST-2,sp)
1883  001d 02            	rlwa	x,a
1885  001e 2024          	jra	L747
1886  0020               L547:
1887                     ; 509         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1889  0020 d653e0        	ld	a,(21472,x)
1890  0023 5f            	clrw	x
1891  0024 97            	ld	xl,a
1892  0025 1f04          	ldw	(OFST-1,sp),x
1893                     ; 511         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1895  0027 7b06          	ld	a,(OFST+1,sp)
1896  0029 48            	sll	a
1897  002a 5f            	clrw	x
1898  002b 97            	ld	xl,a
1899  002c d653e1        	ld	a,(21473,x)
1900  002f 6b03          	ld	(OFST-2,sp),a
1901                     ; 513         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1903  0031 4f            	clr	a
1904  0032 1e04          	ldw	x,(OFST-1,sp)
1905  0034 02            	rlwa	x,a
1906  0035 1f01          	ldw	(OFST-4,sp),x
1907  0037 7b03          	ld	a,(OFST-2,sp)
1908  0039 97            	ld	xl,a
1909  003a a640          	ld	a,#64
1910  003c 42            	mul	x,a
1911  003d 01            	rrwa	x,a
1912  003e 1a02          	or	a,(OFST-3,sp)
1913  0040 01            	rrwa	x,a
1914  0041 1a01          	or	a,(OFST-4,sp)
1915  0043 01            	rrwa	x,a
1916  0044               L747:
1917                     ; 516     return ((uint16_t)temph);
1921  0044 5b06          	addw	sp,#6
1922  0046 81            	ret	
1988                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
1988                     ; 527 {
1989                     .text:	section	.text,new
1990  0000               _ADC1_GetAWDChannelStatus:
1992  0000 88            	push	a
1993  0001 88            	push	a
1994       00000001      OFST:	set	1
1997                     ; 528     uint8_t status = 0;
1999                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
2001                     ; 533     if (Channel < (uint8_t)8)
2003  0002 a108          	cp	a,#8
2004  0004 2410          	jruge	L3001
2005                     ; 535         status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2007  0006 5f            	clrw	x
2008  0007 97            	ld	xl,a
2009  0008 a601          	ld	a,#1
2010  000a 5d            	tnzw	x
2011  000b 2704          	jreq	L611
2012  000d               L021:
2013  000d 48            	sll	a
2014  000e 5a            	decw	x
2015  000f 26fc          	jrne	L021
2016  0011               L611:
2017  0011 c4540d        	and	a,21517
2019  0014 2012          	jra	L5001
2020  0016               L3001:
2021                     ; 539         status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2023  0016 7b02          	ld	a,(OFST+1,sp)
2024  0018 a008          	sub	a,#8
2025  001a 5f            	clrw	x
2026  001b 97            	ld	xl,a
2027  001c a601          	ld	a,#1
2028  001e 5d            	tnzw	x
2029  001f 2704          	jreq	L221
2030  0021               L421:
2031  0021 48            	sll	a
2032  0022 5a            	decw	x
2033  0023 26fc          	jrne	L421
2034  0025               L221:
2035  0025 c4540c        	and	a,21516
2036  0028               L5001:
2037                     ; 542     return ((FlagStatus)status);
2041  0028 85            	popw	x
2042  0029 81            	ret	
2200                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2200                     ; 552 {
2201                     .text:	section	.text,new
2202  0000               _ADC1_GetFlagStatus:
2204  0000 88            	push	a
2205  0001 88            	push	a
2206       00000001      OFST:	set	1
2209                     ; 553     uint8_t flagstatus = 0;
2211                     ; 554     uint8_t temp = 0;
2213                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2215                     ; 559     if ((Flag & 0x0F) == 0x01)
2217  0002 a40f          	and	a,#15
2218  0004 4a            	dec	a
2219  0005 2607          	jrne	L5701
2220                     ; 562         flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2222  0007 c65403        	ld	a,21507
2223  000a a440          	and	a,#64
2225  000c 2039          	jra	L7701
2226  000e               L5701:
2227                     ; 564     else if ((Flag & 0xF0) == 0x10)
2229  000e 7b02          	ld	a,(OFST+1,sp)
2230  0010 a4f0          	and	a,#240
2231  0012 a110          	cp	a,#16
2232  0014 262c          	jrne	L1011
2233                     ; 567         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2235  0016 7b02          	ld	a,(OFST+1,sp)
2236  0018 a40f          	and	a,#15
2237  001a 6b01          	ld	(OFST+0,sp),a
2238                     ; 568         if (temp < 8)
2240  001c a108          	cp	a,#8
2241  001e 2410          	jruge	L3011
2242                     ; 570             flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2244  0020 5f            	clrw	x
2245  0021 97            	ld	xl,a
2246  0022 a601          	ld	a,#1
2247  0024 5d            	tnzw	x
2248  0025 2704          	jreq	L031
2249  0027               L231:
2250  0027 48            	sll	a
2251  0028 5a            	decw	x
2252  0029 26fc          	jrne	L231
2253  002b               L031:
2254  002b c4540d        	and	a,21517
2256  002e 2017          	jra	L7701
2257  0030               L3011:
2258                     ; 574             flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2260  0030 a008          	sub	a,#8
2261  0032 5f            	clrw	x
2262  0033 97            	ld	xl,a
2263  0034 a601          	ld	a,#1
2264  0036 5d            	tnzw	x
2265  0037 2704          	jreq	L431
2266  0039               L631:
2267  0039 48            	sll	a
2268  003a 5a            	decw	x
2269  003b 26fc          	jrne	L631
2270  003d               L431:
2271  003d c4540c        	and	a,21516
2272  0040 2005          	jra	L7701
2273  0042               L1011:
2274                     ; 579         flagstatus = (uint8_t)(ADC1->CSR & Flag);
2276  0042 c65400        	ld	a,21504
2277  0045 1402          	and	a,(OFST+1,sp)
2278  0047               L7701:
2279                     ; 581     return ((FlagStatus)flagstatus);
2283  0047 85            	popw	x
2284  0048 81            	ret	
2328                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2328                     ; 592 {
2329                     .text:	section	.text,new
2330  0000               _ADC1_ClearFlag:
2332  0000 88            	push	a
2333  0001 88            	push	a
2334       00000001      OFST:	set	1
2337                     ; 593     uint8_t temp = 0;
2339                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
2341                     ; 598     if ((Flag & 0x0F) == 0x01)
2343  0002 a40f          	and	a,#15
2344  0004 4a            	dec	a
2345  0005 2606          	jrne	L3311
2346                     ; 601         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2348  0007 721d5403      	bres	21507,#6
2350  000b 2045          	jra	L5311
2351  000d               L3311:
2352                     ; 603     else if ((Flag & 0xF0) == 0x10)
2354  000d 7b02          	ld	a,(OFST+1,sp)
2355  000f a4f0          	and	a,#240
2356  0011 a110          	cp	a,#16
2357  0013 2634          	jrne	L7311
2358                     ; 606         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2360  0015 7b02          	ld	a,(OFST+1,sp)
2361  0017 a40f          	and	a,#15
2362  0019 6b01          	ld	(OFST+0,sp),a
2363                     ; 607         if (temp < 8)
2365  001b a108          	cp	a,#8
2366  001d 2414          	jruge	L1411
2367                     ; 609             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2369  001f 5f            	clrw	x
2370  0020 97            	ld	xl,a
2371  0021 a601          	ld	a,#1
2372  0023 5d            	tnzw	x
2373  0024 2704          	jreq	L241
2374  0026               L441:
2375  0026 48            	sll	a
2376  0027 5a            	decw	x
2377  0028 26fc          	jrne	L441
2378  002a               L241:
2379  002a 43            	cpl	a
2380  002b c4540d        	and	a,21517
2381  002e c7540d        	ld	21517,a
2383  0031 201f          	jra	L5311
2384  0033               L1411:
2385                     ; 613             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2387  0033 a008          	sub	a,#8
2388  0035 5f            	clrw	x
2389  0036 97            	ld	xl,a
2390  0037 a601          	ld	a,#1
2391  0039 5d            	tnzw	x
2392  003a 2704          	jreq	L641
2393  003c               L051:
2394  003c 48            	sll	a
2395  003d 5a            	decw	x
2396  003e 26fc          	jrne	L051
2397  0040               L641:
2398  0040 43            	cpl	a
2399  0041 c4540c        	and	a,21516
2400  0044 c7540c        	ld	21516,a
2401  0047 2009          	jra	L5311
2402  0049               L7311:
2403                     ; 618         ADC1->CSR &= (uint8_t) (~Flag);
2405  0049 7b02          	ld	a,(OFST+1,sp)
2406  004b 43            	cpl	a
2407  004c c45400        	and	a,21504
2408  004f c75400        	ld	21504,a
2409  0052               L5311:
2410                     ; 620 }
2413  0052 85            	popw	x
2414  0053 81            	ret	
2469                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2469                     ; 641 {
2470                     .text:	section	.text,new
2471  0000               _ADC1_GetITStatus:
2473  0000 89            	pushw	x
2474  0001 88            	push	a
2475       00000001      OFST:	set	1
2478                     ; 642     ITStatus itstatus = RESET;
2480                     ; 643     uint8_t temp = 0;
2482                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2484                     ; 648     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2486  0002 01            	rrwa	x,a
2487  0003 a4f0          	and	a,#240
2488  0005 5f            	clrw	x
2489  0006 02            	rlwa	x,a
2490  0007 a30010        	cpw	x,#16
2491  000a 262c          	jrne	L5711
2492                     ; 651         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2494  000c 7b03          	ld	a,(OFST+2,sp)
2495  000e a40f          	and	a,#15
2496  0010 6b01          	ld	(OFST+0,sp),a
2497                     ; 652         if (temp < 8)
2499  0012 a108          	cp	a,#8
2500  0014 2410          	jruge	L7711
2501                     ; 654             itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2503  0016 5f            	clrw	x
2504  0017 97            	ld	xl,a
2505  0018 a601          	ld	a,#1
2506  001a 5d            	tnzw	x
2507  001b 2704          	jreq	L451
2508  001d               L651:
2509  001d 48            	sll	a
2510  001e 5a            	decw	x
2511  001f 26fc          	jrne	L651
2512  0021               L451:
2513  0021 c4540d        	and	a,21517
2515  0024 2017          	jra	L3021
2516  0026               L7711:
2517                     ; 658             itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2519  0026 a008          	sub	a,#8
2520  0028 5f            	clrw	x
2521  0029 97            	ld	xl,a
2522  002a a601          	ld	a,#1
2523  002c 5d            	tnzw	x
2524  002d 2704          	jreq	L061
2525  002f               L261:
2526  002f 48            	sll	a
2527  0030 5a            	decw	x
2528  0031 26fc          	jrne	L261
2529  0033               L061:
2530  0033 c4540c        	and	a,21516
2531  0036 2005          	jra	L3021
2532  0038               L5711:
2533                     ; 663         itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2535  0038 c65400        	ld	a,21504
2536  003b 1403          	and	a,(OFST+2,sp)
2537  003d               L3021:
2538                     ; 665     return ((ITStatus)itstatus);
2542  003d 5b03          	addw	sp,#3
2543  003f 81            	ret	
2588                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2588                     ; 688 {
2589                     .text:	section	.text,new
2590  0000               _ADC1_ClearITPendingBit:
2592  0000 89            	pushw	x
2593  0001 88            	push	a
2594       00000001      OFST:	set	1
2597                     ; 689     uint8_t temp = 0;
2599                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2601                     ; 694     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2603  0002 01            	rrwa	x,a
2604  0003 a4f0          	and	a,#240
2605  0005 5f            	clrw	x
2606  0006 02            	rlwa	x,a
2607  0007 a30010        	cpw	x,#16
2608  000a 2634          	jrne	L7221
2609                     ; 697         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2611  000c 7b03          	ld	a,(OFST+2,sp)
2612  000e a40f          	and	a,#15
2613  0010 6b01          	ld	(OFST+0,sp),a
2614                     ; 698         if (temp < 8)
2616  0012 a108          	cp	a,#8
2617  0014 2414          	jruge	L1321
2618                     ; 700             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2620  0016 5f            	clrw	x
2621  0017 97            	ld	xl,a
2622  0018 a601          	ld	a,#1
2623  001a 5d            	tnzw	x
2624  001b 2704          	jreq	L661
2625  001d               L071:
2626  001d 48            	sll	a
2627  001e 5a            	decw	x
2628  001f 26fc          	jrne	L071
2629  0021               L661:
2630  0021 43            	cpl	a
2631  0022 c4540d        	and	a,21517
2632  0025 c7540d        	ld	21517,a
2634  0028 201f          	jra	L5321
2635  002a               L1321:
2636                     ; 704             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2638  002a a008          	sub	a,#8
2639  002c 5f            	clrw	x
2640  002d 97            	ld	xl,a
2641  002e a601          	ld	a,#1
2642  0030 5d            	tnzw	x
2643  0031 2704          	jreq	L271
2644  0033               L471:
2645  0033 48            	sll	a
2646  0034 5a            	decw	x
2647  0035 26fc          	jrne	L471
2648  0037               L271:
2649  0037 43            	cpl	a
2650  0038 c4540c        	and	a,21516
2651  003b c7540c        	ld	21516,a
2652  003e 2009          	jra	L5321
2653  0040               L7221:
2654                     ; 709         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2656  0040 7b03          	ld	a,(OFST+2,sp)
2657  0042 43            	cpl	a
2658  0043 c45400        	and	a,21504
2659  0046 c75400        	ld	21504,a
2660  0049               L5321:
2661                     ; 711 }
2664  0049 5b03          	addw	sp,#3
2665  004b 81            	ret	
2678                     	xdef	_ADC1_ClearITPendingBit
2679                     	xdef	_ADC1_GetITStatus
2680                     	xdef	_ADC1_ClearFlag
2681                     	xdef	_ADC1_GetFlagStatus
2682                     	xdef	_ADC1_GetAWDChannelStatus
2683                     	xdef	_ADC1_GetBufferValue
2684                     	xdef	_ADC1_SetLowThreshold
2685                     	xdef	_ADC1_SetHighThreshold
2686                     	xdef	_ADC1_GetConversionValue
2687                     	xdef	_ADC1_StartConversion
2688                     	xdef	_ADC1_AWDChannelConfig
2689                     	xdef	_ADC1_ExternalTriggerConfig
2690                     	xdef	_ADC1_ConversionConfig
2691                     	xdef	_ADC1_SchmittTriggerConfig
2692                     	xdef	_ADC1_PrescalerConfig
2693                     	xdef	_ADC1_ITConfig
2694                     	xdef	_ADC1_DataBufferCmd
2695                     	xdef	_ADC1_ScanModeCmd
2696                     	xdef	_ADC1_Cmd
2697                     	xdef	_ADC1_Init
2698                     	xdef	_ADC1_DeInit
2717                     	end
