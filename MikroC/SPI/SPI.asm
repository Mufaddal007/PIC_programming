
_main:

;SPI.c,2 :: 		void main() {
;SPI.c,3 :: 		TRISC.RC3=0;
	BCF        TRISC+0, 3
;SPI.c,4 :: 		TRISC.RC4=0;
	BCF        TRISC+0, 4
;SPI.c,5 :: 		TRISC.RC5=0;
	BCF        TRISC+0, 5
;SPI.c,6 :: 		TRISB=0x00;
	CLRF       TRISB+0
;SPI.c,7 :: 		SSPEN_bit=1 ;
	BSF        SSPEN_bit+0, BitPos(SSPEN_bit+0)
;SPI.c,8 :: 		SSPM0_bit=0;
	BCF        SSPM0_bit+0, BitPos(SSPM0_bit+0)
;SPI.c,9 :: 		SSPM1_bit=0;
	BCF        SSPM1_bit+0, BitPos(SSPM1_bit+0)
;SPI.c,10 :: 		SSPM2_bit=0;
	BCF        SSPM2_bit+0, BitPos(SSPM2_bit+0)
;SPI.c,11 :: 		SSPM3_bit=0;
	BCF        SSPM3_bit+0, BitPos(SSPM3_bit+0)
;SPI.c,13 :: 		CKE_bit=0 ;
	BCF        CKE_bit+0, BitPos(CKE_bit+0)
;SPI.c,14 :: 		CKP_bit=0;
	BCF        CKP_bit+0, BitPos(CKP_bit+0)
;SPI.c,15 :: 		SMP_bit=0 ;
	BCF        SMP_bit+0, BitPos(SMP_bit+0)
;SPI.c,16 :: 		i=1;
	MOVLW      1
	MOVWF      _i+0
;SPI.c,17 :: 		while(1)
L_main0:
;SPI.c,19 :: 		while(i!=4){ SSPBUF=i; portb=SSPBUF; i<<=1; delay_ms(1000); }
L_main2:
	MOVF       _i+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main3
	MOVF       _i+0, 0
	MOVWF      SSPBUF+0
	MOVF       SSPBUF+0, 0
	MOVWF      PORTB+0
	RLF        _i+0, 1
	BCF        _i+0, 0
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
	GOTO       L_main2
L_main3:
;SPI.c,21 :: 		i=1;
	MOVLW      1
	MOVWF      _i+0
;SPI.c,22 :: 		}
	GOTO       L_main0
;SPI.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
