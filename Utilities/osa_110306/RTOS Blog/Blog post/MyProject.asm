
_InitTimer0:

;MyProject.c,3 :: 		void InitTimer0(){
;MyProject.c,4 :: 		T0CON         = 0x88;
	MOVLW       136
	MOVWF       T0CON+0 
;MyProject.c,5 :: 		TMR0H         = 0xD1;
	MOVLW       209
	MOVWF       TMR0H+0 
;MyProject.c,6 :: 		TMR0L         = 0x21;
	MOVLW       33
	MOVWF       TMR0L+0 
;MyProject.c,7 :: 		GIE_bit       = 1;
	BSF         GIE_bit+0, 7 
;MyProject.c,8 :: 		TMR0IE_bit    = 1;
	BSF         TMR0IE_bit+0, 5 
;MyProject.c,9 :: 		}
L_end_InitTimer0:
	RETURN      0
; end of _InitTimer0

_Interrupt:

;MyProject.c,11 :: 		void Interrupt(){
;MyProject.c,12 :: 		if (TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, 2 
	GOTO        L_Interrupt0
;MyProject.c,13 :: 		TMR0IF_bit    = 0;
	BCF         TMR0IF_bit+0, 2 
;MyProject.c,14 :: 		TMR0H         = 0xD1;
	MOVLW       209
	MOVWF       TMR0H+0 
;MyProject.c,15 :: 		TMR0L         = 0x21;
	MOVLW       33
	MOVWF       TMR0L+0 
;MyProject.c,17 :: 		OS_Timer();      //incrementing by one tick
	CLRF        Interrupt__os_i_L3+0 
L_Interrupt1:
	MOVLW       4
	SUBWF       Interrupt__os_i_L3+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Interrupt2
	MOVLW       9
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        Interrupt__os_i_L3+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSS       R0, 4 
	GOTO        L_Interrupt4
	MOVLW       9
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        Interrupt__os_i_L3+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 1 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       R4 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R5 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVLW       1
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R3 
	MOVFF       R4, FSR1
	MOVFF       R5, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R4, FSR0
	MOVFF       R5, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	IORWF       R1, 0 
	IORWF       R2, 0 
	IORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt5
	MOVLW       9
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        Interrupt__os_i_L3+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	BCF         POSTINC1+0, 4 
L_Interrupt5:
L_Interrupt4:
	INCF        Interrupt__os_i_L3+0, 1 
	GOTO        L_Interrupt1
L_Interrupt2:
;MyProject.c,18 :: 		}
L_Interrupt0:
;MyProject.c,19 :: 		}
L_end_Interrupt:
L__Interrupt53:
	RETFIE      1
; end of _Interrupt

_Thread1:

;MyProject.c,23 :: 		void Thread1(void)
;MyProject.c,25 :: 		while(1)   //indefinite loop exists
L_Thread16:
;MyProject.c,29 :: 		portc.b1=~portc.b1;
	BTG         PORTC+0, 1 
;MyProject.c,30 :: 		OS_Delay(1000);       // This inserts a delay for 1000 ticks
	MOVLW       232
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       3
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;MyProject.c,33 :: 		}
	GOTO        L_Thread16
;MyProject.c,34 :: 		}
L_end_Thread1:
	RETURN      0
; end of _Thread1

_Thread2:

;MyProject.c,38 :: 		void Thread2(void)
;MyProject.c,40 :: 		while(1)
L_Thread28:
;MyProject.c,44 :: 		portc.b2=portc.b2;
;MyProject.c,45 :: 		OS_Delay(500);
	MOVLW       244
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       1
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;MyProject.c,47 :: 		}
	GOTO        L_Thread28
;MyProject.c,48 :: 		}
L_end_Thread2:
	RETURN      0
; end of _Thread2

_Thread3:

;MyProject.c,51 :: 		void Thread3(void)
;MyProject.c,54 :: 		while(1)
L_Thread310:
;MyProject.c,56 :: 		portc.b3=~portc.b3;
	BTG         PORTC+0, 3 
;MyProject.c,57 :: 		OS_Delay(100);
	MOVLW       100
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;MyProject.c,59 :: 		}
	GOTO        L_Thread310
;MyProject.c,60 :: 		}
L_end_Thread3:
	RETURN      0
; end of _Thread3

_Thread4:

;MyProject.c,63 :: 		void Thread4(void)
;MyProject.c,65 :: 		while(1)
L_Thread412:
;MyProject.c,67 :: 		portc.b4=~portc.b4;
	BTG         PORTC+0, 4 
;MyProject.c,68 :: 		OS_Delay(10);
	MOVLW       10
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	MOVWF       FARG__OS_InitDelay_Delay+2 
	MOVWF       FARG__OS_InitDelay_Delay+3 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;MyProject.c,69 :: 		}
	GOTO        L_Thread412
;MyProject.c,70 :: 		}
L_end_Thread4:
	RETURN      0
; end of _Thread4

_main:

