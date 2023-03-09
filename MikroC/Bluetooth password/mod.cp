#line 1 "D:/PIC programming/MikroC/btpass/mod.c"

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
{ lcd_cmd(_lcd_clear);
 lcd_out(1,1,"PW?");
 delay_ms(2000);
 lcd_cmd(_lcd_clear);
 for ( i=0;i<5;i++)
 {
 rd1=soft_uart_read(&error) ;
 if (error) lcd_out(1,1,"E1");
 else if (rd1==pass[i]) k++;
 }

 if (k==5) lcd_out(1,1,"T");
 else lcd_out(1,1,"F");

 delay_ms(1000);

 lcd_cmd(_lcd_clear);
}

void switchcontrol()
{
 lcd_cmd(_lcd_clear);
 lcd_out(1,1,"Sw");
 delay_ms(2000);
 lcd_cmd(_lcd_clear);
 do
 {
 rd1=soft_uart_read(&error) ;
 if (error) lcd_out(1,1,"E1");
 else {
 if (rd1=='1'){ portb.rb0=1;
 lcd_out(1,1,"T");}

 else if (rd1=='2') {portb.rb0=0;
 lcd_out(1,1,"t");}

 else if (rd1=='3') {portb.rb1=1;
 lcd_out(1,1,"F");}

 else if (rd1=='4') {portb.rb1=0;
 lcd_out(1,1,"f");}
 }
 }while(rd1!= 'X');
}
void charout()
{
 for(i=0;i<10;i++)
 {
 rd1=soft_uart_read(&error);
 if (error) lcd_out(1,1,"E1");
 else lcd_out(1,(i+1), rd1);
 }
 delay_ms(1000);
 lcd_cmd(_lcd_clear);
}
void mod(char in)
{
 switch(in)
 {
 case 'A': passchk();
 case 'B' : charout();
 case 'C': switchcontrol();

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
 lcd_out(1,1,"E");
 while(1);
}
delay_ms(100);

while(1){
lcd_out(1,1,"Mod?");
delay_ms(1000);
rd1=soft_uart_read(&error);
if (error) lcd_out(1,1,"E1");
else mod(rd1);
 }
}
