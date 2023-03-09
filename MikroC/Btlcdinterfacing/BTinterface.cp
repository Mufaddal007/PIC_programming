#line 1 "D:/PIC programming/MikroC/Btlcdinterfacing/BTinterface.c"
sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at Rc5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;
sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;


char error;
char byte_read;
int i=1;
int j=1;

void main() {
TRISB=0;
trisb.rb0=0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"check");
 delay_ms(2000);

error = Soft_UART_Init(&PORTB, 6, 7, 9600, 0);

if (error > 0) {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Error");
 while(1) ;
}
 Delay_ms(100);

 while(1) {
 if ((i>16) && (j==1))
 {i=1;
 j=2;}
 else if ((i>16) && (j==2))
 {
 lcd_cmd(_lcd_clear);
 i=1;
 j=1;
 }

 byte_read = Soft_UART_Read(&error) ;
 if (error) Lcd_Out(1,1,"Error");
 else{
 Lcd_chr(j,i, byte_read);
 delay_ms(1000);
 Soft_UART_Write(byte_read);
 if (byte_read=='1')
 {portb.rb0=1;
 lcd_cmd(_lcd_clear);
 lcd_out(1,1,"Led on") ;
 delay_ms(1000);
 }
 else if (byte_read=='0') {

 lcd_cmd(_lcd_clear);
 lcd_out(1,1,"Led off");
 delay_ms(1000);
 portb.rb0=0;

 }
 i++;
 }

}
}
