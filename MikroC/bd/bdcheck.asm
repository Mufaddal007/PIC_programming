
_main:

;bdcheck.c,1 :: 		void main() {
;bdcheck.c,2 :: 		TRISB.RB0=255;
	BSF        TRISB+0, 0
;bdcheck.c,3 :: 		TRISB.RB1=255;
	BSF        TRISB+0, 1
;bdcheck.c,4 :: 		TRISB.RB2=255;
	BSF        TRISB+0, 2
;bdcheck.c,5 :: 		TRISB.RB3=0;
	BCF        TRISB+0, 3
;bdcheck.c,6 :: 		TRISB.RB4=0;
	BCF        TRISB+0, 4
;bdcheck.c,7 :: 		TRISB.RB5=0;
	BCF        TRISB+0, 5
;bdcheck.c,9 :: 		while(1){
L_main0:
;bdcheck.c,10 :: 		if(!portb.rb0)
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;bdcheck.c,12 :: 		portb.rb4=1;
	BSF        PORTB+0, 4
;bdcheck.c,13 :: 		delay_ms(1000);
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
;bdcheck.c,14 :: 		portb.rb4=0;
	BCF        PORTB+0, 4
;bdcheck.c,15 :: 		}
	GOTO       L_main4
L_main2:
;bdcheck.c,16 :: 		else if(!portb.rb1){
	BTFSC      PORTB+0, 1
	GOTO       L_main5
;bdcheck.c,17 :: 		portb.rb3=1;
	BSF        PORTB+0, 3
;bdcheck.c,18 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;bdcheck.c,19 :: 		portb.rb3=0;
	BCF        PORTB+0, 3
;bdcheck.c,20 :: 		}
	GOTO       L_main7
L_main5:
;bdcheck.c,21 :: 		else if(!portb.rb2){
	BTFSC      PORTB+0, 2
	GOTO       L_main8
;bdcheck.c,22 :: 		portb.rb5=1;
	BSF        PORTB+0, 5
;bdcheck.c,23 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;bdcheck.c,24 :: 		portb.rb5=0;
	BCF        PORTB+0, 5
;bdcheck.c,25 :: 		}
L_main8:
L_main7:
L_main4:
;bdcheck.c,28 :: 		}
	GOTO       L_main0
;bdcheck.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
