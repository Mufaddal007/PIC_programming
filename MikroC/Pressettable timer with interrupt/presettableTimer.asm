
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;presettableTimer.c,16 :: 		void Interrupt(){
;presettableTimer.c,17 :: 		if (TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrupt0
;presettableTimer.c,18 :: 		TMR0IF_bit	 = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;presettableTimer.c,19 :: 		TMR0 = 61;
	MOVLW      61
	MOVWF      TMR0+0
;presettableTimer.c,20 :: 		seconds-=1;
	MOVLW      1
	SUBWF      _seconds+0, 1
	BTFSS      STATUS+0, 0
	DECF       _seconds+1, 1
;presettableTimer.c,21 :: 		if(seconds==-1) minutes-=1;
	MOVLW      255
	XORWF      _seconds+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt59
	MOVLW      255
	XORWF      _seconds+0, 0
L__Interrupt59:
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt1
	MOVLW      1
	SUBWF      _minutes+0, 1
	BTFSS      STATUS+0, 0
	DECF       _minutes+1, 1
L_Interrupt1:
;presettableTimer.c,22 :: 		}
L_Interrupt0:
;presettableTimer.c,23 :: 		}
L_end_Interrupt:
L__Interrupt58:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_start:

;presettableTimer.c,24 :: 		void start(int a)
;presettableTimer.c,25 :: 		{  portc.rc0=1;
	BSF        PORTC+0, 0
;presettableTimer.c,26 :: 		minutes=a-1;
	MOVLW      1
	SUBWF      FARG_start_a+0, 0
	MOVWF      _minutes+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FARG_start_a+1, 0
	MOVWF      _minutes+1
;presettableTimer.c,27 :: 		seconds=60;
	MOVLW      60
	MOVWF      _seconds+0
	MOVLW      0
	MOVWF      _seconds+1
;presettableTimer.c,28 :: 		OPTION_REG	 = 0x87;
	MOVLW      135
	MOVWF      OPTION_REG+0
;presettableTimer.c,29 :: 		TMR0		 = 61;
	MOVLW      61
	MOVWF      TMR0+0
;presettableTimer.c,30 :: 		TMR0IE_bit=1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;presettableTimer.c,31 :: 		while(minutes>=0){
L_start2:
	MOVLW      128
	XORWF      _minutes+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start61
	MOVLW      0
	SUBWF      _minutes+0, 0
L__start61:
	BTFSS      STATUS+0, 0
	GOTO       L_start3
;presettableTimer.c,32 :: 		d1=minutes/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	MOVF       _minutes+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _d1+0
	MOVF       R0+1, 0
	MOVWF      _d1+1
;presettableTimer.c,33 :: 		d2=minutes%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	MOVF       _minutes+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _d2+0
	MOVF       R0+1, 0
	MOVWF      _d2+1
;presettableTimer.c,34 :: 		d3=seconds/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	MOVF       _seconds+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _d3+0
	MOVF       R0+1, 0
	MOVWF      _d3+1
;presettableTimer.c,35 :: 		d4=seconds%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _seconds+0, 0
	MOVWF      R0+0
	MOVF       _seconds+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _d4+0
	MOVF       R0+1, 0
	MOVWF      _d4+1
;presettableTimer.c,36 :: 		if (!bt1 || !bt2)
	BTFSS      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__start56
	BTFSS      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__start56
	GOTO       L_start6
L__start56:
;presettableTimer.c,37 :: 		{ delay_ms(300);  return ;}
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_start7:
	DECFSZ     R13+0, 1
	GOTO       L_start7
	DECFSZ     R12+0, 1
	GOTO       L_start7
	DECFSZ     R11+0, 1
	GOTO       L_start7
	NOP
	NOP
	GOTO       L_end_start
L_start6:
;presettableTimer.c,39 :: 		portc.rc4=0;
	BCF        PORTC+0, 4
;presettableTimer.c,40 :: 		portb=seg[d1];
	MOVF       _d1+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettableTimer.c,41 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start8:
	DECFSZ     R13+0, 1
	GOTO       L_start8
	DECFSZ     R12+0, 1
	GOTO       L_start8
	NOP
;presettableTimer.c,42 :: 		portc.rc4=1;
	BSF        PORTC+0, 4
;presettableTimer.c,44 :: 		portc.rc5=0;
	BCF        PORTC+0, 5
;presettableTimer.c,45 :: 		portb=seg[d2]+0x80;
	MOVF       _d2+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVLW      128
	ADDWF      INDF+0, 0
	MOVWF      PORTB+0
;presettableTimer.c,46 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start9:
	DECFSZ     R13+0, 1
	GOTO       L_start9
	DECFSZ     R12+0, 1
	GOTO       L_start9
	NOP
;presettableTimer.c,47 :: 		portc.rc5=1;
	BSF        PORTC+0, 5
;presettableTimer.c,49 :: 		portc.rc6=0;
	BCF        PORTC+0, 6
;presettableTimer.c,50 :: 		portb=seg[d3];
	MOVF       _d3+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettableTimer.c,51 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start10:
	DECFSZ     R13+0, 1
	GOTO       L_start10
	DECFSZ     R12+0, 1
	GOTO       L_start10
	NOP
;presettableTimer.c,52 :: 		portc.rc6=1;
	BSF        PORTC+0, 6
;presettableTimer.c,54 :: 		portc.rc7=0;
	BCF        PORTC+0, 7
;presettableTimer.c,55 :: 		portb=seg[d4];
	MOVF       _d4+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettableTimer.c,56 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start11:
	DECFSZ     R13+0, 1
	GOTO       L_start11
	DECFSZ     R12+0, 1
	GOTO       L_start11
	NOP
;presettableTimer.c,57 :: 		portc.rc7=1;
	BSF        PORTC+0, 7
;presettableTimer.c,59 :: 		}
	GOTO       L_start2
L_start3:
;presettableTimer.c,60 :: 		stop();
	CALL       _stop+0
;presettableTimer.c,62 :: 		}
L_end_start:
	RETURN
