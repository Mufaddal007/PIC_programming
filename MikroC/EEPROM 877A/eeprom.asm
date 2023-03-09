
_eeprom_write:

;eeprom.c,19 :: 		void eeprom_write(short address, short dta)
;eeprom.c,21 :: 		while(wr_bit);
L_eeprom_write0:
	BTFSS      WR_bit+0, BitPos(WR_bit+0)
	GOTO       L_eeprom_write1
	GOTO       L_eeprom_write0
L_eeprom_write1:
;eeprom.c,22 :: 		eeadr=address;
	MOVF       FARG_eeprom_write_address+0, 0
	MOVWF      EEADR+0
;eeprom.c,23 :: 		eedata=dta;
	MOVF       FARG_eeprom_write_dta+0, 0
	MOVWF      EEDATA+0
;eeprom.c,24 :: 		eepgd_bit=0;
	BCF        EEPGD_bit+0, BitPos(EEPGD_bit+0)
;eeprom.c,25 :: 		wren_bit=1;
	BSF        WREN_bit+0, BitPos(WREN_bit+0)
;eeprom.c,26 :: 		gie_bit=0;
	BCF        GIE_bit+0, BitPos(GIE_bit+0)
;eeprom.c,27 :: 		eecon2=0x55;
	MOVLW      85
	MOVWF      EECON2+0
;eeprom.c,28 :: 		eecon2=0xAA;
	MOVLW      170
	MOVWF      EECON2+0
;eeprom.c,29 :: 		wr_bit=1;
	BSF        WR_bit+0, BitPos(WR_bit+0)
;eeprom.c,30 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;eeprom.c,31 :: 		wren_bit=0;
	BCF        WREN_bit+0, BitPos(WREN_bit+0)
;eeprom.c,32 :: 		}
L_end_eeprom_write:
	RETURN
; end of _eeprom_write

_eeprom_read:

;eeprom.c,33 :: 		char eeprom_read(short address)
;eeprom.c,35 :: 		eeadr=address;
	MOVF       FARG_eeprom_read_address+0, 0
	MOVWF      EEADR+0
;eeprom.c,36 :: 		eepgd_bit=0;
	BCF        EEPGD_bit+0, BitPos(EEPGD_bit+0)
;eeprom.c,37 :: 		rd_bit=1;
	BSF        RD_bit+0, BitPos(RD_bit+0)
;eeprom.c,38 :: 		dta=eedata;
	MOVF       EEDATA+0, 0
	MOVWF      _dta+0
;eeprom.c,39 :: 		return dta;
	MOVF       _dta+0, 0
	MOVWF      R0+0
;eeprom.c,40 :: 		}
L_end_eeprom_read:
	RETURN
; end of _eeprom_read

_main:

;eeprom.c,42 :: 		void main()
;eeprom.c,44 :: 		wr_bit=0;
	BCF        WR_bit+0, BitPos(WR_bit+0)
;eeprom.c,45 :: 		trisb=0;
	CLRF       TRISB+0
;eeprom.c,47 :: 		lcd_init();
	CALL       _Lcd_Init+0
;eeprom.c,48 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;eeprom.c,49 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;eeprom.c,51 :: 		while(1){
L_main2:
;eeprom.c,52 :: 		dta='A';
	MOVLW      65
	MOVWF      _dta+0
;eeprom.c,53 :: 		for (i=1; i<10;i++)
	MOVLW      1
	MOVWF      _i+0
L_main4:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      10
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;eeprom.c,54 :: 		{ eeprom_write(i,dta);
	MOVF       _i+0, 0
	MOVWF      FARG_eeprom_write_address+0
	MOVF       _dta+0, 0
	MOVWF      FARG_eeprom_write_dta+0
	CALL       _eeprom_write+0
;eeprom.c,55 :: 		dta=dta++;
	INCF       _dta+0, 1
;eeprom.c,53 :: 		for (i=1; i<10;i++)
	INCF       _i+0, 1
;eeprom.c,56 :: 		}
	GOTO       L_main4
L_main5:
;eeprom.c,57 :: 		for (i=1;i<10;i++)
	MOVLW      1
	MOVWF      _i+0
L_main7:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      10
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;eeprom.c,59 :: 		lcd_chr(1,1,eeprom_read(i));
	MOVF       _i+0, 0
	MOVWF      FARG_eeprom_read_address+0
	CALL       _eeprom_read+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	CALL       _Lcd_Chr+0
;eeprom.c,60 :: 		delay_ms(1000);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
;eeprom.c,61 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;eeprom.c,57 :: 		for (i=1;i<10;i++)
	INCF       _i+0, 1
;eeprom.c,62 :: 		}
	GOTO       L_main7
L_main8:
;eeprom.c,64 :: 		}
	GOTO       L_main2
;eeprom.c,65 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
