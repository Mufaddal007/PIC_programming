
_lcdcmd:

;lcd.c,9 :: 		void lcdcmd(char cmd)
;lcd.c,11 :: 		rs=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;lcd.c,12 :: 		portc=cmd;
	MOVF       FARG_lcdcmd_cmd+0, 0
	MOVWF      PORTC+0
;lcd.c,13 :: 		en=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;lcd.c,14 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_lcdcmd0:
	DECFSZ     R13+0, 1
	GOTO       L_lcdcmd0
	DECFSZ     R12+0, 1
	GOTO       L_lcdcmd0
;lcd.c,15 :: 		en=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;lcd.c,16 :: 		}
L_end_lcdcmd:
	RETURN
; end of _lcdcmd

_lcddata:

;lcd.c,18 :: 		void lcddata(char data1)
;lcd.c,20 :: 		rs=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;lcd.c,21 :: 		portc=data1;
	MOVF       FARG_lcddata_data1+0, 0
	MOVWF      PORTC+0
;lcd.c,22 :: 		en=1;
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;lcd.c,23 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_lcddata1:
	DECFSZ     R13+0, 1
	GOTO       L_lcddata1
	DECFSZ     R12+0, 1
	GOTO       L_lcddata1
;lcd.c,24 :: 		en=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;lcd.c,25 :: 		}
L_end_lcddata:
	RETURN
; end of _lcddata

_main:

;lcd.c,27 :: 		void main() {
;lcd.c,28 :: 		trisb=0;
	CLRF       TRISB+0
;lcd.c,29 :: 		trisc=0;
	CLRF       TRISC+0
;lcd.c,31 :: 		lcdcmd(0x01);
	MOVLW      1
	MOVWF      FARG_lcdcmd_cmd+0
	CALL       _lcdcmd+0
;lcd.c,32 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
;lcd.c,33 :: 		lcdcmd(0x0C);
	MOVLW      12
	MOVWF      FARG_lcdcmd_cmd+0
	CALL       _lcdcmd+0
;lcd.c,34 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
;lcd.c,35 :: 		lcdcmd(0x38);
	MOVLW      56
	MOVWF      FARG_lcdcmd_cmd+0
	CALL       _lcdcmd+0
;lcd.c,36 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
;lcd.c,37 :: 		for(i=0;i<8;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main5:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      8
	SUBWF      _i+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;lcd.c,39 :: 		lcdcmd(0x80+i);
	MOVF       _i+0, 0
	ADDLW      128
	MOVWF      FARG_lcdcmd_cmd+0
	CALL       _lcdcmd+0
;lcd.c,40 :: 		lcddata(name[i]) ;
	MOVF       _i+0, 0
	ADDLW      _name+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_lcddata_data1+0
	CALL       _lcddata+0
;lcd.c,41 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;lcd.c,37 :: 		for(i=0;i<8;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;lcd.c,42 :: 		}
	GOTO       L_main5
L_main6:
;lcd.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
