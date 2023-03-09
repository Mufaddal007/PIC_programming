
_main:

;ledblink.c,4 :: 		void main() {
;ledblink.c,5 :: 		TRISA.RA0=0x00 ;          // Set direction of the PORTA  as output
	BCF        TRISA+0, 0
;ledblink.c,6 :: 		OSCCAL=0x3f;          //Load Oscillator caliberation register
	MOVLW      63
	MOVWF      OSCCAL+0
;ledblink.c,7 :: 		ANSEL=0x00;           // Use all analog input pins as Digital I/O pins
	CLRF       ANSEL+0
;ledblink.c,10 :: 		while(1)
L_main0:
;ledblink.c,12 :: 		PORTA.RA0=ON;         DELAY_MS(1000);           // One second ON
	BSF        PORTA+0, 0
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
;ledblink.c,13 :: 		PORTA.RA0=OFF;        DELAY_MS(1000);         // One second OFF
	BCF        PORTA+0, 0
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
;ledblink.c,15 :: 		}
	GOTO       L_main0
;ledblink.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
