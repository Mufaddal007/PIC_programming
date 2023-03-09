#line 1 "D:/PIC programming/MikroC/digital volt meter/16f72/dvm.c"
float voltage;
char txt[8];
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
trisa=0x04;
chs0_bit=0;
chs1_bit=1;
chs2_bit=0;

lcd_init();
lcd_cmd(_lcd_cursor_off);
adc_init();

while(1)
{
lcd_out(1,1,"Volt= ");
voltage=((adc_read(2)*30.0)/1024.0);
floattostr_fixlen(voltage, txt,5);
lcd_out(2,4,txt);
lcd_chr(2,13,'V');
delay_ms(1000);
}
}
