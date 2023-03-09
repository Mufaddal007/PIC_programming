#line 1 "D:/PIC programming/MikroC/Buzzersound/buzzertest.c"
int notesi=25;
void main(){
 int i;
 int notes[25]={262,262,294,262,349,330,262,262,294,262,392,349,262,262,524,440,349,330,294,466,466,440,349,392,349};
 char notes_duration[25]={1,1,2,2,2,3,1,1,2,2,2,3,1,1,2,2,2,2,2,1,1,2,2,2,3};
 TRISB=0;
 Sound_Init(&PORTC, 2);
 while(1)
 {
 for (i=0;i<notesi;i++){
 Sound_Play(notes[i], 400*notes_duration[i]);
 delay_ms(100);

 }
 delay_ms(3000);

 }
}
