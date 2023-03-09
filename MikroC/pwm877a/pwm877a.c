int i=0;

void main() {
trisc=0;
portc=0;

pwm1_init(5000);
pwm1_start();
while(1){
for(i=0;i<90;i+=2)
{pwm1_set_duty(i); delay_ms(100);}
for(;i;i-=2)
{pwm1_set_duty(i); delay_ms(100);}
}
pwm1_stop();
}