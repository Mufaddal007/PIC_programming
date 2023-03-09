#line 1 "C:/Users/Mufaddal Darbar/Desktop/Project dumps/mikroc/SPI/SPI.c"
char i;
void main() {
 TRISC.RC3=0;
 TRISC.RC4=0;
 TRISC.RC5=0;
 TRISB=0x00;
 SSPEN_bit=1 ;
 SSPM0_bit=0;
 SSPM1_bit=0;
 SSPM2_bit=0;
 SSPM3_bit=0;

 CKE_bit=0 ;
 CKP_bit=0;
 SMP_bit=0 ;
 i=1;
 while(1)
 {
 while(i!=4){ SSPBUF=i; portb=SSPBUF; i<<=1; delay_ms(1000); }

 i=1;
 }

}
