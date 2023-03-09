#line 1 "D:/PIC programming/MikroC/led blink/ledblink1.c"
void main() {
TRISB=0;
while(1)
{

PORTB=0xff;
delay_ms(1000);
PORTB=0x00;
delay_ms(1000);
}

}
