
_read_time:

;_16f72rtc.c,15 :: 		short read_time(short addr)
;_16f72rtc.c,17 :: 		soft_i2c_start();
	CALL       _Soft_I2C_Start+0
;_16f72rtc.c,18 :: 		soft_i2c_write(0b11010000);
	MOVLW      208
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,19 :: 		soft_i2c_write(addr);
	MOVF       FARG_read_time_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,20 :: 		soft_i2c_start();
	CALL       _Soft_I2C_Start+0
;_16f72rtc.c,21 :: 		soft_i2c_write(0b11010001);
	MOVLW      209
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,22 :: 		soft_i2c_read(1);
	MOVLW      1
	MOVWF      FARG_Soft_I2C_Read_ack+0
	MOVLW      0
	MOVWF      FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
;_16f72rtc.c,23 :: 		soft_i2c_stop();
	CALL       _Soft_I2C_Stop+0
;_16f72rtc.c,24 :: 		}
L_end_read_time:
	RETURN
; end of _read_time

_main:

;_16f72rtc.c,25 :: 		void main() {
;_16f72rtc.c,26 :: 		lcd_init();
	CALL       _Lcd_Init+0
;_16f72rtc.c,27 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;_16f72rtc.c,28 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;_16f72rtc.c,29 :: 		Soft_i2c_init();
	CALL       _Soft_I2C_Init+0
;_16f72rtc.c,30 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;_16f72rtc.c,32 :: 		soft_i2c_start();
	CALL       _Soft_I2C_Start+0
;_16f72rtc.c,33 :: 		soft_i2c_write(0b11010000);
	MOVLW      208
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,34 :: 		soft_i2c_write(0x00);
	CLRF       FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,35 :: 		soft_i2c_write(0x00);
	CLRF       FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,36 :: 		soft_i2c_write(0x20);
	MOVLW      32
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,37 :: 		soft_i2c_write(0x51);
	MOVLW      81
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,38 :: 		soft_i2c_write(0x04);
	MOVLW      4
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,39 :: 		soft_i2c_write(0x14);
	MOVLW      20
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,40 :: 		soft_i2c_write(0x07);
	MOVLW      7
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,41 :: 		soft_i2c_write(0x21);
	MOVLW      33
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;_16f72rtc.c,42 :: 		soft_i2c_stop();
	CALL       _Soft_I2C_Stop+0
;_16f72rtc.c,43 :: 		while(1)
L_main1:
;_16f72rtc.c,45 :: 		val=read_time(0); time[5]=(char)un(val)+48; time[6] =(char)ln(val);
	CLRF       FARG_read_time_addr+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	CLRF       _time+5
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      _time+6
;_16f72rtc.c,46 :: 		val=read_time(1); time[8]=(char)un(val)+48; time[9]=(char)ln(val);
	MOVLW      1
	MOVWF      FARG_read_time_addr+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	CLRF       _time+8
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      _time+9
;_16f72rtc.c,47 :: 		val=read_time(2); time[11]=(char)un(val)+48; time[12] =(char)ln(val);
	MOVLW      2
	MOVWF      FARG_read_time_addr+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	CLRF       _time+11
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      _time+12
;_16f72rtc.c,48 :: 		val=read_time(4); date[5]=(char)un(val)+48; date[6]=(char)ln(val);
	MOVLW      4
	MOVWF      FARG_read_time_addr+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	CLRF       _date+5
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      _date+6
;_16f72rtc.c,49 :: 		val=read_time(5); date[8]=(char)un(val)+48; date[9] =(char)ln(val);
	MOVLW      5
	MOVWF      FARG_read_time_addr+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	CLRF       _date+8
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      _date+9
;_16f72rtc.c,50 :: 		val=read_time(6); date[11]=(char)un(val)+48; date[12]=(char)ln(val);
	MOVLW      6
	MOVWF      FARG_read_time_addr+0
	CALL       _read_time+0
	MOVF       R0+0, 0
	MOVWF      _val+0
	CLRF       _date+11
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      _date+12
;_16f72rtc.c,52 :: 		lcd_out(1,1,time); lcd_out(2,1,date);
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
;_16f72rtc.c,53 :: 		}
	GOTO       L_main1
;_16f72rtc.c,57 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
