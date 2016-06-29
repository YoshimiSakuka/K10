///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:48
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\CLOCK.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\CLOCK.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\CLOCK.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1
        #define SHF_WRITE 0x1
        #define SHF_EXECINSTR 0x4

        PUBLIC FLL_Init
        PUBLIC mcg_div
        PUBLIC pll_init

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\CLOCK.c
//    1 #include "CLOCK.h"
//    2 
//    3 
//    4 //#ifdef  __cplusplus
//    5 //extern "C" {
//    6 //#endif
//    7   
//    8 
//    9 __ramfunc static void SetSysDividers(ULONG uiOutDiv1, ULONG uiOutDiv2, ULONG uiOutDiv3, ULONG uiOutDiv4);  
//   10 
//   11 
//   12 
//   13 //时钟参数，便于外部调用
//   14 extern u32 core_clk_khz;
//   15 extern u32 core_clk_mhz;
//   16 extern u32 bus_clk_khz;
//   17 
//   18 //时钟分频因子

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   19 struct mcg_div mcg_div = { PRDIV , VDIV , CORE_DIV , BUS_DIV , FLEX_DIV , FLASH_DIV }; //定义的同时，初始化
mcg_div:
        DATA
        DC8 11, 31, 0, 0, 0, 9, 0, 0
//   20 /***FUNC+*********************************************************************/
//   21 /* Name   : PLL_Init                                                         */
//   22 /* Descrp : Initialize PLL                                                   */
//   23 /* Input  : None.                                                            */   
//   24 /* Output : None.                                                            */
//   25 /* Return : None.                                                            */   
//   26 /***FUNC-*********************************************************************/
//   27   
//   28 
//   29 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   30 unsigned char pll_init(clk_option opt)
//   31 {
pll_init:
        PUSH     {R4,LR}
//   32     unsigned char pll_freq;
//   33 
//   34 //    if(opt  != PLLUSR ) //自定义模式，直接加载全局变量mcg_div的值
//   35 //    {
//   36         //设置MCG时钟
//   37         switch(opt)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+48
        BEQ.N    ??pll_init_0
        CMP      R0,#+50
        BEQ.W    ??pll_init_1
        CMP      R0,#+96
        BEQ.W    ??pll_init_2
        CMP      R0,#+100
        BEQ.W    ??pll_init_3
        CMP      R0,#+110
        BEQ.W    ??pll_init_4
        CMP      R0,#+120
        BEQ.W    ??pll_init_5
        CMP      R0,#+125
        BEQ.W    ??pll_init_6
        CMP      R0,#+130
        BEQ.W    ??pll_init_7
        CMP      R0,#+140
        BEQ.W    ??pll_init_8
        CMP      R0,#+150
        BEQ.W    ??pll_init_9
        CMP      R0,#+160
        BEQ.W    ??pll_init_10
        CMP      R0,#+170
        BEQ.W    ??pll_init_11
        CMP      R0,#+180
        BEQ.W    ??pll_init_12
        CMP      R0,#+200
        BEQ.W    ??pll_init_13
        CMP      R0,#+225
        BEQ.W    ??pll_init_14
        CMP      R0,#+250
        BEQ.W    ??pll_init_15
        B.N      ??pll_init_16
