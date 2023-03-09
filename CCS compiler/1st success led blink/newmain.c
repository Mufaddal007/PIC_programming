#include <16F72.h>

#use delay(clock = 14.7456MHz)
 
void main(){
                           
    while(TRUE){                                      
      output_high(PIN_B0);
      delay_ms(300);// LED ON
      output_low(PIN_B0);
      output_high(PIN_B1);
      delay_ms(300);
      output_low(PIN_B1);
      output_high(PIN_B2);
      delay_ms(300);                                  
      output_low(PIN_B2);
       
      
    }
}
