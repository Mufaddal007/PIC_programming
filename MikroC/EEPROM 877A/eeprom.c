
short address;
char dta;
short i;
sbit lcd_rs at rb2_bit;
sbit lcd_en at rb3_bit;
sbit lcd_d4 at rb4_bit;
sbit lcd_d5 at rb5_bit;
sbit lcd_d6 at rb6_bit;
sbit lcd_d7 at rb7_bit;

sbit lcd_rs_direction  at trisb2_bit;
sbit lcd_en_direction at trisb3_bit;
sbit lcd_d4_direction at trisb4_bit;
sbit lcd_d5_direction at trisb5_bit;
sbit lcd_d6_direction  at trisb6_bit;
sbit lcd_d7_direction  at trisb7_bit;

void eeprom_write(short address, short dta)
{
while(wr_bit);
eeadr=address;
eedata=dta;
eepgd_bit=0;
wren_bit=1;
gie_bit=0;
eecon2=0x55;
eecon2=0xAA;
wr_bit=1;
gie_bit=1;
wren_bit=0;
}
char eeprom_read(short address)
{
eeadr=address;
eepgd_bit=0;
rd_bit=1;
dta=eedata;
return dta;
}

void main()
{
wr_bit=0;
trisb=0;

lcd_init();
lcd_cmd(_lcd_cursor_off);
lcd_cmd(_lcd_clear);

while(1){
dta='A';
for (i=1; i<10;i++)
{ eeprom_write(i,dta);
  dta=dta++;
}
for (i=1;i<10;i++)
{
lcd_chr(1,1,eeprom_read(i));
delay_ms(1000);
lcd_cmd(_lcd_clear);
}

}
}