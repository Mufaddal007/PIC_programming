sbit Lcd_RS at RB0_bit;
sbit Lcd_EN at RB1_bit;
sbit Lcd_D4 at RB2_bit;
sbit Lcd_D5 at RB3_bit;
sbit Lcd_D6 at RB4_bit;
sbit Lcd_D7 at RB5_bit;

sbit Lcd_RS_Direction at TRISB0_bit;
sbit Lcd_EN_Direction at TRISB1_bit;
sbit Lcd_D4_Direction at TRISB2_bit;
sbit Lcd_D5_Direction at TRISB3_bit;
sbit Lcd_D6_Direction at TRISB4_bit;
sbit Lcd_D7_Direction at TRISB5_bit;
char test2[]="      ";
char test1[]="Hello";
const char character[] = {0,10,0,17,17,14,0,0};

void CustomChar(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}
void chrblink(int i,int j,char test[])
{
  TRISB=0;

      Lcd_Cmd(_LCD_CLEAR);
     Lcd_Out(i,j, test);
     delay_ms(500);
     Lcd_Out(i,j,test2);
     delay_ms(500);
}
void main() {
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);

while(1){
chrblink(1,1,test1);
CustomChar('2','1');
delay_ms(1000);

     }
              
}