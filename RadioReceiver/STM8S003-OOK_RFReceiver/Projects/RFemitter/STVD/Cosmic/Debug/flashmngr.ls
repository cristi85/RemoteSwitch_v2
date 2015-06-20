   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.13 - 06 Dec 2012
   3                     ; Generator (Limited) V4.3.9 - 06 Dec 2012
   4                     ; Optimizer V4.3.8 - 06 Dec 2012
  52                     ; 63 u8 FlashMngr_GetStatus()
  52                     ; 64 {
  54                     .text:	section	.text,new
  55  0000               _FlashMngr_GetStatus:
  59                     ; 65   return EXTFLASH_STAT.Status;
  61  0000 b60c          	ld	a,L3_EXTFLASH_STAT
  64  0002 81            	ret	
  89                     ; 68 u8 FlashMngr_GetErrors()
  89                     ; 69 {
  90                     .text:	section	.text,new
  91  0000               _FlashMngr_GetErrors:
  95                     ; 70   return EXTFLASH_ERR.Error;
  97  0000 b60b          	ld	a,L5_EXTFLASH_ERR
 100  0002 81            	ret	
 153                     ; 73 _Bool FlashMngr_Init()
 153                     ; 74 {
 154                     .text:	section	.text,new
 155  0000               _FlashMngr_Init:
 157  0000 89            	pushw	x
 158       00000002      OFST:	set	2
 161                     ; 78   SST25VF016_Init();
 163  0001 cd0000        	call	_SST25VF016_Init
 165                     ; 79   tmpstatus = SST25VF016_Read_Status_Register();
 167  0004 cd0000        	call	_SST25VF016_Read_Status_Register
 169                     ; 80   flash_ptr.adr32b = DATA_STORAGE_BASE;
 171  0007 ae1000        	ldw	x,#4096
 172  000a bf06          	ldw	L31_flash_ptr+2,x
 173  000c 5f            	clrw	x
 174  000d bf04          	ldw	L31_flash_ptr,x
 175                     ; 81   pointer_adr.adr32b = PTR_ARR_BASE;
 177  000f bf02          	ldw	L51_pointer_adr+2,x
 178  0011 bf00          	ldw	L51_pointer_adr,x
 179                     ; 82   DisableMemOP = FALSE;
 181  0013 72110000      	bres	L7_DisableMemOP
 182                     ; 83   tmp = FlashMngr_GetPointer();
 184  0017 cd0000        	call	_FlashMngr_GetPointer
 186  001a 6b02          	ld	(OFST+0,sp),a
 187                     ; 85   SST25VF016_Write_Status_Register(FLASH_UNLOCK_VAL); 
 189  001c 4f            	clr	a
 190  001d cd0000        	call	_SST25VF016_Write_Status_Register
 192                     ; 87   if(SST25VF016_Read_Status_Register() & (STATUS_BP0 | STATUS_BP1 | STATUS_BP2))
 194  0020 cd0000        	call	_SST25VF016_Read_Status_Register
 196  0023 a51c          	bcp	a,#28
 197  0025 2706          	jreq	L76
 198                     ; 89     EXTFLASH_ERR.Error_bits.Memory_Locked_ERR = 1;
 200  0027 721c000b      	bset	L5_EXTFLASH_ERR,#6
 201                     ; 90     return FALSE;
 203  002b 2008          	jp	L42
 204  002d               L76:
 205                     ; 92   return tmp;
 207  002d 7b02          	ld	a,(OFST+0,sp)
 208  002f 2704          	jreq	L42
 209  0031 a601          	ld	a,#1
 210  0033 2001          	jra	L62
 211  0035               L42:
 213  0035 4f            	clr	a
 214  0036               L62:
 217  0036 85            	popw	x
 218  0037 81            	ret	
 325                     ; 98 u32 FlashMngr_ReadPointer(ExtFlashAdr ptr_adr)
 325                     ; 99 {
 326                     .text:	section	.text,new
 327  0000               _FlashMngr_ReadPointer:
 329  0000 5204          	subw	sp,#4
 330       00000004      OFST:	set	4
 333                     ; 101   ptr.adr32b = 0;
 335  0002 5f            	clrw	x
 336  0003 1f03          	ldw	(OFST-1,sp),x
 337  0005 1f01          	ldw	(OFST-3,sp),x
 338                     ; 102   SST25VF016_Read(ptr_adr, buffer, 3);
 340  0007 ae0003        	ldw	x,#3
 341  000a 89            	pushw	x
 342  000b ae0008        	ldw	x,#L11_buffer
 343  000e 89            	pushw	x
 344  000f 7b0e          	ld	a,(OFST+10,sp)
 345  0011 88            	push	a
 346  0012 7b0e          	ld	a,(OFST+10,sp)
 347  0014 88            	push	a
 348  0015 7b0e          	ld	a,(OFST+10,sp)
 349  0017 88            	push	a
 350  0018 7b0e          	ld	a,(OFST+10,sp)
 351  001a 88            	push	a
 352  001b cd0000        	call	_SST25VF016_Read
 354  001e 5b08          	addw	sp,#8
 355                     ; 103   ptr.adr8b.HighByte = buffer[0];
 357  0020 b608          	ld	a,L11_buffer
 358  0022 6b02          	ld	(OFST-2,sp),a
 359                     ; 104   ptr.adr8b.MidByte = buffer[1];
 361  0024 b609          	ld	a,L11_buffer+1
 362  0026 6b03          	ld	(OFST-1,sp),a
 363                     ; 105   ptr.adr8b.LowByte = buffer[2];
 365  0028 b60a          	ld	a,L11_buffer+2
 366  002a 6b04          	ld	(OFST+0,sp),a
 367                     ; 106   return ptr.adr32b;
 369  002c 96            	ldw	x,sp
 370  002d 5c            	incw	x
 371  002e cd0000        	call	c_ltor
 375  0031 5b04          	addw	sp,#4
 376  0033 81            	ret	
 473                     .const:	section	.text
 474  0000               L24:
 475  0000 00200000      	dc.l	2097152
 476  0004               L44:
 477  0004 00ffffff      	dc.l	16777215
 478                     ; 112 _Bool FlashMngr_GetPointer()
 478                     ; 113 {
 479                     .text:	section	.text,new
 480  0000               _FlashMngr_GetPointer:
 482  0000 5213          	subw	sp,#19
 483       00000013      OFST:	set	19
 486                     ; 114   u32 ptr_old, ptr_new = 0;
 488  0002 5f            	clrw	x
 489  0003 1f0e          	ldw	(OFST-5,sp),x
 490  0005 1f0c          	ldw	(OFST-7,sp),x
 491                     ; 116   s16 imin, imid = 0, imax;
 493  0007 1f0a          	ldw	(OFST-9,sp),x
 494                     ; 118   if(EXTFLASH_ERR.Error_bits.Inconsistent_ERR)
 496  0009 7201000b02    	btjf	L5_EXTFLASH_ERR,#0,L702
 497                     ; 120     return FALSE;
 499  000e 2030          	jp	LC002
 500  0010               L702:
 501                     ; 122   tmpadr.adr32b = PTR_ARR_BASE;
 503  0010 1f12          	ldw	(OFST-1,sp),x
 504  0012 1f10          	ldw	(OFST-3,sp),x
 505                     ; 123   ptr_old = FlashMngr_ReadPointer(tmpadr);
 507  0014 7b13          	ld	a,(OFST+0,sp)
 508  0016 88            	push	a
 509  0017 7b13          	ld	a,(OFST+0,sp)
 510  0019 88            	push	a
 511  001a 7b13          	ld	a,(OFST+0,sp)
 512  001c 88            	push	a
 513  001d 7b13          	ld	a,(OFST+0,sp)
 514  001f 88            	push	a
 515  0020 cd0000        	call	_FlashMngr_ReadPointer
 517  0023 5b04          	addw	sp,#4
 518  0025 96            	ldw	x,sp
 519  0026 5c            	incw	x
 520  0027 cd0000        	call	c_rtol
 522                     ; 124   if(INVALID_ADR(ptr_old))
 524  002a 96            	ldw	x,sp
 525  002b 5c            	incw	x
 526  002c cd0171        	call	LC010
 528  002f 2513          	jrult	L112
 530  0031 96            	ldw	x,sp
 531  0032 5c            	incw	x
 532  0033 cd0157        	call	LC008
 534  0036 240c          	jruge	L112
 535                     ; 126     EXTFLASH_ERR.Error_bits.Invalid_FlashPtr_ERR = 1;
 537  0038               LC004:
 539  0038 7214000b      	bset	L5_EXTFLASH_ERR,#2
 540                     ; 127     EXTFLASH_ERR.Error_bits.Inconsistent_ERR = 1;
 542  003c               LC003:
 545  003c 7210000b      	bset	L5_EXTFLASH_ERR,#0
 546                     ; 128     return FALSE;
 548  0040               LC002:
 552  0040 4f            	clr	a
 554  0041               L45:
 556  0041 5b13          	addw	sp,#19
 557  0043 81            	ret	
 558  0044               L112:
 559                     ; 130   if(ptr_old == PTR_ERASED_VAL)
 561  0044 96            	ldw	x,sp
 562  0045 5c            	incw	x
 563  0046 cd0157        	call	LC008
 565  0049 2642          	jrne	L312
 566                     ; 133     tmpadr.adr32b = DATA_STORAGE_BASE;
 568  004b ae1000        	ldw	x,#4096
 569  004e 1f12          	ldw	(OFST-1,sp),x
 570  0050 5f            	clrw	x
 571  0051 1f10          	ldw	(OFST-3,sp),x
 572                     ; 134     for(i = 0; i < TEST_ERASED_BYTES_NUM; i++)
 574  0053 0f05          	clr	(OFST-14,sp)
 575  0055               L512:
 576                     ; 136       if(SST25VF016_Read_Byte(tmpadr) != BYTE_ERASED_VAL) 
 578  0055 7b13          	ld	a,(OFST+0,sp)
 579  0057 88            	push	a
 580  0058 7b13          	ld	a,(OFST+0,sp)
 581  005a 88            	push	a
 582  005b 7b13          	ld	a,(OFST+0,sp)
 583  005d 88            	push	a
 584  005e 7b13          	ld	a,(OFST+0,sp)
 585  0060 88            	push	a
 586  0061 cd0000        	call	_SST25VF016_Read_Byte
 588  0064 5b04          	addw	sp,#4
 589  0066 4c            	inc	a
 590                     ; 138         EXTFLASH_ERR.Error_bits.Inconsistent_ERR = 1;
 591                     ; 139         return FALSE;
 593  0067 26d3          	jrne	LC003
 594                     ; 141       tmpadr.adr32b++;
 596  0069 96            	ldw	x,sp
 597  006a 1c0010        	addw	x,#OFST-3
 598  006d 4c            	inc	a
 599  006e cd0000        	call	c_lgadc
 601                     ; 134     for(i = 0; i < TEST_ERASED_BYTES_NUM; i++)
 603  0071 0c05          	inc	(OFST-14,sp)
 606  0073 7b05          	ld	a,(OFST-14,sp)
 607  0075 a10a          	cp	a,#10
 608  0077 25dc          	jrult	L512
 609                     ; 143     flash_ptr.adr32b = DATA_STORAGE_BASE;
 611  0079 ae1000        	ldw	x,#4096
 612  007c bf06          	ldw	L31_flash_ptr+2,x
 613  007e 5f            	clrw	x
 614  007f bf04          	ldw	L31_flash_ptr,x
 615                     ; 144     pointer_adr.adr32b = PTR_ARR_BASE;
 617  0081 bf02          	ldw	L51_pointer_adr+2,x
 618  0083 bf00          	ldw	L51_pointer_adr,x
 619                     ; 145     EXTFLASH_STAT.Status_bits.FlashPtr_was_Read = 1;
 621  0085               LC006:
 623  0085 7212000c      	bset	L3_EXTFLASH_STAT,#1
 624                     ; 146     return TRUE;
 626  0089               LC005:
 629  0089 a601          	ld	a,#1
 631  008b 20b4          	jra	L45
 632  008d               L312:
 633                     ; 149   imin = 0;
 635  008d 5f            	clrw	x
 636  008e 1f06          	ldw	(OFST-13,sp),x
 637                     ; 150   imax = PTR_ARR_LEN - 1;
 639  0090 ae0554        	ldw	x,#1364
 641  0093 2050          	jp	LC007
 642  0095               L522:
 643                     ; 153     imid = (imin + imax) / 2;
 645  0095 1e06          	ldw	x,(OFST-13,sp)
 646  0097 72fb08        	addw	x,(OFST-11,sp)
 647  009a a602          	ld	a,#2
 648  009c cd0000        	call	c_sdivx
 650  009f 1f0a          	ldw	(OFST-9,sp),x
 651                     ; 154     tmpadr.adr32b = PTR_ARR_BASE + ((imid) * PTR_SIZE);
 653  00a1 90ae0003      	ldw	y,#3
 654  00a5 cd0000        	call	c_imul
 656  00a8 cd0000        	call	c_itolx
 658  00ab 96            	ldw	x,sp
 659  00ac 1c0010        	addw	x,#OFST-3
 660  00af cd0000        	call	c_rtol
 662                     ; 155     ptr_new = FlashMngr_ReadPointer(tmpadr);
 664  00b2 7b13          	ld	a,(OFST+0,sp)
 665  00b4 88            	push	a
 666  00b5 7b13          	ld	a,(OFST+0,sp)
 667  00b7 88            	push	a
 668  00b8 7b13          	ld	a,(OFST+0,sp)
 669  00ba 88            	push	a
 670  00bb 7b13          	ld	a,(OFST+0,sp)
 671  00bd 88            	push	a
 672  00be cd0000        	call	_FlashMngr_ReadPointer
 674  00c1 5b04          	addw	sp,#4
 675  00c3 96            	ldw	x,sp
 676  00c4 1c000c        	addw	x,#OFST-7
 677  00c7 cd0000        	call	c_rtol
 679                     ; 156     if(ptr_new < PTR_ERASED_VAL) 
 681  00ca 96            	ldw	x,sp
 682  00cb 1c000c        	addw	x,#OFST-7
 683  00ce cd0157        	call	LC008
 685  00d1 2407          	jruge	L532
 686                     ; 158       imin = imid + 1;
 688  00d3 1e0a          	ldw	x,(OFST-9,sp)
 689  00d5 5c            	incw	x
 690  00d6 1f06          	ldw	(OFST-13,sp),x
 692  00d8 200d          	jra	L132
 693  00da               L532:
 694                     ; 162       if(ptr_new == PTR_ERASED_VAL)
 696  00da 96            	ldw	x,sp
 697  00db 1c000c        	addw	x,#OFST-7
 698  00de ad77          	call	LC008
 700  00e0 2605          	jrne	L132
 701                     ; 164         imax = imid - 1;
 703  00e2 1e0a          	ldw	x,(OFST-9,sp)
 704  00e4 5a            	decw	x
 705  00e5               LC007:
 706  00e5 1f08          	ldw	(OFST-11,sp),x
 707  00e7               L132:
 708                     ; 151   while(imax >= imin)
 710  00e7 1e08          	ldw	x,(OFST-11,sp)
 711  00e9 1306          	cpw	x,(OFST-13,sp)
 712  00eb 2ea8          	jrsge	L522
 713                     ; 169   if(ptr_new == PTR_ERASED_VAL)
 715  00ed 96            	ldw	x,sp
 716  00ee 1c000c        	addw	x,#OFST-7
 717  00f1 ad64          	call	LC008
 719  00f3 2642          	jrne	L342
 720                     ; 171     tmpadr.adr32b -= PTR_SIZE;                //position to the element before the erased value
 722  00f5 96            	ldw	x,sp
 723  00f6 1c0010        	addw	x,#OFST-3
 724  00f9 a603          	ld	a,#3
 725  00fb cd0000        	call	c_lgsbc
 727                     ; 172     ptr_new = FlashMngr_ReadPointer(tmpadr);  //read the flash pointer there
 729  00fe 7b13          	ld	a,(OFST+0,sp)
 730  0100 88            	push	a
 731  0101 7b13          	ld	a,(OFST+0,sp)
 732  0103 88            	push	a
 733  0104 7b13          	ld	a,(OFST+0,sp)
 734  0106 88            	push	a
 735  0107 7b13          	ld	a,(OFST+0,sp)
 736  0109 88            	push	a
 737  010a cd0000        	call	_FlashMngr_ReadPointer
 739  010d 5b04          	addw	sp,#4
 740  010f 96            	ldw	x,sp
 741  0110 1c000c        	addw	x,#OFST-7
 742  0113 cd0000        	call	c_rtol
 744                     ; 173     if(INVALID_ADR(ptr_new))
 746  0116 96            	ldw	x,sp
 747  0117 1c000c        	addw	x,#OFST-7
 748  011a ad55          	call	LC010
 750  011c 250b          	jrult	L542
 752  011e 96            	ldw	x,sp
 753  011f 1c000c        	addw	x,#OFST-7
 754  0122 ad33          	call	LC008
 756                     ; 176       EXTFLASH_ERR.Error_bits.Invalid_FlashPtr_ERR = 1;
 757                     ; 177       EXTFLASH_ERR.Error_bits.Inconsistent_ERR = 1;
 758                     ; 178       return FALSE;
 760  0124 2403cc0038    	jrult	LC004
 761  0129               L542:
 762                     ; 181     flash_ptr.adr32b = ptr_new;
 764  0129 1e0e          	ldw	x,(OFST-5,sp)
 765  012b bf06          	ldw	L31_flash_ptr+2,x
 766  012d 1e0c          	ldw	x,(OFST-7,sp)
 767  012f bf04          	ldw	L31_flash_ptr,x
 768                     ; 182     pointer_adr.adr32b = tmpadr.adr32b + PTR_SIZE;
 770  0131 96            	ldw	x,sp
 771  0132 ad2c          	call	LC009
 773                     ; 183     EXTFLASH_STAT.Status_bits.FlashPtr_was_Read = 1;
 774                     ; 184     return TRUE;
 776  0134 cc0085        	jp	LC006
 777  0137               L342:
 778                     ; 187   flash_ptr.adr32b = ptr_new;
 780  0137 1e0e          	ldw	x,(OFST-5,sp)
 781  0139 bf06          	ldw	L31_flash_ptr+2,x
 782  013b 1e0c          	ldw	x,(OFST-7,sp)
 783  013d bf04          	ldw	L31_flash_ptr,x
 784                     ; 188   pointer_adr.adr32b = tmpadr.adr32b + PTR_SIZE;
 786  013f 96            	ldw	x,sp
 787  0140 ad1e          	call	LC009
 789                     ; 189   EXTFLASH_STAT.Status_bits.FlashPtr_was_Read = 1;
 791  0142 7212000c      	bset	L3_EXTFLASH_STAT,#1
 792                     ; 190   if(imid == (PTR_ARR_LEN - 1))
 794  0146 1e0a          	ldw	x,(OFST-9,sp)
 795  0148 a30554        	cpw	x,#1364
 796  014b 2703cc0089    	jrne	LC005
 797                     ; 192     EXTFLASH_STAT.Status_bits.PTR_ARR_Full = 1;
 799  0150 7210000c      	bset	L3_EXTFLASH_STAT,#0
 800                     ; 194   return TRUE;
 802  0154 cc0089        	jp	LC005
 803  0157               LC008:
 804  0157 cd0000        	call	c_ltor
 806  015a ae0004        	ldw	x,#L44
 807  015d cc0000        	jp	c_lcmp
 808  0160               LC009:
 809  0160 1c0010        	addw	x,#OFST-3
 810  0163 cd0000        	call	c_ltor
 812  0166 a603          	ld	a,#3
 813  0168 cd0000        	call	c_ladc
 815  016b ae0000        	ldw	x,#L51_pointer_adr
 816  016e cc0000        	jp	c_rtol
 817  0171               LC010:
 818  0171 cd0000        	call	c_ltor
 820  0174 ae0000        	ldw	x,#L24
 821  0177 cc0000        	jp	c_lcmp
 885                     	switch	.const
 886  0008               L47:
 887  0008 00000fff      	dc.l	4095
 888                     ; 197 _Bool FlashMngr_SavePointer(ExtFlashAdr adr)
 888                     ; 198 {
 889                     .text:	section	.text,new
 890  0000               _FlashMngr_SavePointer:
 892  0000 5208          	subw	sp,#8
 893       00000008      OFST:	set	8
 896                     ; 201   if(EXTFLASH_ERR.Error_bits.Memory_Locked_ERR || DisableMemOP)
 898  0002 720c000b05    	btjt	L5_EXTFLASH_ERR,#6,L103
 900  0007 7201000003    	btjf	L7_DisableMemOP,L772
 901  000c               L103:
 902                     ; 204     EXTFLASH_STAT.Status_bits.Operation_refused = 1;
 903                     ; 205     return FALSE;
 905  000c cc00c3        	jp	L303
 906  000f               L772:
 907                     ; 207   if(EXTFLASH_STAT.Status_bits.FlashPtr_was_Read)
 909  000f 7203000cf8    	btjf	L3_EXTFLASH_STAT,#1,L303
 910                     ; 209     EXTFLASH_STAT.Status_bits.Operation_refused = 0;
 912  0014 721b000c      	bres	L3_EXTFLASH_STAT,#5
 913                     ; 211     if(EXTFLASH_STAT.Status_bits.PTR_ARR_Full)
 915  0018 7201000c4b    	btjf	L3_EXTFLASH_STAT,#0,L503
 916                     ; 213       tmpadr.adr32b = PTR_ARR_BASE;
 918  001d 5f            	clrw	x
 919  001e 1f07          	ldw	(OFST-1,sp),x
 920  0020 1f05          	ldw	(OFST-3,sp),x
 921                     ; 214       SST25VF016_Sector_Erase_4KB(tmpadr);
 923  0022 7b08          	ld	a,(OFST+0,sp)
 924  0024 88            	push	a
 925  0025 7b08          	ld	a,(OFST+0,sp)
 926  0027 88            	push	a
 927  0028 7b08          	ld	a,(OFST+0,sp)
 928  002a 88            	push	a
 929  002b 7b08          	ld	a,(OFST+0,sp)
 930  002d 88            	push	a
 931  002e cd0000        	call	_SST25VF016_Sector_Erase_4KB
 933  0031 5b04          	addw	sp,#4
 935  0033               L113:
 936                     ; 216       while(SST25VF016_Read_Status_Register() & STATUS_BUSY);
 938  0033 cd0000        	call	_SST25VF016_Read_Status_Register
 940  0036 a501          	bcp	a,#1
 941  0038 26f9          	jrne	L113
 942                     ; 218       if(FlashMngr_ReadPointer(tmpadr) != PTR_ERASED_VAL) 
 944  003a 7b08          	ld	a,(OFST+0,sp)
 945  003c 88            	push	a
 946  003d 7b08          	ld	a,(OFST+0,sp)
 947  003f 88            	push	a
 948  0040 7b08          	ld	a,(OFST+0,sp)
 949  0042 88            	push	a
 950  0043 7b08          	ld	a,(OFST+0,sp)
 951  0045 88            	push	a
 952  0046 cd0000        	call	_FlashMngr_ReadPointer
 954  0049 5b04          	addw	sp,#4
 955  004b ae0004        	ldw	x,#L44
 956  004e cd0000        	call	c_lcmp
 958  0051 270c          	jreq	L513
 959                     ; 220         EXTFLASH_ERR.Error_bits.PTR_SEC_Erase_ERR = 1;
 961  0053 7216000b      	bset	L5_EXTFLASH_ERR,#3
 962                     ; 221         EXTFLASH_ERR.Error_bits.Inconsistent_ERR = 1;
 964  0057               LC012:
 966  0057 7210000b      	bset	L5_EXTFLASH_ERR,#0
 967                     ; 222         return FALSE;
 969  005b               LC011:
 973  005b 4f            	clr	a
 975  005c               L001:
 977  005c 5b08          	addw	sp,#8
 978  005e 81            	ret	
 979  005f               L513:
 980                     ; 224       EXTFLASH_STAT.Status_bits.PTR_ARR_Full = 0;
 982  005f 7211000c      	bres	L3_EXTFLASH_STAT,#0
 983                     ; 225       pointer_adr.adr32b = PTR_ARR_BASE;
 985  0063 5f            	clrw	x
 986  0064 bf02          	ldw	L51_pointer_adr+2,x
 987  0066 bf00          	ldw	L51_pointer_adr,x
 988  0068               L503:
 989                     ; 228     SST25VF016_Program_Byte(pointer_adr, adr.adr8b.HighByte);
 991  0068 7b0c          	ld	a,(OFST+4,sp)
 992  006a ad5d          	call	LC014
 994                     ; 230     SST25VF016_Program_Byte(pointer_adr, adr.adr8b.MidByte);
 996  006c 7b0d          	ld	a,(OFST+5,sp)
 997  006e ad59          	call	LC014
 999                     ; 232     SST25VF016_Program_Byte(pointer_adr, adr.adr8b.LowByte);
1001  0070 7b0e          	ld	a,(OFST+6,sp)
1002  0072 ad55          	call	LC014
1004                     ; 235     if(PTR_OUT_OF_ARR(pointer_adr.adr32b))
1006  0074 cd0000        	call	c_ltor
1008  0077 ae0008        	ldw	x,#L47
1009  007a cd0000        	call	c_lcmp
1011  007d 2504          	jrult	L713
1012                     ; 237       EXTFLASH_STAT.Status_bits.PTR_ARR_Full = 1;
1014  007f 7210000c      	bset	L3_EXTFLASH_STAT,#0
1015  0083               L713:
1016                     ; 240     tmpadr.adr32b = pointer_adr.adr32b - PTR_SIZE;
1018  0083 ae0000        	ldw	x,#L51_pointer_adr
1019  0086 cd0000        	call	c_ltor
1021  0089 a603          	ld	a,#3
1022  008b cd0000        	call	c_lsbc
1024  008e 96            	ldw	x,sp
1025  008f 1c0005        	addw	x,#OFST-3
1026  0092 cd0000        	call	c_rtol
1028                     ; 241     tmp = FlashMngr_ReadPointer(tmpadr);
1030  0095 7b08          	ld	a,(OFST+0,sp)
1031  0097 88            	push	a
1032  0098 7b08          	ld	a,(OFST+0,sp)
1033  009a 88            	push	a
1034  009b 7b08          	ld	a,(OFST+0,sp)
1035  009d 88            	push	a
1036  009e 7b08          	ld	a,(OFST+0,sp)
1037  00a0 88            	push	a
1038  00a1 cd0000        	call	_FlashMngr_ReadPointer
1040  00a4 5b04          	addw	sp,#4
1041  00a6 96            	ldw	x,sp
1042  00a7 5c            	incw	x
1043  00a8 cd0000        	call	c_rtol
1045                     ; 242     if(tmp == adr.adr32b) return TRUE;
1047  00ab 96            	ldw	x,sp
1048  00ac 5c            	incw	x
1049  00ad cd0000        	call	c_ltor
1051  00b0 96            	ldw	x,sp
1052  00b1 1c000b        	addw	x,#OFST+3
1053  00b4 cd0000        	call	c_lcmp
1055  00b7 2604          	jrne	L123
1058  00b9 a601          	ld	a,#1
1060  00bb 209f          	jra	L001
1061  00bd               L123:
1062                     ; 244     EXTFLASH_ERR.Error_bits.Data_Store_ERR = 1;
1064  00bd 721a000b      	bset	L5_EXTFLASH_ERR,#5
1065                     ; 245     EXTFLASH_ERR.Error_bits.Inconsistent_ERR = 1;
1066                     ; 246     return FALSE;
1068  00c1 2094          	jp	LC012
1069  00c3               L303:
1070                     ; 249   EXTFLASH_STAT.Status_bits.Operation_refused = 1;
1073  00c3 721a000c      	bset	L3_EXTFLASH_STAT,#5
1074                     ; 250   return FALSE;
1076  00c7 2092          	jp	LC011
1077  00c9               LC014:
1078  00c9 88            	push	a
1079  00ca b603          	ld	a,L51_pointer_adr+3
1080  00cc 88            	push	a
1081  00cd b602          	ld	a,L51_pointer_adr+2
1082  00cf 88            	push	a
1083  00d0 b601          	ld	a,L51_pointer_adr+1
1084  00d2 88            	push	a
1085  00d3 b600          	ld	a,L51_pointer_adr
1086  00d5 88            	push	a
1087  00d6 cd0000        	call	_SST25VF016_Program_Byte
1089  00d9 5b05          	addw	sp,#5
1090                     ; 229     pointer_adr.adr32b++;
1092  00db ae0000        	ldw	x,#L51_pointer_adr
1093  00de a601          	ld	a,#1
1094  00e0 cc0000        	jp	c_lgadc
1165                     ; 253 _Bool FlashMngr_StoreData(u8* data, u16 size)
1165                     ; 254 {
1166                     .text:	section	.text,new
1167  0000               _FlashMngr_StoreData:
1169  0000 89            	pushw	x
1170  0001 89            	pushw	x
1171       00000002      OFST:	set	2
1174                     ; 256   if(EXTFLASH_ERR.Error_bits.Memory_Locked_ERR || DisableMemOP)
1176  0002 720c000b05    	btjt	L5_EXTFLASH_ERR,#6,L753
1178  0007 7201000006    	btjf	L7_DisableMemOP,L553
1179  000c               L753:
1180                     ; 259     EXTFLASH_STAT.Status_bits.Operation_refused = 1;
1182  000c 721a000c      	bset	L3_EXTFLASH_STAT,#5
1183                     ; 260     return FALSE;
1185  0010 2024          	jp	LC015
1186  0012               L553:
1187                     ; 262   if(EXTFLASH_STAT.Status_bits.FlashPtr_was_Read)
1189  0012 7202000c03cc  	btjf	L3_EXTFLASH_STAT,#1,L163
1190                     ; 264     EXTFLASH_STAT.Status_bits.Operation_refused = 0;
1192  001a 721b000c      	bres	L3_EXTFLASH_STAT,#5
1193                     ; 266     if(flash_ptr.adr32b + (size-1) > FLASH_MAX_ADR) 
1195  001e 1e07          	ldw	x,(OFST+5,sp)
1196  0020 5a            	decw	x
1197  0021 cd0000        	call	c_uitolx
1199  0024 ae0004        	ldw	x,#L31_flash_ptr
1200  0027 cd0000        	call	c_ladd
1202  002a ae0000        	ldw	x,#L24
1203  002d cd0000        	call	c_lcmp
1205  0030 2508          	jrult	L363
1206                     ; 268       EXTFLASH_STAT.Status_bits.Flash_no_space = 1;
1208  0032 7218000c      	bset	L3_EXTFLASH_STAT,#4
1209                     ; 269       return FALSE;
1211  0036               LC015:
1215  0036 4f            	clr	a
1217  0037               L611:
1219  0037 5b04          	addw	sp,#4
1220  0039 81            	ret	
1221  003a               L363:
1222                     ; 271     EXTFLASH_STAT.Status_bits.Flash_no_space = 0;
1224  003a 7219000c      	bres	L3_EXTFLASH_STAT,#4
1225                     ; 272     for(i = 0; i < size; i++)
1227  003e 0f02          	clr	(OFST+0,sp)
1229  0040 2053          	jra	L173
1230  0042               L563:
1231                     ; 274       SST25VF016_Program_Byte(flash_ptr, data[i]);
1233  0042 7b03          	ld	a,(OFST+1,sp)
1234  0044 97            	ld	xl,a
1235  0045 7b04          	ld	a,(OFST+2,sp)
1236  0047 1b02          	add	a,(OFST+0,sp)
1237  0049 2401          	jrnc	L601
1238  004b 5c            	incw	x
1239  004c               L601:
1240  004c 02            	rlwa	x,a
1241  004d f6            	ld	a,(x)
1242  004e 88            	push	a
1243  004f b607          	ld	a,L31_flash_ptr+3
1244  0051 88            	push	a
1245  0052 b606          	ld	a,L31_flash_ptr+2
1246  0054 88            	push	a
1247  0055 b605          	ld	a,L31_flash_ptr+1
1248  0057 88            	push	a
1249  0058 b604          	ld	a,L31_flash_ptr
1250  005a 88            	push	a
1251  005b cd0000        	call	_SST25VF016_Program_Byte
1253  005e 5b05          	addw	sp,#5
1254                     ; 276       tmp = SST25VF016_Read_Byte(flash_ptr);
1256  0060 b607          	ld	a,L31_flash_ptr+3
1257  0062 88            	push	a
1258  0063 b606          	ld	a,L31_flash_ptr+2
1259  0065 88            	push	a
1260  0066 b605          	ld	a,L31_flash_ptr+1
1261  0068 88            	push	a
1262  0069 b604          	ld	a,L31_flash_ptr
1263  006b 88            	push	a
1264  006c cd0000        	call	_SST25VF016_Read_Byte
1266  006f 5b04          	addw	sp,#4
1267  0071 6b01          	ld	(OFST-1,sp),a
1268                     ; 277       flash_ptr.adr32b++;
1270  0073 ae0004        	ldw	x,#L31_flash_ptr
1271  0076 a601          	ld	a,#1
1272  0078 cd0000        	call	c_lgadc
1274                     ; 279       if(tmp != data[i])
1276  007b 7b03          	ld	a,(OFST+1,sp)
1277  007d 97            	ld	xl,a
1278  007e 7b04          	ld	a,(OFST+2,sp)
1279  0080 1b02          	add	a,(OFST+0,sp)
1280  0082 2401          	jrnc	L211
1281  0084 5c            	incw	x
1282  0085               L211:
1283  0085 02            	rlwa	x,a
1284  0086 f6            	ld	a,(x)
1285  0087 1101          	cp	a,(OFST-1,sp)
1286  0089 2708          	jreq	L573
1287                     ; 281         EXTFLASH_ERR.Error_bits.Data_Store_ERR = 1;
1289                     ; 282         EXTFLASH_ERR.Error_bits.Inconsistent_ERR = 1;
1291                     ; 283         return FALSE;
1293  008b b60b          	ld	a,L5_EXTFLASH_ERR
1294  008d aa21          	or	a,#33
1295  008f b70b          	ld	L5_EXTFLASH_ERR,a
1296  0091 20a3          	jp	LC015
1297  0093               L573:
1298                     ; 272     for(i = 0; i < size; i++)
1300  0093 0c02          	inc	(OFST+0,sp)
1301  0095               L173:
1304  0095 7b02          	ld	a,(OFST+0,sp)
1305  0097 5f            	clrw	x
1306  0098 97            	ld	xl,a
1307  0099 1307          	cpw	x,(OFST+5,sp)
1308  009b 25a5          	jrult	L563
1309                     ; 286     FlashMngr_SavePointer(flash_ptr);
1311  009d b607          	ld	a,L31_flash_ptr+3
1312  009f 88            	push	a
1313  00a0 b606          	ld	a,L31_flash_ptr+2
1314  00a2 88            	push	a
1315  00a3 b605          	ld	a,L31_flash_ptr+1
1316  00a5 88            	push	a
1317  00a6 b604          	ld	a,L31_flash_ptr
1318  00a8 88            	push	a
1319  00a9 cd0000        	call	_FlashMngr_SavePointer
1321  00ac 5b04          	addw	sp,#4
1322                     ; 287     return TRUE;
1324  00ae a601          	ld	a,#1
1326  00b0 2085          	jra	L611
1327  00b2               L163:
1328                     ; 290   EXTFLASH_STAT.Status_bits.Operation_refused = 1;
1330  00b2 721a000c      	bset	L3_EXTFLASH_STAT,#5
1331                     ; 291   return FALSE;
1333  00b6 cc0036        	jp	LC015
1388                     ; 294 _Bool FlashMngr_EraseChip()
1388                     ; 295 {
1389                     .text:	section	.text,new
1390  0000               _FlashMngr_EraseChip:
1392  0000 5205          	subw	sp,#5
1393       00000005      OFST:	set	5
1396                     ; 298   if(EXTFLASH_ERR.Error_bits.Memory_Locked_ERR || DisableMemOP)
1398  0002 720c000b05    	btjt	L5_EXTFLASH_ERR,#6,L324
1400  0007 7201000003    	btjf	L7_DisableMemOP,L124
1401  000c               L324:
1402                     ; 301     EXTFLASH_STAT.Status_bits.Operation_refused = 1;
1403                     ; 302     return FALSE;
1405  000c cc0098        	jp	L524
1406  000f               L124:
1407                     ; 305   if(EXTFLASH_STAT.Status_bits.Flash_was_Read)
1409  000f 7207000cf8    	btjf	L3_EXTFLASH_STAT,#3,L524
1410                     ; 307     EXTFLASH_STAT.Status_bits.Operation_refused = 0;
1412  0014 721b000c      	bres	L3_EXTFLASH_STAT,#5
1413                     ; 308     SST25VF016_Chip_Erase();
1415  0018 cd0000        	call	_SST25VF016_Chip_Erase
1417                     ; 309     EXTFLASH_STAT.Status = 0;  //Reset status flags
1419  001b 3f0c          	clr	L3_EXTFLASH_STAT
1420                     ; 310     EXTFLASH_ERR.Error = 0;    //Reset error flags
1422  001d 3f0b          	clr	L5_EXTFLASH_ERR
1423                     ; 311     flash_ptr.adr32b = DATA_STORAGE_BASE;
1425  001f ae1000        	ldw	x,#4096
1426  0022 bf06          	ldw	L31_flash_ptr+2,x
1427  0024 5f            	clrw	x
1428  0025 bf04          	ldw	L31_flash_ptr,x
1429                     ; 312     pointer_adr.adr32b = PTR_ARR_BASE;
1431  0027 bf02          	ldw	L51_pointer_adr+2,x
1432  0029 bf00          	ldw	L51_pointer_adr,x
1434  002b               L334:
1435                     ; 315     while(SST25VF016_Read_Status_Register() & STATUS_BUSY);
1437  002b cd0000        	call	_SST25VF016_Read_Status_Register
1439  002e a501          	bcp	a,#1
1440  0030 26f9          	jrne	L334
1441                     ; 317     tmpadr.adr32b = DATA_STORAGE_BASE;
1443  0032 ae1000        	ldw	x,#4096
1444  0035 1f04          	ldw	(OFST-1,sp),x
1445  0037 5f            	clrw	x
1446  0038 1f02          	ldw	(OFST-3,sp),x
1447                     ; 318     for(i = 0; i < TEST_ERASED_BYTES_NUM; i++)
1449  003a 0f01          	clr	(OFST-4,sp)
1450  003c               L734:
1451                     ; 320       if(SST25VF016_Read_Byte(tmpadr) != BYTE_ERASED_VAL) 
1453  003c 7b05          	ld	a,(OFST+0,sp)
1454  003e 88            	push	a
1455  003f 7b05          	ld	a,(OFST+0,sp)
1456  0041 88            	push	a
1457  0042 7b05          	ld	a,(OFST+0,sp)
1458  0044 88            	push	a
1459  0045 7b05          	ld	a,(OFST+0,sp)
1460  0047 88            	push	a
1461  0048 cd0000        	call	_SST25VF016_Read_Byte
1463  004b 5b04          	addw	sp,#4
1464  004d 4c            	inc	a
1465  004e 270c          	jreq	L544
1466                     ; 322         EXTFLASH_ERR.Error_bits.Flash_Erase_ERR = 1;
1468  0050 7218000b      	bset	L5_EXTFLASH_ERR,#4
1469                     ; 323         EXTFLASH_ERR.Error_bits.Inconsistent_ERR = 1;
1471  0054               LC017:
1473  0054 7210000b      	bset	L5_EXTFLASH_ERR,#0
1474                     ; 324         return FALSE;
1476  0058               LC016:
1480  0058 4f            	clr	a
1482  0059               L231:
1484  0059 5b05          	addw	sp,#5
1485  005b 81            	ret	
1486  005c               L544:
1487                     ; 326       tmpadr.adr32b++;
1489  005c 96            	ldw	x,sp
1490  005d 1c0002        	addw	x,#OFST-3
1491  0060 4c            	inc	a
1492  0061 cd0000        	call	c_lgadc
1494                     ; 318     for(i = 0; i < TEST_ERASED_BYTES_NUM; i++)
1496  0064 0c01          	inc	(OFST-4,sp)
1499  0066 7b01          	ld	a,(OFST-4,sp)
1500  0068 a10a          	cp	a,#10
1501  006a 25d0          	jrult	L734
1502                     ; 328     tmpadr.adr32b = PTR_ARR_BASE;
1504  006c 5f            	clrw	x
1505  006d 1f04          	ldw	(OFST-1,sp),x
1506  006f 1f02          	ldw	(OFST-3,sp),x
1507                     ; 330     if(FlashMngr_ReadPointer(tmpadr) != PTR_ERASED_VAL) 
1509  0071 7b05          	ld	a,(OFST+0,sp)
1510  0073 88            	push	a
1511  0074 7b05          	ld	a,(OFST+0,sp)
1512  0076 88            	push	a
1513  0077 7b05          	ld	a,(OFST+0,sp)
1514  0079 88            	push	a
1515  007a 7b05          	ld	a,(OFST+0,sp)
1516  007c 88            	push	a
1517  007d cd0000        	call	_FlashMngr_ReadPointer
1519  0080 5b04          	addw	sp,#4
1520  0082 ae0004        	ldw	x,#L44
1521  0085 cd0000        	call	c_lcmp
1523  0088 2706          	jreq	L744
1524                     ; 332         EXTFLASH_ERR.Error_bits.PTR_SEC_Erase_ERR = 1;
1526  008a 7216000b      	bset	L5_EXTFLASH_ERR,#3
1527                     ; 333         EXTFLASH_ERR.Error_bits.Inconsistent_ERR = 1;
1528                     ; 334         return FALSE;
1530  008e 20c4          	jp	LC017
1531  0090               L744:
1532                     ; 337     EXTFLASH_STAT.Status_bits.FlashPtr_was_Read = 1;
1534  0090 7212000c      	bset	L3_EXTFLASH_STAT,#1
1535                     ; 338     return TRUE;
1537  0094 a601          	ld	a,#1
1539  0096 20c1          	jra	L231
1540  0098               L524:
1541                     ; 341   EXTFLASH_STAT.Status_bits.Operation_refused = 1;
1544  0098 721a000c      	bset	L3_EXTFLASH_STAT,#5
1545                     ; 342   return FALSE;
1547  009c 20ba          	jp	LC016
1583                     ; 345 u32 FlashMngr_GetFreeSpace()
1583                     ; 346 {
1584                     .text:	section	.text,new
1585  0000               _FlashMngr_GetFreeSpace:
1587  0000 5204          	subw	sp,#4
1588       00000004      OFST:	set	4
1591                     ; 348   tmp = FLASH_MAX_ADR - flash_ptr.adr32b + 1;
1593  0002 5f            	clrw	x
1594  0003 bf02          	ldw	c_lreg+2,x
1595  0005 ae0020        	ldw	x,#32
1596  0008 bf00          	ldw	c_lreg,x
1597  000a ae0004        	ldw	x,#L31_flash_ptr
1598  000d cd0000        	call	c_lsub
1600  0010 96            	ldw	x,sp
1601  0011 5c            	incw	x
1602  0012 cd0000        	call	c_rtol
1604                     ; 349   if(tmp < 0) tmp = 0;
1606  0015 7b01          	ld	a,(OFST-3,sp)
1607  0017 2a05          	jrpl	L764
1610  0019 5f            	clrw	x
1611  001a 1f03          	ldw	(OFST-1,sp),x
1612  001c 1f01          	ldw	(OFST-3,sp),x
1613  001e               L764:
1614                     ; 350   return (u32)(tmp);
1616  001e 96            	ldw	x,sp
1617  001f 5c            	incw	x
1618  0020 cd0000        	call	c_ltor
1622  0023 5b04          	addw	sp,#4
1623  0025 81            	ret	
1648                     	switch	.const
1649  000c               L041:
1650  000c 00001000      	dc.l	4096
1651                     ; 353 u32 FlashMngr_GetOccupiedSpace()
1651                     ; 354 {
1652                     .text:	section	.text,new
1653  0000               _FlashMngr_GetOccupiedSpace:
1657                     ; 355   return (u32)(flash_ptr.adr32b - DATA_STORAGE_BASE);
1659  0000 ae0004        	ldw	x,#L31_flash_ptr
1660  0003 cd0000        	call	c_ltor
1662  0006 ae000c        	ldw	x,#L041
1666  0009 cc0000        	jp	c_lsub
1714                     ; 358 void FlashMngr_ReadDataToUART()
1714                     ; 359 {
1715                     .text:	section	.text,new
1716  0000               _FlashMngr_ReadDataToUART:
1718  0000 5208          	subw	sp,#8
1719       00000008      OFST:	set	8
1722                     ; 362   dataSizeToSend = FlashMngr_GetOccupiedSpace();
1724  0002 cd0000        	call	_FlashMngr_GetOccupiedSpace
1726  0005 96            	ldw	x,sp
1727  0006 1c0005        	addw	x,#OFST-3
1728  0009 cd0000        	call	c_rtol
1730                     ; 363   tmp_adr.adr32b = DATA_STORAGE_BASE;
1732  000c ae1000        	ldw	x,#4096
1733  000f 1f03          	ldw	(OFST-5,sp),x
1734  0011 5f            	clrw	x
1735  0012 1f01          	ldw	(OFST-7,sp),x
1737  0014 2029          	jra	L725
1738  0016               L535:
1739                     ; 366     while(!(UART1->SR & UART1_FLAG_TXE));
1741  0016 720f5230fb    	btjf	21040,#7,L535
1742                     ; 367     UART1->DR = SST25VF016_Read_Byte(tmp_adr);
1744  001b 7b04          	ld	a,(OFST-4,sp)
1745  001d 88            	push	a
1746  001e 7b04          	ld	a,(OFST-4,sp)
1747  0020 88            	push	a
1748  0021 7b04          	ld	a,(OFST-4,sp)
1749  0023 88            	push	a
1750  0024 7b04          	ld	a,(OFST-4,sp)
1751  0026 88            	push	a
1752  0027 cd0000        	call	_SST25VF016_Read_Byte
1754  002a 5b04          	addw	sp,#4
1755  002c c75231        	ld	21041,a
1756                     ; 368     tmp_adr.adr32b++;
1758  002f 96            	ldw	x,sp
1759  0030 5c            	incw	x
1760  0031 a601          	ld	a,#1
1761  0033 cd0000        	call	c_lgadc
1763                     ; 364   for(;dataSizeToSend > 0; dataSizeToSend--)
1765  0036 96            	ldw	x,sp
1766  0037 1c0005        	addw	x,#OFST-3
1767  003a a601          	ld	a,#1
1768  003c cd0000        	call	c_lgsbc
1770  003f               L725:
1773  003f 96            	ldw	x,sp
1774  0040 1c0005        	addw	x,#OFST-3
1775  0043 cd0000        	call	c_lzmp
1777  0046 26ce          	jrne	L535
1778                     ; 370   EXTFLASH_STAT.Status_bits.Flash_was_Read = 1;
1780  0048 7216000c      	bset	L3_EXTFLASH_STAT,#3
1781                     ; 371 }
1784  004c 5b08          	addw	sp,#8
1785  004e 81            	ret	
1822                     ; 373 void FlashMngr_GetOccupiedSpaceToUART()
1822                     ; 374 {
1823                     .text:	section	.text,new
1824  0000               _FlashMngr_GetOccupiedSpaceToUART:
1826  0000 5204          	subw	sp,#4
1827       00000004      OFST:	set	4
1830                     ; 376   tmp_val.adr32b = FlashMngr_GetOccupiedSpace();
1832  0002 cd0000        	call	_FlashMngr_GetOccupiedSpace
1834  0005 96            	ldw	x,sp
1835  0006 5c            	incw	x
1836  0007 cd0000        	call	c_rtol
1839  000a               L365:
1840                     ; 378   while(!(UART1->SR & UART1_FLAG_TXE));
1842  000a 720f5230fb    	btjf	21040,#7,L365
1843                     ; 379   UART1->DR = tmp_val.adr8b.Zero;           //send MSB first
1845  000f 7b01          	ld	a,(OFST-3,sp)
1846  0011 c75231        	ld	21041,a
1848  0014               L375:
1849                     ; 380   while(!(UART1->SR & UART1_FLAG_TXE));
1851  0014 720f5230fb    	btjf	21040,#7,L375
1852                     ; 381   UART1->DR = tmp_val.adr8b.HighByte;
1854  0019 7b02          	ld	a,(OFST-2,sp)
1855  001b c75231        	ld	21041,a
1857  001e               L306:
1858                     ; 382   while(!(UART1->SR & UART1_FLAG_TXE));
1860  001e 720f5230fb    	btjf	21040,#7,L306
1861                     ; 383   UART1->DR = tmp_val.adr8b.MidByte;
1863  0023 7b03          	ld	a,(OFST-1,sp)
1864  0025 c75231        	ld	21041,a
1866  0028               L316:
1867                     ; 384   while(!(UART1->SR & UART1_FLAG_TXE));
1869  0028 720f5230fb    	btjf	21040,#7,L316
1870                     ; 385   UART1->DR = tmp_val.adr8b.LowByte;
1872  002d 7b04          	ld	a,(OFST+0,sp)
1873  002f c75231        	ld	21041,a
1874                     ; 386 }
1877  0032 5b04          	addw	sp,#4
1878  0034 81            	ret	
1914                     ; 388 void FlashMngr_GetHeaderSizeToUART()
1914                     ; 389 {
1915                     .text:	section	.text,new
1916  0000               _FlashMngr_GetHeaderSizeToUART:
1918  0000 5204          	subw	sp,#4
1919       00000004      OFST:	set	4
1922                     ; 391   tmp_val.adr32b = PTR_SEC_SIZE;
1924  0002 ae1000        	ldw	x,#4096
1925  0005 1f03          	ldw	(OFST-1,sp),x
1926  0007 5f            	clrw	x
1927  0008 1f01          	ldw	(OFST-3,sp),x
1929  000a               L146:
1930                     ; 392   while(!(UART1->SR & UART1_FLAG_TXE));
1932  000a 720f5230fb    	btjf	21040,#7,L146
1933                     ; 393   UART1->DR = tmp_val.adr8b.Zero;           //send MSB first
1935  000f 7b01          	ld	a,(OFST-3,sp)
1936  0011 c75231        	ld	21041,a
1938  0014               L156:
1939                     ; 394   while(!(UART1->SR & UART1_FLAG_TXE));
1941  0014 720f5230fb    	btjf	21040,#7,L156
1942                     ; 395   UART1->DR = tmp_val.adr8b.HighByte;
1944  0019 7b02          	ld	a,(OFST-2,sp)
1945  001b c75231        	ld	21041,a
1947  001e               L166:
1948                     ; 396   while(!(UART1->SR & UART1_FLAG_TXE));
1950  001e 720f5230fb    	btjf	21040,#7,L166
1951                     ; 397   UART1->DR = tmp_val.adr8b.MidByte;
1953  0023 7b03          	ld	a,(OFST-1,sp)
1954  0025 c75231        	ld	21041,a
1956  0028               L176:
1957                     ; 398   while(!(UART1->SR & UART1_FLAG_TXE));
1959  0028 720f5230fb    	btjf	21040,#7,L176
1960                     ; 399   UART1->DR = tmp_val.adr8b.LowByte;
1962  002d 7b04          	ld	a,(OFST+0,sp)
1963  002f c75231        	ld	21041,a
1964                     ; 400 }
1967  0032 5b04          	addw	sp,#4
1968  0034 81            	ret	
2014                     ; 402 void FlashMngr_ReadHeaderToUART()
2014                     ; 403 {
2015                     .text:	section	.text,new
2016  0000               _FlashMngr_ReadHeaderToUART:
2018  0000 5206          	subw	sp,#6
2019       00000006      OFST:	set	6
2022                     ; 406   dataSizeToSend = PTR_SEC_SIZE;
2024  0002 ae1000        	ldw	x,#4096
2025  0005 1f05          	ldw	(OFST-1,sp),x
2026                     ; 407   tmp_adr.adr32b = PTR_ARR_SEC_ADR;
2028  0007 5f            	clrw	x
2029  0008 1f03          	ldw	(OFST-3,sp),x
2030  000a 1f01          	ldw	(OFST-5,sp),x
2032  000c 2025          	jra	L327
2033  000e               L137:
2034                     ; 410     while(!(UART1->SR & UART1_FLAG_TXE));
2036  000e 720f5230fb    	btjf	21040,#7,L137
2037                     ; 411     UART1->DR = SST25VF016_Read_Byte(tmp_adr);
2039  0013 7b04          	ld	a,(OFST-2,sp)
2040  0015 88            	push	a
2041  0016 7b04          	ld	a,(OFST-2,sp)
2042  0018 88            	push	a
2043  0019 7b04          	ld	a,(OFST-2,sp)
2044  001b 88            	push	a
2045  001c 7b04          	ld	a,(OFST-2,sp)
2046  001e 88            	push	a
2047  001f cd0000        	call	_SST25VF016_Read_Byte
2049  0022 5b04          	addw	sp,#4
2050  0024 c75231        	ld	21041,a
2051                     ; 412     tmp_adr.adr32b++;
2053  0027 96            	ldw	x,sp
2054  0028 5c            	incw	x
2055  0029 a601          	ld	a,#1
2056  002b cd0000        	call	c_lgadc
2058                     ; 408   for(;dataSizeToSend > 0; dataSizeToSend--)
2060  002e 1e05          	ldw	x,(OFST-1,sp)
2061  0030 5a            	decw	x
2062  0031 1f05          	ldw	(OFST-1,sp),x
2063  0033               L327:
2066  0033 1e05          	ldw	x,(OFST-1,sp)
2067  0035 26d7          	jrne	L137
2068                     ; 414 }
2071  0037 5b06          	addw	sp,#6
2072  0039 81            	ret	
2097                     ; 416 void FlashMngr_DisableWriteOp()
2097                     ; 417 {
2098                     .text:	section	.text,new
2099  0000               _FlashMngr_DisableWriteOp:
2103                     ; 418   DisableMemOP = TRUE;
2105  0000 72100000      	bset	L7_DisableMemOP
2106                     ; 419 }
2109  0004 81            	ret	
2134                     ; 421 void FlashMngr_EnableWriteOp()
2134                     ; 422 {
2135                     .text:	section	.text,new
2136  0000               _FlashMngr_EnableWriteOp:
2140                     ; 423   DisableMemOP = FALSE;
2142  0000 72110000      	bres	L7_DisableMemOP
2143                     ; 424 }
2146  0004 81            	ret	
2414                     	xdef	_FlashMngr_EnableWriteOp
2415                     	xdef	_FlashMngr_DisableWriteOp
2416                     	xdef	_FlashMngr_ReadHeaderToUART
2417                     	xdef	_FlashMngr_GetHeaderSizeToUART
2418                     	xdef	_FlashMngr_GetOccupiedSpaceToUART
2419                     	xdef	_FlashMngr_ReadDataToUART
2420                     	xdef	_FlashMngr_GetFreeSpace
2421                     	xdef	_FlashMngr_EraseChip
2422                     	xdef	_FlashMngr_StoreData
2423                     	xdef	_FlashMngr_SavePointer
2424                     	xdef	_FlashMngr_ReadPointer
2425                     	xdef	_FlashMngr_Init
2426                     	xdef	_FlashMngr_GetErrors
2427                     	xdef	_FlashMngr_GetStatus
2428                     	xdef	_FlashMngr_GetOccupiedSpace
2429                     	xdef	_FlashMngr_GetPointer
2430                     	switch	.ubsct
2431  0000               L51_pointer_adr:
2432  0000 00000000      	ds.b	4
2433  0004               L31_flash_ptr:
2434  0004 00000000      	ds.b	4
2435  0008               L11_buffer:
2436  0008 000000        	ds.b	3
2437                     .bit:	section	.data,bit
2438  0000               L7_DisableMemOP:
2439  0000 00            	ds.b	1
2440                     	switch	.ubsct
2441  000b               L5_EXTFLASH_ERR:
2442  000b 00            	ds.b	1
2443  000c               L3_EXTFLASH_STAT:
2444  000c 00            	ds.b	1
2445                     	xref	_SST25VF016_Write_Status_Register
2446                     	xref	_SST25VF016_Chip_Erase
2447                     	xref	_SST25VF016_Sector_Erase_4KB
2448                     	xref	_SST25VF016_Program_Byte
2449                     	xref	_SST25VF016_Read_Status_Register
2450                     	xref	_SST25VF016_Read_Byte
2451                     	xref	_SST25VF016_Read
2452                     	xref	_SST25VF016_Init
2453                     	xref.b	c_lreg
2454                     	xref.b	c_x
2474                     	xref	c_lzmp
2475                     	xref	c_lsub
2476                     	xref	c_ladd
2477                     	xref	c_uitolx
2478                     	xref	c_lsbc
2479                     	xref	c_ladc
2480                     	xref	c_lgsbc
2481                     	xref	c_itolx
2482                     	xref	c_imul
2483                     	xref	c_sdivx
2484                     	xref	c_lgadc
2485                     	xref	c_lcmp
2486                     	xref	c_rtol
2487                     	xref	c_ltor
2488                     	end
