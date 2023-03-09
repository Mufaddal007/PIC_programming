void main() {
i2c1_init(100000);
delay_ms(100);
while(1){
i2c1_start();
i2c1_wr(0x0A);
i2c1_wr(0x77);
i2c1_wr(0x78);
i2c1_wr(0x79);
i2c1_repeated_start();
delay_ms(100);
      }
}