
_setup:

;timer0module.c,17 :: 		void setup()
;timer0module.c,18 :: 		{  state=value=i=j=0;
	CLRF       _j+0
	CLRF       _i+0
	CLRF       _value+0
	BCF        _state+0, BitPos(_state+0)
;timer0module.c,19 :: 		trisc=0;
	CLRF       TRISC+0
;timer0module.c,20 :: 		lcd_init();
	CALL       _Lcd_Init+0
;timer0module.c,21 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;timer0module.c,23 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;timer0module.c,24 :: 		OPTION_REG  = 0x87;
	MOVLW      135
	MOVWF      OPTION_REG+0
;timer0module.c,25 :: 		INTCON  = 0xF0;
	MOVLW      240
	MOVWF      INTCON+0
;timer0module.c,27 :: 		}
L_end_setup:
	RETURN
; end of _setup

_init:

;timer0module.c,28 :: 		void init()
;timer0module.c,30 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;timer0module.c,31 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;timer0module.c,32 :: 		TMR0 = 61;
	MOVLW      61
	MOVWF      TMR0+0
;timer0module.c,33 :: 		state=value=i=j;
	MOVF       _j+0, 0
	MOVWF      _i+0
	MOVF       _j+0, 0
	MOVWF      _value+0
	BTFSC      _j+0, 0
	GOTO       L__init12
	BCF        _state+0, BitPos(_state+0)
	GOTO       L__init13
L__init12:
	BSF        _state+0, BitPos(_state+0)
L__init13:
;timer0module.c,34 :: 		}
L_end_init:
	RETURN
; end of _init

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;timer0module.c,35 :: 		void Interrupt()
;timer0module.c,37 :: 		if (TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrupt0
;timer0module.c,38 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;timer0module.c,39 :: 		TMR0 = 61;
	MOVLW      61
	MOVWF      TMR0+0
;timer0module.c,40 :: 		value++;
	INCF       _value+0, 1
;timer0module.c,41 :: 		if (value==20)
	MOVF       _value+0, 0
	XORLW      20
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt1
;timer0module.c,42 :: 		{ i++; value=0;
	INCF       _i+0, 1
	CLRF       _value+0
;timer0module.c,43 :: 		if (i==59){j++; i=0;}
	MOVF       _i+0, 0
	XORLW      59
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt2
	INCF       _j+0, 1
	CLRF       _i+0
L_Interrupt2:
;timer0module.c,44 :: 		}
L_Interrupt1:
;timer0module.c,45 :: 		}
L_Interrupt0:
;timer0module.c,46 :: 		}
L_end_Interrupt:
L__Interrupt15:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;timer0module.c,48 :: 		void main() {
;timer0module.c,49 :: 		setup();
	CALL       _setup+0
;timer0module.c,51 :: 		while(1)
L_main3:
;timer0module.c,53 :: 		while(~intf_bit){lcd_out(1,1,"Welcome");}
L_main5:
	BTFSC      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L__main17
	BSF        3, 0
	GOTO       L__main18
L__main17:
	BCF        3, 0
L__main18:
	BTFSS      3, 0
	GOTO       L_main6
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_timer0module+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main5
L_main6:
;timer0module.c,54 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
;timer0module.c,55 :: 		init();
	CALL       _init+0
;timer0module.c,56 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;timer0module.c,57 :: 		lcd_out(1,1,"Stop watch: ")  ;
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_timer0module+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;timer0module.c,58 :: 		while(~intf_bit){
L_main8:
	BTFSC      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L__main19
	BSF        3, 0
	GOTO       L__main20
L__main19:
	BCF        3, 0
L__main20:
	BTFSS      3, 0
	GOTO       L_main9
;timer0module.c,59 :: 		shorttostr(j,mins);
	MOVF       _j+0, 0
	MOVWF      FARG_ShortToStr_input+0
	MOVLW      _mins+0
	MOVWF      FARG_ShortToStr_output+0
	CALL       _ShortToStr+0
;timer0module.c,60 :: 		shorttostr(i,secs);
	MOVF       _i+0, 0
	MOVWF      FARG_ShortToStr_input+0
	MOVLW      _secs+0
	MOVWF      FARG_ShortToStr_output+0
	CALL       _ShortToStr+0
;timer0module.c,61 :: 		lcd_out(2,1,mins);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _mins+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;timer0module.c,62 :: 		lcd_out(2,5,":");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_timer0module+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;timer0module.c,63 :: 		lcd_out(2,7,secs);}
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _secs+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main8
L_main9:
;timer0module.c,64 :: 		intf_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;timer0module.c,65 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;timer0module.c,67 :: 		}
	GOTO       L_main3
;timer0module.c,68 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
