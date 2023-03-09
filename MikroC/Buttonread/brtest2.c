int state=0;
void main()
{
   TRISB.RB0=0;
   TRISB.RB7=255;
   while(1)
   {
       state=1-PORTB.RB7;
       PORTB.RB0=state;
       delay_ms(100);

   }
}