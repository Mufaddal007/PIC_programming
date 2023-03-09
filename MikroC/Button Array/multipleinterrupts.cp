#line 1 "D:/PIC programming/MikroC/Button Array/multipleinterrupts.c"
char col;
char row;
char i,j;
sbit lcd_rs at rc2_bit;
sbit lcd_en at rc3_bit;
sbit lcd_d4 at rc4_bit;
sbit lcd_d5 at rc5_bit;
sbit lcd_d6 at rc6_bit;
sbit lcd_d7 at rc7_bit;

sbit lcd_rs_direction at trisc2_bit;
sbit lcd_en_direction at trisc3_bit;
sbit lcd_d4_direction at trisc4_bit;
sbit lcd_d5_direction at trisc5_bit;
sbit lcd_d6_direction at trisc6_bit;
sbit lcd_d7_direction at trisc7_bit;
void find_col()
{
col=(portb&0xF0);


 col=~(col>>4);
 for(i=0;i<4;i++)
 { if(col &(1<<i)){ col=i+1; j=col; break; } }
}
void find_row()
{
 for (i=0;i<4;i++)
 {
 portb=~(1<<i);
 if (portb>>4 != 0x0F) {row=i+1; break;}
 }
 delay_ms(200);
 portb=0xf0;
}

void interrupt()
{
 if(rbif_bit){ find_col(); find_row(); portd=((1<<(row-1))|(1<<(3+j))); rbif_bit=0;}
}
void main()
{
lcd_init();
lcd_cmd(_lcd_cursor_off);
lcd_cmd(_lcd_clear);
trisb=0xF0;
portb=0xF0;
trisc=0;
trisd=0;
portc=0;
portd=0;
gie_bit=1;
peie_bit;
rbie_bit=1;
rbif_bit=0;
while(1){
lcd_out(1,1,"Row pos:   ");
lcd_chr(1,15,(char)row%10+48);
lcd_out(2,1,"Column pos:");
lcd_chr(2,15,(char)j%10+48);

};

}
