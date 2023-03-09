
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;RTC2.c,9 :: 		void interrupt() { if(intf_bit){intf_bit=0;i++; if(i==8)  i=0;}}
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt0
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
	INCF       _i+0, 1
	MOVF       _i+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt1
	CLRF       _i+0
L_interrupt1:
L_interrupt0:
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

_display_set:

;RTC2.c,10 :: 		void display_set(char arr[], short i)
;RTC2.c,12 :: 		arr[i]=(char)un(val)+48; arr[i+1]=(char)ln(val)+48;
	MOVF       FARG_display_set_i+0, 0
	ADDWF      FARG_display_set_arr+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	MOVF       FARG_display_set_i+0, 0
	ADDLW      1
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      0
	BTFSC      FARG_display_set_i+0, 7
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
;RTC2.c,13 :: 		}
L_end_display_set:
	RETURN
; end of _display_set

_updatetime:

;RTC2.c,14 :: 		void updatetime()
;RTC2.c,16 :: 		i2c1_start();
	CALL       _I2C1_Start+0
;RTC2.c,17 :: 		i2c1_Wr(0xD0);                              //slave address with write bit
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC2.c,18 :: 		i2c1_Wr(0x00);                            //word address
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC2.c,19 :: 		i2c1_Wr(((secs/10)<<4) | secs%10);           //seconds
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
;RTC2.c,20 :: 		i2c1_Wr(((mins/10)<<4) | mins%10);           //minutes
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
;RTC2.c,21 :: 		i2c1_wr(((hrs/10)<<4) | hrs%10);           //hour 12 hour format
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
;RTC2.c,22 :: 		i2c1_wr(day);                          //day
	MOVF       _day+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC2.c,23 :: 		i2c1_wr(((dates/10)<<4) | dates%10);          //date
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
;RTC2.c,24 :: 		i2c1_wr(((months/10)<<4) | months%10);         //month
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
;RTC2.c,25 :: 		i2c1_wr(((years/10)<<4) | years%10);          //year
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
;RTC2.c,26 :: 		i2c1_wr(0x10);                          //square wave enable
	MOVLW      16
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC2.c,27 :: 		i2c1_stop();
	CALL       _I2C1_Stop+0
;RTC2.c,28 :: 		}
L_end_updatetime:
	RETURN
; end of _updatetime

_read_time:

;RTC2.c,30 :: 		short read_time(short address)
;RTC2.c,33 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;RTC2.c,34 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC2.c,35 :: 		I2C1_Wr(address);
	MOVF       FARG_read_time_address+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC2.c,36 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;RTC2.c,37 :: 		I2C1_Wr(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;RTC2.c,38 :: 		read_data=I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      read_time_read_data_L0+0
;RTC2.c,39 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;RTC2.c,40 :: 		return(read_data);
	MOVF       read_time_read_data_L0+0, 0
	MOVWF      R0+0
;RTC2.c,41 :: 		}
L_end_read_time:
	RETURN
; end of _read_time

_main:

;RTC2.c,43 :: 		void main()
;RTC2.c,45 :: 		trisb.rb0=1;
	BSF        TRISB+0, 0
;RTC2.c,46 :: 		lcd_init();
	CALL       _Lcd_Init+0
