#line 1 "D:/PIC programming/MikroC/RTC interfacing/rtc.c"
sbit LCD_RS at Rb0_bit;
sbit LCD_EN at Rb1_bit;
sbit LCD_D4 at Rb2_bit;
sbit LCD_D5 at Rb3_bit;
sbit LCD_D6 at Rb4_bit;
sbit LCD_D7 at Rb5_bit;
sbit LCD_RS_Direction at TRISb0_bit;
sbit LCD_EN_Direction at TRISb1_bit;
sbit LCD_D4_Direction at TRISb2_bit;
sbit LCD_D5_Direction at TRISb3_bit;
sbit LCD_D6_Direction at TRISb4_bit;
sbit LCD_D7_Direction at TRISb5_bit;




int chip_temp;

RTC_Time *mytime;


void rtc_print()
{
 char txt[17];

 switch(mytime->dow)
 {
 case SUNDAY : LCD_Out(1, 5, " SUNDAY  "); break;
 case MONDAY : LCD_Out(1, 5, " MONDAY  "); break;
 case TUESDAY : LCD_Out(1, 5, " TUESDAY "); break;
 case WEDNESDAY: LCD_Out(1, 5, "WEDNESDAY"); break;
 case THURSDAY : LCD_Out(1, 5, "THURSDAY "); break;
 case FRIDAY : LCD_Out(1, 5, " FRIDAY  "); break;
 default : LCD_Out(1, 5, "SATURDAY ");
 }


 sprinti(txt, "TIME: %02u:%02u:%02u", (int)mytime->hours, (int)mytime->minutes, (int)mytime->seconds);
 LCD_Out(2, 1, txt);

 sprinti(txt, "DATE: %02u-%02u-20%02u", (int)mytime->day, (int)mytime->month, (int)mytime->year);
 LCD_Out(3, 1, txt);


 if (chip_temp < 0)
 sprinti(txt, "TEMP:-%02u.%02u%cC", abs(chip_temp) / 100, abs(chip_temp) % 100, (int)223);
 else
 sprinti(txt, "TEMP: %02u.%02u%cC", chip_temp / 100, chip_temp % 100, (int)223);

 LCD_Out(4, 1, txt);
}


void main()
{
 OSCCON = 0x70;
 delay_ms(1000);

 I2C1_Init(100000);
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);


 mytime = RTC_Get();

 rtc_print();

 delay_ms(1000);


 mytime->hours = 21;
 mytime->minutes = 8;
 mytime->seconds = 47;
 mytime->dow = THURSDAY;
 mytime->day = 3;
 mytime->month = JANUARY;
 mytime->year = 19;

 RTC_Set(mytime);


 IntSqw_Set(OUT_1Hz);

 while(1)
 {

 mytime = RTC_Get();

 chip_temp = Get_Temperature();

 rtc_print();

 delay_ms(200);

 }

}
