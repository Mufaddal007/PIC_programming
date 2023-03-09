int state=0;
void main()
{
   TRISB.RB1=0;
   TRISB.RB0=255;
   while(1)
   {   
                 if (!PORTB.RB0)
                        {
                      state=1-state;
                       }
       PORTB.RB1=state;
       delay_ms(300);

   }
}