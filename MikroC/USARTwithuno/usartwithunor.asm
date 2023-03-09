
_main:

;usartwithunor.c,6 :: 		void main()
;usartwithunor.c,8 :: 		lcd_init();
	CALL       _Lcd_Init+0
;usartwithunor.c,9 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;usartwithunor.c,10 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;usartwithunor.c,11 :: 		lcd_out(1,1,"This is UART test!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_usartwithunor+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;usartwithunor.c,12 :: 		UART1_init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;usartwithunor.c,13 :: 		while(1)
L_main0:
;usartwithunor.c,15 :: 		if (UART1_Data_Ready)
	MOVLW      _UART1_Data_Ready+0
	MOVWF      R0+0
	MOVLW      hi_addr(_UART1_Data_Ready+0)
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	IORWF      R0+2, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;usartwithunor.c,16 :: 		{ ch=UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;usartwithunor.c,17 :: 		lcd_chr(2,1,ch);}
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_main2:
;usartwithunor.c,19 :: 		}
	GOTO       L_main0
;usartwithunor.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
