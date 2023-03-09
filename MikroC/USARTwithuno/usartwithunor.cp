#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/USARTwithuno/usartwithunor.c"
sbit lcd_rs at rb2_bit;sbit lcd_en at rb3_bit;sbit lcd_d4 at rb4_bit; sbit lcd_d5 at rb5_bit; sbit lcd_d6 at rb6_bit; sbit lcd_d7 at rb7_bit;

sbit lcd_rs_direction at trisb2_bit; sbit lcd_en_direction at trisb3_bit; sbit lcd_d4_direction at trisb4_bit;
sbit lcd_d5_direction at trisb5_bit; sbit lcd_d6_direction at trisb6_bit; sbit lcd_d7_direction at trisb7_bit;
char ch;
void main()
{
lcd_init();
lcd_cmd(_lcd_clear);
lcd_cmd(_lcd_cursor_off);
lcd_out(1,1,"This is UART test!");
UART1_init(9600);
while(1)
{
if (UART1_Data_Ready)
{ ch=UART1_Read();
 lcd_chr(2,1,ch);}

}

}
