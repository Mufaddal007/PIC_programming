#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/Multiple interrupts/multipleInterrupts.c"
int i;
void interrupt(){
 if(rbif_bit)
 {
 short portb_read=portb;
 if ((portb_read & 0xf0)==0xe0){ portc.rc0=1; delay_ms(1000); portc.rc0=0; }
 else if ((portb_read & 0xf0)==0xd0) { portc.rc1=1; delay_ms(1000); portc.rc1=0;}
 else if ((portb_read & 0xf0)==0xb0) { portc.rc1=1; delay_ms(1000); portc.rc1=0;}
 else if ((portb_read & 0xf0)==0x70) { portc.rc1=1; delay_ms(1000); portc.rc1=0;}
 else { for (i=0; i<3; i++){ portc.rc0=1; delay_ms(500); portc.rc0=0; delay_ms(500); }}

 rbif_bit=0;

 }
}
void main()
{
option_reg=0x00;
trisb.rb4=trisb.rb5=trisb.rb6=trisb.rb7=1;
trisc.rc0=trisc.rc1=trisc.rc2=trisc.rc3 =0;
gie_bit=1;
peie_bit=1;
rbie_bit=1;
rbif_bit=0;
while(1){ portc.rc0=portc.rc1=portc.rc2=portc.rc3=0;}
}
