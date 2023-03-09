#line 1 "D:/PIC programming/MikroC/calculator/calci.c"
sbit LCD_RS at RC2_bit;
sbit lcd_en at RC3_bit;
sbit lcd_d4 at RC4_bit;
sbit lcd_d5 at RC5_bit;
sbit lcd_d6 at RC6_bit;
sbit lcd_d7 at RC7_bit;

sbit LCD_RS_direction at trisc2_bit;
sbit lcd_en_direction at trisc3_bit;
sbit lcd_d4_direction at trisc4_bit;
sbit lcd_d5_direction at trisc5_bit;
sbit lcd_d6_direction at trisc6_bit;
sbit lcd_d7_direction at trisc7_bit;


void main() {
Lcd_Init();
Lcd_Command(SET_CURSOR_OFF);
portb=255;







}
