#define led portb.rb0
char error;
char read[10]="     ";
char rd1;
int k=0;
int i;
char pass[10]="muffi";

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

void passchk()
{   lcd_cmd(_lcd_clear);
   lcd_out(1,1,"Enter ");
   lcd_out(2,1,"password");
   delay_ms(2000);
   for (int i=0;i<5;i++)
   {
        rd1=soft_uart_read(&error) ;
        if (error)  lcd_out(1,1,"Error1");
        else if (rd1==pass[i]) k++;
   }

   if (k==5) lcd_out(1,1,"Correct ");
   else lcd_out(1,1,"Incorrect");
}
void charout()
{    lcd_cmd(_lcd_clear);
       lcd_out(1,1,"char out");
       delay_ms(1000);
     for (i=0;i<10;i++)
     {
       rd1=soft_uart_read(&error);
       if (error) lcd_out(1,1,"Error1");
       else {soft_uart_write(rd1);
       lcd_out(1,i+1,rd1);}
     }
     delay_ms(1000);
     lcd_cmd(_lcd_clear);
}
void switchcontrol()
{
   lcd_cmd(_lcd_clear);
   lcd_out(1,1,"Ac switch");
   delay_ms(2000);
 do
 {
  rd1=soft_uart_read(&error) ;
  if (error) lcd_out("Error1");
  else {
  switch(rd1)
  {
   case '1':
       lcd_out(1,1,"Tubelight on");
       portb.rb0=1;
   case '2':
       lcd_out(1,1,"Fan on ");
       portb.rb1=1;
   case '3':
       lcd_out(1,1,"Tubelight off");
       portb.rb0=0;
   case '4':
       lcd_out(1,1,"Fan off ");
       portb.rb1=0;
   
  }
    }
 }while(rd1!= 'X');
}
void mod(char in)
{
   switch(in)
   {
    case 'A':  passchk();
    case 'B':  charout();
    case 'C':  switchcontrol();

   }
}
void main() {

trisc=0;
trisb=0;

lcd_init();
lcd_cmd(_lcd_clear);
lcd_cmd(_lcd_cursor_off);


error=soft_uart_init(&portb, 6,7,9600, 0);
if (error>0)
{
    lcd_out(1,1,"Error");
    while(1);
}
delay_ms(100);
lcd_out(1,1,"Enter mod");
delay_ms(1000);

lcd_out(1,1,"A: password");
lcd_out(2,1,"B: charout");
lcd_cmd(_lcd_clear);
lcd_out(1,1,"C: switch");


rd1=soft_uart_read(&error);
if (error) lcd_out(1,1,"Error1");
else  mod(rd1);






}