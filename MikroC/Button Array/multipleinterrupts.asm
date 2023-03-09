
_find_col:

;multipleinterrupts.c,17 :: 		void find_col()
;multipleinterrupts.c,19 :: 		col=(portb&0xF0);
	MOVLW      240
	ANDWF      PORTB+0, 0
	MOVWF      _col+0
;multipleinterrupts.c,22 :: 		col=~(col>>4);
	RRF        _col+0, 1
	BCF        _col+0, 7
	RRF        _col+0, 1
	BCF        _col+0, 7
	RRF        _col+0, 1
	BCF        _col+0, 7
	RRF        _col+0, 1
	BCF        _col+0, 7
	COMF       _col+0, 1
;multipleinterrupts.c,23 :: 		for(i=0;i<4;i++)
	CLRF       _i+0
L_find_col0:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_find_col1
;multipleinterrupts.c,24 :: 		{ if(col &(1<<i)){ col=i+1; j=col; break; } }
	MOVF       _i+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__find_col13:
	BTFSC      STATUS+0, 2
	GOTO       L__find_col14
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__find_col13
L__find_col14:
	MOVF       _col+0, 0
	ANDWF      R0+0, 1
	MOVLW      0
	ANDWF      R0+1, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_find_col3
	INCF       _i+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _col+0
	MOVF       R0+0, 0
	MOVWF      _j+0
	GOTO       L_find_col1
L_find_col3:
;multipleinterrupts.c,23 :: 		for(i=0;i<4;i++)
	INCF       _i+0, 1
;multipleinterrupts.c,24 :: 		{ if(col &(1<<i)){ col=i+1; j=col; break; } }
	GOTO       L_find_col0
L_find_col1:
;multipleinterrupts.c,25 :: 		}
L_end_find_col:
	RETURN
; end of _find_col

_find_row:

;multipleinterrupts.c,26 :: 		void find_row()
;multipleinterrupts.c,28 :: 		for (i=0;i<4;i++)
	CLRF       _i+0
L_find_row4:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_find_row5
;multipleinterrupts.c,30 :: 		portb=~(1<<i);
	MOVF       _i+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__find_row16:
	BTFSC      STATUS+0, 2
	GOTO       L__find_row17
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__find_row16
L__find_row17:
	COMF       R0+0, 0
	MOVWF      PORTB+0
;multipleinterrupts.c,31 :: 		if (portb>>4 != 0x0F) {row=i+1; break;}
	MOVF       PORTB+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	MOVF       R1+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_find_row7
	INCF       _i+0, 0
	MOVWF      _row+0
	GOTO       L_find_row5
L_find_row7:
;multipleinterrupts.c,28 :: 		for (i=0;i<4;i++)
	INCF       _i+0, 1
;multipleinterrupts.c,32 :: 		}
	GOTO       L_find_row4
L_find_row5:
;multipleinterrupts.c,33 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_find_row8:
	DECFSZ     R13+0, 1
	GOTO       L_find_row8
	DECFSZ     R12+0, 1
	GOTO       L_find_row8
	DECFSZ     R11+0, 1
	GOTO       L_find_row8
	NOP
;multipleinterrupts.c,34 :: 		portb=0xf0;
	MOVLW      240
	MOVWF      PORTB+0
;multipleinterrupts.c,35 :: 		}
L_end_find_row:
	RETURN
; end of _find_row

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;multipleinterrupts.c,37 :: 		void interrupt()
;multipleinterrupts.c,39 :: 		if(rbif_bit){ find_col(); find_row(); portd=((1<<(row-1))|(1<<(3+j))); rbif_bit=0;}
	BTFSS      RBIF_bit+0, BitPos(RBIF_bit+0)
	GOTO       L_interrupt9
	CALL       _find_col+0
	CALL       _find_row+0
	DECF       _row+0, 0
	MOVWF      R0+0
	MOVLW      1
	MOVWF      R2+0
	MOVF       R0+0, 0
L__interrupt20:
	BTFSC      STATUS+0, 2
	GOTO       L__interrupt21
	RLF        R2+0, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__interrupt20
L__interrupt21:
	MOVF       _j+0, 0
	ADDLW      3
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__interrupt22:
	BTFSC      STATUS+0, 2
	GOTO       L__interrupt23
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__interrupt22
L__interrupt23:
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      PORTD+0
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
L_interrupt9:
;multipleinterrupts.c,40 :: 		}
L_end_interrupt:
L__interrupt19:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;multipleinterrupts.c,41 :: 		void main()
;multipleinterrupts.c,43 :: 		lcd_init();
	CALL       _Lcd_Init+0
;multipleinterrupts.c,44 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;multipleinterrupts.c,45 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;multipleinterrupts.c,46 :: 		trisb=0xF0;
	MOVLW      240
	MOVWF      TRISB+0
;multipleinterrupts.c,47 :: 		portb=0xF0;
	MOVLW      240
	MOVWF      PORTB+0
;multipleinterrupts.c,48 :: 		trisc=0;
	CLRF       TRISC+0
;multipleinterrupts.c,49 :: 		trisd=0;
	CLRF       TRISD+0
;multipleinterrupts.c,50 :: 		portc=0;
	CLRF       PORTC+0
;multipleinterrupts.c,51 :: 		portd=0;
	CLRF       PORTD+0
;multipleinterrupts.c,52 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;multipleinterrupts.c,54 :: 		rbie_bit=1;
	BSF        RBIE_bit+0, BitPos(RBIE_bit+0)
;multipleinterrupts.c,55 :: 		rbif_bit=0;
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;multipleinterrupts.c,56 :: 		while(1){
L_main10:
;multipleinterrupts.c,57 :: 		lcd_out(1,1,"Row pos:   ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_multipleinterrupts+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;multipleinterrupts.c,58 :: 		lcd_chr(1,15,(char)row%10+48);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _row+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;multipleinterrupts.c,59 :: 		lcd_out(2,1,"Column pos:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_multipleinterrupts+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;multipleinterrupts.c,60 :: 		lcd_chr(2,15,(char)j%10+48);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _j+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;multipleinterrupts.c,62 :: 		};
	GOTO       L_main10
;multipleinterrupts.c,64 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
