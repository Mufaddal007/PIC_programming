
_main:

;btinterfacing.c,18 :: 		void main() {
;btinterfacing.c,19 :: 		TRISB=0;
	CLRF       TRISB+0
;btinterfacing.c,21 :: 		Lcd_Init(); // Initialize LCD
	CALL       _Lcd_Init+0
;btinterfacing.c,22 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;btinterfacing.c,23 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;btinterfacing.c,24 :: 		Lcd_Out(1,1,"check");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_btinterfacing+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;btinterfacing.c,26 :: 		delay_ms(2000);
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
;btinterfacing.c,29 :: 		error = Soft_UART_Init(&PORTB, 7, 6, 9600, 0);
	MOVLW      PORTB+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      7
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	MOVLW      6
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
;btinterfacing.c,31 :: 		if (error > 0) {
	MOVF       R0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;btinterfacing.c,32 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;btinterfacing.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;btinterfacing.c,34 :: 		Lcd_Out(1,1,"Error");              // Signalize Init error
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_btinterfacing+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;btinterfacing.c,35 :: 		while(1) ;                            // Stop program
L_main2:
	GOTO       L_main2
;btinterfacing.c,36 :: 		}
L_main1:
;btinterfacing.c,37 :: 		Delay_ms(100);
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
;btinterfacing.c,39 :: 		while(1) {                              // Endless loop
L_main5:
;btinterfacing.c,40 :: 		byte_read[i] = Soft_UART_Read(&error);   // Read byte, then test error flag
	MOVF       _i+0, 0
	ADDLW      _byte_read+0
	MOVWF      FLOC__main+0
	MOVLW      _error+0
	MOVWF      FARG_Soft_UART_Read_error+0
	CALL       _Soft_UART_Read+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;btinterfacing.c,41 :: 		if (error){                            // If error was detected
	MOVF       _error+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;btinterfacing.c,43 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;btinterfacing.c,44 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;btinterfacing.c,45 :: 		Lcd_Out(1,1,"Error");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_btinterfacing+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;btinterfacing.c,46 :: 		}
	GOTO       L_main8
L_main7:
;btinterfacing.c,48 :: 		Lcd_Cmd(_LCD_CLEAR); // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;btinterfacing.c,49 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;btinterfacing.c,50 :: 		Lcd_Out(1,1,byte_read);     // If error was not detected, return byte read
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _byte_read+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;btinterfacing.c,51 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;btinterfacing.c,52 :: 		}   i++;
L_main8:
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;btinterfacing.c,53 :: 		}
	GOTO       L_main5
;btinterfacing.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
