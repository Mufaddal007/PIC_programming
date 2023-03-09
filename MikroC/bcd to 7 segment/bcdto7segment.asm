
_main:

;bcdto7segment.c,3 :: 		void main() {
;bcdto7segment.c,4 :: 		trisb=0x0f;
	MOVLW      15
	MOVWF      TRISB+0
;bcdto7segment.c,5 :: 		trisc=0x00;
	CLRF       TRISC+0
;bcdto7segment.c,6 :: 		number=0;
	CLRF       _number+0
;bcdto7segment.c,7 :: 		while(1)
L_main0:
;bcdto7segment.c,9 :: 		number=portb&0x0f;
	MOVLW      15
	ANDWF      PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _number+0
;bcdto7segment.c,10 :: 		portc=sevenseg[number];
	MOVF       R0+0, 0
	ADDLW      _sevenseg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;bcdto7segment.c,11 :: 		}
	GOTO       L_main0
;bcdto7segment.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
