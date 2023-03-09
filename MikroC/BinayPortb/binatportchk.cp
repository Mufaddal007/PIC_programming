#line 1 "D:/PIC programming/MikroC/BinatPortb/binatportchk.c"
void main() {
 TRISB=0;
 while(1){
 PORTB=0b01010101;
 delay_ms(1000);
 PORTB=0b10101010;
 delay_ms(1000);
 }
}
