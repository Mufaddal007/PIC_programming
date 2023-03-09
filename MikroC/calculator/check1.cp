#line 1 "D:/PIC programming/MikroC/calculator/check1.c"
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


void main() {
TRISC=0;
TRISB.RB7=255;
TRISB.RB1=255;
TRISB.RB2=255;
TRISB.RB3=255;
trisb.rb5=0;
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
portb.rb0=0;
while(1){
if (!PORTB.RB7)
{
portb.rb0=1;
delay_ms(1000);
portb.rb0=0;
}

else
{
 portb.rb0=0;
}
}






}
