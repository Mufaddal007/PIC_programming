#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/bcd to 7 segment/bcdto7segment.c"
char sevenseg[]={0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07,0x7f, 0x6f, 0x77,0x7c, 0x39 , 0x5e, 0x79, 0x71 } ;
char number;
void main() {
 trisb=0x0f;
 trisc=0x00;
 number=0;
 while(1)
 {
 number=portb&0x0f;
 portc=sevenseg[number];
 }
}
