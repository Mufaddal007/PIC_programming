#define ON 1
#define OFF 0

void main() {
TRISA.RA0=0x00 ;          // Set direction of the PORTA  as output
OSCCAL=0x3f;          //Load Oscillator caliberation register
ANSEL=0x00;           // Use all analog input pins as Digital I/O pins

                         // Infinite loop
while(1)
{
PORTA.RA0=ON;         DELAY_MS(1000);           // One second ON
PORTA.RA0=OFF;        DELAY_MS(1000);         // One second OFF

}
}