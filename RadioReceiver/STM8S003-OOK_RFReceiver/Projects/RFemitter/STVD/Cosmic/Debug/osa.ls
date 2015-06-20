   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  51                     ; 53 void _OS_JumpToTask (void)
  51                     ; 54 {
  53                     .text:	section	.text,new
  54  0000               __OS_JumpToTask:
  58                     ; 55     _OS_STORE_SP();
  61  0000 96            	ldw	X,SP
  66  0001 bf25          	ldw	__OS_SP_Temp,X
  68                     ; 56     _OS_SET_FSR_CUR_TASK();
  72  0003 905f          	clrw	Y
  77  0005 b620          	ld	A,__OS_CurTask
  82  0007 9097          	ld	YL,A
  84                     ; 57     _OS_Restore_TaskSP();
  88  0009 93            	ldw	X,Y
  93  000a ee03          	ldw	X,(3,X)
  98  000c 5d            	tnzw	X
 103  000d 2701          	jreq	SKIP_SP
 108  000f 94            	ldw	SP,X
 113  0010               SKIP_SP:
 115                     ; 58     _OS_SET_PC();
 119  0010 93            	ldw	X,Y
 124  0011 ee01          	ldw	X,(1,X)
 129  0013 89            	pushw	X
 134  0014 81            	ret	
 136                     ; 59 }
 140  0015 81            	ret	
 165                     ; 86 void _OS_ReturnSave (void)
 165                     ; 87 {
 166                     .text:	section	.text,new
 167  0000               __OS_ReturnSave:
 171                     ; 88     _OS_SET_FSR_CUR_TASK();
 174  0000 905f          	clrw	Y
 179  0002 b620          	ld	A,__OS_CurTask
 184  0004 9097          	ld	YL,A
 186                     ; 89     _OS_SAVE_PC();
 190  0006 85            	popw	X
 195  0007 90ef01        	ldw	(1,Y),X
 197                     ; 90     _OS_Store_TaskSP();
 201  000a 96            	ldw	X,SP
 206  000b 90ef03        	ldw	(3,Y),X
 208                     ; 91     _OS_bTaskReady = 1;
 211  000e 72160021      	bset	__OS_State,#3
 212                     ; 92     _OS_RESTORE_SP();
 215  0012 be25          	ldw	X,__OS_SP_Temp
 220  0014 94            	ldw	SP,X
 222                     ; 93 }
 226  0015 81            	ret	
 250                     ; 113 void _OS_ReturnNoSave (void)
 250                     ; 114 {
 251                     .text:	section	.text,new
 252  0000               __OS_ReturnNoSave:
 256                     ; 115     _OS_POP();
 259  0000 85            	popw	X
 261                     ; 116     _OS_RESTORE_SP();
 264  0001 be25          	ldw	X,__OS_SP_Temp
 269  0003 94            	ldw	SP,X
 271                     ; 117 }
 275  0004 81            	ret	
 300                     ; 138 void _OS_EnterWaitMode (void)
 300                     ; 139 {
 301                     .text:	section	.text,new
 302  0000               __OS_EnterWaitMode:
 306                     ; 140     _OS_Temp = 0;
 308  0000 3f23          	clr	__OS_Temp
 309                     ; 142     _asm(" jp    __OS_ClrReadySetClrCanContinue   ");
 312  0002 cc0000        	jp	__OS_ClrReadySetClrCanContinue
 314                     ; 143 }
 342                     ; 164 void _OS_EnterWaitModeTO (void)
 342                     ; 165 {
 343                     .text:	section	.text,new
 344  0000               __OS_EnterWaitModeTO:
 348                     ; 166     _OS_Temp = 0xFF;
 350  0000 35ff0023      	mov	__OS_Temp,#255
 351                     ; 168     _asm(" jp    __OS_ClrReadySetClrCanContinue   ");
 354  0004 cc0000        	jp	__OS_ClrReadySetClrCanContinue
 356                     ; 169 }
 386                     ; 191 void _OS_ClrReadySetClrCanContinue (void)
 386                     ; 192 {
 387                     .text:	section	.text,new
 388  0000               __OS_ClrReadySetClrCanContinue:
 392                     ; 193     _OS_SET_FSR_CUR_TASK();
 395  0000 905f          	clrw	Y
 400  0002 b620          	ld	A,__OS_CurTask
 405  0004 9097          	ld	YL,A
 407                     ; 194     _OS_SAVE_PC();
 411  0006 85            	popw	X
 416  0007 90ef01        	ldw	(1,Y),X
 418                     ; 195     _OS_PUSH();
 422  000a 89            	pushw	X
 424                     ; 196     _OS_Store_TaskSP2();
 427  000b 96            	ldw	X,SP
 432  000c 1c0002        	addw	X,#2
 437  000f 90ef03        	ldw	(3,Y),X
 439                     ; 198     _OS_Flags.bEventError = 0;
 442  0012 72110024      	bres	__OS_Flags,#0
 443                     ; 199     _OS_bTaskReady = 0;
 445  0016 72170021      	bres	__OS_State,#3
 446                     ; 202         if (!_OS_bTaskDelay) _OS_bTaskCanContinue = 0;
 448  001a 7208002104    	btjt	__OS_State,#4,L17
 451  001f 721b0021      	bres	__OS_State,#5
 452  0023               L17:
 453                     ; 203         if (_OS_Temp & 0x01) _OS_bTaskCanContinue = 1;
 455  0023 7201002304    	btjf	__OS_Temp,#0,L37
 458  0028 721a0021      	bset	__OS_State,#5
 459  002c               L37:
 460                     ; 206 }
 463  002c 81            	ret	
 503                     ; 242 void _OS_InitDelay (OS_TTIMER_TYPE Delay)
 503                     ; 243 {
 504                     .text:	section	.text,new
 505  0000               __OS_InitDelay:
 507  0000 89            	pushw	x
 508       00000000      OFST:	set	0
 511                     ; 245     _OS_TASK_ATOMIC_WRITE_A(
 513  0001 cd0000        	call	__OS_DI_INT
 517  0004 721b0021      	bres	__OS_State,#5
 521  0008 ad32          	call	LC001
 526  000a a4ef          	and	A,#0xEF
 531  000c 90f7          	ld	(Y),A
 537  000e cd0000        	call	__OS_RI_INT
 539                     ; 250     if (Delay)
 541  0011 1e01          	ldw	x,(OFST+1,sp)
 542  0013 2725          	jreq	L711
 543                     ; 252         Delay ^= (OS_TTIMER_TYPE)-1;
 545  0015 0302          	cpl	(OFST+2,sp)
 546  0017 0301          	cpl	(OFST+1,sp)
 547                     ; 253         Delay ++;
 549  0019 1e01          	ldw	x,(OFST+1,sp)
 550  001b 5c            	incw	x
 551  001c 1f01          	ldw	(OFST+1,sp),x
 552                     ; 254         _OS_CurTask->Timer = Delay;
 554  001e 5f            	clrw	x
 555  001f b620          	ld	a,__OS_CurTask
 556  0021 97            	ld	xl,a
 557  0022 1601          	ldw	y,(OFST+1,sp)
 558  0024 ef05          	ldw	(5,x),y
 559                     ; 255         _OS_TASK_ATOMIC_WRITE_A(_OS_CURTASK_STATE_DELAY_READY_SET());
 561  0026 cd0000        	call	__OS_DI_INT
 566  0029 ad11          	call	LC001
 571  002b aa18          	or	A,#0x18
 576  002d 90f7          	ld	(Y),A
 581  002f cd0000        	call	__OS_RI_INT
 583                     ; 257             _OS_bTaskDelay = 1;
 585  0032 72180021      	bset	__OS_State,#4
 586                     ; 258             _OS_bTaskReady = 1;
 588  0036 72160021      	bset	__OS_State,#3
 589  003a               L711:
 590                     ; 261 }
 593  003a 85            	popw	x
 594  003b 81            	ret	
 595  003c               LC001:
 596  003c 905f          	clrw	Y
 598                     ; 245     _OS_TASK_ATOMIC_WRITE_A(
 601  003e b620          	ld	A,__OS_CurTask
 606  0040 9097          	ld	YL,A
 612  0042 90f6          	ld	A,(Y)
 613  0044 81            	ret	
 637                     ; 292 char OS_DI (void)
 637                     ; 293 {
 638                     .text:	section	.text,new
 639  0000               _OS_DI:
 643                     ; 294     _asm("  push    CC  ");
 646  0000 8a            	push	CC
 648                     ; 295     _asm("  sim         ");
 651  0001 9b            	sim	
 653                     ; 296     _asm("  pop     A   ");
 656  0002 84            	pop	A
 658                     ; 297 }
 661  0003 81            	ret	
 685                     ; 302 void _OS_DI_INT (void)
 685                     ; 303 {
 686                     .text:	section	.text,new
 687  0000               __OS_DI_INT:
 691                     ; 304     _asm("  push    CC          ");
 694  0000 8a            	push	CC
 696                     ; 305     _asm("  sim                 ");
 699  0001 9b            	sim	
 701                     ; 306     _asm("  pop     __OS_Temp_I ");
 704  0002 320000        	pop	__OS_Temp_I
 706                     ; 307 }
 709  0005 81            	ret	
 743                     ; 332 void OS_RI (char temp)
 743                     ; 333 {
 744                     .text:	section	.text,new
 745  0000               _OS_RI:
 749                     ; 334     _asm("  push    A       ");
 752  0000 88            	push	A
 754                     ; 335     _asm("  pop     CC      ");
 757  0001 86            	pop	CC
 759                     ; 336 }
 762  0002 81            	ret	
 785                     ; 341 void _OS_RI_INT (void)
 785                     ; 342 {
 786                     .text:	section	.text,new
 787  0000               __OS_RI_INT:
 791                     ; 343     _asm("  push    __OS_Temp_I ");
 794  0000 3b0000        	push	__OS_Temp_I
 796                     ; 344     _asm("  pop     CC          ");
 799  0003 86            	pop	CC
 801                     ; 345 }
 804  0004 81            	ret	
 841                     ; 358 void OS_EnterCriticalSection (void)
 841                     ; 359 {
 842                     .text:	section	.text,new
 843  0000               _OS_EnterCriticalSection:
 845  0000 88            	push	a
 846       00000001      OFST:	set	1
 849                     ; 362     temp = OS_DI();
 851  0001 cd0000        	call	_OS_DI
 853  0004 6b01          	ld	(OFST+0,sp),a
 854                     ; 363     _OS_Flags.bInCriticalSection = 1;
 856  0006 72140024      	bset	__OS_Flags,#2
 857                     ; 365     _OS_Flags.bI0_CTemp = 0;
 859                     ; 366     if (temp & 0x08) _OS_Flags.bI0_CTemp = 1;
 861  000a a508          	bcp	a,#8
 862  000c 721f0024      	bres	__OS_Flags,#7
 863  0010 2704          	jreq	L112
 866  0012 721e0024      	bset	__OS_Flags,#7
 867  0016               L112:
 868                     ; 368     _OS_Flags.bI1_CTemp = 0;
 870  0016 721d0024      	bres	__OS_Flags,#6
 871                     ; 369     if (temp & 0x20) _OS_Flags.bI1_CTemp = 1;
 873  001a a520          	bcp	a,#32
 874  001c 2704          	jreq	L312
 877  001e 721c0024      	bset	__OS_Flags,#6
 878  0022               L312:
 879                     ; 370 }
 882  0022 84            	pop	a
 883  0023 81            	ret	
 920                     ; 378 void OS_LeaveCriticalSection (void)
 920                     ; 379 {
 921                     .text:	section	.text,new
 922  0000               _OS_LeaveCriticalSection:
 924  0000 88            	push	a
 925       00000001      OFST:	set	1
 928                     ; 381     _OS_Flags.bInCriticalSection = 0;
 930  0001 72150024      	bres	__OS_Flags,#2
 931                     ; 382     temp = 0;
 933  0005 0f01          	clr	(OFST+0,sp)
 934                     ; 383     if (_OS_Flags.bI0_CTemp) temp |= 0x20;
 936  0007 720f002406    	btjf	__OS_Flags,#7,L332
 939  000c 7b01          	ld	a,(OFST+0,sp)
 940  000e aa20          	or	a,#32
 941  0010 6b01          	ld	(OFST+0,sp),a
 942  0012               L332:
 943                     ; 384     if (_OS_Flags.bI1_CTemp) temp |= 0x08;
 945  0012 720d002406    	btjf	__OS_Flags,#6,L532
 948  0017 7b01          	ld	a,(OFST+0,sp)
 949  0019 aa08          	or	a,#8
 950  001b 6b01          	ld	(OFST+0,sp),a
 951  001d               L532:
 952                     ; 385     OS_RI(temp);
 954  001d 7b01          	ld	a,(OFST+0,sp)
 955  001f cd0000        	call	_OS_RI
 957                     ; 386 }
 960  0022 84            	pop	a
 961  0023 81            	ret	
1001                     ; 419 void _OS_CheckEvent (OST_UINT bEvent)
1001                     ; 420 {
1002                     .text:	section	.text,new
1003  0000               __OS_CheckEvent:
1007                     ; 458         _OS_Flags.bTimeout = 0;
1009  0000 721b0024      	bres	__OS_Flags,#5
1010                     ; 460         if (bEvent)
1012  0004 4d            	tnz	a
1013  0005 2721          	jreq	L552
1014                     ; 462             if (_OS_bTaskReady) {
1016  0007 7207002116    	btjf	__OS_State,#3,L752
1017                     ; 466                     _OS_bTaskDelay = 0; // Clear bDelay in temporary variable _OS_State
1019  000c 72190021      	bres	__OS_State,#4
1020                     ; 467                     _OS_ATOMIC_WRITE_A(_OS_CURTASK_STATE_DELAY_CLEAR());
1022  0010 cd0000        	call	__OS_DI_INT
1027  0013 905f          	clrw	Y
1032  0015 b620          	ld	A,__OS_CurTask
1037  0017 9097          	ld	YL,A
1043  0019 90f6          	ld	A,(Y)
1048  001b a4ef          	and	A,#0xEF
1053  001d 90f7          	ld	(Y),A
1059                     ; 475                 return;
1062  001f cc0000        	jp	__OS_RI_INT
1063  0022               L752:
1064                     ; 478             _OS_bTaskReady = 1;
1066  0022 72160021      	bset	__OS_State,#3
1068  0026 2004          	jra	L562
1069  0028               L552:
1070                     ; 481             _OS_bTaskReady = 0;
1072  0028 72170021      	bres	__OS_State,#3
1073  002c               L562:
1074                     ; 486             if (_OS_bTaskTimeout && _OS_bTaskCanContinue)
1076  002c 720800210e    	btjt	__OS_State,#4,L762
1078  0031 720b002109    	btjf	__OS_State,#5,L762
1079                     ; 488                 _OS_bTaskReady = 1;
1081  0036 72160021      	bset	__OS_State,#3
1082                     ; 489                 _OS_Flags.bTimeout = 1;
1084  003a 721a0024      	bset	__OS_Flags,#5
1085                     ; 495                 return;
1088  003e 81            	ret	
1089  003f               L762:
1090                     ; 500         _OS_POP();
1093  003f 85            	popw	X
1095                     ; 501         _OS_RESTORE_SP();
1098  0040 be25          	ldw	X,__OS_SP_Temp
1103  0042 94            	ldw	SP,X
1105                     ; 507 }
1109  0043 81            	ret	
1163                     ; 67 void OS_Init (void)
1163                     ; 68 {
1164                     .text:	section	.text,new
1165  0000               _OS_Init:
1169                     ; 72     *(OS_RAM_NEAR OST_WORD*)&_OS_Flags = 0;
1171  0000 3f24          	clr	__OS_Flags
1172                     ; 81         _OS_LastTask = (OST_TASK_POINTER) _OS_Tasks + (OS_TASKS - 1);
1175  0002 3516001d      	mov	__OS_LastTask,#__OS_Tasks+21
1176                     ; 326         _OS_Tasks[0].State.bEnable = 0;
1178  0006 721d0001      	bres	__OS_Tasks,#6
1179                     ; 329            _OS_Tasks[1].State.bEnable = 0;
1181  000a 721d0008      	bres	__OS_Tasks+7,#6
1182                     ; 333            _OS_Tasks[2].State.bEnable = 0;
1184  000e 721d000f      	bres	__OS_Tasks+14,#6
1185                     ; 337            _OS_Tasks[3].State.bEnable = 0;
1187  0012 721d0016      	bres	__OS_Tasks+21,#6
1188                     ; 394 }
1191  0016 81            	ret	
1215                     ; 568 void OS_Timer (void)
1215                     ; 569 {
1216                     .text:	section	.text,new
1217  0000               _OS_Timer:
1221                     ; 570     __OS_TimerInline();
1355  0000 720900010b    	btjf	__OS_Tasks,#4,L523
1358  0005 be06          	ldw	x,__OS_Tasks+5
1359  0007 5c            	incw	x
1360  0008 bf06          	ldw	__OS_Tasks+5,x
1361  000a 2604          	jrne	L523
1364  000c 72190001      	bres	__OS_Tasks,#4
1365  0010               L523:
1369  0010 720900080b    	btjf	__OS_Tasks+7,#4,L133
1372  0015 be0d          	ldw	x,__OS_Tasks+12
1373  0017 5c            	incw	x
1374  0018 bf0d          	ldw	__OS_Tasks+12,x
1375  001a 2604          	jrne	L133
1378  001c 72190008      	bres	__OS_Tasks+7,#4
1379  0020               L133:
1383  0020 7209000f0b    	btjf	__OS_Tasks+14,#4,L533
1386  0025 be14          	ldw	x,__OS_Tasks+19
1387  0027 5c            	incw	x
1388  0028 bf14          	ldw	__OS_Tasks+19,x
1389  002a 2604          	jrne	L533
1392  002c 7219000f      	bres	__OS_Tasks+14,#4
1393  0030               L533:
1397  0030 720900160b    	btjf	__OS_Tasks+21,#4,L143
1400  0035 be1b          	ldw	x,__OS_Tasks+26
1401  0037 5c            	incw	x
1402  0038 bf1b          	ldw	__OS_Tasks+26,x
1403  003a 2604          	jrne	L143
1406  003c 72190016      	bres	__OS_Tasks+21,#4
1407  0040               L143:
1408                     ; 571 }
1477  0040 81            	ret	
1659                     ; 75     void _OS_Task_Create(OST_WORD priority, OST_CODE_POINTER TaskAddr)
1659                     ; 76     {
1660                     .text:	section	.text,new
1661  0000               __OS_Task_Create:
1663  0000 88            	push	a
1664  0001 88            	push	a
1665       00000001      OFST:	set	1
1668                     ; 79         _OS_Flags.bError = 0;
1670  0002 72130024      	bres	__OS_Flags,#1
1671                     ; 88         Task = (OST_TASK_POINTER)_OS_Tasks;
1673  0006 a601          	ld	a,#__OS_Tasks
1674  0008 6b01          	ld	(OFST+0,sp),a
1675                     ; 89         _OS_Temp = 0;   
1677  000a 3f23          	clr	__OS_Temp
1678  000c               L554:
1679                     ; 93             if (!Task->State.bEnable)               // Is descriptor free?
1681  000c 7b01          	ld	a,(OFST+0,sp)
1682  000e 5f            	clrw	x
1683  000f 97            	ld	xl,a
1684  0010 f6            	ld	a,(x)
1685  0011 a540          	bcp	a,#64
1686  0013 262f          	jrne	L364
1687                     ; 95                 ((OST_TASK_STATE*)&priority)->bEnable = 1;
1689  0015 7b02          	ld	a,(OFST+1,sp)
1690                     ; 96                 ((OST_TASK_STATE*)&priority)->bReady = 1;
1692  0017 aa48          	or	a,#72
1693  0019 6b02          	ld	(OFST+1,sp),a
1694                     ; 98                 Task->pTaskPointer = TaskAddr;
1696  001b 5f            	clrw	x
1697  001c 7b01          	ld	a,(OFST+0,sp)
1698  001e 97            	ld	xl,a
1699  001f 1605          	ldw	y,(OFST+4,sp)
1700  0021 ef01          	ldw	(1,x),y
1701                     ; 101                     Task->Timer = 0;
1703  0023 5f            	clrw	x
1704  0024 97            	ld	xl,a
1705  0025 905f          	clrw	y
1706  0027 ef05          	ldw	(5,x),y
1707                     ; 108                 *((OS_TASKS_BANK char*)&Task->State) = priority;
1709  0029 5f            	clrw	x
1710  002a 97            	ld	xl,a
1711  002b 7b02          	ld	a,(OFST+1,sp)
1712  002d f7            	ld	(x),a
1713                     ; 111                 if (Task == _OS_CurTask) *((OS_RAM_NEAR char*)&_OS_State) = priority;
1715  002e 7b01          	ld	a,(OFST+0,sp)
1716  0030 b120          	cp	a,__OS_CurTask
1717  0032 2606          	jrne	L564
1720  0034 7b02          	ld	a,(OFST+1,sp)
1721  0036 b721          	ld	__OS_State,a
1722  0038 7b01          	ld	a,(OFST+0,sp)
1723  003a               L564:
1724                     ; 123                 Task->nSP_Temp = 0;
1726  003a 5f            	clrw	x
1727  003b 97            	ld	xl,a
1728  003c ef03          	ldw	(3,x),y
1729                     ; 126                 _OS_Flags.bError = 0;
1731  003e 72130024      	bres	__OS_Flags,#1
1732                     ; 128                 return ;
1734  0042 2012          	jra	L66
1735  0044               L364:
1736                     ; 132             Task ++;
1738  0044 7b01          	ld	a,(OFST+0,sp)
1739  0046 ab07          	add	a,#7
1740  0048 6b01          	ld	(OFST+0,sp),a
1741                     ; 134         } while (++_OS_Temp < OS_TASKS);    
1743  004a 3c23          	inc	__OS_Temp
1744  004c b623          	ld	a,__OS_Temp
1745  004e a104          	cp	a,#4
1746  0050 25ba          	jrult	L554
1747                     ; 137         _OS_Flags.bError = 1;
1749  0052 72120024      	bset	__OS_Flags,#1
1750                     ; 139         return ;
1751  0056               L66:
1754  0056 85            	popw	x
1755  0057 81            	ret	
2085                     	xdef	__OS_ClrReadySetClrCanContinue
2086                     	switch	.ubsct
2087  0000               __OS_Temp_I:
2088  0000 00            	ds.b	1
2089                     	xdef	__OS_Temp_I
2090                     	xdef	_OS_Timer
2091                     	xdef	__OS_InitDelay
2092                     	xdef	__OS_Task_Create
2093  0001               __OS_Tasks:
2094  0001 000000000000  	ds.b	28
2095                     	xdef	__OS_Tasks
2096                     	xdef	_OS_LeaveCriticalSection
2097                     	xdef	_OS_EnterCriticalSection
2098                     	xdef	_OS_Init
2099  001d               __OS_LastTask:
2100  001d 00            	ds.b	1
2101                     	xdef	__OS_LastTask
2102  001e               __OS_BestTask:
2103  001e 00            	ds.b	1
2104                     	xdef	__OS_BestTask
2105  001f               __OS_Best_Priority:
2106  001f 00            	ds.b	1
2107                     	xdef	__OS_Best_Priority
2108  0020               __OS_CurTask:
2109  0020 00            	ds.b	1
2110                     	xdef	__OS_CurTask
2111  0021               __OS_State:
2112  0021 00            	ds.b	1
2113                     	xdef	__OS_State
2114  0022               __OS_TempH:
2115  0022 00            	ds.b	1
2116                     	xdef	__OS_TempH
2117  0023               __OS_Temp:
2118  0023 00            	ds.b	1
2119                     	xdef	__OS_Temp
2120  0024               __OS_Flags:
2121  0024 00            	ds.b	1
2122                     	xdef	__OS_Flags
2123                     	xdef	__OS_RI_INT
2124                     	xdef	__OS_DI_INT
2125                     	xdef	_OS_RI
2126                     	xdef	_OS_DI
2127                     	xdef	__OS_CheckEvent
2128                     	xdef	__OS_EnterWaitModeTO
2129                     	xdef	__OS_EnterWaitMode
2130                     	xdef	__OS_ReturnNoSave
2131                     	xdef	__OS_ReturnSave
2132                     	xdef	__OS_JumpToTask
2133  0025               __OS_SP_Temp:
2134  0025 0000          	ds.b	2
2135                     	xdef	__OS_SP_Temp
2155                     	end
