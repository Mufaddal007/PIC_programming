#define un(a) a>>4
#define ln(b) b&0x0f
char months[12][4]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
char days[7][4]={"Sun","Mon","Tue","Thu","Fri","Sat","Sun"};
short val;
char time[]="Time:  :  :  ";
char date[]="Date:  -  -  ";
sbit lcd_rs at rb2_bit;
sbit lcd_en at rb3_bit;
sbit lcd_d4 at rb4_bit;
sbit lcd_d5 at rb5_bit;
sbit lcd_d6 at rb6_bit;
sbit lcd_d7 at rb7_bit;

sbit lcd_rs_direction at trisb2_bit;
sbit lcd_en_direction at trisb3_bit;
sbit lcd_d4_direction at trisb4_bit;
sbit lcd_d5_direction at trisb5_bit;
sbit lcd_d6_direction at trisb6_bit;
sbit lcd_d7_direction at trisb7_bit;

short read_ds1307(short addr)
{
  unsigned short read_data;
  I2C1_Start();
  I2C1_Wr(0xD0);
  I2C1_Wr(addr);
  I2C1_Repeated_Start();
  I2C1_Wr(0xD1);
  read_data=I2C1_Rd(0);
  I2C1_Stop();
  return(read_data);
}

void main()
{

 lcd_init();
 lcd_cmd(_lcd_clear);
 lcd_cmd(_lcd_cursor_off);
  i2c1_init(100000);
 delay_ms(200);
 i2c1_start();
 i2c1_Wr(0xD0);     //slave address with write bit
 i2c1_Wr(0x00);    //word address
 i2c1_Wr(0x00);     //seconds
 i2c1_Wr(0x40);    //minutes
 i2c1_wr(0x72);   //hour 12 hour format
 i2c1_wr(0x01);  //day
 i2c1_wr(0x12);  //date
 i2c1_wr(0x07);  //month
 i2c1_wr(0x21);  //year
 i2c1_wr(0x10);  //square wave enable

 i2c1_stop();
 lcd_cmd(_lcd_clear);

 lcd_cmd(_lcd_clear);
 while(1){


 val= read_ds1307(0)&0x07;  time[12]=(char)un(val)+48; time[13]=(char) ln(val)+48;

 val= read_ds1307(1); time[9]=(char)un(val)+48; time[10]=(char) ln(val)+48;

 val=read_ds1307(2)&0b00011111; time[6]=(char)un(val)+48; time[7]=(char)ln(val)+48;

 //val=read_ds1307(3);   //

 val=read_ds1307(4); date[6]=(char)un(val)+48; date[7]=(char)ln(val)+48;

 val=read_ds1307(5); date[9]=(char)un(val)+48; date[10]=(char)ln(val)+48;

 val=read_ds1307(6); date[12]=(char)un(val)+48; date[13]=(char)ln(val)+48;

 lcd_out(1,1,time);
 lcd_out(2,1,date);
 delay_ms(100);

 }

}