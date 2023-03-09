sbit LCD_RS at rc2_bit ;
sbit LCD_EN at rc3_bit;
sbit LCD_D4 at rc4_bit;
sbit LCD_D5 at rc5_bit ;
sbit LCD_D6 at rc6_bit ;
sbit LCD_D7 at rc7_bit;

sbit lcd_rs_direction at trisc2_bit ;
sbit lcd_en_direction at trisc3_bit ;
sbit lcd_d4_direction at trisc4_bit;
sbit lcd_d5_direction at trisc5_bit;
sbit lcd_d6_direction at trisc6_bit;
sbit lcd_d7_direction at trisc7_bit;

int previousrecord=0;
int count=0;
int dcount=0;
char str[5];
void main() {
trisc=0;
trisb.rb0=255;
lcd_init();
lcd_cmd(_lcd_clear);
lcd_cmd(_lcd_cursor_off);

         while(1)
         {
             if (!portb.rb0)
             { count++;
              lcd_out(1,1,"button pressed") ;
              IntToStr(count, str);
              lcd_out(2,1,str);
              delay_ms(500);
             }
             lcd_out(1,1,"button released");
             delay_ms(500);
         }

}