
_main:

;bipolar.c,2 :: 		void main() {
;bipolar.c,3 :: 		trisc=0x00;
	CLRF       TRISC+0
;bipolar.c,4 :: 		trisa=0x00;
	CLRF       TRISA+0
;bipolar.c,5 :: 		i=12;
	MOVLW      12
	MOVWF      _i+0
;bipolar.c,6 :: 		j=1;
	MOVLW      1
	MOVWF      _j+0
;bipolar.c,7 :: 		while(1)
L_main0:
;bipolar.c,9 :: 		ansel=0x00;
	CLRF       ANSEL+0
;bipolar.c,11 :: 		i=(i<<1)|(i>>3)&(0x0f);    //sequence for rotation
	MOVF       _i+0, 0
	MOVWF      R2+0
	RLF        R2+0, 1
	BCF        R2+0, 0
	MOVLW      3
	MOVWF      R1+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main5:
	BTFSC      STATUS+0, 2
	GOTO       L__main6
	RRF        R0+0, 1
	BCF        R0+0, 7
	BTFSC      R0+0, 6
	BSF        R0+0, 7
	ADDLW      255
	GOTO       L__main5
L__main6:
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       R2+0, 0
	IORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _i+0
;bipolar.c,12 :: 		portc=i;
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;bipolar.c,13 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
;bipolar.c,16 :: 		j=(j>>1)|(j<<3)&(0x0f);   //sequence for rotation
	MOVF       _j+0, 0
	MOVWF      R2+0
	RRF        R2+0, 1
	BCF        R2+0, 7
	BTFSC      R2+0, 6
	BSF        R2+0, 7
	MOVLW      3
	MOVWF      R1+0
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main7:
	BTFSC      STATUS+0, 2
	GOTO       L__main8
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main7
L__main8:
	MOVLW      15
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      R2+0, 1
	MOVF       R2+0, 0
	MOVWF      _j+0
;bipolar.c,17 :: 		porta=j<<4;
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;bipolar.c,18 :: 		portc=(j<<2)& 0xf0;
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      240
	ANDWF      R0+0, 0
	MOVWF      PORTC+0
;bipolar.c,19 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;bipolar.c,21 :: 		}
	GOTO       L_main0
;bipolar.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
