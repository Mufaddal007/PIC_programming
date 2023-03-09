
_main:

;lcdcheck.c,14 :: 		void main()
;lcdcheck.c,16 :: 		Trisb.rb0=0;
	BCF        TRISB+0, 0
;lcdcheck.c,17 :: 		Trisb.rb1=0;
	BCF        TRISB+0, 1
;lcdcheck.c,18 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;lcdcheck.c,19 :: 		Lcd_Cmd(_Lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcdcheck.c,20 :: 		Lcd_Cmd(_Lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcdcheck.c,21 :: 		Lcd_Out(1,1,"Hello");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_lcdcheck+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcdcheck.c,22 :: 		while(1){
L_main0:
;lcdcheck.c,24 :: 		if (!portb.rb0)
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;lcdcheck.c,26 :: 		portb.rb1=1;
	BSF        PORTB+0, 1
;lcdcheck.c,27 :: 		Lcd_Out(2,1, "pressed");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_lcdcheck+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcdcheck.c,28 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;lcdcheck.c,29 :: 		portb.rb1=0;
	BCF        PORTB+0, 1
;lcdcheck.c,30 :: 		Lcd_Cmd(_Lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcdcheck.c,31 :: 		}
L_main2:
;lcdcheck.c,32 :: 		}          }
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
