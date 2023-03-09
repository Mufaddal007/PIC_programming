
_main:

;reltimer.c,10 :: 		void main() {
;reltimer.c,11 :: 		TRISB=TRISC=0;
	CLRF       TRISC+0
	MOVF       TRISC+0, 0
	MOVWF      TRISB+0
;reltimer.c,13 :: 		while(1){
L_main0:
;reltimer.c,14 :: 		PORTC.RC0=0;
	BCF        PORTC+0, 0
;reltimer.c,15 :: 		cat1=cat2=cat3=cat4=1;
	BSF        RC7_bit+0, BitPos(RC7_bit+0)
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L__main43
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__main44
L__main43:
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
L__main44:
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__main45
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main46
L__main45:
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
L__main46:
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main47
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__main48
L__main47:
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
L__main48:
;reltimer.c,16 :: 		for (i=0;i<2;i++) {             //forward loop with led off
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      2
	SUBWF      _i+0, 0
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;reltimer.c,17 :: 		for (j=0;j<60;j++)
	CLRF       _j+0
	CLRF       _j+1
L_main5:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      60
	SUBWF      _j+0, 0
L__main50:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;reltimer.c,20 :: 		dig1=seg[i/10];
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
;reltimer.c,21 :: 		dig2=seg1[i%10];
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
	ADDLW      _seg1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _dig2+0
	CLRF       _dig2+1
	MOVLW      0
	MOVWF      _dig2+1
;reltimer.c,22 :: 		dig3=seg[j/10];
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
;reltimer.c,23 :: 		dig4=seg[j%10];
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
;reltimer.c,25 :: 		k=0;
	CLRF       _k+0
	CLRF       _k+1
;reltimer.c,26 :: 		while(k<=1000){
L_main8:
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _k+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVF       _k+0, 0
	SUBLW      232
L__main51:
	BTFSS      STATUS+0, 0
	GOTO       L_main9
;reltimer.c,28 :: 		PORTB=dig1;
	MOVF       _dig1+0, 0
	MOVWF      PORTB+0
;reltimer.c,29 :: 		cat1=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;reltimer.c,30 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
;reltimer.c,31 :: 		cat1=1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;reltimer.c,34 :: 		if (k<=500)
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _k+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVF       _k+0, 0
	SUBLW      244
L__main52:
	BTFSS      STATUS+0, 0
	GOTO       L_main11
;reltimer.c,36 :: 		PORTB=dig2;
	MOVF       _dig2+0, 0
	MOVWF      PORTB+0
;reltimer.c,37 :: 		}
	GOTO       L_main12
L_main11:
;reltimer.c,38 :: 		else if (k>500)
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _k+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVF       _k+0, 0
	SUBLW      244
L__main53:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;reltimer.c,40 :: 		PORTB=seg[i%10];
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
	MOVWF      PORTB+0
;reltimer.c,41 :: 		}
L_main13:
L_main12:
;reltimer.c,42 :: 		cat2=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;reltimer.c,43 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
;reltimer.c,44 :: 		cat2=1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;reltimer.c,48 :: 		PORTB=dig3;
	MOVF       _dig3+0, 0
	MOVWF      PORTB+0
;reltimer.c,49 :: 		cat3=0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;reltimer.c,50 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
;reltimer.c,51 :: 		cat3=1;
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
;reltimer.c,54 :: 		PORTB=dig4;
	MOVF       _dig4+0, 0
	MOVWF      PORTB+0
;reltimer.c,55 :: 		cat4=0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
;reltimer.c,56 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
;reltimer.c,57 :: 		cat4=1;
	BSF        RC7_bit+0, BitPos(RC7_bit+0)
;reltimer.c,59 :: 		k+=20;
	MOVLW      20
	ADDWF      _k+0, 1
	BTFSC      STATUS+0, 0
	INCF       _k+1, 1
;reltimer.c,61 :: 		}
	GOTO       L_main8
L_main9:
;reltimer.c,17 :: 		for (j=0;j<60;j++)
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;reltimer.c,62 :: 		}
	GOTO       L_main5
L_main6:
;reltimer.c,16 :: 		for (i=0;i<2;i++) {             //forward loop with led off
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;reltimer.c,63 :: 		}
	GOTO       L_main2
L_main3:
;reltimer.c,64 :: 		PORTC.RC0=1;
	BSF        PORTC+0, 0
