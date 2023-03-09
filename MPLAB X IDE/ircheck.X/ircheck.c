/*
 * RC-5 Protocol IR remote control decoder with PIC16F887 MCU.
 * C Code for MPLAB XC8 compiler.
 * Internal oscillator used @ 8MHz.
 * This is a free software with NO WARRANTY.
 * https://simple-circuit.com/
*/ 
 #define _XTAL_FREQ 20000000
// set configuration words
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = ON       // Power-up Timer Enable bit (PWRT enabled)
#pragma config CP = OFF         // FLASH Program Memory Code Protection bit (Code protection off)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>

 
 
//LCD module connections
#define LCD_RS       RD0
#define LCD_EN       RD1
#define LCD_D4       RD2
#define LCD_D5       RD3
#define LCD_D6       RD4
#define LCD_D7       RD5
#define LCD_RS_DIR   TRISD0
#define LCD_EN_DIR   TRISD1
#define LCD_D4_DIR   TRISD2
#define LCD_D5_DIR   TRISD3
#define LCD_D6_DIR   TRISD4
#define LCD_D7_DIR   TRISD5
//End LCD module connections
 

#define _XTAL_FREQ 8000000
#include <stdio.h>         // for sprintf
#include <stdint.h>        // include stdint header
#include "LCD_Lib.c"       // include LCD driver source file
 
#define short_time    700   // used as a minimum time for short pulse or short space
#define   med_time   1200   // used as a maximum time for short pulse or short space
#define  long_time   2000   // used as a maximum time for long pulse or long space
 
char text[3];
__bit rc5_ok;
uint8_t  rc5_state, bit_n;   // bit_n: bit number used for variable rc5_code bits
uint16_t rc5_code, timer_value;  // rc5_code: whole RC5 code message
 
// interrupt ISRs
void __interrupt() MyISRs(void)
{
/*************** start external interrupt ISR ***************/
  if (RBIF && (RB0 || !RB0))   // PORTB change ISR (& clear mismatch condition)
  {
    RBIF = 0;   // clear PORTB interrupt flag bit
    if(rc5_state != 0)
    {
      timer_value = (TMR1H << 8) | TMR1L;  // store Timer1 value
      TMR1H = TMR1L = 0;     // reset Timer1
    }
 
    switch(rc5_state)
    {
     case 0 :  // start receiving IR data (initially we're at the beginning of mid1)
       TMR1H = TMR1L = 0;  // reset Timer1
       TMR1ON    = 1;   // enable Timer1
       rc5_state = 1;   // next state: end of mid1
       bit_n     = 0;   // reset bit number
       break;
 
     case 1 :   // end of mid1 ==> check if we're at the beginning of start1 or mid0
       if((timer_value > long_time) || (timer_value < short_time))
       {  // invalid interval ==> stop decoding and reset
         rc5_state = 0;  // reset decoding process
         TMR1ON    = 0;  // disable Timer1
       }
 
       else
       {
         rc5_code |= 1 << (13 - bit_n);   // set bit (13 - bit_n)
         bit_n++;
         if (bit_n > 13)  // if all bits have been received
         {
           rc5_ok = 1;    // decoding process is OK
           RBIE   = 0;    // disable PORTB change interrupt
         }
         else
         {
           if(timer_value > med_time)   // we're at the beginning of mid0
           {
             rc5_state = 2;     // next state: end of mid0
             if(bit_n == 13)    // if we're at the LSB bit
             {
               rc5_ok = 1;      // decoding process is OK
               rc5_code &= ~1;  // clear the LSB bit
               RBIE   = 0;      // disable PORTB change interrupt
             }
           }  // end  " if(timer_value > med_time) "
           else               // we're at the beginning of start1
             rc5_state = 3;   // next state: end of start1
         }  // end  " else "
         
       }  // end  " else "
       break;
 
     case 2 :   // end of mid0 ==> check if we're at the beginning of start0 or mid1
       if((timer_value > long_time) || (timer_value < short_time))
       {  // time interval invalid ==> stop decoding
         rc5_state = 0;    // reset decoding process
         TMR1ON    = 0;    // disable Timer1
       }
       else
       {
         rc5_code &= ~(1 << (13 - bit_n));  // clear (13 - bit_n)
         bit_n++;
         if(timer_value > med_time)  // we're at the beginning of mid1
           rc5_state = 1;            // next state: end of mid1
         else              // we're at the beginning of start0
           rc5_state = 4;  // next state: end of start0
       }
       break;
 
     case 3 :   // end of start1 ==> check if we're at the beginning of mid1
       if((timer_value > med_time) || (timer_value < short_time))
       {   // time interval invalid ==> stop decoding
         TMR1ON    = 0;  // disable Timer1
         rc5_state = 0;  // reset decoding process
       }
       else              // we're at the beginning of mid1
         rc5_state = 1;  // next state: end of mid1
       break;
 
     case 4 :  // end of start0 ==> check if we're at the beginning of mid0
       if((timer_value > med_time) || (timer_value < short_time))
       {   // time interval invalid ==> stop decoding
         TMR1ON    = 0;  // disable Timer1
         rc5_state = 0;  // reset decoding process
       }
       else   // we're at the beginning of mid0
       {
         rc5_state = 2;    // next state: end of mid0
         if(bit_n == 13)   // if we're at the LSB bit
         {
           rc5_ok = 1;      // decoding process is OK
           rc5_code &= ~1;  // clear the LSB bit
           RBIE   = 0;      // disable PORTB change interrupt
         }
       }  // end  " else "
       
    }  // end  " switch(rc5_state) "
 
  }  // end  " if (RBIF && (RB0 || !RB0)) "
/*************** end external interrupt ISR ***************/
 
/*************** start Timer1 ISR ***************/
  if (TMR1IF)         // Timer1 ISR
  {
    TMR1IF    = 0;   // clear Timer1 interrupt flag bit
    rc5_state = 0;   // reset decoding process
    TMR1ON    = 0;   // disable Timer1
  }
/*************** end Timer1 ISR ***************/
 
}
 
