
_main:

;dvm.c,18 :: 		void main() {
;dvm.c,19 :: 		trisa=0x04;
	MOVLW      4
	MOVWF      TRISA+0
;dvm.c,20 :: 		chs0_bit=0;
	BCF        CHS0_bit+0, BitPos(CHS0_bit+0)
;dvm.c,21 :: 		chs1_bit=1;
	BSF        CHS1_bit+0, BitPos(CHS1_bit+0)
;dvm.c,22 :: 		chs2_bit=0;
	BCF        CHS2_bit+0, BitPos(CHS2_bit+0)
;dvm.c,24 :: 		lcd_init();
	CALL       _Lcd_Init+0
;dvm.c,25 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;dvm.c,26 :: 		adc_init();
	CALL       _ADC_Init+0
;dvm.c,28 :: 		while(1)
L_main0:
;dvm.c,30 :: 		lcd_out(1,1,"Volt= ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_dvm+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;dvm.c,31 :: 		voltage=((adc_read(2)*30.0)/1024.0);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      112
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _voltage+0
	MOVF       R0+1, 0
	MOVWF      _voltage+1
	MOVF       R0+2, 0
	MOVWF      _voltage+2
	MOVF       R0+3, 0
	MOVWF      _voltage+3
;dvm.c,32 :: 		floattostr_fixlen(voltage, txt,5);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+3
	MOVLW      _txt+0
	MOVWF      FARG_FloatToStr_FixLen_str+0
	MOVLW      5
	MOVWF      FARG_FloatToStr_FixLen_len+0
	CALL       _FloatToStr_FixLen+0
;dvm.c,33 :: 		lcd_out(2,4,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;dvm.c,34 :: 		lcd_chr(2,13,'V');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      86
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;dvm.c,35 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;dvm.c,36 :: 		}
	GOTO       L_main0
;dvm.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
