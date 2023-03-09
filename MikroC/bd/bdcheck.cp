#line 1 "D:/PIC programming/MikroC/bd/bdcheck.c"
void main() {
TRISB.RB0=255;
TRISB.RB1=255;
TRISB.RB2=255;
TRISB.RB3=0;
TRISB.RB4=0;
TRISB.RB5=0;

while(1){
if(!portb.rb0)
{
 portb.rb4=1;
 delay_ms(1000);
 portb.rb4=0;
}
else if(!portb.rb1){
portb.rb3=1;
delay_ms(1000);
portb.rb3=0;
}
else if(!portb.rb2){
portb.rb5=1;
delay_ms(1000);
portb.rb5=0;
}


}
}
