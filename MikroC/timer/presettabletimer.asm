
_start:

;presettabletimer.c,13 :: 		void start(int a)
;presettabletimer.c,14 :: 		{  portc.rc0=1;
	BSF        PORTC+0, 0
;presettabletimer.c,16 :: 		for(i=a-1;i>=0;i--)
	MOVLW      1
	SUBWF      FARG_start_a+0, 0
	MOVWF      _i+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FARG_start_a+1, 0
	MOVWF      _i+1
L_start0:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start63
	MOVLW      0
	SUBWF      _i+0, 0
L__start63:
	BTFSS      STATUS+0, 0
	GOTO       L_start1
;presettabletimer.c,18 :: 		for(j=59;j>=0;j--)
	MOVLW      59
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
L_start3:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start64
	MOVLW      0
	SUBWF      _j+0, 0
L__start64:
	BTFSS      STATUS+0, 0
	GOTO       L_start4
;presettabletimer.c,22 :: 		d1=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _d1+0
	MOVF       R0+1, 0
	MOVWF      _d1+1
;presettabletimer.c,23 :: 		d2=i%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
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
;presettabletimer.c,24 :: 		d3=j/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _d3+0
	MOVF       R0+1, 0
	MOVWF      _d3+1
;presettabletimer.c,25 :: 		d4=j%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
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
;presettabletimer.c,27 :: 		for(v=0;v<50;v++){
	CLRF       _v+0
	CLRF       _v+1
L_start6:
	MOVLW      128
	XORWF      _v+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start65
	MOVLW      50
	SUBWF      _v+0, 0
L__start65:
	BTFSC      STATUS+0, 0
	GOTO       L_start7
;presettabletimer.c,28 :: 		if (!bt1 || !bt2)
	BTFSS      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__start61
	BTFSS      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__start61
	GOTO       L_start11
L__start61:
;presettabletimer.c,29 :: 		{ delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_start12:
	DECFSZ     R13+0, 1
	GOTO       L_start12
	DECFSZ     R12+0, 1
	GOTO       L_start12
	DECFSZ     R11+0, 1
	GOTO       L_start12
	NOP
	NOP
;presettabletimer.c,30 :: 		return ;}
	GOTO       L_end_start
L_start11:
;presettabletimer.c,31 :: 		portc.rc4=0;
	BCF        PORTC+0, 4
;presettabletimer.c,32 :: 		portb=seg[d1];
	MOVF       _d1+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettabletimer.c,33 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start13:
	DECFSZ     R13+0, 1
	GOTO       L_start13
	DECFSZ     R12+0, 1
	GOTO       L_start13
	NOP
;presettabletimer.c,34 :: 		portc.rc4=1;
	BSF        PORTC+0, 4
;presettabletimer.c,36 :: 		portc.rc5=0;
	BCF        PORTC+0, 5
;presettabletimer.c,37 :: 		portb=seg[d2]+0x80;
	MOVF       _d2+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVLW      128
	ADDWF      INDF+0, 0
	MOVWF      PORTB+0
;presettabletimer.c,38 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start14:
	DECFSZ     R13+0, 1
	GOTO       L_start14
	DECFSZ     R12+0, 1
	GOTO       L_start14
	NOP
;presettabletimer.c,39 :: 		portc.rc5=1;
	BSF        PORTC+0, 5
;presettabletimer.c,41 :: 		portc.rc6=0;
	BCF        PORTC+0, 6
;presettabletimer.c,42 :: 		portb=seg[d3];
	MOVF       _d3+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettabletimer.c,43 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start15:
	DECFSZ     R13+0, 1
	GOTO       L_start15
	DECFSZ     R12+0, 1
	GOTO       L_start15
	NOP
;presettabletimer.c,44 :: 		portc.rc6=1;
	BSF        PORTC+0, 6
;presettabletimer.c,46 :: 		portc.rc7=0;
	BCF        PORTC+0, 7
;presettabletimer.c,47 :: 		portb=seg[d4];
	MOVF       _d4+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettabletimer.c,48 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start16:
	DECFSZ     R13+0, 1
	GOTO       L_start16
	DECFSZ     R12+0, 1
	GOTO       L_start16
	NOP
;presettabletimer.c,49 :: 		portc.rc7=1;
	BSF        PORTC+0, 7
;presettabletimer.c,27 :: 		for(v=0;v<50;v++){
	INCF       _v+0, 1
	BTFSC      STATUS+0, 2
	INCF       _v+1, 1
;presettabletimer.c,50 :: 		}
	GOTO       L_start6
L_start7:
;presettabletimer.c,18 :: 		for(j=59;j>=0;j--)
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;presettabletimer.c,52 :: 		}
	GOTO       L_start3
L_start4:
;presettabletimer.c,16 :: 		for(i=a-1;i>=0;i--)
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;presettabletimer.c,54 :: 		}
	GOTO       L_start0
