// Brown orange yellow red
sbit Stepper_pin1 at RB0_bit;
sbit Stepper_pin2 at RB1_bit;
sbit Stepper_pin3 at RB2_bit;
sbit Stepper_pin4 at RB3_bit;

sbit Stepper_pin1_Direction at TRISB0_bit;
sbit Stepper_pin2_Direction at TRISB1_bit;
sbit Stepper_pin3_Direction at TRISB2_bit;
sbit Stepper_pin4_Direction at TRISB3_bit;


void main() {
      TRISB=0;
      Stepper_Init(200);
      Stepper_speed(20);
      while(1)
      {
       Stepper_Step(100);
       delay_ms(500);
       Stepper_Step(-100);
       delay_ms(500);
      }
}