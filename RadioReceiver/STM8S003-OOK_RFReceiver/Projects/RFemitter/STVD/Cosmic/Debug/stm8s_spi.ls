   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 44 void SPI_DeInit(void)
  50                     ; 45 {
  52                     .text:	section	.text,new
  53  0000               _SPI_DeInit:
  57                     ; 46     SPI->CR1    = SPI_CR1_RESET_VALUE;
  59  0000 725f5200      	clr	20992
  60                     ; 47     SPI->CR2    = SPI_CR2_RESET_VALUE;
  62  0004 725f5201      	clr	20993
  63                     ; 48     SPI->ICR    = SPI_ICR_RESET_VALUE;
  65  0008 725f5202      	clr	20994
  66                     ; 49     SPI->SR     = SPI_SR_RESET_VALUE;
  68  000c 35025203      	mov	20995,#2
  69                     ; 50     SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  71  0010 35075205      	mov	20997,#7
  72                     ; 51 }
  75  0014 81            	ret	
 391                     ; 72 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 391                     ; 73 {
 392                     .text:	section	.text,new
 393  0000               _SPI_Init:
 395  0000 89            	pushw	x
 396  0001 88            	push	a
 397       00000001      OFST:	set	1
 400                     ; 75     assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 402                     ; 76     assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 404                     ; 77     assert_param(IS_SPI_MODE_OK(Mode));
 406                     ; 78     assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 408                     ; 79     assert_param(IS_SPI_PHASE_OK(ClockPhase));
 410                     ; 80     assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 412                     ; 81     assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 414                     ; 82     assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 416                     ; 85     SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 416                     ; 86                     (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 418  0002 7b07          	ld	a,(OFST+6,sp)
 419  0004 1a08          	or	a,(OFST+7,sp)
 420  0006 6b01          	ld	(OFST+0,sp),a
 421  0008 9f            	ld	a,xl
 422  0009 1a02          	or	a,(OFST+1,sp)
 423  000b 1a01          	or	a,(OFST+0,sp)
 424  000d c75200        	ld	20992,a
 425                     ; 89     SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 427  0010 7b09          	ld	a,(OFST+8,sp)
 428  0012 1a0a          	or	a,(OFST+9,sp)
 429  0014 c75201        	ld	20993,a
 430                     ; 91     if (Mode == SPI_MODE_MASTER)
 432  0017 7b06          	ld	a,(OFST+5,sp)
 433  0019 a104          	cp	a,#4
 434  001b 2606          	jrne	L302
 435                     ; 93         SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 437  001d 72105201      	bset	20993,#0
 439  0021 2004          	jra	L502
 440  0023               L302:
 441                     ; 97         SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 443  0023 72115201      	bres	20993,#0
 444  0027               L502:
 445                     ; 101     SPI->CR1 |= (uint8_t)(Mode);
 447  0027 c65200        	ld	a,20992
 448  002a 1a06          	or	a,(OFST+5,sp)
 449  002c c75200        	ld	20992,a
 450                     ; 104     SPI->CRCPR = (uint8_t)CRCPolynomial;
 452  002f 7b0b          	ld	a,(OFST+10,sp)
 453  0031 c75205        	ld	20997,a
 454                     ; 105 }
 457  0034 5b03          	addw	sp,#3
 458  0036 81            	ret	
 513                     ; 113 void SPI_Cmd(FunctionalState NewState)
 513                     ; 114 {
 514                     .text:	section	.text,new
 515  0000               _SPI_Cmd:
 519                     ; 116     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 521                     ; 118     if (NewState != DISABLE)
 523  0000 4d            	tnz	a
 524  0001 2705          	jreq	L532
 525                     ; 120         SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 527  0003 721c5200      	bset	20992,#6
 530  0007 81            	ret	
 531  0008               L532:
 532                     ; 124         SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 534  0008 721d5200      	bres	20992,#6
 535                     ; 126 }
 538  000c 81            	ret	
 647                     ; 135 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 647                     ; 136 {
 648                     .text:	section	.text,new
 649  0000               _SPI_ITConfig:
 651  0000 89            	pushw	x
 652  0001 88            	push	a
 653       00000001      OFST:	set	1
 656                     ; 137     uint8_t itpos = 0;
 658                     ; 139     assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 660                     ; 140     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 662                     ; 143     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 664  0002 9e            	ld	a,xh
 665  0003 a40f          	and	a,#15
 666  0005 5f            	clrw	x
 667  0006 97            	ld	xl,a
 668  0007 a601          	ld	a,#1
 669  0009 5d            	tnzw	x
 670  000a 2704          	jreq	L41
 671  000c               L61:
 672  000c 48            	sll	a
 673  000d 5a            	decw	x
 674  000e 26fc          	jrne	L61
 675  0010               L41:
 676  0010 6b01          	ld	(OFST+0,sp),a
 677                     ; 145     if (NewState != DISABLE)
 679  0012 0d03          	tnz	(OFST+2,sp)
 680  0014 2707          	jreq	L113
 681                     ; 147         SPI->ICR |= itpos; /* Enable interrupt*/
 683  0016 c65202        	ld	a,20994
 684  0019 1a01          	or	a,(OFST+0,sp)
 686  001b 2004          	jra	L313
 687  001d               L113:
 688                     ; 151         SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 690  001d 43            	cpl	a
 691  001e c45202        	and	a,20994
 692  0021               L313:
 693  0021 c75202        	ld	20994,a
 694                     ; 153 }
 697  0024 5b03          	addw	sp,#3
 698  0026 81            	ret	
 732                     ; 159 void SPI_SendData(uint8_t Data)
 732                     ; 160 {
 733                     .text:	section	.text,new
 734  0000               _SPI_SendData:
 738                     ; 161     SPI->DR = Data; /* Write in the DR register the data to be sent*/
 740  0000 c75204        	ld	20996,a
 741                     ; 162 }
 744  0003 81            	ret	
 767                     ; 169 uint8_t SPI_ReceiveData(void)
 767                     ; 170 {
 768                     .text:	section	.text,new
 769  0000               _SPI_ReceiveData:
 773                     ; 171     return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 775  0000 c65204        	ld	a,20996
 778  0003 81            	ret	
 814                     ; 180 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 814                     ; 181 {
 815                     .text:	section	.text,new
 816  0000               _SPI_NSSInternalSoftwareCmd:
 820                     ; 183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 822                     ; 185     if (NewState != DISABLE)
 824  0000 4d            	tnz	a
 825  0001 2705          	jreq	L163
 826                     ; 187         SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 828  0003 72105201      	bset	20993,#0
 831  0007 81            	ret	
 832  0008               L163:
 833                     ; 191         SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 835  0008 72115201      	bres	20993,#0
 836                     ; 193 }
 839  000c 81            	ret	
 862                     ; 200 void SPI_TransmitCRC(void)
 862                     ; 201 {
 863                     .text:	section	.text,new
 864  0000               _SPI_TransmitCRC:
 868                     ; 202     SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 870  0000 72185201      	bset	20993,#4
 871                     ; 203 }
 874  0004 81            	ret	
 910                     ; 211 void SPI_CalculateCRCCmd(FunctionalState NewState)
 910                     ; 212 {
 911                     .text:	section	.text,new
 912  0000               _SPI_CalculateCRCCmd:
 916                     ; 214     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 918                     ; 216     if (NewState != DISABLE)
 920  0000 4d            	tnz	a
 921  0001 2705          	jreq	L314
 922                     ; 218         SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 924  0003 721a5201      	bset	20993,#5
 927  0007 81            	ret	
 928  0008               L314:
 929                     ; 222         SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 931  0008 721b5201      	bres	20993,#5
 932                     ; 224 }
 935  000c 81            	ret	
 999                     ; 231 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 999                     ; 232 {
1000                     .text:	section	.text,new
1001  0000               _SPI_GetCRC:
1003  0000 88            	push	a
1004       00000001      OFST:	set	1
1007                     ; 233     uint8_t crcreg = 0;
1009                     ; 236     assert_param(IS_SPI_CRC_OK(SPI_CRC));
1011                     ; 238     if (SPI_CRC != SPI_CRC_RX)
1013  0001 4d            	tnz	a
1014  0002 2705          	jreq	L154
1015                     ; 240         crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1017  0004 c65207        	ld	a,20999
1019  0007 2003          	jra	L354
1020  0009               L154:
1021                     ; 244         crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1023  0009 c65206        	ld	a,20998
1024  000c               L354:
1025                     ; 248     return crcreg;
1029  000c 5b01          	addw	sp,#1
1030  000e 81            	ret	
1055                     ; 256 void SPI_ResetCRC(void)
1055                     ; 257 {
1056                     .text:	section	.text,new
1057  0000               _SPI_ResetCRC:
1061                     ; 260     SPI_CalculateCRCCmd(ENABLE);
1063  0000 a601          	ld	a,#1
1064  0002 cd0000        	call	_SPI_CalculateCRCCmd
1066                     ; 263     SPI_Cmd(ENABLE);
1068  0005 a601          	ld	a,#1
1070                     ; 264 }
1073  0007 cc0000        	jp	_SPI_Cmd
1097                     ; 271 uint8_t SPI_GetCRCPolynomial(void)
1097                     ; 272 {
1098                     .text:	section	.text,new
1099  0000               _SPI_GetCRCPolynomial:
1103                     ; 273     return SPI->CRCPR; /* Return the CRC polynomial register */
1105  0000 c65205        	ld	a,20997
1108  0003 81            	ret	
1164                     ; 281 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1164                     ; 282 {
1165                     .text:	section	.text,new
1166  0000               _SPI_BiDirectionalLineConfig:
1170                     ; 284     assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1172                     ; 286     if (SPI_Direction != SPI_DIRECTION_RX)
1174  0000 4d            	tnz	a
1175  0001 2705          	jreq	L325
1176                     ; 288         SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1178  0003 721c5201      	bset	20993,#6
1181  0007 81            	ret	
1182  0008               L325:
1183                     ; 292         SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1185  0008 721d5201      	bres	20993,#6
1186                     ; 294 }
1189  000c 81            	ret	
1310                     ; 304 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1310                     ; 305 {
1311                     .text:	section	.text,new
1312  0000               _SPI_GetFlagStatus:
1314  0000 88            	push	a
1315       00000001      OFST:	set	1
1318                     ; 306     FlagStatus status = RESET;
1320                     ; 308     assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1322                     ; 311     if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1324  0001 c45203        	and	a,20995
1325  0004 2702          	jreq	L306
1326                     ; 313         status = SET; /* SPI_FLAG is set */
1328  0006 a601          	ld	a,#1
1330  0008               L306:
1331                     ; 317         status = RESET; /* SPI_FLAG is reset*/
1333                     ; 321     return status;
1337  0008 5b01          	addw	sp,#1
1338  000a 81            	ret	
1373                     ; 339 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1373                     ; 340 {
1374                     .text:	section	.text,new
1375  0000               _SPI_ClearFlag:
1379                     ; 341     assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1381                     ; 343     SPI->SR = (uint8_t)(~SPI_FLAG);
1383  0000 43            	cpl	a
1384  0001 c75203        	ld	20995,a
1385                     ; 344 }
1388  0004 81            	ret	
1470                     ; 359 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1470                     ; 360 {
1471                     .text:	section	.text,new
1472  0000               _SPI_GetITStatus:
1474  0000 88            	push	a
1475  0001 89            	pushw	x
1476       00000002      OFST:	set	2
1479                     ; 361     ITStatus pendingbitstatus = RESET;
1481                     ; 362     uint8_t itpos = 0;
1483                     ; 363     uint8_t itmask1 = 0;
1485                     ; 364     uint8_t itmask2 = 0;
1487                     ; 365     uint8_t enablestatus = 0;
1489                     ; 366     assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1491                     ; 368     itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1493  0002 a40f          	and	a,#15
1494  0004 5f            	clrw	x
1495  0005 97            	ld	xl,a
1496  0006 a601          	ld	a,#1
1497  0008 5d            	tnzw	x
1498  0009 2704          	jreq	L45
1499  000b               L65:
1500  000b 48            	sll	a
1501  000c 5a            	decw	x
1502  000d 26fc          	jrne	L65
1503  000f               L45:
1504  000f 6b01          	ld	(OFST-1,sp),a
1505                     ; 371     itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1507  0011 7b03          	ld	a,(OFST+1,sp)
1508  0013 4e            	swap	a
1509  0014 a40f          	and	a,#15
1510  0016 6b02          	ld	(OFST+0,sp),a
1511                     ; 373     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1513  0018 5f            	clrw	x
1514  0019 97            	ld	xl,a
1515  001a a601          	ld	a,#1
1516  001c 5d            	tnzw	x
1517  001d 2704          	jreq	L06
1518  001f               L26:
1519  001f 48            	sll	a
1520  0020 5a            	decw	x
1521  0021 26fc          	jrne	L26
1522  0023               L06:
1523                     ; 375     enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1525  0023 c45203        	and	a,20995
1526  0026 6b02          	ld	(OFST+0,sp),a
1527                     ; 377     if (((SPI->ICR & itpos) != RESET) && enablestatus)
1529  0028 c65202        	ld	a,20994
1530  002b 1501          	bcp	a,(OFST-1,sp)
1531  002d 2708          	jreq	L766
1533  002f 7b02          	ld	a,(OFST+0,sp)
1534  0031 2704          	jreq	L766
1535                     ; 380         pendingbitstatus = SET;
1537  0033 a601          	ld	a,#1
1539  0035 2001          	jra	L176
1540  0037               L766:
1541                     ; 385         pendingbitstatus = RESET;
1543  0037 4f            	clr	a
1544  0038               L176:
1545                     ; 388     return  pendingbitstatus;
1549  0038 5b03          	addw	sp,#3
1550  003a 81            	ret	
1595                     ; 404 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1595                     ; 405 {
1596                     .text:	section	.text,new
1597  0000               _SPI_ClearITPendingBit:
1599  0000 88            	push	a
1600       00000001      OFST:	set	1
1603                     ; 406     uint8_t itpos = 0;
1605                     ; 407     assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1607                     ; 412     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1609  0001 4e            	swap	a
1610  0002 a40f          	and	a,#15
1611  0004 5f            	clrw	x
1612  0005 97            	ld	xl,a
1613  0006 a601          	ld	a,#1
1614  0008 5d            	tnzw	x
1615  0009 2704          	jreq	L66
1616  000b               L07:
1617  000b 48            	sll	a
1618  000c 5a            	decw	x
1619  000d 26fc          	jrne	L07
1620  000f               L66:
1621                     ; 414     SPI->SR = (uint8_t)(~itpos);
1623  000f 43            	cpl	a
1624  0010 c75203        	ld	20995,a
1625                     ; 416 }
1628  0013 84            	pop	a
1629  0014 81            	ret	
1642                     	xdef	_SPI_ClearITPendingBit
1643                     	xdef	_SPI_GetITStatus
1644                     	xdef	_SPI_ClearFlag
1645                     	xdef	_SPI_GetFlagStatus
1646                     	xdef	_SPI_BiDirectionalLineConfig
1647                     	xdef	_SPI_GetCRCPolynomial
1648                     	xdef	_SPI_ResetCRC
1649                     	xdef	_SPI_GetCRC
1650                     	xdef	_SPI_CalculateCRCCmd
1651                     	xdef	_SPI_TransmitCRC
1652                     	xdef	_SPI_NSSInternalSoftwareCmd
1653                     	xdef	_SPI_ReceiveData
1654                     	xdef	_SPI_SendData
1655                     	xdef	_SPI_ITConfig
1656                     	xdef	_SPI_Cmd
1657                     	xdef	_SPI_Init
1658                     	xdef	_SPI_DeInit
1677                     	end
