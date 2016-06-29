/***MODU+********************************************************************/
/* Copyright (c) 2012.04  WH , All Rights Reserved.                         */
/*  WebSite     : www.smart-dz.cn                                           */
/*  Email       : dragonhzw@163.com                                         */
/*  FileName    : K60_datatype.h                                            */
/*  Description : The K60_datatype module                                   */
/*  History     :                                                           */                                                       
/*     [Author]   [Date]      [Version]    [Description]                    */              
/*     [1] dragonhzw   2012/04/09  Ver 1.0.0    Initial file.               */
/*                                                                          */
/*  Built with IAR Assembler for MSP430V3.20A/W32 (3.20.1.9)                */
/***MODU-********************************************************************/
#ifndef __K60_DATATYPE_H__
#define __K60_DATATYPE_H__

/***INC+**********************************************************************/
/* Standard header files                                                     */
/***INC-**********************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <ctype.h>
#include <math.h>
#include "common\MK60N512VMD100.h"

/***DEF+**********************************************************************/
/* Data type redefinition.                                                   */
/***DEF-**********************************************************************/
typedef void              VOID;
typedef unsigned long     DWORD, ULONG, U32,u32;
typedef long              LONG, S32;
typedef int               INT;
typedef unsigned short    WORD, U16,uint16,u16;
typedef short             S16, SHORT;
typedef unsigned char     BYTE, U8, UCHAR, BOOL,uint8,u8;
typedef char              S8, CHAR,int8;
typedef float             FLOAT;
typedef unsigned char  byte;
//#define byte uint8
typedef unsigned int   word;

typedef unsigned long int	uint32;
/* These types must be 16-bit, 32-bit or larger integer */
typedef unsigned int    UINT;

/* These types must be 16-bit integer */
typedef unsigned short  USHORT;
typedef unsigned short	WCHAR;
/***INC+**********************************************************************/
/* Project header files                                                      */
/***INC-**********************************************************************/
#include "common\vectors.h"
#include "common\_printf.h"
#include "TFT32.h"

#include "common\GPIO.h"
#include "common\CLOCK.h"
//#include "common\assert.c"
#include "common\assert.h"
#include "common\FTM.h"
#include "common\isr.h"
#include "common\PIT.h"
#include "common\ADC.h"
#include "common\i2c.h"
//#include "common\DMA.h"
#include "common\Flash.h"


//#include "common\LCD_5110.h"
//#include "common\ov7670.h"
//#include "common\sccb.h"
//#include "common\FIFO.h"
#include "common\mma8451.h"
#include "common\SONYCCD.h"
#include "common\Oled.h"
#include "common\CCDH.h"
#include "common\CCDQ.h"
#include "common\Balance.h"
#include "common\union_control.h"
//#include "common\NRF24L0.h"
//#include "common\spi.h"


//#include "common\diskio.h"
//#include "common\ffconf.h"
//#include "common\ff.h"
//#include "common\includes.h"
//#include "common\OS_RTC.h"
//#include "common\SD_API.h"
//#include "common\SDHC.h"
/********************************************************************/

/*
 * Debug prints ON (#define) or OFF (#undef)
 */
#define DEBUG_PRINT
/********************************************************************/


#ifndef TRUE
#define TRUE         (1)
#endif

#ifndef FALSE
#define FALSE        (0)
#endif


/***DEF+**********************************************************************/
/* define system clk  MHZ                                                    */
/***DEF-**********************************************************************/
#define  SYS_CLK                        (150000000L)          // 96MHz
#define  PERIPH_SYS_CLK                 (ULONG)(SYS_CLK/(((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> 24)+ 1))      //外围时钟

/***DEF+**********************************************************************/
/* Bit define.                                                               */
/***DEF-**********************************************************************/
#define U32_BIT0      (0x00000001UL)
#define U32_BIT1      (0x00000002UL)
#define U32_BIT2      (0x00000004UL)
#define U32_BIT3      (0x00000008UL)
#define U32_BIT4      (0x00000010UL)
#define U32_BIT5      (0x00000020UL)
#define U32_BIT6      (0x00000040UL)
#define U32_BIT7      (0x00000080UL)
#define U32_BIT8      (0x00000100UL)
#define U32_BIT9      (0x00000200UL)
#define U32_BIT10     (0x00000400UL)
#define U32_BIT11     (0x00000800UL)
#define U32_BIT12     (0x00001000UL)
#define U32_BIT13     (0x00002000UL)
#define U32_BIT14     (0x00004000UL)
#define U32_BIT15     (0x00008000UL)
#define U32_BIT16     (0x00010000UL)
#define U32_BIT17     (0x00020000UL)
#define U32_BIT18     (0x00040000UL)
#define U32_BIT19     (0x00080000UL)
#define U32_BIT20     (0x00100000UL)
#define U32_BIT21     (0x00200000UL)
#define U32_BIT22     (0x00400000UL)
#define U32_BIT23     (0x00800000UL)
#define U32_BIT24     (0x01000000UL)
#define U32_BIT25     (0x02000000UL)
#define U32_BIT26     (0x04000000UL)
#define U32_BIT27     (0x08000000UL)
#define U32_BIT28     (0x10000000UL)
#define U32_BIT29     (0x20000000UL)
#define U32_BIT30     (0x40000000UL)
#define U32_BIT31     (0x80000000UL)
/***DEF+**********************************************************************/
/* Data value and direction of chip pins define.                             */
/***DEF-**********************************************************************/
#define LVL_H                (1)    /* High level of pin value. */
#define LVL_L                (0)    /* Low level of pin value. */
#define DIR_I                (0)    /* Input direction of pin. */
#define DIR_O                (1)    /* Output direction of pin. */

/***DEF+**********************************************************************/
/* Data value define.                                                        */
/***DEF-**********************************************************************/
#define NULL_BYTE            (0xFF)
#define NULL_WORD            (0xFFFF)
#define NULL_DWORD           (0xFFFFFFFF)
#define NULL_PTR             (0)
#define VAL_OK               (0)
#define VAL_ERR              (1)
/***DEF+**********************************************************************/
/* define SET/CLR/GET Register  bit                                          */
/***DEF-**********************************************************************/
#define BIT_SET(bit,Reg)   ((Reg)|= (1<<(bit)))     //置寄存器的一位
#define BIT_CLR(bit,Reg)   ((Reg) &= ~(1<<(bit)))   //清寄存器的一位
#define BIT_GET(bit,Reg)   (((Reg) >> (bit)) & 1)   //获得寄存器一位的状态

#define BYTE_SET(Pin,Reg)  ((Reg)|= (Pin))         //置寄存器的1 byte
#define BYTE_CLR(Pin,Reg)  ((Reg) &= ~(Pin))       //清寄存器的1 byte


/*****************************************************************************/
/*ASSERT*/
/*****************************************************************************/







//#ifdef DEBUG
//#define ASSERT(expr)    \
//        if(!(expr))     \
//            assert_failed1(  FILE    ,   LINE    )
//#else
//#define ASSERT(expr)
//#endif












#endif   /* __K60_DATA_TYPE_H__ */