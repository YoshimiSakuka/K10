#ifndef __K60_PIT_H__
#define __K60_PIT_H__
#include "..\K60_datatype.h"


#define   IRQ_NUM_PIT1                             69
#define   IRQ_NUM_PIT0                             68
#define   PIT0_INIT_VAL                            45000  //150M 1us  //45//192us  // //9599999  // 100ms
#define   PIT1_INIT_VAL                            750000//192us  //9599999  // 100ms

#define   ENABLE_PIT0                              do{PIT_TCTRL0 |= PIT_TCTRL_TEN_MASK;}while(0)
#define   ENABLE_PIT1                              do{PIT_TCTRL1 |= PIT_TCTRL_TEN_MASK;}while(0)
#define   ENABLE_PIT2                              do{PIT_TCTRL2 |= PIT_TCTRL_TEN_MASK;}while(0)
#define   ENABLE_PIT3                              do{PIT_TCTRL3 |= PIT_TCTRL_TEN_MASK;}while(0)

 
#define   DISABLE_PIT0                             do{PIT_TCTRL0 &= ~PIT_TCTRL_TEN_MASK;}while(0)
#define   DISABLE_PIT1                             do{PIT_TCTRL1 &= ~PIT_TCTRL_TEN_MASK;}while(0)
#define   DISABLE_PIT2                             do{PIT_TCTRL2 &= ~PIT_TCTRL_TEN_MASK;}while(0)
#define   DISABLE_PIT3                             do{PIT_TCTRL3 &= ~PIT_TCTRL_TEN_MASK;}while(0)


#define   CLR_PIT0                                 do{PIT_TFLG0 |= PIT_TFLG_TIF_MASK;}while(0) //清中断
#define   CLR_PIT1                                 do{PIT_TFLG1 |= PIT_TFLG_TIF_MASK;}while(0) //清中断
#define   CLR_PIT2                                 do{PIT_TFLG2 |= PIT_TFLG_TIF_MASK;}while(0) //清中断
#define   CLR_PIT3                                 do{PIT_TFLG3 |= PIT_TFLG_TIF_MASK;}while(0) //清中断



/*****************************************************************************/
/*                         Function Declare                                  */
/*****************************************************************************/
void Timer0_Init(void);
void Timer1_Init(void);
void EnableTimer0(void) ;
void DisableTimer0(void) ;
void EnableTimer1(void) ;
void DisableTimer1(void) ;








#endif