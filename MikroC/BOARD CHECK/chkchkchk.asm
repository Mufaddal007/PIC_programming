
_map:

;chkchkchk.c,17 :: 		long map(int in1, long frommin , long frommax, long tomin, long tomax)
;chkchkchk.c,19 :: 		long value=(in1-frommin)*(tomax-tomin)/(frommax-frommin) + tomin;
	MOVF       FARG_map_in1+0, 0
	MOVWF      R0+0
	MOVF       FARG_map_in1+1, 0
	MOVWF      R0+1
	MOVLW      0
	BTFSC      R0+1, 7
	MOVLW      255
	MOVWF      R0+2
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
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
;chkchkchk.c,20 :: 		return value;
;chkchkchk.c,22 :: 		}
L_end_map:
	RETURN
; end of _map

_main:

;chkchkchk.c,23 :: 		void main() {
;chkchkchk.c,24 :: 		lcd_init();
	CALL       _Lcd_Init+0
;chkchkchk.c,25 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;chkchkchk.c,26 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;chkchkchk.c,27 :: 		lcd_out(1,1,"check");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_chkchkchk+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;chkchkchk.c,28 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;chkchkchk.c,30 :: 		trisa=1;
	MOVLW      1
	MOVWF      TRISA+0
;chkchkchk.c,31 :: 		adcon1=ra0;
	CLRF       ADCON1+0
;chkchkchk.c,32 :: 		trisa.f0=1;
	BSF        TRISA+0, 0
;chkchkchk.c,34 :: 		trisb.rb0=0;
	BCF        TRISB+0, 0
;chkchkchk.c,35 :: 		trisb.rb1=255;
	BSF        TRISB+0, 1
;chkchkchk.c,36 :: 		ADC_init();
	CALL       _ADC_Init+0
;chkchkchk.c,37 :: 		while(1){
L_main1:
;chkchkchk.c,38 :: 		tempread1=adc_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _tempread1+0
	MOVF       R0+1, 0
	MOVWF      _tempread1+1
;chkchkchk.c,40 :: 		inttostr(tempread1, readtostr);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _readtostr+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;chkchkchk.c,41 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;chkchkchk.c,43 :: 		lcd_out(1,1,"I am up!") ;
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_chkchkchk+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;chkchkchk.c,44 :: 		lcd_out(2,1,readtostr);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _readtostr+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;chkchkchk.c,45 :: 		if (!portb.rb1)
	BTFSC      PORTB+0, 1
	GOTO       L_main3
;chkchkchk.c,47 :: 		while(!portb.rb1)  {
L_main4:
	BTFSC      PORTB+0, 1
	GOTO       L_main5
;chkchkchk.c,48 :: 		portb.rb0=1;
	BSF        PORTB+0, 0
;chkchkchk.c,49 :: 		lcd_out(2,10, "Led on");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_chkchkchk+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;chkchkchk.c,50 :: 		}
	GOTO       L_main4
L_main5:
;chkchkchk.c,51 :: 		}
L_main3:
;chkchkchk.c,52 :: 		portb.rb0=0;
	BCF        PORTB+0, 0
;chkchkchk.c,53 :: 		lcd_out(2,10, "Led off");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_chkchkchk+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;chkchkchk.c,55 :: 		}        }
	GOTO       L_main1
L_end_main:
	GOTO       $+0
; end of _main
