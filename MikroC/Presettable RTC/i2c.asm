
_main:

;i2c.c,1 :: 		void main() {
;i2c.c,2 :: 		i2c1_init(100000);
	MOVLW      10
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;i2c.c,3 :: 		delay_ms(100);
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
;i2c.c,4 :: 		while(1){
L_main1:
;i2c.c,5 :: 		i2c1_start();
	CALL       _I2C1_Start+0
;i2c.c,6 :: 		i2c1_wr(0x0A);
	MOVLW      10
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,7 :: 		i2c1_wr(0x77);
	MOVLW      119
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,8 :: 		i2c1_wr(0x78);
	MOVLW      120
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,9 :: 		i2c1_wr(0x79);
	MOVLW      121
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;i2c.c,10 :: 		i2c1_repeated_start();
	CALL       _I2C1_Repeated_Start+0
;i2c.c,11 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;i2c.c,12 :: 		}
	GOTO       L_main1
;i2c.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
