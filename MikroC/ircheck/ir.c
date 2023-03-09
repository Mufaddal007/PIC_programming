sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;
// End LCD module connections

#define short_time      700                      // Used as a minimum time for short pulse or short space
#define   med_time     1200                      // Used as a maximum time for short pulse or short space
#define  long_time     2000                      // Used as a maximum time for long pulse or long space

char text[3];
bit rc5_ok, toggle_bit;
unsigned short rc5_state, address, command, i;
unsigned int rc5_code, timer_value;

void Interrupt() {
  if (RBIF_bit && (PORTB.F0 || !PORTB.F0)){         // PORTB change ISR
    RBIF_bit = 0;
    if(rc5_state != 0){
      timer_value = (TMR1H << 8) + TMR1L;           // Store Timer1 value
      TMR1H = 0;                                    // Reset Timer1
      TMR1L = 0;
    }
    switch(rc5_state){
     case 0 :                                       // Start receiving IR data (initially we're at the beginning of mid1)
       TMR1H = 0;                                   // Reset Timer1
       TMR1L = 0;
       TMR1ON_bit = 1;                              // Enable Timer1
       rc5_state = 1;                               // Next state: end of mid1
       i = 0;
       break;
     case 1 :                                       // End of mid1 ==> check if we're at the beginning of start1 or mid0
       if((timer_value > long_time) || (timer_value < short_time)){         // Invalid interval ==> stop decoding and reset
         rc5_state = 0;                             // Reset decoding process
         TMR1ON_bit = 0;                            // Disable Timer1
         break;
       }
       rc5_code |= 1 << (13 - i);                   // Set bit (13 - i)
       i++;
       if(i > 13){                                  // If all bits are received
         rc5_ok = 1;                                // Decoding process is OK
         RBIE_bit = 0;                              // Disable PORTB change interrupt
         break;
       }
       if(timer_value > med_time){                  // We're at the beginning of mid0
         rc5_state = 2;                             // Next state: end of mid0
         if(i == 13){                               // If we're at the LSB bit
           rc5_ok = 1;                              // Decoding process is OK
           rc5_code &= ~1;                          // Clear the LSB bit
           RBIE_bit = 0;                            // Disable PORTB change interrupt
           break;
         }
       }
       else                                         // We're at the beginning of start1
         rc5_state = 3;                             // Next state: end of start1
       break;
     case 2 :                                       // End of mid0 ==> check if we're at the beginning of start0 or mid1
       if((timer_value > long_time) || (timer_value < short_time)){
         rc5_state = 0;                             // Reset decoding process
         TMR1ON_bit = 0;                            // Disable Timer1
         break;
       }
       rc5_code &= ~(1 << (13 - i));                // Clear (13 - i)
       i++;
       if(timer_value > med_time)                   // We're at the beginning of mid1
         rc5_state = 1;                             // Next state: end of mid1
       else                                         // We're at the beginning of start0
         rc5_state = 4;                             // Next state: end of start0
       break;
     case 3 :                                       // End of start1 ==> check if we're at the beginning of mid1
       if((timer_value > med_time) || (timer_value < short_time)){           // Time interval invalid ==> stop decoding
         TMR1ON_bit = 0;                            // Disable Timer1
         rc5_state = 0;                             // Reset decoding process
         break;
       }
       else                                         // We're at the beginning of mid1
         rc5_state = 1;                             // Next state: end of mid1
       break;
     case 4 :                                       // End of start0 ==> check if we're at the beginning of mid0
       if((timer_value > med_time) || (timer_value < short_time)){           // Time interval invalid ==> stop decoding
         TMR1ON_bit = 0;                            // Disable Timer1
         rc5_state = 0;                             // Reset decoding process
         break;
       }
       else                                         // We're at the beginning of mid0
         rc5_state = 2;                             // Next state: end of mid0
       if(i == 13){                                 // If we're at the LSB bit
         rc5_ok = 1;                                // Decoding process is OK
         rc5_code &= ~1;                            // Clear the LSB bit
         RBIE_bit = 0;                              // Disable PORTB change interrupt
       }
    }
  }
  if (TMR1IF_bit){                 // Timer1 ISR
    TMR1IF_bit = 0;                // Clear Timer1 overflow flag bit
    rc5_state = 0;                 // Reset decoding process
    TMR1ON_bit = 0;                // Disable Timer1
  }
}

void main() {

  rc5_ok = 0;
  rc5_state = 0;

  Lcd_Init();                      // Initialize LCD module
  Lcd_Cmd(_LCD_CURSOR_OFF);        // cursor off
  Lcd_Cmd(_LCD_CLEAR);             // clear LCD
  TMR1IF_bit = 0;                  // Clear Timer1 overflow interrupt flag bit
  RBIF_bit = 0;                    // Clear PORTB change interrupt flag bit
  TMR1IE_bit = 1;                  // Enable Timer1 overflow interrupt
  T1CON = 0x10;                    // Set Timer1 clock source to internal with 1:2 prescaler (Timer1 clock = 1MHz)
  INTCON = 0xC8;                   // Enable global, peripheral and PORTB change interrupts

  Lcd_Out(1, 1, "ADS:0x00  TGL: 0");
  Lcd_Out(2, 1, "CMD:0x00");
  while(1) {
    while(!rc5_ok);                       // Wait until RC5 code receiver
    rc5_ok = 0;                           // Reset decoding process
    rc5_state = 0;
    TMR1ON_bit = 0;                       // Disable Timer1
    toggle_bit = rc5_code >> 11;          // Toggle bit is bit number 11
    address = (rc5_code >> 6) & 0x1F;     // Next 5 bits are for address
    command = rc5_code & 0x3F;            // The 6 LSBits are command bits
    Lcd_Chr(1, 16, toggle_bit + 48);      // Display toggle bit
    ByteToHex(address, text);             // Save address in string text with hex format
    Lcd_Out(1, 7, text);                  // Display address
    ByteToHex(command, text);             // Save command in string text with hex format
    Lcd_Out(2, 7, text);                  // Display command
    RBIE_bit = 1;                         // Enable PORTB change interrupt
  }  }