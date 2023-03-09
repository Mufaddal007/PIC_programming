#line 1 "D:/PIC programming/MikroC/7 segmen multiplex/MyProject.c"
char seg[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

int j=0;
int i;
void main() {
 int dig1,dig2,dig3,dig4;
 TRISB=TRISC=0;


 while(j<1000)
 {
 dig1=seg[j/1000];
 dig2=seg[(j%1000)/100];
 dig3=seg[(j%100)/10];
 dig4=seg[j%10];

 for (i=0;i<50;i++){

 PORTB=dig1;
 PORTC.RC4=0;
 delay_ms(5);
 PORTC.RC4=1;

 PORTB=dig2;
 PORTC.RC5=0;
 delay_ms(5);
 PORTC.RC5=1;

 PORTB=dig3;
 PORTC.RC6=0;
 delay_ms(5);
 PORTC.RC6=1;

 PORTB=dig4;
 PORTC.RC7=0;
 delay_ms(5);
 PORTC.RC7=1;

 }
 j++;
 }



}
