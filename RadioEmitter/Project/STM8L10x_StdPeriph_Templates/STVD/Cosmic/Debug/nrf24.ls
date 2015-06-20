   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  52                     ; 23 void nrf24_init() 
  52                     ; 24 {
  54                     .text:	section	.text,new
  55  0000               _nrf24_init:
  59                     ; 25   nrf24_setupPins();
  61  0000 cd0000        	call	_nrf24_setupPins
  63                     ; 26   nrf24_ce_digitalWrite(LOW);
  65  0003 4f            	clr	a
  66  0004 cd0000        	call	_nrf24_ce_digitalWrite
  68                     ; 27   nrf24_csn_digitalWrite(HIGH);    
  70  0007 a601          	ld	a,#1
  72                     ; 28 }
  75  0009 cc0000        	jp	_nrf24_csn_digitalWrite
 165                     ; 31 void nrf24_config_sb(uint8_t channel, uint8_t pay_length, u8* rxadr, u8* txadr)
 165                     ; 32 {
 166                     .text:	section	.text,new
 167  0000               _nrf24_config_sb:
 169  0000 89            	pushw	x
 170  0001 89            	pushw	x
 171       00000002      OFST:	set	2
 174                     ; 34   payload_len = pay_length;
 176  0002 9f            	ld	a,xl
 177  0003 b700          	ld	_payload_len,a
 178                     ; 37   send = 0;
 180  0005 0f02          	clr	(OFST+0,sp)
 181                     ; 38   nrf24_configRegister(EN_RXADDR, send);
 183  0007 ae0200        	ldw	x,#512
 184  000a cd0000        	call	_nrf24_configRegister
 186                     ; 39   nrf24_readRegister(EN_RXADDR, &rcv, 1);
 188  000d 4b01          	push	#1
 189  000f 96            	ldw	x,sp
 190  0010 1c0002        	addw	x,#OFST+0
 191  0013 89            	pushw	x
 192  0014 a602          	ld	a,#2
 193  0016 cd0000        	call	_nrf24_readRegister
 195  0019 5b03          	addw	sp,#3
 196                     ; 40   if(rcv != send)
 198  001b 7b01          	ld	a,(OFST-1,sp)
 199  001d 1102          	cp	a,(OFST+0,sp)
 200  001f 2705          	jreq	L36
 201                     ; 42     Errors_SetError(ERROR_NRF24_INIT);
 203  0021 a601          	ld	a,#1
 204  0023 cd0000        	call	_Errors_SetError
 206  0026               L36:
 207                     ; 46   send = (1<<ERX_P0);
 209  0026 a601          	ld	a,#1
 210  0028 6b02          	ld	(OFST+0,sp),a
 211                     ; 47   nrf24_configRegister(EN_RXADDR, send);
 213  002a ae0201        	ldw	x,#513
 214  002d cd0000        	call	_nrf24_configRegister
 216                     ; 48   nrf24_readRegister(EN_RXADDR, &rcv, 1);
 218  0030 4b01          	push	#1
 219  0032 96            	ldw	x,sp
 220  0033 1c0002        	addw	x,#OFST+0
 221  0036 89            	pushw	x
 222  0037 a602          	ld	a,#2
 223  0039 cd0000        	call	_nrf24_readRegister
 225  003c 5b03          	addw	sp,#3
 226                     ; 49   if(rcv != send)
 228  003e 7b01          	ld	a,(OFST-1,sp)
 229  0040 1102          	cp	a,(OFST+0,sp)
 230  0042 2705          	jreq	L56
 231                     ; 51     Errors_SetError(ERROR_NRF24_INIT);
 233  0044 a601          	ld	a,#1
 234  0046 cd0000        	call	_Errors_SetError
 236  0049               L56:
 237                     ; 54   send = 0;
 239  0049 0f02          	clr	(OFST+0,sp)
 240                     ; 55   nrf24_configRegister(EN_AA, send);
 242  004b ae0100        	ldw	x,#256
 243  004e cd0000        	call	_nrf24_configRegister
 245                     ; 56   nrf24_readRegister(EN_AA, &rcv, 1);
 247  0051 4b01          	push	#1
 248  0053 96            	ldw	x,sp
 249  0054 1c0002        	addw	x,#OFST+0
 250  0057 89            	pushw	x
 251  0058 a601          	ld	a,#1
 252  005a cd0000        	call	_nrf24_readRegister
 254  005d 5b03          	addw	sp,#3
 255                     ; 57   if(rcv != send)
 257  005f 7b01          	ld	a,(OFST-1,sp)
 258  0061 1102          	cp	a,(OFST+0,sp)
 259  0063 2705          	jreq	L76
 260                     ; 59     Errors_SetError(ERROR_NRF24_INIT);
 262  0065 a601          	ld	a,#1
 263  0067 cd0000        	call	_Errors_SetError
 265  006a               L76:
 266                     ; 63   send = nrf24_CONFIG;
 268  006a a63c          	ld	a,#60
 269  006c 6b02          	ld	(OFST+0,sp),a
 270                     ; 64   nrf24_configRegister(CONFIG, send);
 272  006e ae003c        	ldw	x,#60
 273  0071 cd0000        	call	_nrf24_configRegister
 275                     ; 65   nrf24_readRegister(CONFIG, &rcv, 1);
 277  0074 4b01          	push	#1
 278  0076 96            	ldw	x,sp
 279  0077 1c0002        	addw	x,#OFST+0
 280  007a 89            	pushw	x
 281  007b 4f            	clr	a
 282  007c cd0000        	call	_nrf24_readRegister
 284  007f 5b03          	addw	sp,#3
 285                     ; 66   if(rcv != send)
 287  0081 7b01          	ld	a,(OFST-1,sp)
 288  0083 1102          	cp	a,(OFST+0,sp)
 289  0085 2705          	jreq	L17
 290                     ; 68     Errors_SetError(ERROR_NRF24_INIT);
 292  0087 a601          	ld	a,#1
 293  0089 cd0000        	call	_Errors_SetError
 295  008c               L17:
 296                     ; 72   send = (0x02<<ARD)|(0x00<<ARC);
 298  008c a620          	ld	a,#32
 299  008e 6b02          	ld	(OFST+0,sp),a
 300                     ; 73   nrf24_configRegister(SETUP_RETR, send);
 302  0090 ae0420        	ldw	x,#1056
 303  0093 cd0000        	call	_nrf24_configRegister
 305                     ; 74   nrf24_readRegister(SETUP_RETR, &rcv, 1);
 307  0096 4b01          	push	#1
 308  0098 96            	ldw	x,sp
 309  0099 1c0002        	addw	x,#OFST+0
 310  009c 89            	pushw	x
 311  009d a604          	ld	a,#4
 312  009f cd0000        	call	_nrf24_readRegister
 314  00a2 5b03          	addw	sp,#3
 315                     ; 75   if(rcv != send)
 317  00a4 7b01          	ld	a,(OFST-1,sp)
 318  00a6 1102          	cp	a,(OFST+0,sp)
 319  00a8 2705          	jreq	L37
 320                     ; 77     Errors_SetError(ERROR_NRF24_INIT);
 322  00aa a601          	ld	a,#1
 323  00ac cd0000        	call	_Errors_SetError
 325  00af               L37:
 326                     ; 81   send = nrf24_ADDR_LEN - 2;
 328  00af a603          	ld	a,#3
 329  00b1 6b02          	ld	(OFST+0,sp),a
 330                     ; 82   nrf24_configRegister(SETUP_AW, send);
 332  00b3 ae0303        	ldw	x,#771
 333  00b6 cd0000        	call	_nrf24_configRegister
 335                     ; 83   nrf24_readRegister(SETUP_AW, &rcv, 1);
 337  00b9 4b01          	push	#1
 338  00bb 96            	ldw	x,sp
 339  00bc 1c0002        	addw	x,#OFST+0
 340  00bf 89            	pushw	x
 341  00c0 a603          	ld	a,#3
 342  00c2 cd0000        	call	_nrf24_readRegister
 344  00c5 5b03          	addw	sp,#3
 345                     ; 84   if(rcv != send)
 347  00c7 7b01          	ld	a,(OFST-1,sp)
 348  00c9 1102          	cp	a,(OFST+0,sp)
 349  00cb 2705          	jreq	L57
 350                     ; 86     Errors_SetError(ERROR_NRF24_INIT);
 352  00cd a601          	ld	a,#1
 353  00cf cd0000        	call	_Errors_SetError
 355  00d2               L57:
 356                     ; 90   nrf24_writeRegister(TX_ADDR, txadr, nrf24_ADDR_LEN);
 358  00d2 4b05          	push	#5
 359  00d4 1e0a          	ldw	x,(OFST+8,sp)
 360  00d6 89            	pushw	x
 361  00d7 a610          	ld	a,#16
 362  00d9 cd0000        	call	_nrf24_writeRegister
 364  00dc 5b03          	addw	sp,#3
 365                     ; 93   nrf24_writeRegister(RX_ADDR_P0, rxadr, nrf24_ADDR_LEN);
 367  00de 4b05          	push	#5
 368  00e0 1e08          	ldw	x,(OFST+6,sp)
 369  00e2 89            	pushw	x
 370  00e3 a60a          	ld	a,#10
 371  00e5 cd0000        	call	_nrf24_writeRegister
 373  00e8 5b03          	addw	sp,#3
 374                     ; 96   nrf24_RXmode();
 376  00ea cd0000        	call	_nrf24_RXmode
 378                     ; 99   nrf24_configRegister(RX_PW_P0, payload_len); 
 380  00ed b600          	ld	a,_payload_len
 381  00ef 97            	ld	xl,a
 382  00f0 a611          	ld	a,#17
 383  00f2 95            	ld	xh,a
 384  00f3 cd0000        	call	_nrf24_configRegister
 386                     ; 100   nrf24_readRegister(RX_PW_P0, &rcv, 1);
 388  00f6 4b01          	push	#1
 389  00f8 96            	ldw	x,sp
 390  00f9 1c0002        	addw	x,#OFST+0
 391  00fc 89            	pushw	x
 392  00fd a611          	ld	a,#17
 393  00ff cd0000        	call	_nrf24_readRegister
 395  0102 5b03          	addw	sp,#3
 396                     ; 101   if(rcv != payload_len)
 398  0104 7b01          	ld	a,(OFST-1,sp)
 399  0106 b100          	cp	a,_payload_len
 400  0108 2705          	jreq	L77
 401                     ; 103     Errors_SetError(ERROR_NRF24_INIT);
 403  010a a601          	ld	a,#1
 404  010c cd0000        	call	_Errors_SetError
 406  010f               L77:
 407                     ; 107   nrf24_SetRFChannel(channel);
 409  010f 7b03          	ld	a,(OFST+1,sp)
 410  0111 cd0000        	call	_nrf24_SetRFChannel
 412                     ; 110   nrf24_powerUP();
 414  0114 cd0000        	call	_nrf24_powerUP
 416                     ; 112   nrf24_ce_digitalWrite(HIGH);   // Set Chip Enable (CE) pin high to enable reciever
 418  0117 a601          	ld	a,#1
 419  0119 cd0000        	call	_nrf24_ce_digitalWrite
 421                     ; 113 }
 424  011c 5b04          	addw	sp,#4
 425  011e 81            	ret	
 492                     ; 116 void nrf24_config_esb(uint8_t channel, uint8_t pay_length)
 492                     ; 117 {
 493                     .text:	section	.text,new
 494  0000               _nrf24_config_esb:
 496  0000 89            	pushw	x
 497  0001 89            	pushw	x
 498       00000002      OFST:	set	2
 501                     ; 120   payload_len = pay_length;
 503  0002 9f            	ld	a,xl
 504  0003 b700          	ld	_payload_len,a
 505                     ; 122   Errors_ResetError(ERROR_NRF24_INIT);
 507  0005 a601          	ld	a,#1
 508  0007 cd0000        	call	_Errors_ResetError
 510                     ; 125   nrf24_configRegister(RF_CH,channel);
 512  000a 7b03          	ld	a,(OFST+1,sp)
 513  000c 97            	ld	xl,a
 514  000d a605          	ld	a,#5
 515  000f 95            	ld	xh,a
 516  0010 cd0000        	call	_nrf24_configRegister
 518                     ; 126   nrf24_readRegister(RF_CH, &rcv, 1);
 520  0013 4b01          	push	#1
 521  0015 96            	ldw	x,sp
 522  0016 1c0003        	addw	x,#OFST+1
 523  0019 89            	pushw	x
 524  001a a605          	ld	a,#5
 525  001c cd0000        	call	_nrf24_readRegister
 527  001f 5b03          	addw	sp,#3
 528                     ; 127   if(rcv != channel)
 530  0021 7b02          	ld	a,(OFST+0,sp)
 531  0023 1103          	cp	a,(OFST+1,sp)
 532  0025 2705          	jreq	L331
 533                     ; 129     Errors_SetError(ERROR_NRF24_INIT);
 535  0027 a601          	ld	a,#1
 536  0029 cd0000        	call	_Errors_SetError
 538  002c               L331:
 539                     ; 133   nrf24_configRegister(RX_PW_P0, 0x00); // Auto-ACK pipe ...
 541  002c ae1100        	ldw	x,#4352
 542  002f cd0000        	call	_nrf24_configRegister
 544                     ; 134   nrf24_readRegister(RX_PW_P0, &rcv, 1);
 546  0032 4b01          	push	#1
 547  0034 96            	ldw	x,sp
 548  0035 1c0003        	addw	x,#OFST+1
 549  0038 89            	pushw	x
 550  0039 a611          	ld	a,#17
 551  003b cd0000        	call	_nrf24_readRegister
 553  003e 5b03          	addw	sp,#3
 554                     ; 135   if(rcv != 0x00)
 556  0040 7b02          	ld	a,(OFST+0,sp)
 557  0042 2705          	jreq	L531
 558                     ; 137     Errors_SetError(ERROR_NRF24_INIT);
 560  0044 a601          	ld	a,#1
 561  0046 cd0000        	call	_Errors_SetError
 563  0049               L531:
 564                     ; 140   nrf24_configRegister(RX_PW_P1, payload_len); // Data payload pipe
 566  0049 b600          	ld	a,_payload_len
 567  004b 97            	ld	xl,a
 568  004c a612          	ld	a,#18
 569  004e 95            	ld	xh,a
 570  004f cd0000        	call	_nrf24_configRegister
 572                     ; 141   nrf24_readRegister(RX_PW_P1, &rcv, 1);
 574  0052 4b01          	push	#1
 575  0054 96            	ldw	x,sp
 576  0055 1c0003        	addw	x,#OFST+1
 577  0058 89            	pushw	x
 578  0059 a612          	ld	a,#18
 579  005b cd0000        	call	_nrf24_readRegister
 581  005e 5b03          	addw	sp,#3
 582                     ; 142   if(rcv != payload_len)
 584  0060 7b02          	ld	a,(OFST+0,sp)
 585  0062 b100          	cp	a,_payload_len
 586  0064 2705          	jreq	L731
 587                     ; 144     Errors_SetError(ERROR_NRF24_INIT);
 589  0066 a601          	ld	a,#1
 590  0068 cd0000        	call	_Errors_SetError
 592  006b               L731:
 593                     ; 147   nrf24_configRegister(RX_PW_P2, 0x00); // Pipe not used 
 595  006b ae1300        	ldw	x,#4864
 596  006e cd0000        	call	_nrf24_configRegister
 598                     ; 148   nrf24_readRegister(RX_PW_P2, &rcv, 1);
 600  0071 4b01          	push	#1
 601  0073 96            	ldw	x,sp
 602  0074 1c0003        	addw	x,#OFST+1
 603  0077 89            	pushw	x
 604  0078 a613          	ld	a,#19
 605  007a cd0000        	call	_nrf24_readRegister
 607  007d 5b03          	addw	sp,#3
 608                     ; 149   if(rcv != 0x00)
 610  007f 7b02          	ld	a,(OFST+0,sp)
 611  0081 2705          	jreq	L141
 612                     ; 151     Errors_SetError(ERROR_NRF24_INIT);
 614  0083 a601          	ld	a,#1
 615  0085 cd0000        	call	_Errors_SetError
 617  0088               L141:
 618                     ; 154   nrf24_configRegister(RX_PW_P3, 0x00); // Pipe not used 
 620  0088 ae1400        	ldw	x,#5120
 621  008b cd0000        	call	_nrf24_configRegister
 623                     ; 155   nrf24_readRegister(RX_PW_P3, &rcv, 1);
 625  008e 4b01          	push	#1
 626  0090 96            	ldw	x,sp
 627  0091 1c0003        	addw	x,#OFST+1
 628  0094 89            	pushw	x
 629  0095 a614          	ld	a,#20
 630  0097 cd0000        	call	_nrf24_readRegister
 632  009a 5b03          	addw	sp,#3
 633                     ; 156   if(rcv != 0x00)
 635  009c 7b02          	ld	a,(OFST+0,sp)
 636  009e 2705          	jreq	L341
 637                     ; 158     Errors_SetError(ERROR_NRF24_INIT);
 639  00a0 a601          	ld	a,#1
 640  00a2 cd0000        	call	_Errors_SetError
 642  00a5               L341:
 643                     ; 161   nrf24_configRegister(RX_PW_P4, 0x00); // Pipe not used 
 645  00a5 ae1500        	ldw	x,#5376
 646  00a8 cd0000        	call	_nrf24_configRegister
 648                     ; 162   nrf24_readRegister(RX_PW_P4, &rcv, 1);
 650  00ab 4b01          	push	#1
 651  00ad 96            	ldw	x,sp
 652  00ae 1c0003        	addw	x,#OFST+1
 653  00b1 89            	pushw	x
 654  00b2 a615          	ld	a,#21
 655  00b4 cd0000        	call	_nrf24_readRegister
 657  00b7 5b03          	addw	sp,#3
 658                     ; 163   if(rcv != 0x00)
 660  00b9 7b02          	ld	a,(OFST+0,sp)
 661  00bb 2705          	jreq	L541
 662                     ; 165     Errors_SetError(ERROR_NRF24_INIT);
 664  00bd a601          	ld	a,#1
 665  00bf cd0000        	call	_Errors_SetError
 667  00c2               L541:
 668                     ; 168   nrf24_configRegister(RX_PW_P5, 0x00); // Pipe not used 
 670  00c2 ae1600        	ldw	x,#5632
 671  00c5 cd0000        	call	_nrf24_configRegister
 673                     ; 169   nrf24_readRegister(RX_PW_P5, &rcv, 1);
 675  00c8 4b01          	push	#1
 676  00ca 96            	ldw	x,sp
 677  00cb 1c0003        	addw	x,#OFST+1
 678  00ce 89            	pushw	x
 679  00cf a616          	ld	a,#22
 680  00d1 cd0000        	call	_nrf24_readRegister
 682  00d4 5b03          	addw	sp,#3
 683                     ; 170   if(rcv != 0x00)
 685  00d6 7b02          	ld	a,(OFST+0,sp)
 686  00d8 2705          	jreq	L741
 687                     ; 172     Errors_SetError(ERROR_NRF24_INIT);
 689  00da a601          	ld	a,#1
 690  00dc cd0000        	call	_Errors_SetError
 692  00df               L741:
 693                     ; 177   send = (1<<RF_DR_LOW)|((3)<<RF_PWR);
 695  00df a626          	ld	a,#38
 696  00e1 6b01          	ld	(OFST-1,sp),a
 697                     ; 178   nrf24_configRegister(RF_SETUP, send);
 699  00e3 ae0626        	ldw	x,#1574
 700  00e6 cd0000        	call	_nrf24_configRegister
 702                     ; 179   nrf24_readRegister(RF_SETUP, &rcv, 1);
 704  00e9 4b01          	push	#1
 705  00eb 96            	ldw	x,sp
 706  00ec 1c0003        	addw	x,#OFST+1
 707  00ef 89            	pushw	x
 708  00f0 a606          	ld	a,#6
 709  00f2 cd0000        	call	_nrf24_readRegister
 711  00f5 5b03          	addw	sp,#3
 712                     ; 180   if(rcv != send)
 714  00f7 7b02          	ld	a,(OFST+0,sp)
 715  00f9 1101          	cp	a,(OFST-1,sp)
 716  00fb 2705          	jreq	L151
 717                     ; 182     Errors_SetError(ERROR_NRF24_INIT);
 719  00fd a601          	ld	a,#1
 720  00ff cd0000        	call	_Errors_SetError
 722  0102               L151:
 723                     ; 186   send = nrf24_CONFIG;
 725  0102 a63c          	ld	a,#60
 726  0104 6b01          	ld	(OFST-1,sp),a
 727                     ; 187   nrf24_configRegister(CONFIG, send);
 729  0106 ae003c        	ldw	x,#60
 730  0109 cd0000        	call	_nrf24_configRegister
 732                     ; 188   nrf24_readRegister(CONFIG, &rcv, 1);
 734  010c 4b01          	push	#1
 735  010e 96            	ldw	x,sp
 736  010f 1c0003        	addw	x,#OFST+1
 737  0112 89            	pushw	x
 738  0113 4f            	clr	a
 739  0114 cd0000        	call	_nrf24_readRegister
 741  0117 5b03          	addw	sp,#3
 742                     ; 189   if(rcv != send)
 744  0119 7b02          	ld	a,(OFST+0,sp)
 745  011b 1101          	cp	a,(OFST-1,sp)
 746  011d 2705          	jreq	L351
 747                     ; 191     Errors_SetError(ERROR_NRF24_INIT);
 749  011f a601          	ld	a,#1
 750  0121 cd0000        	call	_Errors_SetError
 752  0124               L351:
 753                     ; 195   send = (1<<ENAA_P0)|(1<<ENAA_P1)|(0<<ENAA_P2)|(0<<ENAA_P3)|(0<<ENAA_P4)|(0<<ENAA_P5);
 755  0124 a603          	ld	a,#3
 756  0126 6b01          	ld	(OFST-1,sp),a
 757                     ; 196   nrf24_configRegister(EN_AA, send);
 759  0128 ae0103        	ldw	x,#259
 760  012b cd0000        	call	_nrf24_configRegister
 762                     ; 197   nrf24_readRegister(EN_AA, &rcv, 1);
 764  012e 4b01          	push	#1
 765  0130 96            	ldw	x,sp
 766  0131 1c0003        	addw	x,#OFST+1
 767  0134 89            	pushw	x
 768  0135 a601          	ld	a,#1
 769  0137 cd0000        	call	_nrf24_readRegister
 771  013a 5b03          	addw	sp,#3
 772                     ; 198   if(rcv != send)
 774  013c 7b02          	ld	a,(OFST+0,sp)
 775  013e 1101          	cp	a,(OFST-1,sp)
 776  0140 2705          	jreq	L551
 777                     ; 200     Errors_SetError(ERROR_NRF24_INIT);
 779  0142 a601          	ld	a,#1
 780  0144 cd0000        	call	_Errors_SetError
 782  0147               L551:
 783                     ; 204   send = (1<<ERX_P0)|(1<<ERX_P1)|(0<<ERX_P2)|(0<<ERX_P3)|(0<<ERX_P4)|(0<<ERX_P5);
 785  0147 a603          	ld	a,#3
 786  0149 6b01          	ld	(OFST-1,sp),a
 787                     ; 205   nrf24_configRegister(EN_RXADDR, send);
 789  014b ae0203        	ldw	x,#515
 790  014e cd0000        	call	_nrf24_configRegister
 792                     ; 206   nrf24_readRegister(EN_RXADDR, &rcv, 1);
 794  0151 4b01          	push	#1
 795  0153 96            	ldw	x,sp
 796  0154 1c0003        	addw	x,#OFST+1
 797  0157 89            	pushw	x
 798  0158 a602          	ld	a,#2
 799  015a cd0000        	call	_nrf24_readRegister
 801  015d 5b03          	addw	sp,#3
 802                     ; 207   if(rcv != send)
 804  015f 7b02          	ld	a,(OFST+0,sp)
 805  0161 1101          	cp	a,(OFST-1,sp)
 806  0163 2705          	jreq	L751
 807                     ; 209     Errors_SetError(ERROR_NRF24_INIT);
 809  0165 a601          	ld	a,#1
 810  0167 cd0000        	call	_Errors_SetError
 812  016a               L751:
 813                     ; 213   send = (0x04<<ARD)|(0x0F<<ARC);
 815  016a a64f          	ld	a,#79
 816  016c 6b01          	ld	(OFST-1,sp),a
 817                     ; 214   nrf24_configRegister(SETUP_RETR, send);
 819  016e ae044f        	ldw	x,#1103
 820  0171 cd0000        	call	_nrf24_configRegister
 822                     ; 215   nrf24_readRegister(SETUP_RETR, &rcv, 1);
 824  0174 4b01          	push	#1
 825  0176 96            	ldw	x,sp
 826  0177 1c0003        	addw	x,#OFST+1
 827  017a 89            	pushw	x
 828  017b a604          	ld	a,#4
 829  017d cd0000        	call	_nrf24_readRegister
 831  0180 5b03          	addw	sp,#3
 832                     ; 216   if(rcv != send)
 834  0182 7b02          	ld	a,(OFST+0,sp)
 835  0184 1101          	cp	a,(OFST-1,sp)
 836  0186 2705          	jreq	L161
 837                     ; 218     Errors_SetError(ERROR_NRF24_INIT);
 839  0188 a601          	ld	a,#1
 840  018a cd0000        	call	_Errors_SetError
 842  018d               L161:
 843                     ; 222   send = (0<<DPL_P0)|(0<<DPL_P1)|(0<<DPL_P2)|(0<<DPL_P3)|(0<<DPL_P4)|(0<<DPL_P5);
 845  018d 0f01          	clr	(OFST-1,sp)
 846                     ; 223   nrf24_configRegister(DYNPD, send);
 848  018f ae1c00        	ldw	x,#7168
 849  0192 cd0000        	call	_nrf24_configRegister
 851                     ; 224   nrf24_readRegister(DYNPD, &rcv, 1);
 853  0195 4b01          	push	#1
 854  0197 96            	ldw	x,sp
 855  0198 1c0003        	addw	x,#OFST+1
 856  019b 89            	pushw	x
 857  019c a61c          	ld	a,#28
 858  019e cd0000        	call	_nrf24_readRegister
 860  01a1 5b03          	addw	sp,#3
 861                     ; 225   if(rcv != send)
 863  01a3 7b02          	ld	a,(OFST+0,sp)
 864  01a5 1101          	cp	a,(OFST-1,sp)
 865  01a7 2705          	jreq	L361
 866                     ; 227     Errors_SetError(ERROR_NRF24_INIT);
 868  01a9 a601          	ld	a,#1
 869  01ab cd0000        	call	_Errors_SetError
 871  01ae               L361:
 872                     ; 231   nrf24_powerUpRx();
 874  01ae cd0000        	call	_nrf24_powerUpRx
 876                     ; 232 }
 879  01b1 5b04          	addw	sp,#4
 880  01b3 81            	ret	
 917                     ; 235 void nrf24_rx_address(uint8_t * adr) 
 917                     ; 236 {
 918                     .text:	section	.text,new
 919  0000               _nrf24_rx_address:
 921  0000 89            	pushw	x
 922       00000000      OFST:	set	0
 925                     ; 237     nrf24_ce_digitalWrite(LOW);
 927  0001 4f            	clr	a
 928  0002 cd0000        	call	_nrf24_ce_digitalWrite
 930                     ; 238     nrf24_writeRegister(RX_ADDR_P1, adr, nrf24_ADDR_LEN);
 932  0005 4b05          	push	#5
 933  0007 1e02          	ldw	x,(OFST+2,sp)
 934  0009 89            	pushw	x
 935  000a a60b          	ld	a,#11
 936  000c cd0000        	call	_nrf24_writeRegister
 938  000f 5b03          	addw	sp,#3
 939                     ; 239     nrf24_ce_digitalWrite(HIGH);
 941  0011 a601          	ld	a,#1
 942  0013 cd0000        	call	_nrf24_ce_digitalWrite
 944                     ; 240 }
 947  0016 85            	popw	x
 948  0017 81            	ret	
 973                     ; 243 uint8_t nrf24_payload_length()
 973                     ; 244 {
 974                     .text:	section	.text,new
 975  0000               _nrf24_payload_length:
 979                     ; 245     return payload_len;
 981  0000 b600          	ld	a,_payload_len
 984  0002 81            	ret	
1020                     ; 249 void nrf24_tx_address(uint8_t* adr)
1020                     ; 250 {
1021                     .text:	section	.text,new
1022  0000               _nrf24_tx_address:
1024  0000 89            	pushw	x
1025       00000000      OFST:	set	0
1028                     ; 252     nrf24_writeRegister(RX_ADDR_P0,adr,nrf24_ADDR_LEN);
1030  0001 4b05          	push	#5
1031  0003 89            	pushw	x
1032  0004 a60a          	ld	a,#10
1033  0006 cd0000        	call	_nrf24_writeRegister
1035  0009 5b03          	addw	sp,#3
1036                     ; 253     nrf24_writeRegister(TX_ADDR,adr,nrf24_ADDR_LEN);
1038  000b 4b05          	push	#5
1039  000d 1e02          	ldw	x,(OFST+2,sp)
1040  000f 89            	pushw	x
1041  0010 a610          	ld	a,#16
1042  0012 cd0000        	call	_nrf24_writeRegister
1044  0015 5b03          	addw	sp,#3
1045                     ; 254 }
1048  0017 85            	popw	x
1049  0018 81            	ret	
1085                     ; 258 uint8_t nrf24_dataReady() 
1085                     ; 259 {
1086                     .text:	section	.text,new
1087  0000               _nrf24_dataReady:
1089  0000 88            	push	a
1090       00000001      OFST:	set	1
1093                     ; 261     uint8_t status = nrf24_getStatus();
1095  0001 cd0000        	call	_nrf24_getStatus
1097  0004 6b01          	ld	(OFST+0,sp),a
1098                     ; 265     if ( status & (1 << RX_DR) ) 
1100  0006 a540          	bcp	a,#64
1101  0008 2705          	jreq	L742
1102                     ; 267         return 1;
1104  000a a601          	ld	a,#1
1107  000c 5b01          	addw	sp,#1
1108  000e 81            	ret	
1109  000f               L742:
1110                     ; 270     return !nrf24_rxFifoEmpty();
1112  000f cd0000        	call	_nrf24_rxFifoEmpty
1114  0012 4d            	tnz	a
1115  0013 2603          	jrne	L452
1116  0015 4c            	inc	a
1117  0016 2001          	jra	L062
1118  0018               L452:
1119  0018 4f            	clr	a
1120  0019               L062:
1123  0019 5b01          	addw	sp,#1
1124  001b 81            	ret	
1159                     ; 274 uint8_t nrf24_rxFifoEmpty()
1159                     ; 275 {
1160                     .text:	section	.text,new
1161  0000               _nrf24_rxFifoEmpty:
1163  0000 88            	push	a
1164       00000001      OFST:	set	1
1167                     ; 278     nrf24_readRegister(FIFO_STATUS,&fifoStatus,1);
1169  0001 4b01          	push	#1
1170  0003 96            	ldw	x,sp
1171  0004 1c0002        	addw	x,#OFST+1
1172  0007 89            	pushw	x
1173  0008 a617          	ld	a,#23
1174  000a cd0000        	call	_nrf24_readRegister
1176  000d 5b03          	addw	sp,#3
1177                     ; 280     return (fifoStatus & (1 << RX_EMPTY));
1179  000f 7b01          	ld	a,(OFST+0,sp)
1180  0011 a401          	and	a,#1
1183  0013 5b01          	addw	sp,#1
1184  0015 81            	ret	
1221                     ; 284 uint8_t nrf24_payloadLength()
1221                     ; 285 {
1222                     .text:	section	.text,new
1223  0000               _nrf24_payloadLength:
1225  0000 88            	push	a
1226       00000001      OFST:	set	1
1229                     ; 287     nrf24_csn_digitalWrite(LOW);
1231  0001 4f            	clr	a
1232  0002 cd0000        	call	_nrf24_csn_digitalWrite
1234                     ; 288     spi_transfer(R_RX_PL_WID);
1236  0005 a660          	ld	a,#96
1237  0007 cd0000        	call	_spi_transfer
1239                     ; 289     status = spi_transfer(0x00);
1241  000a 4f            	clr	a
1242  000b cd0000        	call	_spi_transfer
1244  000e 6b01          	ld	(OFST+0,sp),a
1245                     ; 290     nrf24_csn_digitalWrite(HIGH);
1247  0010 a601          	ld	a,#1
1248  0012 cd0000        	call	_nrf24_csn_digitalWrite
1250                     ; 291     return status;
1252  0015 7b01          	ld	a,(OFST+0,sp)
1255  0017 5b01          	addw	sp,#1
1256  0019 81            	ret	
1316                     ; 295 void nrf24_getData(uint8_t* data) 
1316                     ; 296 {
1317                     .text:	section	.text,new
1318  0000               _nrf24_getData:
1320  0000 89            	pushw	x
1321  0001 89            	pushw	x
1322       00000002      OFST:	set	2
1325                     ; 299   nrf24_csn_digitalWrite(LOW);                               
1327  0002 4f            	clr	a
1328  0003 cd0000        	call	_nrf24_csn_digitalWrite
1330                     ; 302   spi_transfer( R_RX_PAYLOAD );
1332  0006 a661          	ld	a,#97
1333  0008 cd0000        	call	_spi_transfer
1335                     ; 305   nrf24_transferSync(data,data,payload_len);
1337  000b 3b0000        	push	_payload_len
1338  000e 1e04          	ldw	x,(OFST+2,sp)
1339  0010 89            	pushw	x
1340  0011 1e06          	ldw	x,(OFST+4,sp)
1341  0013 cd0000        	call	_nrf24_transferSync
1343  0016 5b03          	addw	sp,#3
1344                     ; 308   nrf24_csn_digitalWrite(HIGH);
1346  0018 a601          	ld	a,#1
1347  001a cd0000        	call	_nrf24_csn_digitalWrite
1349                     ; 311   nrf24_readRegister(STATUS, &send, 1);
1351  001d 4b01          	push	#1
1352  001f 96            	ldw	x,sp
1353  0020 1c0002        	addw	x,#OFST+0
1354  0023 89            	pushw	x
1355  0024 a607          	ld	a,#7
1356  0026 cd0000        	call	_nrf24_readRegister
1358  0029 5b03          	addw	sp,#3
1359                     ; 312   nrf24_configRegister(STATUS,(1<<RX_DR));
1361  002b ae0740        	ldw	x,#1856
1362  002e cd0000        	call	_nrf24_configRegister
1364                     ; 313   nrf24_readRegister(STATUS, &rcv, 1);
1366  0031 4b01          	push	#1
1367  0033 96            	ldw	x,sp
1368  0034 1c0003        	addw	x,#OFST+1
1369  0037 89            	pushw	x
1370  0038 a607          	ld	a,#7
1371  003a cd0000        	call	_nrf24_readRegister
1373  003d 5b03          	addw	sp,#3
1374                     ; 314   if(rcv & (1<<RX_DR))
1376  003f 7b02          	ld	a,(OFST+0,sp)
1377  0041 a540          	bcp	a,#64
1378  0043 2705          	jreq	L333
1379                     ; 316     Errors_SetError(ERROR_NRF24_COMM);
1381  0045 a602          	ld	a,#2
1382  0047 cd0000        	call	_Errors_SetError
1384  004a               L333:
1385                     ; 318 }
1388  004a 5b04          	addw	sp,#4
1389  004c 81            	ret	
1425                     ; 321 uint8_t nrf24_retransmissionCount()
1425                     ; 322 {
1426                     .text:	section	.text,new
1427  0000               _nrf24_retransmissionCount:
1429  0000 88            	push	a
1430       00000001      OFST:	set	1
1433                     ; 324     nrf24_readRegister(OBSERVE_TX,&rv,1);
1435  0001 4b01          	push	#1
1436  0003 96            	ldw	x,sp
1437  0004 1c0002        	addw	x,#OFST+1
1438  0007 89            	pushw	x
1439  0008 a608          	ld	a,#8
1440  000a cd0000        	call	_nrf24_readRegister
1442  000d 5b03          	addw	sp,#3
1443                     ; 325     rv = rv & 0x0F;
1445  000f 7b01          	ld	a,(OFST+0,sp)
1446  0011 a40f          	and	a,#15
1447                     ; 326     return rv;
1451  0013 5b01          	addw	sp,#1
1452  0015 81            	ret	
1493                     ; 331 void nrf24_send(uint8_t* value) 
1493                     ; 332 {    
1494                     .text:	section	.text,new
1495  0000               _nrf24_send:
1497  0000 89            	pushw	x
1498       00000000      OFST:	set	0
1501                     ; 334     nrf24_ce_digitalWrite(LOW);
1503  0001 4f            	clr	a
1504  0002 cd0000        	call	_nrf24_ce_digitalWrite
1506                     ; 337     nrf24_powerUpTx();
1508  0005 cd0000        	call	_nrf24_powerUpTx
1510                     ; 352     nrf24_csn_digitalWrite(LOW);
1512  0008 4f            	clr	a
1513  0009 cd0000        	call	_nrf24_csn_digitalWrite
1515                     ; 355     spi_transfer(W_TX_PAYLOAD);
1517  000c a6a0          	ld	a,#160
1518  000e cd0000        	call	_spi_transfer
1520                     ; 358     nrf24_transmitSync(value, payload_len);   
1522  0011 3b0000        	push	_payload_len
1523  0014 1e02          	ldw	x,(OFST+2,sp)
1524  0016 cd0000        	call	_nrf24_transmitSync
1526  0019 84            	pop	a
1527                     ; 361     nrf24_csn_digitalWrite(HIGH);
1529  001a a601          	ld	a,#1
1530  001c cd0000        	call	_nrf24_csn_digitalWrite
1532                     ; 364     nrf24_ce_digitalWrite(HIGH);    
1534  001f a601          	ld	a,#1
1535  0021 cd0000        	call	_nrf24_ce_digitalWrite
1537                     ; 365 }
1540  0024 85            	popw	x
1541  0025 81            	ret	
1576                     ; 367 uint8_t nrf24_isSending()
1576                     ; 368 {
1577                     .text:	section	.text,new
1578  0000               _nrf24_isSending:
1580  0000 88            	push	a
1581       00000001      OFST:	set	1
1584                     ; 372     status = nrf24_getStatus();
1586  0001 cd0000        	call	_nrf24_getStatus
1588  0004 6b01          	ld	(OFST+0,sp),a
1589                     ; 375     if((status & ((1 << TX_DS)  | (1 << MAX_RT))))
1591  0006 a530          	bcp	a,#48
1592  0008 2704          	jreq	L704
1593                     ; 377         return 0; /* false */
1595  000a 4f            	clr	a
1598  000b 5b01          	addw	sp,#1
1599  000d 81            	ret	
1600  000e               L704:
1601                     ; 380     return 1; /* true */
1603  000e a601          	ld	a,#1
1606  0010 5b01          	addw	sp,#1
1607  0012 81            	ret	
1643                     ; 384 uint8_t nrf24_getStatus()
1643                     ; 385 {
1644                     .text:	section	.text,new
1645  0000               _nrf24_getStatus:
1647  0000 88            	push	a
1648       00000001      OFST:	set	1
1651                     ; 387     nrf24_csn_digitalWrite(LOW);
1653  0001 4f            	clr	a
1654  0002 cd0000        	call	_nrf24_csn_digitalWrite
1656                     ; 388     rv = spi_transfer(NOP);
1658  0005 a6ff          	ld	a,#255
1659  0007 cd0000        	call	_spi_transfer
1661  000a 6b01          	ld	(OFST+0,sp),a
1662                     ; 389     nrf24_csn_digitalWrite(HIGH);
1664  000c a601          	ld	a,#1
1665  000e cd0000        	call	_nrf24_csn_digitalWrite
1667                     ; 390     return rv;
1669  0011 7b01          	ld	a,(OFST+0,sp)
1672  0013 5b01          	addw	sp,#1
1673  0015 81            	ret	
1709                     ; 393 uint8_t nrf24_lastMessageStatus()
1709                     ; 394 {
1710                     .text:	section	.text,new
1711  0000               _nrf24_lastMessageStatus:
1713  0000 88            	push	a
1714       00000001      OFST:	set	1
1717                     ; 397     rv = nrf24_getStatus();
1719  0001 cd0000        	call	_nrf24_getStatus
1721  0004 6b01          	ld	(OFST+0,sp),a
1722                     ; 400     if((rv & ((1 << TX_DS))))
1724  0006 a520          	bcp	a,#32
1725  0008 2704          	jreq	L544
1726                     ; 402         return NRF24_TRANSMISSON_OK;
1728  000a 4f            	clr	a
1731  000b 5b01          	addw	sp,#1
1732  000d 81            	ret	
1733  000e               L544:
1734                     ; 406     else if((rv & ((1 << MAX_RT))))
1736  000e a510          	bcp	a,#16
1737  0010 2705          	jreq	L154
1738                     ; 408         return NRF24_MESSAGE_LOST;
1740  0012 a601          	ld	a,#1
1743  0014 5b01          	addw	sp,#1
1744  0016 81            	ret	
1745  0017               L154:
1746                     ; 413         return 0xFF;
1748  0017 a6ff          	ld	a,#255
1751  0019 5b01          	addw	sp,#1
1752  001b 81            	ret	
1801                     ; 417 void nrf24_powerUpRx()
1801                     ; 418 {     
1802                     .text:	section	.text,new
1803  0000               _nrf24_powerUpRx:
1805  0000 89            	pushw	x
1806       00000002      OFST:	set	2
1809                     ; 420     nrf24_csn_digitalWrite(LOW);
1811  0001 4f            	clr	a
1812  0002 cd0000        	call	_nrf24_csn_digitalWrite
1814                     ; 421     spi_transfer(FLUSH_RX);
1816  0005 a6e2          	ld	a,#226
1817  0007 cd0000        	call	_spi_transfer
1819                     ; 422     nrf24_csn_digitalWrite(HIGH);
1821  000a a601          	ld	a,#1
1822  000c cd0000        	call	_nrf24_csn_digitalWrite
1824                     ; 424     send = (1<<RX_DR)|(1<<TX_DS)|(1<<MAX_RT);
1826  000f a670          	ld	a,#112
1827  0011 6b02          	ld	(OFST+0,sp),a
1828                     ; 425     nrf24_configRegister(STATUS, send);
1830  0013 ae0770        	ldw	x,#1904
1831  0016 cd0000        	call	_nrf24_configRegister
1833                     ; 426     nrf24_readRegister(STATUS, &rcv, 1);
1835  0019 4b01          	push	#1
1836  001b 96            	ldw	x,sp
1837  001c 1c0002        	addw	x,#OFST+0
1838  001f 89            	pushw	x
1839  0020 a607          	ld	a,#7
1840  0022 cd0000        	call	_nrf24_readRegister
1842  0025 5b03          	addw	sp,#3
1843                     ; 427     if(rcv & send)  // RX_DR, TX_DS, MAX_RT should be reset
1845  0027 7b01          	ld	a,(OFST-1,sp)
1846  0029 1502          	bcp	a,(OFST+0,sp)
1847  002b 2705          	jreq	L774
1848                     ; 429       Errors_SetError(ERROR_NRF24_INIT);
1850  002d a601          	ld	a,#1
1851  002f cd0000        	call	_Errors_SetError
1853  0032               L774:
1854                     ; 432     nrf24_ce_digitalWrite(LOW);    
1856  0032 4f            	clr	a
1857  0033 cd0000        	call	_nrf24_ce_digitalWrite
1859                     ; 433     send = nrf24_CONFIG|((1<<PWR_UP)|(1<<PRIM_RX));
1861  0036 a63f          	ld	a,#63
1862  0038 6b02          	ld	(OFST+0,sp),a
1863                     ; 434     nrf24_configRegister(CONFIG, send);
1865  003a ae003f        	ldw	x,#63
1866  003d cd0000        	call	_nrf24_configRegister
1868                     ; 435     nrf24_readRegister(CONFIG, &rcv, 1);
1870  0040 4b01          	push	#1
1871  0042 96            	ldw	x,sp
1872  0043 1c0002        	addw	x,#OFST+0
1873  0046 89            	pushw	x
1874  0047 4f            	clr	a
1875  0048 cd0000        	call	_nrf24_readRegister
1877  004b 5b03          	addw	sp,#3
1878                     ; 436     if(rcv != send)
1880  004d 7b01          	ld	a,(OFST-1,sp)
1881  004f 1102          	cp	a,(OFST+0,sp)
1882  0051 2705          	jreq	L105
1883                     ; 438       Errors_SetError(ERROR_NRF24_INIT);
1885  0053 a601          	ld	a,#1
1886  0055 cd0000        	call	_Errors_SetError
1888  0058               L105:
1889                     ; 440     nrf24_ce_digitalWrite(HIGH);
1891  0058 a601          	ld	a,#1
1892  005a cd0000        	call	_nrf24_ce_digitalWrite
1894                     ; 441 }
1897  005d 85            	popw	x
1898  005e 81            	ret	
1922                     ; 443 void nrf24_powerUpTx()
1922                     ; 444 {
1923                     .text:	section	.text,new
1924  0000               _nrf24_powerUpTx:
1928                     ; 445     nrf24_configRegister(STATUS,(1<<RX_DR)|(1<<TX_DS)|(1<<MAX_RT)); 
1930  0000 ae0770        	ldw	x,#1904
1931  0003 cd0000        	call	_nrf24_configRegister
1933                     ; 447     nrf24_configRegister(CONFIG,nrf24_CONFIG|((1<<PWR_UP)|(0<<PRIM_RX)));
1935  0006 ae003e        	ldw	x,#62
1937                     ; 448 }
1940  0009 cc0000        	jp	_nrf24_configRegister
1986                     ; 450 void nrf24_powerUP()
1986                     ; 451 {
1987                     .text:	section	.text,new
1988  0000               _nrf24_powerUP:
1990  0000 89            	pushw	x
1991       00000002      OFST:	set	2
1994                     ; 453   nrf24_readRegister(CONFIG, &rcv, 1);
1996  0001 4b01          	push	#1
1997  0003 96            	ldw	x,sp
1998  0004 1c0003        	addw	x,#OFST+1
1999  0007 89            	pushw	x
2000  0008 4f            	clr	a
2001  0009 cd0000        	call	_nrf24_readRegister
2003  000c 5b03          	addw	sp,#3
2004                     ; 454   send = rcv | (1<<PWR_UP);
2006  000e 7b02          	ld	a,(OFST+0,sp)
2007  0010 aa02          	or	a,#2
2008  0012 6b01          	ld	(OFST-1,sp),a
2009                     ; 455   nrf24_configRegister(CONFIG, send);
2011  0014 97            	ld	xl,a
2012  0015 4f            	clr	a
2013  0016 95            	ld	xh,a
2014  0017 cd0000        	call	_nrf24_configRegister
2016                     ; 456   nrf24_readRegister(CONFIG, &rcv, 1);
2018  001a 4b01          	push	#1
2019  001c 96            	ldw	x,sp
2020  001d 1c0003        	addw	x,#OFST+1
2021  0020 89            	pushw	x
2022  0021 4f            	clr	a
2023  0022 cd0000        	call	_nrf24_readRegister
2025  0025 5b03          	addw	sp,#3
2026                     ; 457   if(rcv != send)
2028  0027 7b02          	ld	a,(OFST+0,sp)
2029  0029 1101          	cp	a,(OFST-1,sp)
2030  002b 2705          	jreq	L535
2031                     ; 459     Errors_SetError(ERROR_NRF24_INIT);
2033  002d a601          	ld	a,#1
2034  002f cd0000        	call	_Errors_SetError
2036  0032               L535:
2037                     ; 461 }
2040  0032 85            	popw	x
2041  0033 81            	ret	
2087                     ; 463 void nrf24_RXmode()
2087                     ; 464 {
2088                     .text:	section	.text,new
2089  0000               _nrf24_RXmode:
2091  0000 89            	pushw	x
2092       00000002      OFST:	set	2
2095                     ; 466   nrf24_readRegister(CONFIG, &rcv, 1);
2097  0001 4b01          	push	#1
2098  0003 96            	ldw	x,sp
2099  0004 1c0003        	addw	x,#OFST+1
2100  0007 89            	pushw	x
2101  0008 4f            	clr	a
2102  0009 cd0000        	call	_nrf24_readRegister
2104  000c 5b03          	addw	sp,#3
2105                     ; 467   send = rcv | (1<<PRIM_RX);
2107  000e 7b02          	ld	a,(OFST+0,sp)
2108  0010 aa01          	or	a,#1
2109  0012 6b01          	ld	(OFST-1,sp),a
2110                     ; 468   nrf24_configRegister(CONFIG, send);
2112  0014 97            	ld	xl,a
2113  0015 4f            	clr	a
2114  0016 95            	ld	xh,a
2115  0017 cd0000        	call	_nrf24_configRegister
2117                     ; 469   nrf24_readRegister(CONFIG, &rcv, 1);
2119  001a 4b01          	push	#1
2120  001c 96            	ldw	x,sp
2121  001d 1c0003        	addw	x,#OFST+1
2122  0020 89            	pushw	x
2123  0021 4f            	clr	a
2124  0022 cd0000        	call	_nrf24_readRegister
2126  0025 5b03          	addw	sp,#3
2127                     ; 470   if(rcv != send)
2129  0027 7b02          	ld	a,(OFST+0,sp)
2130  0029 1101          	cp	a,(OFST-1,sp)
2131  002b 2705          	jreq	L165
2132                     ; 472     Errors_SetError(ERROR_NRF24_INIT);
2134  002d a601          	ld	a,#1
2135  002f cd0000        	call	_Errors_SetError
2137  0032               L165:
2138                     ; 474 }
2141  0032 85            	popw	x
2142  0033 81            	ret	
2188                     ; 476 void nrf24_SetRFChannel(u8 channel)
2188                     ; 477 {
2189                     .text:	section	.text,new
2190  0000               _nrf24_SetRFChannel:
2192  0000 88            	push	a
2193  0001 88            	push	a
2194       00000001      OFST:	set	1
2197                     ; 479   nrf24_configRegister(RF_CH,channel);  // 2400 + RF_CHANNEL
2199  0002 97            	ld	xl,a
2200  0003 a605          	ld	a,#5
2201  0005 95            	ld	xh,a
2202  0006 cd0000        	call	_nrf24_configRegister
2204                     ; 480   nrf24_readRegister(RF_CH, &rcv, 1);
2206  0009 4b01          	push	#1
2207  000b 96            	ldw	x,sp
2208  000c 1c0002        	addw	x,#OFST+1
2209  000f 89            	pushw	x
2210  0010 a605          	ld	a,#5
2211  0012 cd0000        	call	_nrf24_readRegister
2213  0015 5b03          	addw	sp,#3
2214                     ; 481   if(rcv != channel)
2216  0017 7b01          	ld	a,(OFST+0,sp)
2217  0019 1102          	cp	a,(OFST+1,sp)
2218  001b 2705          	jreq	L506
2219                     ; 483     Errors_SetError(ERROR_NRF24_INIT);
2221  001d a601          	ld	a,#1
2222  001f cd0000        	call	_Errors_SetError
2224  0022               L506:
2225                     ; 485 }
2228  0022 85            	popw	x
2229  0023 81            	ret	
2275                     ; 487 void nrf24_TXmode()
2275                     ; 488 {
2276                     .text:	section	.text,new
2277  0000               _nrf24_TXmode:
2279  0000 89            	pushw	x
2280       00000002      OFST:	set	2
2283                     ; 490   nrf24_readRegister(CONFIG, &rcv, 1);
2285  0001 4b01          	push	#1
2286  0003 96            	ldw	x,sp
2287  0004 1c0003        	addw	x,#OFST+1
2288  0007 89            	pushw	x
2289  0008 4f            	clr	a
2290  0009 cd0000        	call	_nrf24_readRegister
2292  000c 5b03          	addw	sp,#3
2293                     ; 491   send = rcv & (u8)(~(1<<PRIM_RX));
2295  000e 7b02          	ld	a,(OFST+0,sp)
2296  0010 a4fe          	and	a,#254
2297  0012 6b01          	ld	(OFST-1,sp),a
2298                     ; 492   nrf24_configRegister(CONFIG, send);
2300  0014 97            	ld	xl,a
2301  0015 4f            	clr	a
2302  0016 95            	ld	xh,a
2303  0017 cd0000        	call	_nrf24_configRegister
2305                     ; 493   nrf24_readRegister(CONFIG, &rcv, 1);
2307  001a 4b01          	push	#1
2308  001c 96            	ldw	x,sp
2309  001d 1c0003        	addw	x,#OFST+1
2310  0020 89            	pushw	x
2311  0021 4f            	clr	a
2312  0022 cd0000        	call	_nrf24_readRegister
2314  0025 5b03          	addw	sp,#3
2315                     ; 494   if(rcv != send)
2317  0027 7b02          	ld	a,(OFST+0,sp)
2318  0029 1101          	cp	a,(OFST-1,sp)
2319  002b 2705          	jreq	L136
2320                     ; 496     Errors_SetError(ERROR_NRF24_INIT);
2322  002d a601          	ld	a,#1
2323  002f cd0000        	call	_Errors_SetError
2325  0032               L136:
2326                     ; 498 }
2329  0032 85            	popw	x
2330  0033 81            	ret	
2355                     ; 500 void nrf24_powerDown()
2355                     ; 501 {
2356                     .text:	section	.text,new
2357  0000               _nrf24_powerDown:
2361                     ; 502     nrf24_ce_digitalWrite(LOW);
2363  0000 4f            	clr	a
2364  0001 cd0000        	call	_nrf24_ce_digitalWrite
2366                     ; 503     nrf24_configRegister(CONFIG,nrf24_CONFIG);
2368  0004 ae003c        	ldw	x,#60
2370                     ; 504 }
2373  0007 cc0000        	jp	_nrf24_configRegister
2437                     ; 543 void nrf24_transferSync(uint8_t* dataout,uint8_t* datain,uint8_t len)
2437                     ; 544 {
2438                     .text:	section	.text,new
2439  0000               _nrf24_transferSync:
2441  0000 89            	pushw	x
2442  0001 88            	push	a
2443       00000001      OFST:	set	1
2446                     ; 547     for(i=0;i<len;i++)
2448  0002 0f01          	clr	(OFST+0,sp)
2450  0004 201f          	jra	L107
2451  0006               L576:
2452                     ; 549         datain[i] = spi_transfer(dataout[i]);
2454  0006 7b06          	ld	a,(OFST+5,sp)
2455  0008 97            	ld	xl,a
2456  0009 7b07          	ld	a,(OFST+6,sp)
2457  000b 1b01          	add	a,(OFST+0,sp)
2458  000d 2401          	jrnc	L205
2459  000f 5c            	incw	x
2460  0010               L205:
2461  0010 02            	rlwa	x,a
2462  0011 89            	pushw	x
2463  0012 7b04          	ld	a,(OFST+3,sp)
2464  0014 97            	ld	xl,a
2465  0015 7b05          	ld	a,(OFST+4,sp)
2466  0017 1b03          	add	a,(OFST+2,sp)
2467  0019 2401          	jrnc	L605
2468  001b 5c            	incw	x
2469  001c               L605:
2470  001c 02            	rlwa	x,a
2471  001d f6            	ld	a,(x)
2472  001e cd0000        	call	_spi_transfer
2474  0021 85            	popw	x
2475  0022 f7            	ld	(x),a
2476                     ; 547     for(i=0;i<len;i++)
2478  0023 0c01          	inc	(OFST+0,sp)
2479  0025               L107:
2482  0025 7b01          	ld	a,(OFST+0,sp)
2483  0027 1108          	cp	a,(OFST+7,sp)
2484  0029 25db          	jrult	L576
2485                     ; 552 }
2488  002b 5b03          	addw	sp,#3
2489  002d 81            	ret	
2543                     ; 555 void nrf24_transmitSync(uint8_t* dataout,uint8_t len)
2543                     ; 556 {
2544                     .text:	section	.text,new
2545  0000               _nrf24_transmitSync:
2547  0000 89            	pushw	x
2548  0001 88            	push	a
2549       00000001      OFST:	set	1
2552                     ; 559     for(i=0;i<len;i++)
2554  0002 0f01          	clr	(OFST+0,sp)
2556  0004 2011          	jra	L737
2557  0006               L337:
2558                     ; 561         spi_transfer(dataout[i]);
2560  0006 7b02          	ld	a,(OFST+1,sp)
2561  0008 97            	ld	xl,a
2562  0009 7b03          	ld	a,(OFST+2,sp)
2563  000b 1b01          	add	a,(OFST+0,sp)
2564  000d 2401          	jrnc	L415
2565  000f 5c            	incw	x
2566  0010               L415:
2567  0010 02            	rlwa	x,a
2568  0011 f6            	ld	a,(x)
2569  0012 cd0000        	call	_spi_transfer
2571                     ; 559     for(i=0;i<len;i++)
2573  0015 0c01          	inc	(OFST+0,sp)
2574  0017               L737:
2577  0017 7b01          	ld	a,(OFST+0,sp)
2578  0019 1106          	cp	a,(OFST+5,sp)
2579  001b 25e9          	jrult	L337
2580                     ; 564 }
2583  001d 5b03          	addw	sp,#3
2584  001f 81            	ret	
2630                     ; 567 void nrf24_configRegister(uint8_t reg, uint8_t value)
2630                     ; 568 {
2631                     .text:	section	.text,new
2632  0000               _nrf24_configRegister:
2634  0000 89            	pushw	x
2635       00000000      OFST:	set	0
2638                     ; 569     nrf24_csn_digitalWrite(LOW);
2640  0001 4f            	clr	a
2641  0002 cd0000        	call	_nrf24_csn_digitalWrite
2643                     ; 570     spi_transfer(W_REGISTER | (REGISTER_MASK & reg));
2645  0005 7b01          	ld	a,(OFST+1,sp)
2646  0007 a41f          	and	a,#31
2647  0009 aa20          	or	a,#32
2648  000b cd0000        	call	_spi_transfer
2650                     ; 571     spi_transfer(value);
2652  000e 7b02          	ld	a,(OFST+2,sp)
2653  0010 cd0000        	call	_spi_transfer
2655                     ; 572     nrf24_csn_digitalWrite(HIGH);
2657  0013 a601          	ld	a,#1
2658  0015 cd0000        	call	_nrf24_csn_digitalWrite
2660                     ; 573 }
2663  0018 85            	popw	x
2664  0019 81            	ret	
2720                     ; 576 void nrf24_readRegister(uint8_t reg, uint8_t* value, uint8_t len)
2720                     ; 577 {
2721                     .text:	section	.text,new
2722  0000               _nrf24_readRegister:
2724  0000 88            	push	a
2725       00000000      OFST:	set	0
2728                     ; 578     nrf24_csn_digitalWrite(LOW);
2730  0001 4f            	clr	a
2731  0002 cd0000        	call	_nrf24_csn_digitalWrite
2733                     ; 579     spi_transfer(R_REGISTER | (REGISTER_MASK & reg));
2735  0005 7b01          	ld	a,(OFST+1,sp)
2736  0007 a41f          	and	a,#31
2737  0009 cd0000        	call	_spi_transfer
2739                     ; 580     nrf24_transferSync(value,value,len);
2741  000c 7b06          	ld	a,(OFST+6,sp)
2742  000e 88            	push	a
2743  000f 1e05          	ldw	x,(OFST+5,sp)
2744  0011 89            	pushw	x
2745  0012 1e07          	ldw	x,(OFST+7,sp)
2746  0014 cd0000        	call	_nrf24_transferSync
2748  0017 5b03          	addw	sp,#3
2749                     ; 581     nrf24_csn_digitalWrite(HIGH);
2751  0019 a601          	ld	a,#1
2752  001b cd0000        	call	_nrf24_csn_digitalWrite
2754                     ; 582 }
2757  001e 84            	pop	a
2758  001f 81            	ret	
2815                     ; 585 void nrf24_writeRegister(uint8_t reg, uint8_t* value, uint8_t len) 
2815                     ; 586 {
2816                     .text:	section	.text,new
2817  0000               _nrf24_writeRegister:
2819  0000 88            	push	a
2820       00000000      OFST:	set	0
2823                     ; 587     nrf24_csn_digitalWrite(LOW);
2825  0001 4f            	clr	a
2826  0002 cd0000        	call	_nrf24_csn_digitalWrite
2828                     ; 588     spi_transfer(W_REGISTER | (REGISTER_MASK & reg));
2830  0005 7b01          	ld	a,(OFST+1,sp)
2831  0007 a41f          	and	a,#31
2832  0009 aa20          	or	a,#32
2833  000b cd0000        	call	_spi_transfer
2835                     ; 589     nrf24_transmitSync(value,len);
2837  000e 7b06          	ld	a,(OFST+6,sp)
2838  0010 88            	push	a
2839  0011 1e05          	ldw	x,(OFST+5,sp)
2840  0013 cd0000        	call	_nrf24_transmitSync
2842  0016 84            	pop	a
2843                     ; 590     nrf24_csn_digitalWrite(HIGH);
2845  0017 a601          	ld	a,#1
2846  0019 cd0000        	call	_nrf24_csn_digitalWrite
2848                     ; 591 }
2851  001c 84            	pop	a
2852  001d 81            	ret	
2876                     	switch	.ubsct
2877  0000               _payload_len:
2878  0000 00            	ds.b	1
2879                     	xdef	_payload_len
2880                     	xref	_Errors_ResetError
2881                     	xref	_Errors_SetError
2882                     	xref	_nrf24_csn_digitalWrite
2883                     	xref	_nrf24_ce_digitalWrite
2884                     	xref	_nrf24_setupPins
2885                     	xdef	_nrf24_writeRegister
2886                     	xdef	_nrf24_readRegister
2887                     	xdef	_nrf24_configRegister
2888                     	xdef	_nrf24_transferSync
2889                     	xdef	_nrf24_transmitSync
2890                     	xref	_spi_transfer
2891                     	xdef	_nrf24_TXmode
2892                     	xdef	_nrf24_RXmode
2893                     	xdef	_nrf24_powerUP
2894                     	xdef	_nrf24_powerDown
2895                     	xdef	_nrf24_powerUpTx
2896                     	xdef	_nrf24_powerUpRx
2897                     	xdef	_nrf24_payload_length
2898                     	xdef	_nrf24_retransmissionCount
2899                     	xdef	_nrf24_lastMessageStatus
2900                     	xdef	_nrf24_payloadLength
2901                     	xdef	_nrf24_getData
2902                     	xdef	_nrf24_send
2903                     	xdef	_nrf24_rxFifoEmpty
2904                     	xdef	_nrf24_getStatus
2905                     	xdef	_nrf24_isSending
2906                     	xdef	_nrf24_dataReady
2907                     	xdef	_nrf24_config_esb
2908                     	xdef	_nrf24_config_sb
2909                     	xdef	_nrf24_SetRFChannel
2910                     	xdef	_nrf24_tx_address
2911                     	xdef	_nrf24_rx_address
2912                     	xdef	_nrf24_init
2932                     	end
