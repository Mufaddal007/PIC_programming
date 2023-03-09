
_main:

;stepdrivetest.c,1 :: 		void main() {
;stepdrivetest.c,2 :: 		TRISB=0;
	CLRF       TRISB+0
;stepdrivetest.c,3 :: 		while(1)
L_main0:
;stepdrivetest.c,5 :: 		PORTB.RB0=1;
	BSF        PORTB+0, 0
;stepdrivetest.c,6 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;stepdrivetest.c,7 :: 		PORTB.RB0=0;
	BCF        PORTB+0, 0
;stepdrivetest.c,9 :: 		PORTB.RB1=1;
	BSF        PORTB+0, 1
;stepdrivetest.c,10 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;stepdrivetest.c,11 :: 		PORTB.RB1=0;
	BCF        PORTB+0, 1
;stepdrivetest.c,13 :: 		PORTB.RB2=1;
	BSF        PORTB+0, 2
;stepdrivetest.c,14 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;stepdrivetest.c,15 :: 		PORTB.RB2=0;
	BCF        PORTB+0, 2
;stepdrivetest.c,17 :: 		PORTB.RB3=1;
	BSF        PORTB+0, 3
;stepdrivetest.c,18 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;stepdrivetest.c,19 :: 		PORTB.RB3=0;
	BCF        PORTB+0, 3
;stepdrivetest.c,21 :: 		}
	GOTO       L_main0
;stepdrivetest.c,22 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
