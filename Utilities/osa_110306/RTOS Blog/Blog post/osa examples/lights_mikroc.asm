
_main:

;lights_mikroc.c,155 :: 		void main (void)
;lights_mikroc.c,157 :: 		Init();                             // Init periphery
	CALL        _Init+0, 0
;lights_mikroc.c,159 :: 		OS_Init();                          // Init OS
	CALL        _OS_Init+0, 0
;lights_mikroc.c,163 :: 		OS_Task_Create(0, Thread1);    // Create tasks.
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Thread1+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Thread1+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;lights_mikroc.c,164 :: 		OS_Task_Create(0, Thread2);   //
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Thread2+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Thread2+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;lights_mikroc.c,165 :: 		OS_Task_Create(0, Thread3);     //
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Thread3+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Thread3+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;lights_mikroc.c,170 :: 		OS_EI();                            // Enable interrupts
	BSF         GIE_bit+0, 7 
	BTFSS       IPEN_bit+0, 7 
	GOTO        L_main0
	BSF         GIEL_bit+0, 6 
L_main0:
;lights_mikroc.c,172 :: 		OS_Run();                           // Running scheduler void hello() iv 0x0018 ics ICS_AUTO {}
L_main1:
	BCF         __OS_Flags+0, 4 
	BSF         __OS_Flags+0, 3 
	MOVLW       8
	MOVWF       __OS_Best_Priority+0 
	MOVF        __OS_LastTask+0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        __OS_LastTask+1, 0 
	MOVWF       __OS_CurTask+1 
L_main4:
	MOVLW       __OS_Tasks+0
	MOVWF       R0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       R1 
	MOVLW       14
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	SUBWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main53
	MOVF        R2, 0 
	SUBWF       __OS_CurTask+0, 0 
L__main53:
	BTFSS       STATUS+0, 0 
	GOTO        L_main7
	MOVLW       __OS_Tasks+0
	MOVWF       __OS_CurTask+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       __OS_CurTask+1 
	GOTO        L_main8
L_main7:
	MOVLW       7
	ADDWF       __OS_CurTask+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      __OS_CurTask+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        R1, 0 
	MOVWF       __OS_CurTask+1 
L_main8:
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR0H 
	MOVLW       1
	MOVWF       R0 
	MOVLW       __OS_State+0
	MOVWF       FSR1 
	MOVLW       hi_addr(__OS_State+0)
	MOVWF       FSR1H 
L_main9:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
	BTFSS       __OS_State+0, 6 
	GOTO        L__main50
	BTFSC       __OS_State+0, 7 
	GOTO        L__main50
	GOTO        L_main12
L__main50:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main12:
	MOVF        __OS_State+0, 0 
	MOVWF       R0 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       __OS_Temp+0 
	MOVF        __OS_Best_Priority+0, 0 
	SUBWF       __OS_Temp+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main13
	GOTO        ___main__OS_SCHED_CONTINUE
L_main13:
	BTFSC       __OS_State+0, 3 
	GOTO        L_main14
___main__OS_SCHED_RUN:
	CALL        __OS_JumpToTask+0, 0
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
	MOVLW       215
	ANDWF       __indf+0, 1 
	MOVLW       40
	ANDWF       __OS_State+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	IORWF       __indf+0, 1 
	BTFSC       __OS_Flags+0, 3 
	GOTO        L_main15
	GOTO        ___main_SCHED_END
L_main15:
L_main14:
	BTFSS       __OS_State+0, 4 
	GOTO        L_main18
	BTFSC       __OS_State+0, 5 
	GOTO        L_main18
L__main49:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main18:
	BTFSS       __OS_State+0, 3 
	GOTO        L_main19
	BSF         __OS_Flags+0, 4 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       __OS_BestTask+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       __OS_BestTask+1 
	MOVF        __OS_State+0, 0 
	MOVWF       R0 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       __OS_Best_Priority+0 
	MOVF        __OS_Best_Priority+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
	GOTO        L_main5
L_main20:
L_main19:
___main__OS_SCHED_CONTINUE:
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main54
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main54:
	BTFSC       STATUS+0, 2 
	GOTO        L__main48
	GOTO        L_main4
L__main48:
L_main5:
	BTFSS       __OS_Flags+0, 4 
	GOTO        L_main23
	BCF         __OS_Flags+0, 3 
	MOVF        __OS_BestTask+0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        __OS_BestTask+1, 0 
	MOVWF       __OS_CurTask+1 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       __OS_LastTask+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       __OS_LastTask+1 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR0H 
	MOVLW       1
	MOVWF       R0 
	MOVLW       __OS_State+0
	MOVWF       FSR1 
	MOVLW       hi_addr(__OS_State+0)
	MOVWF       FSR1H 
L_main24:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
	BTFSS       __OS_State+0, 6 
	GOTO        L_main27
	BTFSC       __OS_State+0, 7 
	GOTO        L_main27
L__main47:
	GOTO        ___main__OS_SCHED_RUN
L_main27:
L_main23:
___main_SCHED_END:
	GOTO        L_main1
;lights_mikroc.c,174 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Init:

;lights_mikroc.c,195 :: 		void Init (void)
;lights_mikroc.c,202 :: 		PORTA = PORTA_CONST;
	MOVLW       255
	MOVWF       PORTA+0 
;lights_mikroc.c,203 :: 		PORTB = PORTB_CONST;
	MOVLW       255
	MOVWF       PORTB+0 
;lights_mikroc.c,205 :: 		TRISA = TRISA_CONST;
	CLRF        TRISA+0 
