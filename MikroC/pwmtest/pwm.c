void main()
{
  short current_duty_1  = 4; // initial value for current_duty_1

  TRISC = 0x00; // PORTC as output
  TRISB=1;
  PWM1_Init(5000);  // Initialize PWM1


  PWM1_Start();  // start PWM1

  PWM1_Set_Duty(current_duty_1);
while (1)
  {
  
   int i=0;

     for(i=0;i<25;i++){
      current_duty_1+=10;
      PWM1_Set_Duty(current_duty_1);
      delay_ms(20);  }
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