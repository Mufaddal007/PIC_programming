
_main:

;MyProject.c,5 :: 		void main() {
;MyProject.c,7 :: 		TRISB=TRISC=0;
	CLRF       TRISC+0
	MOVF       TRISC+0, 0
	MOVWF      TRISB+0
;MyProject.c,10 :: 		while(j<1000)
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
;MyProject.c,12 :: 		dig1=seg[j/1000];
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
;MyProject.c,13 :: 		dig2=seg[(j%1000)/100];
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
;MyProject.c,14 :: 		dig3=seg[(j%100)/10];
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
;MyProject.c,15 :: 		dig4=seg[j%10];
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
;MyProject.c,17 :: 		for (i=0;i<50;i++){
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
;MyProject.c,19 :: 		PORTB=dig1;
	MOVF       main_dig1_L0+0, 0
	MOVWF      PORTB+0
;MyProject.c,20 :: 		PORTC.RC4=0;
	BCF        PORTC+0, 4
;MyProject.c,21 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;MyProject.c,22 :: 		PORTC.RC4=1;
	BSF        PORTC+0, 4
;MyProject.c,24 :: 		PORTB=dig2;
	MOVF       main_dig2_L0+0, 0
	MOVWF      PORTB+0
;MyProject.c,25 :: 		PORTC.RC5=0;
	BCF        PORTC+0, 5
;MyProject.c,26 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;MyProject.c,27 :: 		PORTC.RC5=1;
	BSF        PORTC+0, 5
;MyProject.c,29 :: 		PORTB=dig3;
	MOVF       main_dig3_L0+0, 0
	MOVWF      PORTB+0
;MyProject.c,30 :: 		PORTC.RC6=0;
	BCF        PORTC+0, 6
;MyProject.c,31 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
;MyProject.c,32 :: 		PORTC.RC6=1;
	BSF        PORTC+0, 6
;MyProject.c,34 :: 		PORTB=dig4;
	MOVF       main_dig4_L0+0, 0
	MOVWF      PORTB+0
;MyProject.c,35 :: 		PORTC.RC7=0;
	BCF        PORTC+0, 7
;MyProject.c,36 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
;MyProject.c,37 :: 		PORTC.RC7=1;
	BSF        PORTC+0, 7
;MyProject.c,17 :: 		for (i=0;i<50;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,39 :: 		}
	GOTO       L_main2
L_main3:
;MyProject.c,40 :: 		j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;MyProject.c,41 :: 		}
	GOTO       L_main0
L_main1:
;MyProject.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
