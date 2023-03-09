
_main:

;buzzertest.c,2 :: 		void main(){
;buzzertest.c,4 :: 		int notes[25]={262,262,294,262,349,330,262,262,294,262,392,349,262,262,524,440,349,330,294,466,466,440,349,392,349};
	MOVLW      6
	MOVWF      main_notes_L0+0
	MOVLW      1
	MOVWF      main_notes_L0+1
	MOVLW      6
	MOVWF      main_notes_L0+2
	MOVLW      1
	MOVWF      main_notes_L0+3
	MOVLW      38
	MOVWF      main_notes_L0+4
	MOVLW      1
	MOVWF      main_notes_L0+5
	MOVLW      6
	MOVWF      main_notes_L0+6
	MOVLW      1
	MOVWF      main_notes_L0+7
	MOVLW      93
	MOVWF      main_notes_L0+8
	MOVLW      1
	MOVWF      main_notes_L0+9
	MOVLW      74
	MOVWF      main_notes_L0+10
	MOVLW      1
	MOVWF      main_notes_L0+11
	MOVLW      6
	MOVWF      main_notes_L0+12
	MOVLW      1
	MOVWF      main_notes_L0+13
	MOVLW      6
	MOVWF      main_notes_L0+14
	MOVLW      1
	MOVWF      main_notes_L0+15
	MOVLW      38
	MOVWF      main_notes_L0+16
	MOVLW      1
	MOVWF      main_notes_L0+17
	MOVLW      6
	MOVWF      main_notes_L0+18
	MOVLW      1
	MOVWF      main_notes_L0+19
	MOVLW      136
	MOVWF      main_notes_L0+20
	MOVLW      1
	MOVWF      main_notes_L0+21
	MOVLW      93
	MOVWF      main_notes_L0+22
	MOVLW      1
	MOVWF      main_notes_L0+23
	MOVLW      6
	MOVWF      main_notes_L0+24
	MOVLW      1
	MOVWF      main_notes_L0+25
	MOVLW      6
	MOVWF      main_notes_L0+26
	MOVLW      1
	MOVWF      main_notes_L0+27
	MOVLW      12
	MOVWF      main_notes_L0+28
	MOVLW      2
	MOVWF      main_notes_L0+29
	MOVLW      184
	MOVWF      main_notes_L0+30
	MOVLW      1
	MOVWF      main_notes_L0+31
	MOVLW      93
	MOVWF      main_notes_L0+32
	MOVLW      1
	MOVWF      main_notes_L0+33
	MOVLW      74
	MOVWF      main_notes_L0+34
	MOVLW      1
	MOVWF      main_notes_L0+35
	MOVLW      38
	MOVWF      main_notes_L0+36
	MOVLW      1
	MOVWF      main_notes_L0+37
	MOVLW      210
	MOVWF      main_notes_L0+38
	MOVLW      1
	MOVWF      main_notes_L0+39
	MOVLW      210
	MOVWF      main_notes_L0+40
	MOVLW      1
	MOVWF      main_notes_L0+41
	MOVLW      184
	MOVWF      main_notes_L0+42
	MOVLW      1
	MOVWF      main_notes_L0+43
	MOVLW      93
	MOVWF      main_notes_L0+44
	MOVLW      1
	MOVWF      main_notes_L0+45
	MOVLW      136
	MOVWF      main_notes_L0+46
	MOVLW      1
	MOVWF      main_notes_L0+47
	MOVLW      93
	MOVWF      main_notes_L0+48
	MOVLW      1
	MOVWF      main_notes_L0+49
	MOVLW      1
	MOVWF      main_notes_duration_L0+0
	MOVLW      1
	MOVWF      main_notes_duration_L0+1
	MOVLW      2
	MOVWF      main_notes_duration_L0+2
	MOVLW      2
	MOVWF      main_notes_duration_L0+3
	MOVLW      2
	MOVWF      main_notes_duration_L0+4
	MOVLW      3
	MOVWF      main_notes_duration_L0+5
	MOVLW      1
	MOVWF      main_notes_duration_L0+6
	MOVLW      1
	MOVWF      main_notes_duration_L0+7
	MOVLW      2
	MOVWF      main_notes_duration_L0+8
	MOVLW      2
	MOVWF      main_notes_duration_L0+9
	MOVLW      2
	MOVWF      main_notes_duration_L0+10
	MOVLW      3
	MOVWF      main_notes_duration_L0+11
	MOVLW      1
	MOVWF      main_notes_duration_L0+12
	MOVLW      1
	MOVWF      main_notes_duration_L0+13
	MOVLW      2
	MOVWF      main_notes_duration_L0+14
	MOVLW      2
	MOVWF      main_notes_duration_L0+15
	MOVLW      2
	MOVWF      main_notes_duration_L0+16
	MOVLW      2
	MOVWF      main_notes_duration_L0+17
	MOVLW      2
	MOVWF      main_notes_duration_L0+18
	MOVLW      1
	MOVWF      main_notes_duration_L0+19
	MOVLW      1
	MOVWF      main_notes_duration_L0+20
	MOVLW      2
	MOVWF      main_notes_duration_L0+21
	MOVLW      2
	MOVWF      main_notes_duration_L0+22
	MOVLW      2
	MOVWF      main_notes_duration_L0+23
	MOVLW      3
	MOVWF      main_notes_duration_L0+24
;buzzertest.c,6 :: 		TRISB=0;
	CLRF       TRISB+0
;buzzertest.c,7 :: 		Sound_Init(&PORTC, 2);
	MOVLW      PORTC+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      2
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;buzzertest.c,8 :: 		while(1)
L_main0:
;buzzertest.c,10 :: 		for (i=0;i<notesi;i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main2:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _notesi+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       _notesi+0, 0
	SUBWF      main_i_L0+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;buzzertest.c,11 :: 		Sound_Play(notes[i], 400*notes_duration[i]);
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_notes_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVF       main_i_L0+0, 0
	ADDLW      main_notes_duration_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      144
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVF       R0+1, 0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;buzzertest.c,12 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;buzzertest.c,10 :: 		for (i=0;i<notesi;i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;buzzertest.c,14 :: 		}
	GOTO       L_main2
L_main3:
;buzzertest.c,15 :: 		delay_ms(3000);
	MOVLW      77
	MOVWF      R11+0
	MOVLW      25
	MOVWF      R12+0
	MOVLW      79
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;buzzertest.c,17 :: 		}
	GOTO       L_main0
;buzzertest.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
