
_main:

;charlieplexing.c,2 :: 		void main() {
;charlieplexing.c,3 :: 		trisb=0xff;
	MOVLW      255
	MOVWF      TRISB+0
;charlieplexing.c,4 :: 		while(1)
L_main0:
;charlieplexing.c,6 :: 		trisb.rb0=0; trisb.rb1=0;
	BCF        TRISB+0, 0
	BCF        TRISB+0, 1
;charlieplexing.c,7 :: 		portb.rb0=1; portb.rb1=0; delay_ms(setdelay);
	BSF        PORTB+0, 0
	BCF        PORTB+0, 1
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;charlieplexing.c,8 :: 		portb.rb0=0; portb.rb1=1; delay_ms(setdelay);
	BCF        PORTB+0, 0
	BSF        PORTB+0, 1
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;charlieplexing.c,9 :: 		trisb.rb0=1; trisb.rb1=1;
	BSF        TRISB+0, 0
	BSF        TRISB+0, 1
;charlieplexing.c,11 :: 		trisb.rb0=0; trisb.rb2=0;
	BCF        TRISB+0, 0
	BCF        TRISB+0, 2
;charlieplexing.c,12 :: 		portb.rb0=1; portb.rb2=0; delay_ms(setdelay);
	BSF        PORTB+0, 0
	BCF        PORTB+0, 2
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;charlieplexing.c,13 :: 		portb.rb0=0; portb.rb2=1; delay_ms(setdelay);
	BCF        PORTB+0, 0
	BSF        PORTB+0, 2
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;charlieplexing.c,14 :: 		trisb.rb0=1; trisb.rb2=1;
	BSF        TRISB+0, 0
	BSF        TRISB+0, 2
;charlieplexing.c,16 :: 		trisb.rb0=0; trisb.rb3=0;
	BCF        TRISB+0, 0
	BCF        TRISB+0, 3
;charlieplexing.c,17 :: 		portb.rb0=1; portb.rb3=0; delay_ms(setdelay);
	BSF        PORTB+0, 0
	BCF        PORTB+0, 3
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;charlieplexing.c,18 :: 		portb.rb0=0; portb.rb3=1; delay_ms(setdelay);
	BCF        PORTB+0, 0
	BSF        PORTB+0, 3
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;charlieplexing.c,19 :: 		trisb.rb0=1; trisb.rb3=1;
	BSF        TRISB+0, 0
	BSF        TRISB+0, 3
;charlieplexing.c,22 :: 		trisb.rb1=0; trisb.rb2=0;
	BCF        TRISB+0, 1
	BCF        TRISB+0, 2
;charlieplexing.c,23 :: 		portb.rb1=1; portb.rb2=0; delay_ms(setdelay);
	BSF        PORTB+0, 1
	BCF        PORTB+0, 2
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;charlieplexing.c,24 :: 		portb.rb1=0; portb.rb2=1; delay_ms(setdelay);
	BCF        PORTB+0, 1
	BSF        PORTB+0, 2
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;charlieplexing.c,25 :: 		trisb.rb1=1; trisb.rb2=1;
	BSF        TRISB+0, 1
	BSF        TRISB+0, 2
;charlieplexing.c,27 :: 		trisb.rb1=0; trisb.rb3=0;
	BCF        TRISB+0, 1
	BCF        TRISB+0, 3
;charlieplexing.c,28 :: 		portb.rb1=1; portb.rb3=0; delay_ms(setdelay);
	BSF        PORTB+0, 1
	BCF        PORTB+0, 3
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;charlieplexing.c,29 :: 		portb.rb1=0; portb.rb3=1; delay_ms(setdelay);
	BCF        PORTB+0, 1
	BSF        PORTB+0, 3
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;charlieplexing.c,30 :: 		trisb.rb1=1; trisb.rb3=1;
	BSF        TRISB+0, 1
	BSF        TRISB+0, 3
;charlieplexing.c,33 :: 		trisb.rb2=0; trisb.rb3=0;
	BCF        TRISB+0, 2
	BCF        TRISB+0, 3
;charlieplexing.c,34 :: 		portb.rb2=1; portb.rb3=0; delay_ms(setdelay);
	BSF        PORTB+0, 2
	BCF        PORTB+0, 3
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;charlieplexing.c,35 :: 		portb.rb2=0; portb.rb3=1; delay_ms(setdelay);
	BCF        PORTB+0, 2
	BSF        PORTB+0, 3
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;charlieplexing.c,36 :: 		trisb.rb2=1; trisb.rb3=1;
	BSF        TRISB+0, 2
	BSF        TRISB+0, 3
;charlieplexing.c,38 :: 		}
	GOTO       L_main0
;charlieplexing.c,39 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
