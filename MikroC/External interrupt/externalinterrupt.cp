#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/externalinterrupt.c"
bit state;
void interrupt()
{
 if (INTF_bit) { delay_ms(300); state=1-state; INTF_bit=0;}
}
void main() {
state=0;
trisb.b1=0;
INTEDG_bit=0;
INTCON.GIE=1;
INTCON.PEIE=1;
INTCON.INTE=1;
INTCON.INTF=0;
while(1) { PORTB.B1=state; }
}
