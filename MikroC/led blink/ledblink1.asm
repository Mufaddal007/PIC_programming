
_main:

;ledblink1.c,1 :: 		void main() {
;ledblink1.c,2 :: 		TRISB=0;
	CLRF       TRISB+0
;ledblink1.c,3 :: 		while(1)
L_main0:
;ledblink1.c,6 :: 		PORTB=0xff;
	MOVLW      255
	MOVWF      PORTB+0
;ledblink1.c,7 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;ledblink1.c,8 :: 		PORTB=0x00;
	CLRF       PORTB+0
;ledblink1.c,9 :: 		delay_ms(1000);
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
;ledblink1.c,10 :: 		}
	GOTO       L_main0
;ledblink1.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
