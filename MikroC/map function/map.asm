
_map:

;map.c,17 :: 		long map(long in1, long frommin, long frommax, long tomin, long tomax )
;map.c,19 :: 		int cal=(in1- frommin)*(tomax-tomin)/(frommax-frommin) +  tomin;
	MOVF       FARG_map_in1+0, 0
	MOVWF      R4+0
	MOVF       FARG_map_in1+1, 0
	MOVWF      R4+1
	MOVF       FARG_map_in1+2, 0
	MOVWF      R4+2
	MOVF       FARG_map_in1+3, 0
	MOVWF      R4+3
	MOVF       FARG_map_frommin+0, 0
	SUBWF      R4+0, 1
	MOVF       FARG_map_frommin+1, 0
	BTFSS      STATUS+0, 0
	INCFSZ     FARG_map_frommin+1, 0
	SUBWF      R4+1, 1
	MOVF       FARG_map_frommin+2, 0
	BTFSS      STATUS+0, 0
	INCFSZ     FARG_map_frommin+2, 0
	SUBWF      R4+2, 1
	MOVF       FARG_map_frommin+3, 0
	BTFSS      STATUS+0, 0
	INCFSZ     FARG_map_frommin+3, 0
	SUBWF      R4+3, 1
	MOVF       FARG_map_tomax+0, 0
	MOVWF      R0+0
	MOVF       FARG_map_tomax+1, 0
	MOVWF      R0+1
	MOVF       FARG_map_tomax+2, 0
	MOVWF      R0+2
	MOVF       FARG_map_tomax+3, 0
	MOVWF      R0+3
	MOVF       FARG_map_tomin+0, 0
	SUBWF      R0+0, 1
	MOVF       FARG_map_tomin+1, 0
	BTFSS      STATUS+0, 0
	INCFSZ     FARG_map_tomin+1, 0
	SUBWF      R0+1, 1
	MOVF       FARG_map_tomin+2, 0
	BTFSS      STATUS+0, 0
	INCFSZ     FARG_map_tomin+2, 0
	SUBWF      R0+2, 1
	MOVF       FARG_map_tomin+3, 0
	BTFSS      STATUS+0, 0
	INCFSZ     FARG_map_tomin+3, 0
	SUBWF      R0+3, 1
	CALL       _Mul_32x32_U+0
	MOVF       FARG_map_frommax+0, 0
	MOVWF      R4+0
	MOVF       FARG_map_frommax+1, 0
	MOVWF      R4+1
	MOVF       FARG_map_frommax+2, 0
	MOVWF      R4+2
	MOVF       FARG_map_frommax+3, 0
	MOVWF      R4+3
	MOVF       FARG_map_frommin+0, 0
	SUBWF      R4+0, 1
	MOVF       FARG_map_frommin+1, 0
	BTFSS      STATUS+0, 0
	INCFSZ     FARG_map_frommin+1, 0
	SUBWF      R4+1, 1
	MOVF       FARG_map_frommin+2, 0
	BTFSS      STATUS+0, 0
	INCFSZ     FARG_map_frommin+2, 0
	SUBWF      R4+2, 1
	MOVF       FARG_map_frommin+3, 0
	BTFSS      STATUS+0, 0
	INCFSZ     FARG_map_frommin+3, 0
	SUBWF      R4+3, 1
	CALL       _Div_32x32_S+0
	MOVF       FARG_map_tomin+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_map_tomin+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     FARG_map_tomin+1, 0
	ADDWF      R0+1, 1
	MOVF       FARG_map_tomin+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     FARG_map_tomin+2, 0
	ADDWF      R0+2, 1
	MOVF       FARG_map_tomin+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     FARG_map_tomin+3, 0
	ADDWF      R0+3, 1
;map.c,20 :: 		return cal;
	MOVLW      0
	BTFSC      R0+1, 7
	MOVLW      255
	MOVWF      R0+2
	MOVWF      R0+3
;map.c,21 :: 		}
L_end_map:
	RETURN
; end of _map

_main:

;map.c,23 :: 		void main() {
;map.c,24 :: 		trisa=1;
	MOVLW      1
	MOVWF      TRISA+0
;map.c,25 :: 		adcon1=ra0;
	CLRF       ADCON1+0
;map.c,26 :: 		trisa.f0=1;
	BSF        TRISA+0, 0
;map.c,27 :: 		lcd_init();
	CALL       _Lcd_Init+0
;map.c,28 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;map.c,29 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;map.c,30 :: 		adc_init();
	CALL       _ADC_Init+0
;map.c,31 :: 		while(1)
L_main0:
;map.c,33 :: 		temp_res1=adc_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res1+0
	MOVF       R0+1, 0
	MOVWF      _temp_res1+1
;map.c,34 :: 		temp_res=map(temp_res1, 0,255, 0, 100);
	MOVF       R0+0, 0
	MOVWF      FARG_map_in1+0
	MOVF       R0+1, 0
	MOVWF      FARG_map_in1+1
	MOVLW      0
	BTFSC      FARG_map_in1+1, 7
	MOVLW      255
	MOVWF      FARG_map_in1+2
	MOVWF      FARG_map_in1+3
	CLRF       FARG_map_frommin+0
	CLRF       FARG_map_frommin+1
	CLRF       FARG_map_frommin+2
	CLRF       FARG_map_frommin+3
	MOVLW      255
	MOVWF      FARG_map_frommax+0
	CLRF       FARG_map_frommax+1
	CLRF       FARG_map_frommax+2
	CLRF       FARG_map_frommax+3
	CLRF       FARG_map_tomin+0
	CLRF       FARG_map_tomin+1
	CLRF       FARG_map_tomin+2
	CLRF       FARG_map_tomin+3
	MOVLW      100
	MOVWF      FARG_map_tomax+0
	CLRF       FARG_map_tomax+1
	CLRF       FARG_map_tomax+2
	CLRF       FARG_map_tomax+3
	CALL       _map+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;map.c,35 :: 		inttostr(temp_res, text);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _text+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;map.c,36 :: 		lcd_out(1,1, text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;map.c,37 :: 		lcd_out(2,1, "check");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_map+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;map.c,38 :: 		}
	GOTO       L_main0
;map.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
