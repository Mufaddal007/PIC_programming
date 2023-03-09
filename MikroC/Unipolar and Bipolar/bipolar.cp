#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/bipolar/bipolar.c"
short i,j;
void main() {
trisc=0x00;
trisa=0x00;
i=12;
j=1;
while(1)
{
ansel=0x00;

i=(i<<1)|(i>>3)&(0x0f);
portc=i;
delay_ms(50);


j=(j>>1)|(j<<3)&(0x0f);
porta=j<<4;
portc=(j<<2)& 0xf0;
delay_ms(300);

}

}
