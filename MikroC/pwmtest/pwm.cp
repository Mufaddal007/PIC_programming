#line 1 "D:/PIC programming/MikroC/pwmtest/pwm.c"
void main()
{
 short current_duty_1 = 4;

 TRISC = 0x00;
 TRISB=1;
 PWM1_Init(5000);


 PWM1_Start();

 PWM1_Set_Duty(current_duty_1);
while (1)
 {

 int i=0;

 for(i=0;i<25;i++){
 current_duty_1+=10;
 PWM1_Set_Duty(current_duty_1);
 delay_ms(20); }
 for(i=0;i<25;i++)
 {
 current_duty_1-=10;
 PWM1_Set_Duty(current_duty_1);
 delay_ms(20);

 }
 PWM1_Set_Duty(0);

 delay_ms(200);

 }
}
