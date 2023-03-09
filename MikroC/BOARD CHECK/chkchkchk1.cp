#line 1 "D:/PIC programming/MikroC/board check/chkchkchk1.c"







float tempread;
float tempread1;
int state=0;
char readtostr[5];
sbit lcd_rs at RC2_bit;
sbit lcd_en at RC3_bit;
sbit lcd_d4 at RC4_bit;
sbit lcd_d5 at RC5_bit;
sbit lcd_d6 at RC6_bit;
sbit lcd_d7 at RC7_bit;

sbit lcd_rs_Direction at TRISC2_bit;
sbit lcd_en_Direction at TRISC3_bit;
sbit lcd_d4_direction at TRISC4_bit;
sbit lcd_d5_direction at TRISC5_bit;
sbit lcd_d6_direction at TRISC6_bit;
sbit lcd_d7_direction at TRISC7_bit;





float map(float in1)
{
 float value;
 value = (((in1 -  0 )*( 5 ))/ 255 ) +  0 ;
 return value;
}


void buttoncheck()
{
 if (!portb.rb1)
 {
 state=!state;
 }
}
void stateset()
{
 if (state==1)
 {
 lcd_out(2,7,"  Led on ");
 portb.rb0=1;
 delay_ms(100);
 }
 else
 {
 lcd_out(2,7,"  Led off");
 portb.rb0=0;
 delay_ms(100);
 }

}

void main() {
lcd_init();
lcd_cmd(_lcd_cursor_off);
lcd_cmd(_lcd_clear);


trisa=1;
adcon1=ra0;
trisa.f0=1;

trisb.rb0=0;
trisb.rb1=255;
ADC_init();

while(1){
 lcd_out(1,1,"Hello world!") ;
 delay_ms(10);


 tempread1=adc_read(0);
 tempread= map(tempread1) ;
 FloatToStr_FixLen(tempread, readtostr,5);
 lcd_out(2,1,readtostr);

 buttoncheck();
 stateset();

}
}