; end of _start

_stop:

;presettableTimer.c,63 :: 		void stop()
;presettableTimer.c,65 :: 		OPTION_REG	 = 0x87;
	MOVLW      135
	MOVWF      OPTION_REG+0
;presettableTimer.c,66 :: 		TMR0		 = 0;
	CLRF       TMR0+0
;presettableTimer.c,67 :: 		portc.rc0=0;
	BCF        PORTC+0, 0
;presettableTimer.c,68 :: 		TMR0IE_bit=0;
	BCF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;presettableTimer.c,69 :: 		}
L_end_stop:
	RETURN
; end of _stop

_mode1:

;presettableTimer.c,70 :: 		void mode1()
;presettableTimer.c,71 :: 		{  while(1){
L_mode112:
;presettableTimer.c,72 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=0;
	BCF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__mode164
	BCF        PORTC+0, 6
	GOTO       L__mode165
L__mode164:
	BSF        PORTC+0, 6
L__mode165:
	BTFSC      PORTC+0, 6
	GOTO       L__mode166
	BCF        PORTC+0, 5
	GOTO       L__mode167
L__mode166:
	BSF        PORTC+0, 5
L__mode167:
	BTFSC      PORTC+0, 5
	GOTO       L__mode168
	BCF        PORTC+0, 4
	GOTO       L__mode169
L__mode168:
	BSF        PORTC+0, 4
L__mode169:
;presettableTimer.c,73 :: 		portb=seg[0];
	MOVF       _seg+0, 0
	MOVWF      PORTB+0
;presettableTimer.c,74 :: 		for(i=0;i<6;i++){
	CLRF       _i+0
	CLRF       _i+1
L_mode114:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mode170
	MOVLW      6
	SUBWF      _i+0, 0
L__mode170:
	BTFSC      STATUS+0, 0
	GOTO       L_mode115
;presettableTimer.c,75 :: 		if (!bt1) {
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_mode117
;presettableTimer.c,76 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode118:
	DECFSZ     R13+0, 1
	GOTO       L_mode118
	DECFSZ     R12+0, 1
	GOTO       L_mode118
	DECFSZ     R11+0, 1
	GOTO       L_mode118
	NOP
	NOP
;presettableTimer.c,77 :: 		start(15);
	MOVLW      15
	MOVWF      FARG_start_a+0
	MOVLW      0
	MOVWF      FARG_start_a+1
	CALL       _start+0
;presettableTimer.c,78 :: 		portc.rc0=0;
	BCF        PORTC+0, 0
;presettableTimer.c,79 :: 		return;}
	GOTO       L_end_mode1
L_mode117:
;presettableTimer.c,80 :: 		else if (!bt2)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_mode120
;presettableTimer.c,82 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode121:
	DECFSZ     R13+0, 1
	GOTO       L_mode121
	DECFSZ     R12+0, 1
	GOTO       L_mode121
	DECFSZ     R11+0, 1
	GOTO       L_mode121
	NOP
	NOP
;presettableTimer.c,83 :: 		start(25);
	MOVLW      25
	MOVWF      FARG_start_a+0
	MOVLW      0
	MOVWF      FARG_start_a+1
	CALL       _start+0
;presettableTimer.c,84 :: 		stop();
	CALL       _stop+0
;presettableTimer.c,86 :: 		return;
	GOTO       L_end_mode1
;presettableTimer.c,87 :: 		}
L_mode120:
;presettableTimer.c,88 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_mode122:
	DECFSZ     R13+0, 1
	GOTO       L_mode122
	DECFSZ     R12+0, 1
	GOTO       L_mode122
	DECFSZ     R11+0, 1
	GOTO       L_mode122
	NOP
	NOP
;presettableTimer.c,74 :: 		for(i=0;i<6;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;presettableTimer.c,89 :: 		}
	GOTO       L_mode114
L_mode115:
;presettableTimer.c,90 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=1;
	BSF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__mode171
	BCF        PORTC+0, 6
	GOTO       L__mode172
L__mode171:
	BSF        PORTC+0, 6
L__mode172:
	BTFSC      PORTC+0, 6
	GOTO       L__mode173
	BCF        PORTC+0, 5
	GOTO       L__mode174
L__mode173:
	BSF        PORTC+0, 5
L__mode174:
	BTFSC      PORTC+0, 5
	GOTO       L__mode175
	BCF        PORTC+0, 4
	GOTO       L__mode176
L__mode175:
	BSF        PORTC+0, 4
L__mode176:
;presettableTimer.c,91 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_mode123:
	DECFSZ     R13+0, 1
	GOTO       L_mode123
	DECFSZ     R12+0, 1
	GOTO       L_mode123
	DECFSZ     R11+0, 1
	GOTO       L_mode123
	NOP
	NOP
;presettableTimer.c,92 :: 		}
	GOTO       L_mode112
;presettableTimer.c,93 :: 		}
L_end_mode1:
	RETURN