L_start1:
;presettabletimer.c,55 :: 		}
L_end_start:
	RETURN
; end of _start

_mode1:

;presettabletimer.c,56 :: 		void mode1()
;presettabletimer.c,57 :: 		{  while(1){
L_mode117:
;presettabletimer.c,58 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=0;
	BCF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__mode167
	BCF        PORTC+0, 6
	GOTO       L__mode168
L__mode167:
	BSF        PORTC+0, 6
L__mode168:
	BTFSC      PORTC+0, 6
	GOTO       L__mode169
	BCF        PORTC+0, 5
	GOTO       L__mode170
L__mode169:
	BSF        PORTC+0, 5
L__mode170:
	BTFSC      PORTC+0, 5
	GOTO       L__mode171
	BCF        PORTC+0, 4
	GOTO       L__mode172
L__mode171:
	BSF        PORTC+0, 4
L__mode172:
;presettabletimer.c,59 :: 		portb=seg[0];
	MOVF       _seg+0, 0
	MOVWF      PORTB+0
;presettabletimer.c,60 :: 		for(i=0;i<6;i++){
	CLRF       _i+0
	CLRF       _i+1
L_mode119:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mode173
	MOVLW      6
	SUBWF      _i+0, 0
L__mode173:
	BTFSC      STATUS+0, 0
	GOTO       L_mode120
;presettabletimer.c,61 :: 		if (!bt1) {
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_mode122
;presettabletimer.c,62 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
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
;presettabletimer.c,63 :: 		start(15);
	MOVLW      15
	MOVWF      FARG_start_a+0
	MOVLW      0
	MOVWF      FARG_start_a+1
	CALL       _start+0
;presettabletimer.c,64 :: 		portc.rc0=0;
	BCF        PORTC+0, 0
;presettabletimer.c,65 :: 		return;}
	GOTO       L_end_mode1
L_mode122:
;presettabletimer.c,66 :: 		else if (!bt2)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_mode125
;presettabletimer.c,68 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode126:
	DECFSZ     R13+0, 1
	GOTO       L_mode126
	DECFSZ     R12+0, 1
	GOTO       L_mode126
	DECFSZ     R11+0, 1
	GOTO       L_mode126
	NOP
	NOP
;presettabletimer.c,69 :: 		start(25);
	MOVLW      25
	MOVWF      FARG_start_a+0
	MOVLW      0
	MOVWF      FARG_start_a+1
	CALL       _start+0
;presettabletimer.c,70 :: 		portc.rc0=0;
	BCF        PORTC+0, 0
;presettabletimer.c,71 :: 		return;
	GOTO       L_end_mode1
;presettabletimer.c,72 :: 		}
L_mode125:
;presettabletimer.c,73 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_mode127:
	DECFSZ     R13+0, 1
	GOTO       L_mode127
	DECFSZ     R12+0, 1
	GOTO       L_mode127
	DECFSZ     R11+0, 1
	GOTO       L_mode127
	NOP
	NOP
;presettabletimer.c,60 :: 		for(i=0;i<6;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;presettabletimer.c,74 :: 		}
	GOTO       L_mode119
L_mode120:
;presettabletimer.c,75 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=1;
	BSF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__mode174
	BCF        PORTC+0, 6
	GOTO       L__mode175
L__mode174:
	BSF        PORTC+0, 6
L__mode175:
	BTFSC      PORTC+0, 6
	GOTO       L__mode176
	BCF        PORTC+0, 5
	GOTO       L__mode177
L__mode176:
	BSF        PORTC+0, 5
L__mode177:
	BTFSC      PORTC+0, 5
	GOTO       L__mode178
	BCF        PORTC+0, 4
	GOTO       L__mode179
L__mode178:
	BSF        PORTC+0, 4
L__mode179:
;presettabletimer.c,76 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_mode128:
	DECFSZ     R13+0, 1
	GOTO       L_mode128
	DECFSZ     R12+0, 1
	GOTO       L_mode128
	DECFSZ     R11+0, 1
	GOTO       L_mode128
	NOP
	NOP
;presettabletimer.c,77 :: 		}
	GOTO       L_mode117
;presettabletimer.c,78 :: 		}
L_end_mode1:
	RETURN