//   38         {
//   39         case PLL48:
//   40             mcg_div.prdiv       = 24;
??pll_init_0:
        MOVS     R0,#+24
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
//   41             mcg_div.vdiv        = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
//   42             break;
//   43         case PLL50:
//   44             mcg_div.prdiv       = 24;
//   45             mcg_div.vdiv        = 1;
//   46             break;
//   47         case PLL96:
//   48             mcg_div.prdiv       = 24;
//   49             mcg_div.vdiv        = 24;
//   50             break;
//   51         case PLL100:
//   52             mcg_div.prdiv       = 24;
//   53             mcg_div.vdiv        = 26;
//   54             break;
//   55         case PLL110:
//   56             mcg_div.prdiv       = 24;
//   57             mcg_div.vdiv        = 31;
//   58             break;
//   59         case PLL120:
//   60             mcg_div.prdiv       = 19;
//   61             mcg_div.vdiv        = 24;
//   62             break;
//   63         case PLL125:
//   64             mcg_div.prdiv       = 19;
//   65             mcg_div.vdiv        = 26;
//   66             break;
//   67         case PLL130:
//   68             mcg_div.prdiv       = 19;
//   69             mcg_div.vdiv        = 28;
//   70             break;
//   71         case PLL140:
//   72             mcg_div.prdiv       = 14;
//   73             mcg_div.vdiv        = 18;
//   74             break;
//   75         case PLL150:
//   76             mcg_div.prdiv       = 14;
//   77             mcg_div.vdiv        = 21;
//   78             break;
//   79         case PLL160:
//   80             mcg_div.prdiv       = 14;
//   81             mcg_div.vdiv        = 24;
//   82             break;
//   83         case PLL170:
//   84             mcg_div.prdiv       = 14;
//   85             mcg_div.vdiv        = 27;
//   86             break;
//   87         case PLL180:
//   88             mcg_div.prdiv       = 14;
//   89             mcg_div.vdiv        = 30;
//   90             break;
//   91         case PLL200:
//   92             mcg_div.prdiv       = 12;
//   93             mcg_div.vdiv        = 28;
//   94             break;
//   95         case PLL225:
//   96             mcg_div.prdiv       = 11;
//   97             mcg_div.vdiv        = 30;
//   98             break;
//   99         case PLL250:
//  100             mcg_div.prdiv       = 10;
//  101             mcg_div.vdiv        = 31;
//  102             break;
//  103         default:
//  104             return pll_init(PLL100);        //这情况不会发生。
//  105         }
//  106 
//  107         //设置分频
//  108         mcg_div.core_div    = 0;           // core = MCG
??pll_init_17:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+2]
//  109 
//  110 //        /* 这里提示警告，但是安全的，是为了安全才故意添加进去 */
//  111 //        if     (opt <= 1 * MAX_BUS_CLK)   mcg_div.bus_div = 0;    // bus  = MCG
//  112 //        else if(opt <= 2 * MAX_BUS_CLK)   mcg_div.bus_div = 1;    // bus  = MCG/2
//  113 //        else if(opt <= 3 * MAX_BUS_CLK)   mcg_div.bus_div = 2;    // bus  = MCG/3
//  114 //        else if(opt <= 4 * MAX_BUS_CLK)   mcg_div.bus_div = 3;    // bus  = MCG/4    这里提示警告，不过没关系
//  115 //        else                            mcg_div.bus_div = 15;     // bus  = MCG/16
//  116 //
//  117 //        mcg_div.flex_div = mcg_div.bus_div;                       // flex   = bus
//  118 //
//  119 //        /* 这里提示警告，但是安全的，是为了安全才故意添加进去 */
//  120 //        if     (opt <= 1 * MAX_FLASH_CLK)   mcg_div.flash_div = 0; // flash  = MCG
//  121 //        else if(opt <= 2 * MAX_FLASH_CLK)   mcg_div.flash_div = 1; // flash  = MCG/2
//  122 //        else if(opt <= 3 * MAX_FLASH_CLK)   mcg_div.flash_div = 2; // flash  = MCG/3
//  123 //        else if(opt <= 4 * MAX_FLASH_CLK)   mcg_div.flash_div = 3; // flash  = MCG/4
//  124 //        else if(opt <= 5 * MAX_FLASH_CLK)   mcg_div.flash_div = 4; // flash  = MCG/5
//  125 //        else if(opt <= 6 * MAX_FLASH_CLK)   mcg_div.flash_div = 5; // flash  = MCG/6
//  126 //        else if(opt <= 7 * MAX_FLASH_CLK)   mcg_div.flash_div = 6; // flash  = MCG/7
//  127 //        else if(opt <= 8 * MAX_FLASH_CLK)   mcg_div.flash_div = 7; // flash  = MCG/8
//  128 //        else if(opt <= 9 * MAX_FLASH_CLK)   mcg_div.flash_div = 8; // flash  = MCG/9     这里提示警告，不过没关系
//  129 //        else if(opt <= 10 * MAX_FLASH_CLK)  mcg_div.flash_div = 9; // flash  = MCG/10
//  130 //        else                              mcg_div.flash_div = 15; // flash  = MCG/16
//  131 //
//  132 //    }
//  133     pll_freq = (u8)(( (u16)50 * (u16)( mcg_div.vdiv + 24 )) / (u16)( mcg_div.prdiv + 1 ) );            //  50/ ( prdiv +1 ) * ( mcg_div.vdiv + 24 )
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+1]
        ADDS     R0,R0,#+24
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R1,#+50
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable1
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        SDIV     R4,R0,R1
//  134 
//  135     //上电复位后，单片机会自动进入 FEI 模式，使用 内部参考时钟
//  136     //为了使用外部时钟参考源，我们要先进入 FBE 模式:
//  137 #if (defined(K60_CLK) || defined(ASB817))
//  138     MCG_C2 = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_1  ;; 0x40064001
        STRB     R0,[R1, #+0]
//  139 #else
//  140     // Enable external oscillator, RANGE=2, HGO=1, EREFS=1, LP=0, IRCS=0
//  141     MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  142 #endif
//  143 
//  144     //初始化晶振后释放锁定状态的振荡器和GPIO
//  145     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.N    R0,??DataTable1_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable1_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//  146     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.N    R0,??DataTable1_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable1_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  147 
//  148     // Select external oscilator and Reference Divider and clear IREFS to start ext osc
//  149     // CLKS=2, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  150     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        MOVS     R0,#+152
        LDR.N    R1,??DataTable1_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  151 
//  152     /* if we aren't using an osc input we don't need to wait for the osc to init */
//  153 #if (!defined(K60_CLK) && !defined(ASB817))
//  154     while (!(MCG_S & MCG_S_OSCINIT_MASK)) {};  //等待晶振稳定
//  155 #endif
//  156 
//  157     while (MCG_S & MCG_S_IREFST_MASK) {}; // wait for Reference clock Status bit to clear
??pll_init_18:
        LDR.N    R0,??DataTable1_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pll_init_18
//  158 
//  159     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2) {}; // Wait for clock status bits to show clock source is ext ref clk
??pll_init_19:
        LDR.N    R0,??DataTable1_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pll_init_19
//  160 
//  161     //进入FBE模式  分频后结果必须在 ：2 MHz ~ 4 MHz.
//  162     //    n       (n+1)分频   50M/(n+1)       n为12~24之间
//  163     MCG_C5 = MCG_C5_PRDIV(mcg_div.prdiv);   // prdiv +1 分频 ：2M
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x1F
        LDR.N    R1,??DataTable1_6  ;; 0x40064004
        STRB     R0,[R1, #+0]
//  164 
//  165     MCG_C6 = 0x0;       // Ensure MCG_C6 is at the reset default of 0. LOLIE disabled, PLL disabled, clk monitor disabled, PLL VCO divider is clear
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_7  ;; 0x40064005
        STRB     R0,[R1, #+0]
//  166 
//  167     // 设置系统分频因子选项
//  168     //MCG=PLL, core = MCG/(mcg_div.core_div + 1), bus = MCG/(mcg_div.bus_div + 1),
//  169     //FlexBus = MCG/(mcg_div.flex_div + 1), Flash clock= MCG/(mcg_div.flash_div + 1)
//  170     SetSysDividers(mcg_div.core_div, mcg_div.bus_div, mcg_div.flex_div, mcg_div.flash_div);
        LDR.N    R0,??DataTable1
        LDRB     R3,[R0, #+5]
        LDR.N    R0,??DataTable1
        LDRB     R2,[R0, #+4]
        LDR.N    R0,??DataTable1
        LDRB     R1,[R0, #+3]
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+2]
        BL       SetSysDividers
//  171 
//  172     // Set the VCO divider and enable the PLL for 48MHz, LOLIE=0, PLLS=1, CME=0, VDIV=0
//  173     //   n    (n+24)倍频            n为0~31之间
//  174     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(mcg_div.vdiv) ;  //  mcg_div.vdiv + 1 倍频
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+1]
        ANDS     R0,R0,#0x1F
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable1_7  ;; 0x40064005
        STRB     R0,[R1, #+0]
//  175 
//  176     while (!(MCG_S & MCG_S_PLLST_MASK)) {}; // wait for PLL status bit to set
??pll_init_20:
        LDR.N    R0,??DataTable1_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pll_init_20
//  177 
//  178     while (!(MCG_S & MCG_S_LOCK_MASK)) {}; // Wait for LOCK bit to set
??pll_init_21:
        LDR.N    R0,??DataTable1_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pll_init_21
//  179 
//  180     // 现在已经进入了 PBE 模式
//  181 
//  182     // Transition into PEE by setting CLKS to 0
//  183     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  184     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable1_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable1_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  185 
//  186     // Wait for clock status bits to update
//  187     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3) {};
??pll_init_22:
        LDR.N    R0,??DataTable1_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pll_init_22
//  188 
//  189     // 现在已经进入了 PEE 模式
//  190 
//  191     return pll_freq;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??pll_init_23:
        POP      {R4,PC}          ;; return
??pll_init_1:
        MOVS     R0,#+24
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_2:
        MOVS     R0,#+24
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+24
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_3:
        MOVS     R0,#+24
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+26
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_4:
        MOVS     R0,#+24
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+31
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_5:
        MOVS     R0,#+19
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+24
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_6:
        MOVS     R0,#+19
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+26
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_7:
        MOVS     R0,#+19
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+28
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_8:
        MOVS     R0,#+14
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+18
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_9:
        MOVS     R0,#+14
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+21
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_10:
        MOVS     R0,#+14
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+24
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_11:
        MOVS     R0,#+14
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+27
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_12:
        MOVS     R0,#+14
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+30
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_13:
        MOVS     R0,#+12
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+28
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_14:
        MOVS     R0,#+11
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+30
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_15:
        MOVS     R0,#+10
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+31
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+1]
        B.N      ??pll_init_17
??pll_init_16:
        MOVS     R0,#+100
        BL       pll_init
        B.N      ??pll_init_23
//  192 } //pll_init
//  193 
//  194 
//  195 
//  196 
//  197 
//  198 
//  199 
//  200 
//  201 
//  202 
//  203 //
//  204 //void PLL_Init(void)
//  205 //{
//  206 //    //默认开始为FEI  切换到FBE               FEI-FBE-PBE-PEE
//  207 //    MCG_C2 = 0;                        // x x RANGE HGO EREFS LP IRCS
//  208 //                                       // 0 0   00    0    0   0   0
//  209 //                                       // RANGE=00:Low frequency range selected for the crystal oscillator of 32 kHz to 40 kHz
//  210 //                                       // HGO  =0 :Configure crystal oscillator for low-power operation     配置晶振为低电源操作
//  211 //                                       // EREFS=0 :External reference clock requested       外部时钟参考选择
//  212 //    
//  213 //    SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;   //llwu时钟允许
//  214 //    LLWU_CS |= LLWU_CS_ACKISO_MASK;      //释放GPIO
//  215 //    
//  216 //    MCG_C1 = MCG_C1_CLKS(2) |          // CLKS FRDIV IREFS IRCLKEN IREFSTEN
//  217 //             MCG_C1_FRDIV(3);          //  10   011    1     0        0  
//  218 //                                       // CLKS =10 :External reference clock is selected    选择外部晶振
//  219 //                                       // FRDIV=011:Divide Factor is 8   分频因子8
//  220 //                                       //IREFS = 0 外部时钟被选 启动外部晶振时钟 
//  221 //    
//  222 //    while (MCG_S & MCG_S_IREFST_MASK)  // wait until source of FLL reference clock is the external reference clock
//  223 //    {                                    // IREFST=0时 FLL参考时钟为外部参考时钟 向IREFS写入后该位不立即更新 等待该位更新
//  224 //        ;  
//  225 //    }
//  226 //    
//  227 //    while (((MCG_S & MCG_S_CLKST_MASK) // wait until external reference clock is selected
//  228 //          >> MCG_S_CLKST_SHIFT) != 0x2)// CLKST为2时 选择外部时钟 CLKS写入后该位不立即更新 等待该位更新
//  229 //    {
//  230 //        ;   
//  231 //    }
//  232 //                //已进入FBE 切换到PBE
//  233 //    MCG_C5 = MCG_C5_PRDIV(24);       // x PLLCLKEN PLLSTEN PRDIV
//  234 //                                       // 0    0        0    11000
//  235 //                                       // PRDIV=11000:Divide Factor is 25   得到2Mhz时钟
//  236 //       
//  237 //    SetSysDividers(0, 1, 1, 3);        // MCG=PLL, core=MCG, bus=MCG/2, FlexBus=MCG/2, Flash clock=MCG/4
//  238 //    
//  239 //    MCG_C6 = MCG_C6_PLLS_MASK |        // LOLIE PLLS CME VDIV  
//  240 //             MCG_C6_VDIV(24);          //   0    1    0  11000    
//  241 //                                       // PLLS=1    :PLL is selected    Pll作为MCG时钟
//  242 //                                       // VDIV=11000:Multiply Factor is 48  VCO分频器
//  243 //                                       // PLL = 2MHz x 48 = 96MHz
//  244 //    
//  245 //    while (!(MCG_S & MCG_S_PLLST_MASK))// wait until source of PLLS clock is PLL clock  为1时PLLS时钟为PLL时钟 PLLS置位后该位不立即更新
//  246 //    {
//  247 //        ;   
//  248 //    }
//  249 //    
//  250 //    while (!(MCG_S & MCG_S_LOCK_MASK)) // wait until PLL is locked  等待PLL锁存
//  251 //    {
//  252 //        ;
//  253 //    }
//  254 //    
//  255 //    MCG_C1 &= ~MCG_C1_CLKS_MASK;       // Output of FLL or PLL is selected  选择FLL或者PLL输出  根据PLLS位
//  256 //    
//  257 //    while (((MCG_S & MCG_S_CLKST_MASK) // wait until Output of the PLL is selected  等待PLL时钟输出被选择
//  258 //          >> MCG_S_CLKST_SHIFT) != 0x3)
//  259 //    {
//  260 //        ;
//  261 //    }
//  262 //}
//  263 
//  264 
//  265 /***FUNC+*********************************************************************/
//  266 /* Name   : FLL_Init                                                         */
//  267 /* Descrp : Initialize PLL                                                   */
//  268 /* Input  : None.                                                            */   
//  269 /* Output : None.                                                            */
//  270 /* Return : None.                                                            */   
//  271 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  272 void FLL_Init(void)
//  273 
//  274 {
FLL_Init:
        PUSH     {R7,LR}
//  275 
//  276   
//  277 
//  278     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.N    R0,??DataTable1_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable1_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//  279 
//  280     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.N    R0,??DataTable1_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable1_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  281 
//  282     
//  283 
//  284     MCG_C1 = (MCG_C1_CLKS(0)                                // CLKS =00:Output of FLL or PLL is selected    FLL或者PLL时钟选择为MCGOUTCLK
//  285 
//  286              |MCG_C1_IREFS_MASK);                                 // IREFS= 1:The slow internal reference clock is selected     慢内部参考时钟被选为FLL参考时钟频率
        MOVS     R0,#+4
        LDR.N    R1,??DataTable1_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  287 
//  288     
//  289 
//  290     MCG_C6 = 0;                                                                // PLLS=0:FLL is selected PLLLS为0 选择FLL为MCG时钟
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_7  ;; 0x40064005
        STRB     R0,[R1, #+0]
//  291 
//  292     
//  293 
//  294     
//  295 
//  296     while (!(MCG_S & MCG_S_IREFST_MASK))          // wait until source of FLL reference clock is the internal reference clock
??FLL_Init_0:
        LDR.N    R0,??DataTable1_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??FLL_Init_0
//  297 
//  298     {
//  299 
//  300         ;  
//  301 
//  302     }
//  303 
//  304     
//  305 
//  306     while (((MCG_S & MCG_S_CLKST_MASK)            // wait until Output of the FLL is selected
//  307 
//  308           >> MCG_S_CLKST_SHIFT) != 0x0)
??FLL_Init_1:
        LDR.N    R0,??DataTable1_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??FLL_Init_1
//  309 
//  310     {
//  311 
//  312         ;   
//  313 
//  314     }
//  315 
//  316     
//  317 
//  318     SetSysDividers(0, 1, 1, 3);                                          // MCG=FLL, core=MCG, bus=MCG/2, FlexBus=MCG/2, Flash clock=MCG/4
        MOVS     R3,#+3
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       SetSysDividers
//  319 
//  320     
//  321 
//  322     MCG_C4 = (MCG_C4_DMX32_MASK             // DMX32   = 1:DCO is fine-tuned for maximum frequency with 32.768 kHz reference.
//  323 
//  324              |MCG_C4_DRST_DRS(3));                              // DRST_DRS=11:High range
        MOVS     R0,#+224
        LDR.N    R1,??DataTable1_8  ;; 0x40064003
        STRB     R0,[R1, #+0]
//  325 
//  326                                                                                     // DCO=96MHz
//  327 
//  328     
//  329 
//  330     while (MCG_S & MCG_S_PLLST_MASK)                // wait until source of PLLS clock is FLL clock
??FLL_Init_2:
        LDR.N    R0,??DataTable1_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BMI.N    ??FLL_Init_2
//  331 
//  332     {
//  333 
//  334         ;   
//  335 
//  336     }
//  337 
//  338        
//  339 
//  340 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     mcg_div

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x4007c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x40064006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0x40064003
//  341 
//  342 
//  343 /***FUNC+*********************************************************************/
//  344 /* Name   : SetSysDividers                                                   */
//  345 /* Descrp : This routine must be placed in RAM.It is a                       */
//  346 /*          workaround for errata e2448.Flash prefetch must                  */
//  347 /*          be disabled when the flash clock divider is                      */
//  348 /*          changed.This cannot be performed while executing                 */
//  349 /*          out of flash.There must be a short delay after                   */     //flash时钟分频改变时flash预取须禁止
//  350 /*          the clock dividers are changed before prefetch                   */
//  351 /*          can be re-enabled.                                               */
//  352 /* Input  : None.                                                            */   
//  353 /* Output : None.                                                            */
//  354 /* Return : None.                                                            */   
//  355 /***FUNC-*********************************************************************/

        SECTION `.textrw`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
//  356 __ramfunc static void SetSysDividers(ULONG uiOutDiv1, ULONG uiOutDiv2, ULONG uiOutDiv3, ULONG uiOutDiv4)
//  357 {                                    //核心系统时钟分频，外围设备分频，FlexBus时钟分频，闪存时钟分频
SetSysDividers:
        PUSH     {R4-R6}
//  358 
//  359     ULONG uiTemp;
//  360   
//  361     INT  i;
//  362   
//  363  
//  364     // store present value of FMC_PFAPR
//  365     uiTemp = FMC_PFAPR; 
        LDR.N    R4,??SetSysDividers_0  ;; 0x4001f000
        LDR      R4,[R4, #+0]
//  366   
//  367     // set M0PFD through M7PFD to 1 to disable prefetch
//  368     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  369               | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  370               | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;
        LDR.N    R5,??SetSysDividers_0  ;; 0x4001f000
        LDR      R5,[R5, #+0]
        ORRS     R5,R5,#0xFF0000
        LDR.N    R6,??SetSysDividers_0  ;; 0x4001f000
        STR      R5,[R6, #+0]
//  371   
//  372     // set clock dividers to desired value  
//  373     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(uiOutDiv1) | SIM_CLKDIV1_OUTDIV2(uiOutDiv2) 
//  374                 | SIM_CLKDIV1_OUTDIV3(uiOutDiv3) | SIM_CLKDIV1_OUTDIV4(uiOutDiv4);
        LSLS     R1,R1,#+24
        ANDS     R1,R1,#0xF000000
        ORRS     R0,R1,R0, LSL #+28
        LSLS     R1,R2,#+20
        ANDS     R1,R1,#0xF00000
        ORRS     R0,R1,R0
        LSLS     R1,R3,#+16
        ANDS     R1,R1,#0xF0000
        ORRS     R0,R1,R0
        LDR.N    R1,??SetSysDividers_0+0x4  ;; 0x40048044
        STR      R0,[R1, #+0]
//  375 
//  376     // wait for dividers to change
//  377     for (i = 0; i < uiOutDiv4; i++)
        MOVS     R0,#+0
        B.N      ??SetSysDividers_1
??SetSysDividers_2:
        ADDS     R0,R0,#+1
??SetSysDividers_1:
        CMP      R0,R3
        BCC.N    ??SetSysDividers_2
//  378     {
//  379         ;   
//  380     }
//  381  
//  382     // re-store original value of FMC_PFAPR
//  383     FMC_PFAPR = uiTemp; 
        LDR.N    R0,??SetSysDividers_0  ;; 0x4001f000
        STR      R4,[R0, #+0]
//  384   
//  385 } 
        POP      {R4-R6}
        BX       LR               ;; return
        Nop      
        DATA
??SetSysDividers_0:
        DC32     0x4001f000
        DC32     0x40048044

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  386   
//  387   
//  388   
//  389 //#ifdef  __cplusplus
//  390 //}
//  391 //#endif
// 
//   8 bytes in section .data
// 644 bytes in section .text
//  76 bytes in section .textrw
// 
// 720 bytes of CODE memory
//   8 bytes of DATA memory
//
//Errors: none
//Warnings: none
