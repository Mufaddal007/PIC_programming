
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;timer0.c,4 :: 		void Interrupt(){
;timer0.c,5 :: 		if (TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrupt0
;timer0.c,6 :: 		TMR0IF_bit	 = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;timer0.c,7 :: 		TMR0 = 61;
	MOVLW      61
	MOVWF      TMR0+0
;timer0.c,8 :: 		value++;
	INCF       _value+0, 1
;timer0.c,9 :: 		}
L_Interrupt0:
;timer0.c,10 :: 		}
L_end_Interrupt:
L__Interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;timer0.c,12 :: 		void main() {
;timer0.c,13 :: 		state=0;
	BCF        _state+0, BitPos(_state+0)
;timer0.c,14 :: 		value=0;
	CLRF       _value+0
;timer0.c,15 :: 		trisb.rb0=0;
	BCF        TRISB+0, 0
;timer0.c,16 :: 		OPTION_REG	 = 0x87;
	MOVLW      135
	MOVWF      OPTION_REG+0
;timer0.c,17 :: 		TMR0		 = 61;
	MOVLW      61
	MOVWF      TMR0+0
;timer0.c,18 :: 		INTCON	 = 0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;timer0.c,20 :: 		while(1)
L_main1:
;timer0.c,22 :: 		if (value==20)
	MOVF       _value+0, 0
	XORLW      20
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;timer0.c,24 :: 		value=0;
	CLRF       _value+0
;timer0.c,25 :: 		state=1-state;
	CLRF       R0+0
	BTFSC      _state+0, BitPos(_state+0)
	INCF       R0+0, 1
	MOVF       R0+0, 0
	SUBLW      1
	MOVWF      R0+0
	BTFSC      R0+0, 0
	GOTO       L__main7
	BCF        _state+0, BitPos(_state+0)
	GOTO       L__main8
L__main7:
	BSF        _state+0, BitPos(_state+0)
L__main8:
;timer0.c,26 :: 		portb.rb0=state;
	BTFSC      _state+0, BitPos(_state+0)
	GOTO       L__main9
	BCF        PORTB+0, 0
	GOTO       L__main10
L__main9:
	BSF        PORTB+0, 0
L__main10:
;timer0.c,27 :: 		}
L_main3:
;timer0.c,28 :: 		}
	GOTO       L_main1
;timer0.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
