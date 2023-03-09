#line 1 "D:/PIC programming/MikroC/RTC/16f72rtc/_16f72rtc.c"


short val;
sbit lcd_rs at rb2_bit;
sbit lcd_en at rb3_bit;
sbit lcd_d4 at rb4_bit; sbit lcd_d5 at rb5_bit; sbit lcd_d6 at rb6_bit; sbit lcd_d7 at rb7_bit;
sbit lcd_rs_direction at trisb2_bit; sbit lcd_en_direction at trisb3_bit; sbit lcd_d4_direction at trisb4_bit; sbit lcd_d5_direction at trisb5_bit;
sbit lcd_d6_direction at trisb6_bit; sbit lcd_d7_direction at trisb7_bit;
char time[]="Time:  :  :  ";
char date[]="Date:  -  -  ";
sbit Soft_i2c_scl at rc3_bit;
sbit soft_i2c_sda at rc4_bit;
sbit soft_i2c_scl_direction at trisc3_bit;
sbit soft_i2c_sda_direction at trisc4_bit;
short read_time(short addr)
{
soft_i2c_start();
soft_i2c_write(0b11010000);
soft_i2c_write(addr);
soft_i2c_start();
soft_i2c_write(0b11010001);
soft_i2c_read(1);
soft_i2c_stop();
}
void main() {
lcd_init();
lcd_cmd(_lcd_cursor_off);
lcd_cmd(_lcd_clear);
Soft_i2c_init();
delay_ms(100);

soft_i2c_start();
soft_i2c_write(0b11010000);
soft_i2c_write(0x00);
soft_i2c_write(0x00);
soft_i2c_write(0x20);
soft_i2c_write(0x51);
soft_i2c_write(0x04);
soft_i2c_write(0x14);
soft_i2c_write(0x07);
soft_i2c_write(0x21);
soft_i2c_stop();
while(1)
{
val=read_time(0); time[5]=(char) val>>4 +48; time[6] =(char) val&0x0f ;
val=read_time(1); time[8]=(char) val>>4 +48; time[9]=(char) val&0x0f ;
val=read_time(2); time[11]=(char) val>>4 +48; time[12] =(char) val&0x0f ;
val=read_time(4); date[5]=(char) val>>4 +48; date[6]=(char) val&0x0f ;
val=read_time(5); date[8]=(char) val>>4 +48; date[9] =(char) val&0x0f ;
val=read_time(6); date[11]=(char) val>>4 +48; date[12]=(char) val&0x0f ;

lcd_out(1,1,time); lcd_out(2,1,date);
}



}
