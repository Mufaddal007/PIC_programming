int tempread;
int tempread1;
char readtostr[5];
sbit lcd_rs at rc2_bit;
sbit lcd_en at rc3_bit;
sbit lcd_d4 at rc4_bit;
sbit lcd_d5 at rc5_bit;
sbit lcd_d6 at rc6_bit;
sbit lcd_d7 at rc7_bit;

sbit lcd_rs_Direction at trisc2_bit;
sbit lcd_en_Direction at trisc3_bit;
sbit lcd_d4_direction at trisc4_bit;
sbit lcd_d5_direction at trisc5_bit;
sbit lcd_d6_direction at trisc6_bit;
sbit lcd_d7_direction at trisc7_bit;
long map(int in1, long frommin , long frommax, long tomin, long tomax) 
{
  long value=(in1-frommin)*(tomax-tomin)/(frommax-frommin) + tomin;
  return value;

}
void main() {
lcd_init();
lcd_cmd(_lcd_cursor_off);
lcd_cmd(_lcd_clear);
lcd_out(1,1,"check");

delay_ms(3000);

trisa=1;
adcon1=ra0;
trisa.f0=1;
lcd_out(1,1,"check2");
delay_ms(2000);
trisb.rb0=0;
trisb.rb1=255;
ADC_init();
lcd_out(1,1,"check3");
delay_ms(2000);

while(1){

    tempread1=adc_read(0);

    inttostr(tempread1, readtostr);
    lcd_cmd(_lcd_clear);
    
    lcd_out(1,1,"I am up!") ;
    lcd_out(2,1,readtostr);
    if (!portb.rb1)
    {
       while(!portb.rb1)  {
        portb.rb0=1;
          lcd_out(2,7, "Led on");
    }  
    }
    portb.rb0=0;
     lcd_out(2,7, "Led off");

}        }