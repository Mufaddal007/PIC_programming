
_buttonread:

;timercheck.c,4 :: 		void buttonread()
;timercheck.c,6 :: 		while(1){
L_buttonread0:
;timercheck.c,8 :: 		portc.rc0=0;
	BCF        PORTC+0, 0
;timercheck.c,9 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=0;
	BCF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__buttonread33
	BCF        PORTC+0, 6
	GOTO       L__buttonread34
L__buttonread33:
	BSF        PORTC+0, 6
L__buttonread34:
	BTFSC      PORTC+0, 6
	GOTO       L__buttonread35
	BCF        PORTC+0, 5
	GOTO       L__buttonread36
L__buttonread35:
	BSF        PORTC+0, 5
L__buttonread36:
	BTFSC      PORTC+0, 5
	GOTO       L__buttonread37
	BCF        PORTC+0, 4
	GOTO       L__buttonread38
L__buttonread37:
	BSF        PORTC+0, 4
L__buttonread38:
;timercheck.c,10 :: 		for(i=0;i<6;i++)
	CLRF       _i+0
	CLRF       _i+1
L_buttonread2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buttonread39
	MOVLW      6
	SUBWF      _i+0, 0
L__buttonread39:
	BTFSC      STATUS+0, 0
	GOTO       L_buttonread3
;timercheck.c,12 :: 		if (!portc.rc2)
	BTFSC      PORTC+0, 2
	GOTO       L_buttonread5
;timercheck.c,13 :: 		{ delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_buttonread6:
	DECFSZ     R13+0, 1
	GOTO       L_buttonread6
	DECFSZ     R12+0, 1
	GOTO       L_buttonread6
	DECFSZ     R11+0, 1
	GOTO       L_buttonread6
	NOP
;timercheck.c,14 :: 		start(14);
	MOVLW      14
	MOVWF      FARG_start_a+0
	MOVLW      0
	MOVWF      FARG_start_a+1
	CALL       _start+0
;timercheck.c,15 :: 		}
	GOTO       L_buttonread7
L_buttonread5:
;timercheck.c,16 :: 		else if (!portc.rc3)
	BTFSC      PORTC+0, 3
	GOTO       L_buttonread8
;timercheck.c,17 :: 		{ delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_buttonread9:
	DECFSZ     R13+0, 1
	GOTO       L_buttonread9
	DECFSZ     R12+0, 1
	GOTO       L_buttonread9
	DECFSZ     R11+0, 1
	GOTO       L_buttonread9
	NOP
;timercheck.c,18 :: 		start(24);
	MOVLW      24
	MOVWF      FARG_start_a+0
	MOVLW      0
	MOVWF      FARG_start_a+1
	CALL       _start+0
;timercheck.c,19 :: 		}
L_buttonread8:
L_buttonread7:
;timercheck.c,21 :: 		portb=seg[0]  ;
	MOVF       _seg+0, 0
	MOVWF      PORTB+0
;timercheck.c,22 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_buttonread10:
	DECFSZ     R13+0, 1
	GOTO       L_buttonread10
	DECFSZ     R12+0, 1
	GOTO       L_buttonread10
	DECFSZ     R11+0, 1
	GOTO       L_buttonread10
	NOP
	NOP
;timercheck.c,10 :: 		for(i=0;i<6;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;timercheck.c,23 :: 		}
	GOTO       L_buttonread2
L_buttonread3:
;timercheck.c,25 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=1;
	BSF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__buttonread40
	BCF        PORTC+0, 6
	GOTO       L__buttonread41
L__buttonread40:
	BSF        PORTC+0, 6
L__buttonread41:
	BTFSC      PORTC+0, 6
	GOTO       L__buttonread42
	BCF        PORTC+0, 5
	GOTO       L__buttonread43
L__buttonread42:
	BSF        PORTC+0, 5
L__buttonread43:
	BTFSC      PORTC+0, 5
	GOTO       L__buttonread44
	BCF        PORTC+0, 4
	GOTO       L__buttonread45
L__buttonread44:
	BSF        PORTC+0, 4
L__buttonread45:
;timercheck.c,26 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_buttonread11:
	DECFSZ     R13+0, 1
	GOTO       L_buttonread11
	DECFSZ     R12+0, 1
	GOTO       L_buttonread11
	DECFSZ     R11+0, 1
	GOTO       L_buttonread11
	NOP
	NOP
;timercheck.c,28 :: 		}
	GOTO       L_buttonread0