/*************************** main function *********************/
void main(void)
{
  
 
  TMR1IF = 0;     // clear Timer1 overflow interrupt flag bit
  RBIF   = 0;     // clear PORTB change interrupt flag bit
  TMR1IE = 1;     // enable Timer1 overflow interrupt
 
  INTCON = 0xC8;  // enable global, peripheral and PORTB change interrupts
  
 
  rc5_ok = rc5_state = 0;  // reset decoding process
 
  __delay_ms(1000);   // wait 1 second
 
  LCD_Begin();       // initialize LCD module
  LCD_Goto(1, 1);    // move cursor to column 1, row 1
  LCD_Print("ADS:0x00  TGL: 0");
  LCD_Goto(1, 2);    // move cursor to column 1, row 2
  LCD_Print("CMD:0x00");
 
  while(1)
  {
    while (!rc5_ok);   // wait until NEC code receiver
 
    rc5_ok = rc5_state = 0;  // reset decoding process
    TMR1ON    = 0;   // disable Timer1
 
    uint8_t toggle_bit = (rc5_code >> 11) & 1;   // toggle bit is bit number 11
    uint8_t address = (rc5_code >> 6) & 0x1F;    // next 5 bits are for address
    uint8_t command = rc5_code & 0x3F;           // the 6 LSBits are command bits
 
    LCD_Goto(16, 1);   // move cursor to column 16 line 1
    LCD_PutC(toggle_bit + '0');   // print toggle bit
 
    sprintf(text,"%02X",address);
    LCD_Goto(7, 1);    // move cursor to column 7 line 1
    LCD_Print(text);   // print address
 
    sprintf(text,"%02X",command);
    LCD_Goto(7, 2);    // move cursor to column 7 line 2
    LCD_Print(text);   // print command
 
    RBIE = 1;    // enable PORTB change interrupt
 
  }
 
}