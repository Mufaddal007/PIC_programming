
_main:

;sevsegmentinterface.c,3 :: 		void main(){
;sevsegmentinterface.c,5 :: 		TRISB=0;
	CLRF       TRISB+0
;sevsegmentinterface.c,6 :: 		while(1)
L_main0:
;sevsegmentinterface.c,8 :: 		for (i=0;i<10;i++)
	CLRF       R1+0
	CLRF       R1+1
L_main2:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      10
	SUBWF      R1+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;sevsegmentinterface.c,10 :: 		PORTB=seg_code[i];
	MOVF       R1+0, 0
	ADDLW      _seg_code+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;sevsegmentinterface.c,11 :: 		delay_ms(1000);
	MOVLW      19
	MOVWF      R11+0
	MOVLW      180
	MOVWF      R12+0
	MOVLW      121
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
;sevsegmentinterface.c,8 :: 		for (i=0;i<10;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;sevsegmentinterface.c,12 :: 		}
	GOTO       L_main2
L_main3:
;sevsegmentinterface.c,13 :: 		}
	GOTO       L_main0
;sevsegmentinterface.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
