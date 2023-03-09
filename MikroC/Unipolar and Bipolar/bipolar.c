short i,j;
void main() {
trisc=0x00;
trisa=0x00;
i=12;
j=1;
while(1)
{
ansel=0x00;
//
//i=(i>>1)|(i<<3)&(0x0f);  //for anticlock 
i=(i<<1)|(i>>3)&(0x0f);    //sequence for rotation
portc=i;
delay_ms(50);

//i=(i<<1)|(i>>3)&(0x0f);  //for anticlock
j=(j>>1)|(j<<3)&(0x0f);   //sequence for rotation
porta=j<<4;
portc=(j<<2)& 0xf0;
delay_ms(300);

}

}