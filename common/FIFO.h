#ifndef _FIFO_H_
#define _FIFO_H_
#include "..\K60_datatype.h"




#define FIFO_WRST_PORT     PTC_BASE_PTR		//WRST
#define FIFO_WRST_PIN      8

#define FIFO_RRST_PORT   PTC_BASE_PTR
#define FIFO_RRST_PIN    10
#define FIFO_RCK_PORT     PTD_BASE_PTR		//RCK
#define FIFO_RCK_PIN      0
#define FIFO_WREN_PORT     PTC_BASE_PTR		//WREN
#define FIFO_WREN_PIN      6

#define VSYNC_PORT       PTA_BASE_PTR
#define VSYNC_PIN        24

#define HREF_PORT   PTA_BASE_PTR  
#define HREF_PIN    25

#define FIFO_WRST_H()    GPIO_SetBits(FIFO_WRST_PORT,FIFO_WRST_PIN);
#define FIFO_WRST_L()    GPIO_ResetBits(FIFO_WRST_PORT,FIFO_WRST_PIN);

#define FIFO_RRST_H()  GPIO_SetBits(FIFO_RRST_PORT,FIFO_RRST_PIN);
#define FIFO_RRST_L()  GPIO_ResetBits(FIFO_RRST_PORT,FIFO_RRST_PIN);

#define FIFO_RCK_H()    GPIO_SetBits(FIFO_RCK_PORT,FIFO_RCK_PIN);
#define FIFO_RCK_L()    GPIO_ResetBits(FIFO_RCK_PORT,FIFO_RCK_PIN);

#define FIFO_WREN_H()    GPIO_SetBits(FIFO_WREN_PORT,FIFO_WREN_PIN);
#define FIFO_WREN_L()    GPIO_ResetBits(FIFO_WREN_PORT,FIFO_WREN_PIN);
















#endif