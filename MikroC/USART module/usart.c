sbit lcd_rs at rb2_bit; sbit lcd_en at rb3_bit; sbit lcd_d4 at rb4_bit; sbit lcd_d5 at rb5_bit; sbit lcd_d6 at rb6_bit; sbit lcd_d7 at rb7_bit;
sbit lcd_rs_direction at trisb2_bit; sbit lcd_en_direction at trisb3_bit; sbit lcd_d4_direction at trisb4_bit; sbit lcd_d5_direction at trisb5_bit; sbit lcd_d6_direction at trisb6_bit; sbit lcd_d7_direction at trisb7_bit;
char ch;
void interrupt()
{
if (rcif_bit)
{ch=rcreg;
delay_ms(500);}}

void intr_init()
{
gie_bit=1;
peie_bit=1;
txie_bit=1;
rcie_bit=1;
rcif_bit=0;
}
void init_usart(){
spbrg=25;
brgh_bit=1;

sync_bit=0;
spen_bit=1;

txen_bit=1;
cren_bit=0;

tx9_bit=0;
rx9_bit=0;
}
void transmit(char ch)
{while(!txif);
txreg=ch;}
char receive()
{while(!rcif);
ch=rcreg;
return rcreg;}

void main()
{
trisc.rc6=0;
trisc.rc7=1;
intr_init();
init_usart();
lcd_init();
lcd_cmd(_lcd_clear);
lcd_cmd(_lcd_cursor_off);
while(1){lcd_chr(1,1,ch);};
}





