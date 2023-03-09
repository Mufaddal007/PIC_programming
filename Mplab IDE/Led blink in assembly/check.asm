temp1     equ    0x30
temp2     equ    0x31
temp3     equ    0x32
PORTB     equ    0x06
TRISB     equ    0x86

			list p=16f72
			#include  <P16f72.INC>
			#define _XTAL_FREQ 14745600

		;	_CONFIG  _CP_OFF & _WDT_OFF & _BODEN_OFF & _PWRTE_ON & _HS_OSC 

ORG     0x00
GOTO    poweron

poweron
          BANKSEL    TRISB
          CLRF       TRISB
          BANKSEL    PORTB
          CLRF       PORTB
          CALL       secdelay
          
main      
			BSF        PORTB,7
			CALL       secdelay 
			BCF        PORTB,7
			CALL        secdelay
			
			GOTO main
			
			
secdelay
			MOVLW     0xF0
			MOVWF     temp1
			
next1
			MOVLW		0xF0
			MOVWF		temp2
next2
			MOVLW		0xC0
			MOVWF		temp3
next3
			DECFSZ		temp3,1
			GOTO		next3
			DECFSZ		temp2,1
			GOTO		next2
			DECFSZ		temp1,1
			GOTO		next1
			CLRF		temp1
			CLRF		temp2
			CLRF		temp3
			RETURN
			
			END
			
			
			
			
			