; end of _mode1

_mode2:

;presettableTimer.c,94 :: 		void mode2()
;presettableTimer.c,95 :: 		{   portc.rc7=1;
	BSF        PORTC+0, 7
;presettableTimer.c,96 :: 		while(1)
L_mode224:
;presettableTimer.c,98 :: 		if (!bt1)
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_mode226
;presettableTimer.c,100 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode227:
	DECFSZ     R13+0, 1
	GOTO       L_mode227
	DECFSZ     R12+0, 1
	GOTO       L_mode227
	DECFSZ     R11+0, 1
	GOTO       L_mode227
	NOP
	NOP
;presettableTimer.c,101 :: 		mode21();
	CALL       _mode21+0
;presettableTimer.c,102 :: 		return;
	GOTO       L_end_mode2
;presettableTimer.c,103 :: 		}
L_mode226:
;presettableTimer.c,104 :: 		else if (!bt2)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_mode229
;presettableTimer.c,106 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode230:
	DECFSZ     R13+0, 1
	GOTO       L_mode230
	DECFSZ     R12+0, 1
	GOTO       L_mode230
	DECFSZ     R11+0, 1
	GOTO       L_mode230
	NOP
	NOP
;presettableTimer.c,107 :: 		mode22();
	CALL       _mode22+0
