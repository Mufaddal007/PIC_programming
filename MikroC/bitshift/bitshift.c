void main() {
while(1)
{
int i;
trisb=0;
portb=1;
delay_ms(1000);
  for(i=0;i<7;i++)
  {
        portb=portb<<1;;
        delay_ms(1000);

 }
}
}