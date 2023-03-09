
_main:

;pwm.c,1 :: 		void main()
;pwm.c,3 :: 		short current_duty_1  = 4; // initial value for current_duty_1
	MOVLW      4
	MOVWF      main_current_duty_1_L0+0
;pwm.c,5 :: 		TRISC = 0x00; // PORTC as output
	CLRF       TRISC+0
;pwm.c,6 :: 		TRISB=1;
	MOVLW      1
	MOVWF      TRISB+0
;pwm.c,7 :: 		PWM1_Init(5000);  // Initialize PWM1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm.c,10 :: 		PWM1_Start();  // start PWM1
	CALL       _PWM1_Start+0
;pwm.c,12 :: 		PWM1_Set_Duty(current_duty_1); // Set current duty for PWM1
	MOVF       main_current_duty_1_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,13 :: 		while (1)
L_main0:
;pwm.c,16 :: 		int i=0;
	CLRF       main_i_L1+0
	CLRF       main_i_L1+1
;pwm.c,18 :: 		for(i=0;i<25;i++){
	CLRF       main_i_L1+0
	CLRF       main_i_L1+1
L_main2:
	MOVLW      128
	XORWF      main_i_L1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      25
	SUBWF      main_i_L1+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;pwm.c,19 :: 		current_duty_1+=10;  // increment current_duty_1
	MOVLW      10
	ADDWF      main_current_duty_1_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_current_duty_1_L0+0
;pwm.c,20 :: 		PWM1_Set_Duty(current_duty_1);  //Change the duty cycle
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,21 :: 		delay_ms(20);  }
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
;pwm.c,18 :: 		for(i=0;i<25;i++){
	INCF       main_i_L1+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L1+1, 1
;pwm.c,21 :: 		delay_ms(20);  }
	GOTO       L_main2
L_main3:
;pwm.c,22 :: 		for(i=0;i<25;i++)
	CLRF       main_i_L1+0
	CLRF       main_i_L1+1
L_main6:
	MOVLW      128
	XORWF      main_i_L1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      25
	SUBWF      main_i_L1+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;pwm.c,24 :: 		current_duty_1-=10;  // increment current_duty_1
	MOVLW      10
	SUBWF      main_current_duty_1_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      main_current_duty_1_L0+0
;pwm.c,25 :: 		PWM1_Set_Duty(current_duty_1);  //Change the duty cycle
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,26 :: 		delay_ms(20);
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
;pwm.c,22 :: 		for(i=0;i<25;i++)
	INCF       main_i_L1+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L1+1, 1
;pwm.c,28 :: 		}
	GOTO       L_main6
L_main7:
;pwm.c,29 :: 		PWM1_Set_Duty(0); // Set current duty for PWM1
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,31 :: 		delay_ms(200);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;pwm.c,33 :: 		}
	GOTO       L_main0
;pwm.c,34 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
