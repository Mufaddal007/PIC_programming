
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;externalinterrupt.c,2 :: 		void interrupt()
;externalinterrupt.c,4 :: 		if (INTF_bit) { delay_ms(300); state=1-state; INTF_bit=0;}
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_interrupt1:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt1
	DECFSZ     R12+0, 1
	GOTO       L_interrupt1
	DECFSZ     R11+0, 1
	GOTO       L_interrupt1
	CLRF       R0+0
	BTFSC      _state+0, BitPos(_state+0)
	INCF       R0+0, 1
	MOVF       R0+0, 0
	SUBLW      1
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L__interrupt6
	BCF        _state+0, BitPos(_state+0)
	GOTO       L__interrupt7
L__interrupt6:
	BSF        _state+0, BitPos(_state+0)
L__interrupt7:
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
L_interrupt0:
;externalinterrupt.c,5 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;externalinterrupt.c,6 :: 		void main() {
;externalinterrupt.c,7 :: 		state=0;
	BCF        _state+0, BitPos(_state+0)
;externalinterrupt.c,8 :: 		trisb.b1=0;
	BCF        TRISB+0, 1
;externalinterrupt.c,9 :: 		INTEDG_bit=0;
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;externalinterrupt.c,10 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;externalinterrupt.c,11 :: 		INTCON.PEIE=1;
	BSF        INTCON+0, 6
;externalinterrupt.c,12 :: 		INTCON.INTE=1;
	BSF        INTCON+0, 4
;externalinterrupt.c,13 :: 		INTCON.INTF=0;
	BCF        INTCON+0, 1
;externalinterrupt.c,14 :: 		while(1) { PORTB.B1=state; }
L_main2:
	BTFSC      _state+0, BitPos(_state+0)
	GOTO       L__main9
	BCF        PORTB+0, 1
	GOTO       L__main10
L__main9:
	BSF        PORTB+0, 1
L__main10:
	GOTO       L_main2
;externalinterrupt.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
