char test[]="Test String Incoming \n";
char *p1;
void main()
{
UART1_init(9600);  //initializing USART module with 9600 baud rate
delay_ms(100);
while(1){
p1=test;
while(*p1){UART1_Write(*p1);   p1++ ; } // writing character one by one on serial transmitter  pin
delay_ms(1000);        //   1 Second delay.
  }
}