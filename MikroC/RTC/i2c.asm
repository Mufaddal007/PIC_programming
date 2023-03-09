
_display_current:

;i2c.c,11 :: 		void display_current()
;i2c.c,13 :: 		switch(i){
	GOTO       L_display_current0
;i2c.c,14 :: 		case 0: lcd_out(1,1,"s:"); lcd_chr(2,1,(char)secs/10+48); lcd_chr(2,1,(char)secs%10+48); break;
L_display_current2:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_i2c+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _secs+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _secs+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_display_current1
;i2c.c,15 :: 		case 1: lcd_out(1,1,"m:"); lcd_chr(2,1,(char)mins/10+48); lcd_chr(2,1,(char)mins%10+48); break;
L_display_current3:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_i2c+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _mins+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _mins+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_display_current1
;i2c.c,16 :: 		case 2: lcd_out(1,1,"h:"); lcd_chr(2,1,(char)mins/10+48); lcd_chr(2,1,(char)mins%10+48); break;
L_display_current4:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_i2c+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _mins+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _mins+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_display_current1
;i2c.c,17 :: 		case 3: lcd_out(1,1,"D:"); lcd_chr(2,1,(char)dates/10+48); lcd_chr(2,1,(char)dates%10+48); break;
L_display_current5:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_i2c+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _dates+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _dates+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_display_current1
;i2c.c,18 :: 		case 4: lcd_out(1,1,"M:"); lcd_chr(2,1,(char)months/10+48); lcd_chr(2,1,(char)months%10+48); break;
L_display_current6:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_i2c+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _months+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _months+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_display_current1
;i2c.c,19 :: 		case 5: lcd_out(1,1,"Y:"); lcd_chr(2,1,(char)years/10+48); lcd_chr(2,1,(char)years%10+48); break;
L_display_current7:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_i2c+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _years+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _years+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	GOTO       L_display_current1
;i2c.c,20 :: 		}
L_display_current0:
	MOVF       _i+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_display_current2
	MOVF       _i+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_display_current3
	MOVF       _i+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_display_current4
	MOVF       _i+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_display_current5
	MOVF       _i+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_display_current6
	MOVF       _i+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_display_current7
L_display_current1:
;i2c.c,21 :: 		}
L_end_display_current:
	RETURN
; end of _display_current

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;i2c.c,22 :: 		void interrupt() { if(intf_bit){intf_bit=0;i++; if(!(i<7)) i=0;}}
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt8
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
	INCF       _i+0, 1
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      7
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt9
	CLRF       _i+0
L_interrupt9:
L_interrupt8:
L_end_interrupt:
L__interrupt27:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_settime:

;i2c.c,23 :: 		void settime()   {   switch(i) {
	GOTO       L_settime10
;i2c.c,24 :: 		case 0: secs++; break;
L_settime12:
	INCF       _secs+0, 1
	GOTO       L_settime11
;i2c.c,25 :: 		case 1: mins++; break;
L_settime13:
	INCF       _mins+0, 1
	GOTO       L_settime11
;i2c.c,26 :: 		case 2: hrs++;  break;
L_settime14:
	INCF       _hrs+0, 1
	GOTO       L_settime11
;i2c.c,27 :: 		case 3: dates++;break;
L_settime15:
	INCF       _dates+0, 1
	GOTO       L_settime11
;i2c.c,28 :: 		case 4: months++; break;
L_settime16:
	INCF       _months+0, 1
	GOTO       L_settime11
;i2c.c,29 :: 		case 5: years++; break;} }
L_settime17:
	INCF       _years+0, 1
	GOTO       L_settime11
L_settime10:
	MOVF       _i+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_settime12
	MOVF       _i+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_settime13
	MOVF       _i+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_settime14
	MOVF       _i+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_settime15
	MOVF       _i+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_settime16
	MOVF       _i+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_settime17
L_settime11:
L_end_settime:
	RETURN
; end of _settime

_updatetime:

;i2c.c,30 :: 		void updatetime()
;i2c.c,32 :: 		i2c1_start();
	CALL       _I2C1_Start+0
;i2c.c,33 :: 		i2c1_Wr(0xD0);                              //slave address with write bit
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,34 :: 		i2c1_Wr(0x00);                            //word address
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,35 :: 		i2c1_Wr(((secs/10)<<4) | secs%10);           //seconds
	MOVLW      10
	MOVWF      R4+0
	MOVF       _secs+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R0+0, 0
	MOVWF      FLOC__updatetime+0
	MOVLW      0
	BTFSC      FLOC__updatetime+0, 7
	MOVLW      255
	MOVWF      FLOC__updatetime+1
	MOVF       R1+0, 0
