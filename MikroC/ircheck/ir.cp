#line 1 "D:/PIC programming/MikroC/ircheck/ir.c"
sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;






char text[3];
bit rc5_ok, toggle_bit;
unsigned short rc5_state, address, command, i;
unsigned int rc5_code, timer_value;

void Interrupt() {
 if (RBIF_bit && (PORTB.F0 || !PORTB.F0)){
 RBIF_bit = 0;
 if(rc5_state != 0){
 timer_value = (TMR1H << 8) + TMR1L;
 TMR1H = 0;
 TMR1L = 0;
 }
 switch(rc5_state){
 case 0 :
 TMR1H = 0;
 TMR1L = 0;
 TMR1ON_bit = 1;
 rc5_state = 1;
 i = 0;
 break;
 case 1 :
 if((timer_value >  2000 ) || (timer_value <  700 )){
 rc5_state = 0;
 TMR1ON_bit = 0;
 break;
 }
 rc5_code |= 1 << (13 - i);
 i++;
 if(i > 13){
 rc5_ok = 1;
 RBIE_bit = 0;
 break;
 }
 if(timer_value >  1200 ){
 rc5_state = 2;
 if(i == 13){
 rc5_ok = 1;
 rc5_code &= ~1;
 RBIE_bit = 0;
 break;
 }
 }
 else
 rc5_state = 3;
 break;
 case 2 :
 if((timer_value >  2000 ) || (timer_value <  700 )){
 rc5_state = 0;
 TMR1ON_bit = 0;
 break;
 }
 rc5_code &= ~(1 << (13 - i));
 i++;
 if(timer_value >  1200 )
 rc5_state = 1;
 else
 rc5_state = 4;
 break;
 case 3 :
 if((timer_value >  1200 ) || (timer_value <  700 )){
 TMR1ON_bit = 0;
 rc5_state = 0;
 break;
 }
 else
 rc5_state = 1;
 break;
 case 4 :
 if((timer_value >  1200 ) || (timer_value <  700 )){
 TMR1ON_bit = 0;
 rc5_state = 0;
 break;
 }
 else
 rc5_state = 2;
 if(i == 13){
 rc5_ok = 1;
 rc5_code &= ~1;
 RBIE_bit = 0;
 }
 }
 }
 if (TMR1IF_bit){
 TMR1IF_bit = 0;
 rc5_state = 0;
 TMR1ON_bit = 0;
 }
}

void main() {

 rc5_ok = 0;
 rc5_state = 0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 TMR1IF_bit = 0;
 RBIF_bit = 0;
 TMR1IE_bit = 1;
 T1CON = 0x10;
 INTCON = 0xC8;

 Lcd_Out(1, 1, "ADS:0x00  TGL: 0");
 Lcd_Out(2, 1, "CMD:0x00");
 while(1) {
 while(!rc5_ok);
 rc5_ok = 0;
 rc5_state = 0;
 TMR1ON_bit = 0;
 toggle_bit = rc5_code >> 11;
 address = (rc5_code >> 6) & 0x1F;
 command = rc5_code & 0x3F;
 Lcd_Chr(1, 16, toggle_bit + 48);
 ByteToHex(address, text);
 Lcd_Out(1, 7, text);
 ByteToHex(command, text);
 Lcd_Out(2, 7, text);
 RBIE_bit = 1;
 } }
