
_passchk:

;mod.c,22 :: 		void passchk()
;mod.c,23 :: 		{   lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mod.c,24 :: 		lcd_out(1,1,"PW?");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mod.c,25 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_passchk0:
	DECFSZ     R13+0, 1
	GOTO       L_passchk0
	DECFSZ     R12+0, 1
	GOTO       L_passchk0
	DECFSZ     R11+0, 1
	GOTO       L_passchk0
	NOP
	NOP
;mod.c,26 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mod.c,27 :: 		for ( i=0;i<5;i++)
	CLRF       _i+0
	CLRF       _i+1
L_passchk1:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__passchk44
	MOVLW      5
	SUBWF      _i+0, 0
L__passchk44:
	BTFSC      STATUS+0, 0
	GOTO       L_passchk2
;mod.c,29 :: 		rd1=soft_uart_read(&error) ;
	MOVLW      _error+0
	MOVWF      FARG_Soft_UART_Read_error+0
	CALL       _Soft_UART_Read+0
	MOVF       R0+0, 0
	MOVWF      _rd1+0
;mod.c,30 :: 		if (error)  lcd_out(1,1,"E1");
	MOVF       _error+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_passchk4
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_passchk5
L_passchk4:
;mod.c,31 :: 		else if (rd1==pass[i]) k++;
	MOVF       _i+0, 0
	ADDLW      _pass+0
	MOVWF      FSR
	MOVF       _rd1+0, 0
	XORWF      INDF+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_passchk6
	INCF       _k+0, 1
	BTFSC      STATUS+0, 2
	INCF       _k+1, 1
L_passchk6:
L_passchk5:
;mod.c,27 :: 		for ( i=0;i<5;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;mod.c,32 :: 		}
	GOTO       L_passchk1
L_passchk2:
;mod.c,34 :: 		if (k==5) lcd_out(1,1,"T");
	MOVLW      0
	XORWF      _k+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__passchk45
	MOVLW      5
	XORWF      _k+0, 0
L__passchk45:
	BTFSS      STATUS+0, 2
	GOTO       L_passchk7
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_passchk8
L_passchk7:
;mod.c,35 :: 		else lcd_out(1,1,"F");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_passchk8:
;mod.c,37 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_passchk9:
	DECFSZ     R13+0, 1
	GOTO       L_passchk9
	DECFSZ     R12+0, 1
	GOTO       L_passchk9
	DECFSZ     R11+0, 1
	GOTO       L_passchk9
	NOP
;mod.c,39 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mod.c,40 :: 		}
L_end_passchk:
	RETURN
; end of _passchk

_switchcontrol:

;mod.c,42 :: 		void switchcontrol()
;mod.c,44 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mod.c,45 :: 		lcd_out(1,1,"Sw");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mod.c,46 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_switchcontrol10:
	DECFSZ     R13+0, 1
	GOTO       L_switchcontrol10
	DECFSZ     R12+0, 1
	GOTO       L_switchcontrol10
	DECFSZ     R11+0, 1
	GOTO       L_switchcontrol10
	NOP
	NOP
;mod.c,47 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mod.c,48 :: 		do
L_switchcontrol11:
;mod.c,50 :: 		rd1=soft_uart_read(&error) ;
	MOVLW      _error+0
	MOVWF      FARG_Soft_UART_Read_error+0
	CALL       _Soft_UART_Read+0
	MOVF       R0+0, 0
	MOVWF      _rd1+0
;mod.c,51 :: 		if (error) lcd_out(1,1,"E1");
	MOVF       _error+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_switchcontrol14
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_switchcontrol15
L_switchcontrol14:
;mod.c,53 :: 		if (rd1=='1'){ portb.rb0=1;
	MOVF       _rd1+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_switchcontrol16
	BSF        PORTB+0, 0
;mod.c,54 :: 		lcd_out(1,1,"T");}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_switchcontrol17
L_switchcontrol16:
;mod.c,56 :: 		else if (rd1=='2') {portb.rb0=0;
	MOVF       _rd1+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_switchcontrol18
	BCF        PORTB+0, 0
;mod.c,57 :: 		lcd_out(1,1,"t");}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_switchcontrol19
L_switchcontrol18:
;mod.c,59 :: 		else if (rd1=='3') {portb.rb1=1;
	MOVF       _rd1+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_switchcontrol20
	BSF        PORTB+0, 1
;mod.c,60 :: 		lcd_out(1,1,"F");}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_switchcontrol21
L_switchcontrol20:
;mod.c,62 :: 		else if (rd1=='4') {portb.rb1=0;
	MOVF       _rd1+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_switchcontrol22
	BCF        PORTB+0, 1
;mod.c,63 :: 		lcd_out(1,1,"f");}
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_switchcontrol22:
L_switchcontrol21:
L_switchcontrol19:
L_switchcontrol17:
;mod.c,64 :: 		}
L_switchcontrol15:
;mod.c,65 :: 		}while(rd1!= 'X');
	MOVF       _rd1+0, 0
	XORLW      88
	BTFSS      STATUS+0, 2
	GOTO       L_switchcontrol11
