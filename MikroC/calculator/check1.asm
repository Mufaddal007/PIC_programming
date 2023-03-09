
_main:

;check1.c,15 :: 		void main() {
;check1.c,16 :: 		TRISC=0;
	CLRF       TRISC+0
;check1.c,17 :: 		TRISB.RB7=255;
	BSF        TRISB+0, 7
;check1.c,18 :: 		TRISB.RB1=255;
	BSF        TRISB+0, 1
;check1.c,19 :: 		TRISB.RB2=255;
	BSF        TRISB+0, 2
;check1.c,20 :: 		TRISB.RB3=255;
	BSF        TRISB+0, 3
;check1.c,21 :: 		trisb.rb5=0;
	BCF        TRISB+0, 5
;check1.c,22 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;check1.c,23 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;check1.c,24 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;check1.c,25 :: 		portb.rb0=0;
	BCF        PORTB+0, 0
;check1.c,26 :: 		while(1){
L_main0:
;check1.c,27 :: 		if (!PORTB.RB7)
	BTFSC      PORTB+0, 7
	GOTO       L_main2
;check1.c,29 :: 		portb.rb0=1;
	BSF        PORTB+0, 0
;check1.c,30 :: 		delay_ms(1000);
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
;check1.c,31 :: 		portb.rb0=0;
	BCF        PORTB+0, 0
;check1.c,32 :: 		}
	GOTO       L_main4
L_main2:
;check1.c,36 :: 		portb.rb0=0;
	BCF        PORTB+0, 0
;check1.c,37 :: 		}
L_main4:
;check1.c,38 :: 		}
	GOTO       L_main0
;check1.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
