
_main:

;lcdinterfacing.c,15 :: 		void main()
;lcdinterfacing.c,17 :: 		TRISC=0;
	CLRF       TRISC+0
;lcdinterfacing.c,18 :: 		TRISB=0      ;
	CLRF       TRISB+0
;lcdinterfacing.c,19 :: 		PORTB.RB0=1;
	BSF        PORTB+0, 0
;lcdinterfacing.c,20 :: 		Lcd_Init();                   // Initialize LCD
	CALL       _Lcd_Init+0
;lcdinterfacing.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);         // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcdinterfacing.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);   // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcdinterfacing.c,23 :: 		Lcd_Out(1,1,"Hello World!");//Write text'Hello World' in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_lcdinterfacing+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcdinterfacing.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
