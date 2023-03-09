
_main:

;PWM.c,3 :: 		void main() {
;PWM.c,4 :: 		trisc=0;
	CLRF       TRISC+0
;PWM.c,5 :: 		portc=0;
	CLRF       PORTC+0
;PWM.c,7 :: 		pwm1_init(1000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM.c,8 :: 		pwm1_start();
	CALL       _PWM1_Start+0
;PWM.c,9 :: 		while(1){
L_main0:
;PWM.c,10 :: 		for(i=0;i<100;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      100
	SUBWF      _i+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;PWM.c,11 :: 		{pwm1_set_duty(i); delay_ms(100);}
	MOVF       _i+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;PWM.c,10 :: 		for(i=0;i<100;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;PWM.c,11 :: 		{pwm1_set_duty(i); delay_ms(100);}
	GOTO       L_main2
L_main3:
;PWM.c,13 :: 		}
	GOTO       L_main0
;PWM.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
