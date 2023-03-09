#line 1 "C:/Users/Nouman Qaiser/Documents/Embedded Systems/Blog post/MyProject.c"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osacfg.h"
#line 1068 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
typedef  unsigned char  _OST_SMSG;
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/port/osa_include.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/port/pic18/osa_pic18_mikroc.h"
#line 41 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/port/pic18/osa_pic18_mikroc.h"
typedef unsigned char OST_UINT8;
typedef unsigned int OST_UINT16;
typedef unsigned long OST_UINT32;
typedef unsigned char OST_BOOL;

typedef OST_UINT8 OST_UINT;
#line 93 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/port/pic18/osa_pic18_mikroc.h"
extern volatile unsigned int _fsr;
extern volatile char _indf;
extern volatile char _postinc;
extern volatile char _postdec;
extern volatile char _preinc;

extern volatile unsigned char _fsr1l;

extern volatile char _pcl;
extern volatile char _pclath;
extern volatile char _pclatu;
extern volatile char _status;
extern volatile char _tosl;
extern volatile char _tosh;
extern volatile char _tosu;
extern volatile char _bsr;
extern volatile char _wreg;
extern volatile char _intcon;
extern volatile char _rcon;
extern volatile char _stkptr;
#line 251 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/port/pic18/osa_pic18_mikroc.h"
void _OS_JumpToTask (void);
#line 288 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/port/pic18/osa_pic18_mikroc.h"
extern void _OS_ReturnSave (void);
extern void _OS_ReturnNoSave (void);
extern void _OS_EnterWaitMode (void);
extern void _OS_EnterWaitModeTO (void);

extern void _OS_SET_FSR_CUR_TASK (void);
#line 397 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/port/pic18/osa_pic18_mikroc.h"
char OS_DI (void);
void OS_RI (char);
#line 419 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/port/pic18/osa_pic18_mikroc.h"
extern void _OS_CheckEvent (OST_UINT);
#line 1092 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
typedef  unsigned char  OST_SMSG;
#line 1110 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
typedef  void *  OST_MSG;







typedef

 volatile

 struct _OST_MSG_CB
{
 OST_UINT status;
 OST_MSG msg;

} OST_MSG_CB;
#line 1139 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
typedef struct
{
 OST_UINT cSize;
 OST_UINT cFilled;
 OST_UINT cBegin;

} OST_QUEUE_CONTROL;




typedef struct
{
 OST_QUEUE_CONTROL Q;
 OST_MSG *pMsg;

} OST_QUEUE;




typedef struct
{
 OST_QUEUE_CONTROL Q;
 OST_SMSG *pSMsg;

} OST_SQUEUE;
#line 1190 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
typedef struct
{
 OST_UINT bEventError : 1;
 OST_UINT bError : 1;

 OST_UINT bInCriticalSection : 1;

 OST_UINT bCheckingTasks : 1;


 OST_UINT bBestTaskFound : 1;





  OST_UINT bTimeout : 1; OST_UINT bGIE_CTemp : 1; OST_UINT bGIEL_CTemp : 1; 



 OST_UINT bEventOK : 1;







} OST_SYSTEM_FLAGS;
#line 1235 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
typedef struct
{
 OST_UINT cPriority : 3;
 OST_UINT bReady : 1;
 OST_UINT bDelay : 1;


 OST_UINT bCanContinue: 1;
 OST_UINT bEnable : 1;
 OST_UINT bPaused : 1;


  


} OST_TASK_STATE;
#line 1270 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
typedef struct
{
 OST_TASK_STATE State;
  unsigned long  pTaskPointer;




  



  OST_UINT32  Timer;


} OST_TCB;
#line 1477 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
typedef OST_UINT8 OST_CSEM;
#line 1506 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
extern volatile   OST_SYSTEM_FLAGS _OS_Flags;
extern   OST_UINT _OS_Temp;


extern volatile   OST_UINT _OS_TempH;




extern volatile   OST_TASK_STATE _OS_State;
#line 1527 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
extern   OST_TCB *    volatile _OS_CurTask;
#line 1563 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/osa.h"
 extern   OST_UINT _OS_Best_Priority;
 extern   OST_UINT _OS_Worst_Priority;
 extern   OST_UINT _OS_Best_n;
 extern   OST_UINT _OS_Cur_Pos;
 extern   OST_UINT _OS_n;
 extern   OST_UINT8 _OS_TaskQueue[ 4 ];
 extern   OST_UINT8 _OS_TaskLevel[ 4 ];
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/osa_oldnames.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/system/osa_system.h"
#line 48 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/system/osa_system.h"
extern void OS_Init (void);



extern void OS_EnterCriticalSection (void);
extern void OS_LeaveCriticalSection (void);
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/system/osa_tasks.h"
#line 37 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/system/osa_tasks.h"
extern   OST_TCB _OS_Tasks[ 4 ];






void _OS_Task_Create(OST_UINT priority,  unsigned long  TaskAddr);
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/events/osa_bsem.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/events/osa_csem.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/events/osa_flag.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/events/osa_msg.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/events/osa_queue.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/events/osa_smsg.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/events/osa_squeue.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/timers/osa_stimer.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/timers/osa_stimer_old.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/timers/osa_dtimer.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/timers/osa_qtimer.h"
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/timers/osa_ttimer.h"
#line 53 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/timers/osa_ttimer.h"
void _OS_InitDelay( OST_UINT32  Delay);
#line 1 "c:/users/nouman qaiser/documents/embedded systems/blog post/osa/kernel/timers/osa_timer.h"
#line 3 "C:/Users/Nouman Qaiser/Documents/Embedded Systems/Blog post/MyProject.c"
void InitTimer0(){
 T0CON = 0x88;
 TMR0H = 0xD1;
 TMR0L = 0x21;
 GIE_bit = 1;
 TMR0IE_bit = 1;
}

