#line 1 "D:/PIC programming/MikroC/7 segmen multiplex/sevsegmultiplex.c"
char seg[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

int j=0;
int i;
void main() {
 int dig1;
 int dig2;
 int dig3;
 int dig4;
 TRISB=0;
 TRISC=0;


 while(j<1000)
 {
 dig1=seg[j/1000];
 dig2=seg[(j%1000)/100];
 dig3=seg[(j%100)/10];
 dig4=seg[j%10];

 for (i=0;i<50;i++){

 PORTB=dig1;
 PORTC.F0=0;
 delay_ms(5);
 PORTC.F0=1;

 PORTB=dig2;
 PORTC.F1=0;
 delay_ms(5);
 PORTC.F1=1;

 PORTB=dig3;
 PORTC.F2=0;
 delay_ms(5);
 PORTC.F2=1;

 PORTB=dig4;
 PORTC.F3=0;
 delay_ms(5);
 PORTC.F3=1;

 }
 j++;
 }



}
