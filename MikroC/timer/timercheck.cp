#line 1 "D:/PIC programming/MikroC/timer/timercheck.c"
char seg[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
int d1=0, d2=0, d3=0, d4=0,v=0, i=0, j=0;
void start(int a);
void buttonread()
{
while(1){

 portc.rc0=0;
 portc.rc4=portc.rc5=portc.rc6=portc.rc7=0;
 for(i=0;i<6;i++)
 {
 if (!portc.rc2)
 { delay_ms(1000);
 start(14);
 }
 else if (!portc.rc3)
 { delay_ms(1000);
 start(24);
 }

 portb=seg[0] ;
 delay_ms(50);
 }

 portc.rc4=portc.rc5=portc.rc6=portc.rc7=1;
 delay_ms(100);

 }
}

void start(int a)
{ portc.rc0=1;

 for(i=a;i>=0;i--)
 {
 for(j=59;j>=0;j--)
 {


 d1=i/10;
 d2=i%10;
 d3=j/10;
 d4=j%10;

 for(v=0;v<50;v++){
 if (!portc.rc3 || !portc.rc2)
 { delay_ms(1000);
 return ;}
 portc.rc4=0;
 portb=seg[d1];
 delay_ms(5);
 portc.rc4=1;

 portc.rc5=0;
 portb=seg[d2]+0x80;
 delay_ms(5);
 portc.rc5=1;

 portc.rc6=0;
 portb=seg[d3];
 delay_ms(5);
 portc.rc6=1;

 portc.rc7=0;
 portb=seg[d4];
 delay_ms(5);
 portc.rc7=1;
 }

 }

 }
}

void main() {

trisb=0;
trisc.rc3=trisc.rc2=255;
trisc.rc0=trisc.rc4=trisc.rc5=trisc.rc6=trisc.rc7=0;
portc.rc4=portc.rc5=portc.rc6=portc.rc7=1;
portb=1;
while(1){
buttonread();
 }
 }