; end of _mode1

_mode2:

;presettabletimer.c,79 :: 		void mode2()
;presettabletimer.c,80 :: 		{   portc.rc7=1;
	BSF        PORTC+0, 7
;presettabletimer.c,81 :: 		while(1)
L_mode229:
;presettabletimer.c,83 :: 		if (!bt1)
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_mode231
;presettabletimer.c,85 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode232:
	DECFSZ     R13+0, 1
	GOTO       L_mode232
	DECFSZ     R12+0, 1
	GOTO       L_mode232
	DECFSZ     R11+0, 1
	GOTO       L_mode232
	NOP
	NOP
;presettabletimer.c,86 :: 		mode21();
	CALL       _mode21+0
;presettabletimer.c,87 :: 		return;
	GOTO       L_end_mode2
;presettabletimer.c,88 :: 		}
L_mode231:
;presettabletimer.c,89 :: 		else if (!bt2)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_mode234
;presettabletimer.c,91 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode235:
	DECFSZ     R13+0, 1
	GOTO       L_mode235
	DECFSZ     R12+0, 1
	GOTO       L_mode235
	DECFSZ     R11+0, 1
	GOTO       L_mode235
	NOP
	NOP
;presettabletimer.c,92 :: 		mode22();
	CALL       _mode22+0
;presettabletimer.c,93 :: 		return;
	GOTO       L_end_mode2
;presettabletimer.c,94 :: 		}
L_mode234:
;presettabletimer.c,95 :: 		}
	GOTO       L_mode229
;presettabletimer.c,96 :: 		}
L_end_mode2:
	RETURN
; end of _mode2

_mode21:

;presettabletimer.c,97 :: 		void mode21()
;presettabletimer.c,99 :: 		portc.rc6=1;
	BSF        PORTC+0, 6
;presettabletimer.c,100 :: 		portc.rc7=1;
	BSF        PORTC+0, 7
;presettabletimer.c,101 :: 		while(1)
L_mode2136:
;presettabletimer.c,103 :: 		d1=minutes/10;
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
;presettabletimer.c,104 :: 		d2=minutes%10;
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
;presettabletimer.c,107 :: 		portc.rc4=0;
	BCF        PORTC+0, 4
;presettabletimer.c,108 :: 		portb=seg[d1];
	MOVF       FLOC__mode21+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettabletimer.c,109 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_mode2138:
	DECFSZ     R13+0, 1
	GOTO       L_mode2138
	DECFSZ     R12+0, 1
	GOTO       L_mode2138
	NOP
;presettabletimer.c,110 :: 		portc.rc4=1;
	BSF        PORTC+0, 4
;presettabletimer.c,112 :: 		portc.rc5=0;
	BCF        PORTC+0, 5
;presettabletimer.c,113 :: 		portb=seg[d2];
	MOVF       _d2+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettabletimer.c,114 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_mode2139:
	DECFSZ     R13+0, 1
	GOTO       L_mode2139
	DECFSZ     R12+0, 1
	GOTO       L_mode2139
	NOP
;presettabletimer.c,115 :: 		portc.rc5=1;
	BSF        PORTC+0, 5
;presettabletimer.c,117 :: 		if (!bt1){
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_mode2140
;presettabletimer.c,118 :: 		delay_ms(200);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_mode2141:
	DECFSZ     R13+0, 1
	GOTO       L_mode2141
	DECFSZ     R12+0, 1
	GOTO       L_mode2141
	DECFSZ     R11+0, 1
	GOTO       L_mode2141
	NOP
	NOP
;presettabletimer.c,119 :: 		minutes++;}
	INCF       _minutes+0, 1
	BTFSC      STATUS+0, 2
	INCF       _minutes+1, 1
	GOTO       L_mode2142
