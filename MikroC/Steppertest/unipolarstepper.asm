
_main:

;unipolarstepper.c,13 :: 		void main() {
;unipolarstepper.c,14 :: 		TRISB=0;
	CLRF       TRISB+0
;unipolarstepper.c,15 :: 		Stepper_Init(200);
	MOVLW      200
	MOVWF      FARG_Stepper_Init_steps+0
	CLRF       FARG_Stepper_Init_steps+1
	CALL       _Stepper_Init+0
;unipolarstepper.c,16 :: 		Stepper_speed(20);
	MOVLW      20
	MOVWF      FARG_Stepper_Speed_whatSpeed+0
	MOVLW      0
	MOVWF      FARG_Stepper_Speed_whatSpeed+1
	CALL       _Stepper_Speed+0
;unipolarstepper.c,17 :: 		while(1)
L_main0:
;unipolarstepper.c,19 :: 		Stepper_Step(100);
	MOVLW      100
	MOVWF      FARG_Stepper_Step_steps_to_move+0
	MOVLW      0
	MOVWF      FARG_Stepper_Step_steps_to_move+1
	CALL       _Stepper_Step+0
;unipolarstepper.c,20 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;unipolarstepper.c,21 :: 		Stepper_Step(-100);
	MOVLW      156
	MOVWF      FARG_Stepper_Step_steps_to_move+0
	MOVLW      255
	MOVWF      FARG_Stepper_Step_steps_to_move+1
	CALL       _Stepper_Step+0
;unipolarstepper.c,22 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;unipolarstepper.c,23 :: 		}
	GOTO       L_main0
;unipolarstepper.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
