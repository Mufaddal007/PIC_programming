#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/i2c/oscby4.c"
int state;
void main() {
trisa.ra0=0;
ansel=0x00;
while(1)
{
 porta.ra0=state;
 state=~state;
 delay_ms(1000);
}
}
