
_main:

;pwm877a.c,3 :: 		void main() {
;pwm877a.c,4 :: 		trisc=0;
	CLRF       TRISC+0
;pwm877a.c,5 :: 		portc=0;
	CLRF       PORTC+0
;pwm877a.c,7 :: 		pwm1_init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm877a.c,8 :: 		pwm1_start();
	CALL       _PWM1_Start+0
;pwm877a.c,9 :: 		while(1){
L_main0:
;pwm877a.c,10 :: 		for(i=0;i<90;i+=2)
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      90
	SUBWF      _i+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;pwm877a.c,11 :: 		{pwm1_set_duty(i); delay_ms(100);}
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
;pwm877a.c,10 :: 		for(i=0;i<90;i+=2)
	MOVLW      2
	ADDWF      _i+0, 1
	BTFSC      STATUS+0, 0
	INCF       _i+1, 1
;pwm877a.c,11 :: 		{pwm1_set_duty(i); delay_ms(100);}
	GOTO       L_main2
L_main3:
;pwm877a.c,12 :: 		for(;i;i-=2)
L_main6:
	MOVF       _i+0, 0
	IORWF      _i+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;pwm877a.c,13 :: 		{pwm1_set_duty(i); delay_ms(100);}
	MOVF       _i+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;pwm877a.c,12 :: 		for(;i;i-=2)
	MOVLW      2
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;pwm877a.c,13 :: 		{pwm1_set_duty(i); delay_ms(100);}
	GOTO       L_main6
L_main7:
;pwm877a.c,14 :: 		}
	GOTO       L_main0
;pwm877a.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
