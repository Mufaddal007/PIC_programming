
_map:

;chkchkchk1.c,30 :: 		float map(float in1)
;chkchkchk1.c,33 :: 		value = (((in1 - FMIN)*(TMAX_TMIN))/FMAX_FMIN) + TMIN;
	MOVF       FARG_map_in1+0, 0
	MOVWF      R0+0
	MOVF       FARG_map_in1+1, 0
	MOVWF      R0+1
	MOVF       FARG_map_in1+2, 0
	MOVWF      R0+2
	MOVF       FARG_map_in1+3, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
;chkchkchk1.c,34 :: 		return value;
;chkchkchk1.c,35 :: 		}
L_end_map:
	RETURN
; end of _map

_buttoncheck:

;chkchkchk1.c,38 :: 		void buttoncheck()
;chkchkchk1.c,40 :: 		if (!portb.rb1)
	BTFSC      PORTB+0, 1
	GOTO       L_buttoncheck0
;chkchkchk1.c,42 :: 		state=!state;
	MOVF       _state+0, 0
	IORWF      _state+1, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _state+0
	MOVWF      _state+1
	MOVLW      0
	MOVWF      _state+1
;chkchkchk1.c,43 :: 		}
L_buttoncheck0:
;chkchkchk1.c,44 :: 		}
L_end_buttoncheck:
	RETURN
; end of _buttoncheck

_stateset:

;chkchkchk1.c,45 :: 		void stateset()
;chkchkchk1.c,47 :: 		if (state==1)
	MOVLW      0
	XORWF      _state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__stateset11
	MOVLW      1
	XORWF      _state+0, 0
L__stateset11:
	BTFSS      STATUS+0, 2
	GOTO       L_stateset1
;chkchkchk1.c,49 :: 		lcd_out(2,7,"  Led on ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_chkchkchk1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;chkchkchk1.c,50 :: 		portb.rb0=1;
	BSF        PORTB+0, 0
;chkchkchk1.c,51 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_stateset2:
	DECFSZ     R13+0, 1
	GOTO       L_stateset2
	DECFSZ     R12+0, 1
	GOTO       L_stateset2
	DECFSZ     R11+0, 1
	GOTO       L_stateset2
	NOP
	NOP
;chkchkchk1.c,52 :: 		}
	GOTO       L_stateset3
L_stateset1:
;chkchkchk1.c,55 :: 		lcd_out(2,7,"  Led off");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_chkchkchk1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;chkchkchk1.c,56 :: 		portb.rb0=0;
	BCF        PORTB+0, 0
;chkchkchk1.c,57 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_stateset4:
	DECFSZ     R13+0, 1
	GOTO       L_stateset4
	DECFSZ     R12+0, 1
	GOTO       L_stateset4
	DECFSZ     R11+0, 1
	GOTO       L_stateset4
	NOP
	NOP
;chkchkchk1.c,58 :: 		}
L_stateset3:
;chkchkchk1.c,60 :: 		}
L_end_stateset:
	RETURN
; end of _stateset

_main:

;chkchkchk1.c,62 :: 		void main() {
;chkchkchk1.c,63 :: 		lcd_init();
	CALL       _Lcd_Init+0
;chkchkchk1.c,64 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;chkchkchk1.c,65 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;chkchkchk1.c,68 :: 		trisa=1;
	MOVLW      1
	MOVWF      TRISA+0
;chkchkchk1.c,69 :: 		adcon1=ra0;
	CLRF       ADCON1+0
;chkchkchk1.c,70 :: 		trisa.f0=1;
	BSF        TRISA+0, 0
;chkchkchk1.c,72 :: 		trisb.rb0=0;
	BCF        TRISB+0, 0
;chkchkchk1.c,73 :: 		trisb.rb1=255;
	BSF        TRISB+0, 1
;chkchkchk1.c,74 :: 		ADC_init();
	CALL       _ADC_Init+0
;chkchkchk1.c,76 :: 		while(1){
L_main5:
;chkchkchk1.c,77 :: 		lcd_out(1,1,"Hello world!") ;
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_chkchkchk1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;chkchkchk1.c,78 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
;chkchkchk1.c,81 :: 		tempread1=adc_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      _tempread1+0
	MOVF       R0+1, 0
	MOVWF      _tempread1+1
	MOVF       R0+2, 0
	MOVWF      _tempread1+2
	MOVF       R0+3, 0
	MOVWF      _tempread1+3
;chkchkchk1.c,82 :: 		tempread= map(tempread1) ;
	MOVF       R0+0, 0
	MOVWF      FARG_map_in1+0
	MOVF       R0+1, 0
	MOVWF      FARG_map_in1+1
	MOVF       R0+2, 0
	MOVWF      FARG_map_in1+2
	MOVF       R0+3, 0
	MOVWF      FARG_map_in1+3
	CALL       _map+0
	MOVF       R0+0, 0
	MOVWF      _tempread+0
	MOVF       R0+1, 0
	MOVWF      _tempread+1
	MOVF       R0+2, 0
	MOVWF      _tempread+2
	MOVF       R0+3, 0
	MOVWF      _tempread+3
;chkchkchk1.c,83 :: 		FloatToStr_FixLen(tempread, readtostr,5);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+3
	MOVLW      _readtostr+0
	MOVWF      FARG_FloatToStr_FixLen_str+0
	MOVLW      5
	MOVWF      FARG_FloatToStr_FixLen_len+0
	CALL       _FloatToStr_FixLen+0
;chkchkchk1.c,84 :: 		lcd_out(2,1,readtostr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _readtostr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;chkchkchk1.c,86 :: 		buttoncheck();
	CALL       _buttoncheck+0
;chkchkchk1.c,87 :: 		stateset();
	CALL       _stateset+0
;chkchkchk1.c,89 :: 		}
	GOTO       L_main5
;chkchkchk1.c,90 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