;mod.c,66 :: 		}
L_end_switchcontrol:
	RETURN
; end of _switchcontrol

_charout:

;mod.c,67 :: 		void charout()
;mod.c,69 :: 		for(i=0;i<10;i++)
	CLRF       _i+0
	CLRF       _i+1
L_charout23:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__charout48
	MOVLW      10
	SUBWF      _i+0, 0
L__charout48:
	BTFSC      STATUS+0, 0
	GOTO       L_charout24
;mod.c,71 :: 		rd1=soft_uart_read(&error);
	MOVLW      _error+0
	MOVWF      FARG_Soft_UART_Read_error+0
	CALL       _Soft_UART_Read+0
	MOVF       R0+0, 0
	MOVWF      _rd1+0
;mod.c,72 :: 		if (error) lcd_out(1,1,"E1");
	MOVF       _error+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_charout26
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_charout27
L_charout26:
;mod.c,73 :: 		else lcd_out(1,(i+1), rd1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _rd1+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_charout27:
;mod.c,69 :: 		for(i=0;i<10;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;mod.c,74 :: 		}
	GOTO       L_charout23
L_charout24:
;mod.c,75 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_charout28:
	DECFSZ     R13+0, 1
	GOTO       L_charout28
	DECFSZ     R12+0, 1
	GOTO       L_charout28
	DECFSZ     R11+0, 1
	GOTO       L_charout28
	NOP
;mod.c,76 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mod.c,77 :: 		}
L_end_charout:
	RETURN
; end of _charout

_mod:

;mod.c,78 :: 		void mod(char in)
;mod.c,80 :: 		switch(in)
	GOTO       L_mod29
;mod.c,82 :: 		case 'A':  passchk();
L_mod31:
	CALL       _passchk+0
;mod.c,83 :: 		case 'B' : charout();
L_mod32:
	CALL       _charout+0
;mod.c,84 :: 		case 'C':  switchcontrol();
L_mod33:
	CALL       _switchcontrol+0
;mod.c,86 :: 		}
	GOTO       L_mod30
L_mod29:
	MOVF       FARG_mod_in+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_mod31
	MOVF       FARG_mod_in+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_mod32
	MOVF       FARG_mod_in+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_mod33
L_mod30:
;mod.c,87 :: 		}
L_end_mod:
	RETURN
; end of _mod

_main:

;mod.c,88 :: 		void main() {
;mod.c,90 :: 		trisc=0;
	CLRF       TRISC+0
;mod.c,91 :: 		trisb=0;
	CLRF       TRISB+0
;mod.c,93 :: 		lcd_init();
	CALL       _Lcd_Init+0
;mod.c,94 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mod.c,95 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mod.c,98 :: 		error=soft_uart_init(&portb, 6,7,9600, 0);
	MOVLW      PORTB+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      6
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	MOVLW      7
	MOVWF      FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
	MOVF       R0+0, 0
	MOVWF      _error+0
;mod.c,99 :: 		if (error>0)
	MOVF       R0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main34
;mod.c,101 :: 		lcd_out(1,1,"E");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mod.c,102 :: 		while(1);
L_main35:
	GOTO       L_main35
;mod.c,103 :: 		}
L_main34:
;mod.c,104 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	DECFSZ     R11+0, 1
	GOTO       L_main37
	NOP
	NOP
;mod.c,106 :: 		while(1){
L_main38:
;mod.c,107 :: 		lcd_out(1,1,"Mod?");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mod.c,108 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
;mod.c,109 :: 		rd1=soft_uart_read(&error);
	MOVLW      _error+0
	MOVWF      FARG_Soft_UART_Read_error+0
	CALL       _Soft_UART_Read+0
	MOVF       R0+0, 0
	MOVWF      _rd1+0
;mod.c,110 :: 		if (error) lcd_out(1,1,"E1");
	MOVF       _error+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main41
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_mod+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main42
L_main41:
;mod.c,111 :: 		else   mod(rd1);
	MOVF       _rd1+0, 0
	MOVWF      FARG_mod_in+0
	CALL       _mod+0
L_main42:
;mod.c,112 :: 		}
	GOTO       L_main38
;mod.c,113 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
