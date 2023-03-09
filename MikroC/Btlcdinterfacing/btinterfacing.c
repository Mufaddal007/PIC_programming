sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at Rc5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;


char error;
char byte_read;
 int i=0;
void main() {
TRISB=0;

 Lcd_Init(); // Initialize LCD
 Lcd_Cmd(_LCD_CLEAR); // Clear display
 Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
 Lcd_Out(1,1,"check");

      delay_ms(2000);


error = Soft_UART_Init(&PORTB, 7, 6, 9600, 0);

if (error > 0) {
     Lcd_Cmd(_LCD_CLEAR); // Clear display
     Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
     Lcd_Out(1,1,"Error");              // Signalize Init error
     while(1) ;                            // Stop program
}
    Delay_ms(100);

 while(1) {                             // Endless loop
    if (j>15) && (i==0) i++;
    else if (j>15) && (i==1) i=0;
    byte_read = Soft_UART_Read(&error);   // Read byte, then test error flag
    if (error){                            // If error was detected
       Lcd_Out(1,1,"Error");
      }
    else{
      Lcd_Cmd(_LCD_CLEAR); // Clear display
      Lcd_Cmd(_LCD_CURSOR_OFF); // Cursor off
      Lcd_Out(1,i,byte_read[i]);     // If error was not detected, return byte read
      delay_ms(1000);
      i++;
      }
         }

}