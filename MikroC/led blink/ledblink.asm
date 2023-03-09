
_main:

;ledblink.c,1 :: 		void main() {
;ledblink.c,2 :: 		TRISB=0;
	CLRF       TRISB+0
;ledblink.c,3 :: 		while(1){
L_main0:
;ledblink.c,4 :: 		PORTB=1;
	MOVLW      1
	MOVWF      PORTB+0
;ledblink.c,5 :: 		delay_ms(1000);
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
;ledblink.c,6 :: 		PORTB=0;
	CLRF       PORTB+0
;ledblink.c,7 :: 		delay_ms(1000);
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
;ledblink.c,8 :: 		}
	GOTO       L_main0
;ledblink.c,9 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
