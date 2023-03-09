
_main:

;rotarydial.c,19 :: 		void main() {
;rotarydial.c,20 :: 		trisc=0;
	CLRF       TRISC+0
;rotarydial.c,21 :: 		trisb.rb0=255;
	BSF        TRISB+0, 0
;rotarydial.c,22 :: 		lcd_init();
	CALL       _Lcd_Init+0
;rotarydial.c,23 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;rotarydial.c,24 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;rotarydial.c,26 :: 		while(1)
L_main0:
;rotarydial.c,28 :: 		if (!portb.rb0)
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;rotarydial.c,29 :: 		{ count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;rotarydial.c,30 :: 		lcd_out(1,1,"button pressed") ;
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_rotarydial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;rotarydial.c,31 :: 		IntToStr(count, str);
	MOVF       _count+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _count+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _str+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;rotarydial.c,32 :: 		lcd_out(2,1,str);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _str+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;rotarydial.c,33 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;rotarydial.c,34 :: 		}
L_main2:
;rotarydial.c,35 :: 		lcd_out(1,1,"button released");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_rotarydial+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;rotarydial.c,36 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;rotarydial.c,37 :: 		}
	GOTO       L_main0
;rotarydial.c,39 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
