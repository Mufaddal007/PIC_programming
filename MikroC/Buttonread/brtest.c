void main() {
TRISB.F7=255;
TRISB.F0=0;

while(1){
  if (!PORTB.F7)
  {
      PORTB.F0=1;
  }
  else
  {
    PORTB.F0=0;
  }
         }
}