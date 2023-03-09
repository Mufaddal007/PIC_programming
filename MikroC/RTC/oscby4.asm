
_main:

;oscby4.c,2 :: 		void main() {
;oscby4.c,3 :: 		trisa.ra0=0;
	BCF        TRISA+0, 0
;oscby4.c,4 :: 		ansel=0x00;
	CLRF       ANSEL+0
;oscby4.c,5 :: 		while(1)
L_main0:
;oscby4.c,7 :: 		porta.ra0=state;
	BTFSC      _state+0, 0
	GOTO       L__main4
	BCF        PORTA+0, 0
	GOTO       L__main5
L__main4:
	BSF        PORTA+0, 0
L__main5:
;oscby4.c,8 :: 		state=~state;
	COMF       _state+0, 1
	COMF       _state+1, 1
;oscby4.c,9 :: 		delay_ms(1000);
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
;oscby4.c,10 :: 		}
	GOTO       L_main0
;oscby4.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
