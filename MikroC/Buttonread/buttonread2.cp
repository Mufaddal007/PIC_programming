#line 1 "D:/PIC programming/MikroC/Buttonread/buttonread2.c"
int state=0;
void main()
{
 TRISB.RB0=0;
 TRISB.RB7=255;
 while(1)
 {
 if (!PORTB.RB7)
 {
 state=1-state;
 }
 PORTB.RB0=state;
 delay_ms(300);

 }
}
