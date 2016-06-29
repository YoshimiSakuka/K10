#include "PIT.h"
/*************************************************************************
PIT0初始化



*************************************************************************/




void Timer0_Init(void)
{
 
    // PIT clock enable:
    SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;
    
    // enable the clock for PIT Timers:
    PIT_MCR = 0;        //使能PIT时钟
     
    // config the period of PIT0:
    PIT_LDVAL0 = PIT0_INIT_VAL;         //定时器未设置  频率为PLL频率 （96M） 
    
    // enable interrupt for PIT0:
    PIT_TCTRL0 |= PIT_TCTRL_TIE_MASK;  // TIE=1:Interrupt will be requested whenever TIF is set
    
    enable_irq(IRQ_NUM_PIT0);
    
}


void Timer1_Init(void)
{
 
    // PIT clock enable:
    SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;
    
    // enable the clock for PIT Timers:
    PIT_MCR = 0;
     
    // config the period of PIT0:
    PIT_LDVAL1 = PIT1_INIT_VAL;
    
    // enable interrupt for PIT0:
    PIT_TCTRL1 |= PIT_TCTRL_TIE_MASK;  // TIE=1:Interrupt will be requested whenever TIF is set
    
    enable_irq(IRQ_NUM_PIT1);
    
}

/******************************************************************
Function:           EnableTimer0
Description:        Initialize timer
Calls:
Called By:          NONE
Input:              NONE
Output:             NONE
Return:             NONE
******************************************************************/

void EnableTimer0(void) 
{
    ENABLE_PIT0;   
}


void EnableTimer1(void) 
{
    ENABLE_PIT1;   
}
/******************************************************************
Function:           DisableTimer0
Description:        Initialize timer
Calls:
Called By:          NONE
Input:              NONE
Output:             NONE
Return:             NONE
******************************************************************/

void DisableTimer0(void) 
{  
    DISABLE_PIT0;  
}

void DisableTimer1(void) 
{  
    DISABLE_PIT1;  
}