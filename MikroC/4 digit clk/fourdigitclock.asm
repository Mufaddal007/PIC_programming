
_main:

;fourdigitclock.c,15 :: 		void main() {
;fourdigitclock.c,16 :: 		TRISB=0;
	CLRF       TRISB+0
;fourdigitclock.c,17 :: 		TRISC=0;
	CLRF       TRISC+0
;fourdigitclock.c,19 :: 		for(a=0;a<12;a++)
	CLRF       _a+0
	CLRF       _a+1
L_main0:
	MOVLW      128
	XORWF      _a+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      12
	SUBWF      _a+0, 0
L__main16:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;fourdigitclock.c,21 :: 		for (i=0;i<60;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main3:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      60
	SUBWF      _i+0, 0
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;fourdigitclock.c,24 :: 		for (j=0;j<60;j++)
	CLRF       _j+0
	CLRF       _j+1
L_main6:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      60
	SUBWF      _j+0, 0
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;fourdigitclock.c,27 :: 		dig1=seg[i/10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _dig1+0
	CLRF       _dig1+1
	MOVLW      0
	MOVWF      _dig1+1
;fourdigitclock.c,28 :: 		dig2=seg[i%10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _dig2+0
	CLRF       _dig2+1
	MOVLW      0
	MOVWF      _dig2+1
;fourdigitclock.c,29 :: 		dig3=seg[j/10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _dig3+0
	CLRF       _dig3+1
	MOVLW      0
	MOVWF      _dig3+1
;fourdigitclock.c,30 :: 		dig4=seg[j%10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _dig4+0
	CLRF       _dig4+1
	MOVLW      0
	MOVWF      _dig4+1
;fourdigitclock.c,40 :: 		k=0;
	CLRF       _k+0
	CLRF       _k+1
;fourdigitclock.c,41 :: 		while(k<=1000){
L_main9:
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _k+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVF       _k+0, 0
	SUBLW      232
L__main19:
	BTFSS      STATUS+0, 0
	GOTO       L_main10
;fourdigitclock.c,42 :: 		cat1=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;fourdigitclock.c,43 :: 		PORTB=dig1;
	MOVF       _dig1+0, 0
	MOVWF      PORTB+0
;fourdigitclock.c,44 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
;fourdigitclock.c,45 :: 		cat1=1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;fourdigitclock.c,47 :: 		cat2=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;fourdigitclock.c,48 :: 		PORTB=dig2;
	MOVF       _dig2+0, 0
	MOVWF      PORTB+0
;fourdigitclock.c,49 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
;fourdigitclock.c,50 :: 		cat2=1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;fourdigitclock.c,53 :: 		cat3=0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;fourdigitclock.c,54 :: 		PORTB=dig3;
	MOVF       _dig3+0, 0
	MOVWF      PORTB+0
;fourdigitclock.c,55 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
;fourdigitclock.c,56 :: 		cat3=1;
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
;fourdigitclock.c,58 :: 		cat4=0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
;fourdigitclock.c,59 :: 		PORTB=dig4;
	MOVF       _dig4+0, 0
	MOVWF      PORTB+0
;fourdigitclock.c,60 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
;fourdigitclock.c,61 :: 		cat4=1;
	BSF        RC7_bit+0, BitPos(RC7_bit+0)
;fourdigitclock.c,63 :: 		k+=20;
	MOVLW      20
	ADDWF      _k+0, 1
	BTFSC      STATUS+0, 0
	INCF       _k+1, 1
;fourdigitclock.c,65 :: 		}
	GOTO       L_main9
L_main10:
;fourdigitclock.c,24 :: 		for (j=0;j<60;j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;fourdigitclock.c,69 :: 		}
	GOTO       L_main6
L_main7:
;fourdigitclock.c,21 :: 		for (i=0;i<60;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;fourdigitclock.c,71 :: 		}
	GOTO       L_main3
L_main4:
;fourdigitclock.c,19 :: 		for(a=0;a<12;a++)
	INCF       _a+0, 1
	BTFSC      STATUS+0, 2
	INCF       _a+1, 1
;fourdigitclock.c,72 :: 		}
	GOTO       L_main0
L_main1:
;fourdigitclock.c,75 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
