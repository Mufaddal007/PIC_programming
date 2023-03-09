
_CustomChar:

;custom_char_test.c,18 :: 		void CustomChar(char pos_row, char pos_char) {
;custom_char_test.c,20 :: 		Lcd_Cmd(72);
	MOVLW      72
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;custom_char_test.c,21 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       CustomChar_i_L0+0
L_CustomChar0:
	MOVF       CustomChar_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomChar1
	MOVF       CustomChar_i_L0+0, 0
	ADDLW      _character+0
	MOVWF      R0+0
	MOVLW      hi_addr(_character+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       CustomChar_i_L0+0, 1
	GOTO       L_CustomChar0
L_CustomChar1:
;custom_char_test.c,22 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;custom_char_test.c,23 :: 		Lcd_Chr(pos_row, pos_char, 1);
	MOVF       FARG_CustomChar_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomChar_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;custom_char_test.c,24 :: 		}
L_end_CustomChar:
	RETURN
; end of _CustomChar

_main:

;custom_char_test.c,27 :: 		void main()
;custom_char_test.c,29 :: 		TRISB=0;
	CLRF       TRISB+0
;custom_char_test.c,30 :: 		PORTB=0x11111111;
	MOVLW      17
	MOVWF      PORTB+0
;custom_char_test.c,31 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;custom_char_test.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;custom_char_test.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;custom_char_test.c,38 :: 		CustomChar(1,1);
	MOVLW      1
	MOVWF      FARG_CustomChar_pos_row+0
	MOVLW      1
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;custom_char_test.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
