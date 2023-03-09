#line 1 "D:/PIC programming/MikroC/Lcd interfacing/lcdcheck.c"
sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit Lcd_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;

void main()
 {
 Trisb.rb0=0;
 Trisb.rb1=0;
 Lcd_Init();
 Lcd_Cmd(_Lcd_cursor_off);
 Lcd_Cmd(_Lcd_clear);
 Lcd_Out(1,1,"Hello");
 while(1){

 if (!portb.rb0)
 {
 portb.rb1=1;
 Lcd_Out(2,1, "pressed");
 delay_ms(1000);
 portb.rb1=0;
 Lcd_Cmd(_Lcd_clear);
 }
} }
