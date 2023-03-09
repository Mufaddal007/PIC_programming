
_main:

;sleepmode.c,2 :: 		void main() {
;sleepmode.c,4 :: 		option_reg=0x00;
	CLRF       OPTION_REG+0
;sleepmode.c,5 :: 		trisb.rb0=1;
	BSF        TRISB+0, 0
;sleepmode.c,6 :: 		trisb.rb1=0;
	BCF        TRISB+0, 1
;sleepmode.c,7 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;sleepmode.c,8 :: 		peie_bit=1;
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;sleepmode.c,9 :: 		inte_bit=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;sleepmode.c,10 :: 		intf_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;sleepmode.c,11 :: 		while(1){
L_main0:
;sleepmode.c,12 :: 		for (i=0;i<3;i++)
	CLRF       _i+0
L_main2:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;sleepmode.c,14 :: 		portb.rb1=0; delay_ms(1000);
	BCF        PORTB+0, 1
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;sleepmode.c,15 :: 		portb.rb1=1; delay_ms(300); }
	BSF        PORTB+0, 1
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;sleepmode.c,12 :: 		for (i=0;i<3;i++)
	INCF       _i+0, 1
;sleepmode.c,15 :: 		portb.rb1=1; delay_ms(300); }
	GOTO       L_main2
L_main3:
;sleepmode.c,16 :: 		asm sleep;
	SLEEP
;sleepmode.c,17 :: 		intf_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;sleepmode.c,18 :: 		}
	GOTO       L_main0
;sleepmode.c,19 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
