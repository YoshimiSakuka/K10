/***MODU+********************************************************************/
/* Copyright (c) 2012.04  WH, All Rights Reserved.                          */
/*  WebSite     : http://un-el.taobao.com/                                  */
/*  QQ群        : 226846867 (Kinetis ARM)                                   */
/*  Email       : dragonhzw@163.com                                         */
/*  FileName    : Vectors.h                                                 */
/*  Description : The Vectors module                                        */
/*  History     :                                                           */                                                       
/*     [Author]   [Date]      [Version]    [Description]                    */              
/*     [1] dragonhzw   2012/04/09  Ver 1.0.0    Initial file.               */
/*                                                                          */
/*  Built with IAR Embedded Workbench for ARM 6.30                          */
/***MODU-********************************************************************/
#ifndef __K60_PRINTF_H__
#define __K60_PRINTF_H__
#include "..\K60_datatype.h"
/***DEF+**********************************************************************/
/* define UART Pointer.                                                      */
/***DEF-**********************************************************************/
#define UART_0              (UART0_BASE_PTR)
#define UART_1              (UART1_BASE_PTR)
#define UART_2              (UART2_BASE_PTR)
#define UART_3              (UART3_BASE_PTR)
#define UART_4              (UART4_BASE_PTR)
#define UART_5              (UART5_BASE_PTR)

/***DEF+**********************************************************************/
/* define UART BaudRate.                                                     */
/***DEF-**********************************************************************/
#define  BAUD_RATE_115200          (115200)
#define  BAUD_RATE_57600           (57600)
#define  BAUD_RATE_38400           (38400)
#define  BAUD_RATE_28800           (28800)
#define  BAUD_RATE_19200           (19200)
#define  BAUD_RATE_14400           (14400)
#define  BAUD_RATE_9600            (9600)

/***ENU+**********************************************************************/
/* define enum UART Index.                                                   */
/***ENU-**********************************************************************/
typedef enum
{
    UART0 = 0,
    UART1 = 1,
    UART2 = 2,
    UART3 = 3,
    UART4 = 4,
    UART5 = 5
}eUARTChannel;


//typedef enum  UARTn
//{
//    //初始化默认配置       --TXD--      --RXD--     可以复用其他通道，请自行修改 uart_init
//    UART0,    //           PTD7         PTD6
//    UART1,    //           PTC4         PTC3
//    UART2,    //           PTD3         PTD2
//    UART3,    //           PTC17        PTC16
//    UART4,    //           PTE24        PTE25
//    UART5     //           PTE8         PTE9
//} UARTn;

//extern volatile struct UART_MemMap *UARTx[6];
/*****************************************************************************/
/*                         Function Declare                                  */
/*****************************************************************************/
void UART_Init(U32 SystemClock, U32 BaudRate, U8 UARTChannel);
void Uart_Printf(const char *fmt,...);
void Uart_SendString(char *pt);
void Uart_SendByte(U8 UARTChannel, U8 Char);
void Uart_GetString(char *string);
SHORT Uart_GetIntNum(void);
void Delay(short sTime);
CHAR Uart_Getch(U8 UARTChannel);

void uart_irq_EN    ();                          //开串口接收中断
void uart_irq_DIS   ();                          //关串口接收中断

void Uart_SendByte_4(unsigned char data);      //最简程序

#endif/* __K60_PRINTF_H__ */