L__updatetime30:
	BTFSC      STATUS+0, 2
	GOTO       L__updatetime31
	RLF        FLOC__updatetime+0, 1
	RLF        FLOC__updatetime+1, 1
	BCF        FLOC__updatetime+0, 0
	ADDLW      255
	GOTO       L__updatetime30
L__updatetime31:
	MOVLW      10
	MOVWF      R4+0
	MOVF       _secs+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      FLOC__updatetime+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,36 :: 		i2c1_Wr(((mins/10)<<4) | mins%10);           //minutes
	MOVLW      10
	MOVWF      R4+0
	MOVF       _mins+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R0+0, 0
	MOVWF      FLOC__updatetime+0
	MOVLW      0
	BTFSC      FLOC__updatetime+0, 7
	MOVLW      255
	MOVWF      FLOC__updatetime+1
	MOVF       R1+0, 0
L__updatetime32:
	BTFSC      STATUS+0, 2
	GOTO       L__updatetime33
	RLF        FLOC__updatetime+0, 1
	RLF        FLOC__updatetime+1, 1
	BCF        FLOC__updatetime+0, 0
	ADDLW      255
	GOTO       L__updatetime32
L__updatetime33:
	MOVLW      10
	MOVWF      R4+0
	MOVF       _mins+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      FLOC__updatetime+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,37 :: 		i2c1_wr(((hrs/10)<<4) | hrs%10);           //hour 12 hour format
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hrs+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R0+0, 0
	MOVWF      FLOC__updatetime+0
	MOVLW      0
	BTFSC      FLOC__updatetime+0, 7
	MOVLW      255
	MOVWF      FLOC__updatetime+1
	MOVF       R1+0, 0
L__updatetime34:
	BTFSC      STATUS+0, 2
	GOTO       L__updatetime35
	RLF        FLOC__updatetime+0, 1
	RLF        FLOC__updatetime+1, 1
	BCF        FLOC__updatetime+0, 0
	ADDLW      255
	GOTO       L__updatetime34
L__updatetime35:
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hrs+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      FLOC__updatetime+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,38 :: 		i2c1_wr(day);                          //day
	MOVF       _day+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,39 :: 		i2c1_wr(((dates/10)<<4) | dates%10);          //date
	MOVLW      10
	MOVWF      R4+0
	MOVF       _dates+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R0+0, 0
	MOVWF      FLOC__updatetime+0
	MOVLW      0
	BTFSC      FLOC__updatetime+0, 7
	MOVLW      255
	MOVWF      FLOC__updatetime+1
	MOVF       R1+0, 0
L__updatetime36:
	BTFSC      STATUS+0, 2
	GOTO       L__updatetime37
	RLF        FLOC__updatetime+0, 1
	RLF        FLOC__updatetime+1, 1
	BCF        FLOC__updatetime+0, 0
	ADDLW      255
	GOTO       L__updatetime36
L__updatetime37:
	MOVLW      10
	MOVWF      R4+0
	MOVF       _dates+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      FLOC__updatetime+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,40 :: 		i2c1_wr(((months/10)<<4) | months%10);         //month
	MOVLW      10
	MOVWF      R4+0
	MOVF       _months+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R0+0, 0
	MOVWF      FLOC__updatetime+0
	MOVLW      0
	BTFSC      FLOC__updatetime+0, 7
	MOVLW      255
	MOVWF      FLOC__updatetime+1
	MOVF       R1+0, 0
L__updatetime38:
	BTFSC      STATUS+0, 2
	GOTO       L__updatetime39
	RLF        FLOC__updatetime+0, 1
	RLF        FLOC__updatetime+1, 1
	BCF        FLOC__updatetime+0, 0
	ADDLW      255
	GOTO       L__updatetime38
L__updatetime39:
	MOVLW      10
	MOVWF      R4+0
	MOVF       _months+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      FLOC__updatetime+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,41 :: 		i2c1_wr(((years/10)<<4) | years%10);          //year
	MOVLW      10
	MOVWF      R4+0
	MOVF       _years+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R0+0, 0
	MOVWF      FLOC__updatetime+0
	MOVLW      0
	BTFSC      FLOC__updatetime+0, 7
	MOVLW      255
	MOVWF      FLOC__updatetime+1
	MOVF       R1+0, 0
L__updatetime40:
	BTFSC      STATUS+0, 2
	GOTO       L__updatetime41
	RLF        FLOC__updatetime+0, 1
	RLF        FLOC__updatetime+1, 1
	BCF        FLOC__updatetime+0, 0
	ADDLW      255
	GOTO       L__updatetime40
L__updatetime41:
	MOVLW      10
	MOVWF      R4+0
	MOVF       _years+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      FLOC__updatetime+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,42 :: 		i2c1_wr(0x10);                          //square wave enable
	MOVLW      16
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,43 :: 		i2c1_stop();
	CALL       _I2C1_Stop+0
