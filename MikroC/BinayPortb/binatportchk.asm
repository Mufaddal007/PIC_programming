
_main:

;binatportchk.c,1 :: 		void main() {
;binatportchk.c,2 :: 		TRISB=0;
	CLRF       TRISB+0
;binatportchk.c,3 :: 		while(1){
L_main0:
;binatportchk.c,4 :: 		PORTB=0b01010101;
	MOVLW      85
	MOVWF      PORTB+0
;binatportchk.c,5 :: 		delay_ms(1000);
	MOVLW      19
	MOVWF      R11+0
	MOVLW      180
	MOVWF      R12+0
	MOVLW      121
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
;binatportchk.c,6 :: 		PORTB=0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;binatportchk.c,7 :: 		delay_ms(1000);
	MOVLW      19
	MOVWF      R11+0
	MOVLW      180
	MOVWF      R12+0
	MOVLW      121
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
;binatportchk.c,8 :: 		}
	GOTO       L_main0
;binatportchk.c,9 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