;MyProject.c,72 :: 		void main() {
;MyProject.c,73 :: 		trisc=0;                     // setting portc as an output port
	CLRF        TRISC+0 
;MyProject.c,74 :: 		portc=0;                     //initializing the port with zero value
	CLRF        PORTC+0 
;MyProject.c,75 :: 		OS_Init();                   //must call to initialize OS services
	CALL        _OS_Init+0, 0
;MyProject.c,77 :: 		OS_Task_Create(0,Thread2);   //creates a task with highest priority
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
;MyProject.c,78 :: 		OS_Task_Create(2,Thread1);   //thread2 has been created with the lowest priority
	MOVLW       2
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Thread1+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Thread1+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;MyProject.c,79 :: 		OS_Task_Create(4,Thread3);
	MOVLW       4
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Thread3+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Thread3+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;MyProject.c,80 :: 		OS_Task_Create(7,Thread4);   //remember that threads with very low priotity will
	MOVLW       7
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _Thread4+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Thread4+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;MyProject.c,86 :: 		InitTimer0();                //Initiates the timer to count ticks
	CALL        _InitTimer0+0, 0
;MyProject.c,88 :: 		OS_Run();                    //calls scheduler repeatedly
L_main14:
	BCF         __OS_Flags+0, 4 
	BSF         __OS_Flags+0, 3 
	CLRF        __OS_Best_Priority+0 
	CLRF        __OS_Worst_Priority+0 
	MOVLW       4
	MOVWF       __OS_n+0 
L_main17:
	DECF        __OS_n+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       __OS_TaskQueue+0
	ADDWF       R0, 0 
	MOVWF       FSR2 
	MOVLW       hi_addr(__OS_TaskQueue+0)
	ADDWFC      R1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       __OS_Cur_Pos+0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       9
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 0 
	MOVWF       __OS_CurTask+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 0 
	MOVWF       __OS_CurTask+1 
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
L_main20:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
	BTFSS       __OS_State+0, 6 
	GOTO        L__main50
	BTFSC       __OS_State+0, 7 
	GOTO        L__main50
	GOTO        L_main23
L__main50:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main23:
	BTFSC       __OS_State+0, 3 
	GOTO        L_main24
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
	GOTO        L_main25
	BTFSC       __OS_State+0, 3 
	GOTO        L__main49
	BTFSC       __OS_Flags+1, 0 
	GOTO        L__main49
	GOTO        L_main28
L__main49:
	MOVLW       __OS_TaskLevel+0
	MOVWF       R1 
	MOVLW       hi_addr(__OS_TaskLevel+0)
	MOVWF       R2 
	MOVF        __OS_Cur_Pos+0, 0 
	ADDWF       R1, 1 
	BTFSC       STATUS+0, 0 
	INCF        R2, 1 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        __OS_Worst_Priority+0, 0 
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        __OS_Best_n+0, 0 
	MOVWF       __OS_n+0 
L_main29:
	MOVF        __OS_n+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main30
	MOVLW       __OS_TaskQueue+0
	MOVWF       FSR1 
	MOVLW       hi_addr(__OS_TaskQueue+0)
	MOVWF       FSR1H 
	MOVF        __OS_n+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	DECF        __OS_n+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       __OS_TaskQueue+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(__OS_TaskQueue+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        __OS_n+0, 1 
	GOTO        L_main29
L_main30:
	MOVF        __OS_Cur_Pos+0, 0 
	MOVWF       __OS_TaskQueue+0 
L_main28:
	GOTO        ___main_SCHED_END
L_main25:
L_main24:
	BTFSS       __OS_State+0, 4 
	GOTO        L_main33
	BTFSC       __OS_State+0, 5 
	GOTO        L_main33
L__main48:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main33:
	BTFSS       __OS_State+0, 3 
	GOTO        L_main34
	MOVLW       __OS_TaskLevel+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__OS_TaskLevel+0)
	MOVWF       FSR0H 
	MOVF        __OS_Cur_Pos+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       __OS_Temp+0 
	BTFSC       R1, 7 
	GOTO        L_main35
	MOVLW       8
	ADDWF       __OS_Temp+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       __OS_Temp+0 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	SUBWF       R1, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       __OS_Temp+0 
	MOVLW       __OS_TaskLevel+0
	MOVWF       FSR1 
	MOVLW       hi_addr(__OS_TaskLevel+0)
	MOVWF       FSR1H 
	MOVF        __OS_Cur_Pos+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
L_main35:
	MOVF        __OS_Temp+0, 0 
	SUBWF       __OS_Best_Priority+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main36
	MOVF        __OS_Best_Priority+0, 0 
	MOVWF       __OS_Worst_Priority+0 
	MOVF        __OS_Temp+0, 0 
	MOVWF       __OS_Best_Priority+0 
	DECF        __OS_n+0, 0 
	MOVWF       __OS_Best_n+0 
	BSF         __OS_Flags+0, 4 
	GOTO        L_main37
L_main36:
	MOVF        __OS_Temp+0, 0 
	SUBWF       __OS_Worst_Priority+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main38
	MOVF        __OS_Temp+0, 0 
	MOVWF       __OS_Worst_Priority+0 
L_main38:
L_main37:
L_main34:
___main__OS_SCHED_CONTINUE:
	DECF        __OS_n+0, 1 
	MOVF        __OS_n+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__main47
	GOTO        L_main17
L__main47:
	BTFSS       __OS_Flags+0, 4 
	GOTO        L_main41
	BCF         __OS_Flags+0, 3 
	BCF         __OS_Flags+1, 0 
	MOVLW       __OS_TaskQueue+0
	MOVWF       FSR2 
	MOVLW       hi_addr(__OS_TaskQueue+0)
	MOVWF       FSR2H 
	MOVF        __OS_Best_n+0, 0 
	ADDWF       FSR2, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR2H, 1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       __OS_Cur_Pos+0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       9
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 0 
	MOVWF       __OS_CurTask+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 0 
	MOVWF       __OS_CurTask+1 
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
L_main42:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main42
	BTFSS       __OS_State+0, 6 
	GOTO        L_main45
	BTFSC       __OS_State+0, 7 
	GOTO        L_main45
L__main46:
	GOTO        ___main__OS_SCHED_RUN
L_main45:
L_main41:
___main_SCHED_END:
	GOTO        L_main14
;MyProject.c,89 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
