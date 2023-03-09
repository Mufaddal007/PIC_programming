void main() {
               TRISB=0;
               while(1)
               {
               PORTB.RB0=1;
               delay_ms(1000);
               PORTB.RB0=0;

               PORTB.RB1=1;
               delay_ms(1000);
               PORTB.RB1=0;

               PORTB.RB2=1;
               delay_ms(1000);
               PORTB.RB2=0;

               PORTB.RB3=1;
               delay_ms(1000);
               PORTB.RB3=0;

               }
}