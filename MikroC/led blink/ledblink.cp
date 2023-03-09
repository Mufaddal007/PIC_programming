#line 1 "D:/PIC programming/MikroC/led blink/ledblink.c"
void main() {
TRISB=0;
while(1){
PORTB=1;
delay_ms(1000);
PORTB=0;
delay_ms(1000);
 }
}
