bit state;
short i,j,value;
char secs[]="     ";
char mins[]="   ";
sbit lcd_rs at rc2_bit;
sbit lcd_en at rc3_bit;
sbit lcd_d4 at rc4_bit;
sbit lcd_d5 at rc5_bit;
sbit lcd_d6 at rc6_bit;
sbit lcd_d7 at rc7_bit;
sbit lcd_rs_direction at trisc2_bit;
sbit lcd_en_direction at trisc3_bit;
sbit lcd_d4_direction at trisc4_bit;
sbit lcd_d5_direction at trisc5_bit;
sbit lcd_d6_direction at trisc6_bit;
sbit lcd_d7_direction at trisc7_bit;
void setup()
{  state=value=i=j=0;
  trisc=0;
  lcd_init();
  lcd_cmd(_lcd_cursor_off);

  lcd_cmd(_lcd_clear);
  OPTION_REG  = 0x87;
  INTCON  = 0xF0;

}
void init()
{
  INTF_bit=0;
  TMR0IF_bit = 0;
  TMR0 = 61;
  state=value=i=j;
 }
void Interrupt()
{
  if (TMR0IF_bit){
    TMR0IF_bit = 0;
    TMR0 = 61;
    value++;
    if (value==20)
    { i++; value=0;
      if (i==59){j++; i=0;}
    }
   }
}

void main() {
   setup();

  while(1)
    { 
      while(~intf_bit){lcd_out(1,1,"Welcome");}
      delay_ms(300);
      init();
      lcd_cmd(_lcd_clear);
      lcd_out(1,1,"Stop watch: ")  ;
      while(~intf_bit){
           shorttostr(j,mins);
           shorttostr(i,secs);
           lcd_out(2,1,mins);
           lcd_out(2,5,":");
           lcd_out(2,7,secs);}
       intf_bit=0;
       lcd_cmd(_lcd_clear);

  }
}