;presettableTimer.c,108 :: 		return;
	GOTO       L_end_mode2
;presettableTimer.c,109 :: 		}
L_mode229:
;presettableTimer.c,110 :: 		}
	GOTO       L_mode224
;presettableTimer.c,111 :: 		}
L_end_mode2:
	RETURN
; end of _mode2

_mode21:

;presettableTimer.c,112 :: 		void mode21()
;presettableTimer.c,114 :: 		portc.rc6=1;
	BSF        PORTC+0, 6
;presettableTimer.c,115 :: 		portc.rc7=1;
	BSF        PORTC+0, 7
;presettableTimer.c,116 :: 		while(1)
L_mode2131:
;presettableTimer.c,118 :: 		d1=minutes/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	MOVF       _minutes+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__mode21+0
	MOVF       R0+1, 0
	MOVWF      FLOC__mode21+1
	MOVF       FLOC__mode21+0, 0
	MOVWF      _d1+0
	MOVF       FLOC__mode21+1, 0
	MOVWF      _d1+1
;presettableTimer.c,119 :: 		d2=minutes%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	MOVF       _minutes+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _d2+0
	MOVF       R0+1, 0
	MOVWF      _d2+1
;presettableTimer.c,122 :: 		portc.rc4=0;
	BCF        PORTC+0, 4
;presettableTimer.c,123 :: 		portb=seg[d1];
	MOVF       FLOC__mode21+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettableTimer.c,124 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_mode2133:
	DECFSZ     R13+0, 1
	GOTO       L_mode2133
	DECFSZ     R12+0, 1
	GOTO       L_mode2133
	NOP
;presettableTimer.c,125 :: 		portc.rc4=1;
	BSF        PORTC+0, 4
;presettableTimer.c,127 :: 		portc.rc5=0;
	BCF        PORTC+0, 5
;presettableTimer.c,128 :: 		portb=seg[d2];
	MOVF       _d2+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettableTimer.c,129 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_mode2134:
	DECFSZ     R13+0, 1
	GOTO       L_mode2134
	DECFSZ     R12+0, 1
	GOTO       L_mode2134
	NOP
;presettableTimer.c,130 :: 		portc.rc5=1;
	BSF        PORTC+0, 5
;presettableTimer.c,132 :: 		if (!bt1){
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_mode2135
;presettableTimer.c,133 :: 		delay_ms(200);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_mode2136:
	DECFSZ     R13+0, 1
	GOTO       L_mode2136
	DECFSZ     R12+0, 1
	GOTO       L_mode2136
	DECFSZ     R11+0, 1
	GOTO       L_mode2136
	NOP
	NOP
;presettableTimer.c,134 :: 		minutes++;}
	INCF       _minutes+0, 1
	BTFSC      STATUS+0, 2
	INCF       _minutes+1, 1
	GOTO       L_mode2137
L_mode2135:
;presettableTimer.c,135 :: 		else if (!bt2)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_mode2138
;presettableTimer.c,137 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode2139:
	DECFSZ     R13+0, 1
	GOTO       L_mode2139
	DECFSZ     R12+0, 1
	GOTO       L_mode2139
	DECFSZ     R11+0, 1
	GOTO       L_mode2139
	NOP
	NOP
;presettableTimer.c,138 :: 		start(minutes);
	MOVF       _minutes+0, 0
	MOVWF      FARG_start_a+0
	MOVF       _minutes+1, 0
	MOVWF      FARG_start_a+1
	CALL       _start+0
;presettableTimer.c,139 :: 		portc.rc0=0;
	BCF        PORTC+0, 0
;presettableTimer.c,140 :: 		minutes=0;
	CLRF       _minutes+0
	CLRF       _minutes+1
;presettableTimer.c,141 :: 		return;
	GOTO       L_end_mode21
