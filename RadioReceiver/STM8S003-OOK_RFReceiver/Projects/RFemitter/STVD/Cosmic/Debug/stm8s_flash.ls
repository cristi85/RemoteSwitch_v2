   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  82                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  82                     ; 82 {
  84                     .text:	section	.text,new
  85  0000               _FLASH_Unlock:
  89                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  91                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
  93  0000 a1fd          	cp	a,#253
  94  0002 2609          	jrne	L73
  95                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
  97  0004 35565062      	mov	20578,#86
  98                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
 100  0008 35ae5062      	mov	20578,#174
 103  000c 81            	ret	
 104  000d               L73:
 105                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 107  000d 35ae5064      	mov	20580,#174
 108                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 110  0011 35565064      	mov	20580,#86
 111                     ; 98 }
 114  0015 81            	ret	
 149                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 149                     ; 107 {
 150                     .text:	section	.text,new
 151  0000               _FLASH_Lock:
 155                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 157                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 159  0000 c4505f        	and	a,20575
 160  0003 c7505f        	ld	20575,a
 161                     ; 113 }
 164  0006 81            	ret	
 187                     ; 120 void FLASH_DeInit(void)
 187                     ; 121 {
 188                     .text:	section	.text,new
 189  0000               _FLASH_DeInit:
 193                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 195  0000 725f505a      	clr	20570
 196                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 198  0004 725f505b      	clr	20571
 199                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 201  0008 35ff505c      	mov	20572,#255
 202                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 204  000c 7217505f      	bres	20575,#3
 205                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 207  0010 7213505f      	bres	20575,#1
 208                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 210  0014 c6505f        	ld	a,20575
 211                     ; 128 }
 214  0017 81            	ret	
 269                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 269                     ; 137 {
 270                     .text:	section	.text,new
 271  0000               _FLASH_ITConfig:
 275                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 277                     ; 141     if (NewState != DISABLE)
 279  0000 4d            	tnz	a
 280  0001 2705          	jreq	L711
 281                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 283  0003 7212505a      	bset	20570,#1
 286  0007 81            	ret	
 287  0008               L711:
 288                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 290  0008 7213505a      	bres	20570,#1
 291                     ; 149 }
 294  000c 81            	ret	
 328                     ; 158 void FLASH_EraseByte(uint32_t Address)
 328                     ; 159 {
 329                     .text:	section	.text,new
 330  0000               _FLASH_EraseByte:
 332       00000000      OFST:	set	0
 335                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 337                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 339  0000 1e05          	ldw	x,(OFST+5,sp)
 340  0002 7f            	clr	(x)
 341                     ; 166 }
 344  0003 81            	ret	
 387                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 387                     ; 177 {
 388                     .text:	section	.text,new
 389  0000               _FLASH_ProgramByte:
 391       00000000      OFST:	set	0
 394                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 396                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 398  0000 1e05          	ldw	x,(OFST+5,sp)
 399  0002 7b07          	ld	a,(OFST+7,sp)
 400  0004 f7            	ld	(x),a
 401                     ; 181 }
 404  0005 81            	ret	
 438                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 438                     ; 191 {
 439                     .text:	section	.text,new
 440  0000               _FLASH_ReadByte:
 442       00000000      OFST:	set	0
 445                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 447                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 449  0000 1e05          	ldw	x,(OFST+5,sp)
 450  0002 f6            	ld	a,(x)
 453  0003 81            	ret	
 496                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 496                     ; 208 {
 497                     .text:	section	.text,new
 498  0000               _FLASH_ProgramWord:
 500       00000000      OFST:	set	0
 503                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 505                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 507  0000 721c505b      	bset	20571,#6
 508                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 510  0004 721d505c      	bres	20572,#6
 511                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 513  0008 1e05          	ldw	x,(OFST+5,sp)
 514  000a 7b07          	ld	a,(OFST+7,sp)
 515  000c f7            	ld	(x),a
 516                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 518  000d 7b08          	ld	a,(OFST+8,sp)
 519  000f e701          	ld	(1,x),a
 520                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 522  0011 7b09          	ld	a,(OFST+9,sp)
 523  0013 e702          	ld	(2,x),a
 524                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 526  0015 7b0a          	ld	a,(OFST+10,sp)
 527  0017 e703          	ld	(3,x),a
 528                     ; 224 }
 531  0019 81            	ret	
 576                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 576                     ; 233 {
 577                     .text:	section	.text,new
 578  0000               _FLASH_ProgramOptionByte:
 580  0000 89            	pushw	x
 581       00000000      OFST:	set	0
 584                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 586                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 588  0001 721e505b      	bset	20571,#7
 589                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 591  0005 721f505c      	bres	20572,#7
 592                     ; 242     if (Address == 0x4800)
 594  0009 a34800        	cpw	x,#18432
 595  000c 2607          	jrne	L542
 596                     ; 245        *((NEAR uint8_t*)Address) = Data;
 598  000e 1e01          	ldw	x,(OFST+1,sp)
 599  0010 7b05          	ld	a,(OFST+5,sp)
 600  0012 f7            	ld	(x),a
 602  0013 2008          	jra	L742
 603  0015               L542:
 604                     ; 250        *((NEAR uint8_t*)Address) = Data;
 606  0015 1e01          	ldw	x,(OFST+1,sp)
 607  0017 7b05          	ld	a,(OFST+5,sp)
 608  0019 f7            	ld	(x),a
 609                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 611  001a 43            	cpl	a
 612  001b e701          	ld	(1,x),a
 613  001d               L742:
 614                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 616  001d a6fd          	ld	a,#253
 617  001f cd0000        	call	_FLASH_WaitForLastOperation
 619                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 621  0022 721f505b      	bres	20571,#7
 622                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 624  0026 721e505c      	bset	20572,#7
 625                     ; 258 }
 628  002a 85            	popw	x
 629  002b 81            	ret	
 665                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 665                     ; 266 {
 666                     .text:	section	.text,new
 667  0000               _FLASH_EraseOptionByte:
 669  0000 89            	pushw	x
 670       00000000      OFST:	set	0
 673                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 675                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 677  0001 721e505b      	bset	20571,#7
 678                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 680  0005 721f505c      	bres	20572,#7
 681                     ; 275      if (Address == 0x4800)
 683  0009 a34800        	cpw	x,#18432
 684  000c 2603          	jrne	L762
 685                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 687  000e 7f            	clr	(x)
 689  000f 2007          	jra	L172
 690  0011               L762:
 691                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 693  0011 1e01          	ldw	x,(OFST+1,sp)
 694                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 696  0013 a6ff          	ld	a,#255
 697  0015 7f            	clr	(x)
 698  0016 e701          	ld	(1,x),a
 699  0018               L172:
 700                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 702  0018 a6fd          	ld	a,#253
 703  001a cd0000        	call	_FLASH_WaitForLastOperation
 705                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 707  001d 721f505b      	bres	20571,#7
 708                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 710  0021 721e505c      	bset	20572,#7
 711                     ; 291 }
 714  0025 85            	popw	x
 715  0026 81            	ret	
 778                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 778                     ; 298 {
 779                     .text:	section	.text,new
 780  0000               _FLASH_ReadOptionByte:
 782  0000 5204          	subw	sp,#4
 783       00000004      OFST:	set	4
 786                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
 788                     ; 300     uint16_t res_value = 0;
 790                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 792                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 794  0002 f6            	ld	a,(x)
 795  0003 6b02          	ld	(OFST-2,sp),a
 796                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 798  0005 e601          	ld	a,(1,x)
 799  0007 6b01          	ld	(OFST-3,sp),a
 800                     ; 310     if (Address == 0x4800)	 
 802  0009 a34800        	cpw	x,#18432
 803  000c 2606          	jrne	L523
 804                     ; 312         res_value =	 value_optbyte;
 806  000e 7b02          	ld	a,(OFST-2,sp)
 807  0010 5f            	clrw	x
 808  0011 97            	ld	xl,a
 810  0012 201c          	jra	L723
 811  0014               L523:
 812                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
 814  0014 43            	cpl	a
 815  0015 1102          	cp	a,(OFST-2,sp)
 816  0017 2614          	jrne	L133
 817                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 819  0019 7b02          	ld	a,(OFST-2,sp)
 820  001b 97            	ld	xl,a
 821  001c 4f            	clr	a
 822  001d 02            	rlwa	x,a
 823  001e 1f03          	ldw	(OFST-1,sp),x
 824                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
 826  0020 5f            	clrw	x
 827  0021 7b01          	ld	a,(OFST-3,sp)
 828  0023 97            	ld	xl,a
 829  0024 01            	rrwa	x,a
 830  0025 1a04          	or	a,(OFST+0,sp)
 831  0027 01            	rrwa	x,a
 832  0028 1a03          	or	a,(OFST-1,sp)
 833  002a 01            	rrwa	x,a
 835  002b 2003          	jra	L723
 836  002d               L133:
 837                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
 839  002d ae5555        	ldw	x,#21845
 840  0030               L723:
 841                     ; 326     return(res_value);
 845  0030 5b04          	addw	sp,#4
 846  0032 81            	ret	
 920                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 920                     ; 336 {
 921                     .text:	section	.text,new
 922  0000               _FLASH_SetLowPowerMode:
 924  0000 88            	push	a
 925       00000000      OFST:	set	0
 928                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 930                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 932  0001 c6505a        	ld	a,20570
 933  0004 a4f3          	and	a,#243
 934  0006 c7505a        	ld	20570,a
 935                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 937  0009 c6505a        	ld	a,20570
 938  000c 1a01          	or	a,(OFST+1,sp)
 939  000e c7505a        	ld	20570,a
 940                     ; 345 }
 943  0011 84            	pop	a
 944  0012 81            	ret	
1002                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1002                     ; 354 {
1003                     .text:	section	.text,new
1004  0000               _FLASH_SetProgrammingTime:
1008                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1010                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1012  0000 7211505a      	bres	20570,#0
1013                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1015  0004 ca505a        	or	a,20570
1016  0007 c7505a        	ld	20570,a
1017                     ; 360 }
1020  000a 81            	ret	
1045                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1045                     ; 368 {
1046                     .text:	section	.text,new
1047  0000               _FLASH_GetLowPowerMode:
1051                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1053  0000 c6505a        	ld	a,20570
1054  0003 a40c          	and	a,#12
1057  0005 81            	ret	
1082                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1082                     ; 378 {
1083                     .text:	section	.text,new
1084  0000               _FLASH_GetProgrammingTime:
1088                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1090  0000 c6505a        	ld	a,20570
1091  0003 a401          	and	a,#1
1094  0005 81            	ret	
1128                     ; 387 uint32_t FLASH_GetBootSize(void)
1128                     ; 388 {
1129                     .text:	section	.text,new
1130  0000               _FLASH_GetBootSize:
1132  0000 5204          	subw	sp,#4
1133       00000004      OFST:	set	4
1136                     ; 389     uint32_t temp = 0;
1138                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1140  0002 c6505d        	ld	a,20573
1141  0005 5f            	clrw	x
1142  0006 97            	ld	xl,a
1143  0007 90ae0200      	ldw	y,#512
1144  000b cd0000        	call	c_umul
1146  000e 96            	ldw	x,sp
1147  000f 5c            	incw	x
1148  0010 cd0000        	call	c_rtol
1150                     ; 395     if (FLASH->FPR == 0xFF)
1152  0013 c6505d        	ld	a,20573
1153  0016 4c            	inc	a
1154  0017 260d          	jrne	L354
1155                     ; 397         temp += 512;
1157  0019 ae0200        	ldw	x,#512
1158  001c bf02          	ldw	c_lreg+2,x
1159  001e 5f            	clrw	x
1160  001f bf00          	ldw	c_lreg,x
1161  0021 96            	ldw	x,sp
1162  0022 5c            	incw	x
1163  0023 cd0000        	call	c_lgadd
1165  0026               L354:
1166                     ; 401     return(temp);
1168  0026 96            	ldw	x,sp
1169  0027 5c            	incw	x
1170  0028 cd0000        	call	c_ltor
1174  002b 5b04          	addw	sp,#4
1175  002d 81            	ret	
1277                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1277                     ; 413 {
1278                     .text:	section	.text,new
1279  0000               _FLASH_GetFlagStatus:
1281  0000 88            	push	a
1282       00000001      OFST:	set	1
1285                     ; 414     FlagStatus status = RESET;
1287                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1289                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1291  0001 c4505f        	and	a,20575
1292  0004 2702          	jreq	L325
1293                     ; 421         status = SET; /* FLASH_FLAG is set */
1295  0006 a601          	ld	a,#1
1297  0008               L325:
1298                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1300                     ; 429     return status;
1304  0008 5b01          	addw	sp,#1
1305  000a 81            	ret	
1390                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1390                     ; 532 {
1391                     .text:	section	.text,new
1392  0000               _FLASH_WaitForLastOperation:
1394  0000 5205          	subw	sp,#5
1395       00000005      OFST:	set	5
1398                     ; 533     uint8_t flagstatus = 0x00;
1400  0002 0f05          	clr	(OFST+0,sp)
1401                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1403  0004 aeffff        	ldw	x,#65535
1404  0007 1f03          	ldw	(OFST-2,sp),x
1405  0009 ae000f        	ldw	x,#15
1406  000c 1f01          	ldw	(OFST-4,sp),x
1408  000e 200e          	jra	L375
1409  0010               L765:
1410                     ; 560         flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1412  0010 c6505f        	ld	a,20575
1413  0013 a405          	and	a,#5
1414  0015 6b05          	ld	(OFST+0,sp),a
1415                     ; 561         timeout--;
1417  0017 96            	ldw	x,sp
1418  0018 5c            	incw	x
1419  0019 a601          	ld	a,#1
1420  001b cd0000        	call	c_lgsbc
1422  001e               L375:
1423                     ; 558     while ((flagstatus == 0x00) && (timeout != 0x00))
1425  001e 7b05          	ld	a,(OFST+0,sp)
1426  0020 2607          	jrne	L775
1428  0022 96            	ldw	x,sp
1429  0023 5c            	incw	x
1430  0024 cd0000        	call	c_lzmp
1432  0027 26e7          	jrne	L765
1433  0029               L775:
1434                     ; 566     if (timeout == 0x00 )
1436  0029 96            	ldw	x,sp
1437  002a 5c            	incw	x
1438  002b cd0000        	call	c_lzmp
1440  002e 2604          	jrne	L106
1441                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1443  0030 a602          	ld	a,#2
1444  0032 6b05          	ld	(OFST+0,sp),a
1445  0034               L106:
1446                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1448  0034 7b05          	ld	a,(OFST+0,sp)
1451  0036 5b05          	addw	sp,#5
1452  0038 81            	ret	
1515                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1515                     ; 582 {
1516                     .text:	section	.text,new
1517  0000               _FLASH_EraseBlock:
1519  0000 89            	pushw	x
1520  0001 5206          	subw	sp,#6
1521       00000006      OFST:	set	6
1524                     ; 583   uint32_t startaddress = 0;
1526                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1528                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1530  0003 7b0b          	ld	a,(OFST+5,sp)
1531  0005 a1fd          	cp	a,#253
1532  0007 2605          	jrne	L536
1533                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1535                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1537  0009 ae8000        	ldw	x,#32768
1539  000c 2003          	jra	L736
1540  000e               L536:
1541                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1543                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1545  000e ae4000        	ldw	x,#16384
1546  0011               L736:
1547  0011 1f05          	ldw	(OFST-1,sp),x
1548  0013 5f            	clrw	x
1549  0014 1f03          	ldw	(OFST-3,sp),x
1550                     ; 610     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1552  0016 a640          	ld	a,#64
1553  0018 1e07          	ldw	x,(OFST+1,sp)
1554  001a cd0000        	call	c_cmulx
1556  001d 96            	ldw	x,sp
1557  001e 1c0003        	addw	x,#OFST-3
1558  0021 cd0000        	call	c_ladd
1560  0024 be02          	ldw	x,c_lreg+2
1561  0026 1f01          	ldw	(OFST-5,sp),x
1562                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
1564  0028 721a505b      	bset	20571,#5
1565                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1567  002c 721b505c      	bres	20572,#5
1568                     ; 619     *pwFlash = (uint32_t)0;
1570  0030 4f            	clr	a
1571  0031 e703          	ld	(3,x),a
1572  0033 e702          	ld	(2,x),a
1573  0035 e701          	ld	(1,x),a
1574  0037 f7            	ld	(x),a
1575                     ; 627 }
1578  0038 5b08          	addw	sp,#8
1579  003a 81            	ret	
1683                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1683                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1683                     ; 640 {
1684                     .text:	section	.text,new
1685  0000               _FLASH_ProgramBlock:
1687  0000 89            	pushw	x
1688  0001 5206          	subw	sp,#6
1689       00000006      OFST:	set	6
1692                     ; 641     uint16_t Count = 0;
1694                     ; 642     uint32_t startaddress = 0;
1696                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1698                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1700                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1702  0003 7b0b          	ld	a,(OFST+5,sp)
1703  0005 a1fd          	cp	a,#253
1704  0007 2605          	jrne	L317
1705                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1707                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1709  0009 ae8000        	ldw	x,#32768
1711  000c 2003          	jra	L517
1712  000e               L317:
1713                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1715                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1717  000e ae4000        	ldw	x,#16384
1718  0011               L517:
1719  0011 1f03          	ldw	(OFST-3,sp),x
1720  0013 5f            	clrw	x
1721  0014 1f01          	ldw	(OFST-5,sp),x
1722                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1724  0016 a640          	ld	a,#64
1725  0018 1e07          	ldw	x,(OFST+1,sp)
1726  001a cd0000        	call	c_cmulx
1728  001d 96            	ldw	x,sp
1729  001e 5c            	incw	x
1730  001f cd0000        	call	c_lgadd
1732                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1734  0022 7b0c          	ld	a,(OFST+6,sp)
1735  0024 260a          	jrne	L717
1736                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
1738  0026 7210505b      	bset	20571,#0
1739                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1741  002a 7211505c      	bres	20572,#0
1743  002e 2008          	jra	L127
1744  0030               L717:
1745                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
1747  0030 7218505b      	bset	20571,#4
1748                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1750  0034 7219505c      	bres	20572,#4
1751  0038               L127:
1752                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1754  0038 5f            	clrw	x
1755  0039 1f05          	ldw	(OFST-1,sp),x
1756  003b               L327:
1757                     ; 682   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1759  003b 1e0d          	ldw	x,(OFST+7,sp)
1760  003d 72fb05        	addw	x,(OFST-1,sp)
1761  0040 f6            	ld	a,(x)
1762  0041 1e03          	ldw	x,(OFST-3,sp)
1763  0043 72fb05        	addw	x,(OFST-1,sp)
1764  0046 f7            	ld	(x),a
1765                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1767  0047 1e05          	ldw	x,(OFST-1,sp)
1768  0049 5c            	incw	x
1769  004a 1f05          	ldw	(OFST-1,sp),x
1772  004c a30040        	cpw	x,#64
1773  004f 25ea          	jrult	L327
1774                     ; 685 }
1777  0051 5b08          	addw	sp,#8
1778  0053 81            	ret	
1791                     	xdef	_FLASH_WaitForLastOperation
1792                     	xdef	_FLASH_ProgramBlock
1793                     	xdef	_FLASH_EraseBlock
1794                     	xdef	_FLASH_GetFlagStatus
1795                     	xdef	_FLASH_GetBootSize
1796                     	xdef	_FLASH_GetProgrammingTime
1797                     	xdef	_FLASH_GetLowPowerMode
1798                     	xdef	_FLASH_SetProgrammingTime
1799                     	xdef	_FLASH_SetLowPowerMode
1800                     	xdef	_FLASH_EraseOptionByte
1801                     	xdef	_FLASH_ProgramOptionByte
1802                     	xdef	_FLASH_ReadOptionByte
1803                     	xdef	_FLASH_ProgramWord
1804                     	xdef	_FLASH_ReadByte
1805                     	xdef	_FLASH_ProgramByte
1806                     	xdef	_FLASH_EraseByte
1807                     	xdef	_FLASH_ITConfig
1808                     	xdef	_FLASH_DeInit
1809                     	xdef	_FLASH_Lock
1810                     	xdef	_FLASH_Unlock
1811                     	xref.b	c_lreg
1812                     	xref.b	c_x
1813                     	xref.b	c_y
1832                     	xref	c_ladd
1833                     	xref	c_cmulx
1834                     	xref	c_lzmp
1835                     	xref	c_lgsbc
1836                     	xref	c_ltor
1837                     	xref	c_lgadd
1838                     	xref	c_rtol
1839                     	xref	c_umul
1840                     	end
