
_main:

;Btpassword.c,23 :: 		void main() {
;Btpassword.c,25 :: 		trisc=0;
	CLRF       TRISC+0
;Btpassword.c,26 :: 		trisb=0;
	CLRF       TRISB+0
;Btpassword.c,28 :: 		lcd_init();
	CALL       _Lcd_Init+0
;Btpassword.c,29 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Btpassword.c,30 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Btpassword.c,33 :: 		error=soft_uart_init(&portb, 6,7,9600, 0);
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
;Btpassword.c,34 :: 		if (error>0)
	MOVF       R0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main0
;Btpassword.c,36 :: 		lcd_out(1,1,"Error");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Btpassword+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Btpassword.c,37 :: 		while(1);
L_main1:
	GOTO       L_main1
;Btpassword.c,38 :: 		}
L_main0:
;Btpassword.c,39 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Btpassword.c,41 :: 		for(i=0;i<5;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main4:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      5
	SUBWF      _i+0, 0
L__main15:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;Btpassword.c,43 :: 		rd1=soft_uart_read(&error);
	MOVLW      _error+0
	MOVWF      FARG_Soft_UART_Read_error+0
	CALL       _Soft_UART_Read+0
	MOVF       R0+0, 0
	MOVWF      _rd1+0
;Btpassword.c,45 :: 		if (error)
	MOVF       _error+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;Btpassword.c,47 :: 		lcd_out(1,1,"Error1");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Btpassword+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Btpassword.c,48 :: 		}
	GOTO       L_main8
L_main7:
;Btpassword.c,50 :: 		soft_uart_write(rd1);
	MOVF       _rd1+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;Btpassword.c,51 :: 		read[i]=rd1;
	MOVF       _i+0, 0
	ADDLW      _read+0
	MOVWF      FSR
	MOVF       _rd1+0, 0
	MOVWF      INDF+0
;Btpassword.c,52 :: 		if (read[i]==pass[i]) k++;
	MOVF       _i+0, 0
	ADDLW      _read+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       _i+0, 0
	ADDLW      _pass+0
	MOVWF      FSR
	MOVF       R1+0, 0
	XORWF      INDF+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main9
	INCF       _k+0, 1
	BTFSC      STATUS+0, 2
	INCF       _k+1, 1
L_main9:
;Btpassword.c,53 :: 		lcd_chr(1,(i+1),rd1);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _rd1+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Btpassword.c,55 :: 		}
L_main8:
;Btpassword.c,41 :: 		for(i=0;i<5;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Btpassword.c,57 :: 		}
	GOTO       L_main4
L_main5:
;Btpassword.c,58 :: 		if (k==5) chk1=1;
	MOVLW      0
	XORWF      _k+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      5
	XORWF      _k+0, 0
L__main16:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	MOVLW      1
	MOVWF      _chk1+0
	MOVLW      0
	MOVWF      _chk1+1
L_main10:
;Btpassword.c,59 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Btpassword.c,60 :: 		lcd_out(1,1,"Pass is :");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Btpassword+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Btpassword.c,61 :: 		lcd_out(1,10,pass);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _pass+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Btpassword.c,62 :: 		lcd_out(2,1,"Read is:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Btpassword+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Btpassword.c,63 :: 		lcd_out(2,10,read);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _read+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Btpassword.c,64 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;Btpassword.c,65 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Btpassword.c,66 :: 		if(chk1 )
	MOVF       _chk1+0, 0
	IORWF      _chk1+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;Btpassword.c,68 :: 		lcd_out(1,1,"Unlocked");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Btpassword+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Btpassword.c,69 :: 		}
	GOTO       L_main13
L_main12:
;Btpassword.c,72 :: 		lcd_out(1,1,"failed");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Btpassword+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Btpassword.c,73 :: 		}
L_main13:
;Btpassword.c,76 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
