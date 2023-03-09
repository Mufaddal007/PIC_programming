#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/timer0.c"
bit state;
char value;

void Interrupt(){
 if (TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0 = 61;
 value++;
 }
}

void main() {
 state=0;
 value=0;
 trisb.rb0=0;
 OPTION_REG = 0x87;
 TMR0 = 61;
 INTCON = 0xA0;

 while(1)
 {
 if (value==20)
 {
 value=0;
 state=1-state;
 portb.rb0=state;
 }
 }
}
