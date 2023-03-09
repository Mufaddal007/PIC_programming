
_main:

;brtest.c,1 :: 		void main() {
;brtest.c,2 :: 		TRISB.F7=255;
	BSF        TRISB+0, 7
;brtest.c,3 :: 		TRISB.F0=0;
	BCF        TRISB+0, 0
;brtest.c,5 :: 		while(1){
L_main0:
;brtest.c,6 :: 		if (!PORTB.F7)
	BTFSC      PORTB+0, 7
	GOTO       L_main2
;brtest.c,8 :: 		PORTB.F0=1;
	BSF        PORTB+0, 0
;brtest.c,9 :: 		}
	GOTO       L_main3
L_main2:
;brtest.c,12 :: 		PORTB.F0=0;
	BCF        PORTB+0, 0
;brtest.c,13 :: 		}
L_main3:
;brtest.c,14 :: 		}
	GOTO       L_main0
;brtest.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
