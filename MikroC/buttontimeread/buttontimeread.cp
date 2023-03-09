#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/buttontimeread/buttontimeread.c"
int press_time;
char press[10];
sbit led1 at rb1_bit;
sbit led2 at rb2_bit;sbit lcd_rs at rc2_bit;sbit lcd_en at rc3_bit;sbit lcd_d4 at rc4_bit;sbit lcd_d5 at rc5_bit;sbit lcd_d6 at rc6_bit;sbit lcd_d7 at rc7_bit;
sbit lcd_rs_direction at trisc2_bit;sbit lcd_en_direction at trisc3_bit;sbit lcd_d4_direction at trisc4_bit;sbit lcd_d5_direction at trisc5_bit;sbit lcd_d6_direction at trisc6_bit;sbit lcd_d7_direction at trisc7_bit;

void interrupt() { if(tmr0if_bit) {tmr0if_bit=0; TMR0= 61; press_time+=50;} }
void main()
{
press_time=0;
trisb.rb0=1;
trisb.rb1=0;
trisb.rb2=0;
led1=0;
led2=0;
lcd_init();
lcd_cmd(_lcd_cursor_off);
lcd_cmd(_lcd_clear);
OPTION_REG= 0x87;
INTCON = 0xA0;
tmr0ie_bit=0;
while(1)
{
if (!portb.rb0){ delay_ms(200);TMR0= 61; ; tmr0ie_bit=1; tmr0if_bit=0; while(!portb.rb0){inttostr(press_time,press),lcd_out(2,1,press);}; tmr0ie_bit=0; ;
 if ( press_time<1000) {lcd_out(1,1,"Mode1"); led1=1;led2=0; delay_ms(1000); led1=0;led2=0;}
 else if (press_time>1000 && press_time<2000) {lcd_out(1,1,"Mode2");led1=0; led2=1; delay_ms(2000); led1=0;led2=0;}
 else if (press_time>2000 && press_time<3000) {lcd_out(1,1,"Mode3");led1=1; led2=1; delay_ms(3000); led1=0; led2=0;}
 else {lcd_out(1,1,"Invalid press");led1=1; delay_ms(300); led1=0;delay_ms(200); led1=1 ;delay_ms(300); led1=0; delay_ms(200);}

}
 press_time=0;

}
}
