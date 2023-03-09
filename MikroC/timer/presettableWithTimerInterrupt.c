sbit bt1 at rc2_bit;
sbit bt2 at rc3_bit;
sbit bt1_direction at trisc2_bit;
sbit bt2_direction at trisc3_bit;

char seg[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

int  d1=0, d2=0, d3=0, d4=0,i=0, j=0,v =0,minutes=0;
int minutes=0, seconds=0;
void mode1();
void mode2();
void mode21();
void mode22();

void Interrupt(){
  if (TMR0IF_bit){
    TMR0IF_bit	 = 0;
    TMR0 = 61;
    seconds-=1;
	if(seconds==-1) minutes-=1;
  }
}
void start(int a)
{  portc.rc0=1;
   minutes=a-1;
   seconds=60;
   while(minutes>=0){
	  d1=i/10;
      d2=i%10;
      d3=j/10;
      d4=j%10;   
	  if (!bt1 || !bt2)
      { delay_ms(300);  return ;}
  
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
void mode1()
{  while(1){
   portc.rc4=portc.rc5=portc.rc6=portc.rc7=0;
   portb=seg[0];
   for(i=0;i<6;i++){
     if (!bt1) {
         delay_ms(300);
         start(15);
         portc.rc0=0;
         return;}
     else if (!bt2)
     {
         delay_ms(300);
         start(25);
         portc.rc0=0;
         return;
     }
     delay_ms(50);
     }
     portc.rc4=portc.rc5=portc.rc6=portc.rc7=1;
     delay_ms(100);
      }
}
void mode2()
{   portc.rc7=1;
    while(1)
    {
    if (!bt1)
    {
      delay_ms(300);
      mode21();
      return;
    }
    else if (!bt2)
    {
      delay_ms(300);
      mode22();
      return;
    }
    }
}
void mode21()
{
  portc.rc6=1;
   portc.rc7=1;
   while(1)
    {
      d1=minutes/10;
      d2=minutes%10;


      portc.rc4=0;
      portb=seg[d1];
      delay_ms(5);
      portc.rc4=1;

      portc.rc5=0;
      portb=seg[d2];
      delay_ms(5);
      portc.rc5=1;

      if (!bt1){
         delay_ms(200);
          minutes++;}
      else if (!bt2)
      {
        delay_ms(300);
        start(minutes);
        portc.rc0=0;
        minutes=0;
        return;
      }

     }
}
void mode22()
{
portc.rc6=1;
   portc.rc7=1;
   while(1)
    {
      d1=minutes/10;
      d2=minutes%10;


      portc.rc4=0;
      portb=seg[d1];
      delay_ms(5);
      portc.rc4=1;

      portc.rc5=0;
      portb=seg[d2];
      delay_ms(5);
      portc.rc5=1;

      if (!bt1){
         delay_ms(200);
          minutes+=10;}
      else if (!bt2)
      {
        delay_ms(300);
        start(minutes);
        portc.rc0=0;
        minutes=0;
        return;
      }

     }
}

void main() {
trisb=0;
bt1=bt2=255;

 OPTION_REG	 = 0x87;
  TMR0		 = 0;
  INTCON	 = 0xA0;
trisc.rc0=trisc.rc4=trisc.rc5=trisc.rc6=trisc.rc7=0;
portc.rc4=portc.rc5=portc.rc6=portc.rc7=1;
while(1)
{
  portc.rc4=portc.rc5=portc.rc6=portc.rc7=0;
  portb=seg[0];
  if(!bt1) {
      delay_ms(300);
      mode1();}
  else if (!bt2)
      {
      delay_ms(300);
      mode2();}
}
}