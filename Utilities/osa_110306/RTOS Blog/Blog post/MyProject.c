#include <osa.h>

void InitTimer0(){
  T0CON         = 0x88;
  TMR0H         = 0xD1;
  TMR0L         = 0x21;
  GIE_bit       = 1;
  TMR0IE_bit    = 1;
}

void Interrupt(){
  if (TMR0IF_bit){
    TMR0IF_bit    = 0;
    TMR0H         = 0xD1;
    TMR0L         = 0x21;
    //Enter your code here
    OS_Timer();      //incrementing by one tick
  }
}

#pragma funcall main Thread1   // Tell linker that function will be
                               // called indirectly
void Thread1(void)
{
      while(1)   //indefinite loop exists
      {
        //you may add any code that you may like

        portc.b1=~portc.b1;
        OS_Delay(1000);       // This inserts a delay for 1000 ticks
                             //a thread that does not call Delay or Yeild
                             //will not allow execution of other threads.
      }
}


#pragma funcall main Thread2       // Tell linker that function will be                                        // called indirectl
void Thread2(void)
{
       while(1)
      {


        portc.b2=portc.b2;
        OS_Delay(500);

      }
}

#pragma funcall main Thread3       // Tell linker that function will be                                        // called indirectl
void Thread3(void)
{

       while(1)
      {
       portc.b3=~portc.b3;
       OS_Delay(100);

      }
}

#pragma funcall main Thread4       // Tell linker that function will be                                        // called indirectl
void Thread4(void)
{
       while(1)
      {
          portc.b4=~portc.b4;
          OS_Delay(10);
      }
}

void main() {
    trisc=0;                     // setting portc as an output port
    portc=0;                     //initializing the port with zero value
    OS_Init();                   //must call to initialize OS services

    OS_Task_Create(0,Thread2);   //creates a task with highest priority
    OS_Task_Create(2,Thread1);   //thread2 has been created with the lowest priority
    OS_Task_Create(4,Thread3);
    OS_Task_Create(7,Thread4);   //remember that threads with very low priotity will 
                                 //receive time only if the scheduler finds enough
                                 //free time in schedule. If higher priotity tasks
                                 //are intense, this task might never execute in
                                 //some circumstances
                                 
    InitTimer0();                //Initiates the timer to count ticks

    OS_Run();                    //calls scheduler repeatedly
}