;lights_mikroc.c,206 :: 		TRISB = TRISB_CONST;
	CLRF        TRISB+0 
;lights_mikroc.c,208 :: 		NOT_RBPU_bit = 0;
	BCF         NOT_RBPU_bit+0, 7 
;lights_mikroc.c,210 :: 		PORTC = PORTC_CONST;
	CLRF        PORTC+0 
;lights_mikroc.c,211 :: 		TRISC = TRISC_CONST;
	CLRF        TRISC+0 
;lights_mikroc.c,215 :: 		PORTD = PORTD_CONST;
	CLRF        PORTD+0 
;lights_mikroc.c,216 :: 		TRISD = TRISD_CONST;
	CLRF        TRISD+0 
;lights_mikroc.c,220 :: 		PORTE = PORTE_CONST;
	CLRF        PORTE+0 
;lights_mikroc.c,221 :: 		TRISE = TRISE_CONST;
	CLRF        TRISE+0 
;lights_mikroc.c,237 :: 		T2CON	 = 0x4E;
	MOVLW       78
	MOVWF       T2CON+0 
;lights_mikroc.c,238 :: 		TMR2IE_bit	 = 1;
	BSF         TMR2IE_bit+0, 1 
;lights_mikroc.c,239 :: 		PR2		 = 250;
	MOVLW       250
	MOVWF       PR2+0 
;lights_mikroc.c,240 :: 		INTCON	 = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;lights_mikroc.c,250 :: 		PEIE_bit = 1;
	BSF         PEIE_bit+0, 6 
;lights_mikroc.c,252 :: 		}
L_end_Init:
	RETURN      0
; end of _Init

_interrupt:

;lights_mikroc.c,260 :: 		void interrupt (void)
;lights_mikroc.c,268 :: 		if (T0IF_bit && T0IE_bit)
	BTFSS       T0IF_bit+0, 2 
	GOTO        L_interrupt30
	BTFSS       T0IE_bit+0, 5 
	GOTO        L_interrupt30
L__interrupt51:
;lights_mikroc.c,270 :: 		T0IF_bit = 0;
	BCF         T0IF_bit+0, 2 
;lights_mikroc.c,272 :: 		}
L_interrupt30:
;lights_mikroc.c,279 :: 		if (TMR2IF_bit)       //call is made to the timer every 10 ms
	BTFSS       TMR2IF_bit+0, 1 
	GOTO        L_interrupt31
;lights_mikroc.c,281 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, 1 
;lights_mikroc.c,282 :: 		OS_Timer();
	BTFSS       __OS_Tasks+0, 4 
	GOTO        L_interrupt32
	MOVLW       1
	ADDWF       __OS_Tasks+5, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      __OS_Tasks+6, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       __OS_Tasks+5 
	MOVF        R1, 0 
	MOVWF       __OS_Tasks+6 
	MOVF        __OS_Tasks+5, 0 
	IORWF       __OS_Tasks+6, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt33
	BCF         __OS_Tasks+0, 4 
L_interrupt33:
L_interrupt32:
	BTFSS       __OS_Tasks+7, 4 
	GOTO        L_interrupt34
	MOVLW       1
	ADDWF       __OS_Tasks+12, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      __OS_Tasks+13, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       __OS_Tasks+12 
	MOVF        R1, 0 
	MOVWF       __OS_Tasks+13 
	MOVF        __OS_Tasks+12, 0 
	IORWF       __OS_Tasks+13, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt35
	BCF         __OS_Tasks+7, 4 
L_interrupt35:
L_interrupt34:
	BTFSS       __OS_Tasks+14, 4 
	GOTO        L_interrupt36
	MOVLW       1
	ADDWF       __OS_Tasks+19, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      __OS_Tasks+20, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       __OS_Tasks+19 
	MOVF        R1, 0 
	MOVWF       __OS_Tasks+20 
	MOVF        __OS_Tasks+19, 0 
	IORWF       __OS_Tasks+20, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt37
	BCF         __OS_Tasks+14, 4 
L_interrupt37:
L_interrupt36:
;lights_mikroc.c,283 :: 		}
L_interrupt31:
;lights_mikroc.c,285 :: 		}
L_end_interrupt:
L__interrupt57:
	RETFIE      1
; end of _interrupt

_Thread1:

;lights_mikroc.c,300 :: 		void Thread1 (void)
;lights_mikroc.c,304 :: 		for (;;)
L_Thread138:
;lights_mikroc.c,306 :: 		PORTA++;     //add code here
	MOVF        PORTA+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       PORTA+0 
;lights_mikroc.c,307 :: 		}
	GOTO        L_Thread138
;lights_mikroc.c,308 :: 		}
L_end_Thread1:
	RETURN      0
; end of _Thread1

_Thread2:

;lights_mikroc.c,321 :: 		void Thread2 (void)
;lights_mikroc.c,323 :: 		for (;;)
L_Thread241:
;lights_mikroc.c,325 :: 		portb++;
	MOVF        PORTB+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       PORTB+0 
;lights_mikroc.c,327 :: 		}
	GOTO        L_Thread241
;lights_mikroc.c,328 :: 		}
L_end_Thread2:
	RETURN      0
; end of _Thread2

_Thread3:

;lights_mikroc.c,340 :: 		void Thread3 (void)
;lights_mikroc.c,342 :: 		for (;;)
L_Thread344:
;lights_mikroc.c,344 :: 		portc++;
	MOVF        PORTC+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       PORTC+0 
;lights_mikroc.c,345 :: 		}
	GOTO        L_Thread344
;lights_mikroc.c,346 :: 		}
L_end_Thread3:
	RETURN      0
; end of _Thread3
