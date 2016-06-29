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
    PLLUSR      ,  //自定义设置分频系数模式，直接加载 全局变量 mcg_div 的值
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
    PLL200   = 200, //绝大部分芯片都成超到这个程度
    PLL225   = 225, //不同芯片，不同板子，超频能力不一样，不一定全部都能超到这个水平
    PLL250   = 250
} clk_option;


//时钟分频因子
struct mcg_div
{
    u8 prdiv;       //外部晶振分频因子选项
    u8 vdiv;        //外部晶振倍频因子选项
    u8 core_div;    //内核时钟分频因子
    u8 bus_div;     //总线时钟分频因子
    u8 flex_div;    //flex时钟分频因子
    u8 flash_div;   //flash时钟分频因子
};



/*************************************************************************
*                             野火嵌入式开发工作室
*
*  功能说明：定义时钟频率
*  备    注：如果 MCG_CLK_MHZ 定义为 PLLUSR ，则初始化系统时用下面的自定义因子
*************************************************************************/
//#define NO_PLL_INIT
#define K60_CLK             1           // 使用外部时钟参考源
#define REF_CLK             XTAL8       // 没用到，但一些宏定义需要它

#define MCG_CLK_MHZ         PLL200      // 设置时钟频率
#define MAX_BUS_CLK         50         // bus不要超过200M，这里设为100M
#define MAX_FLASH_CLK       25          // flash不能超过32M，这里设为不超过30M

/*********************   自定义 时钟频率 分频因子   ********************/
//#include "Fire_kinetis_MCG_CFG.h"   //参考这文件可以 选配 PRDIV、VDIV 。定义MCG分频因子 ：
#define PRDIV             11        // MCG_CLK_MHZ = 50u/(PRDIV+1)*(VDIV+24)
#define VDIV              31
#define CORE_DIV          0         //  core = mcg/ ( CORE_DIV  + 1 )
#define BUS_DIV           0         //  bus  = mcg/ ( BUS_DIV   + 1 )
#define FLEX_DIV          0         //  flex = mcg/ ( FLEX_DIV  + 1 )
#define FLASH_DIV         9         //  flash= mcg/ ( FLASH_DIV + 1 )
/***********************************************************************/





extern struct mcg_div  mcg_div;


unsigned char pll_init(clk_option);         //锁相环初始化















#endif