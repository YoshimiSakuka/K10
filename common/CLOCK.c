#include "CLOCK.h"


//#ifdef  __cplusplus
//extern "C" {
//#endif
  

__ramfunc static void SetSysDividers(ULONG uiOutDiv1, ULONG uiOutDiv2, ULONG uiOutDiv3, ULONG uiOutDiv4);  



//时钟参数，便于外部调用
extern u32 core_clk_khz;
extern u32 core_clk_mhz;
extern u32 bus_clk_khz;

//时钟分频因子
struct mcg_div mcg_div = { PRDIV , VDIV , CORE_DIV , BUS_DIV , FLEX_DIV , FLASH_DIV }; //定义的同时，初始化
/***FUNC+*********************************************************************/
/* Name   : PLL_Init                                                         */
/* Descrp : Initialize PLL                                                   */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
  


unsigned char pll_init(clk_option opt)
{
    unsigned char pll_freq;

//    if(opt  != PLLUSR ) //自定义模式，直接加载全局变量mcg_div的值
//    {
        //设置MCG时钟
        switch(opt)
        {
        case PLL48:
            mcg_div.prdiv       = 24;
            mcg_div.vdiv        = 0;
            break;
        case PLL50:
            mcg_div.prdiv       = 24;
            mcg_div.vdiv        = 1;
            break;
        case PLL96:
            mcg_div.prdiv       = 24;
            mcg_div.vdiv        = 24;
            break;
        case PLL100:
            mcg_div.prdiv       = 24;
            mcg_div.vdiv        = 26;
            break;
        case PLL110:
            mcg_div.prdiv       = 24;
            mcg_div.vdiv        = 31;
            break;
        case PLL120:
            mcg_div.prdiv       = 19;
            mcg_div.vdiv        = 24;
            break;
        case PLL125:
            mcg_div.prdiv       = 19;
            mcg_div.vdiv        = 26;
            break;
        case PLL130:
            mcg_div.prdiv       = 19;
            mcg_div.vdiv        = 28;
            break;
        case PLL140:
            mcg_div.prdiv       = 14;
            mcg_div.vdiv        = 18;
            break;
        case PLL150:
            mcg_div.prdiv       = 14;
            mcg_div.vdiv        = 21;
            break;
        case PLL160:
            mcg_div.prdiv       = 14;
            mcg_div.vdiv        = 24;
            break;
        case PLL170:
            mcg_div.prdiv       = 14;
            mcg_div.vdiv        = 27;
            break;
        case PLL180:
            mcg_div.prdiv       = 14;
            mcg_div.vdiv        = 30;
            break;
        case PLL200:
            mcg_div.prdiv       = 12;
            mcg_div.vdiv        = 28;
            break;
        case PLL225:
            mcg_div.prdiv       = 11;
            mcg_div.vdiv        = 30;
            break;
        case PLL250:
            mcg_div.prdiv       = 10;
            mcg_div.vdiv        = 31;
            break;
        default:
            return pll_init(PLL100);        //这情况不会发生。
        }

        //设置分频
        mcg_div.core_div    = 0;           // core = MCG

//        /* 这里提示警告，但是安全的，是为了安全才故意添加进去 */
//        if     (opt <= 1 * MAX_BUS_CLK)   mcg_div.bus_div = 0;    // bus  = MCG
//        else if(opt <= 2 * MAX_BUS_CLK)   mcg_div.bus_div = 1;    // bus  = MCG/2
//        else if(opt <= 3 * MAX_BUS_CLK)   mcg_div.bus_div = 2;    // bus  = MCG/3
//        else if(opt <= 4 * MAX_BUS_CLK)   mcg_div.bus_div = 3;    // bus  = MCG/4    这里提示警告，不过没关系
//        else                            mcg_div.bus_div = 15;     // bus  = MCG/16
//
//        mcg_div.flex_div = mcg_div.bus_div;                       // flex   = bus
//
//        /* 这里提示警告，但是安全的，是为了安全才故意添加进去 */
//        if     (opt <= 1 * MAX_FLASH_CLK)   mcg_div.flash_div = 0; // flash  = MCG
//        else if(opt <= 2 * MAX_FLASH_CLK)   mcg_div.flash_div = 1; // flash  = MCG/2
//        else if(opt <= 3 * MAX_FLASH_CLK)   mcg_div.flash_div = 2; // flash  = MCG/3
//        else if(opt <= 4 * MAX_FLASH_CLK)   mcg_div.flash_div = 3; // flash  = MCG/4
//        else if(opt <= 5 * MAX_FLASH_CLK)   mcg_div.flash_div = 4; // flash  = MCG/5
//        else if(opt <= 6 * MAX_FLASH_CLK)   mcg_div.flash_div = 5; // flash  = MCG/6
//        else if(opt <= 7 * MAX_FLASH_CLK)   mcg_div.flash_div = 6; // flash  = MCG/7
//        else if(opt <= 8 * MAX_FLASH_CLK)   mcg_div.flash_div = 7; // flash  = MCG/8
//        else if(opt <= 9 * MAX_FLASH_CLK)   mcg_div.flash_div = 8; // flash  = MCG/9     这里提示警告，不过没关系
//        else if(opt <= 10 * MAX_FLASH_CLK)  mcg_div.flash_div = 9; // flash  = MCG/10
//        else                              mcg_div.flash_div = 15; // flash  = MCG/16
//
//    }
    pll_freq = (u8)(( (u16)50 * (u16)( mcg_div.vdiv + 24 )) / (u16)( mcg_div.prdiv + 1 ) );            //  50/ ( prdiv +1 ) * ( mcg_div.vdiv + 24 )

    //上电复位后，单片机会自动进入 FEI 模式，使用 内部参考时钟
    //为了使用外部时钟参考源，我们要先进入 FBE 模式:
#if (defined(K60_CLK) || defined(ASB817))
    MCG_C2 = 0;
#else
    // Enable external oscillator, RANGE=2, HGO=1, EREFS=1, LP=0, IRCS=0
    MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
#endif

    //初始化晶振后释放锁定状态的振荡器和GPIO
    SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
    LLWU_CS |= LLWU_CS_ACKISO_MASK;

    // Select external oscilator and Reference Divider and clear IREFS to start ext osc
    // CLKS=2, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
    MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);

    /* if we aren't using an osc input we don't need to wait for the osc to init */
