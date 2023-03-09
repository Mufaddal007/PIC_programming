//any charlieplexed circuit can control n*(n-1) leds using n number of pins here 4 pins are used rb0, rb1, rb2, rb3
const int setdelay=2000;
void main() {
trisb=0xff;
while(1)
{
trisb.rb0=0; trisb.rb1=0;
portb.rb0=1; portb.rb1=0; delay_ms(setdelay);     //between rb0  and rb1
portb.rb0=0; portb.rb1=1; delay_ms(setdelay);
trisb.rb0=1; trisb.rb1=1;

trisb.rb0=0; trisb.rb2=0;                        //between rb0 and rb2
portb.rb0=1; portb.rb2=0; delay_ms(setdelay);
portb.rb0=0; portb.rb2=1; delay_ms(setdelay);
trisb.rb0=1; trisb.rb2=1;

trisb.rb0=0; trisb.rb3=0;
portb.rb0=1; portb.rb3=0; delay_ms(setdelay);       //between rb0 and rb3
portb.rb0=0; portb.rb3=1; delay_ms(setdelay);
trisb.rb0=1; trisb.rb3=1;


trisb.rb1=0; trisb.rb2=0;
portb.rb1=1; portb.rb2=0; delay_ms(setdelay);        //between rb1 and rb2
portb.rb1=0; portb.rb2=1; delay_ms(setdelay);
trisb.rb1=1; trisb.rb2=1;

trisb.rb1=0; trisb.rb3=0;
portb.rb1=1; portb.rb3=0; delay_ms(setdelay);    //between rb1 and rb3
portb.rb1=0; portb.rb3=1; delay_ms(setdelay);
trisb.rb1=1; trisb.rb3=1;


trisb.rb2=0; trisb.rb3=0;
portb.rb2=1; portb.rb3=0; delay_ms(setdelay);
portb.rb2=0; portb.rb3=1; delay_ms(setdelay);      //between rb2 and rb3
trisb.rb2=1; trisb.rb3=1;

}
}