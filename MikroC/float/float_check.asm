
_main:

;float_check.c,18 :: 		void main() {
;float_check.c,19 :: 		lcd_init();
	CALL       _Lcd_Init+0
;float_check.c,20 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;float_check.c,21 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;float_check.c,22 :: 		a=25.78798;
	MOVLW      200
	MOVWF      _a+0
	MOVLW      77
	MOVWF      _a+1
	MOVLW      78
	MOVWF      _a+2
	MOVLW      131
	MOVWF      _a+3
;float_check.c,23 :: 		floattostr_fixlen(a, atostr, 7);
	MOVLW      200
	MOVWF      FARG_FloatToStr_FixLen_fnum+0
	MOVLW      77
	MOVWF      FARG_FloatToStr_FixLen_fnum+1
	MOVLW      78
	MOVWF      FARG_FloatToStr_FixLen_fnum+2
	MOVLW      131
	MOVWF      FARG_FloatToStr_FixLen_fnum+3
	MOVLW      _atostr+0
	MOVWF      FARG_FloatToStr_FixLen_str+0
	MOVLW      7
	MOVWF      FARG_FloatToStr_FixLen_len+0
	CALL       _FloatToStr_FixLen+0
;float_check.c,24 :: 		lcd_out(1,1,atostr);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _atostr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;float_check.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