#if (!defined(K60_CLK) && !defined(ASB817))
    while (!(MCG_S & MCG_S_OSCINIT_MASK)) {};  //等待晶振稳定
#endif

    while (MCG_S & MCG_S_IREFST_MASK) {}; // wait for Reference clock Status bit to clear

    while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2) {}; // Wait for clock status bits to show clock source is ext ref clk

    //进入FBE模式  分频后结果必须在 ：2 MHz ~ 4 MHz.
    //    n       (n+1)分频   50M/(n+1)       n为12~24之间
    MCG_C5 = MCG_C5_PRDIV(mcg_div.prdiv);   // prdiv +1 分频 ：2M

    MCG_C6 = 0x0;       // Ensure MCG_C6 is at the reset default of 0. LOLIE disabled, PLL disabled, clk monitor disabled, PLL VCO divider is clear

    // 设置系统分频因子选项
    //MCG=PLL, core = MCG/(mcg_div.core_div + 1), bus = MCG/(mcg_div.bus_div + 1),
    //FlexBus = MCG/(mcg_div.flex_div + 1), Flash clock= MCG/(mcg_div.flash_div + 1)
    SetSysDividers(mcg_div.core_div, mcg_div.bus_div, mcg_div.flex_div, mcg_div.flash_div);

    // Set the VCO divider and enable the PLL for 48MHz, LOLIE=0, PLLS=1, CME=0, VDIV=0
    //   n    (n+24)倍频            n为0~31之间
    MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(mcg_div.vdiv) ;  //  mcg_div.vdiv + 1 倍频

    while (!(MCG_S & MCG_S_PLLST_MASK)) {}; // wait for PLL status bit to set

    while (!(MCG_S & MCG_S_LOCK_MASK)) {}; // Wait for LOCK bit to set

    // 现在已经进入了 PBE 模式

    // Transition into PEE by setting CLKS to 0
    // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
    MCG_C1 &= ~MCG_C1_CLKS_MASK;

    // Wait for clock status bits to update
    while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3) {};

    // 现在已经进入了 PEE 模式

    return pll_freq;
} //pll_init










//
//void PLL_Init(void)
//{
//    //默认开始为FEI  切换到FBE               FEI-FBE-PBE-PEE
//    MCG_C2 = 0;                        // x x RANGE HGO EREFS LP IRCS
//                                       // 0 0   00    0    0   0   0
//                                       // RANGE=00:Low frequency range selected for the crystal oscillator of 32 kHz to 40 kHz
//                                       // HGO  =0 :Configure crystal oscillator for low-power operation     配置晶振为低电源操作
//                                       // EREFS=0 :External reference clock requested       外部时钟参考选择
//    
//    SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;   //llwu时钟允许
//    LLWU_CS |= LLWU_CS_ACKISO_MASK;      //释放GPIO
//    
//    MCG_C1 = MCG_C1_CLKS(2) |          // CLKS FRDIV IREFS IRCLKEN IREFSTEN
//             MCG_C1_FRDIV(3);          //  10   011    1     0        0  
//                                       // CLKS =10 :External reference clock is selected    选择外部晶振
//                                       // FRDIV=011:Divide Factor is 8   分频因子8
//                                       //IREFS = 0 外部时钟被选 启动外部晶振时钟 
//    
//    while (MCG_S & MCG_S_IREFST_MASK)  // wait until source of FLL reference clock is the external reference clock
//    {                                    // IREFST=0时 FLL参考时钟为外部参考时钟 向IREFS写入后该位不立即更新 等待该位更新
//        ;  
//    }
//    
//    while (((MCG_S & MCG_S_CLKST_MASK) // wait until external reference clock is selected
//          >> MCG_S_CLKST_SHIFT) != 0x2)// CLKST为2时 选择外部时钟 CLKS写入后该位不立即更新 等待该位更新
//    {
//        ;   
//    }
//                //已进入FBE 切换到PBE
//    MCG_C5 = MCG_C5_PRDIV(24);       // x PLLCLKEN PLLSTEN PRDIV
//                                       // 0    0        0    11000
//                                       // PRDIV=11000:Divide Factor is 25   得到2Mhz时钟
//       
//    SetSysDividers(0, 1, 1, 3);        // MCG=PLL, core=MCG, bus=MCG/2, FlexBus=MCG/2, Flash clock=MCG/4
//    
//    MCG_C6 = MCG_C6_PLLS_MASK |        // LOLIE PLLS CME VDIV  
//             MCG_C6_VDIV(24);          //   0    1    0  11000    
//                                       // PLLS=1    :PLL is selected    Pll作为MCG时钟
//                                       // VDIV=11000:Multiply Factor is 48  VCO分频器
//                                       // PLL = 2MHz x 48 = 96MHz
//    
//    while (!(MCG_S & MCG_S_PLLST_MASK))// wait until source of PLLS clock is PLL clock  为1时PLLS时钟为PLL时钟 PLLS置位后该位不立即更新
//    {
//        ;   
//    }
//    
//    while (!(MCG_S & MCG_S_LOCK_MASK)) // wait until PLL is locked  等待PLL锁存
//    {
//        ;
//    }
//    
//    MCG_C1 &= ~MCG_C1_CLKS_MASK;       // Output of FLL or PLL is selected  选择FLL或者PLL输出  根据PLLS位
//    
//    while (((MCG_S & MCG_S_CLKST_MASK) // wait until Output of the PLL is selected  等待PLL时钟输出被选择
//          >> MCG_S_CLKST_SHIFT) != 0x3)
//    {
//        ;
//    }
//}


