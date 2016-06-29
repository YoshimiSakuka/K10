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

//оƬ�˿�������
#define PORT_MAX_NUM 5  //�˿�����(������RTOSʹ��)

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
//#define BIT_SET(bit,Reg)   ((Reg)|= (1<<(bit)))     //�üĴ�����һλ
//#define BIT_CLR(bit,Reg)   ((Reg) &= ~(1<<(bit)))   //��Ĵ�����һλ
//#define BIT_GET(bit,Reg)   (((Reg) >> (bit)) & 1)   //��üĴ���һλ��״̬
//
//#define BYTE_SET(Pin,Reg)  ((Reg)|= (Pin))         //�üĴ�����1 byte
//#define BYTE_CLR(Pin,Reg)  ((Reg) &= ~(Pin))       //��Ĵ�����1 byte
//
////�˿ں궨��
//typedef enum PORTx
//{
//  PORT_A,
//  PORT_B,
//  PORT_C,
//  PORT_D,
//  PORT_E
//}PORTx;
//
////����ܽŷ���
//typedef enum GPIO_CFG
//{   //�����ֵ���ܸģ�����
//    GPI         =0,                           //����ܽ����뷽��      GPIOx_PDDRn�0��ʾ���룬1��ʾ���
//    GPO         =1,                           //����ܽ��������
//
//    GPI_DOWN    =0x02,                        //��������              PORTx_PCRn��ҪPE=1��PS=0
//    GPI_UP      =0x03,                        //��������              PORTx_PCRn��ҪPE=1��PS=1
//    GPI_PF      =0x10,                        //���룬����Դ�˲���,�˲���Χ��10 MHz ~ 30 MHz ����֧�ָ��ٽӿڣ�>=2MHz��  0b10000           Passive Filter Enable
//    GPI_DOWN_PF =GPI_DOWN | GPI_PF ,          //��������������Դ�˲���
//    GPI_UP_PF   =GPI_UP   | GPI_PF ,          //��������������Դ�˲���
//
//    GPO_HDS     =0x41,                         //�������������   0b100 0001    High drive strength
//    GPO_SSR     =0x05,                         //������仯��          0b101     Slow slew rate
//    GPO_HDS_SSR = GPO_HDS | GPO_SSR,           //������������������仯��
//}GPIO_CFG;   //���λΪ0���϶������룻GPI_UP �� GPI_UP_PF�����λΪ1������Ϊ���
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