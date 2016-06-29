/***MODU+********************************************************************/
/* Copyright (c) 2012.04  WH, All Rights Reserved.                          */
/*  WebSite     : http://un-el.taobao.com/                                  */
/*  Email       : dragonhzw@163.com                                         */
/*  FileName    : LCD1602.h                                                 */
/*  Description : The LCD1602 module                                        */
/*  History     :                                                           */                                                       
/*     [Author]   [Date]      [Version]    [Description]                    */              
/*     [1] dragonhzw   2012/04/09  Ver 1.0.0    Initial file.               */
/*                                                                          */
/*  Built with IAR Embedded Workbench for ARM 6.30                          */
/***MODU-********************************************************************/
#ifndef __K60_UART_H__
#define __K60_UART_H__
#include "K60_datatype.h"

//芯片端口名定义
#define PORT_MAX_NUM 5  //端口数量(保留给RTOS使用)

#define TFT_LCD_RS(idx) \
    do \
    {    if(idx) \
         {\
              GPIOB_PDOR |= U32_BIT9;\
         }\
         else\
         {\
              GPIOB_PDOR &= ~U32_BIT9;\
         }\
    }while(0)

#define TFT_LCD_WR(idx) \
    do \
    {    if(idx) \
         {\
              GPIOB_PDOR |= U32_BIT10;\
         }\
         else\
         {\
              GPIOB_PDOR &= ~U32_BIT10;\
         }\
    }while(0)

#define TFT_LCD_RD(idx) \
    do \
    {    if(idx) \
         {\
              GPIOB_PDOR |= U32_BIT11;\
         }\
         else\
         {\
              GPIOB_PDOR &= ~U32_BIT11;\
         }\
    }while(0)

#define TFT_LCD_CS(idx) \
    do \
    {    if(idx) \
         {\
              GPIOB_PDOR |= U32_BIT8;\
         }\
         else\
         {\
              GPIOB_PDOR &= ~U32_BIT8;\
         }\
    }while(0)

#define TFT_LCD_RST(idx) \
    do \
    {    if(idx) \
         {\
              GPIOC_PDOR |= U32_BIT0;\
         }\
         else\
         {\
              GPIOC_PDOR &= ~U32_BIT0;\
         }\
    }while(0)
///***DEF+**********************************************************************/
///* define SET/CLR/GET Register  bit                                          */
///***DEF-**********************************************************************/
//#define BIT_SET(bit,Reg)   ((Reg)|= (1<<(bit)))     //置寄存器的一位
//#define BIT_CLR(bit,Reg)   ((Reg) &= ~(1<<(bit)))   //清寄存器的一位
//#define BIT_GET(bit,Reg)   (((Reg) >> (bit)) & 1)   //获得寄存器一位的状态
//
//#define BYTE_SET(Pin,Reg)  ((Reg)|= (Pin))         //置寄存器的1 byte
//#define BYTE_CLR(Pin,Reg)  ((Reg) &= ~(Pin))       //清寄存器的1 byte
//
////端口宏定义
//typedef enum PORTx
//{
//  PORT_A,
//  PORT_B,
//  PORT_C,
//  PORT_D,
//  PORT_E
//}PORTx;
//
////定义管脚方向
//typedef enum GPIO_CFG
//{   //这里的值不能改！！！
//    GPI         =0,                           //定义管脚输入方向      GPIOx_PDDRn里，0表示输入，1表示输出
//    GPO         =1,                           //定义管脚输出方向
//
//    GPI_DOWN    =0x02,                        //输入下拉              PORTx_PCRn需要PE=1，PS=0
//    GPI_UP      =0x03,                        //输入上拉              PORTx_PCRn需要PE=1，PS=1
//    GPI_PF      =0x10,                        //输入，带无源滤波器,滤波范围：10 MHz ~ 30 MHz 。不支持高速接口（>=2MHz）  0b10000           Passive Filter Enable
//    GPI_DOWN_PF =GPI_DOWN | GPI_PF ,          //输入下拉，带无源滤波器
//    GPI_UP_PF   =GPI_UP   | GPI_PF ,          //输入上拉，带无源滤波器
//
//    GPO_HDS     =0x41,                         //输出高驱动能力   0b100 0001    High drive strength
//    GPO_SSR     =0x05,                         //输出慢变化率          0b101     Slow slew rate
//    GPO_HDS_SSR = GPO_HDS | GPO_SSR,           //输出高驱动能力、慢变化率
//}GPIO_CFG;   //最低位为0，肯定是输入；GPI_UP 和 GPI_UP_PF的最低位为1，其他为输出
//
/*****************************************************************************/
/*                         Function Declare                                  */
/*****************************************************************************/
void LCD_INIT_ILI9320_032(void);
void send_host_reg_command(int cmd,int dataa);
void LCD_WRITE_CMD(char cmd1,char cmd2);
void LCD_WRITE_DATA(char dataa,char datab);
void LLCD_WRITE_CMD(int cmd);
void LLCD_WRITE_DATA(int dataa);
void LCD_TEST_SingleColor(char colorH,char colorL);
void time_delay_ms(unsigned int count_val);
void LCD_TEST_Picture1(unsigned char *picture1);
void LCD_TEST_Picture2(unsigned char *picture1);
void LCD_TEST_Picture3(unsigned char *picture1);
void LCD_TEST_Picture4(unsigned char *picture1);
void LCD_show_window(void);

void LCD_IO_Init(void);
///*****************************************************************************/
///*                         Function Declare                                  */
///*****************************************************************************/
//BOOL GPIO_Init(U8 Port, U8 PinNum, GPIO_CFG cfg, U8 Level);
//void GPIO_SetBit(U8 Port, U8 PinNum, U8 Level);
//U8 GPIO_GetBit(U8 Port, U8 PinNum);
//static PORT_MemMapPtr GPIO_get_port_addr (U8 port);
//static GPIO_MemMapPtr GPIO_get_pt_addr(U8 port);
///*****************************************************************************/
///*                         Function Declare                                  */
///*****************************************************************************/
//void PLL_Init(void);
//void main(void);
//
#endif /* __K60_UART_H__ */