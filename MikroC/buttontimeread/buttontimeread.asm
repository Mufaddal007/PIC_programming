
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;buttontimeread.c,7 :: 		void interrupt() { if(tmr0if_bit) {tmr0if_bit=0; TMR0= 61; press_time+=50;} }
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt0
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	MOVLW      61
	MOVWF      TMR0+0
	MOVLW      50
	ADDWF      _press_time+0, 1
	BTFSC      STATUS+0, 0
	INCF       _press_time+1, 1
L_interrupt0:
L_end_interrupt:
L__interrupt27:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;buttontimeread.c,8 :: 		void main()
;buttontimeread.c,10 :: 		press_time=0;
	CLRF       _press_time+0
	CLRF       _press_time+1
;buttontimeread.c,11 :: 		trisb.rb0=1;
	BSF        TRISB+0, 0
;buttontimeread.c,12 :: 		trisb.rb1=0;
	BCF        TRISB+0, 1
;buttontimeread.c,13 :: 		trisb.rb2=0;
	BCF        TRISB+0, 2
;buttontimeread.c,14 :: 		led1=0;
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;buttontimeread.c,15 :: 		led2=0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;buttontimeread.c,16 :: 		lcd_init();
	CALL       _Lcd_Init+0
;buttontimeread.c,17 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;buttontimeread.c,18 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;buttontimeread.c,19 :: 		OPTION_REG= 0x87;
	MOVLW      135
	MOVWF      OPTION_REG+0
;buttontimeread.c,20 :: 		INTCON        = 0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;buttontimeread.c,21 :: 		tmr0ie_bit=0;
	BCF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;buttontimeread.c,22 :: 		while(1)
L_main1:
;buttontimeread.c,24 :: 		if (!portb.rb0){  delay_ms(200);TMR0= 61; ; tmr0ie_bit=1; tmr0if_bit=0; while(!portb.rb0){inttostr(press_time,press),lcd_out(2,1,press);}; tmr0ie_bit=0; ;    // start timer and stay here until button is pressed
	BTFSC      PORTB+0, 0
	GOTO       L_main3
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
	MOVLW      61
	MOVWF      TMR0+0
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
L_main5:
	BTFSC      PORTB+0, 0
	GOTO       L_main6
	MOVF       _press_time+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _press_time+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _press+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _press+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main5
L_main6:
	BCF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;buttontimeread.c,25 :: 		if (  press_time<1000) {lcd_out(1,1,"Mode1"); led1=1;led2=0; delay_ms(1000); led1=0;led2=0;}   // mode 1
	MOVLW      128
	XORWF      _press_time+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      232
	SUBWF      _press_time+0, 0
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_buttontimeread+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main9
L_main7:
;buttontimeread.c,26 :: 		else if (press_time>1000 && press_time<2000) {lcd_out(1,1,"Mode2");led1=0; led2=1; delay_ms(2000); led1=0;led2=0;}  // mode 2
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _press_time+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVF       _press_time+0, 0
	SUBLW      232
L__main30:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
	MOVLW      128
	XORWF      _press_time+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      7
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      208
	SUBWF      _press_time+0, 0
L__main31:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
L__main25:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_buttontimeread+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main14
L_main12:
;buttontimeread.c,27 :: 		else if (press_time>2000 && press_time<3000) {lcd_out(1,1,"Mode3");led1=1; led2=1; delay_ms(3000); led1=0; led2=0;}   // mode 3
	MOVLW      128
	XORLW      7
	MOVWF      R0+0
	MOVLW      128
	XORWF      _press_time+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVF       _press_time+0, 0
	SUBLW      208
L__main32:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
	MOVLW      128
	XORWF      _press_time+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      11
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      184
	SUBWF      _press_time+0, 0
L__main33:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
L__main24:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_buttontimeread+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
	MOVLW      39
	MOVWF      R11+0
	MOVLW      13
	MOVWF      R12+0
	MOVLW      38
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main19
L_main17:
;buttontimeread.c,28 :: 		else  {lcd_out(1,1,"Invalid press");led1=1; delay_ms(300); led1=0;delay_ms(200); led1=1 ;delay_ms(300); led1=0; delay_ms(200);} // Invalid press
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_buttontimeread+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
	MOVLW      4
	MOVWF      R11+0
	MOVLW      207
	MOVWF      R12+0
	MOVLW      1
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main23:
	DECFSZ     R13+0, 1
	GOTO       L_main23
	DECFSZ     R12+0, 1
	GOTO       L_main23
	DECFSZ     R11+0, 1
	GOTO       L_main23
	NOP
	NOP
L_main19:
L_main14:
L_main9:
;buttontimeread.c,30 :: 		}
L_main3:
;buttontimeread.c,31 :: 		press_time=0;
	CLRF       _press_time+0
	CLRF       _press_time+1
;buttontimeread.c,33 :: 		}
	GOTO       L_main1
;buttontimeread.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