;i2c.c,44 :: 		}
L_end_updatetime:
	RETURN
; end of _updatetime

_read_time:

;i2c.c,45 :: 		short read_time(short address)
;i2c.c,48 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;i2c.c,49 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,50 :: 		I2C1_Wr(address);
	MOVF       FARG_read_time_address+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,51 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;i2c.c,52 :: 		I2C1_Wr(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,53 :: 		read_data=I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      read_time_read_data_L0+0
;i2c.c,54 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;i2c.c,55 :: 		return(read_data);
	MOVF       read_time_read_data_L0+0, 0
	MOVWF      R0+0
;i2c.c,56 :: 		}
L_end_read_time:
	RETURN
; end of _read_time

_display_set:

;i2c.c,57 :: 		void display_set(char arr[15], short j)
;i2c.c,58 :: 		{ arr[j]=(char)un(val)+48; arr[j+1]=(char) ln(val)+48;  }
	MOVF       FARG_display_set_j+0, 0
	ADDWF      FARG_display_set_arr+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	MOVF       FARG_display_set_j+0, 0
	ADDLW      1
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      0
	BTFSC      FARG_display_set_j+0, 7
	MOVLW      255
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	ADDWF      FARG_display_set_arr+0, 0
	MOVWF      FSR
	MOVLW      63
	ANDWF      _val+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_end_display_set:
	RETURN
; end of _display_set

_main:

;i2c.c,59 :: 		void main()
;i2c.c,61 :: 		trisb.rb0=1;
	BSF        TRISB+0, 0
;i2c.c,62 :: 		lcd_init();
	CALL       _Lcd_Init+0
;i2c.c,63 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;i2c.c,64 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;i2c.c,65 :: 		lcd_out(1,1,"...");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_i2c+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;i2c.c,66 :: 		i2c1_init(100000);
	MOVLW      10
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;i2c.c,67 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
;i2c.c,68 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;i2c.c,69 :: 		lcd_out(1,1,"Done ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_i2c+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;i2c.c,70 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;i2c.c,71 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;i2c.c,72 :: 		while(1){
L_main20:
;i2c.c,73 :: 		while(i<6){if(!portb.rb0) settime(); display_current();}
L_main22:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main23
	BTFSC      PORTB+0, 0
	GOTO       L_main24
	CALL       _settime+0
L_main24:
	CALL       _display_current+0
	GOTO       L_main22
L_main23:
;i2c.c,74 :: 		updatetime();
	CALL       _updatetime+0
;i2c.c,75 :: 		val= read_time(0)&0x07;  display_set(time, 5);    //seconds
	CLRF       FARG_read_time_address+0
	CALL       _read_time+0
	MOVLW      7
	ANDWF      R0+0, 0
	MOVWF      _val+0
	MOVLW      _time+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      5
	MOVWF      FARG_display_set_j+0
	CALL       _display_set+0
;i2c.c,76 :: 		val= read_time(1);   display_set(time,8);         //minutes
	MOVLW      1
	MOVWF      FARG_read_time_address+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	MOVLW      _time+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      8
	MOVWF      FARG_display_set_j+0
	CALL       _display_set+0
;i2c.c,77 :: 		val=read_time(2)&0x1f; display_set(time, 11);      //hours
	MOVLW      2
	MOVWF      FARG_read_time_address+0
	CALL       _read_time+0
	MOVLW      31
	ANDWF      R0+0, 0
	MOVWF      _val+0
	MOVLW      _time+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      11
	MOVWF      FARG_display_set_j+0
	CALL       _display_set+0
;i2c.c,79 :: 		val=read_time(4);  display_set(date,5);         //date
	MOVLW      4
	MOVWF      FARG_read_time_address+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	MOVLW      _date+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      5
	MOVWF      FARG_display_set_j+0
	CALL       _display_set+0
;i2c.c,80 :: 		val=read_time(5);  display_set(date,8);         //month
	MOVLW      5
	MOVWF      FARG_read_time_address+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	MOVLW      _date+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      8
	MOVWF      FARG_display_set_j+0
	CALL       _display_set+0
;i2c.c,81 :: 		val=read_time(6);  display_set(date,11);          //year
	MOVLW      6
	MOVWF      FARG_read_time_address+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	MOVLW      _date+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      11
	MOVWF      FARG_display_set_j+0
	CALL       _display_set+0
;i2c.c,82 :: 		lcd_out(1,1,time);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _time+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;i2c.c,83 :: 		lcd_out(2,1,date);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _date+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;i2c.c,84 :: 		}
	GOTO       L_main20
;i2c.c,85 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
