   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  84                     ; 157 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgramTime)
  84                     ; 158 {
  86                     .text:	section	.text,new
  87  0000               _FLASH_SetProgrammingTime:
  91                     ; 160   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgramTime));
  93                     ; 162   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  95  0000 72115050      	bres	20560,#0
  96                     ; 163   FLASH->CR1 |= (uint8_t)FLASH_ProgramTime;
  98  0004 ca5050        	or	a,20560
  99  0007 c75050        	ld	20560,a
 100                     ; 164 }
 103  000a 81            	ret	
 128                     ; 171 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 128                     ; 172 {
 129                     .text:	section	.text,new
 130  0000               _FLASH_GetProgrammingTime:
 134                     ; 173   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 136  0000 c65050        	ld	a,20560
 137  0003 a401          	and	a,#1
 140  0005 81            	ret	
 163                     ; 215 void FLASH_DeInit(void)
 163                     ; 216 {
 164                     .text:	section	.text,new
 165  0000               _FLASH_DeInit:
 169                     ; 217   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 171  0000 725f5050      	clr	20560
 172                     ; 218   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 174  0004 725f5051      	clr	20561
 175                     ; 219   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 177  0008 35405054      	mov	20564,#64
 178                     ; 220   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 180  000c c65054        	ld	a,20564
 181                     ; 221 }
 184  000f 81            	ret	
 240                     ; 231 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 240                     ; 232 {
 241                     .text:	section	.text,new
 242  0000               _FLASH_Unlock:
 244  0000 88            	push	a
 245       00000000      OFST:	set	0
 248                     ; 234   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 250                     ; 237   if (FLASH_MemType == FLASH_MemType_Program)
 252  0001 a1fd          	cp	a,#253
 253  0003 2608          	jrne	L501
 254                     ; 239     FLASH->PUKR = FLASH_RASS_KEY1;
 256  0005 35565052      	mov	20562,#86
 257                     ; 240     FLASH->PUKR = FLASH_RASS_KEY2;
 259  0009 35ae5052      	mov	20562,#174
 260  000d               L501:
 261                     ; 243   if (FLASH_MemType == FLASH_MemType_Data)
 263  000d 7b01          	ld	a,(OFST+1,sp)
 264  000f a1f7          	cp	a,#247
 265  0011 2608          	jrne	L701
 266                     ; 245     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 268  0013 35ae5053      	mov	20563,#174
 269                     ; 246     FLASH->DUKR = FLASH_RASS_KEY1;
 271  0017 35565053      	mov	20563,#86
 272  001b               L701:
 273                     ; 248 }
 276  001b 84            	pop	a
 277  001c 81            	ret	
 312                     ; 258 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 312                     ; 259 {
 313                     .text:	section	.text,new
 314  0000               _FLASH_Lock:
 318                     ; 261   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 320                     ; 263   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 322  0000 c45054        	and	a,20564
 323  0003 c75054        	ld	20564,a
 324                     ; 264 }
 327  0006 81            	ret	
 370                     ; 272 void FLASH_ProgramByte(uint16_t Address, uint8_t Data)
 370                     ; 273 {
 371                     .text:	section	.text,new
 372  0000               _FLASH_ProgramByte:
 374  0000 89            	pushw	x
 375       00000000      OFST:	set	0
 378                     ; 275   assert_param(IS_FLASH_ADDRESS(Address));
 380                     ; 277   *(PointerAttr uint8_t*) (uint16_t)Address = Data;  
 382  0001 1e01          	ldw	x,(OFST+1,sp)
 383  0003 7b05          	ld	a,(OFST+5,sp)
 384  0005 f7            	ld	(x),a
 385                     ; 278 }
 388  0006 85            	popw	x
 389  0007 81            	ret	
 423                     ; 285 void FLASH_EraseByte(uint16_t Address)
 423                     ; 286 {
 424                     .text:	section	.text,new
 425  0000               _FLASH_EraseByte:
 429                     ; 288   assert_param(IS_FLASH_ADDRESS(Address));
 431                     ; 290   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 433  0000 7f            	clr	(x)
 434                     ; 291 }
 438  0001 81            	ret	
 481                     ; 299 void FLASH_ProgramWord(uint16_t Address, uint32_t Data)
 481                     ; 300 {
 482                     .text:	section	.text,new
 483  0000               _FLASH_ProgramWord:
 485  0000 89            	pushw	x
 486       00000000      OFST:	set	0
 489                     ; 302   assert_param(IS_FLASH_ADDRESS(Address));
 491                     ; 305   FLASH->CR2 |= FLASH_CR2_WPRG;
 493  0001 721c5051      	bset	20561,#6
 494                     ; 308   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 496  0005 1e01          	ldw	x,(OFST+1,sp)
 497  0007 7b05          	ld	a,(OFST+5,sp)
 498  0009 f7            	ld	(x),a
 499                     ; 310   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 501  000a 7b06          	ld	a,(OFST+6,sp)
 502  000c e701          	ld	(1,x),a
 503                     ; 312   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 505  000e 7b07          	ld	a,(OFST+7,sp)
 506  0010 e702          	ld	(2,x),a
 507                     ; 314   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 509  0012 7b08          	ld	a,(OFST+8,sp)
 510  0014 e703          	ld	(3,x),a
 511                     ; 315 }
 514  0016 85            	popw	x
 515  0017 81            	ret	
 549                     ; 322 uint8_t FLASH_ReadByte(uint16_t Address)
 549                     ; 323 {
 550                     .text:	section	.text,new
 551  0000               _FLASH_ReadByte:
 555                     ; 325   assert_param(IS_FLASH_ADDRESS(Address));
 557                     ; 328   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 559  0000 f6            	ld	a,(x)
 562  0001 81            	ret	
 619                     ; 358 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 619                     ; 359 {
 620                     .text:	section	.text,new
 621  0000               _FLASH_GetReadOutProtectionStatus:
 623  0000 88            	push	a
 624       00000001      OFST:	set	1
 627                     ; 360   FunctionalState state = DISABLE;
 629                     ; 362   if (OPT->OPT0_LOCKBYTE == FLASH_READOUTPROTECTION_KEY)
 631  0001 c64800        	ld	a,18432
 632  0004 a1aa          	cp	a,#170
 633  0006 2604          	jrne	L552
 634                     ; 365     state = ENABLE;
 636  0008 a601          	ld	a,#1
 638  000a 2001          	jra	L752
 639  000c               L552:
 640                     ; 370     state = DISABLE;
 642  000c 4f            	clr	a
 643  000d               L752:
 644                     ; 373     return state;
 648  000d 5b01          	addw	sp,#1
 649  000f 81            	ret	
 683                     ; 381 uint16_t FLASH_GetBootSize(void)
 683                     ; 382 {
 684                     .text:	section	.text,new
 685  0000               _FLASH_GetBootSize:
 687  0000 89            	pushw	x
 688       00000002      OFST:	set	2
 691                     ; 383   uint16_t temp = 0;
 693                     ; 386   temp = (uint16_t)(OPT->OPT2_BOOTSIZE * (uint16_t)64);
 695  0001 c64802        	ld	a,18434
 696  0004 97            	ld	xl,a
 697  0005 a640          	ld	a,#64
 698  0007 42            	mul	x,a
 699                     ; 389   if (OPT->OPT2_BOOTSIZE > 0x7F)
 701  0008 c64802        	ld	a,18434
 702  000b a180          	cp	a,#128
 703  000d 2503          	jrult	L772
 704                     ; 391     temp = 8192;
 706  000f ae2000        	ldw	x,#8192
 707  0012               L772:
 708                     ; 395   return(temp);
 712  0012 5b02          	addw	sp,#2
 713  0014 81            	ret	
 747                     ; 403 uint16_t FLASH_GetDataSize(void)
 747                     ; 404 {
 748                     .text:	section	.text,new
 749  0000               _FLASH_GetDataSize:
 751  0000 89            	pushw	x
 752       00000002      OFST:	set	2
 755                     ; 405   uint16_t temp = 0;
 757                     ; 408   temp = (uint16_t)((uint16_t)OPT->OPT3_DATASIZE * (uint16_t)64);
 759  0001 c64803        	ld	a,18435
 760  0004 5f            	clrw	x
 761  0005 97            	ld	xl,a
 762  0006 58            	sllw	x
 763  0007 58            	sllw	x
 764  0008 58            	sllw	x
 765  0009 58            	sllw	x
 766  000a 58            	sllw	x
 767  000b 58            	sllw	x
 768                     ; 411   if (OPT->OPT3_DATASIZE > 0x20)
 770  000c c64803        	ld	a,18435
 771  000f a121          	cp	a,#33
 772  0011 2503          	jrult	L713
 773                     ; 413     temp = 2048;
 775  0013 ae0800        	ldw	x,#2048
 776  0016               L713:
 777                     ; 417   return(temp);
 781  0016 5b02          	addw	sp,#2
 782  0018 81            	ret	
 817                     ; 441 void FLASH_ITConfig(FunctionalState NewState)
 817                     ; 442 {
 818                     .text:	section	.text,new
 819  0000               _FLASH_ITConfig:
 823                     ; 444   assert_param(IS_FUNCTIONAL_STATE(NewState));
 825                     ; 446   if (NewState != DISABLE)
 827  0000 4d            	tnz	a
 828  0001 2705          	jreq	L733
 829                     ; 448     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 831  0003 72125050      	bset	20560,#1
 834  0007 81            	ret	
 835  0008               L733:
 836                     ; 452     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 838  0008 72135050      	bres	20560,#1
 839                     ; 454 }
 842  000c 81            	ret	
 944                     ; 467 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
 944                     ; 468 {
 945                     .text:	section	.text,new
 946  0000               _FLASH_GetFlagStatus:
 948  0000 88            	push	a
 949       00000001      OFST:	set	1
 952                     ; 469   FlagStatus status = RESET;
 954                     ; 471   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
 956                     ; 474   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 958  0001 c45054        	and	a,20564
 959  0004 2702          	jreq	L114
 960                     ; 476     status = SET; /* FLASH_FLAG is set*/
 962  0006 a601          	ld	a,#1
 964  0008               L114:
 965                     ; 480     status = RESET; /* FLASH_FLAG is reset*/
 967                     ; 484   return status;
 971  0008 5b01          	addw	sp,#1
 972  000a 81            	ret	
1066                     ; 602 IN_RAM(void FLASH_ProgramBlock(uint8_t BlockNum, FLASH_ProgramMode_TypeDef FLASH_ProgramMode, uint8_t *Buffer))
1066                     ; 603 {
1067                     .text:	section	.text,new
1068  0000               _FLASH_ProgramBlock:
1070  0000 89            	pushw	x
1071  0001 5204          	subw	sp,#4
1072       00000004      OFST:	set	4
1075                     ; 604   uint16_t Count = 0;
1077                     ; 605   uint16_t StartAddress = 0;
1079                     ; 608   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1081                     ; 609   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgramMode));
1083                     ; 612   if (FLASH_ProgramMode == FLASH_ProgramMode_Standard)
1085  0003 9f            	ld	a,xl
1086  0004 4d            	tnz	a
1087  0005 2606          	jrne	L364
1088                     ; 615     FLASH->CR2 |= FLASH_CR2_PRG;
1090  0007 72105051      	bset	20561,#0
1092  000b 2004          	jra	L564
1093  000d               L364:
1094                     ; 620     FLASH->CR2 |= FLASH_CR2_FPRG;
1096  000d 72185051      	bset	20561,#4
1097  0011               L564:
1098                     ; 622   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1100                     ; 624   StartAddress = StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE);
1102  0011 7b05          	ld	a,(OFST+1,sp)
1103  0013 5f            	clrw	x
1104  0014 97            	ld	xl,a
1105  0015 58            	sllw	x
1106  0016 58            	sllw	x
1107  0017 58            	sllw	x
1108  0018 58            	sllw	x
1109  0019 58            	sllw	x
1110  001a 58            	sllw	x
1111  001b 1c8000        	addw	x,#32768
1112  001e 1f01          	ldw	(OFST-3,sp),x
1113                     ; 627   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1115  0020 5f            	clrw	x
1116  0021 1f03          	ldw	(OFST-1,sp),x
1117  0023               L764:
1118                     ; 629     *((PointerAttr uint8_t*) (uint16_t)StartAddress + Count) = ((uint8_t)(Buffer[Count]));
1120  0023 1e09          	ldw	x,(OFST+5,sp)
1121  0025 72fb03        	addw	x,(OFST-1,sp)
1122  0028 f6            	ld	a,(x)
1123  0029 1e01          	ldw	x,(OFST-3,sp)
1124  002b 72fb03        	addw	x,(OFST-1,sp)
1125  002e f7            	ld	(x),a
1126                     ; 627   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1128  002f 1e03          	ldw	x,(OFST-1,sp)
1129  0031 5c            	incw	x
1130  0032 1f03          	ldw	(OFST-1,sp),x
1133  0034 a30040        	cpw	x,#64
1134  0037 25ea          	jrult	L764
1135                     ; 631 }
1138  0039 5b06          	addw	sp,#6
1139  003b 81            	ret	
1192                     ; 643 IN_RAM(void FLASH_EraseBlock(uint8_t BlockNum))
1192                     ; 644 {
1193                     .text:	section	.text,new
1194  0000               _FLASH_EraseBlock:
1196  0000 5204          	subw	sp,#4
1197       00000004      OFST:	set	4
1200                     ; 646   uint16_t StartAddress = 0;
1202                     ; 648   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1204                     ; 650   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1206                     ; 652   pwFlash = (PointerAttr uint32_t *)(uint16_t)(StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE));
1208  0002 5f            	clrw	x
1209  0003 97            	ld	xl,a
1210  0004 58            	sllw	x
1211  0005 58            	sllw	x
1212  0006 58            	sllw	x
1213  0007 58            	sllw	x
1214  0008 58            	sllw	x
1215  0009 58            	sllw	x
1216  000a 1c8000        	addw	x,#32768
1217  000d 1f01          	ldw	(OFST-3,sp),x
1218                     ; 655   FLASH->CR2 |= FLASH_CR2_ERASE;
1220  000f 721a5051      	bset	20561,#5
1221                     ; 657   *pwFlash = (uint32_t)0;
1223  0013 4f            	clr	a
1224  0014 e703          	ld	(3,x),a
1225  0016 e702          	ld	(2,x),a
1226  0018 e701          	ld	(1,x),a
1227  001a f7            	ld	(x),a
1228                     ; 658 }
1231  001b 5b04          	addw	sp,#4
1232  001d 81            	ret	
1307                     ; 670 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(void))
1307                     ; 671 {
1308                     .text:	section	.text,new
1309  0000               _FLASH_WaitForLastOperation:
1311  0000 5203          	subw	sp,#3
1312       00000003      OFST:	set	3
1315                     ; 672   uint16_t timeout = OPERATION_TIMEOUT;
1317  0002 ae1000        	ldw	x,#4096
1318  0005 1f01          	ldw	(OFST-2,sp),x
1319                     ; 673   uint8_t My_FlagStatus = 0x00;
1321  0007 0f03          	clr	(OFST+0,sp)
1323  0009 200a          	jra	L365
1324  000b               L755:
1325                     ; 678     My_FlagStatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1327  000b c65054        	ld	a,20564
1328  000e a405          	and	a,#5
1329  0010 6b03          	ld	(OFST+0,sp),a
1330                     ; 679     timeout--;
1332  0012 5a            	decw	x
1333  0013 1f01          	ldw	(OFST-2,sp),x
1334  0015               L365:
1335                     ; 676   while ((My_FlagStatus == 0x00) && (timeout != 0x00))
1337  0015 7b03          	ld	a,(OFST+0,sp)
1338  0017 2604          	jrne	L765
1340  0019 1e01          	ldw	x,(OFST-2,sp)
1341  001b 26ee          	jrne	L755
1342  001d               L765:
1343                     ; 682   if (timeout == 0x00)
1345  001d 1e01          	ldw	x,(OFST-2,sp)
1346  001f 2602          	jrne	L175
1347                     ; 684     My_FlagStatus = (uint8_t)FLASH_Status_TimeOut;
1349  0021 a602          	ld	a,#2
1350  0023               L175:
1351                     ; 687   return((FLASH_Status_TypeDef)My_FlagStatus);
1355  0023 5b03          	addw	sp,#3
1356  0025 81            	ret	
1369                     	xdef	_FLASH_WaitForLastOperation
1370                     	xdef	_FLASH_EraseBlock
1371                     	xdef	_FLASH_ProgramBlock
1372                     	xdef	_FLASH_GetFlagStatus
1373                     	xdef	_FLASH_ITConfig
1374                     	xdef	_FLASH_GetReadOutProtectionStatus
1375                     	xdef	_FLASH_GetDataSize
1376                     	xdef	_FLASH_GetBootSize
1377                     	xdef	_FLASH_ReadByte
1378                     	xdef	_FLASH_ProgramWord
1379                     	xdef	_FLASH_EraseByte
1380                     	xdef	_FLASH_ProgramByte
1381                     	xdef	_FLASH_Lock
1382                     	xdef	_FLASH_Unlock
1383                     	xdef	_FLASH_DeInit
1384                     	xdef	_FLASH_SetProgrammingTime
1385                     	xdef	_FLASH_GetProgrammingTime
1404                     	end