;presettableTimer.c,142 :: 		}
L_mode2138:
L_mode2137:
;presettableTimer.c,144 :: 		}
	GOTO       L_mode2131
;presettableTimer.c,145 :: 		}
L_end_mode21:
	RETURN
; end of _mode21

_mode22:

;presettableTimer.c,146 :: 		void mode22()
;presettableTimer.c,148 :: 		portc.rc6=1;
	BSF        PORTC+0, 6
;presettableTimer.c,149 :: 		portc.rc7=1;
	BSF        PORTC+0, 7
;presettableTimer.c,150 :: 		while(1)
L_mode2240:
;presettableTimer.c,152 :: 		d1=minutes/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	MOVF       _minutes+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__mode22+0
	MOVF       R0+1, 0
	MOVWF      FLOC__mode22+1
	MOVF       FLOC__mode22+0, 0
	MOVWF      _d1+0
	MOVF       FLOC__mode22+1, 0
	MOVWF      _d1+1
;presettableTimer.c,153 :: 		d2=minutes%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _minutes+0, 0
	MOVWF      R0+0
	MOVF       _minutes+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _d2+0
	MOVF       R0+1, 0
	MOVWF      _d2+1
;presettableTimer.c,156 :: 		portc.rc4=0;
	BCF        PORTC+0, 4
;presettableTimer.c,157 :: 		portb=seg[d1];
	MOVF       FLOC__mode22+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettableTimer.c,158 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_mode2242:
	DECFSZ     R13+0, 1
	GOTO       L_mode2242
	DECFSZ     R12+0, 1
	GOTO       L_mode2242
	NOP
;presettableTimer.c,159 :: 		portc.rc4=1;
	BSF        PORTC+0, 4
;presettableTimer.c,161 :: 		portc.rc5=0;
	BCF        PORTC+0, 5
;presettableTimer.c,162 :: 		portb=seg[d2];
	MOVF       _d2+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettableTimer.c,163 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_mode2243:
	DECFSZ     R13+0, 1
	GOTO       L_mode2243
	DECFSZ     R12+0, 1
	GOTO       L_mode2243
	NOP
;presettableTimer.c,164 :: 		portc.rc5=1;
	BSF        PORTC+0, 5
;presettableTimer.c,166 :: 		if (!bt1){
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_mode2244
;presettableTimer.c,167 :: 		delay_ms(200);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_mode2245:
	DECFSZ     R13+0, 1
	GOTO       L_mode2245
	DECFSZ     R12+0, 1
	GOTO       L_mode2245
	DECFSZ     R11+0, 1
	GOTO       L_mode2245
	NOP
	NOP
;presettableTimer.c,168 :: 		minutes+=10;}
	MOVLW      10
	ADDWF      _minutes+0, 1
	BTFSC      STATUS+0, 0
	INCF       _minutes+1, 1
	GOTO       L_mode2246
L_mode2244:
;presettableTimer.c,169 :: 		else if (!bt2)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_mode2247
;presettableTimer.c,171 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode2248:
	DECFSZ     R13+0, 1
	GOTO       L_mode2248
	DECFSZ     R12+0, 1
	GOTO       L_mode2248
	DECFSZ     R11+0, 1
	GOTO       L_mode2248
	NOP
	NOP
;presettableTimer.c,172 :: 		start(minutes);
	MOVF       _minutes+0, 0
	MOVWF      FARG_start_a+0
	MOVF       _minutes+1, 0
	MOVWF      FARG_start_a+1
	CALL       _start+0
;presettableTimer.c,173 :: 		portc.rc0=0;
	BCF        PORTC+0, 0
;presettableTimer.c,174 :: 		minutes=0;
	CLRF       _minutes+0
	CLRF       _minutes+1
;presettableTimer.c,175 :: 		return;
	GOTO       L_end_mode22
;presettableTimer.c,176 :: 		}
L_mode2247:
L_mode2246:
;presettableTimer.c,178 :: 		}
	GOTO       L_mode2240
;presettableTimer.c,179 :: 		}
L_end_mode22:
	RETURN
; end of _mode22

_main:

