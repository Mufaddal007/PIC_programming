 int temp_res;
 char text[10];
sbit LCD_RS at RC3_bit;
sbit LCD_EN at RC2_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;

sbit LCD_RS_Direction at TRISC3_bit;
sbit LCD_EN_Direction at TRISC2_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;

void main() 
{
  ADC_Init_Advanced(_Adc_External_VREFH);
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  TRISA=1;
  ADCON1=RA0;
  TRISA.F0= 1;


  do {
    temp_res = ADC_Read(0);
     IntToStr(temp_res,text);
    Lcd_Out(1,1,text);
    Lcd_Out(2,1,"check");
     delay_ms(200);
    
    
    } while(1);
}