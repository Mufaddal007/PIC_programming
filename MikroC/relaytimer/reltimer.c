char seg[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
char seg1[]={0xBF,0x86,0xDB,0xCF,0xE6,0xED,0xFD,0x87,0xFF,0xEF};
int i,j,a,k;
int dig1,dig2,dig3,dig4;
sbit cat1 at RC4_bit;
sbit cat2 at RC5_bit;
sbit cat3 at RC6_bit;
sbit cat4 at RC7_bit;

void main() {
TRISB=TRISC=0;

while(1){
         PORTC.RC0=0;
cat1=cat2=cat3=cat4=1;
for (i=0;i<2;i++) {             //forward loop with led off
      for (j=0;j<60;j++)
      {

               dig1=seg[i/10];
               dig2=seg1[i%10];
               dig3=seg[j/10];
               dig4=seg[j%10];

         k=0;
         while(k<=1000){

               PORTB=dig1;
               cat1=0;
               delay_ms(5);
               cat1=1;


                 if (k<=500)
                 {
                    PORTB=dig2;
                       }
                 else if (k>500)
                 {
                    PORTB=seg[i%10];
                 }
                 cat2=0;
               delay_ms(5);
               cat2=1;



               PORTB=dig3;
               cat3=0;
               delay_ms(5);
               cat3=1;


               PORTB=dig4;
               cat4=0;
               delay_ms(5);
               cat4=1;

               k+=20;

                     }
         }
      }
                  PORTC.RC0=1;
    
for(i=0;i<3;i++){
               PORTB=seg[0];
               cat1=cat2=cat3=cat4=0;
               delay_ms(1000);
               cat1=cat2=cat3=cat4=1;
               delay_ms(1000);
                    }
for (i=1;i>=0;i--){          // backward loop with led on
      for (j=59;j>=0;j--)
      {

               dig1=seg[i/10];
               dig2=seg1[i%10];
               dig3=seg[j/10];
               dig4=seg[j%10];

         k=0;
         while(k<=1000){

               PORTB=dig1;
               cat1=0;
               delay_ms(5);
               cat1=1;


                 if (k<=500)
                 {
                    PORTB=dig2;
                       }
                 else if (k>500)
                 {
                    PORTB=seg[i%10];
                 }
                 cat2=0;
               delay_ms(5);
               cat2=1;



               PORTB=dig3;
               cat3=0;
               delay_ms(5);
               cat3=1;


               PORTB=dig4;
               cat4=0;
               delay_ms(5);
               cat4=1;

               k+=20;

                     }
         }
      }
for(i=0;i<3;i++){
               PORTB=seg[0];
               cat1=cat2=cat3=cat4=0;
               delay_ms(1000);
               cat1=cat2=cat3=cat4=1;
               delay_ms(1000);
                    }

      

      }
}