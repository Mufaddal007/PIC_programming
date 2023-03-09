
_main:

;brtest2.c,2 :: 		void main()
;brtest2.c,4 :: 		TRISB.RB0=0;
	BCF        TRISB+0, 0
;brtest2.c,5 :: 		TRISB.RB7=255;
	BSF        TRISB+0, 7
;brtest2.c,6 :: 		while(1)
L_main0:
;brtest2.c,8 :: 		state=1-PORTB.RB7;
	CLRF       R0+0
	BTFSC      PORTB+0, 7
	INCF       R0+0, 1
	MOVF       R0+0, 0
	SUBLW      1
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _state+0
	MOVF       R0+1, 0
	MOVWF      _state+1
;brtest2.c,9 :: 		PORTB.RB0=state;
	BTFSC      R0+0, 0
	GOTO       L__main4
	BCF        PORTB+0, 0
	GOTO       L__main5
L__main4:
	BSF        PORTB+0, 0
L__main5:
;brtest2.c,10 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;brtest2.c,12 :: 		}
	GOTO       L_main0
;brtest2.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
