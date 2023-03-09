
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;multipleInterrupts.c,2 :: 		void interrupt(){
;multipleInterrupts.c,3 :: 		unresolved line
	BTFSS      RBIF_bit+0, BitPos(RBIF_bit+0)
	GOTO       L_interrupt0
;multipleInterrupts.c,5 :: 		unresolved line
	MOVF       PORTB+0, 0
	MOVWF      R3+0
;multipleInterrupts.c,6 :: 		unresolved line
	MOVLW      240
	ANDWF      R3+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSC      R3+0, 7
	MOVLW      255
	MOVWF      R1+1
	MOVLW      0
	ANDWF      R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt22
	MOVLW      224
	XORWF      R1+0, 0
L__interrupt22:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt1
	BSF        PORTC+0, 0
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_interrupt2:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt2
	DECFSZ     R12+0, 1
	GOTO       L_interrupt2
	DECFSZ     R11+0, 1
	GOTO       L_interrupt2
	NOP
	NOP
	BCF        PORTC+0, 0
	GOTO       L_interrupt3
L_interrupt1:
;multipleInterrupts.c,7 :: 		unresolved line
	MOVLW      240
	ANDWF      R3+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSC      R3+0, 7
	MOVLW      255
	MOVWF      R1+1
	MOVLW      0
	ANDWF      R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt23
	MOVLW      208
	XORWF      R1+0, 0
L__interrupt23:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt4
	BSF        PORTC+0, 1
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_interrupt5:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt5
	DECFSZ     R12+0, 1
	GOTO       L_interrupt5
	DECFSZ     R11+0, 1
	GOTO       L_interrupt5
	NOP
	NOP
	BCF        PORTC+0, 1
	GOTO       L_interrupt6
L_interrupt4:
;multipleInterrupts.c,8 :: 		unresolved line
	MOVLW      240
	ANDWF      R3+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSC      R3+0, 7
	MOVLW      255
	MOVWF      R1+1
	MOVLW      0
	ANDWF      R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt24
	MOVLW      176
	XORWF      R1+0, 0
L__interrupt24:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt7
	BSF        PORTC+0, 1
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_interrupt8:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt8
	DECFSZ     R12+0, 1
	GOTO       L_interrupt8
	DECFSZ     R11+0, 1
	GOTO       L_interrupt8
	NOP
	NOP
	BCF        PORTC+0, 1
	GOTO       L_interrupt9
L_interrupt7:
;multipleInterrupts.c,9 :: 		unresolved line
	MOVLW      240
	ANDWF      R3+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSC      R3+0, 7
	MOVLW      255
	MOVWF      R1+1
	MOVLW      0
	ANDWF      R1+1, 1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt25
	MOVLW      112
	XORWF      R1+0, 0
L__interrupt25:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt10
	BSF        PORTC+0, 1
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_interrupt11:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt11
	DECFSZ     R12+0, 1
	GOTO       L_interrupt11
	DECFSZ     R11+0, 1
	GOTO       L_interrupt11
	NOP
	NOP
	BCF        PORTC+0, 1
	GOTO       L_interrupt12
L_interrupt10:
;multipleInterrupts.c,10 :: 		unresolved line
	CLRF       _i+0
	CLRF       _i+1
L_interrupt13:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt26
	MOVLW      3
	SUBWF      _i+0, 0
L__interrupt26:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt14
	BSF        PORTC+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_interrupt16:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt16
	DECFSZ     R12+0, 1
	GOTO       L_interrupt16
	DECFSZ     R11+0, 1
	GOTO       L_interrupt16
	NOP
	NOP
	BCF        PORTC+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_interrupt17:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt17
	DECFSZ     R12+0, 1
	GOTO       L_interrupt17
	DECFSZ     R11+0, 1
	GOTO       L_interrupt17
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_interrupt13
L_interrupt14:
L_interrupt12:
L_interrupt9:
L_interrupt6:
L_interrupt3:
;multipleInterrupts.c,12 :: 		unresolved line
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;multipleInterrupts.c,14 :: 		unresolved line
L_interrupt0:
;multipleInterrupts.c,15 :: 		unresolved line
L_end_interrupt:
L__interrupt21:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;multipleInterrupts.c,16 :: 		unresolved line
;multipleInterrupts.c,18 :: 		unresolved line
	CLRF       OPTION_REG+0
;multipleInterrupts.c,19 :: 		unresolved line
	BSF        TRISB+0, 7
	BTFSC      TRISB+0, 7
	GOTO       L__main28
	BCF        TRISB+0, 6
	GOTO       L__main29
L__main28:
	BSF        TRISB+0, 6
L__main29:
	BTFSC      TRISB+0, 6
	GOTO       L__main30
	BCF        TRISB+0, 5
	GOTO       L__main31
L__main30:
	BSF        TRISB+0, 5
L__main31:
	BTFSC      TRISB+0, 5
	GOTO       L__main32
	BCF        TRISB+0, 4
	GOTO       L__main33
L__main32:
	BSF        TRISB+0, 4
L__main33:
;multipleInterrupts.c,20 :: 		unresolved line
	BCF        TRISC+0, 3
	BTFSC      TRISC+0, 3
	GOTO       L__main34
	BCF        TRISC+0, 2
	GOTO       L__main35
L__main34:
	BSF        TRISC+0, 2
L__main35:
	BTFSC      TRISC+0, 2
	GOTO       L__main36
	BCF        TRISC+0, 1
	GOTO       L__main37
L__main36:
	BSF        TRISC+0, 1
L__main37:
	BTFSC      TRISC+0, 1
	GOTO       L__main38
	BCF        TRISC+0, 0
	GOTO       L__main39
L__main38:
	BSF        TRISC+0, 0
L__main39:
;multipleInterrupts.c,21 :: 		unresolved line
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;multipleInterrupts.c,22 :: 		unresolved line
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;multipleInterrupts.c,23 :: 		unresolved line
	BSF        RBIE_bit+0, BitPos(RBIE_bit+0)
;multipleInterrupts.c,24 :: 		unresolved line
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;multipleInterrupts.c,25 :: 		unresolved line
L_main18:
	BCF        PORTC+0, 3
	BTFSC      PORTC+0, 3
	GOTO       L__main40
	BCF        PORTC+0, 2
	GOTO       L__main41
L__main40:
	BSF        PORTC+0, 2
L__main41:
	BTFSC      PORTC+0, 2
	GOTO       L__main42
	BCF        PORTC+0, 1
	GOTO       L__main43
L__main42:
	BSF        PORTC+0, 1
L__main43:
	BTFSC      PORTC+0, 1
	GOTO       L__main44
	BCF        PORTC+0, 0
	GOTO       L__main45
L__main44:
	BSF        PORTC+0, 0
L__main45:
	GOTO       L_main18
;multipleInterrupts.c,26 :: 		unresolved line
L_end_main:
	GOTO       $+0
; end of _main
