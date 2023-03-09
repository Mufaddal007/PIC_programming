#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/USARTwithuno/usartwithuno.c"
char test[]="Test String Incoming \n";
char *p1;
void main()
{
UART1_init(9600);
delay_ms(100);
while(1){
p1=test;
while(*p1){UART1_Write(*p1); p1++ ; }
delay_ms(1000);
 }
}