;presettableTimer.c,181 :: 		void main() {
;presettableTimer.c,182 :: 		trisb=0;
	CLRF       TRISB+0
;presettableTimer.c,183 :: 		bt1=bt2=255;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__main81
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__main82
L__main81:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__main82:
;presettableTimer.c,185 :: 		OPTION_REG	 = 0x87;
	MOVLW      135
	MOVWF      OPTION_REG+0
;presettableTimer.c,186 :: 		TMR0		 = 0;
	CLRF       TMR0+0
;presettableTimer.c,187 :: 		INTCON	 = 0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;presettableTimer.c,188 :: 		trisc.rc0=trisc.rc4=trisc.rc5=trisc.rc6=trisc.rc7=0;
	BCF        TRISC+0, 7
	BTFSC      TRISC+0, 7
	GOTO       L__main83
	BCF        TRISC+0, 6
	GOTO       L__main84
L__main83:
	BSF        TRISC+0, 6
L__main84:
	BTFSC      TRISC+0, 6
	GOTO       L__main85
	BCF        TRISC+0, 5
	GOTO       L__main86
L__main85:
	BSF        TRISC+0, 5
L__main86:
	BTFSC      TRISC+0, 5
	GOTO       L__main87
	BCF        TRISC+0, 4
	GOTO       L__main88
L__main87:
	BSF        TRISC+0, 4
L__main88:
	BTFSC      TRISC+0, 4
	GOTO       L__main89
	BCF        TRISC+0, 0
	GOTO       L__main90
L__main89:
	BSF        TRISC+0, 0
L__main90:
;presettableTimer.c,189 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=1;
	BSF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__main91
	BCF        PORTC+0, 6
	GOTO       L__main92
L__main91:
	BSF        PORTC+0, 6
L__main92:
	BTFSC      PORTC+0, 6
	GOTO       L__main93
	BCF        PORTC+0, 5
	GOTO       L__main94
L__main93:
	BSF        PORTC+0, 5
L__main94:
	BTFSC      PORTC+0, 5
	GOTO       L__main95
	BCF        PORTC+0, 4
	GOTO       L__main96
L__main95:
	BSF        PORTC+0, 4
L__main96:
;presettableTimer.c,190 :: 		while(1)
L_main49:
;presettableTimer.c,192 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=0;
	BCF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__main97
	BCF        PORTC+0, 6
	GOTO       L__main98
L__main97:
	BSF        PORTC+0, 6
L__main98:
	BTFSC      PORTC+0, 6
	GOTO       L__main99
	BCF        PORTC+0, 5
	GOTO       L__main100
L__main99:
	BSF        PORTC+0, 5
L__main100:
	BTFSC      PORTC+0, 5
	GOTO       L__main101
	BCF        PORTC+0, 4
	GOTO       L__main102
L__main101:
	BSF        PORTC+0, 4
L__main102:
;presettableTimer.c,193 :: 		portb=seg[0];
	MOVF       _seg+0, 0
	MOVWF      PORTB+0
;presettableTimer.c,194 :: 		if(!bt1) {
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_main51
;presettableTimer.c,195 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main52:
	DECFSZ     R13+0, 1
	GOTO       L_main52
	DECFSZ     R12+0, 1
	GOTO       L_main52
	DECFSZ     R11+0, 1
	GOTO       L_main52
	NOP
	NOP
;presettableTimer.c,196 :: 		mode1();}
	CALL       _mode1+0
	GOTO       L_main53
L_main51:
;presettableTimer.c,197 :: 		else if (!bt2)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_main54
;presettableTimer.c,199 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main55:
	DECFSZ     R13+0, 1
	GOTO       L_main55
	DECFSZ     R12+0, 1
	GOTO       L_main55
	DECFSZ     R11+0, 1
	GOTO       L_main55
	NOP
	NOP
;presettableTimer.c,200 :: 		mode2();}
	CALL       _mode2+0
L_main54:
L_main53:
;presettableTimer.c,201 :: 		}
	GOTO       L_main49
;presettableTimer.c,202 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
