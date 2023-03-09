
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;capacitance.c,20 :: 		void interrupt()
;capacitance.c,22 :: 		if (tmr1if_bit){elapsedtime++; tmr1if_bit=0; tmr1h=0xfc; tmr1l=0x18; }
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_interrupt0
	MOVF       _elapsedtime+0, 0
	MOVWF      R0+0
	MOVF       _elapsedtime+1, 0
	MOVWF      R0+1
	MOVF       _elapsedtime+2, 0
	MOVWF      R0+2
	MOVF       _elapsedtime+3, 0
	MOVWF      R0+3
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	BTFSC      STATUS+0, 2
	INCF       R0+2, 1
	BTFSC      STATUS+0, 2
	INCF       R0+3, 1
	MOVF       R0+0, 0
	MOVWF      _elapsedtime+0
	MOVF       R0+1, 0
	MOVWF      _elapsedtime+1
	MOVF       R0+2, 0
	MOVWF      _elapsedtime+2
	MOVF       R0+3, 0
	MOVWF      _elapsedtime+3
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	MOVLW      252
	MOVWF      TMR1H+0
	MOVLW      24
	MOVWF      TMR1L+0
L_interrupt0:
;capacitance.c,23 :: 		}
L_end_interrupt:
L__interrupt10:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;capacitance.c,32 :: 		void main() {
;capacitance.c,33 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;capacitance.c,34 :: 		peie_bit=1;
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;capacitance.c,35 :: 		chrgpin_mode=0;
	BCF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;capacitance.c,36 :: 		dischrgpin_mode=1;
	BSF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;capacitance.c,37 :: 		t1con=0x00;
	CLRF       T1CON+0
;capacitance.c,38 :: 		tmr1ie_bit=1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;capacitance.c,39 :: 		chs0_bit=0;
	BCF        CHS0_bit+0, BitPos(CHS0_bit+0)
;capacitance.c,40 :: 		chs1_bit=1;
	BSF        CHS1_bit+0, BitPos(CHS1_bit+0)
;capacitance.c,41 :: 		chs2_bit=0;
	BCF        CHS2_bit+0, BitPos(CHS2_bit+0)
;capacitance.c,42 :: 		trisa=0xff;
	MOVLW      255
	MOVWF      TRISA+0
;capacitance.c,44 :: 		ADC_init();
	CALL       _ADC_Init+0
;capacitance.c,45 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	NOP
	NOP
;capacitance.c,47 :: 		lcd_init();
	CALL       _Lcd_Init+0
;capacitance.c,48 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;capacitance.c,49 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;capacitance.c,50 :: 		while(1)
L_main2:
;capacitance.c,52 :: 		elapsedtime=0;
	CLRF       _elapsedtime+0
	CLRF       _elapsedtime+1
	CLRF       _elapsedtime+2
	CLRF       _elapsedtime+3
;capacitance.c,53 :: 		chrgpin=1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;capacitance.c,54 :: 		tmr1h=0xfc; tmr1l=0x18;
	MOVLW      252
	MOVWF      TMR1H+0
	MOVLW      24
	MOVWF      TMR1L+0
;capacitance.c,55 :: 		tmr1on_bit=1;
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;capacitance.c,56 :: 		while(ADC_read(2)<648){}
L_main4:
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVLW      2
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      136
	SUBWF      R0+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;capacitance.c,57 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;capacitance.c,58 :: 		chrgpin=0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;capacitance.c,59 :: 		tmr1on_bit=0;
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;capacitance.c,60 :: 		tmr1h=0x00; tmr1l=0x00;
	CLRF       TMR1H+0
	CLRF       TMR1L+0
;capacitance.c,62 :: 		dischrgpin_mode=0;
	BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;capacitance.c,63 :: 		dischrgpin=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;capacitance.c,64 :: 		while(ADC_read(2)>0){}
L_main6:
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       R0+0, 0
	SUBLW      0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;capacitance.c,65 :: 		dischrgpin_mode=1;
	BSF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;capacitance.c,67 :: 		capacitance=(float)((elapsedtime*1000)/10000);
	MOVF       _elapsedtime+0, 0
	MOVWF      R0+0
	MOVF       _elapsedtime+1, 0
	MOVWF      R0+1
	MOVF       _elapsedtime+2, 0
	MOVWF      R0+2
	MOVF       _elapsedtime+3, 0
	MOVWF      R0+3
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      16
	MOVWF      R4+0
	MOVLW      39
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      _capacitance+0
	MOVF       R0+1, 0
	MOVWF      _capacitance+1
	MOVF       R0+2, 0
	MOVWF      _capacitance+2
	MOVF       R0+3, 0
	MOVWF      _capacitance+3
;capacitance.c,68 :: 		floattostr_fixlen(capacitance,txt,5);
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
;capacitance.c,69 :: 		lcd_out(1,1,"C= ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_capacitance+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;capacitance.c,70 :: 		lcd_out(1,3,txt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;capacitance.c,71 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;capacitance.c,72 :: 		}
	GOTO       L_main2
;capacitance.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
