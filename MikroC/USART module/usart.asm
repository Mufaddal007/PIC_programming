
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;usart.c,4 :: 		void interrupt()
;usart.c,6 :: 		if (rcif_bit)
	BTFSS      RCIF_bit+0, BitPos(RCIF_bit+0)
	GOTO       L_interrupt0
;usart.c,7 :: 		{ch=rcreg;
	MOVF       RCREG+0, 0
	MOVWF      _ch+0
;usart.c,8 :: 		delay_ms(500);}}
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_interrupt1:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt1
	DECFSZ     R12+0, 1
	GOTO       L_interrupt1
	DECFSZ     R11+0, 1
	GOTO       L_interrupt1
	NOP
	NOP
L_interrupt0:
L_end_interrupt:
L__interrupt9:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_intr_init:

;usart.c,10 :: 		void intr_init()
;usart.c,12 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;usart.c,13 :: 		peie_bit=1;
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;usart.c,14 :: 		txie_bit=1;
	BSF        TXIE_bit+0, BitPos(TXIE_bit+0)
;usart.c,15 :: 		rcie_bit=1;
	BSF        RCIE_bit+0, BitPos(RCIE_bit+0)
;usart.c,16 :: 		rcif_bit=0;
	BCF        RCIF_bit+0, BitPos(RCIF_bit+0)
;usart.c,17 :: 		}
L_end_intr_init:
	RETURN
; end of _intr_init

_init_usart:

;usart.c,18 :: 		void init_usart(){
;usart.c,19 :: 		spbrg=25;
	MOVLW      25
	MOVWF      SPBRG+0
;usart.c,20 :: 		brgh_bit=1;
	BSF        BRGH_bit+0, BitPos(BRGH_bit+0)
;usart.c,22 :: 		sync_bit=0;
	BCF        SYNC_bit+0, BitPos(SYNC_bit+0)
;usart.c,23 :: 		spen_bit=1;
	BSF        SPEN_bit+0, BitPos(SPEN_bit+0)
;usart.c,25 :: 		txen_bit=1;
	BSF        TXEN_bit+0, BitPos(TXEN_bit+0)
;usart.c,26 :: 		cren_bit=0;
	BCF        CREN_bit+0, BitPos(CREN_bit+0)
;usart.c,28 :: 		tx9_bit=0;
	BCF        TX9_bit+0, BitPos(TX9_bit+0)
;usart.c,29 :: 		rx9_bit=0;
	BCF        RX9_bit+0, BitPos(RX9_bit+0)
;usart.c,30 :: 		}
L_end_init_usart:
	RETURN
; end of _init_usart

_transmit:

;usart.c,31 :: 		void transmit(char ch)
;usart.c,32 :: 		{while(!txif);
L_transmit3:
;usart.c,33 :: 		txreg=ch;}
	MOVF       FARG_transmit_ch+0, 0
	MOVWF      TXREG+0
L_end_transmit:
	RETURN
; end of _transmit

_receive:

;usart.c,34 :: 		char receive()
;usart.c,35 :: 		{while(!rcif);
L_receive5:
;usart.c,36 :: 		ch=rcreg;
	MOVF       RCREG+0, 0
	MOVWF      _ch+0
;usart.c,37 :: 		return rcreg;}
	MOVF       RCREG+0, 0
	MOVWF      R0+0
L_end_receive:
	RETURN
; end of _receive

_main:

;usart.c,39 :: 		void main()
;usart.c,41 :: 		trisc.rc6=0;
	BCF        TRISC+0, 6
;usart.c,42 :: 		trisc.rc7=1;
	BSF        TRISC+0, 7
;usart.c,43 :: 		intr_init();
	CALL       _intr_init+0
;usart.c,44 :: 		init_usart();
	CALL       _init_usart+0
;usart.c,45 :: 		lcd_init();
	CALL       _Lcd_Init+0
;usart.c,46 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;usart.c,47 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;usart.c,48 :: 		while(1){lcd_chr(1,1,ch);};
L_main6:
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _ch+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_main6
;usart.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
