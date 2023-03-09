
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
	CLRF        __OS_Temp+0 
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
	GOTO        L__main30
	MOVF        R2, 0 
	SUBWF       __OS_CurTask+0, 0 
L__main30:
	BTFSS       STATUS+0, 0 
	GOTO        L_main4
	MOVLW       __OS_Tasks+0
	MOVWF       __OS_CurTask+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       __OS_CurTask+1 
	GOTO        L_main5
L_main4:
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
L_main5:
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
L_main6:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
	BTFSS       __OS_State+0, 6 
	GOTO        L__main27
	BTFSC       __OS_State+0, 7 
	GOTO        L__main27
	GOTO        L_main9
L__main27:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main9:
	BTFSS       __OS_State+0, 4 
	GOTO        L_main12
	BTFSC       __OS_State+0, 5 
	GOTO        L_main12
L__main26:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main12:
	CALL        __OS_JumpToTask+0, 0
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
	MOVLW       215
	ANDWF       __indf+0, 1 
	MOVLW       40
	ANDWF       __OS_State+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	IORWF       __indf+0, 1 
___main__OS_SCHED_CONTINUE:
	GOTO        L_main1
;lights_mikroc.c,174 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Init:

;lights_mikroc.c,195 :: 		void Init (void)
;lights_mikroc.c,202 :: 		PORTA = PORTA_CONST;
	CLRF        PORTA+0 
;lights_mikroc.c,203 :: 		PORTB = PORTB_CONST;
	CLRF        PORTB+0 
;lights_mikroc.c,205 :: 		TRISA = TRISA_CONST;
	MOVLW       1
	MOVWF       TRISA+0 
;lights_mikroc.c,206 :: 		TRISB = TRISB_CONST;
	MOVLW       1
	MOVWF       TRISB+0 
;lights_mikroc.c,208 :: 		NOT_RBPU_bit = 0;
	BCF         NOT_RBPU_bit+0, 7 
;lights_mikroc.c,210 :: 		PORTC = PORTC_CONST;
	CLRF        PORTC+0 
;lights_mikroc.c,211 :: 		TRISC = TRISC_CONST;
	CLRF        TRISC+0 
;lights_mikroc.c,236 :: 		T2CON         = 0x4E;
	MOVLW       78
	MOVWF       T2CON+0 
;lights_mikroc.c,237 :: 		TMR2IE_bit         = 1;
	BSF         TMR2IE_bit+0, 1 
;lights_mikroc.c,238 :: 		PR2                 = 250;
	MOVLW       250
	MOVWF       PR2+0 
;lights_mikroc.c,239 :: 		INTCON         = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;lights_mikroc.c,249 :: 		PEIE_bit = 1;
	BSF         PEIE_bit+0, 6 
;lights_mikroc.c,251 :: 		}
L_end_Init:
	RETURN      0
; end of _Init

_interrupt:

;lights_mikroc.c,259 :: 		void interrupt (void)
;lights_mikroc.c,267 :: 		if (T0IF_bit && T0IE_bit)
	BTFSS       T0IF_bit+0, 2 
	GOTO        L_interrupt15
	BTFSS       T0IE_bit+0, 5 
	GOTO        L_interrupt15
L__interrupt28:
;lights_mikroc.c,269 :: 		T0IF_bit = 0;
	BCF         T0IF_bit+0, 2 
;lights_mikroc.c,271 :: 		}
L_interrupt15:
;lights_mikroc.c,278 :: 		if (TMR2IF_bit)
	BTFSS       TMR2IF_bit+0, 1 
	GOTO        L_interrupt16
;lights_mikroc.c,280 :: 		TMR2IF_bit = 0;
	BCF         TMR2IF_bit+0, 1 
;lights_mikroc.c,281 :: 		OS_Timer();
	CALL        _OS_Timer+0, 0
;lights_mikroc.c,282 :: 		}
L_interrupt16:
;lights_mikroc.c,284 :: 		}
L_end_interrupt:
L__interrupt33:
	RETFIE      1
; end of _interrupt

_Thread1:

;lights_mikroc.c,299 :: 		void Thread1 (void)
;lights_mikroc.c,303 :: 		for (;;)
L_Thread117:
;lights_mikroc.c,306 :: 		}
	GOTO        L_Thread117
;lights_mikroc.c,307 :: 		}
L_end_Thread1:
	RETURN      0
; end of _Thread1

_Thread2:

;lights_mikroc.c,320 :: 		void Thread2 (void)
;lights_mikroc.c,322 :: 		for (;;)
L_Thread220:
;lights_mikroc.c,326 :: 		}
	GOTO        L_Thread220
;lights_mikroc.c,327 :: 		}
L_end_Thread2:
	RETURN      0
; end of _Thread2

_Thread3:

;lights_mikroc.c,339 :: 		void Thread3 (void)
;lights_mikroc.c,341 :: 		for (;;)
L_Thread323:
;lights_mikroc.c,344 :: 		}
	GOTO        L_Thread323
;lights_mikroc.c,345 :: 		}
L_end_Thread3:
	RETURN      0
; end of _Thread3
