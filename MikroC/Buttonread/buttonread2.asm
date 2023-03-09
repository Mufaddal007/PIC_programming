
_main:

;buttonread2.c,2 :: 		void main()
;buttonread2.c,4 :: 		TRISB.RB0=0;
	BCF        TRISB+0, 0
;buttonread2.c,5 :: 		TRISB.RB7=255;
	BSF        TRISB+0, 7
;buttonread2.c,6 :: 		while(1)
L_main0:
;buttonread2.c,8 :: 		if (!PORTB.RB7)
	BTFSC      PORTB+0, 7
	GOTO       L_main2
;buttonread2.c,10 :: 		state=1-state;
	MOVF       _state+0, 0
	SUBLW      1
	MOVWF      _state+0
	MOVF       _state+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       _state+1
	SUBWF      _state+1, 1
;buttonread2.c,11 :: 		}
L_main2:
;buttonread2.c,12 :: 		PORTB.RB0=state;
	BTFSC      _state+0, 0
	GOTO       L__main5
	BCF        PORTB+0, 0
	GOTO       L__main6
L__main5:
	BSF        PORTB+0, 0
L__main6:
;buttonread2.c,13 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;buttonread2.c,15 :: 		}
	GOTO       L_main0
;buttonread2.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