L_mode2140:
;presettabletimer.c,120 :: 		else if (!bt2)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_mode2143
;presettabletimer.c,122 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode2144:
	DECFSZ     R13+0, 1
	GOTO       L_mode2144
	DECFSZ     R12+0, 1
	GOTO       L_mode2144
	DECFSZ     R11+0, 1
	GOTO       L_mode2144
	NOP
	NOP
;presettabletimer.c,123 :: 		start(minutes);
	MOVF       _minutes+0, 0
	MOVWF      FARG_start_a+0
	MOVF       _minutes+1, 0
	MOVWF      FARG_start_a+1
	CALL       _start+0
;presettabletimer.c,124 :: 		portc.rc0=0;
	BCF        PORTC+0, 0
;presettabletimer.c,125 :: 		minutes=0;
	CLRF       _minutes+0
	CLRF       _minutes+1
;presettabletimer.c,126 :: 		return;
	GOTO       L_end_mode21
;presettabletimer.c,127 :: 		}
L_mode2143:
L_mode2142:
;presettabletimer.c,129 :: 		}
	GOTO       L_mode2136
;presettabletimer.c,130 :: 		}
L_end_mode21:
	RETURN
; end of _mode21

_mode22:

;presettabletimer.c,131 :: 		void mode22()
;presettabletimer.c,133 :: 		portc.rc6=1;
	BSF        PORTC+0, 6
;presettabletimer.c,134 :: 		portc.rc7=1;
	BSF        PORTC+0, 7
;presettabletimer.c,135 :: 		while(1)
L_mode2245:
;presettabletimer.c,137 :: 		d1=minutes/10;
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
;presettabletimer.c,138 :: 		d2=minutes%10;
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
;presettabletimer.c,141 :: 		portc.rc4=0;
	BCF        PORTC+0, 4
;presettabletimer.c,142 :: 		portb=seg[d1];
	MOVF       FLOC__mode22+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettabletimer.c,143 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_mode2247:
	DECFSZ     R13+0, 1
	GOTO       L_mode2247
	DECFSZ     R12+0, 1
	GOTO       L_mode2247
	NOP
;presettabletimer.c,144 :: 		portc.rc4=1;
	BSF        PORTC+0, 4
;presettabletimer.c,146 :: 		portc.rc5=0;
	BCF        PORTC+0, 5
;presettabletimer.c,147 :: 		portb=seg[d2];
	MOVF       _d2+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;presettabletimer.c,148 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_mode2248:
	DECFSZ     R13+0, 1
	GOTO       L_mode2248
	DECFSZ     R12+0, 1
	GOTO       L_mode2248
	NOP
;presettabletimer.c,149 :: 		portc.rc5=1;
	BSF        PORTC+0, 5
;presettabletimer.c,151 :: 		if (!bt1){
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_mode2249
;presettabletimer.c,152 :: 		delay_ms(200);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_mode2250:
	DECFSZ     R13+0, 1
	GOTO       L_mode2250
	DECFSZ     R12+0, 1
	GOTO       L_mode2250
	DECFSZ     R11+0, 1
	GOTO       L_mode2250
	NOP
	NOP
;presettabletimer.c,153 :: 		minutes+=10;}
	MOVLW      10
	ADDWF      _minutes+0, 1
	BTFSC      STATUS+0, 0
	INCF       _minutes+1, 1
	GOTO       L_mode2251
L_mode2249:
;presettabletimer.c,154 :: 		else if (!bt2)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_mode2252
;presettabletimer.c,156 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_mode2253:
	DECFSZ     R13+0, 1
	GOTO       L_mode2253
	DECFSZ     R12+0, 1
	GOTO       L_mode2253
	DECFSZ     R11+0, 1
	GOTO       L_mode2253
	NOP
	NOP
;presettabletimer.c,157 :: 		start(minutes);
	MOVF       _minutes+0, 0
	MOVWF      FARG_start_a+0
	MOVF       _minutes+1, 0
	MOVWF      FARG_start_a+1
	CALL       _start+0
;presettabletimer.c,158 :: 		portc.rc0=0;
	BCF        PORTC+0, 0
