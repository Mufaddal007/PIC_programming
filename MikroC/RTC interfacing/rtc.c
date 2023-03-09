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
// end LCD module connections

#include <ds3231.c>  // include DS3231 RTC driver source file

int chip_temp;
// DS3231 library variable declaration
RTC_Time *mytime;

// function for printing time and date on LCD
void rtc_print()
{
  char txt[17];
  // print day of the week
  switch(mytime->dow)
  {
    case SUNDAY   :  LCD_Out(1, 5, " SUNDAY  ");  break;
    case MONDAY   :  LCD_Out(1, 5, " MONDAY  ");  break;
    case TUESDAY  :  LCD_Out(1, 5, " TUESDAY ");  break;
    case WEDNESDAY:  LCD_Out(1, 5, "WEDNESDAY");  break;
    case THURSDAY :  LCD_Out(1, 5, "THURSDAY ");  break;
    case FRIDAY   :  LCD_Out(1, 5, " FRIDAY  ");  break;
    default       :  LCD_Out(1, 5, "SATURDAY ");
  }

  // print time
  sprinti(txt, "TIME: %02u:%02u:%02u", (int)mytime->hours, (int)mytime->minutes, (int)mytime->seconds);
  LCD_Out(2, 1, txt);
  // print date
  sprinti(txt, "DATE: %02u-%02u-20%02u", (int)mytime->day, (int)mytime->month, (int)mytime->year);
  LCD_Out(3, 1, txt);

  // print chip temperature
  if (chip_temp < 0)  // if temperature is negative
    sprinti(txt, "TEMP:-%02u.%02u%cC", abs(chip_temp) / 100, abs(chip_temp) % 100, (int)223);
  else
    sprinti(txt, "TEMP: %02u.%02u%cC", chip_temp / 100, chip_temp % 100, (int)223);

  LCD_Out(4, 1, txt);
}

// main function
void main()
{
  OSCCON = 0x70;            // set internal oscillator to 8MHz
  delay_ms(1000);           // wait a second

  I2C1_Init(100000);        // initialize I2C communication
  Lcd_Init();               // initialize LCD module
  Lcd_Cmd(_LCD_CURSOR_OFF); // cursor off
  Lcd_Cmd(_LCD_CLEAR);      // clear LCD

  // read current time and date from the RTC chip
  mytime = RTC_Get();
  // print them
  rtc_print();

  delay_ms(1000);  // wait a second

  // set RTC time to 21:08:47 (hh:mm:ss) and date to 03-01-19 (dd-mm-yy)
  mytime->hours   = 21;
  mytime->minutes = 8;
  mytime->seconds = 47;
  mytime->dow     = THURSDAY;
  mytime->day     = 3;
  mytime->month   = JANUARY;
  mytime->year    = 19;
  // write time and date to the RTC chip
  RTC_Set(mytime);

  // enable SQW output with frequency of 1Hz
  IntSqw_Set(OUT_1Hz);

  while(1)
  {
    // read current time and date from the RTC chip
    mytime = RTC_Get();
    // read chip temperature
    chip_temp = Get_Temperature();
    // print all data
    rtc_print();

    delay_ms(200);  // wait 200 ms

  }

}