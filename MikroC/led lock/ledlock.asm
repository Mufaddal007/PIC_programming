
_main:

;ledlock.c,1 :: 		void main() {
;ledlock.c,2 :: 		trisb.rb0=0;
	BCF        TRISB+0, 0
;ledlock.c,4 :: 		trisc.rc0=trisc.rc1=trisc.rc2=trisc.rc3=trisc.rc4=trisc.rc5=trisc.rc6=trisc.rc7=255;
	BSF        TRISC+0, 7
	BTFSC      TRISC+0, 7
	GOTO       L__main9
	BCF        TRISC+0, 6
	GOTO       L__main10
L__main9:
	BSF        TRISC+0, 6
L__main10:
	BTFSC      TRISC+0, 6
	GOTO       L__main11
	BCF        TRISC+0, 5
	GOTO       L__main12
L__main11:
	BSF        TRISC+0, 5
L__main12:
	BTFSC      TRISC+0, 5
	GOTO       L__main13
	BCF        TRISC+0, 4
	GOTO       L__main14
L__main13:
	BSF        TRISC+0, 4
L__main14:
	BTFSC      TRISC+0, 4
	GOTO       L__main15
	BCF        TRISC+0, 3
	GOTO       L__main16
L__main15:
	BSF        TRISC+0, 3
L__main16:
	BTFSC      TRISC+0, 3
	GOTO       L__main17
	BCF        TRISC+0, 2
	GOTO       L__main18
L__main17:
	BSF        TRISC+0, 2
L__main18:
	BTFSC      TRISC+0, 2
	GOTO       L__main19
	BCF        TRISC+0, 1
	GOTO       L__main20
L__main19:
	BSF        TRISC+0, 1
L__main20:
	BTFSC      TRISC+0, 1
	GOTO       L__main21
	BCF        TRISC+0, 0
	GOTO       L__main22
L__main21:
	BSF        TRISC+0, 0
L__main22:
;ledlock.c,6 :: 		while(1)
L_main0:
;ledlock.c,9 :: 		if (portc.rc0 && portc.rc1 && portc.rc2 && portc.rc3 && !portc.rc4 && !portc.rc5  && !portc.rc6 && !portc.rc7)
	BTFSS      PORTC+0, 0
	GOTO       L_main4
	BTFSS      PORTC+0, 1
	GOTO       L_main4
	BTFSS      PORTC+0, 2
	GOTO       L_main4
	BTFSS      PORTC+0, 3
	GOTO       L_main4
	BTFSC      PORTC+0, 4
	GOTO       L_main4
	BTFSC      PORTC+0, 5
	GOTO       L_main4
	BTFSC      PORTC+0, 6
	GOTO       L_main4
	BTFSC      PORTC+0, 7
	GOTO       L_main4
L__main7:
;ledlock.c,11 :: 		portb.rb0=1;
	BSF        PORTB+0, 0
;ledlock.c,12 :: 		delay_ms(1000);
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
;ledlock.c,13 :: 		}
	GOTO       L_main6
L_main4:
;ledlock.c,16 :: 		portb.rb0=0;
	BCF        PORTB+0, 0
;ledlock.c,17 :: 		}
L_main6:
;ledlock.c,19 :: 		}
	GOTO       L_main0
;ledlock.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
