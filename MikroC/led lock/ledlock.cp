#line 1 "D:/PIC programming/MikroC/led lock/ledlock.c"
void main() {
trisb.rb0=0;

trisc.rc0=trisc.rc1=trisc.rc2=trisc.rc3=trisc.rc4=trisc.rc5=trisc.rc6=trisc.rc7=255;

while(1)
{

 if (portc.rc0 && portc.rc1 && portc.rc2 && portc.rc3 && !portc.rc4 && !portc.rc5 && !portc.rc6 && !portc.rc7)
 {
 portb.rb0=1;
 delay_ms(1000);
 }
 else
 {
 portb.rb0=0;
 }

}
}