;reltimer.c,66 :: 		for(i=0;i<3;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main17:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      3
	SUBWF      _i+0, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L_main18
;reltimer.c,67 :: 		PORTB=seg[0];
	MOVF       _seg+0, 0
	MOVWF      PORTB+0
;reltimer.c,68 :: 		cat1=cat2=cat3=cat4=0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L__main55
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__main56
L__main55:
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
L__main56:
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__main57
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main58
L__main57:
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
L__main58:
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main59
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__main60
L__main59:
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
L__main60:
;reltimer.c,69 :: 		delay_ms(1000);
	MOVLW      19
	MOVWF      R11+0
	MOVLW      180
	MOVWF      R12+0
	MOVLW      121
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;reltimer.c,70 :: 		cat1=cat2=cat3=cat4=1;
	BSF        RC7_bit+0, BitPos(RC7_bit+0)
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L__main61
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__main62
L__main61:
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
L__main62:
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__main63
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main64
L__main63:
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
L__main64:
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main65
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__main66
L__main65:
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
L__main66:
;reltimer.c,71 :: 		delay_ms(1000);
	MOVLW      19
	MOVWF      R11+0
	MOVLW      180
	MOVWF      R12+0
	MOVLW      121
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
;reltimer.c,66 :: 		for(i=0;i<3;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;reltimer.c,72 :: 		}
	GOTO       L_main17
L_main18:
;reltimer.c,73 :: 		for (i=1;i>=0;i--){          // backward loop with led on
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main22:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      0
	SUBWF      _i+0, 0
L__main67:
	BTFSS      STATUS+0, 0
	GOTO       L_main23
;reltimer.c,74 :: 		for (j=59;j>=0;j--)
	MOVLW      59
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
L_main25:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      0
	SUBWF      _j+0, 0
L__main68:
	BTFSS      STATUS+0, 0
	GOTO       L_main26
;reltimer.c,77 :: 		dig1=seg[i/10];
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
;reltimer.c,78 :: 		dig2=seg1[i%10];
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
	ADDLW      _seg1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      _dig2+0
	CLRF       _dig2+1
	MOVLW      0
	MOVWF      _dig2+1
;reltimer.c,79 :: 		dig3=seg[j/10];
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
;reltimer.c,80 :: 		dig4=seg[j%10];
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
;reltimer.c,82 :: 		k=0;
	CLRF       _k+0
	CLRF       _k+1
;reltimer.c,83 :: 		while(k<=1000){
L_main28:
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _k+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVF       _k+0, 0
	SUBLW      232
L__main69:
	BTFSS      STATUS+0, 0
	GOTO       L_main29
;reltimer.c,85 :: 		PORTB=dig1;
	MOVF       _dig1+0, 0
	MOVWF      PORTB+0
;reltimer.c,86 :: 		cat1=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;reltimer.c,87 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
;reltimer.c,88 :: 		cat1=1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
;reltimer.c,91 :: 		if (k<=500)
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _k+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVF       _k+0, 0
	SUBLW      244
L__main70:
	BTFSS      STATUS+0, 0
	GOTO       L_main31
;reltimer.c,93 :: 		PORTB=dig2;
	MOVF       _dig2+0, 0
	MOVWF      PORTB+0
;reltimer.c,94 :: 		}
	GOTO       L_main32
L_main31:
;reltimer.c,95 :: 		else if (k>500)
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _k+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVF       _k+0, 0
	SUBLW      244
L__main71:
	BTFSC      STATUS+0, 0
	GOTO       L_main33
;reltimer.c,97 :: 		PORTB=seg[i%10];
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
	MOVWF      PORTB+0
;reltimer.c,98 :: 		}
L_main33:
L_main32:
;reltimer.c,99 :: 		cat2=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;reltimer.c,100 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
;reltimer.c,101 :: 		cat2=1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;reltimer.c,105 :: 		PORTB=dig3;
	MOVF       _dig3+0, 0
	MOVWF      PORTB+0
;reltimer.c,106 :: 		cat3=0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;reltimer.c,107 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
;reltimer.c,108 :: 		cat3=1;
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
;reltimer.c,111 :: 		PORTB=dig4;
	MOVF       _dig4+0, 0
	MOVWF      PORTB+0
;reltimer.c,112 :: 		cat4=0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
;reltimer.c,113 :: 		delay_ms(5);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      239
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
;reltimer.c,114 :: 		cat4=1;
	BSF        RC7_bit+0, BitPos(RC7_bit+0)
;reltimer.c,116 :: 		k+=20;
	MOVLW      20
	ADDWF      _k+0, 1
	BTFSC      STATUS+0, 0
	INCF       _k+1, 1
;reltimer.c,118 :: 		}
	GOTO       L_main28
L_main29:
;reltimer.c,74 :: 		for (j=59;j>=0;j--)
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;reltimer.c,119 :: 		}
	GOTO       L_main25
L_main26:
;reltimer.c,73 :: 		for (i=1;i>=0;i--){          // backward loop with led on
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;reltimer.c,120 :: 		}
	GOTO       L_main22
L_main23:
;reltimer.c,121 :: 		for(i=0;i<3;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main37:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVLW      3
	SUBWF      _i+0, 0
L__main72:
	BTFSC      STATUS+0, 0
	GOTO       L_main38
;reltimer.c,122 :: 		PORTB=seg[0];
	MOVF       _seg+0, 0
	MOVWF      PORTB+0
;reltimer.c,123 :: 		cat1=cat2=cat3=cat4=0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L__main73
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__main74
L__main73:
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
L__main74:
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__main75
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main76
L__main75:
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
L__main76:
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main77
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__main78
L__main77:
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
L__main78:
;reltimer.c,124 :: 		delay_ms(1000);
	MOVLW      19
	MOVWF      R11+0
	MOVLW      180
	MOVWF      R12+0
	MOVLW      121
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
	NOP
;reltimer.c,125 :: 		cat1=cat2=cat3=cat4=1;
	BSF        RC7_bit+0, BitPos(RC7_bit+0)
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L__main79
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__main80
L__main79:
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
L__main80:
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__main81
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main82
L__main81:
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
L__main82:
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main83
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__main84
L__main83:
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
L__main84:
;reltimer.c,126 :: 		delay_ms(1000);
	MOVLW      19
	MOVWF      R11+0
	MOVLW      180
	MOVWF      R12+0
	MOVLW      121
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	DECFSZ     R11+0, 1
	GOTO       L_main41
	NOP
	NOP
;reltimer.c,121 :: 		for(i=0;i<3;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;reltimer.c,127 :: 		}
	GOTO       L_main37
L_main38:
;reltimer.c,131 :: 		}
	GOTO       L_main0
;reltimer.c,132 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
