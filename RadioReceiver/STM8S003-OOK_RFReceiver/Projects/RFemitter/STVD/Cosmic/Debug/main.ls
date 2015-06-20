   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  22                     	bsct
  23  0000               L3_RMsgRcvdCnt:
  24  0000 00            	dc.b	0
  64                     ; 31 void main(void)
  64                     ; 32 {
  66                     .text:	section	.text,new
  67  0000               _main:
  71                     ; 33   Config();
  73  0000 cd0000        	call	_Config
  75                     ; 34   enableInterrupts();
  78  0003 9a            	rim	
  80                     ; 36   LCD_Initialize();
  83  0004 cd0000        	call	_LCD_Initialize
  85                     ; 37   LCD_Clear();
  87  0007 cd0000        	call	_LCD_Clear
  89                     ; 38   LCD_WriteString("OOK 433.92MHZ");
  91  000a ae000a        	ldw	x,#L32
  92  000d cd0000        	call	_LCD_WriteString
  94                     ; 39   LCD_Move_Cursor(2, 1);
  96  0010 ae0201        	ldw	x,#513
  97  0013 cd0000        	call	_LCD_Move_Cursor
  99                     ; 40   LCD_WriteString("Comm test");
 101  0016 ae0000        	ldw	x,#L52
 102  0019 cd0000        	call	_LCD_WriteString
 104  001c               L72:
 105                     ; 44     if(RFbytesReady == TRUE)
 107  001c b600          	ld	a,_RFbytesReady
 108  001e 4a            	dec	a
 109  001f 26fb          	jrne	L72
 110                     ; 46       LCD_Clear();
 112  0021 cd0000        	call	_LCD_Clear
 114                     ; 47       LCD_WriteNumber((u32)(++RMsgRcvdCnt));
 116  0024 3c00          	inc	L3_RMsgRcvdCnt
 117  0026 450003        	mov	c_lreg+3,L3_RMsgRcvdCnt
 118  0029 3f02          	clr	c_lreg+2
 119  002b 3f01          	clr	c_lreg+1
 120  002d 3f00          	clr	c_lreg
 121  002f be02          	ldw	x,c_lreg+2
 122  0031 89            	pushw	x
 123  0032 be00          	ldw	x,c_lreg
 124  0034 89            	pushw	x
 125  0035 cd0000        	call	_LCD_WriteNumber
 127  0038 5b04          	addw	sp,#4
 128                     ; 48       LCD_Move_Cursor(1, 4);
 130  003a ae0104        	ldw	x,#260
 131  003d cd0000        	call	_LCD_Move_Cursor
 133                     ; 49       LCD_WriteByte(RcvRFmsg.RFmsgmember.RFNodeId, TRUE);
 135  0040 ae0001        	ldw	x,#1
 136  0043 b602          	ld	a,_RcvRFmsg+2
 137  0045 95            	ld	xh,a
 138  0046 cd0000        	call	_LCD_WriteByte
 140                     ; 50       LCD_Move_Cursor(1, 9);
 142  0049 ae0109        	ldw	x,#265
 143  004c cd0000        	call	_LCD_Move_Cursor
 145                     ; 51       LCD_WriteByte(RcvRFmsg.RFmsgmember.RFcmd, TRUE);
 147  004f ae0001        	ldw	x,#1
 148  0052 b603          	ld	a,_RcvRFmsg+3
 149  0054 95            	ld	xh,a
 150  0055 cd0000        	call	_LCD_WriteByte
 152                     ; 52       LCD_Move_Cursor(2, 1);
 154  0058 ae0201        	ldw	x,#513
 155  005b cd0000        	call	_LCD_Move_Cursor
 157                     ; 53       LCD_WriteByte(RcvRFmsg.RFmsgmember.RFmsgCHKSUM, TRUE);
 159  005e ae0001        	ldw	x,#1
 160  0061 b604          	ld	a,_RcvRFmsg+4
 161  0063 95            	ld	xh,a
 162  0064 cd0000        	call	_LCD_WriteByte
 164                     ; 54       RFbytesReady = FALSE;
 166  0067 3f00          	clr	_RFbytesReady
 167  0069 20b1          	jra	L72
 191                     	xdef	_main
 192                     	xref	_LCD_Move_Cursor
 193                     	xref	_LCD_Clear
 194                     	xref	_LCD_WriteString
 195                     	xref	_LCD_WriteByte
 196                     	xref	_LCD_WriteNumber
 197                     	xref	_LCD_Initialize
 198                     	xref	_Config
 199                     	xref.b	_RFbytesReady
 200                     	xref.b	_RcvRFmsg
 201                     .const:	section	.text
 202  0000               L52:
 203  0000 436f6d6d2074  	dc.b	"Comm test",0
 204  000a               L32:
 205  000a 4f4f4b203433  	dc.b	"OOK 433.92MHZ",0
 206                     	xref.b	c_lreg
 226                     	end
