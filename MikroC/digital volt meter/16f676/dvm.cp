#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/digital volt meter/16f676/dvm.c"
int value;
short abdecimal;
char txt[6];
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

void main() {
ansel=0x02;
trisa=0xff;
adc_init();

lcd_init();
lcd_cmd(_lcd_cursor_off);
lcd_out(1,1,"Value= ");
while(1){

value=adc_read(2);
txt[0]=(char)(value/1000)%10+48;
txt[1]=(char)(value/100)%10+48 ;
txt[2]=(char)(value/10)%10+48 ;
txt[3]=(char)(value%10)+48 ;
lcd_out(2,1,txt);
}
}
