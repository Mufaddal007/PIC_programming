#line 1 "D:/PIC programming/MikroC/Adc/Adctest.c"
 int temp_res;
 char text[10];
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

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
