float a;
char atostr[10];
sbit lcd_rs at rc2_bit ;
sbit lcd_en at rc3_bit ;
sbit lcd_d4 at rc4_bit;
sbit lcd_d5 at rc5_bit ;
sbit lcd_d6 at rc6_bit ;
sbit lcd_d7 at rc7_bit ;

sbit lcd_rs_direction at trisc2_bit;
sbit lcd_en_direction at trisc3_bit;
sbit lcd_d4_direction at trisc4_bit;
sbit lcd_d5_direction at trisc5_bit;
sbit lcd_d6_direction at trisc6_bit;
sbit lcd_d7_direction at trisc7_bit;


void main() {
lcd_init();
lcd_cmd(_lcd_clear);
lcd_cmd(_lcd_cursor_off);
a=25.78798;
floattostr_fixlen(a, atostr, 7);
lcd_out(1,1,atostr);




}