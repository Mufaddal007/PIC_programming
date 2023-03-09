
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;SPI1.c,2 :: 		void interrupt() {
;SPI1.c,3 :: 		if (SSPIF_bit)
	BTFSS      SSPIF_bit+0, BitPos(SSPIF_bit+0)
	GOTO       L_interrupt0
;SPI1.c,5 :: 		read=SSPBUF;
	MOVF       SSPBUF+0, 0
	MOVWF      _read+0
;SPI1.c,6 :: 		SSPIF_bit=0;
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
;SPI1.c,7 :: 		}}
L_interrupt0:
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;SPI1.c,8 :: 		void main() {
;SPI1.c,9 :: 		read=0;
	CLRF       _read+0
;SPI1.c,10 :: 		TRISC.RC3=1;
	BSF        TRISC+0, 3
;SPI1.c,11 :: 		TRISC.RC4=1;
	BSF        TRISC+0, 4
;SPI1.c,12 :: 		TRISC.RC5=1;
	BSF        TRISC+0, 5
;SPI1.c,13 :: 		TRISB=0X00;
	CLRF       TRISB+0
;SPI1.c,14 :: 		GIE_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;SPI1.c,15 :: 		PEIE_bit=1;
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;SPI1.c,16 :: 		SSPIE_bit=1;
	BSF        SSPIE_bit+0, BitPos(SSPIE_bit+0)
;SPI1.c,17 :: 		SSPIF_bit=0;
	BCF        SSPIF_bit+0, BitPos(SSPIF_bit+0)
;SPI1.c,18 :: 		BF_Bit=0;
	BCF        BF_bit+0, BitPos(BF_bit+0)
;SPI1.c,19 :: 		SSPEN_bit=1;
	BSF        SSPEN_bit+0, BitPos(SSPEN_bit+0)
;SPI1.c,20 :: 		CKP_bit=0;
	BCF        CKP_bit+0, BitPos(CKP_bit+0)
;SPI1.c,21 :: 		CKE_bit=0;
	BCF        CKE_bit+0, BitPos(CKE_bit+0)
;SPI1.c,22 :: 		SMP_bit=0;
	BCF        SMP_bit+0, BitPos(SMP_bit+0)
;SPI1.c,23 :: 		SSPM0_bit=1;
	BSF        SSPM0_bit+0, BitPos(SSPM0_bit+0)
;SPI1.c,24 :: 		SSPM1_bit=0;
	BCF        SSPM1_bit+0, BitPos(SSPM1_bit+0)
;SPI1.c,25 :: 		SSPM2_bit=1;
	BSF        SSPM2_bit+0, BitPos(SSPM2_bit+0)
;SPI1.c,26 :: 		SSPM3_bit=0;
	BCF        SSPM3_bit+0, BitPos(SSPM3_bit+0)
;SPI1.c,27 :: 		while(1){
L_main1:
;SPI1.c,28 :: 		if (BF_bit){read=SSPBUF; SSPBUF=0; BF_bit=0; }
	BTFSS      BF_bit+0, BitPos(BF_bit+0)
	GOTO       L_main3
	MOVF       SSPBUF+0, 0
	MOVWF      _read+0
	CLRF       SSPBUF+0
	BCF        BF_bit+0, BitPos(BF_bit+0)
L_main3:
;SPI1.c,30 :: 		PORTB=SSPBUF;}
	MOVF       SSPBUF+0, 0
	MOVWF      PORTB+0
	GOTO       L_main1
;SPI1.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
