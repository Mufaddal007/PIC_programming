
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;ir.c,24 :: 		void Interrupt() {
;ir.c,25 :: 		if (RBIF_bit && (PORTB.F0 || !PORTB.F0)){         // PORTB change ISR
	BTFSS      RBIF_bit+0, BitPos(RBIF_bit+0)
	GOTO       L_Interrupt4
	BTFSC      PORTB+0, 0
	GOTO       L__Interrupt44
	BTFSS      PORTB+0, 0
	GOTO       L__Interrupt44
	GOTO       L_Interrupt4
L__Interrupt44:
L__Interrupt43:
;ir.c,26 :: 		RBIF_bit = 0;
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;ir.c,27 :: 		if(rc5_state != 0){
	MOVF       _rc5_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt5
;ir.c,28 :: 		timer_value = (TMR1H << 8) + TMR1L;           // Store Timer1 value
	MOVF       TMR1H+0, 0
	MOVWF      _timer_value+1
	CLRF       _timer_value+0
	MOVF       TMR1L+0, 0
	ADDWF      _timer_value+0, 1
	BTFSC      STATUS+0, 0
	INCF       _timer_value+1, 1
;ir.c,29 :: 		TMR1H = 0;                                    // Reset Timer1
	CLRF       TMR1H+0
;ir.c,30 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;ir.c,31 :: 		}
L_Interrupt5:
;ir.c,32 :: 		switch(rc5_state){
	GOTO       L_Interrupt6
;ir.c,33 :: 		case 0 :                                       // Start receiving IR data (initially we're at the beginning of mid1)
L_Interrupt8:
;ir.c,34 :: 		TMR1H = 0;                                   // Reset Timer1
	CLRF       TMR1H+0
;ir.c,35 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;ir.c,36 :: 		TMR1ON_bit = 1;                              // Enable Timer1
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ir.c,37 :: 		rc5_state = 1;                               // Next state: end of mid1
	MOVLW      1
	MOVWF      _rc5_state+0
;ir.c,38 :: 		i = 0;
	CLRF       _i+0
;ir.c,39 :: 		break;
	GOTO       L_Interrupt7
;ir.c,40 :: 		case 1 :                                       // End of mid1 ==> check if we're at the beginning of start1 or mid0
L_Interrupt9:
;ir.c,41 :: 		if((timer_value > long_time) || (timer_value < short_time)){         // Invalid interval ==> stop decoding and reset
	MOVF       _timer_value+1, 0
	SUBLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt47
	MOVF       _timer_value+0, 0
	SUBLW      208
L__Interrupt47:
	BTFSS      STATUS+0, 0
	GOTO       L__Interrupt42
	MOVLW      2
	SUBWF      _timer_value+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt48
	MOVLW      188
	SUBWF      _timer_value+0, 0
L__Interrupt48:
	BTFSS      STATUS+0, 0
	GOTO       L__Interrupt42
	GOTO       L_Interrupt12
L__Interrupt42:
;ir.c,42 :: 		rc5_state = 0;                             // Reset decoding process
	CLRF       _rc5_state+0
;ir.c,43 :: 		TMR1ON_bit = 0;                            // Disable Timer1
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ir.c,44 :: 		break;
	GOTO       L_Interrupt7
;ir.c,45 :: 		}
L_Interrupt12:
;ir.c,46 :: 		rc5_code |= 1 << (13 - i);                   // Set bit (13 - i)
	MOVF       _i+0, 0
	SUBLW      13
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__Interrupt49:
	BTFSC      STATUS+0, 2
	GOTO       L__Interrupt50
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__Interrupt49
L__Interrupt50:
	MOVF       R0+0, 0
	IORWF      _rc5_code+0, 1
	MOVF       R0+1, 0
	IORWF      _rc5_code+1, 1
;ir.c,47 :: 		i++;
	INCF       _i+0, 1
;ir.c,48 :: 		if(i > 13){                                  // If all bits are received
	MOVF       _i+0, 0
	SUBLW      13
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt13
;ir.c,49 :: 		rc5_ok = 1;                                // Decoding process is OK
	BSF        _rc5_ok+0, BitPos(_rc5_ok+0)
;ir.c,50 :: 		RBIE_bit = 0;                              // Disable PORTB change interrupt
	BCF        RBIE_bit+0, BitPos(RBIE_bit+0)
;ir.c,51 :: 		break;
	GOTO       L_Interrupt7
;ir.c,52 :: 		}
L_Interrupt13:
;ir.c,53 :: 		if(timer_value > med_time){                  // We're at the beginning of mid0
	MOVF       _timer_value+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt51
	MOVF       _timer_value+0, 0
	SUBLW      176
L__Interrupt51:
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt14
;ir.c,54 :: 		rc5_state = 2;                             // Next state: end of mid0
	MOVLW      2
	MOVWF      _rc5_state+0
;ir.c,55 :: 		if(i == 13){                               // If we're at the LSB bit
	MOVF       _i+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt15
;ir.c,56 :: 		rc5_ok = 1;                              // Decoding process is OK
	BSF        _rc5_ok+0, BitPos(_rc5_ok+0)
;ir.c,57 :: 		rc5_code &= ~1;                          // Clear the LSB bit
	BCF        _rc5_code+0, 0
;ir.c,58 :: 		RBIE_bit = 0;                            // Disable PORTB change interrupt
	BCF        RBIE_bit+0, BitPos(RBIE_bit+0)
;ir.c,59 :: 		break;
	GOTO       L_Interrupt7
;ir.c,60 :: 		}
L_Interrupt15:
;ir.c,61 :: 		}
	GOTO       L_Interrupt16
L_Interrupt14:
;ir.c,63 :: 		rc5_state = 3;                             // Next state: end of start1
	MOVLW      3
	MOVWF      _rc5_state+0
L_Interrupt16:
;ir.c,64 :: 		break;
	GOTO       L_Interrupt7
;ir.c,65 :: 		case 2 :                                       // End of mid0 ==> check if we're at the beginning of start0 or mid1
L_Interrupt17:
;ir.c,66 :: 		if((timer_value > long_time) || (timer_value < short_time)){
	MOVF       _timer_value+1, 0
	SUBLW      7
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt52
	MOVF       _timer_value+0, 0
	SUBLW      208
L__Interrupt52:
	BTFSS      STATUS+0, 0
	GOTO       L__Interrupt41
	MOVLW      2
	SUBWF      _timer_value+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt53
	MOVLW      188
	SUBWF      _timer_value+0, 0
L__Interrupt53:
	BTFSS      STATUS+0, 0
	GOTO       L__Interrupt41
	GOTO       L_Interrupt20
L__Interrupt41:
;ir.c,67 :: 		rc5_state = 0;                             // Reset decoding process
	CLRF       _rc5_state+0
;ir.c,68 :: 		TMR1ON_bit = 0;                            // Disable Timer1
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ir.c,69 :: 		break;
	GOTO       L_Interrupt7
;ir.c,70 :: 		}
L_Interrupt20:
;ir.c,71 :: 		rc5_code &= ~(1 << (13 - i));                // Clear (13 - i)
	MOVF       _i+0, 0
	SUBLW      13
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__Interrupt54:
	BTFSC      STATUS+0, 2
	GOTO       L__Interrupt55
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__Interrupt54
L__Interrupt55:
	COMF       R0+0, 1
	COMF       R0+1, 1
	MOVF       R0+0, 0
	ANDWF      _rc5_code+0, 1
	MOVF       R0+1, 0
	ANDWF      _rc5_code+1, 1
;ir.c,72 :: 		i++;
	INCF       _i+0, 1
;ir.c,73 :: 		if(timer_value > med_time)                   // We're at the beginning of mid1
	MOVF       _timer_value+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt56
	MOVF       _timer_value+0, 0
	SUBLW      176
L__Interrupt56:
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt21
;ir.c,74 :: 		rc5_state = 1;                             // Next state: end of mid1
	MOVLW      1
	MOVWF      _rc5_state+0
	GOTO       L_Interrupt22
L_Interrupt21:
;ir.c,76 :: 		rc5_state = 4;                             // Next state: end of start0
	MOVLW      4
	MOVWF      _rc5_state+0
L_Interrupt22:
;ir.c,77 :: 		break;
	GOTO       L_Interrupt7
;ir.c,78 :: 		case 3 :                                       // End of start1 ==> check if we're at the beginning of mid1
L_Interrupt23:
;ir.c,79 :: 		if((timer_value > med_time) || (timer_value < short_time)){           // Time interval invalid ==> stop decoding
	MOVF       _timer_value+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt57
	MOVF       _timer_value+0, 0
	SUBLW      176
L__Interrupt57:
	BTFSS      STATUS+0, 0
	GOTO       L__Interrupt40
	MOVLW      2
	SUBWF      _timer_value+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt58
	MOVLW      188
	SUBWF      _timer_value+0, 0
L__Interrupt58:
	BTFSS      STATUS+0, 0
	GOTO       L__Interrupt40
	GOTO       L_Interrupt26
L__Interrupt40:
;ir.c,80 :: 		TMR1ON_bit = 0;                            // Disable Timer1
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ir.c,81 :: 		rc5_state = 0;                             // Reset decoding process
	CLRF       _rc5_state+0
;ir.c,82 :: 		break;
	GOTO       L_Interrupt7
;ir.c,83 :: 		}
L_Interrupt26:
;ir.c,85 :: 		rc5_state = 1;                             // Next state: end of mid1
	MOVLW      1
	MOVWF      _rc5_state+0
;ir.c,86 :: 		break;
	GOTO       L_Interrupt7
;ir.c,87 :: 		case 4 :                                       // End of start0 ==> check if we're at the beginning of mid0
L_Interrupt28:
;ir.c,88 :: 		if((timer_value > med_time) || (timer_value < short_time)){           // Time interval invalid ==> stop decoding
	MOVF       _timer_value+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt59
	MOVF       _timer_value+0, 0
	SUBLW      176
L__Interrupt59:
	BTFSS      STATUS+0, 0
	GOTO       L__Interrupt39
	MOVLW      2
	SUBWF      _timer_value+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt60
	MOVLW      188
	SUBWF      _timer_value+0, 0
L__Interrupt60:
	BTFSS      STATUS+0, 0
	GOTO       L__Interrupt39
	GOTO       L_Interrupt31
L__Interrupt39:
;ir.c,89 :: 		TMR1ON_bit = 0;                            // Disable Timer1
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ir.c,90 :: 		rc5_state = 0;                             // Reset decoding process
	CLRF       _rc5_state+0
;ir.c,91 :: 		break;
	GOTO       L_Interrupt7
;ir.c,92 :: 		}
L_Interrupt31:
;ir.c,94 :: 		rc5_state = 2;                             // Next state: end of mid0
	MOVLW      2
	MOVWF      _rc5_state+0
;ir.c,95 :: 		if(i == 13){                                 // If we're at the LSB bit
	MOVF       _i+0, 0
	XORLW      13
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt33
;ir.c,96 :: 		rc5_ok = 1;                                // Decoding process is OK
	BSF        _rc5_ok+0, BitPos(_rc5_ok+0)
;ir.c,97 :: 		rc5_code &= ~1;                            // Clear the LSB bit
	BCF        _rc5_code+0, 0
;ir.c,98 :: 		RBIE_bit = 0;                              // Disable PORTB change interrupt
	BCF        RBIE_bit+0, BitPos(RBIE_bit+0)
;ir.c,99 :: 		}
L_Interrupt33:
;ir.c,100 :: 		}
	GOTO       L_Interrupt7
L_Interrupt6:
	MOVF       _rc5_state+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt8
	MOVF       _rc5_state+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt9
	MOVF       _rc5_state+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt17
	MOVF       _rc5_state+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt23
	MOVF       _rc5_state+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Interrupt28
L_Interrupt7:
;ir.c,101 :: 		}
L_Interrupt4:
;ir.c,102 :: 		if (TMR1IF_bit){                 // Timer1 ISR
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt34
;ir.c,103 :: 		TMR1IF_bit = 0;                // Clear Timer1 overflow flag bit
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;ir.c,104 :: 		rc5_state = 0;                 // Reset decoding process
	CLRF       _rc5_state+0
;ir.c,105 :: 		TMR1ON_bit = 0;                // Disable Timer1
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ir.c,106 :: 		}
L_Interrupt34:
;ir.c,107 :: 		}
L_end_Interrupt:
L__Interrupt46:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;ir.c,109 :: 		void main() {
;ir.c,111 :: 		rc5_ok = 0;
	BCF        _rc5_ok+0, BitPos(_rc5_ok+0)
;ir.c,112 :: 		rc5_state = 0;
	CLRF       _rc5_state+0
;ir.c,114 :: 		Lcd_Init();                      // Initialize LCD module
	CALL       _Lcd_Init+0
;ir.c,115 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ir.c,116 :: 		Lcd_Cmd(_LCD_CLEAR);             // clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ir.c,117 :: 		TMR1IF_bit = 0;                  // Clear Timer1 overflow interrupt flag bit
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;ir.c,118 :: 		RBIF_bit = 0;                    // Clear PORTB change interrupt flag bit
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;ir.c,119 :: 		TMR1IE_bit = 1;                  // Enable Timer1 overflow interrupt
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;ir.c,120 :: 		T1CON = 0x10;                    // Set Timer1 clock source to internal with 1:2 prescaler (Timer1 clock = 1MHz)
	MOVLW      16
	MOVWF      T1CON+0
;ir.c,121 :: 		INTCON = 0xC8;                   // Enable global, peripheral and PORTB change interrupts
	MOVLW      200
	MOVWF      INTCON+0
;ir.c,123 :: 		Lcd_Out(1, 1, "ADS:0x00  TGL: 0");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ir+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ir.c,124 :: 		Lcd_Out(2, 1, "CMD:0x00");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_ir+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ir.c,125 :: 		while(1) {
L_main35:
;ir.c,126 :: 		while(!rc5_ok);                       // Wait until RC5 code receiver
L_main37:
	BTFSC      _rc5_ok+0, BitPos(_rc5_ok+0)
	GOTO       L_main38
	GOTO       L_main37
L_main38:
;ir.c,127 :: 		rc5_ok = 0;                           // Reset decoding process
	BCF        _rc5_ok+0, BitPos(_rc5_ok+0)
;ir.c,128 :: 		rc5_state = 0;
	CLRF       _rc5_state+0
;ir.c,129 :: 		TMR1ON_bit = 0;                       // Disable Timer1
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;ir.c,130 :: 		toggle_bit = rc5_code >> 11;          // Toggle bit is bit number 11
	MOVLW      11
	MOVWF      R2+0
	MOVF       _rc5_code+0, 0
	MOVWF      R0+0
	MOVF       _rc5_code+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__main62:
	BTFSC      STATUS+0, 2
	GOTO       L__main63
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__main62
L__main63:
	BTFSC      R0+0, 0
	GOTO       L__main64
	BCF        _toggle_bit+0, BitPos(_toggle_bit+0)
	GOTO       L__main65
L__main64:
	BSF        _toggle_bit+0, BitPos(_toggle_bit+0)
L__main65:
;ir.c,131 :: 		address = (rc5_code >> 6) & 0x1F;     // Next 5 bits are for address
	MOVLW      6
	MOVWF      R2+0
	MOVF       _rc5_code+0, 0
	MOVWF      R0+0
	MOVF       _rc5_code+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__main66:
	BTFSC      STATUS+0, 2
	GOTO       L__main67
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__main66
L__main67:
	MOVLW      31
	ANDWF      R0+0, 0
	MOVWF      _address+0
;ir.c,132 :: 		command = rc5_code & 0x3F;            // The 6 LSBits are command bits
	MOVLW      63
	ANDWF      _rc5_code+0, 0
	MOVWF      _command+0
;ir.c,133 :: 		Lcd_Chr(1, 16, toggle_bit + 48);      // Display toggle bit
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      0
	BTFSC      _toggle_bit+0, BitPos(_toggle_bit+0)
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_out_char+0
	MOVLW      48
	ADDWF      FARG_Lcd_Chr_out_char+0, 1
	CALL       _Lcd_Chr+0
;ir.c,134 :: 		ByteToHex(address, text);             // Save address in string text with hex format
	MOVF       _address+0, 0
	MOVWF      FARG_ByteToHex_input+0
	MOVLW      _text+0
	MOVWF      FARG_ByteToHex_output+0
	CALL       _ByteToHex+0
;ir.c,135 :: 		Lcd_Out(1, 7, text);                  // Display address
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ir.c,136 :: 		ByteToHex(command, text);             // Save command in string text with hex format
	MOVF       _command+0, 0
	MOVWF      FARG_ByteToHex_input+0
	MOVLW      _text+0
	MOVWF      FARG_ByteToHex_output+0
	CALL       _ByteToHex+0
;ir.c,137 :: 		Lcd_Out(2, 7, text);                  // Display command
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ir.c,138 :: 		RBIE_bit = 1;                         // Enable PORTB change interrupt
	BSF        RBIE_bit+0, BitPos(RBIE_bit+0)
;ir.c,139 :: 		}  }
	GOTO       L_main35
L_end_main:
	GOTO       $+0
; end of _main
