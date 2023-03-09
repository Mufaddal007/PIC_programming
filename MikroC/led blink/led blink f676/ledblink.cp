#line 1 "C:/Users/Mufaddal Darbar/Desktop/New folder/led blink f676/ledblink.c"



void main() {
TRISA.RA0=0x00 ;
OSCCAL=0x3f;
ANSEL=0x00;


while(1)
{
PORTA.RA0= 1 ; DELAY_MS(1000);
PORTA.RA0= 0 ; DELAY_MS(1000);

}
}
