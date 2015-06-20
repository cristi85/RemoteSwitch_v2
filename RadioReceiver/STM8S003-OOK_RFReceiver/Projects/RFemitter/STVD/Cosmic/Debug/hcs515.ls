   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 111                     ; 17 _Bool HCS515_EEpromRead(u8* data, u8 address, u8 num_bytes)
 111                     ; 18 {
 113                     .text:	section	.text,new
 114  0000               _HCS515_EEpromRead:
 116  0000 89            	pushw	x
 117       00000003      OFST:	set	3
 120                     ; 20   cmd[0] = CMD_READ;
 122  0001 35f00000      	mov	L3_cmd,#240
 123  0005 5203          	subw	sp,#3
 124                     ; 21   cmd[1] = address;
 126  0007 7b08          	ld	a,(OFST+5,sp)
 127  0009 b701          	ld	L3_cmd+1,a
 128                     ; 22   cmd[2] = DUMMY_BYTE;
 130  000b 3f02          	clr	L3_cmd+2
 131                     ; 24   if(!Send_Command(cmd, 3)) return FALSE;
 133  000d 4b03          	push	#3
 134  000f ae0000        	ldw	x,#L3_cmd
 135  0012 cd0000        	call	L5_Send_Command
 137  0015 5b01          	addw	sp,#1
 138  0017 4d            	tnz	a
 142  0018 2757          	jreq	L02
 143                     ; 26   HCS515_SDA_IN;
 145  001a 72175002      	bres	20482,#3
 146                     ; 27   delay_ms(1);       //wait TRD Decoder EEPROM Read Time min 1ms, max 2ms
 148  001e ae0001        	ldw	x,#1
 149  0021 cd0000        	call	_delay_ms
 151                     ; 29   for(j = 0; j < num_bytes; j++, data++)
 153  0024 0f01          	clr	(OFST-2,sp)
 155  0026 2041          	jra	L56
 156  0028               L16:
 157                     ; 31     *data = 0;
 159  0028 1e04          	ldw	x,(OFST+1,sp)
 160                     ; 32     for(i = 0, mask = 0x01; i < 8; i++)
 162  002a 0f02          	clr	(OFST-1,sp)
 163  002c 7f            	clr	(x)
 164  002d a601          	ld	a,#1
 165  002f 6b03          	ld	(OFST+0,sp),a
 166  0031               L17:
 167                     ; 34       HCS515_SCL_HIGH;
 169  0031 7216500a      	bset	20490,#3
 170                     ; 35       DELAY_US(50);
 172  0035 ae0080        	ldw	x,#128
 174  0038               L21:
 175  0038 5a            	decw	X
 176  0039 26fd          	jrne	L21
 177  003b 9d            	nop	
 179                     ; 36       if(HCS515_SDA_STATE_HIGH) *data |= mask;
 182  003c 7207500106    	btjf	20481,#3,L77
 185  0041 1e04          	ldw	x,(OFST+1,sp)
 186  0043 f6            	ld	a,(x)
 187  0044 1a03          	or	a,(OFST+0,sp)
 188  0046 f7            	ld	(x),a
 189  0047               L77:
 190                     ; 37       HCS515_SCL_LOW;
 192  0047 7217500a      	bres	20490,#3
 193                     ; 38       DELAY_US(50);
 195  004b ae0080        	ldw	x,#128
 197  004e               L41:
 198  004e 5a            	decw	X
 199  004f 26fd          	jrne	L41
 200  0051 9d            	nop	
 202                     ; 39       mask <<= 1;
 205  0052 0803          	sll	(OFST+0,sp)
 206                     ; 32     for(i = 0, mask = 0x01; i < 8; i++)
 208  0054 0c02          	inc	(OFST-1,sp)
 211  0056 7b02          	ld	a,(OFST-1,sp)
 212  0058 a108          	cp	a,#8
 213  005a 25d5          	jrult	L17
 214                     ; 41     delay_ms(1);    //wait TRD Decoder EEPROM Read Time min 1ms, max 2ms
 216  005c ae0001        	ldw	x,#1
 217  005f cd0000        	call	_delay_ms
 219                     ; 29   for(j = 0; j < num_bytes; j++, data++)
 221  0062 0c01          	inc	(OFST-2,sp)
 222  0064 1e04          	ldw	x,(OFST+1,sp)
 223  0066 5c            	incw	x
 224  0067 1f04          	ldw	(OFST+1,sp),x
 225  0069               L56:
 228  0069 7b01          	ld	a,(OFST-2,sp)
 229  006b 1109          	cp	a,(OFST+6,sp)
 230  006d 25b9          	jrult	L16
 231                     ; 44   return TRUE;
 233  006f a601          	ld	a,#1
 235  0071               L02:
 237  0071 5b05          	addw	sp,#5
 238  0073 81            	ret	
 326                     ; 47 _Bool HCS515_EEpromWrite(u8* data, u8 address, u8 num_bytes)
 326                     ; 48 {
 327                     .text:	section	.text,new
 328  0000               _HCS515_EEpromWrite:
 330  0000 89            	pushw	x
 331       00000003      OFST:	set	3
 334                     ; 50   cmd[0] = CMD_WRITE;
 336  0001 35e10000      	mov	L3_cmd,#225
 337  0005 5203          	subw	sp,#3
 338                     ; 51   cmd[1] = address;
 340  0007 7b08          	ld	a,(OFST+5,sp)
 341  0009 b701          	ld	L3_cmd+1,a
 342                     ; 53   if(!Send_Command(cmd, 2)) return FALSE;
 344  000b 4b02          	push	#2
 345  000d ae0000        	ldw	x,#L3_cmd
 346  0010 cd0000        	call	L5_Send_Command
 348  0013 5b01          	addw	sp,#1
 349  0015 4d            	tnz	a
 353  0016 2772          	jreq	L26
 354                     ; 56   for(j = 0; j < num_bytes; j++, data++)
 356  0018 0f01          	clr	(OFST-2,sp)
 358  001a cc00be        	jra	L151
 359  001d               L541:
 360                     ; 58     HCS515_SDA_OUT;
 362  001d 72165002      	bset	20482,#3
 363                     ; 59     for(i = 0, mask = 0x01; i < 8; i++)
 365  0021 0f02          	clr	(OFST-1,sp)
 366  0023 a601          	ld	a,#1
 367  0025 6b03          	ld	(OFST+0,sp),a
 368  0027               L551:
 369                     ; 61       HCS515_SCL_HIGH;
 371  0027 7216500a      	bset	20490,#3
 372                     ; 62       if(*data & mask) HCS515_SDA_HIGH;
 374  002b 1e04          	ldw	x,(OFST+1,sp)
 375  002d f6            	ld	a,(x)
 376  002e 1503          	bcp	a,(OFST+0,sp)
 377  0030 2706          	jreq	L361
 380  0032 72165000      	bset	20480,#3
 382  0036 2004          	jra	L561
 383  0038               L361:
 384                     ; 63       else HCS515_SDA_LOW;
 386  0038 72175000      	bres	20480,#3
 387  003c               L561:
 388                     ; 64       DELAY_US(50);
 390  003c ae0080        	ldw	x,#128
 392  003f               L62:
 393  003f 5a            	decw	X
 394  0040 26fd          	jrne	L62
 395  0042 9d            	nop	
 397                     ; 65       HCS515_SCL_LOW;
 400  0043 7217500a      	bres	20490,#3
 401                     ; 66       DELAY_US(50);
 403  0047 ae0080        	ldw	x,#128
 405  004a               L03:
 406  004a 5a            	decw	X
 407  004b 26fd          	jrne	L03
 408  004d 9d            	nop	
 410                     ; 67       mask <<= 1;
 413  004e 0803          	sll	(OFST+0,sp)
 414                     ; 59     for(i = 0, mask = 0x01; i < 8; i++)
 416  0050 0c02          	inc	(OFST-1,sp)
 419  0052 7b02          	ld	a,(OFST-1,sp)
 420  0054 a108          	cp	a,#8
 421  0056 25cf          	jrult	L551
 422                     ; 69     DELAY_US(50);  //wait TWR min 20us, max 1000us
 424  0058 ae0080        	ldw	x,#128
 426  005b               L23:
 427  005b 5a            	decw	X
 428  005c 26fd          	jrne	L23
 429  005e 9d            	nop	
 431                     ; 70     HCS515_SCL_HIGH;
 434  005f 7216500a      	bset	20490,#3
 435                     ; 71     HCS515_SDA_IN;
 437  0063 72175002      	bres	20482,#3
 438                     ; 72     DELAY_US(50);
 440  0067 ae0080        	ldw	x,#128
 442  006a               L43:
 443  006a 5a            	decw	X
 444  006b 26fd          	jrne	L43
 445  006d 9d            	nop	
 447                     ; 73     Timeout_SetTimeout1(20);                             //Set timeout1 to 20ms
 450  006e ae0014        	ldw	x,#20
 451  0071 cd0000        	call	_Timeout_SetTimeout1
 454  0074               L171:
 455                     ; 74     while(HCS515_SDA_STATE_LOW && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TACK EEPROM write acknowledge time - max 10ms
 457  0074 7206500106    	btjt	20481,#3,L571
 459  0079 cd0000        	call	_Timeout_IsTimeout1
 461  007c 4d            	tnz	a
 462  007d 27f5          	jreq	L171
 463  007f               L571:
 464                     ; 75     if(Timeout_IsTimeout1()) 
 466  007f cd0000        	call	_Timeout_IsTimeout1
 468  0082 4d            	tnz	a
 469  0083 2708          	jreq	L771
 470                     ; 77       Errors_SetError(ERROR_HCS515_ACK_TOUT);             //HCS aknowledge timeout error
 473                     ; 78       return FALSE;
 475  0085               LC001:
 477  0085 4f            	clr	a
 478  0086 cd0000        	call	_Errors_SetError
 480  0089 4f            	clr	a
 482  008a               L26:
 484  008a 5b05          	addw	sp,#5
 485  008c 81            	ret	
 486  008d               L771:
 487                     ; 80     else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
 489  008d cd0000        	call	_Errors_ResetError
 491                     ; 81     DELAY_US(50);   //wait TRESP Microcontroller acknowledge response time - min 20us, max 1000us
 493  0090 ae0080        	ldw	x,#128
 495  0093               L05:
 496  0093 5a            	decw	X
 497  0094 26fd          	jrne	L05
 498  0096 9d            	nop	
 500                     ; 82     HCS515_SCL_LOW;
 503  0097 7217500a      	bres	20490,#3
 504                     ; 83     Timeout_SetTimeout1(10);
 506  009b ae000a        	ldw	x,#10
 507  009e cd0000        	call	_Timeout_SetTimeout1
 510  00a1               L502:
 511                     ; 84     while(HCS515_SDA_STATE_HIGH && !Timeout_IsTimeout1());   //wait for HCS aknowledge, TACK2 Decoder response acknowledge time - max 10us
 513  00a1 7207500106    	btjf	20481,#3,L112
 515  00a6 cd0000        	call	_Timeout_IsTimeout1
 517  00a9 4d            	tnz	a
 518  00aa 27f5          	jreq	L502
 519  00ac               L112:
 520                     ; 85     if(HCS515_SDA_STATE_HIGH) 
 522  00ac 7207500102    	btjf	20481,#3,L312
 523                     ; 87       Errors_SetError(ERROR_HCS515_ACK_TOUT);             //HCS aknowledge timeout error
 525                     ; 88       return FALSE;
 527  00b1 20d2          	jp	LC001
 528  00b3               L312:
 529                     ; 90     else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
 531  00b3 4f            	clr	a
 532  00b4 cd0000        	call	_Errors_ResetError
 534                     ; 56   for(j = 0; j < num_bytes; j++, data++)
 536  00b7 0c01          	inc	(OFST-2,sp)
 537  00b9 1e04          	ldw	x,(OFST+1,sp)
 538  00bb 5c            	incw	x
 539  00bc 1f04          	ldw	(OFST+1,sp),x
 540  00be               L151:
 543  00be 7b01          	ld	a,(OFST-2,sp)
 544  00c0 1109          	cp	a,(OFST+6,sp)
 545  00c2 2403cc001d    	jrult	L541
 546                     ; 92   HCS515_SDA_IN;
 548  00c7 72175002      	bres	20482,#3
 549                     ; 93   return TRUE;
 551  00cb a601          	ld	a,#1
 553  00cd 20bb          	jra	L26
 624                     ; 96 _Bool HCS515_Program(u8* data)
 624                     ; 97 {
 625                     .text:	section	.text,new
 626  0000               _HCS515_Program:
 628  0000 89            	pushw	x
 629  0001 5203          	subw	sp,#3
 630       00000003      OFST:	set	3
 633                     ; 99   cmd[0] = CMD_PROGRAM;
 635  0003 35b40000      	mov	L3_cmd,#180
 636                     ; 100   cmd[1] = 0x04;   //0x00 - REPEAT BIT=0 (necessary for stand-alone mode), 0x04 - REPEAT BIT=1
 638  0007 35040001      	mov	L3_cmd+1,#4
 639                     ; 102   if(!Send_Command(cmd, 2)) return FALSE;
 641  000b 4b02          	push	#2
 642  000d ae0000        	ldw	x,#L3_cmd
 643  0010 cd0000        	call	L5_Send_Command
 645  0013 5b01          	addw	sp,#1
 646  0015 4d            	tnz	a
 650  0016 2777          	jreq	L031
 651                     ; 104   for(j = 0; j < 8; j++, data++)
 653  0018 0f01          	clr	(OFST-2,sp)
 654  001a               L352:
 655                     ; 106     for(i = 0, mask8 = 0x01; i < 8; i++)
 657  001a 0f02          	clr	(OFST-1,sp)
 658  001c a601          	ld	a,#1
 659  001e 6b03          	ld	(OFST+0,sp),a
 660  0020               L162:
 661                     ; 108       HCS515_SCL_HIGH;
 663  0020 7216500a      	bset	20490,#3
 664                     ; 109       if(*data & mask8) HCS515_SDA_HIGH;
 666  0024 1e04          	ldw	x,(OFST+1,sp)
 667  0026 f6            	ld	a,(x)
 668  0027 1503          	bcp	a,(OFST+0,sp)
 669  0029 2706          	jreq	L762
 672  002b 72165000      	bset	20480,#3
 674  002f 2004          	jra	L172
 675  0031               L762:
 676                     ; 110       else HCS515_SDA_LOW;
 678  0031 72175000      	bres	20480,#3
 679  0035               L172:
 680                     ; 111       DELAY_US(50);            //wait TCLKH Clock high time - min 20us, max 1000us
 682  0035 ae0080        	ldw	x,#128
 684  0038               L07:
 685  0038 5a            	decw	X
 686  0039 26fd          	jrne	L07
 687  003b 9d            	nop	
 689                     ; 112       HCS515_SCL_LOW;
 692  003c 7217500a      	bres	20490,#3
 693                     ; 113       DELAY_US(50);            //wait TCLKL Clock low time - min 20us, max 1000us
 695  0040 ae0080        	ldw	x,#128
 697  0043               L27:
 698  0043 5a            	decw	X
 699  0044 26fd          	jrne	L27
 700  0046 9d            	nop	
 702                     ; 114       mask8 <<= 1;
 705  0047 0803          	sll	(OFST+0,sp)
 706                     ; 106     for(i = 0, mask8 = 0x01; i < 8; i++)
 708  0049 0c02          	inc	(OFST-1,sp)
 711  004b 7b02          	ld	a,(OFST-1,sp)
 712  004d a108          	cp	a,#8
 713  004f 25cf          	jrult	L162
 714                     ; 116     DELAY_US(100);          //wait TDATA, min 10us, max 1000us
 716  0051 ae0100        	ldw	x,#256
 718  0054               L47:
 719  0054 5a            	decw	X
 720  0055 26fd          	jrne	L47
 721  0057 9d            	nop	
 723                     ; 104   for(j = 0; j < 8; j++, data++)
 726  0058 0c01          	inc	(OFST-2,sp)
 727  005a 1e04          	ldw	x,(OFST+1,sp)
 728  005c 5c            	incw	x
 729  005d 1f04          	ldw	(OFST+1,sp),x
 732  005f 7b01          	ld	a,(OFST-2,sp)
 733  0061 a108          	cp	a,#8
 734  0063 25b5          	jrult	L352
 735                     ; 118   HCS515_SCL_HIGH;
 737  0065 7216500a      	bset	20490,#3
 738                     ; 119   HCS515_SDA_IN;
 740  0069 72175002      	bres	20482,#3
 741                     ; 120   DELAY_US(20);                //wait for HCS to pull-down SDA line
 743  006d ae0033        	ldw	x,#51
 745  0070               L67:
 746  0070 5a            	decw	X
 747  0071 26fd          	jrne	L67
 748  0073 9d            	nop	
 750                     ; 121   Timeout_SetTimeout1(250);     //set timeout to 250ms
 753  0074 ae00fa        	ldw	x,#250
 754  0077 cd0000        	call	_Timeout_SetTimeout1
 757  007a               L572:
 758                     ; 122   while(HCS515_SDA_STATE_LOW && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TACK 30-240ms
 760  007a 7206500106    	btjt	20481,#3,L103
 762  007f cd0000        	call	_Timeout_IsTimeout1
 764  0082 4d            	tnz	a
 765  0083 27f5          	jreq	L572
 766  0085               L103:
 767                     ; 123   if(HCS515_SDA_STATE_LOW) 
 769  0085 7206500108    	btjt	20481,#3,L303
 770                     ; 125     Errors_SetError(ERROR_HCS515_ACK_TOUT);        //HCS aknowledge timeout error
 773                     ; 126     return FALSE;
 775  008a               LC002:
 777  008a 4f            	clr	a
 778  008b cd0000        	call	_Errors_SetError
 780  008e 4f            	clr	a
 782  008f               L031:
 784  008f 5b05          	addw	sp,#5
 785  0091 81            	ret	
 786  0092               L303:
 787                     ; 130     if(Timeout_GetTimeout1() < 28)
 789  0092 cd0000        	call	_Timeout_GetTimeout1
 791  0095 a3001c        	cpw	x,#28
 792  0098 a603          	ld	a,#3
 793  009a 2405          	jruge	L703
 794                     ; 132       Errors_SetError(ERROR_HCS515_PROGRAMMING);
 796  009c cd0000        	call	_Errors_SetError
 799  009f 2003          	jra	L113
 800  00a1               L703:
 801                     ; 134     else Errors_ResetError(ERROR_HCS515_PROGRAMMING);
 803  00a1 cd0000        	call	_Errors_ResetError
 805  00a4               L113:
 806                     ; 135     Errors_ResetError(ERROR_HCS515_ACK_TOUT);
 808  00a4 4f            	clr	a
 809  00a5 cd0000        	call	_Errors_ResetError
 811                     ; 137   DELAY_US(100);                                        //wait TWTH, min 20us, max 1000us
 813  00a8 ae0100        	ldw	x,#256
 815  00ab               L611:
 816  00ab 5a            	decw	X
 817  00ac 26fd          	jrne	L611
 818  00ae 9d            	nop	
 820                     ; 138   HCS515_SCL_LOW;
 823  00af 7217500a      	bres	20490,#3
 824                     ; 139   Timeout_SetTimeout1(10);                               //set timeout to 10ms
 826  00b3 ae000a        	ldw	x,#10
 827  00b6 cd0000        	call	_Timeout_SetTimeout1
 830  00b9               L513:
 831                     ; 140   while(HCS515_SDA_STATE_HIGH && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TWTL
 833  00b9 7207500106    	btjf	20481,#3,L123
 835  00be cd0000        	call	_Timeout_IsTimeout1
 837  00c1 4d            	tnz	a
 838  00c2 27f5          	jreq	L513
 839  00c4               L123:
 840                     ; 141   if(HCS515_SDA_STATE_HIGH) 
 842  00c4 7207500102    	btjf	20481,#3,L323
 843                     ; 143     Errors_SetError(ERROR_HCS515_ACK_TOUT);        //HCS aknowledge timeout error
 845                     ; 144     return FALSE;
 847  00c9 20bf          	jp	LC002
 848  00cb               L323:
 849                     ; 146   else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
 851  00cb 4f            	clr	a
 852  00cc cd0000        	call	_Errors_ResetError
 854                     ; 147   return TRUE;
 856  00cf a601          	ld	a,#1
 858  00d1 20bc          	jra	L031
 937                     ; 160 _Bool HCS515_Learn(u8* data, u8 len)
 937                     ; 161 {
 938                     .text:	section	.text,new
 939  0000               _HCS515_Learn:
 941  0000 89            	pushw	x
 942  0001 5203          	subw	sp,#3
 943       00000003      OFST:	set	3
 946                     ; 164   cmd[0] = CMD_ACTIVATE_LRN;
 948  0003 35d20000      	mov	L3_cmd,#210
 949                     ; 165   cmd[1] = DUMMY_BYTE;
 951  0007 3f01          	clr	L3_cmd+1
 952                     ; 166   cmd[2] = DUMMY_BYTE;
 954  0009 3f02          	clr	L3_cmd+2
 955                     ; 168   if(!Send_Command(cmd, 3)) return FALSE;
 957  000b 4b03          	push	#3
 958  000d ae0000        	ldw	x,#L3_cmd
 959  0010 cd0000        	call	L5_Send_Command
 961  0013 5b01          	addw	sp,#1
 962  0015 4d            	tnz	a
 966  0016 2731          	jreq	L442
 967                     ; 170   DELAY_US(50);  //delay TLRN - min 20us, max 1ms
 969  0018 ae0080        	ldw	x,#128
 971  001b               L631:
 972  001b 5a            	decw	X
 973  001c 26fd          	jrne	L631
 974  001e 9d            	nop	
 976                     ; 171   HCS515_SDA_IN;
 979  001f 72175002      	bres	20482,#3
 980                     ; 172   HCS515_SCL_HIGH;
 982  0023 7216500a      	bset	20490,#3
 983                     ; 173   DELAY_US(50);    //give time to decoder to pull down SDA line
 985  0027 ae0080        	ldw	x,#128
 987  002a               L041:
 988  002a 5a            	decw	X
 989  002b 26fd          	jrne	L041
 990  002d 9d            	nop	
 992                     ; 174   Timeout_SetTimeout1(10);   //Set timeout1 to 10ms
 995  002e ae000a        	ldw	x,#10
 996  0031 cd0000        	call	_Timeout_SetTimeout1
 999  0034               L173:
1000                     ; 175   while(HCS515_SDA_STATE_LOW && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TACK, max 20us
1002  0034 7206500106    	btjt	20481,#3,L573
1004  0039 cd0000        	call	_Timeout_IsTimeout1
1006  003c 4d            	tnz	a
1007  003d 27f5          	jreq	L173
1008  003f               L573:
1009                     ; 176   if(HCS515_SDA_STATE_LOW) 
1011  003f 7206500108    	btjt	20481,#3,L773
1012                     ; 178     Errors_SetError(ERROR_HCS515_ACK_TOUT);        //HCS aknowledge timeout error
1014  0044               LC004:
1018  0044 4f            	clr	a
1020                     ; 179     return FALSE;
1022  0045               LC003:
1023  0045 cd0000        	call	_Errors_SetError
1029  0048 4f            	clr	a
1031  0049               L442:
1033  0049 5b05          	addw	sp,#5
1034  004b 81            	ret	
1035  004c               L773:
1036                     ; 181   else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
1038  004c 4f            	clr	a
1039  004d cd0000        	call	_Errors_ResetError
1041                     ; 183   DELAY_US(50);  //delay TRESP Microcontroller acknowledge response time - min 20us, max 1ms
1043  0050 ae0080        	ldw	x,#128
1045  0053               L251:
1046  0053 5a            	decw	X
1047  0054 26fd          	jrne	L251
1048  0056 9d            	nop	
1050                     ; 184   HCS515_SCL_LOW;
1053  0057 7217500a      	bres	20490,#3
1054                     ; 185   Timeout_SetTimeout1(10);   //Set timeout1 to 10ms
1056  005b ae000a        	ldw	x,#10
1057  005e cd0000        	call	_Timeout_SetTimeout1
1060  0061               L504:
1061                     ; 186   while(HCS515_SDA_STATE_HIGH && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TACK2, max 10us
1063  0061 7207500106    	btjf	20481,#3,L114
1065  0066 cd0000        	call	_Timeout_IsTimeout1
1067  0069 4d            	tnz	a
1068  006a 27f5          	jreq	L504
1069  006c               L114:
1070                     ; 187   if(HCS515_SDA_STATE_HIGH) 
1072  006c 7207500102    	btjf	20481,#3,L314
1073                     ; 189     Errors_SetError(ERROR_HCS515_ACK_TOUT);        //HCS aknowledge timeout error
1075                     ; 190     return FALSE;
1077  0071 20d1          	jp	LC004
1078  0073               L314:
1079                     ; 192   else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
1081  0073 cd0152        	call	LC005
1083                     ; 201   Timeout_SetTimeout1(10000);   //Set timeout1 to 10s
1084  0076               L124:
1085                     ; 202   while(HCS515_SDA_STATE_LOW && !Timeout_IsTimeout1()); //wait for HCS aknowledge
1087  0076 7206500106    	btjt	20481,#3,L524
1089  007b cd0000        	call	_Timeout_IsTimeout1
1091  007e 4d            	tnz	a
1092  007f 27f5          	jreq	L124
1093  0081               L524:
1094                     ; 203   if(Timeout_IsTimeout1()) 
1096  0081 cd0000        	call	_Timeout_IsTimeout1
1098  0084 4d            	tnz	a
1099  0085 2704          	jreq	L724
1100                     ; 205     Errors_SetError(ERROR_HCS515_TRANS1_ACK_TOUT);        //Learn - user first transmission timeout
1102  0087 a601          	ld	a,#1
1104                     ; 206     return FALSE;
1106  0089 20ba          	jp	LC003
1107  008b               L724:
1108                     ; 208   else Errors_ResetError(ERROR_HCS515_TRANS1_ACK_TOUT);
1110  008b 4c            	inc	a
1111  008c cd0000        	call	_Errors_ResetError
1113                     ; 210   DELAY_US(20);  //wait TCLA Microcontroller command request time - min 5us, max 500ms
1115  008f ae0033        	ldw	x,#51
1117  0092               L671:
1118  0092 5a            	decw	X
1119  0093 26fd          	jrne	L671
1120  0095 9d            	nop	
1122                     ; 212   Timeout_SetTimeout1(100);   //Set timeout1 to 100ms
1125  0096 ae0064        	ldw	x,#100
1126  0099 cd0000        	call	_Timeout_SetTimeout1
1129  009c               L534:
1130                     ; 213   while(HCS515_SDA_STATE_HIGH && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TACT Decoder request acknowledge time - max 10us
1132  009c 7207500106    	btjf	20481,#3,L144
1134  00a1 cd0000        	call	_Timeout_IsTimeout1
1136  00a4 4d            	tnz	a
1137  00a5 27f5          	jreq	L534
1138  00a7               L144:
1139                     ; 214   if(HCS515_SDA_STATE_HIGH) 
1141  00a7 7207500102    	btjf	20481,#3,L344
1142                     ; 216     Errors_SetError(ERROR_HCS515_ACK_TOUT);        //HCS aknowledge timeout error
1144                     ; 217     return FALSE;
1146  00ac 2096          	jp	LC004
1147  00ae               L344:
1148                     ; 219   else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
1150  00ae cd0152        	call	LC005
1152                     ; 244   Timeout_SetTimeout1(10000);   //Set timeout1 to 10s
1153  00b1               L154:
1154                     ; 245   while(HCS515_SDA_STATE_LOW && !Timeout_IsTimeout1()); //wait for HCS aknowledge
1156  00b1 7206500106    	btjt	20481,#3,L554
1158  00b6 cd0000        	call	_Timeout_IsTimeout1
1160  00b9 4d            	tnz	a
1161  00ba 27f5          	jreq	L154
1162  00bc               L554:
1163                     ; 246   if(Timeout_IsTimeout1()) 
1165  00bc cd0000        	call	_Timeout_IsTimeout1
1167  00bf 4d            	tnz	a
1168  00c0 2705          	jreq	L754
1169                     ; 248     Errors_SetError(ERROR_HCS515_TRANS2_ACK_TOUT);        //HCS aknowledge timeout error
1171  00c2 a602          	ld	a,#2
1173                     ; 249     return FALSE;
1175  00c4 cc0045        	jp	LC003
1176  00c7               L754:
1177                     ; 251   else Errors_ResetError(ERROR_HCS515_TRANS2_ACK_TOUT);
1179  00c7 a602          	ld	a,#2
1180  00c9 cd0000        	call	_Errors_ResetError
1182                     ; 253   DELAY_US(80);  //wait TCLA Microcontroller command request time - min 5us, max 500ms
1184  00cc ae00cc        	ldw	x,#204
1186  00cf               L222:
1187  00cf 5a            	decw	X
1188  00d0 26fd          	jrne	L222
1189  00d2 9d            	nop	
1191                     ; 254   HCS515_SCL_HIGH;
1194  00d3 7216500a      	bset	20490,#3
1195                     ; 255   Timeout_SetTimeout1(100);   //Set timeout1 to 100ms
1197  00d7 ae0064        	ldw	x,#100
1198  00da cd0000        	call	_Timeout_SetTimeout1
1201  00dd               L564:
1202                     ; 256   while(HCS515_SDA_STATE_HIGH && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TACT Decoder request acknowledge time - max 10us
1204  00dd 7207500106    	btjf	20481,#3,L174
1206  00e2 cd0000        	call	_Timeout_IsTimeout1
1208  00e5 4d            	tnz	a
1209  00e6 27f5          	jreq	L564
1210  00e8               L174:
1211                     ; 257   if(HCS515_SDA_STATE_HIGH) 
1213  00e8 7207500103    	btjf	20481,#3,L374
1214                     ; 259     Errors_SetError(ERROR_HCS515_ACK_TOUT);        //HCS aknowledge timeout error
1216                     ; 260     return FALSE;
1218  00ed cc0044        	jp	LC004
1219  00f0               L374:
1220                     ; 262   else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
1222  00f0 4f            	clr	a
1223  00f1 cd0000        	call	_Errors_ResetError
1225                     ; 264   DELAY_US(40);  //wait TCLH Clock high hold time - max 1.2ms
1227  00f4 ae0066        	ldw	x,#102
1229  00f7               L432:
1230  00f7 5a            	decw	X
1231  00f8 26fd          	jrne	L432
1232  00fa 9d            	nop	
1234                     ; 265   HCS515_SCL_LOW;
1237  00fb 7217500a      	bres	20490,#3
1238                     ; 266   DELAY_US(40);  //wait TCLL Clock low hold time - min 20us, max 1.2ms
1240  00ff ae0066        	ldw	x,#102
1242  0102               L632:
1243  0102 5a            	decw	X
1244  0103 26fd          	jrne	L632
1245  0105 9d            	nop	
1247                     ; 269   for(j = 0; j < len; j++, data++)
1250  0106 0f01          	clr	(OFST-2,sp)
1252  0108 203d          	jra	L305
1253  010a               L774:
1254                     ; 271     for(i = 0, mask8 = 0x01, *data = 0; i < 8; i++)  //clock out learn status bits (16 bits) LSB first
1256  010a 0f02          	clr	(OFST-1,sp)
1257  010c a601          	ld	a,#1
1258  010e 6b03          	ld	(OFST+0,sp),a
1259  0110 1e04          	ldw	x,(OFST+1,sp)
1260  0112 7f            	clr	(x)
1262  0113 2025          	jra	L315
1263  0115               L705:
1264                     ; 273       HCS515_SCL_HIGH;
1266  0115 7216500a      	bset	20490,#3
1267                     ; 274       DELAY_US(50);       //wait TCLKH Clock high time - min 20us, max 1000us
1269  0119 ae0080        	ldw	x,#128
1271  011c               L042:
1272  011c 5a            	decw	X
1273  011d 26fd          	jrne	L042
1274  011f 9d            	nop	
1276                     ; 275       if(HCS515_SDA_STATE_HIGH) *data |= mask8;
1279  0120 7207500106    	btjf	20481,#3,L715
1282  0125 1e04          	ldw	x,(OFST+1,sp)
1283  0127 f6            	ld	a,(x)
1284  0128 1a03          	or	a,(OFST+0,sp)
1285  012a f7            	ld	(x),a
1286  012b               L715:
1287                     ; 276       HCS515_SCL_LOW;
1289  012b 7217500a      	bres	20490,#3
1290                     ; 277       DELAY_US(50);       //wait TCLKL Clock low time - min 20us, max 1000us
1292  012f ae0080        	ldw	x,#128
1294  0132               L242:
1295  0132 5a            	decw	X
1296  0133 26fd          	jrne	L242
1297  0135 9d            	nop	
1299                     ; 278       mask8 <<= 1;
1302  0136 0803          	sll	(OFST+0,sp)
1303                     ; 271     for(i = 0, mask8 = 0x01, *data = 0; i < 8; i++)  //clock out learn status bits (16 bits) LSB first
1305  0138 0c02          	inc	(OFST-1,sp)
1306  013a               L315:
1309  013a 7b02          	ld	a,(OFST-1,sp)
1310  013c a108          	cp	a,#8
1311  013e 25d5          	jrult	L705
1312                     ; 269   for(j = 0; j < len; j++, data++)
1314  0140 0c01          	inc	(OFST-2,sp)
1315  0142 1e04          	ldw	x,(OFST+1,sp)
1316  0144 5c            	incw	x
1317  0145 1f04          	ldw	(OFST+1,sp),x
1318  0147               L305:
1321  0147 7b01          	ld	a,(OFST-2,sp)
1322  0149 1108          	cp	a,(OFST+5,sp)
1323  014b 25bd          	jrult	L774
1324                     ; 300   return TRUE;
1326  014d a601          	ld	a,#1
1328  014f cc0049        	jra	L442
1329  0152               LC005:
1330  0152 4f            	clr	a
1331  0153 cd0000        	call	_Errors_ResetError
1333                     ; 201   Timeout_SetTimeout1(10000);   //Set timeout1 to 10s
1335  0156 ae2710        	ldw	x,#10000
1336  0159 cc0000        	jp	_Timeout_SetTimeout1
1413                     ; 305 _Bool HCS515_ReadMessage(u8* data, u8 len)
1413                     ; 306 {
1414                     .text:	section	.text,new
1415  0000               _HCS515_ReadMessage:
1417  0000 89            	pushw	x
1418  0001 5203          	subw	sp,#3
1419       00000003      OFST:	set	3
1422                     ; 308   DELAY_US(20);                                        //wait TCLA Micro request acknowledge time - min 5us, max 1ms
1424  0003 ae0033        	ldw	x,#51
1426  0006               L052:
1427  0006 5a            	decw	X
1428  0007 26fd          	jrne	L052
1429  0009 9d            	nop	
1431                     ; 309   HCS515_SCL_HIGH;
1434  000a 7216500a      	bset	20490,#3
1435                     ; 310   Timeout_SetTimeout1(10);                               //Set timeout1 to 10ms
1437  000e ae000a        	ldw	x,#10
1438  0011 cd0000        	call	_Timeout_SetTimeout1
1441  0014               L165:
1442                     ; 311   while(HCS515_SDA_STATE_HIGH && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TACK Decoder acknowledge time - max 4us
1444  0014 7207500106    	btjf	20481,#3,L565
1446  0019 cd0000        	call	_Timeout_IsTimeout1
1448  001c 4d            	tnz	a
1449  001d 27f5          	jreq	L165
1450  001f               L565:
1451                     ; 312   if(HCS515_SDA_STATE_HIGH) 
1453  001f 4f            	clr	a
1454  0020 7207500106    	btjf	20481,#3,L765
1455                     ; 314     Errors_SetError(ERROR_HCS515_ACK_TOUT);             //HCS aknowledge timeout error
1457  0025 cd0000        	call	_Errors_SetError
1459                     ; 315     return FALSE;
1461  0028 4f            	clr	a
1463  0029 205e          	jra	L272
1464  002b               L765:
1465                     ; 317   else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
1467  002b cd0000        	call	_Errors_ResetError
1469                     ; 319   DELAY_US(50);  //wait TCLKH Clock high time - min 20us, max 1000us
1471  002e ae0080        	ldw	x,#128
1473  0031               L262:
1474  0031 5a            	decw	X
1475  0032 26fd          	jrne	L262
1476  0034 9d            	nop	
1478                     ; 320   HCS515_SCL_LOW;
1481  0035 7217500a      	bres	20490,#3
1482                     ; 321   DELAY_US(50);  //wait TACT Start command mode to first command bit - min 20us, max 1.2ms
1484  0039 ae0080        	ldw	x,#128
1486  003c               L462:
1487  003c 5a            	decw	X
1488  003d 26fd          	jrne	L462
1489  003f 9d            	nop	
1491                     ; 324   for(j = 0; j < len; j++, data++)
1494  0040 0f01          	clr	(OFST-2,sp)
1496  0042 203d          	jra	L775
1497  0044               L375:
1498                     ; 326     for(i = 0, mask8 = 0x01, *data = 0; i < 8; i++)  //clock out LSB first
1500  0044 0f02          	clr	(OFST-1,sp)
1501  0046 a601          	ld	a,#1
1502  0048 6b03          	ld	(OFST+0,sp),a
1503  004a 1e04          	ldw	x,(OFST+1,sp)
1504  004c 7f            	clr	(x)
1506  004d 2025          	jra	L706
1507  004f               L306:
1508                     ; 328       HCS515_SCL_HIGH;
1510  004f 7216500a      	bset	20490,#3
1511                     ; 329       DELAY_US(50);       //wait TCLKH Clock high time - min 20us, max 1000us
1513  0053 ae0080        	ldw	x,#128
1515  0056               L662:
1516  0056 5a            	decw	X
1517  0057 26fd          	jrne	L662
1518  0059 9d            	nop	
1520                     ; 330       if(HCS515_SDA_STATE_HIGH) *data |= mask8;
1523  005a 7207500106    	btjf	20481,#3,L316
1526  005f 1e04          	ldw	x,(OFST+1,sp)
1527  0061 f6            	ld	a,(x)
1528  0062 1a03          	or	a,(OFST+0,sp)
1529  0064 f7            	ld	(x),a
1530  0065               L316:
1531                     ; 331       HCS515_SCL_LOW;
1533  0065 7217500a      	bres	20490,#3
1534                     ; 332       DELAY_US(50);       //wait TCLKL Clock low time - min 20us, max 1000us
1536  0069 ae0080        	ldw	x,#128
1538  006c               L072:
1539  006c 5a            	decw	X
1540  006d 26fd          	jrne	L072
1541  006f 9d            	nop	
1543                     ; 333       mask8 <<= 1;
1546  0070 0803          	sll	(OFST+0,sp)
1547                     ; 326     for(i = 0, mask8 = 0x01, *data = 0; i < 8; i++)  //clock out LSB first
1549  0072 0c02          	inc	(OFST-1,sp)
1550  0074               L706:
1553  0074 7b02          	ld	a,(OFST-1,sp)
1554  0076 a108          	cp	a,#8
1555  0078 25d5          	jrult	L306
1556                     ; 324   for(j = 0; j < len; j++, data++)
1558  007a 0c01          	inc	(OFST-2,sp)
1559  007c 1e04          	ldw	x,(OFST+1,sp)
1560  007e 5c            	incw	x
1561  007f 1f04          	ldw	(OFST+1,sp),x
1562  0081               L775:
1565  0081 7b01          	ld	a,(OFST-2,sp)
1566  0083 1108          	cp	a,(OFST+5,sp)
1567  0085 25bd          	jrult	L375
1568                     ; 336   return TRUE;
1570  0087 a601          	ld	a,#1
1572  0089               L272:
1574  0089 5b05          	addw	sp,#5
1575  008b 81            	ret	
1618                     ; 339 _Bool HCS515_Cmd_EraseAll(u8 subcmd)
1618                     ; 340 {
1619                     .text:	section	.text,new
1620  0000               _HCS515_Cmd_EraseAll:
1624                     ; 341   cmd[0] = CMD_ERASE_ALL;
1626  0000 35c30000      	mov	L3_cmd,#195
1627                     ; 342   cmd[1] = subcmd;      //0x00 - Erase all transmitters, 0x01 - Erase all transmitters except the first transmitter in memory
1629  0004 b701          	ld	L3_cmd+1,a
1630                     ; 343   cmd[2] = DUMMY_BYTE;
1632  0006 3f02          	clr	L3_cmd+2
1633                     ; 345   if(!Send_Command(cmd, 3)) return FALSE;
1635  0008 4b03          	push	#3
1636  000a ae0000        	ldw	x,#L3_cmd
1637  000d cd0000        	call	L5_Send_Command
1639  0010 5b01          	addw	sp,#1
1640  0012 4d            	tnz	a
1641  0013 2601          	jrne	L336
1646  0015 81            	ret	
1647  0016               L336:
1648                     ; 347   DELAY_US(50);  //wait at least TERA Learn command activation time - min 20us, max 1ms, error in datasheet ?
1650  0016 ae0080        	ldw	x,#128
1652  0019               L003:
1653  0019 5a            	decw	X
1654  001a 26fd          	jrne	L003
1655  001c 9d            	nop	
1657                     ; 348   HCS515_SDA_IN;
1660  001d 72175002      	bres	20482,#3
1661                     ; 349   HCS515_SCL_HIGH;
1663  0021 7216500a      	bset	20490,#3
1664                     ; 350   DELAY_US(20);    //wait 20us for SDA line to be pulled down
1666  0025 ae0033        	ldw	x,#51
1668  0028               L203:
1669  0028 5a            	decw	X
1670  0029 26fd          	jrne	L203
1671  002b 9d            	nop	
1673                     ; 351   Timeout_SetTimeout1(250);   //Set timeout1 to 250ms
1676  002c ae00fa        	ldw	x,#250
1677  002f cd0000        	call	_Timeout_SetTimeout1
1680  0032               L736:
1681                     ; 352   while(HCS515_SDA_STATE_LOW && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TACK Decoder acknowledge time - min 20us, max 210ms
1683  0032 7206500106    	btjt	20481,#3,L346
1685  0037 cd0000        	call	_Timeout_IsTimeout1
1687  003a 4d            	tnz	a
1688  003b 27f5          	jreq	L736
1689  003d               L346:
1690                     ; 353   if(HCS515_SDA_STATE_LOW) 
1692  003d 4f            	clr	a
1693  003e 7206500105    	btjt	20481,#3,L546
1694                     ; 355     Errors_SetError(ERROR_HCS515_ACK_TOUT);             //HCS aknowledge timeout error
1696  0043 cd0000        	call	_Errors_SetError
1698                     ; 356     return FALSE;
1700  0046 4f            	clr	a
1703  0047 81            	ret	
1704  0048               L546:
1705                     ; 358   else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
1707  0048 cd0000        	call	_Errors_ResetError
1709                     ; 360   DELAY_US(40);                                         //wait TRESP Microcontroller acknowledge response time - min 20us, max 1ms
1711  004b ae0066        	ldw	x,#102
1713  004e               L413:
1714  004e 5a            	decw	X
1715  004f 26fd          	jrne	L413
1716  0051 9d            	nop	
1718                     ; 361   HCS515_SCL_LOW;
1721  0052 7217500a      	bres	20490,#3
1722                     ; 362   Timeout_SetTimeout1(10);                                //Set timeout1 to 10ms
1724  0056 ae000a        	ldw	x,#10
1725  0059 cd0000        	call	_Timeout_SetTimeout1
1728  005c               L356:
1729                     ; 363   while(HCS515_SDA_STATE_HIGH && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TACK2 Decoder data line low - max 10us
1731  005c 7207500106    	btjf	20481,#3,L756
1733  0061 cd0000        	call	_Timeout_IsTimeout1
1735  0064 4d            	tnz	a
1736  0065 27f5          	jreq	L356
1737  0067               L756:
1738                     ; 364   if(HCS515_SDA_STATE_HIGH) 
1740  0067 4f            	clr	a
1741  0068 7207500105    	btjf	20481,#3,L166
1742                     ; 366     Errors_SetError(ERROR_HCS515_ACK_TOUT);              //HCS aknowledge timeout error
1744  006d cd0000        	call	_Errors_SetError
1746                     ; 367     return FALSE;
1748  0070 4f            	clr	a
1751  0071 81            	ret	
1752  0072               L166:
1753                     ; 369   else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
1755  0072 cd0000        	call	_Errors_ResetError
1757                     ; 370   return TRUE;
1759  0075 a601          	ld	a,#1
1762  0077 81            	ret	
1839                     ; 373 static _Bool Send_Command(u8* data, u8 len)
1839                     ; 374 {
1840                     .text:	section	.text,new
1841  0000               L5_Send_Command:
1843  0000 89            	pushw	x
1844  0001 5203          	subw	sp,#3
1845       00000003      OFST:	set	3
1848                     ; 377   HCS515_SDA_IN;
1850  0003 72175002      	bres	20482,#3
1851                     ; 378   HCS515_SCL_HIGH;
1853  0007 7216500a      	bset	20490,#3
1854                     ; 379   DELAY_US(20);                                        //wait for the SDA line to be pulled down
1856  000b ae0033        	ldw	x,#51
1858  000e               L033:
1859  000e 5a            	decw	X
1860  000f 26fd          	jrne	L033
1861  0011 9d            	nop	
1863                     ; 380   Timeout_SetTimeout1(520);                             //Set timeout1 to 520ms
1866  0012 ae0208        	ldw	x,#520
1867  0015 cd0000        	call	_Timeout_SetTimeout1
1870  0018               L527:
1871                     ; 381   while(HCS515_SDA_STATE_LOW && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TREQ Command request time - min 5us, max 500ms
1873  0018 7206500106    	btjt	20481,#3,L137
1875  001d cd0000        	call	_Timeout_IsTimeout1
1877  0020 4d            	tnz	a
1878  0021 27f5          	jreq	L527
1879  0023               L137:
1880                     ; 382   if(Timeout_IsTimeout1())                              //acknowledge time depends on HCS current state: While receiving transmissions: 2.7ms, During validation of a received
1882  0023 cd0000        	call	_Timeout_IsTimeout1
1884  0026 4d            	tnz	a
1885                     ; 385     Errors_SetError(ERROR_HCS515_ACK_TOUT);             //HCS aknowledge timeout error
1887                     ; 386     return FALSE;
1889  0027 2624          	jrne	LC006
1890                     ; 388   else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
1892  0029 cd0000        	call	_Errors_ResetError
1894                     ; 390   DELAY_US(10);                                        //wait TRESP Microcontroller request acknowledge time - max 1ms
1896  002c ae0019        	ldw	x,#25
1898  002f               L443:
1899  002f 5a            	decw	X
1900  0030 26fd          	jrne	L443
1901  0032 9d            	nop	
1903                     ; 391   HCS515_SCL_LOW;
1906  0033 7217500a      	bres	20490,#3
1907                     ; 392   Timeout_SetTimeout1(10);                               //Set timeout1 to 10ms
1909  0037 ae000a        	ldw	x,#10
1910  003a cd0000        	call	_Timeout_SetTimeout1
1913  003d               L147:
1914                     ; 393   while(HCS515_SDA_STATE_HIGH && !Timeout_IsTimeout1()); //wait for HCS aknowledge, TACK Decoder acknowledge time - max 4us
1916  003d 7207500106    	btjf	20481,#3,L547
1918  0042 cd0000        	call	_Timeout_IsTimeout1
1920  0045 4d            	tnz	a
1921  0046 27f5          	jreq	L147
1922  0048               L547:
1923                     ; 394   if(HCS515_SDA_STATE_HIGH) 
1925  0048 7207500108    	btjf	20481,#3,L747
1926                     ; 396     Errors_SetError(ERROR_HCS515_ACK_TOUT);             //HCS aknowledge timeout error
1929                     ; 397     return FALSE;
1931  004d               LC006:
1933  004d 4f            	clr	a
1934  004e cd0000        	call	_Errors_SetError
1936  0051 4f            	clr	a
1938  0052               L463:
1940  0052 5b05          	addw	sp,#5
1941  0054 81            	ret	
1942  0055               L747:
1943                     ; 399   else Errors_ResetError(ERROR_HCS515_ACK_TOUT);
1945  0055 4f            	clr	a
1946  0056 cd0000        	call	_Errors_ResetError
1948                     ; 401   DELAY_US(40);                                        //wait TSTART Start Command mode to first command bit - min 20us, max 1000us
1950  0059 ae0066        	ldw	x,#102
1952  005c               L653:
1953  005c 5a            	decw	X
1954  005d 26fd          	jrne	L653
1955  005f 9d            	nop	
1957                     ; 402   HCS515_SDA_OUT;
1960  0060 72165002      	bset	20482,#3
1961                     ; 407   for(j = 0; j < len; j++, data++)
1963  0064 0f01          	clr	(OFST-2,sp)
1965  0066 203e          	jra	L757
1966  0068               L357:
1967                     ; 409     for(i = 0, mask = 0x01; i < 8; i++)
1969  0068 0f02          	clr	(OFST-1,sp)
1970  006a a601          	ld	a,#1
1971  006c 6b03          	ld	(OFST+0,sp),a
1972  006e               L367:
1973                     ; 411       HCS515_SCL_HIGH;
1975  006e 7216500a      	bset	20490,#3
1976                     ; 412       if(*data & mask) HCS515_SDA_HIGH;
1978  0072 1e04          	ldw	x,(OFST+1,sp)
1979  0074 f6            	ld	a,(x)
1980  0075 1503          	bcp	a,(OFST+0,sp)
1981  0077 2706          	jreq	L177
1984  0079 72165000      	bset	20480,#3
1986  007d 2004          	jra	L377
1987  007f               L177:
1988                     ; 413       else HCS515_SDA_LOW;
1990  007f 72175000      	bres	20480,#3
1991  0083               L377:
1992                     ; 414       DELAY_US(50);            //wait TCLKH Clock high time - min 20us, max 1000us
1994  0083 ae0080        	ldw	x,#128
1996  0086               L063:
1997  0086 5a            	decw	X
1998  0087 26fd          	jrne	L063
1999  0089 9d            	nop	
2001                     ; 415       HCS515_SCL_LOW;
2004  008a 7217500a      	bres	20490,#3
2005                     ; 416       DELAY_US(50);            //wait TCLKL Clock low time - min 20us, max 1000us
2007  008e ae0080        	ldw	x,#128
2009  0091               L263:
2010  0091 5a            	decw	X
2011  0092 26fd          	jrne	L263
2012  0094 9d            	nop	
2014                     ; 417       mask <<= 1;
2017  0095 0803          	sll	(OFST+0,sp)
2018                     ; 409     for(i = 0, mask = 0x01; i < 8; i++)
2020  0097 0c02          	inc	(OFST-1,sp)
2023  0099 7b02          	ld	a,(OFST-1,sp)
2024  009b a108          	cp	a,#8
2025  009d 25cf          	jrult	L367
2026                     ; 407   for(j = 0; j < len; j++, data++)
2028  009f 0c01          	inc	(OFST-2,sp)
2029  00a1 1e04          	ldw	x,(OFST+1,sp)
2030  00a3 5c            	incw	x
2031  00a4 1f04          	ldw	(OFST+1,sp),x
2032  00a6               L757:
2035  00a6 7b01          	ld	a,(OFST-2,sp)
2036  00a8 1108          	cp	a,(OFST+5,sp)
2037  00aa 25bc          	jrult	L357
2038                     ; 420   return TRUE;
2040  00ac a601          	ld	a,#1
2042  00ae 20a2          	jra	L463
2067                     	xdef	_HCS515_Cmd_EraseAll
2068                     	xdef	_HCS515_ReadMessage
2069                     	xdef	_HCS515_Learn
2070                     	xdef	_HCS515_Program
2071                     	xdef	_HCS515_EEpromWrite
2072                     	xdef	_HCS515_EEpromRead
2073                     	switch	.ubsct
2074  0000               L3_cmd:
2075  0000 000000        	ds.b	3
2076                     	xref	_Errors_ResetError
2077                     	xref	_Errors_SetError
2078                     	xref	_Timeout_IsTimeout1
2079                     	xref	_Timeout_GetTimeout1
2080                     	xref	_Timeout_SetTimeout1
2081                     	xref	_delay_ms
2101                     	end