;timercheck.c,29 :: 		}
L_end_buttonread:
	RETURN
; end of _buttonread

_start:

;timercheck.c,31 :: 		void start(int a)
;timercheck.c,32 :: 		{  portc.rc0=1;
	BSF        PORTC+0, 0
;timercheck.c,34 :: 		for(i=a;i>=0;i--)
	MOVF       FARG_start_a+0, 0
	MOVWF      _i+0
	MOVF       FARG_start_a+1, 0
	MOVWF      _i+1
L_start12:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start47
	MOVLW      0
	SUBWF      _i+0, 0
L__start47:
	BTFSS      STATUS+0, 0
	GOTO       L_start13
;timercheck.c,36 :: 		for(j=59;j>=0;j--)
	MOVLW      59
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
L_start15:
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start48
	MOVLW      0
	SUBWF      _j+0, 0
L__start48:
	BTFSS      STATUS+0, 0
	GOTO       L_start16
;timercheck.c,40 :: 		d1=i/10;
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
;timercheck.c,41 :: 		d2=i%10;
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
;timercheck.c,42 :: 		d3=j/10;
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
;timercheck.c,43 :: 		d4=j%10;
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
;timercheck.c,45 :: 		for(v=0;v<50;v++){
	CLRF       _v+0
	CLRF       _v+1
L_start18:
	MOVLW      128
	XORWF      _v+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__start49
	MOVLW      50
	SUBWF      _v+0, 0
L__start49:
	BTFSC      STATUS+0, 0
	GOTO       L_start19
;timercheck.c,46 :: 		if (!portc.rc3 || !portc.rc2)
	BTFSS      PORTC+0, 3
	GOTO       L__start31
	BTFSS      PORTC+0, 2
	GOTO       L__start31
	GOTO       L_start23
L__start31:
;timercheck.c,47 :: 		{ delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_start24:
	DECFSZ     R13+0, 1
	GOTO       L_start24
	DECFSZ     R12+0, 1
	GOTO       L_start24
	DECFSZ     R11+0, 1
	GOTO       L_start24
	NOP
;timercheck.c,48 :: 		return ;}
	GOTO       L_end_start
L_start23:
;timercheck.c,49 :: 		portc.rc4=0;
	BCF        PORTC+0, 4
;timercheck.c,50 :: 		portb=seg[d1];
	MOVF       _d1+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;timercheck.c,51 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start25:
	DECFSZ     R13+0, 1
	GOTO       L_start25
	DECFSZ     R12+0, 1
	GOTO       L_start25
	NOP
;timercheck.c,52 :: 		portc.rc4=1;
	BSF        PORTC+0, 4
;timercheck.c,54 :: 		portc.rc5=0;
	BCF        PORTC+0, 5
;timercheck.c,55 :: 		portb=seg[d2]+0x80;
	MOVF       _d2+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVLW      128
	ADDWF      INDF+0, 0
	MOVWF      PORTB+0
;timercheck.c,56 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start26:
	DECFSZ     R13+0, 1
	GOTO       L_start26
	DECFSZ     R12+0, 1
	GOTO       L_start26
	NOP
;timercheck.c,57 :: 		portc.rc5=1;
	BSF        PORTC+0, 5
;timercheck.c,59 :: 		portc.rc6=0;
	BCF        PORTC+0, 6
;timercheck.c,60 :: 		portb=seg[d3];
	MOVF       _d3+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;timercheck.c,61 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start27:
	DECFSZ     R13+0, 1
	GOTO       L_start27
	DECFSZ     R12+0, 1
	GOTO       L_start27
	NOP
;timercheck.c,62 :: 		portc.rc6=1;
	BSF        PORTC+0, 6
;timercheck.c,64 :: 		portc.rc7=0;
	BCF        PORTC+0, 7
;timercheck.c,65 :: 		portb=seg[d4];
	MOVF       _d4+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;timercheck.c,66 :: 		delay_ms(5);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_start28:
	DECFSZ     R13+0, 1
	GOTO       L_start28
	DECFSZ     R12+0, 1
	GOTO       L_start28
	NOP
;timercheck.c,67 :: 		portc.rc7=1;
	BSF        PORTC+0, 7
;timercheck.c,45 :: 		for(v=0;v<50;v++){
	INCF       _v+0, 1
	BTFSC      STATUS+0, 2
	INCF       _v+1, 1
;timercheck.c,68 :: 		}
	GOTO       L_start18
L_start19:
;timercheck.c,36 :: 		for(j=59;j>=0;j--)
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;timercheck.c,70 :: 		}
	GOTO       L_start15
L_start16:
;timercheck.c,34 :: 		for(i=a;i>=0;i--)
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;timercheck.c,72 :: 		}
	GOTO       L_start12
