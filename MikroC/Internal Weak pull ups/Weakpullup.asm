
_main:

;Weakpullup.c,3 :: 		void main()
;Weakpullup.c,5 :: 		option_reg=0x00;
	CLRF       OPTION_REG+0
;Weakpullup.c,6 :: 		state=0;
	BCF        _state+0, BitPos(_state+0)
;Weakpullup.c,7 :: 		delay_ms(100);
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
;Weakpullup.c,8 :: 		trisb.rb0=1;
	BSF        TRISB+0, 0
;Weakpullup.c,9 :: 		trisb.rb1=0;
	BCF        TRISB+0, 1
;Weakpullup.c,11 :: 		while(1)
L_main1:
;Weakpullup.c,13 :: 		if (~portb.rb0) {delay_ms(300); state=~state; }
	BTFSC      PORTB+0, 0
	GOTO       L__main6
	BSF        3, 0
	GOTO       L__main7
L__main6:
	BCF        3, 0
L__main7:
	BTFSS      3, 0
	GOTO       L_main3
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	MOVLW
	XORWF      _state+0, 1
L_main3:
;Weakpullup.c,14 :: 		portb.rb1=state;
	BTFSC      _state+0, BitPos(_state+0)
	GOTO       L__main8
	BCF        PORTB+0, 1
	GOTO       L__main9
L__main8:
	BSF        PORTB+0, 1
L__main9:
;Weakpullup.c,15 :: 		}
	GOTO       L_main1
;Weakpullup.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