;RTC2.c,47 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC2.c,48 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC2.c,49 :: 		lcd_out(1,1,"...");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_RTC2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC2.c,50 :: 		i2c1_init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;RTC2.c,51 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;RTC2.c,52 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC2.c,53 :: 		lcd_out(1,1,"Done ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_RTC2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC2.c,54 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;RTC2.c,55 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;RTC2.c,57 :: 		while(1){
L_main4:
;RTC2.c,58 :: 		while(i<7){if(!portb.rb0) { switch(i) {
L_main6:
	MOVLW      128
	XORWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      7
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	BTFSC      PORTB+0, 0
	GOTO       L_main8
	GOTO       L_main9
;RTC2.c,59 :: 		case 0: secs++; break;
L_main11:
	INCF       _secs+0, 1
	GOTO       L_main10
;RTC2.c,60 :: 		case 1: mins++; break;
L_main12:
	INCF       _mins+0, 1
	GOTO       L_main10
;RTC2.c,61 :: 		case 2: hrs++;  break;
L_main13:
	INCF       _hrs+0, 1
	GOTO       L_main10
;RTC2.c,62 :: 		case 3: dates++;break;
L_main14:
	INCF       _dates+0, 1
	GOTO       L_main10
;RTC2.c,63 :: 		case 4: months++; break;
L_main15:
	INCF       _months+0, 1
	GOTO       L_main10
;RTC2.c,64 :: 		case 5: years++; break;}}
L_main16:
	INCF       _years+0, 1
	GOTO       L_main10
L_main9:
	MOVF       _i+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _i+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _i+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _i+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _i+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _i+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main16
L_main10:
L_main8:
;RTC2.c,66 :: 		switch(i){
	GOTO       L_main17
;RTC2.c,67 :: 		case 0: lcd_out(1,1,"s:"); lcd_chr(2,1,(char)secs/10+48); lcd_chr(2,1,(char)secs%10+48); break;
L_main19:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_RTC2+0
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
	GOTO       L_main18
;RTC2.c,68 :: 		case 1: lcd_out(1,1,"m:"); lcd_chr(2,1,(char)mins/10+48); lcd_chr(2,1,(char)mins%10+48); break;
L_main20:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_RTC2+0
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
	GOTO       L_main18
;RTC2.c,69 :: 		case 2: lcd_out(1,1,"h:"); lcd_chr(2,1,(char)mins/10+48); lcd_chr(2,1,(char)mins%10+48); break;
L_main21:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_RTC2+0
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
	GOTO       L_main18
;RTC2.c,70 :: 		case 3: lcd_out(1,1,"D:"); lcd_chr(2,1,(char)dates/10+48); lcd_chr(2,1,(char)dates%10+48); break;
L_main22:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_RTC2+0
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
	GOTO       L_main18
;RTC2.c,71 :: 		case 4: lcd_out(1,1,"M:"); lcd_chr(2,1,(char)months/10+48); lcd_chr(2,1,(char)months%10+48); break;
L_main23:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_RTC2+0
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
	GOTO       L_main18
;RTC2.c,72 :: 		case 5: lcd_out(1,1,"Y:"); lcd_chr(2,1,(char)years/10+48); lcd_chr(2,1,(char)years%10+48); break;
L_main24:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_RTC2+0
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
	GOTO       L_main18
;RTC2.c,73 :: 		case 6: updatetime();break;}  }
L_main25:
	CALL       _updatetime+0
	GOTO       L_main18
L_main17:
	MOVF       _i+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _i+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _i+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _i+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       _i+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVF       _i+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _i+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main25
L_main18:
	GOTO       L_main6
L_main7:
;RTC2.c,76 :: 		val= read_time(0)&0x07; display_set(time,5); //seconds
	CLRF       FARG_read_time_address+0
	CALL       _read_time+0
	MOVLW      7
	ANDWF      R0+0, 0
	MOVWF      _val+0
	MOVLW      _time+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      5
	MOVWF      FARG_display_set_i+0
	CALL       _display_set+0
;RTC2.c,77 :: 		val= read_time(1);   display_set(time,8);
	MOVLW      1
	MOVWF      FARG_read_time_address+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	MOVLW      _time+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      8
	MOVWF      FARG_display_set_i+0
	CALL       _display_set+0
;RTC2.c,78 :: 		val=read_time(2)&0x1f;  display_set(time,11);     //hours
	MOVLW      2
	MOVWF      FARG_read_time_address+0
	CALL       _read_time+0
	MOVLW      31
	ANDWF      R0+0, 0
	MOVWF      _val+0
	MOVLW      _time+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      11
	MOVWF      FARG_display_set_i+0
	CALL       _display_set+0
;RTC2.c,80 :: 		val=read_time(4);  display_set(date,5);   //date
	MOVLW      4
	MOVWF      FARG_read_time_address+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	MOVLW      _date+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      5
	MOVWF      FARG_display_set_i+0
	CALL       _display_set+0
;RTC2.c,81 :: 		val=read_time(5);  display_set(date,8);   //month
	MOVLW      5
	MOVWF      FARG_read_time_address+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	MOVLW      _date+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      8
	MOVWF      FARG_display_set_i+0
	CALL       _display_set+0
;RTC2.c,82 :: 		val=read_time(6);  display_set(date,8);           //year
	MOVLW      6
	MOVWF      FARG_read_time_address+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	MOVLW      _date+0
	MOVWF      FARG_display_set_arr+0
	MOVLW      8
	MOVWF      FARG_display_set_i+0
	CALL       _display_set+0
;RTC2.c,84 :: 		lcd_out(1,1,time);  lcd_out(2,1,date);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _time+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _date+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;RTC2.c,85 :: 		}
	GOTO       L_main4
;RTC2.c,86 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
