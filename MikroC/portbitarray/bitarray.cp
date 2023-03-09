#line 1 "D:/PIC programming/MikroC/portbitarray/bitarray.c"




void main() {
int i;
trisb=0;
 while(1){
 for(i=0;i<3;i++)
 {
 PORTB=1<<i;
 delay_ms(1000);
 } }
}
