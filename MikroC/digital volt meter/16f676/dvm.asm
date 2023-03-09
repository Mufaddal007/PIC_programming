
_main:

;dvm.c,18 :: 		void main() {
;dvm.c,19 :: 		ansel=0x02;
	MOVLW      2
	MOVWF      ANSEL+0
;dvm.c,20 :: 		trisa=0xff;
	MOVLW      255
	MOVWF      TRISA+0
;dvm.c,21 :: 		adc_init();
	CALL       _ADC_Init+0
;dvm.c,23 :: 		lcd_init();
	CALL       _Lcd_Init+0
;dvm.c,24 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;dvm.c,25 :: 		lcd_out(1,1,"Value= ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_dvm+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;dvm.c,26 :: 		while(1){
L_main0:
;dvm.c,28 :: 		value=adc_read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _value+0
	MOVF       FLOC__main+1, 0
	MOVWF      _value+1
;dvm.c,29 :: 		txt[0]=(char)(value/1000)%10+48;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt+0
;dvm.c,30 :: 		txt[1]=(char)(value/100)%10+48 ;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt+1
;dvm.c,31 :: 		txt[2]=(char)(value/10)%10+48 ;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt+2
;dvm.c,32 :: 		txt[3]=(char)(value%10)+48 ;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt+3
;dvm.c,33 :: 		lcd_out(2,1,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;dvm.c,34 :: 		}
	GOTO       L_main0
;dvm.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