void Interrupt(){
 if (TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0H = 0xD1;
 TMR0L = 0x21;

  { { ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;  { ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; } } ; { OST_UINT _os_i; ; ; for (_os_i = 0; _os_i < 4 ; _os_i++) { if (_OS_Tasks[_os_i].State.bDelay){ if (!++_OS_Tasks[_os_i].Timer) _OS_Tasks[_os_i].State.bDelay = 0; } } } ; ; ; ; } ;
 }
}
#pragma funcall main Thread1
#line 23 "C:/Users/Nouman Qaiser/Documents/Embedded Systems/Blog post/MyProject.c"
void Thread1(void)
{
 while(1)
 {


 portc.b1=~portc.b1;
  { _OS_InitDelay(1000); { _OS_ReturnSave(); asm{ nop } ; } ; } ;


 }
}
#pragma funcall main Thread2
#line 38 "C:/Users/Nouman Qaiser/Documents/Embedded Systems/Blog post/MyProject.c"
void Thread2(void)
{
 while(1)
 {


 portc.b2=portc.b2;
  { _OS_InitDelay(500); { _OS_ReturnSave(); asm{ nop } ; } ; } ;

 }
}
#pragma funcall main Thread3
#line 51 "C:/Users/Nouman Qaiser/Documents/Embedded Systems/Blog post/MyProject.c"
void Thread3(void)
{

 while(1)
 {
 portc.b3=~portc.b3;
  { _OS_InitDelay(100); { _OS_ReturnSave(); asm{ nop } ; } ; } ;

 }
}
#pragma funcall main Thread4
#line 63 "C:/Users/Nouman Qaiser/Documents/Embedded Systems/Blog post/MyProject.c"
void Thread4(void)
{
 while(1)
 {
 portc.b4=~portc.b4;
  { _OS_InitDelay(10); { _OS_ReturnSave(); asm{ nop } ; } ; } ;
 }
}

void main() {
 trisc=0;
 portc=0;
 OS_Init();

  { _OS_Task_Create(0, ( unsigned long )&(Thread2)); } ;
  { _OS_Task_Create(2, ( unsigned long )&(Thread1)); } ;
  { _OS_Task_Create(4, ( unsigned long )&(Thread3)); } ;
  { _OS_Task_Create(7, ( unsigned long )&(Thread4)); } ;





 InitTimer0();

  for(;;) { _OS_Flags.bBestTaskFound = 0; _OS_Flags.bCheckingTasks = 1; _OS_Best_Priority = 0; _OS_Worst_Priority = 0; ; _OS_n = 4 ; do { _OS_Cur_Pos = _OS_TaskQueue[_OS_n-1];  _OS_CurTask = &_OS_Tasks[_OS_Cur_Pos]; _OS_State = _OS_CurTask->State ; if (! _OS_State.bEnable  || _OS_State.bPaused ) goto _OS_SCHED_CONTINUE; ; if (! _OS_State.bReady )  { _OS_SCHED_RUN:; _OS_JumpToTask() ; _OS_SET_FSR_CUR_TASK(); _indf &= ~( 0x08  | 0x20 ); _indf |= *((char*)&_OS_State) & ( 0x08  | 0x20 ); ; ; if (!_OS_Flags.bCheckingTasks) { if ( _OS_State.bReady  || _OS_Flags.bEventOK) { _OS_TaskLevel[_OS_Cur_Pos] -= _OS_Worst_Priority; _OS_n = _OS_Best_n; while (_OS_n) { _OS_TaskQueue[_OS_n] = _OS_TaskQueue[_OS_n-1]; _OS_n--; } _OS_TaskQueue[0] = _OS_Cur_Pos; ; } goto SCHED_END; } } if ( _OS_State.bDelay  && ! _OS_State.bCanContinue ) goto _OS_SCHED_CONTINUE; ; if ( _OS_State.bReady )  { _OS_Temp = _OS_TaskLevel[_OS_Cur_Pos]; if (!(_OS_Temp & 0x80)) { _OS_Temp += 8; _OS_Temp -= _OS_CurTask->State.cPriority; _OS_TaskLevel[_OS_Cur_Pos] = _OS_Temp; } ; if (_OS_Temp > _OS_Best_Priority) { _OS_Worst_Priority = _OS_Best_Priority; _OS_Best_Priority = _OS_Temp; _OS_Best_n = _OS_n-1; _OS_Flags.bBestTaskFound = 1; } else if (_OS_Temp > _OS_Worst_Priority) { _OS_Worst_Priority = _OS_Temp; } } _OS_SCHED_CONTINUE:;  } while ( 1  && --_OS_n); if (_OS_Flags.bBestTaskFound) { _OS_Flags.bCheckingTasks = 0; _OS_Flags.bEventOK = 0; _OS_Cur_Pos = _OS_TaskQueue[_OS_Best_n]; _OS_CurTask = &_OS_Tasks[_OS_Cur_Pos]; _OS_State = _OS_CurTask->State ; if ( _OS_State.bEnable  && ! _OS_State.bPaused ) goto _OS_SCHED_RUN; } SCHED_END:; } ;
}
