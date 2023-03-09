#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/lcd/lcd.c"
sbit rs at rb0_bit;
sbit en at rb1_bit;

sbit rs_dir at trisb0_bit;
sbit en_dir at trisb1_bit;

char name[]="MUFADDAL";
int i;
void lcdcmd(char cmd)
{
rs=0;
portc=cmd;
en=1;
delay_ms(1);
en=0;
}

void lcddata(char data1)
{
rs=1;
portc=data1;
en=1;
delay_ms(1);
en=0;
}

void main() {
trisb=0;
trisc=0;

lcdcmd(0x01);
delay_ms(1);
lcdcmd(0x0C);
delay_ms(1);
lcdcmd(0x38);
delay_ms(1);
for(i=0;i<8;i++)
{
lcdcmd(0x80+i);
lcddata(name[i]) ;
delay_ms(1000);
}

}
