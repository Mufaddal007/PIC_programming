
_main:

;Adctest.c,17 :: 		void main()
;Adctest.c,19 :: 		ADC_Init_Advanced(_Adc_External_VREFH);
	MOVLW      1
	MOVWF      FARG_ADC_Init_Advanced_reference+0
	CALL       _ADC_Init_Advanced+0
;Adctest.c,20 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Adctest.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Adctest.c,22 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Adctest.c,23 :: 		TRISA=1;
	MOVLW      1
	MOVWF      TRISA+0
;Adctest.c,24 :: 		ADCON1=RA0;
	CLRF       ADCON1+0
;Adctest.c,25 :: 		TRISA.F0= 1;
	BSF        TRISA+0, 0
;Adctest.c,28 :: 		do {
L_main0:
;Adctest.c,29 :: 		temp_res = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;Adctest.c,30 :: 		IntToStr(temp_res,text);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _text+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Adctest.c,31 :: 		Lcd_Out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Adctest.c,32 :: 		Lcd_Out(2,1,"check");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Adctest+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Adctest.c,33 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;Adctest.c,36 :: 		} while(1);
	GOTO       L_main0
;Adctest.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
