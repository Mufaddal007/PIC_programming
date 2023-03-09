
_main:

;bitarray.c,5 :: 		void main() {
;bitarray.c,7 :: 		trisb=0;
	CLRF       TRISB+0
;bitarray.c,8 :: 		while(1){
L_main0:
;bitarray.c,9 :: 		for(i=0;i<3;i++)
	CLRF       R2+0
	CLRF       R2+1
L_main2:
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      3
	SUBWF      R2+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;bitarray.c,11 :: 		PORTB=1<<i;
	MOVF       R2+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main8:
	BTFSC      STATUS+0, 2
	GOTO       L__main9
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main8
L__main9:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;bitarray.c,12 :: 		delay_ms(1000);
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
;bitarray.c,9 :: 		for(i=0;i<3;i++)
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;bitarray.c,13 :: 		}       }
	GOTO       L_main2
L_main3:
	GOTO       L_main0
;bitarray.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
