#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/Charlieplexing/charlieplexing.c"
const int setdelay=2000;
void main() {
trisb=0xff;
while(1)
{
trisb.rb0=0; trisb.rb1=0;
portb.rb0=1; portb.rb1=0; delay_ms(setdelay);
portb.rb0=0; portb.rb1=1; delay_ms(setdelay);
trisb.rb0=1; trisb.rb1=1;

trisb.rb0=0; trisb.rb2=0;
portb.rb0=1; portb.rb2=0; delay_ms(setdelay);
portb.rb0=0; portb.rb2=1; delay_ms(setdelay);
trisb.rb0=1; trisb.rb2=1;

trisb.rb0=0; trisb.rb3=0;
portb.rb0=1; portb.rb3=0; delay_ms(setdelay);
portb.rb0=0; portb.rb3=1; delay_ms(setdelay);
trisb.rb0=1; trisb.rb3=1;


trisb.rb1=0; trisb.rb2=0;
portb.rb1=1; portb.rb2=0; delay_ms(setdelay);
portb.rb1=0; portb.rb2=1; delay_ms(setdelay);
trisb.rb1=1; trisb.rb2=1;

trisb.rb1=0; trisb.rb3=0;
portb.rb1=1; portb.rb3=0; delay_ms(setdelay);
portb.rb1=0; portb.rb3=1; delay_ms(setdelay);
trisb.rb1=1; trisb.rb3=1;


trisb.rb2=0; trisb.rb3=0;
portb.rb2=1; portb.rb3=0; delay_ms(setdelay);
portb.rb2=0; portb.rb3=1; delay_ms(setdelay);
trisb.rb2=1; trisb.rb3=1;

}
}
