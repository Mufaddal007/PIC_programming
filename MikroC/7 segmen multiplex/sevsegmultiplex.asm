
_main:

;sevsegmultiplex.c,5 :: 		void main() {
;sevsegmultiplex.c,10 :: 		TRISB=0;
	CLRF       TRISB+0
;sevsegmultiplex.c,11 :: 		TRISC=0;
	CLRF       TRISC+0
;sevsegmultiplex.c,14 :: 		while(j<1000)
L_main0:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      232
	SUBWF      _j+0, 0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;sevsegmultiplex.c,16 :: 		dig1=seg[j/1000];
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
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
	MOVWF      main_dig1_L0+0
	CLRF       main_dig1_L0+1
	MOVLW      0
	MOVWF      main_dig1_L0+1
;sevsegmultiplex.c,17 :: 		dig2=seg[(j%1000)/100];
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
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
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      main_dig2_L0+0
	CLRF       main_dig2_L0+1
	MOVLW      0
	MOVWF      main_dig2_L0+1
;sevsegmultiplex.c,18 :: 		dig3=seg[(j%100)/10];
	MOVLW      100
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
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      main_dig3_L0+0
	CLRF       main_dig3_L0+1
	MOVLW      0
	MOVWF      main_dig3_L0+1
;sevsegmultiplex.c,19 :: 		dig4=seg[j%10];
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
	MOVWF      main_dig4_L0+0
	CLRF       main_dig4_L0+1
	MOVLW      0
	MOVWF      main_dig4_L0+1
;sevsegmultiplex.c,21 :: 		for (i=0;i<50;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      50
	SUBWF      _i+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;sevsegmultiplex.c,23 :: 		PORTB=dig1;
	MOVF       main_dig1_L0+0, 0
	MOVWF      PORTB+0
;sevsegmultiplex.c,24 :: 		PORTC.F0=0;
	BCF        PORTC+0, 0
;sevsegmultiplex.c,25 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
;sevsegmultiplex.c,26 :: 		PORTC.F0=1;
	BSF        PORTC+0, 0
;sevsegmultiplex.c,28 :: 		PORTB=dig2;
	MOVF       main_dig2_L0+0, 0
	MOVWF      PORTB+0
;sevsegmultiplex.c,29 :: 		PORTC.F1=0;
	BCF        PORTC+0, 1
;sevsegmultiplex.c,30 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
;sevsegmultiplex.c,31 :: 		PORTC.F1=1;
	BSF        PORTC+0, 1
;sevsegmultiplex.c,33 :: 		PORTB=dig3;
	MOVF       main_dig3_L0+0, 0
	MOVWF      PORTB+0
;sevsegmultiplex.c,34 :: 		PORTC.F2=0;
	BCF        PORTC+0, 2
;sevsegmultiplex.c,35 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
;sevsegmultiplex.c,36 :: 		PORTC.F2=1;
	BSF        PORTC+0, 2
;sevsegmultiplex.c,38 :: 		PORTB=dig4;
	MOVF       main_dig4_L0+0, 0
	MOVWF      PORTB+0
;sevsegmultiplex.c,39 :: 		PORTC.F3=0;
	BCF        PORTC+0, 3
;sevsegmultiplex.c,40 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
;sevsegmultiplex.c,41 :: 		PORTC.F3=1;
	BSF        PORTC+0, 3
;sevsegmultiplex.c,21 :: 		for (i=0;i<50;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;sevsegmultiplex.c,43 :: 		}
	GOTO       L_main2
L_main3:
;sevsegmultiplex.c,44 :: 		j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;sevsegmultiplex.c,45 :: 		}
	GOTO       L_main0
L_main1:
;sevsegmultiplex.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
