#line 1 "D:/PIC programming/MikroC/RTC/RTC2.c"


short secs=0,mins=0,hrs=0,day=0,dates=0,months=0,years=0,val,i=0;
char time[]="Time:  :  :  ",date[]="Date:  -  -  ";

sbit lcd_rs at rb2_bit; sbit lcd_en at rb3_bit; sbit lcd_d4 at rb4_bit; sbit lcd_d5 at rb5_bit;sbit lcd_d6 at rb6_bit; sbit lcd_d7 at rb7_bit;
sbit lcd_rs_direction at trisb2_bit; sbit lcd_en_direction at trisb3_bit; sbit lcd_d4_direction at trisb4_bit; sbit lcd_d5_direction at trisb5_bit; sbit lcd_d6_direction at trisb6_bit; sbit lcd_d7_direction at trisb7_bit;

void interrupt() { if(intf_bit){intf_bit=0;i++; if(i==8) i=0;}}
void display_set(char arr[], short i)
{
 arr[i]=(char) val>>4 +48; arr[i+1]=(char) val&0x0F +48;
}
void updatetime()
{
 i2c1_start();
 i2c1_Wr(0xD0);
 i2c1_Wr(0x00);
 i2c1_Wr(((secs/10)<<4) | secs%10);
 i2c1_Wr(((mins/10)<<4) | mins%10);
 i2c1_wr(((hrs/10)<<4) | hrs%10);
 i2c1_wr(day);
 i2c1_wr(((dates/10)<<4) | dates%10);
 i2c1_wr(((months/10)<<4) | months%10);
 i2c1_wr(((years/10)<<4) | years%10);
 i2c1_wr(0x10);
 i2c1_stop();
}

short read_time(short address)
{
 unsigned short read_data;
 I2C1_Start();
 I2C1_Wr(0xD0);
 I2C1_Wr(address);
 I2C1_Repeated_Start();
 I2C1_Wr(0xD1);
 read_data=I2C1_Rd(0);
 I2C1_Stop();
 return(read_data);
}

void main()
{
 trisb.rb0=1;
 lcd_init();
 lcd_cmd(_lcd_clear);
 lcd_cmd(_lcd_cursor_off);
 lcd_out(1,1,"...");
 i2c1_init(100000);
 delay_ms(200);
 lcd_cmd(_lcd_clear);
 lcd_out(1,1,"Done ");
 delay_ms(500);
 lcd_cmd(_lcd_clear);

 while(1){
 while(i<7){if(!portb.rb0) { switch(i) {
 case 0: secs++; break;
 case 1: mins++; break;
 case 2: hrs++; break;
 case 3: dates++;break;
 case 4: months++; break;
 case 5: years++; break;}}

 switch(i){
 case 0: lcd_out(1,1,"s:"); lcd_chr(2,1,(char)secs/10+48); lcd_chr(2,1,(char)secs%10+48); break;
 case 1: lcd_out(1,1,"m:"); lcd_chr(2,1,(char)mins/10+48); lcd_chr(2,1,(char)mins%10+48); break;
 case 2: lcd_out(1,1,"h:"); lcd_chr(2,1,(char)mins/10+48); lcd_chr(2,1,(char)mins%10+48); break;
 case 3: lcd_out(1,1,"D:"); lcd_chr(2,1,(char)dates/10+48); lcd_chr(2,1,(char)dates%10+48); break;
 case 4: lcd_out(1,1,"M:"); lcd_chr(2,1,(char)months/10+48); lcd_chr(2,1,(char)months%10+48); break;
 case 5: lcd_out(1,1,"Y:"); lcd_chr(2,1,(char)years/10+48); lcd_chr(2,1,(char)years%10+48); break;
 case 6: updatetime();break;} }


 val= read_time(0)&0x07; display_set(time,5);
 val= read_time(1); display_set(time,8);
 val=read_time(2)&0x1f; display_set(time,11);

 val=read_time(4); display_set(date,5);
 val=read_time(5); display_set(date,8);
 val=read_time(6); display_set(date,8);

 lcd_out(1,1,time); lcd_out(2,1,date);
 }
}
