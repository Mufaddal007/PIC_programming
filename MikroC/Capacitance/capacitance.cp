#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/Capacitance/capacitance.c"
sbit chrgpin_mode at trisb0_bit;
sbit dischrgpin_mode at trisb1_bit;
sbit chrgpin at rb0_bit;
sbit dischrgpin at rb1_bit;

sbit lcd_rs at rc0_bit;
sbit lcd_en at rc1_bit;
sbit lcd_d4 at rc2_bit;
sbit lcd_d5 at rc3_bit;
sbit lcd_d6 at rc4_bit;
sbit lcd_d7 at rc5_bit;

sbit lcd_rs_direction at trisc0_bit;
sbit lcd_en_direction at trisc1_bit;
sbit lcd_d4_direction at trisc2_bit;
sbit lcd_d5_direction at trisc3_bit;
sbit lcd_d6_direction at trisc4_bit;
sbit lcd_d7_direction at trisc5_bit;
long elapsedtime;
void interrupt()
{
if (tmr1if_bit){elapsedtime++; tmr1if_bit=0; tmr1h=0xfc; tmr1l=0x18; }
}



float capacitance;
char txt[7];



void main() {
gie_bit=1;
peie_bit=1;
chrgpin_mode=0;
dischrgpin_mode=1;
t1con=0x00;
tmr1ie_bit=1;
chs0_bit=0;
chs1_bit=1;
chs2_bit=0;
trisa=0xff;

ADC_init();
delay_ms(100);

lcd_init();
lcd_cmd(_lcd_clear);
lcd_cmd(_lcd_cursor_off);
while(1)
{
elapsedtime=0;
chrgpin=1;
tmr1h=0xfc; tmr1l=0x18;
tmr1on_bit=1;
while(ADC_read(2)<648){}
lcd_cmd(_lcd_clear);
chrgpin=0;
tmr1on_bit=0;
tmr1h=0x00; tmr1l=0x00;

dischrgpin_mode=0;
dischrgpin=0;
while(ADC_read(2)>0){}
dischrgpin_mode=1;

capacitance=(float)((elapsedtime*1000)/10000);
floattostr_fixlen(capacitance,txt,5);
lcd_out(1,1,"C= ");
lcd_out(1,3,txt);
delay_ms(500);
}
}
