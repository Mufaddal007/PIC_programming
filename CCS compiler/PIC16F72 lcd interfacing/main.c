//LCD Module Connections  
#define LCD_RS_PIN      PIN_B1                                   
#define LCD_RW_PIN      PIN_B2 
#define LCD_ENABLE_PIN  PIN_B3 
#define LCD_DATA4       PIN_B4                                    
#define LCD_DATA5       PIN_B5                                    
#define LCD_DATA6       PIN_B6                           
#define LCD_DATA7       PIN_B7
//End LCD Module Connections

#include <main.h>
#include <lcd.c>

#use delay (clock=14745600)

void main()
{
   int i=0;
   
   lcd_init();
   Delay_ms(100);
  
   while(TRUE)
   {
     lcd_putc('\f'); //Clear Display
     lcd_putc("Hello There!");
     Delay_ms(2000);
     lcd_putc('\f'); //Clear Display
     lcd_putc("LCD check ");
    
   
     Delay_ms(2000);
     lcd_putc('\f');
     printf(lcd_putc,"Count = %d", i);
     Delay_ms(2000);
     i++;
   }
}