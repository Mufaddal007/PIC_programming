#define myled0  portb.rb0
#define myled1 portb.rb1
#define myled2 portb.rb2

void main() {
int i;
trisb=0;
     while(1){
      for(i=0;i<3;i++)
      {
        PORTB=1<<i;
        delay_ms(1000);
      }       }
}