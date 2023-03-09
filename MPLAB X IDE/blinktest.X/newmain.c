#define _XTAL_FREQ 14745600

#include <xc.h>

// PIC16F72 Configuration Bit Settings
// 'C' source line config statements
// CONFIG
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = ON       // Power-up Timer Enable bit (PWRT enabled)
#pragma config CP = OFF         // FLASH Program Memory Code Protection bit (Code protection off)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.






int main()
{
  TRISB0 = 0; //RB0 as Output PIN
  while(1)
  {
    PORTB = 1;  // LED ON
    __delay_ms(1000); // 1 Second Delay
    PORTB = 0;  // LED OFF
    __delay_ms(1000); // 1 Second Delay
  }
  return 0;
}