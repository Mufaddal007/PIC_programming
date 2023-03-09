 int temp_res;
 int temp_res1;
 char text[10];
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
long map(long in1, long frommin, long frommax, long tomin, long tomax )
{
   int cal=(in1- frommin)*(tomax-tomin)/(frommax-frommin) +  tomin;
   return cal;
}

void main() {
trisa=1;
adcon1=ra0;
trisa.f0=1;
lcd_init();
lcd_cmd(_lcd_cursor_off);
lcd_cmd(_lcd_clear);
adc_init();
while(1)
{
   temp_res1=adc_read(0);
   temp_res=map(temp_res1, 0,255, 0, 100);
   inttostr(temp_res, text);
   lcd_out(1,1, text);
   lcd_out(2,1, "check");
}

}