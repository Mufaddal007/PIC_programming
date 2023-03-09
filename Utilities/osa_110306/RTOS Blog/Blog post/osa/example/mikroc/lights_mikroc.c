 /*
  ************************************************************************************************
  *
  *  OSA example:   Running lights
  *
  *  URL:           http://wiki.pic24.ru/doku.php/en/osa/ref/intro
  *                 http://picosa.narod.ru
  *
  *----------------------------------------------------------------------------------------------
  *
  *  File:          lights_mikroc.c
  *
  *  Compilers:     mikroC
  *
  *  Controller:    PIC18
  *
  *  Programmer:    Timofeev Victor
  *                 osa@pic24.ru, testerplus@mail.ru
  *
  *  Description:   This is simple program written with RTOS OSA.
  *                 There are eight LEDs controlled by the program. The program
  *                 changes brightness of each LED and changes it in time.
  *
  ************************************************************************************************
  */
 

#include <osa.h>



//******************************************************************************
//  
//      Constants
// 
//******************************************************************************

//------------------------------------------------------------------------------
#if     defined(P18F252) || defined(P18F258) || defined(P18F242) || defined(P18F248)\
     || defined(P16F873) || defined(P16F876) || defined(P16F873A) || defined(P16F876A)
//------------------------------------------------------------------------------

    #define PORTA_CONST     0x00
    #define TRISA_CONST     0x01
    
    #define PORTB_CONST     0x00
    #define TRISB_CONST     0x01

    #define PORTC_CONST     0x00
    #define TRISC_CONST     0x00

    #define pin_BUTTON      PORTB.B0
    #define PORTLEDS        PORTC


    #define TABLE_MASK      7

//------------------------------------------------------------------------------
#elif   defined(P18F452) || defined(P18F458) || defined(P18F442) || defined(P18F448)\
     || defined(P16F877) || defined(P16F874) || defined(P16F877A) || defined(P16F874A)
//------------------------------------------------------------------------------

    #define PORTA_CONST     0x00
    #define TRISA_CONST     0x01

    #define PORTB_CONST     0x00
    #define TRISB_CONST     0x01

    #define PORTC_CONST     0x00
    #define TRISC_CONST     0x00

    #define PORTD_CONST     0x00
    #define TRISD_CONST     0x00

    #define PORTE_CONST     0x00
    #define TRISE_CONST     0x00

    #define pin_BUTTON      PORTB.B0
    #define PORTLEDS        PORTC

    #define NUMBER_OF_LEDS  8
    #define TABLE_MASK      7

//------------------------------------------------------------------------------
#endif
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Timers
//------------------------------------------------------------------------------

// Timer0 used as a counter for software PWM

#define T0CON_CONST     0x41        // prs = 4 (period = 256 * 4 * 0.2us = 200 us)
                                    // 8-bit mode
// TImer2 used for system ticks

#define T2CON_CONST     0x25        // post = 8, period = 250*4*5* 0.2 us = 1 ms
#define PR2_CONST       (250-1)     
#define ms              / 1         // 








//------------------------------------------------------------------------------


//******************************************************************************
//  
//      Global variables
// 
//******************************************************************************



//volatile short[] myArray={1,2,3,4,5,6};



//******************************************************************************
//  
//      Function prototypes
// 
//******************************************************************************

void    Init (void);
void    Thread1 (void);
void    Thread2 (void);
void    Thread3 (void);






/********************************************************************************
 *                                                                              *
 *  Function:       main                                                        * 
 *                                                                              *
 *------------------------------------------------------------------------------* 
 *                                                                              *
 ********************************************************************************/

// Tell to linker that these functions will be called indirrectly

#pragma funcall main Task_Rolling
#pragma funcall main Task_SetSpeed
#pragma funcall main Task_Button

void main (void)
{
    Init();                             // Init periphery

    OS_Init();                          // Init OS

    

    OS_Task_Create(0, Thread1);    // Create tasks.
    OS_Task_Create(0, Thread2);   //
    OS_Task_Create(0, Thread3);     //

                                        // Starting values:
                  // dircetion

    OS_EI();                            // Enable interrupts

    OS_Run();                           // Running scheduler void hello() iv 0x0018 ics ICS_AUTO {}

}


/********************************************************************************
 *                                                                              *
 *  Function:       Init                                                        *
 *                                                                              *
 *------------------------------------------------------------------------------* 
 *
 *  description:    Makes periphery initialization:
 *                  - I/O ports
 *                  - ADC
 *                  - timers
 *                  - interrupts
 *
 *  parameters:     void
 *
 *  on return:      void
 *
 ********************************************************************************/

void Init (void)
{

    //------------------------------------------------------------------------------
    //  I/O ports configuration
    //------------------------------------------------------------------------------

    PORTA = PORTA_CONST;
    PORTB = PORTB_CONST;

    TRISA = TRISA_CONST;
    TRISB = TRISB_CONST;

    NOT_RBPU_bit = 0;
    #if defined(PORTC_CONST)
        PORTC = PORTC_CONST;
        TRISC = TRISC_CONST;
    #endif

    #if defined(PORTD_CONST)
        PORTD = PORTD_CONST;
        TRISD = TRISD_CONST;
    #endif

    #if defined(PORTE_CONST)
        PORTE = PORTE_CONST;
        TRISE = TRISE_CONST;
    #endif

    //------------------------------------------------------------------------------
    //  ADC
    //------------------------------------------------------------------------------




    //------------------------------------------------------------------------------
    //  Timers init
    //------------------------------------------------------------------------------
    

      T2CON         = 0x4E;
      TMR2IE_bit         = 1;
      PR2                 = 250;
      INTCON         = 0xC0;
      

    

    //------------------------------------------------------------------------------
    //  Interrupts
    //------------------------------------------------------------------------------
    

    PEIE_bit = 1;

}

/********************************************************************************
 *
 *  Interrupts service routine
 *
 ********************************************************************************/

void interrupt (void)
{


    //******************************************************************************
    //  Software PWM
    //******************************************************************************
    
    if (T0IF_bit && T0IE_bit)
    {
        T0IF_bit = 0;

    }


    //******************************************************************************
    //  System timer (for system ticks)
    //******************************************************************************
    
    if (TMR2IF_bit)
    {
        TMR2IF_bit = 0;
        OS_Timer();
    }

}




/********************************************************************************
 *                                                                              *
 *  TASK:           Thread1                                               *
 *                                                                              *
 *------------------------------------------------------------------------------*
 *
 *  description:    This is the first thread in the program
 *
 ********************************************************************************/

void Thread1 (void)
{


    for (;;)
    {
              //add code here
    }
}

/********************************************************************************
 *                                                                              *
 *  TASK:           Task_Button                                                 * 
 *                                                                              *
 *------------------------------------------------------------------------------*
 *
 *  description:    Wait for button pressed (with debounce) and change rotation
 *                  direction
 *
 ********************************************************************************/

void Thread2 (void)
{
    for (;;)
    {


    }
}

/********************************************************************************
 *                                                                              *
 *  TASK:           Task_SetSpeed                                               * 
 *                                                                              *
 *------------------------------------------------------------------------------*
 *
 *  description:    Once per 100 ms check the AD value and set rotation speed
 *
 ********************************************************************************/

void Thread3 (void)
{
    for (;;)
    {

    }
}




//******************************************************************************
//  THE END
//******************************************************************************