/***FUNC+*********************************************************************/
/* Name   : FLL_Init                                                         */
/* Descrp : Initialize PLL                                                   */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void FLL_Init(void)

{

  

    SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;

    LLWU_CS |= LLWU_CS_ACKISO_MASK;

    

    MCG_C1 = (MCG_C1_CLKS(0)                                // CLKS =00:Output of FLL or PLL is selected    FLL或者PLL时钟选择为MCGOUTCLK

             |MCG_C1_IREFS_MASK);                                 // IREFS= 1:The slow internal reference clock is selected     慢内部参考时钟被选为FLL参考时钟频率

    

    MCG_C6 = 0;                                                                // PLLS=0:FLL is selected PLLLS为0 选择FLL为MCG时钟

    

    

    while (!(MCG_S & MCG_S_IREFST_MASK))          // wait until source of FLL reference clock is the internal reference clock

    {

        ;  

    }

    

    while (((MCG_S & MCG_S_CLKST_MASK)            // wait until Output of the FLL is selected

          >> MCG_S_CLKST_SHIFT) != 0x0)

    {

        ;   

    }

    

    SetSysDividers(0, 1, 1, 3);                                          // MCG=FLL, core=MCG, bus=MCG/2, FlexBus=MCG/2, Flash clock=MCG/4

    

    MCG_C4 = (MCG_C4_DMX32_MASK             // DMX32   = 1:DCO is fine-tuned for maximum frequency with 32.768 kHz reference.

             |MCG_C4_DRST_DRS(3));                              // DRST_DRS=11:High range

                                                                                    // DCO=96MHz

    

    while (MCG_S & MCG_S_PLLST_MASK)                // wait until source of PLLS clock is FLL clock

    {

        ;   

    }

       

}


/***FUNC+*********************************************************************/
/* Name   : SetSysDividers                                                   */
/* Descrp : This routine must be placed in RAM.It is a                       */
/*          workaround for errata e2448.Flash prefetch must                  */
/*          be disabled when the flash clock divider is                      */
/*          changed.This cannot be performed while executing                 */
/*          out of flash.There must be a short delay after                   */     //flash时钟分频改变时flash预取须禁止
/*          the clock dividers are changed before prefetch                   */
/*          can be re-enabled.                                               */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
__ramfunc static void SetSysDividers(ULONG uiOutDiv1, ULONG uiOutDiv2, ULONG uiOutDiv3, ULONG uiOutDiv4)
{                                    //核心系统时钟分频，外围设备分频，FlexBus时钟分频，闪存时钟分频

    ULONG uiTemp;
  
    INT  i;
  
 
    // store present value of FMC_PFAPR
    uiTemp = FMC_PFAPR; 
  
    // set M0PFD through M7PFD to 1 to disable prefetch
    FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
              | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
              | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;
  
    // set clock dividers to desired value  
    SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(uiOutDiv1) | SIM_CLKDIV1_OUTDIV2(uiOutDiv2) 
                | SIM_CLKDIV1_OUTDIV3(uiOutDiv3) | SIM_CLKDIV1_OUTDIV4(uiOutDiv4);

    // wait for dividers to change
    for (i = 0; i < uiOutDiv4; i++)
    {
        ;   
    }
 
    // re-store original value of FMC_PFAPR
    FMC_PFAPR = uiTemp; 
  
} 
  
  
  
//#ifdef  __cplusplus
//}
//#endif