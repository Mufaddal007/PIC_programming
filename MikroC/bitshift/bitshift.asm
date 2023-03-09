
_main:

;bitshift.c,1 :: 		void main() {
;bitshift.c,2 :: 		while(1)
L_main0:
;bitshift.c,5 :: 		trisb=0;
	CLRF       TRISB+0
;bitshift.c,6 :: 		portb=1;
	MOVLW      1
	MOVWF      PORTB+0
;bitshift.c,7 :: 		delay_ms(1000);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;bitshift.c,8 :: 		for(i=0;i<7;i++)
	CLRF       R2+0
	CLRF       R2+1
L_main3:
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      7
	SUBWF      R2+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;bitshift.c,10 :: 		portb=portb<<1;;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;bitshift.c,11 :: 		delay_ms(1000);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;bitshift.c,8 :: 		for(i=0;i<7;i++)
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;bitshift.c,13 :: 		}
	GOTO       L_main3
L_main4:
;bitshift.c,14 :: 		}
	GOTO       L_main0
;bitshift.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
