#ifndef __K60_CLOCK_H__
#define __K60_CLOCK_H__
#include "..\K60_datatype.h"


//void PLL_Init(void);
void FLL_Init(void);




enum crystal_val
{
    XTAL2,
    XTAL4,
    XTAL6,
    XTAL8,
    XTAL10,
    XTAL12,
    XTAL14,
    XTAL16,
    XTAL18,
    XTAL20,
    XTAL22,
    XTAL24,
    XTAL26,
    XTAL28,
    XTAL30,
    XTAL32
};


typedef enum clk_option
{
    PLLUSR      ,  //�Զ������÷�Ƶϵ��ģʽ��ֱ�Ӽ��� ȫ�ֱ��� mcg_div ��ֵ
    PLL48    = 48,
    PLL50    = 50,
    PLL96    = 96,
    PLL100   = 100,
    PLL110   = 110,
    PLL120   = 120,
    PLL125   = 125,
    PLL130   = 130,
    PLL140   = 140,
    PLL150   = 150,
    PLL160   = 160,
    PLL170   = 170,
    PLL180   = 180,
    PLL200   = 200, //���󲿷�оƬ���ɳ�������̶�
    PLL225   = 225, //��ͬоƬ����ͬ���ӣ���Ƶ������һ������һ��ȫ�����ܳ������ˮƽ
    PLL250   = 250
} clk_option;


//ʱ�ӷ�Ƶ����
struct mcg_div
{
    u8 prdiv;       //�ⲿ�����Ƶ����ѡ��
    u8 vdiv;        //�ⲿ����Ƶ����ѡ��
    u8 core_div;    //�ں�ʱ�ӷ�Ƶ����
    u8 bus_div;     //����ʱ�ӷ�Ƶ����
    u8 flex_div;    //flexʱ�ӷ�Ƶ����
    u8 flash_div;   //flashʱ�ӷ�Ƶ����
};



/*************************************************************************
*                             Ұ��Ƕ��ʽ����������
*
*  ����˵��������ʱ��Ƶ��
*  ��    ע����� MCG_CLK_MHZ ����Ϊ PLLUSR �����ʼ��ϵͳʱ��������Զ�������
*************************************************************************/
//#define NO_PLL_INIT
#define K60_CLK             1           // ʹ���ⲿʱ�Ӳο�Դ
#define REF_CLK             XTAL8       // û�õ�����һЩ�궨����Ҫ��

#define MCG_CLK_MHZ         PLL200      // ����ʱ��Ƶ��
#define MAX_BUS_CLK         50         // bus��Ҫ����200M��������Ϊ100M
#define MAX_FLASH_CLK       25          // flash���ܳ���32M��������Ϊ������30M

/*********************   �Զ��� ʱ��Ƶ�� ��Ƶ����   ********************/
//#include "Fire_kinetis_MCG_CFG.h"   //�ο����ļ����� ѡ�� PRDIV��VDIV ������MCG��Ƶ���� ��
#define PRDIV             11        // MCG_CLK_MHZ = 50u/(PRDIV+1)*(VDIV+24)
#define VDIV              31
#define CORE_DIV          0         //  core = mcg/ ( CORE_DIV  + 1 )
#define BUS_DIV           0         //  bus  = mcg/ ( BUS_DIV   + 1 )
#define FLEX_DIV          0         //  flex = mcg/ ( FLEX_DIV  + 1 )
#define FLASH_DIV         9         //  flash= mcg/ ( FLASH_DIV + 1 )
/***********************************************************************/





extern struct mcg_div  mcg_div;


unsigned char pll_init(clk_option);         //���໷��ʼ��















#endif