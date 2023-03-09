#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/SPI/SPI1.c"
short read;
void interrupt() {
if (SSPIF_bit)
{
 read=SSPBUF;
 SSPIF_bit=0;
}}
void main() {
read=0;
TRISC.RC3=1;
TRISC.RC4=1;
TRISC.RC5=1;
TRISB=0X00;
GIE_bit=1;
PEIE_bit=1;
SSPIE_bit=1;
SSPIF_bit=0;
BF_Bit=0;
SSPEN_bit=1;
CKP_bit=0;
CKE_bit=0;
SMP_bit=0;
SSPM0_bit=1;
SSPM1_bit=0;
SSPM2_bit=1;
SSPM3_bit=0;
while(1){
if (BF_bit){read=SSPBUF; SSPBUF=0; BF_bit=0; }

PORTB=SSPBUF;}

}
