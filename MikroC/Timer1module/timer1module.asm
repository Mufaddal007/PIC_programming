
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;timer1module.c,3 :: 		void interrupt()
;timer1module.c,5 :: 		if (tmr1if_bit){halfsec++; tmr1if_bit=0; tmr1h=0x0B; tmr1l=0xDC;}
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_interrupt0
	INCF       _halfsec+0, 1
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	MOVLW      11
	MOVWF      TMR1H+0
	MOVLW      220
	MOVWF      TMR1L+0
L_interrupt0:
;timer1module.c,6 :: 		}
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

;timer1module.c,7 :: 		void main()
;timer1module.c,9 :: 		state=halfsec=sec=0;
	CLRF       _sec+0
	CLRF       _halfsec+0
	BCF        _state+0, BitPos(_state+0)
;timer1module.c,10 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;timer1module.c,11 :: 		PEIE_bit=1;
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;timer1module.c,12 :: 		T1CON=49;
	MOVLW      49
	MOVWF      T1CON+0
;timer1module.c,13 :: 		tmr1ie_bit=1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;timer1module.c,14 :: 		tmr1if_bit=0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;timer1module.c,15 :: 		tmr1h=0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;timer1module.c,16 :: 		tmr1l=0xDC;
	MOVLW      220
	MOVWF      TMR1L+0
;timer1module.c,17 :: 		trisb.rb0=0;
	BCF        TRISB+0, 0
;timer1module.c,18 :: 		while(1)
L_main1:
;timer1module.c,20 :: 		if(halfsec==2){ halfsec=0; state=~state;  sec++;}
	MOVF       _halfsec+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main3
	CLRF       _halfsec+0
	MOVLW
	XORWF      _state+0, 1
	INCF       _sec+0, 1
L_main3:
;timer1module.c,21 :: 		portb.rb0=state;
	BTFSC      _state+0, BitPos(_state+0)
	GOTO       L__main7
	BCF        PORTB+0, 0
	GOTO       L__main8
L__main7:
	BSF        PORTB+0, 0
L__main8:
;timer1module.c,22 :: 		}
	GOTO       L_main1
;timer1module.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
