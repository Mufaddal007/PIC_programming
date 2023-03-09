#line 1 "D:/PIC programming/MikroC/sevensegment interface/sevsegmentinterface.c"
char seg_code[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

void main(){
 int i;
 TRISB=0;
 while(1)
 {
 for (i=0;i<10;i++)
 {
 PORTB=seg_code[i];
 delay_ms(1000);
 }
 }
}
