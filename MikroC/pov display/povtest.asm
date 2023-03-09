
_printchar:

;povtest.c,40 :: 		void printchar(int chr[])
;povtest.c,42 :: 		for(i=0;i<5;i++)
	CLRF       _i+0
	CLRF       _i+1
L_printchar0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__printchar8
	MOVLW      5
	SUBWF      _i+0, 0
L__printchar8:
	BTFSC      STATUS+0, 0
	GOTO       L_printchar1
;povtest.c,44 :: 		PORTB=chr[i];
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      FARG_printchar_chr+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;povtest.c,45 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_printchar3:
	DECFSZ     R13+0, 1
	GOTO       L_printchar3
	DECFSZ     R12+0, 1
	GOTO       L_printchar3
;povtest.c,42 :: 		for(i=0;i<5;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;povtest.c,46 :: 		}
	GOTO       L_printchar0
L_printchar1:
;povtest.c,47 :: 		PORTB=0x0;
	CLRF       PORTB+0
;povtest.c,48 :: 		delay_ms(4);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_printchar4:
	DECFSZ     R13+0, 1
	GOTO       L_printchar4
	DECFSZ     R12+0, 1
	GOTO       L_printchar4
	NOP
;povtest.c,51 :: 		}
L_end_printchar:
	RETURN
; end of _printchar

_main:

;povtest.c,52 :: 		void main()
;povtest.c,54 :: 		TRISB=0;
	CLRF       TRISB+0
;povtest.c,55 :: 		while(1)
L_main5:
;povtest.c,57 :: 		printchar(M1);
	MOVLW      _M1+0
	MOVWF      FARG_printchar_chr+0
	CALL       _printchar+0
;povtest.c,58 :: 		printchar(U1);
	MOVLW      _U1+0
	MOVWF      FARG_printchar_chr+0
	CALL       _printchar+0
;povtest.c,59 :: 		printchar(F1);
	MOVLW      _F1+0
	MOVWF      FARG_printchar_chr+0
	CALL       _printchar+0
;povtest.c,60 :: 		printchar(F1);
	MOVLW      _F1+0
	MOVWF      FARG_printchar_chr+0
	CALL       _printchar+0
;povtest.c,61 :: 		printchar(I1);
	MOVLW      _I1+0
	MOVWF      FARG_printchar_chr+0
	CALL       _printchar+0
;povtest.c,63 :: 		}
	GOTO       L_main5
;povtest.c,64 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
