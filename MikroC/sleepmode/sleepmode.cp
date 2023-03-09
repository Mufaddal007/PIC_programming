#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/sleepmode/sleepmode.c"
short i;
void main() {

 option_reg=0x00;
 trisb.rb0=1;
 trisb.rb1=0;
 gie_bit=1;
 peie_bit=1;
 inte_bit=1;
 intf_bit=0;
 while(1){
 for (i=0;i<3;i++)
 {
 portb.rb1=0; delay_ms(1000);
 portb.rb1=1; delay_ms(300); }
 asm sleep;
 intf_bit=0;
 }
}
