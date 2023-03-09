
_CustomChar:

;MyProject.c,18 :: 		void CustomChar(char pos_row, char pos_char) {
;MyProject.c,20 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,21 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       CustomChar_i_L0+0
L_CustomChar0:
	MOVF       CustomChar_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomChar1
	MOVF       CustomChar_i_L0+0, 0
	ADDLW      _character+0
	MOVWF      R0+0
	MOVLW      hi_addr(_character+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       CustomChar_i_L0+0, 1
	GOTO       L_CustomChar0
L_CustomChar1:
;MyProject.c,22 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,23 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_CustomChar_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomChar_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MyProject.c,24 :: 		}
L_end_CustomChar:
	RETURN
; end of _CustomChar

_chrblink:

;MyProject.c,25 :: 		void chrblink(int i,int j,char test[])
;MyProject.c,27 :: 		TRISB=0;
	CLRF       TRISB+0
;MyProject.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,30 :: 		Lcd_Out(i,j, test);
	MOVF       FARG_chrblink_i+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_chrblink_j+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG_chrblink_test+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,31 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_chrblink3:
	DECFSZ     R13+0, 1
	GOTO       L_chrblink3
	DECFSZ     R12+0, 1
	GOTO       L_chrblink3
	DECFSZ     R11+0, 1
	GOTO       L_chrblink3
	NOP
;MyProject.c,32 :: 		Lcd_Out(i,j,test2);
	MOVF       FARG_chrblink_i+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_chrblink_j+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _test2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,33 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_chrblink4:
	DECFSZ     R13+0, 1
	GOTO       L_chrblink4
	DECFSZ     R12+0, 1
	GOTO       L_chrblink4
	DECFSZ     R11+0, 1
	GOTO       L_chrblink4
	NOP
;MyProject.c,34 :: 		}
L_end_chrblink:
	RETURN
; end of _chrblink

_main:

;MyProject.c,35 :: 		void main() {
;MyProject.c,36 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,38 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,40 :: 		while(1){
L_main5:
;MyProject.c,41 :: 		chrblink(1,1,test1);
	MOVLW      1
	MOVWF      FARG_chrblink_i+0
	MOVLW      0
	MOVWF      FARG_chrblink_i+1
	MOVLW      1
	MOVWF      FARG_chrblink_j+0
	MOVLW      0
	MOVWF      FARG_chrblink_j+1
	MOVLW      _test1+0
	MOVWF      FARG_chrblink_test+0
	CALL       _chrblink+0
;MyProject.c,42 :: 		CustomChar('2','1');
	MOVLW      50
	MOVWF      FARG_CustomChar_pos_row+0
	MOVLW      49
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;MyProject.c,43 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;MyProject.c,45 :: 		}
	GOTO       L_main5
;MyProject.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
