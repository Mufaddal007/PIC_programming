#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/Timer1module/timer1module.c"
bit state;
short halfsec,sec;
void interrupt()
{
 if (tmr1if_bit){halfsec++; tmr1if_bit=0; tmr1h=0x0B; tmr1l=0xDC;}
}
void main()
{
state=halfsec=sec=0;
gie_bit=1;
PEIE_bit=1;
T1CON=49;
tmr1ie_bit=1;
tmr1if_bit=0;
tmr1h=0x0B;
tmr1l=0xDC;
trisb.rb0=0;
while(1)
{
 if(halfsec==2){ halfsec=0; state=~state; sec++;}
 portb.rb0=state;
}

}
