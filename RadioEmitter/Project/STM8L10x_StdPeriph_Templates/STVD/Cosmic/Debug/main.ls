   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  21                     	bsct
  22  0000               L3_LightState:
  23  0000 00            	dc.b	0
  24                     .bit:	section	.data,bit
  25  0000               L11_LrnModeActive:
  26  0000 00            	dc.b	0
  27  0001               L31_FLAG_BTN1_lock:
  28  0001 00            	dc.b	0
  29  0002               L51_FLAG_reset_LEDblink_error:
  30  0002 00            	dc.b	0
  31  0003               L71_FLAG_check_nrf_reg:
  32  0003 00            	dc.b	0
  33                     	bsct
  34  0001               L12_error_nrf24_reg_cnt:
  35  0001 00            	dc.b	0
  36  0002               L32_state:
  37  0002 00            	dc.b	0
  38  0003               L52_program_status:
  39  0003 00            	dc.b	0
  40  0004               L72_interrupt_status:
  41  0004 00            	dc.b	0
  42  0005               L33_debug_reg_idx:
  43  0005 00            	dc.b	0
  44  0006               L53_task_1000ms_cnt:
  45  0006 00            	dc.b	0
  46  0007               L73_init_delay:
  47  0007 ffff          	dc.w	-1
 100                     ; 111 void main(void)
 100                     ; 112 {
 102                     .text:	section	.text,new
 103  0000               _main:
 107                     ; 113   flash_erase_timing_test = 0;
 109  0000 3f00          	clr	L14_flash_erase_timing_test
 110                     ; 114   program_status = 1;
 112  0002 35010003      	mov	L52_program_status,#1
 113                     ; 115   disableInterrupts();
 116  0006 9b            	sim	
 118                     ; 116   Config();
 121  0007 cd0000        	call	_Config
 123                     ; 117   program_status = 2;
 125  000a 35020003      	mov	L52_program_status,#2
 126                     ; 118   Errors_Init();
 128  000e cd0000        	call	_Errors_Init
 130                     ; 119   enableInterrupts();
 133  0011 9a            	rim	
 135                     ; 120   LED_GREEN_ON;
 138  0012 7217500a      	bres	20490,#3
 141  0016 7218500a      	bset	20490,#4
 142                     ; 122   Timeout_SetTimeout2(200);
 145  001a ae00c8        	ldw	x,#200
 146  001d cd0000        	call	_Timeout_SetTimeout2
 149  0020               L17:
 150                     ; 123   while(!Timeout_IsTimeout2());
 152  0020 cd0000        	call	_Timeout_IsTimeout2
 154  0023 4d            	tnz	a
 155  0024 27fa          	jreq	L17
 156                     ; 124   LED_OFF;
 158  0026 7217500a      	bres	20490,#3
 161  002a 7219500a      	bres	20490,#4
 162                     ; 125   program_status = 3;
 165  002e 35030003      	mov	L52_program_status,#3
 166                     ; 126   if(RST_GetFlagStatus(RST_FLAG_IWDGF))
 168  0032 a602          	ld	a,#2
 169  0034 cd0000        	call	_RST_GetFlagStatus
 171  0037 4d            	tnz	a
 172  0038 2706          	jreq	L57
 173                     ; 128     BLINK_REDLED(1);
 175  003a 35010000      	mov	_blink_redLED_times,#1
 185  003e 200c          	jp	LC001
 186  0040               L57:
 187                     ; 130   else if(RST_GetFlagStatus(RST_FLAG_ILLOPF))
 189  0040 a604          	ld	a,#4
 190  0042 cd0000        	call	_RST_GetFlagStatus
 192  0045 4d            	tnz	a
 193  0046 271b          	jreq	L77
 194                     ; 132     BLINK_REDLED(2);
 196  0048 35020000      	mov	_blink_redLED_times,#2
 210  004c               LC001:
 212  004c 72110000      	bres	_flag_blink_unlimited
 215  0050 5f            	clrw	x
 216  0051 72100000      	bset	_flag_blink_on_off
 217  0055 bf00          	ldw	_cnt_state_redLED,x
 219  0057 7216500a      	bset	20490,#3
 221  005b 7219500a      	bres	20490,#4
 223  005f 72100000      	bset	_flag_blink_redLED
 225  0063               L77:
 226                     ; 134   RST_ClearFlag(RST_FLAG_POR_PDR | RST_FLAG_SWIMF | RST_FLAG_ILLOPF | RST_FLAG_IWDGF);
 228  0063 a60f          	ld	a,#15
 229  0065 cd0000        	call	_RST_ClearFlag
 232  0068               L501:
 233                     ; 135   while(ISBLINKING_REDLED);
 235  0068 72000000fb    	btjt	_flag_blink_redLED,L501
 236                     ; 136   program_status = 4;
 238  006d 35040003      	mov	L52_program_status,#4
 239  0071               L111:
 240                     ; 148     switch(state)
 242  0071 b602          	ld	a,L32_state
 244                     ; 186       default: break;
 245  0073 2705          	jreq	L34
 246  0075 4a            	dec	a
 247  0076 2708          	jreq	L54
 248  0078 20f7          	jra	L111
 249  007a               L34:
 250                     ; 152         state = ST_WAIT_INPUT_OR_FLAG;
 252  007a 35010002      	mov	L32_state,#1
 253                     ; 153         break;
 255  007e 20f1          	jra	L111
 256  0080               L54:
 257                     ; 157         if(FLAG_250ms)
 259  0080 7201000007    	btjf	_FLAG_250ms,L121
 260                     ; 159           FLAG_250ms = FALSE;
 262  0085 72110000      	bres	_FLAG_250ms
 263                     ; 160           TASK_250ms();
 265  0089 cd0000        	call	_TASK_250ms
 267  008c               L121:
 268                     ; 162         if(FLAG_500ms)
 270  008c 7201000007    	btjf	_FLAG_500ms,L321
 271                     ; 164           FLAG_500ms = FALSE;
 273  0091 72110000      	bres	_FLAG_500ms
 274                     ; 165           TASK_500ms();
 276  0095 cd0000        	call	_TASK_500ms
 278  0098               L321:
 279                     ; 167         if(FLAG_1000ms)
 281  0098 7201000004    	btjf	_FLAG_1000ms,L521
 282                     ; 169           FLAG_1000ms = FALSE;
 284  009d 72110000      	bres	_FLAG_1000ms
 285  00a1               L521:
 286                     ; 173         if(BTN1_DEB_STATE == BTN_PRESSED && !FLAG_BTN1_lock)
 288  00a1 b600          	ld	a,_BTN1_DEB_STATE
 289  00a3 4a            	dec	a
 290  00a4 2609          	jrne	L721
 292  00a6 7200000104    	btjt	L31_FLAG_BTN1_lock,L721
 293                     ; 175           FLAG_BTN1_lock = TRUE;
 295  00ab 72100001      	bset	L31_FLAG_BTN1_lock
 296  00af               L721:
 297                     ; 177         if(BTN1_DEB_STATE == BTN_DEPRESSED && FLAG_BTN1_lock)
 299  00af b600          	ld	a,_BTN1_DEB_STATE
 300  00b1 26be          	jrne	L111
 302  00b3 72010001b9    	btjf	L31_FLAG_BTN1_lock,L111
 303                     ; 179           FLAG_BTN1_lock = FALSE;
 305  00b8 72110001      	bres	L31_FLAG_BTN1_lock
 306                     ; 180           BTN1_Released();
 308  00bc cd0000        	call	_BTN1_Released
 310  00bf 20b0          	jra	L111
 311                     ; 186       default: break;
 342                     ; 192 void BTN1_Released()
 342                     ; 193 {
 343                     .text:	section	.text,new
 344  0000               _BTN1_Released:
 348                     ; 194   if(BTN1_press_timer < BTN1_DELETE_ID_THR)
 350  0000 be00          	ldw	x,_BTN1_press_timer
 351  0002 a30bb8        	cpw	x,#3000
 352  0005 2406          	jruge	L341
 353                     ; 197     disableInterrupts();
 356  0007 ad18          	call	LC002
 357                     ; 199     RF_Send(RFCMD_OPENDOORS);
 360  0009 a60f          	ld	a,#15
 362                     ; 200     enableInterrupts();
 366                     ; 201     LED_OFF;
 371  000b 2004          	jra	L541
 372  000d               L341:
 373                     ; 206     disableInterrupts();
 376  000d ad12          	call	LC002
 377                     ; 208     RF_Send(RFCMD_CLOSEDOORS);
 380  000f a6f0          	ld	a,#240
 382                     ; 209     enableInterrupts();
 386                     ; 210     LED_OFF;
 391  0011               L541:
 392  0011 cd0000        	call	_RF_Send
 393  0014 9a            	rim	
 395  0015 7217500a      	bres	20490,#3
 397  0019 7219500a      	bres	20490,#4
 398                     ; 212   BTN1_press_timer = 0;
 400  001d 5f            	clrw	x
 401  001e bf00          	ldw	_BTN1_press_timer,x
 402                     ; 213 }
 405  0020 81            	ret	
 406  0021               LC002:
 407  0021 9b            	sim	
 409                     ; 207     LED_GREEN_ON;
 412  0022 7217500a      	bres	20490,#3
 415  0026 7218500a      	bset	20490,#4
 416  002a 81            	ret	
 440                     ; 215 void TASK_1000ms()
 440                     ; 216 {
 441                     .text:	section	.text,new
 442  0000               _TASK_1000ms:
 446                     ; 217   task_1000ms_cnt++;
 448  0000 3c06          	inc	L53_task_1000ms_cnt
 449                     ; 218 }
 452  0002 81            	ret	
 476                     ; 220 void TASK_500ms()
 476                     ; 221 {
 477                     .text:	section	.text,new
 478  0000               _TASK_500ms:
 482                     ; 222   flash_erase_timing_test = 0;
 484  0000 3f00          	clr	L14_flash_erase_timing_test
 485                     ; 223 }
 488  0002 81            	ret	
 511                     ; 225 void TASK_250ms()
 511                     ; 226 {
 512                     .text:	section	.text,new
 513  0000               _TASK_250ms:
 517                     ; 228 }
 520  0000 81            	ret	
 711                     	xdef	_main
 712                     	xdef	_BTN1_Released
 713                     	xdef	_TASK_250ms
 714                     	xdef	_TASK_500ms
 715                     	xdef	_TASK_1000ms
 716                     	switch	.ubsct
 717  0000               L14_flash_erase_timing_test:
 718  0000 00            	ds.b	1
 719                     	xref	_RF_Send
 720                     	xref	_Timeout_IsTimeout2
 721                     	xref	_Timeout_SetTimeout2
 722                     	xbit	_flag_blink_unlimited
 723                     	xbit	_flag_blink_redLED
 724                     	xbit	_flag_blink_on_off
 725                     	xref.b	_cnt_state_redLED
 726                     	xref.b	_blink_redLED_times
 727                     	xbit	_FLAG_1000ms
 728                     	xbit	_FLAG_500ms
 729                     	xbit	_FLAG_250ms
 730                     	xref.b	_BTN1_press_timer
 731                     	xref.b	_BTN1_DEB_STATE
 732                     	xref	_Errors_Init
 733                     	xref	_Config
 734                     	xref	_RST_ClearFlag
 735                     	xref	_RST_GetFlagStatus
 755                     	end