L_start13:
;timercheck.c,73 :: 		}
L_end_start:
	RETURN
; end of _start

_main:

;timercheck.c,75 :: 		void main() {
;timercheck.c,77 :: 		trisb=0;
	CLRF       TRISB+0
;timercheck.c,78 :: 		trisc.rc3=trisc.rc2=255;
	BSF        TRISC+0, 2
	BTFSC      TRISC+0, 2
	GOTO       L__main51
	BCF        TRISC+0, 3
	GOTO       L__main52
L__main51:
	BSF        TRISC+0, 3
L__main52:
;timercheck.c,79 :: 		trisc.rc0=trisc.rc4=trisc.rc5=trisc.rc6=trisc.rc7=0;
	BCF        TRISC+0, 7
	BTFSC      TRISC+0, 7
	GOTO       L__main53
	BCF        TRISC+0, 6
	GOTO       L__main54
L__main53:
	BSF        TRISC+0, 6
L__main54:
	BTFSC      TRISC+0, 6
	GOTO       L__main55
	BCF        TRISC+0, 5
	GOTO       L__main56
L__main55:
	BSF        TRISC+0, 5
L__main56:
	BTFSC      TRISC+0, 5
	GOTO       L__main57
	BCF        TRISC+0, 4
	GOTO       L__main58
L__main57:
	BSF        TRISC+0, 4
L__main58:
	BTFSC      TRISC+0, 4
	GOTO       L__main59
	BCF        TRISC+0, 0
	GOTO       L__main60
L__main59:
	BSF        TRISC+0, 0
L__main60:
;timercheck.c,80 :: 		portc.rc4=portc.rc5=portc.rc6=portc.rc7=1;
	BSF        PORTC+0, 7
	BTFSC      PORTC+0, 7
	GOTO       L__main61
	BCF        PORTC+0, 6
	GOTO       L__main62
L__main61:
	BSF        PORTC+0, 6
L__main62:
	BTFSC      PORTC+0, 6
	GOTO       L__main63
	BCF        PORTC+0, 5
	GOTO       L__main64
L__main63:
	BSF        PORTC+0, 5
L__main64:
	BTFSC      PORTC+0, 5
	GOTO       L__main65
	BCF        PORTC+0, 4
	GOTO       L__main66
L__main65:
	BSF        PORTC+0, 4
L__main66:
;timercheck.c,81 :: 		portb=1;
	MOVLW      1
	MOVWF      PORTB+0
;timercheck.c,82 :: 		while(1){
L_main29:
;timercheck.c,83 :: 		buttonread();
	CALL       _buttonread+0
;timercheck.c,84 :: 		}
	GOTO       L_main29
;timercheck.c,85 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
