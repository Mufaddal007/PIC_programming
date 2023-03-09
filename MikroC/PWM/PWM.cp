#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/PWM/PWM.c"
int i=0;

void main() {
trisc=0;
portc=0;

pwm1_init(1000);
pwm1_start();
while(1){
for(i=0;i<100;i++)
{pwm1_set_duty(i); delay_ms(100);}

}
pwm1_stop();
}
