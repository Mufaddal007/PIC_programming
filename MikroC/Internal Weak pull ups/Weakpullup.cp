#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/Weak pull ups/Weakpullup.c"
bit state;

void main()
{
option_reg=0x00;
state=0;
delay_ms(100);
trisb.rb0=1;
trisb.rb1=0;

while(1)
{
 if (~portb.rb0) {delay_ms(300); state=~state; }
 portb.rb1=state;
}

}
