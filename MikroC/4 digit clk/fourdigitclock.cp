#line 1 "D:/PIC programming/MikroC/4 digit clk/fourdigitclock.c"
char seg[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
char seg1[]={0xBF,0x86,0xDB,0xCF,0xE6,0xED,0xFD,0x87,0xFF,0xE7};
int i;
int j;
int a;
int k=0;
int dig1;
int dig2;
int dig3;
int dig4;
sbit cat1 at RC4_bit;
sbit cat2 at RC5_bit;
sbit cat3 at RC6_bit;
sbit cat4 at RC7_bit;
void main() {
 TRISB=0;
 TRISC=0;

for(a=0;a<12;a++)
{
 for (i=0;i<60;i++)

 {
 for (j=0;j<60;j++)
 {

 dig1=seg[i/10];
 dig2=seg[i%10];
 dig3=seg[j/10];
 dig4=seg[j%10];
#line 40 "D:/PIC programming/MikroC/4 digit clk/fourdigitclock.c"
 k=0;
 while(k<=1000){
 cat1=0;
 PORTB=dig1;
 delay_ms(5);
 cat1=1;

 cat2=0;
 PORTB=dig2;
 delay_ms(5);
 cat2=1;


 cat3=0;
 PORTB=dig3;
 delay_ms(5);
 cat3=1;

 cat4=0;
 PORTB=dig4;
 delay_ms(5);
 cat4=1;

 k+=20;

 }



 }

 }
 }


}
