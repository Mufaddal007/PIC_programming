
_main:

;usartwithuno.c,3 :: 		void main()
;usartwithuno.c,5 :: 		UART1_init(9600);  //initializing USART module with 9600 baud rate
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;usartwithuno.c,6 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;usartwithuno.c,7 :: 		while(1){
L_main1:
;usartwithuno.c,8 :: 		p1=test;
	MOVLW      _test+0
	MOVWF      _p1+0
;usartwithuno.c,9 :: 		while(*p1){UART1_Write(*p1);   p1++ ; } // writing character one by one on serial transmitter  pin
L_main3:
	MOVF       _p1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVF       _p1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
	INCF       _p1+0, 1
	GOTO       L_main3
L_main4:
;usartwithuno.c,10 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;usartwithuno.c,11 :: 		}
	GOTO       L_main1
;usartwithuno.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
