
_main:

;BTinterface.c,20 :: 		void main() {
;BTinterface.c,21 :: 		TRISB=0;
	CLRF       TRISB+0
;BTinterface.c,22 :: 		trisb.rb0=0;
	BCF        TRISB+0, 0
;BTinterface.c,23 :: 		Lcd_Init(); // Initialize LCD
	CALL       _Lcd_Init+0
;BTinterface.c,24 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;BTinterface.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;BTinterface.c,26 :: 		Lcd_Out(1,1,"check");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_BTinterface+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;BTinterface.c,27 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;BTinterface.c,29 :: 		error = Soft_UART_Init(&PORTB, 6, 7, 9600, 0);
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
;BTinterface.c,31 :: 		if (error > 0) {
	MOVF       R0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;BTinterface.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;BTinterface.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;BTinterface.c,34 :: 		Lcd_Out(1,1,"Error");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_BTinterface+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;BTinterface.c,35 :: 		while(1) ;
L_main2:
	GOTO       L_main2
;BTinterface.c,36 :: 		}
L_main1:
;BTinterface.c,37 :: 		Delay_ms(100);
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
;BTinterface.c,39 :: 		while(1) {
L_main5:
;BTinterface.c,40 :: 		if ((i>16) && (j==1))
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVF       _i+0, 0
	SUBLW      16
L__main25:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
	MOVLW      0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      1
	XORWF      _j+0, 0
L__main26:
	BTFSS      STATUS+0, 2
	GOTO       L_main9
L__main23:
;BTinterface.c,41 :: 		{i=1;
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;BTinterface.c,42 :: 		j=2;}
	MOVLW      2
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
	GOTO       L_main10
L_main9:
;BTinterface.c,43 :: 		else if ((i>16) && (j==2))
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVF       _i+0, 0
	SUBLW      16
L__main27:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
	MOVLW      0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      2
	XORWF      _j+0, 0
L__main28:
	BTFSS      STATUS+0, 2
	GOTO       L_main13
L__main22:
;BTinterface.c,45 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;BTinterface.c,46 :: 		i=1;
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
;BTinterface.c,47 :: 		j=1;
	MOVLW      1
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
;BTinterface.c,48 :: 		}
L_main13:
L_main10:
;BTinterface.c,50 :: 		byte_read = Soft_UART_Read(&error)  ;
	MOVLW      _error+0
	MOVWF      FARG_Soft_UART_Read_error+0
	CALL       _Soft_UART_Read+0
	MOVF       R0+0, 0
	MOVWF      _byte_read+0
;BTinterface.c,51 :: 		if (error)   Lcd_Out(1,1,"Error");
	MOVF       _error+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_BTinterface+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main15
L_main14:
;BTinterface.c,53 :: 		Lcd_chr(j,i, byte_read);
	MOVF       _j+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _byte_read+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;BTinterface.c,54 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
;BTinterface.c,55 :: 		Soft_UART_Write(byte_read);
	MOVF       _byte_read+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;BTinterface.c,56 :: 		if (byte_read=='1')
	MOVF       _byte_read+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;BTinterface.c,57 :: 		{portb.rb0=1;
	BSF        PORTB+0, 0
;BTinterface.c,58 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;BTinterface.c,59 :: 		lcd_out(1,1,"Led on") ;
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_BTinterface+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;BTinterface.c,60 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
;BTinterface.c,61 :: 		}
	GOTO       L_main19
L_main17:
;BTinterface.c,62 :: 		else if (byte_read=='0') {
	MOVF       _byte_read+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;BTinterface.c,64 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;BTinterface.c,65 :: 		lcd_out(1,1,"Led off");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_BTinterface+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;BTinterface.c,66 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
;BTinterface.c,67 :: 		portb.rb0=0;
	BCF        PORTB+0, 0
;BTinterface.c,69 :: 		}
L_main20:
L_main19:
;BTinterface.c,70 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;BTinterface.c,71 :: 		}
L_main15:
;BTinterface.c,73 :: 		}
	GOTO       L_main5
;BTinterface.c,74 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
