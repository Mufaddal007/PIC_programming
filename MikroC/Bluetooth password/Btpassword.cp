#line 1 "D:/PIC programming/MikroC/btpass/Btpassword.c"

char error;
char read[10]="     ";
char rd1;
int chk1=0;
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

for(i=0;i<5;i++)
{
 rd1=soft_uart_read(&error);

 if (error)
 {
 lcd_out(1,1,"Error1");
 }
 else{
 soft_uart_write(rd1);
 read[i]=rd1;
 if (read[i]==pass[i]) k++;
 lcd_chr(1,(i+1),rd1);

 }

}
if (k==5) chk1=1;
lcd_cmd(_lcd_clear);
lcd_out(1,1,"Pass is :");
lcd_out(1,10,pass);
lcd_out(2,1,"Read is:");
lcd_out(2,10,read);
delay_ms(2000);
lcd_cmd(_lcd_clear);
if(chk1 )
{
 lcd_out(1,1,"Unlocked");
}
else
{
 lcd_out(1,1,"failed");
 }


}