;presettabletimer.c,159 :: 		minutes=0;
	CLRF       _minutes+0
	CLRF       _minutes+1
;presettabletimer.c,160 :: 		return;
	GOTO       L_end_mode22
;presettabletimer.c,161 :: 		}
L_mode2252:
L_mode2251:
;presettabletimer.c,163 :: 		}
	GOTO       L_mode2245
;presettabletimer.c,164 :: 		}
L_end_mode22:
	RETURN
; end of _mode22

_main:

;presettabletimer.c,166 :: 		void main() {
;presettabletimer.c,167 :: 		trisb=0;
	CLRF       TRISB+0
;presettabletimer.c,168 :: 		bt1=bt2=255;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__main84
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__main85
L__main84:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__main85:
;presettabletimer.c,169 :: 		trisc.rc0=trisc.rc4=trisc.rc5=trisc.rc6=trisc.rc7=0;
	BCF        TRISC+0, 7
	BTFSC      TRISC+0, 7
	GOTO       L__main86
	BCF        TRISC+0, 6
	GOTO       L__main87
L__main86:
	BSF        TRISC+0, 6
L__main87:
	BTFSC      TRISC+0, 6
	GOTO       L__main88
	BCF        TRISC+0, 5
	GOTO       L__main89
L__main88:
	BSF        TRISC+0, 5
L__main89:
	BTFSC      TRISC+0, 5
	GOTO       L__main90
	BCF        TRISC+0, 4
	GOTO       L__main91
L__main90:
	BSF        TRISC+0, 4
L__main91:
	BTFSC      TRISC+0, 4
	GOTO       L__main92
	BCF        TRISC+0, 0
	GOTO       L__main93
L__main92:
	BSF        TRISC+0, 0
L__main93:
;presettabletimer.c,170 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=1;
	BSF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__main94
	BCF        PORTC+0, 6
	GOTO       L__main95
L__main94:
	BSF        PORTC+0, 6
L__main95:
	BTFSC      PORTC+0, 6
	GOTO       L__main96
	BCF        PORTC+0, 5
	GOTO       L__main97
L__main96:
	BSF        PORTC+0, 5
L__main97:
	BTFSC      PORTC+0, 5
	GOTO       L__main98
	BCF        PORTC+0, 4
	GOTO       L__main99
L__main98:
	BSF        PORTC+0, 4
L__main99:
;presettabletimer.c,171 :: 		while(1)
L_main54:
;presettabletimer.c,173 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=0;
	BCF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__main100
	BCF        PORTC+0, 6
	GOTO       L__main101
L__main100:
	BSF        PORTC+0, 6
L__main101:
	BTFSC      PORTC+0, 6
	GOTO       L__main102
	BCF        PORTC+0, 5
	GOTO       L__main103
L__main102:
	BSF        PORTC+0, 5
L__main103:
	BTFSC      PORTC+0, 5
	GOTO       L__main104
	BCF        PORTC+0, 4
	GOTO       L__main105
L__main104:
	BSF        PORTC+0, 4
L__main105:
;presettabletimer.c,174 :: 		portb=seg[0];
	MOVF       _seg+0, 0
	MOVWF      PORTB+0
;presettabletimer.c,175 :: 		if(!bt1) {
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_main56
;presettabletimer.c,176 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main57:
	DECFSZ     R13+0, 1
	GOTO       L_main57
	DECFSZ     R12+0, 1
	GOTO       L_main57
	DECFSZ     R11+0, 1
	GOTO       L_main57
	NOP
	NOP
;presettabletimer.c,177 :: 		mode1();}
	CALL       _mode1+0
	GOTO       L_main58
L_main56:
;presettabletimer.c,178 :: 		else if (!bt2)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_main59
;presettabletimer.c,180 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main60:
	DECFSZ     R13+0, 1
	GOTO       L_main60
	DECFSZ     R12+0, 1
	GOTO       L_main60
	DECFSZ     R11+0, 1
	GOTO       L_main60
	NOP
	NOP
;presettabletimer.c,181 :: 		mode2();}
	CALL       _mode2+0
L_main59:
L_main58:
;presettabletimer.c,182 :: 		}
	GOTO       L_main54
;presettabletimer.c,183 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
