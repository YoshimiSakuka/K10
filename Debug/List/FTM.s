///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:52
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\FTM.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\FTM.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\FTM.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_GetBit
        EXTERN disable_irq
        EXTERN enable_irq

        PUBLIC CPWM_COMBINE_INIT
        PUBLIC CPWM_INIT
        PUBLIC FTM_Input_init
        PUBLIC FTM_QUAD_init
        PUBLIC FTMx
        PUBLIC Ftm_disable_int
        PUBLIC Ftm_enable_int
        PUBLIC Ftm_init
        PUBLIC Ftm_stop
        PUBLIC PWM1Output
        PUBLIC PWM_Init
        PUBLIC QUADRead_L
        PUBLIC direction
        PUBLIC lptmr_pulse_clean
        PUBLIC lptmr_pulse_counter
        PUBLIC lptmr_pulse_get
        PUBLIC lptmr_pulse_init
        PUBLIC speed_L

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\FTM.c
//    1 #include "FTM.h"
//    2 
//    3 
//    4 
//    5 
//    6 
//    7 ////////////////////////////////////////////////////////////////////////////////////////

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    8 volatile struct FTM_MemMap *FTMx[3] = {FTM0_BASE_PTR, FTM1_BASE_PTR, FTM2_BASE_PTR};
FTMx:
        DATA
        DC32 40038000H, 40039000H, 400B8000H
//    9 
//   10 
//   11 
//   12 
//   13 /***FUNC+*********************************************************************/
//   14 /* Name   : Ftm_init                                                         */
//   15 /* Descrp : 初始对应的FTM通道                                                */
//   16 /* Input  : FTMChannel:FTM模块号.                                            */   
//   17 /* Output : None.                                                            */
//   18 /* Return : None.                                                            */   
//   19 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   20 void Ftm_init(U8 FTMChannel)
//   21 {
//   22     switch(FTMChannel)
Ftm_init:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??Ftm_init_0
        CMP      R0,#+2
        BEQ.N    ??Ftm_init_1
        BCC.N    ??Ftm_init_2
        B.N      ??Ftm_init_3
//   23     {
//   24     case 0:      
//   25       SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK; //使能FTM时钟
??Ftm_init_0:
        LDR.W    R0,??DataTable12  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable12  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   26       //FTM_MOD_REG(FTM0_BASE_PTR) = 0x7530; 
//   27       FTM_MOD_REG(FTM0_BASE_PTR) = 0xEA60;  //60000  0.01s
        MOVW     R0,#+60000
        LDR.W    R1,??DataTable12_1  ;; 0x40038008
        STR      R0,[R1, #+0]
//   28       FTM_CNTIN_REG(FTM0_BASE_PTR) = 0x0000;    //初始值
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_2  ;; 0x4003804c
        STR      R0,[R1, #+0]
//   29       FTM_SC_REG(FTM0_BASE_PTR) = 0x4B;//f = 6Mhz 0b01001011   4-3CLKS 01 选择系统时钟 0-2 PS011 8分频
        MOVS     R0,#+75
        LDR.W    R1,??DataTable12_3  ;; 0x40038000
        STR      R0,[R1, #+0]
//   30       break;
        B.N      ??Ftm_init_3
//   31     case 1:
//   32       SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;
??Ftm_init_2:
        LDR.W    R0,??DataTable12  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable12  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   33       FTM_MOD_REG(FTM1_BASE_PTR) = 0x7530;
        MOVW     R0,#+30000
        LDR.W    R1,??DataTable12_4  ;; 0x40039008
        STR      R0,[R1, #+0]
//   34       FTM_CNTIN_REG(FTM1_BASE_PTR) = 0x0000;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_5  ;; 0x4003904c
        STR      R0,[R1, #+0]
//   35       FTM_SC_REG(FTM1_BASE_PTR) = 0x4B;//f = 3Mhz
        MOVS     R0,#+75
        LDR.W    R1,??DataTable12_6  ;; 0x40039000
        STR      R0,[R1, #+0]
//   36       break;
        B.N      ??Ftm_init_3
//   37     case 2:
//   38       SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;
??Ftm_init_1:
        LDR.W    R0,??DataTable12_7  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable12_7  ;; 0x40048030
        STR      R0,[R1, #+0]
//   39       FTM_MOD_REG(FTM2_BASE_PTR) = 0x7530;
        MOVW     R0,#+30000
        LDR.W    R1,??DataTable12_8  ;; 0x400b8008
        STR      R0,[R1, #+0]
//   40       FTM_CNTIN_REG(FTM2_BASE_PTR) = 0x0000;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_9  ;; 0x400b804c
        STR      R0,[R1, #+0]
//   41       FTM_SC_REG(FTM2_BASE_PTR) = 0x4B;//f = 3Mhz
        MOVS     R0,#+75
        LDR.W    R1,??DataTable12_10  ;; 0x400b8000
        STR      R0,[R1, #+0]
//   42       break;      
//   43     }
//   44 }
??Ftm_init_3:
        BX       LR               ;; return
//   45 
//   46 
//   47 /***FUNC+*********************************************************************/
//   48 /* Name   : Ftm_stop                                                         */
//   49 /* Descrp : 关闭对应的FTM通道                                                */
//   50 /* Input  : FTMChannel:FTM模块号.                                            */   
//   51 /* Output : None.                                                            */
//   52 /* Return : None.                                                            */   
//   53 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   54 void Ftm_stop(U8 FTMChannel)
//   55 {
//   56     switch(FTMChannel)
Ftm_stop:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??Ftm_stop_0
        CMP      R0,#+2
        BEQ.N    ??Ftm_stop_1
        BCC.N    ??Ftm_stop_2
        B.N      ??Ftm_stop_3
//   57     {
//   58     case 0:
//   59       FTM_SC_REG(FTM0_BASE_PTR) &= ~FTM_SC_CLKS_MASK;
??Ftm_stop_0:
        LDR.W    R0,??DataTable12_3  ;; 0x40038000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x18
        LDR.W    R1,??DataTable12_3  ;; 0x40038000
        STR      R0,[R1, #+0]
//   60       break;
        B.N      ??Ftm_stop_3
//   61     case 1:
//   62       FTM_SC_REG(FTM1_BASE_PTR) &= ~FTM_SC_CLKS_MASK;
??Ftm_stop_2:
        LDR.W    R0,??DataTable12_6  ;; 0x40039000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x18
        LDR.W    R1,??DataTable12_6  ;; 0x40039000
        STR      R0,[R1, #+0]
//   63       break;
        B.N      ??Ftm_stop_3
//   64     case 2:
//   65       FTM_SC_REG(FTM2_BASE_PTR) &= ~FTM_SC_CLKS_MASK;
??Ftm_stop_1:
        LDR.W    R0,??DataTable12_10  ;; 0x400b8000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x18
        LDR.W    R1,??DataTable12_10  ;; 0x400b8000
        STR      R0,[R1, #+0]
//   66       break;      
//   67     }
//   68 }
??Ftm_stop_3:
        BX       LR               ;; return
//   69 
//   70 
//   71 /***FUNC+*********************************************************************/
//   72 /* Name   : Ftm_enable_int                                                   */
//   73 /* Descrp : 开ftm中断                                                        */
//   74 /* Input  : FTMChannel:FTM模块号.                                            */   
//   75 /* Output : None.                                                            */
//   76 /* Return : None.                                                            */   
//   77 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   78 void Ftm_enable_int(U8 FTMChannel)
//   79 {
Ftm_enable_int:
        PUSH     {R7,LR}
//   80     enable_irq(FTM0_irq_no + FTMChannel);  //开FTM中断
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R0,R0,#+62
        BL       enable_irq
//   81 }
        POP      {R0,PC}          ;; return
//   82 
//   83 
//   84 
//   85 /***FUNC+*********************************************************************/
//   86 /* Name   : Ftm_disable_int                                                  */
//   87 /* Descrp : 关ftm中断                                                        */
//   88 /* Input  : FTMChannel:FTM模块号.                                            */   
//   89 /* Output : None.                                                            */
//   90 /* Return : None.                                                            */   
//   91 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   92 void Ftm_disable_int(U8 FTMChannel)
//   93 {
Ftm_disable_int:
        PUSH     {R7,LR}
//   94     disable_irq(FTM0_irq_no + FTMChannel);  //关FTM中断
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R0,R0,#+62
        BL       disable_irq
//   95 }
        POP      {R0,PC}          ;; return
//   96 
//   97 
//   98 
//   99 
//  100 /*************************************************************************
//  101 *                             野火嵌入式开发工作室
//  102 *
//  103 *  函数名称：FTM_Input_init
//  104 *  功能说明：输入捕捉初始化函数
//  105 *  参数说明：FTMn        模块号（0、  1、  2）
//  106 *            CHn         通道号（0~7）
//  107 *            Input_cfg   输入捕捉配置（Rising、Falling、Rising_or_Falling）上升沿捕捉、下降沿捕捉、跳变沿捕捉
//  108 *  函数返回：无
//  109 *  修改时间：2012-1-26
//  110 *  备    注：CH0~CH3可以使用过滤器，未添加这功能
//  111 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  112 void FTM_Input_init(FTMn ftmn, CHn ch, Input_cfg cfg)
//  113 {
FTM_Input_init:
        PUSH     {R4,LR}
//  114     
//  115     /******************* 开启时钟 和 复用IO口*******************/
//  116     //注，这里代码虽然长，但真正执行的就几条语句
//  117     switch(ftmn)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??FTM_Input_init_0
        CMP      R0,#+2
        BEQ.W    ??FTM_Input_init_1
        BCC.W    ??FTM_Input_init_2
        B.N      ??FTM_Input_init_3
//  118     {
//  119     case FTM0:
//  120         SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;                           //使能FTM0时钟
??FTM_Input_init_0:
        LDR.W    R3,??DataTable12  ;; 0x4004803c
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1000000
        LDR.W    R4,??DataTable12  ;; 0x4004803c
        STR      R3,[R4, #+0]
//  121         switch(ch)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??FTM_Input_init_4
        CMP      R1,#+2
        BEQ.N    ??FTM_Input_init_5
        BCC.N    ??FTM_Input_init_6
        CMP      R1,#+4
        BEQ.N    ??FTM_Input_init_7
        BCC.N    ??FTM_Input_init_8
        CMP      R1,#+6
        BEQ.N    ??FTM_Input_init_9
        BCC.N    ??FTM_Input_init_10
        CMP      R1,#+7
        BEQ.N    ??FTM_Input_init_11
        B.N      ??FTM_Input_init_12
//  122         {
//  123         case CH0:
//  124 
//  125             SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
??FTM_Input_init_4:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
//  126             PORT_PCR_REG(PORTC_BASE_PTR, 1) = PORT_PCR_MUX(4);  // PTC1
        MOV      R3,#+1024
        LDR.W    R4,??DataTable12_12  ;; 0x4004b004
        STR      R3,[R4, #+0]
//  127 
//  128             break;
//  129 
//  130         case CH1:
//  131 //            if(FTM0_CH1 == PTC2)
//  132 //            {
//  133                 SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
//  134                 PORT_PCR_REG(PORTC_BASE_PTR, 2) = PORT_PCR_MUX(4);  // PTC2
//  135 //            }
//  136 //            else if(FTM0_CH1 == PTA4)
//  137 //            {
//  138 //                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//  139 //                PORT_PCR_REG(PORTA_BASE_PTR, 4) = PORT_PCR_MUX(3);  // PTA4
//  140 //            }
//  141 
//  142             break;
//  143 
//  144         case CH2:
//  145 //            if(FTM0_CH2 == PTC3)
//  146 //            {
//  147                 SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
//  148                 PORT_PCR_REG(PORTC_BASE_PTR, 3) = PORT_PCR_MUX(4);  // PTC3
//  149 //            }
//  150 //            else if(FTM0_CH2 == PTA5)
//  151 //            {
//  152 //                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//  153 //                PORT_PCR_REG(PORTA_BASE_PTR, 5) = PORT_PCR_MUX(3);  // PTA5
//  154 //            }
//  155             break;
//  156 
//  157         case CH3:
//  158 //            if(FTM0_CH3 == PTC4)
//  159 //            {
//  160                 SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
//  161                 PORT_PCR_REG(PORTC_BASE_PTR, 4) = PORT_PCR_MUX(4);  // PTC4
//  162 //            }
//  163 //            else if(FTM0_CH3 == PTA6)
//  164 //            {
//  165 //                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//  166 //                PORT_PCR_REG(PORTA_BASE_PTR, 6) = PORT_PCR_MUX(3);  // PTA6
//  167 //            }
//  168 
//  169             break;
//  170 
//  171         case CH4:
//  172 //            if(FTM0_CH4 == PTD4)
//  173 //            {
//  174                 SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
//  175                 PORT_PCR_REG(PORTD_BASE_PTR, 4) = PORT_PCR_MUX(4);  // PTD4
//  176 //            }
//  177 //            else if(FTM0_CH4 == PTA7)
//  178 //            {
//  179 //                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//  180 //                PORT_PCR_REG(PORTA_BASE_PTR, 7) = PORT_PCR_MUX(3);  // PTA7
//  181 //            }
//  182 
//  183             break;
//  184 
//  185         case CH5:
//  186 
//  187             SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
//  188             PORT_PCR_REG(PORTD_BASE_PTR, 5) = PORT_PCR_MUX(4);  // PTD5
//  189 
//  190             break;
//  191 
//  192         case CH6:
//  193 
//  194             SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
//  195             PORT_PCR_REG(PORTD_BASE_PTR, 6) = PORT_PCR_MUX(4);  // PTD6
//  196 
//  197             break;
//  198 
//  199         case CH7:
//  200 
//  201             SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
//  202             PORT_PCR_REG(PORTD_BASE_PTR, 7) = PORT_PCR_MUX(4);  // PTD7
//  203 
//  204             break;
//  205         default:
//  206             return;
//  207         }
//  208         break;
??FTM_Input_init_13:
        B.N      ??FTM_Input_init_14
??FTM_Input_init_6:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+1024
        LDR.W    R4,??DataTable12_13  ;; 0x4004b008
        STR      R3,[R4, #+0]
        B.N      ??FTM_Input_init_13
??FTM_Input_init_5:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+1024
        LDR.W    R4,??DataTable12_14  ;; 0x4004b00c
        STR      R3,[R4, #+0]
        B.N      ??FTM_Input_init_13
??FTM_Input_init_8:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+1024
        LDR.W    R4,??DataTable12_15  ;; 0x4004b010
        STR      R3,[R4, #+0]
        B.N      ??FTM_Input_init_13
??FTM_Input_init_7:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1000
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+1024
        LDR.W    R4,??DataTable12_16  ;; 0x4004c010
        STR      R3,[R4, #+0]
        B.N      ??FTM_Input_init_13
??FTM_Input_init_10:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1000
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+1024
        LDR.W    R4,??DataTable12_17  ;; 0x4004c014
        STR      R3,[R4, #+0]
        B.N      ??FTM_Input_init_13
??FTM_Input_init_9:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1000
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+1024
        LDR.W    R4,??DataTable12_18  ;; 0x4004c018
        STR      R3,[R4, #+0]
        B.N      ??FTM_Input_init_13
??FTM_Input_init_11:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1000
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+1024
        LDR.W    R4,??DataTable12_19  ;; 0x4004c01c
        STR      R3,[R4, #+0]
        B.N      ??FTM_Input_init_13
??FTM_Input_init_12:
        B.N      ??FTM_Input_init_15
//  209 
//  210     case FTM1:
//  211         SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;                           //使能FTM1时钟
??FTM_Input_init_2:
        LDR.W    R3,??DataTable12  ;; 0x4004803c
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x2000000
        LDR.W    R4,??DataTable12  ;; 0x4004803c
        STR      R3,[R4, #+0]
//  212         switch(ch)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??FTM_Input_init_16
        CMP      R1,#+1
        BEQ.N    ??FTM_Input_init_17
        B.N      ??FTM_Input_init_18
//  213         {
//  214         case CH0:
//  215 //            if(FTM1_CH0 == PTA8)
//  216 //            {
//  217                 //SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//  218                 //PORT_PCR_REG(PORTA_BASE_PTR, 8) = PORT_PCR_MUX(3);  // PTA8
//  219 //            }
//  220 //            else if(FTM1_CH0 == PTA12)
//  221 //            {
//  222 //                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//  223 //                PORT_PCR_REG(PORTA_BASE_PTR, 12) = PORT_PCR_MUX(3);  // PTA12
//  224 //            }
//  225 //            else if(FTM1_CH0 == PTB0)
//  226 //            {
//  227                 SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
??FTM_Input_init_16:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x400
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
//  228                 PORT_PCR_REG(PORTB_BASE_PTR, 0) = PORT_PCR_MUX(3);  // PTB0
        MOV      R3,#+768
        LDR.W    R4,??DataTable12_20  ;; 0x4004a000
        STR      R3,[R4, #+0]
//  229 //            }
//  230 
//  231             break;
//  232 
//  233 
//  234         case CH1:
//  235 //            if(FTM1_CH1 == PTA9)
//  236 //            {
//  237                 SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//  238                 PORT_PCR_REG(PORTA_BASE_PTR, 9) = PORT_PCR_MUX(3);  // PTA9
//  239 //            }
//  240 //            else if(FTM1_CH1 == PTA13)
//  241 //            {
//  242 //                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//  243 //                PORT_PCR_REG(PORTA_BASE_PTR, 13) = PORT_PCR_MUX(3);  // PTA13
//  244 //            }
//  245 //            else if(FTM1_CH1 == PTB1)
//  246 //            {
//  247 //                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//  248 //                PORT_PCR_REG(PORTB_BASE_PTR, 1) = PORT_PCR_MUX(3);  // PTB1
//  249 //            }
//  250 
//  251             break;
//  252 
//  253         default:
//  254             return;
//  255         }
//  256         break;
??FTM_Input_init_19:
        B.N      ??FTM_Input_init_14
??FTM_Input_init_17:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x200
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+768
        LDR.W    R4,??DataTable12_21  ;; 0x40049024
        STR      R3,[R4, #+0]
        B.N      ??FTM_Input_init_19
??FTM_Input_init_18:
        B.N      ??FTM_Input_init_15
//  257     case FTM2:
//  258         SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //使能FTM2时钟
??FTM_Input_init_1:
        LDR.W    R3,??DataTable12_7  ;; 0x40048030
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1000000
        LDR.W    R4,??DataTable12_7  ;; 0x40048030
        STR      R3,[R4, #+0]
//  259         switch(ch)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??FTM_Input_init_20
        CMP      R1,#+1
        BEQ.N    ??FTM_Input_init_21
        B.N      ??FTM_Input_init_22
//  260         {
//  261         case CH0:
//  262 //            if(FTM2_CH0 == PTA10)
//  263 //            {
//  264                 SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
??FTM_Input_init_20:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x200
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
//  265                 PORT_PCR_REG(PORTA_BASE_PTR, 10) = PORT_PCR_MUX(3);  // PTA10
        MOV      R3,#+768
        LDR.W    R4,??DataTable12_22  ;; 0x40049028
        STR      R3,[R4, #+0]
//  266 //            }
//  267 //            else if(FTM2_CH0 == PTB18)
//  268 //            {
//  269 //                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//  270 //                PORT_PCR_REG(PORTA_BASE_PTR, 18) = PORT_PCR_MUX(3);  // PTB18
//  271 //            }
//  272 
//  273             break;
//  274 
//  275         case CH1:
//  276 //            if(FTM2_CH1 == PTA11)
//  277 //            {
//  278                 SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//  279                 PORT_PCR_REG(PORTA_BASE_PTR, 11) = PORT_PCR_MUX(3);  // PTA11
//  280 //            }
//  281 //            else if(FTM2_CH1 == PTB19)
//  282 //            {
//  283 //                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//  284 //                PORT_PCR_REG(PORTA_BASE_PTR, 19) = PORT_PCR_MUX(3);  // PTB19
//  285 //            }
//  286 
//  287 
//  288             break;
//  289 
//  290         default:
//  291             return;
//  292         }
//  293         break;
??FTM_Input_init_23:
        B.N      ??FTM_Input_init_14
??FTM_Input_init_21:
        LDR.W    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x200
        LDR.W    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
        MOV      R3,#+768
        LDR.W    R4,??DataTable12_23  ;; 0x4004902c
        STR      R3,[R4, #+0]
        B.N      ??FTM_Input_init_23
??FTM_Input_init_22:
        B.N      ??FTM_Input_init_15
//  294     default:
//  295         break;
//  296     }
//  297 
//  298 
//  299     /******************* 设置为输入捕捉功能 *******************/
//  300     switch(cfg)
??FTM_Input_init_3:
??FTM_Input_init_14:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??FTM_Input_init_24
        CMP      R2,#+2
        BEQ.N    ??FTM_Input_init_25
        BCC.N    ??FTM_Input_init_26
        B.N      ??FTM_Input_init_27
//  301     {
//  302     case Rising:    //上升沿触发
//  303         FTM_CnSC_REG(FTMx[ftmn], ch) |=  ( FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK );                   //置1
??FTM_Input_init_24:
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R2,R2,R1, LSL #+3
        LDR.W    R3,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R3,[R3, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R3,R1, LSL #+3
        LDR      R3,[R3, #+12]
        ORRS     R3,R3,#0x44
        STR      R3,[R2, #+12]
//  304         FTM_CnSC_REG(FTMx[ftmn], ch) &= ~( FTM_CnSC_ELSB_MASK  | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R2,R2,R1, LSL #+3
        LDR.W    R3,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R3,[R3, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R1,R3,R1, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x38
        STR      R1,[R2, #+12]
//  305         break;
        B.N      ??FTM_Input_init_27
//  306 
//  307     case Falling:   //下降沿触发
//  308         FTM_CnSC_REG(FTMx[ftmn], ch) |= (FTM_CnSC_ELSB_MASK  | FTM_CnSC_CHIE_MASK );                    //置1
??FTM_Input_init_26:
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R2,R2,R1, LSL #+3
        LDR.W    R3,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R3,[R3, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R3,R1, LSL #+3
        LDR      R3,[R3, #+12]
        ORRS     R3,R3,#0x48
        STR      R3,[R2, #+12]
//  309         FTM_CnSC_REG(FTMx[ftmn], ch) &= ~( FTM_CnSC_ELSA_MASK | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R2,R2,R1, LSL #+3
        LDR.W    R3,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R3,[R3, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R1,R3,R1, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x34
        STR      R1,[R2, #+12]
//  310         break;
        B.N      ??FTM_Input_init_27
//  311 
//  312     case Rising_or_Falling: //上升沿、下降沿都触发
//  313         FTM_CnSC_REG(FTMx[ftmn], ch) |=  ( FTM_CnSC_ELSB_MASK | FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK ); //置1
??FTM_Input_init_25:
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R2,R2,R1, LSL #+3
        LDR.W    R3,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R3,[R3, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R3,R3,R1, LSL #+3
        LDR      R3,[R3, #+12]
        ORRS     R3,R3,#0x4C
        STR      R3,[R2, #+12]
//  314         FTM_CnSC_REG(FTMx[ftmn], ch) &= ~( FTM_CnSC_MSB_MASK  | FTM_CnSC_MSA_MASK); //清0
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R2,R2,R1, LSL #+3
        LDR.W    R3,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R3,[R3, R0, LSL #+2]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R1,R3,R1, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x30
        STR      R1,[R2, #+12]
//  315         break;
//  316     }
//  317 
//  318     FTM_SC_REG(FTMx[ftmn]) = FTM_SC_CLKS(0x1);       //System clock
??FTM_Input_init_27:
        MOVS     R1,#+8
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STR      R1,[R2, #+0]
//  319 
//  320     FTM_MODE_REG(FTMx[ftmn]) |= FTM_MODE_WPDIS_MASK;
        LDR.W    R1,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[R1, R0, LSL #+2]
        LDR      R1,[R1, #+84]
        ORRS     R1,R1,#0x4
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STR      R1,[R2, #+84]
//  321     FTM_COMBINE_REG(FTMx[ftmn]) = 0;
        MOVS     R1,#+0
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STR      R1,[R2, #+100]
//  322     FTM_MODE_REG(FTMx[ftmn]) &= ~FTM_MODE_FTMEN_MASK;
        LDR.W    R1,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[R1, R0, LSL #+2]
        LDR      R1,[R1, #+84]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STR      R1,[R2, #+84]
//  323     FTM_CNTIN_REG(FTMx[ftmn]) = 0;
        MOVS     R1,#+0
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STR      R1,[R2, #+76]
//  324 
//  325     FTM_STATUS_REG(FTMx[ftmn]) = 0x00;               //清中断标志位
        MOVS     R1,#+0
        LDR.W    R2,??DataTable12_24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STR      R1,[R2, #+80]
//  326 
//  327     //开启输入捕捉中断
//  328     enable_irq(78 - 16 + ftmn);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R0,R0,#+62
        BL       enable_irq
//  329 }
??FTM_Input_init_15:
        POP      {R4,PC}          ;; return
//  330 
//  331 
//  332 /********************************************************************************************************************/
//  333 /*    PWM                                                                                                           */
//  334 /*                                                                                                                  */
//  335 /********************************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  336 void PWM_Init(void)
//  337 {
//  338   
//  339     /* config port for FTM:  */
//  340     //PORTA_PCR8 = PORT_PCR_MUX(0x3) | PORT_PCR_DSE_MASK; //高驱动强度
//  341     PORTD_PCR6 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH6    PTD6   右轮
PWM_Init:
        MOV      R0,#+1088
        LDR.W    R1,??DataTable12_18  ;; 0x4004c018
        STR      R0,[R1, #+0]
//  342     PORTD_PCR7 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH7    PTD7   右轮
        MOV      R0,#+1088
        LDR.W    R1,??DataTable12_19  ;; 0x4004c01c
        STR      R0,[R1, #+0]
//  343     PORTD_PCR4 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH4    PTD4   左轮
        MOV      R0,#+1088
        LDR.W    R1,??DataTable12_16  ;; 0x4004c010
        STR      R0,[R1, #+0]
//  344     PORTD_PCR5 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH5    PTD5   左轮  
        MOV      R0,#+1088
        LDR.W    R1,??DataTable12_17  ;; 0x4004c014
        STR      R0,[R1, #+0]
//  345   
//  346   
//  347   
//  348     /* FTM1 clock enable:*/
//  349     //SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
//  350     SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;
        LDR.W    R0,??DataTable12  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable12  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  351     
//  352     //FTM1_SC |= (FTM_SC_CLKS(1)           // CLKS=1:System clock
//  353     //           |FTM_SC_PS(7));           // 48MHz/128=375KHz
//  354     FTM0_SC = 0x08; //设置无中断、向下计数及分频因子为1；
        MOVS     R0,#+8
        LDR.W    R1,??DataTable12_3  ;; 0x40038000
        STR      R0,[R1, #+0]
//  355                       //边沿触发模式
//  356                       //PMW频率=X系统频率/(2^FTM0_SC_PS)/FTM0_MOD
//  357     
//  358     
//  359     //FTM1_C0SC |= (FTM_CnSC_MSB_MASK      // MSB=1:Edge-aligned PWM
//  360     //             |FTM_CnSC_ELSA_MASK);   // ELSA=1:Low first    占空比为低电平
//  361     
//  362     FTM0_C4SC |= FTM_CnSC_ELSB_MASK;                          
        LDR.W    R0,??DataTable12_25  ;; 0x4003802c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable12_25  ;; 0x4003802c
        STR      R0,[R1, #+0]
//  363     FTM0_C4SC &= ~FTM_CnSC_ELSA_MASK;                         
        LDR.W    R0,??DataTable12_25  ;; 0x4003802c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.W    R1,??DataTable12_25  ;; 0x4003802c
        STR      R0,[R1, #+0]
//  364     FTM0_C4SC |= FTM_CnSC_MSB_MASK;                         
        LDR.W    R0,??DataTable12_25  ;; 0x4003802c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable12_25  ;; 0x4003802c
        STR      R0,[R1, #+0]
//  365       
//  366     FTM0_C5SC |= FTM_CnSC_ELSB_MASK;                         
        LDR.W    R0,??DataTable12_26  ;; 0x40038034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable12_26  ;; 0x40038034
        STR      R0,[R1, #+0]
//  367     FTM0_C5SC &= ~FTM_CnSC_ELSA_MASK;                        
        LDR.W    R0,??DataTable12_26  ;; 0x40038034
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.W    R1,??DataTable12_26  ;; 0x40038034
        STR      R0,[R1, #+0]
//  368     FTM0_C5SC |= FTM_CnSC_MSB_MASK;     
        LDR.W    R0,??DataTable12_26  ;; 0x40038034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable12_26  ;; 0x40038034
        STR      R0,[R1, #+0]
//  369       
//  370        /**/
//  371      
//  372     FTM0_C6SC |= FTM_CnSC_ELSB_MASK;
        LDR.W    R0,??DataTable12_27  ;; 0x4003803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable12_27  ;; 0x4003803c
        STR      R0,[R1, #+0]
//  373     FTM0_C6SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.W    R0,??DataTable12_27  ;; 0x4003803c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.W    R1,??DataTable12_27  ;; 0x4003803c
        STR      R0,[R1, #+0]
//  374     FTM0_C6SC |= FTM_CnSC_MSB_MASK;     
        LDR.W    R0,??DataTable12_27  ;; 0x4003803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable12_27  ;; 0x4003803c
        STR      R0,[R1, #+0]
//  375       
//  376     FTM0_C7SC |= FTM_CnSC_ELSB_MASK;
        LDR.W    R0,??DataTable12_28  ;; 0x40038044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable12_28  ;; 0x40038044
        STR      R0,[R1, #+0]
//  377     FTM0_C7SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.W    R0,??DataTable12_28  ;; 0x40038044
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.W    R1,??DataTable12_28  ;; 0x40038044
        STR      R0,[R1, #+0]
//  378     FTM0_C7SC |= FTM_CnSC_MSB_MASK; 
        LDR.W    R0,??DataTable12_28  ;; 0x40038044
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable12_28  ;; 0x40038044
        STR      R0,[R1, #+0]
//  379     
//  380     
//  381     
//  382     FTM0_MODE |= FTM_MODE_WPDIS_MASK;      //BIT1   Initialize the Channels Output
        LDR.W    R0,??DataTable12_29  ;; 0x40038054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable12_29  ;; 0x40038054
        STR      R0,[R1, #+0]
//  383    
//  384     FTM0_MODE &= ~1;           //BIT0   FTM Enable
        LDR.W    R0,??DataTable12_29  ;; 0x40038054
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable12_29  ;; 0x40038054
        STR      R0,[R1, #+0]
//  385     
//  386 //    FTM1_C0SC |= (FTM_CnSC_MSB_MASK      // MSB=1:Edge-aligned PWM
//  387 //                 |FTM_CnSC_ELSB_MASK);    //占空比为高电平
//  388 //    FTM1_C0SC &= ~FTM_CnSC_ELSA_MASK;
//  389     
//  390     //FTM1_OUTMASK = 0XFE;                 // Ch1-7 output is masked except ch0 屏蔽其他
//  391     
//  392     /* set PWM frequence: */
//  393     FTM0_COMBINE=0;      //  双边沿捕捉禁止，COMBINE=0，不级联
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_30  ;; 0x40038064
        STR      R0,[R1, #+0]
//  394     FTM0_OUTINIT=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_31  ;; 0x4003805c
        STR      R0,[R1, #+0]
//  395     FTM0_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_32  ;; 0x4003806c
        STR      R0,[R1, #+0]
//  396     FTM0_POL=0;          //Channels Polarity (FTMx_POL)
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_33  ;; 0x40038070
        STR      R0,[R1, #+0]
//  397                            //0 The channel polarity is active high.
//  398                            //1 The channel polarity is active low.     
//  399       //Set Edge Aligned PWM
//  400     FTM0_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;     //不使能正交编码功能
        LDR.W    R0,??DataTable12_34  ;; 0x40038080
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable12_34  ;; 0x40038080
        STR      R0,[R1, #+0]
//  401     FTM0_INVCTRL=0;      //反转控制
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_35  ;; 0x40038090
        STR      R0,[R1, #+0]
//  402     FTM0_SWOCTRL=0;      //软件输出控制F TM Software Output Control (FTMx_SWOCTRL)
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_36  ;; 0x40038094
        STR      R0,[R1, #+0]
//  403     FTM0_PWMLOAD=0;      //FTM PWM Load
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_37  ;; 0x40038098
        STR      R0,[R1, #+0]
//  404                            //BIT9: 0 Loading updated values is disabled.
//  405                            //1 Loading updated values is enabled.
//  406     FTM0_CNTIN=0;        //Counter Initial Value      FTM0计数器初始值为0 
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_2  ;; 0x4003804c
        STR      R0,[R1, #+0]
//  407     FTM0_MOD=15000;       //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001)  结束值，周期为（MOD-CNTIN+1）*时钟周期=10ms
        MOVW     R0,#+15000
        LDR.W    R1,??DataTable12_1  ;; 0x40038008
        STR      R0,[R1, #+0]
//  408     
//  409     FTM0_C6V=0;                   //右轮反转
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_38  ;; 0x40038040
        STR      R0,[R1, #+0]
//  410     FTM0_C7V=0;                   //右轮正转    
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_39  ;; 0x40038048
        STR      R0,[R1, #+0]
//  411     FTM0_C4V=0;                   //左轮正转                 正、反转死区300左右
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_40  ;; 0x40038030
        STR      R0,[R1, #+0]
//  412     FTM0_C5V=0;                   //左轮反转               
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_41  ;; 0x40038038
        STR      R0,[R1, #+0]
//  413     
//  414     
//  415     //FTM1_CNTIN = 0;
//  416     //FTM1_MOD   = 374;                    // f=375KHz/(MOD - CNTIN + 1)=1KHz
//  417     
//  418     //FTM1_C0V   = 0;                      // 0% for initiation
//  419 
//  420 }
        BX       LR               ;; return
//  421 
//  422 
//  423 
//  424 /********************************************************************************************************************/
//  425 /*    PWM    中心对奇                                                                                               */
//  426 /*                                                                                                                  */
//  427 /********************************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  428 void CPWM_INIT(void)
//  429 {
//  430     PORTA_PCR8 = PORT_PCR_MUX(0x3) | PORT_PCR_DSE_MASK;
CPWM_INIT:
        MOV      R0,#+832
        LDR.W    R1,??DataTable12_42  ;; 0x40049020
        STR      R0,[R1, #+0]
//  431     SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
        LDR.W    R0,??DataTable12  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable12  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  432     FTM1_SC |= FTM_SC_CPWMS_MASK;          //CPWM
        LDR.W    R0,??DataTable12_6  ;; 0x40039000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable12_6  ;; 0x40039000
        STR      R0,[R1, #+0]
//  433     FTM1_SC |= (FTM_SC_CLKS(1)           // CLKS=1:System clock
//  434                |FTM_SC_PS(7)); 
        LDR.W    R0,??DataTable12_6  ;; 0x40039000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF
        LDR.W    R1,??DataTable12_6  ;; 0x40039000
        STR      R0,[R1, #+0]
//  435     FTM1_C0SC |= FTM_CnSC_ELSA_MASK;    //低高低
        LDR.W    R0,??DataTable12_43  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable12_43  ;; 0x4003900c
        STR      R0,[R1, #+0]
//  436     FTM1_OUTMASK = 0XFE;
        MOVS     R0,#+254
        LDR.W    R1,??DataTable12_44  ;; 0x40039060
        STR      R0,[R1, #+0]
//  437     FTM1_CNTIN = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_5  ;; 0x4003904c
        STR      R0,[R1, #+0]
//  438     FTM1_MOD   = 374; 
        MOV      R0,#+374
        LDR.W    R1,??DataTable12_4  ;; 0x40039008
        STR      R0,[R1, #+0]
//  439     FTM1_C0V   = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_45  ;; 0x40039010
        STR      R0,[R1, #+0]
//  440     
//  441     
//  442 }
        BX       LR               ;; return
//  443 
//  444 
//  445 /********************************************************************************************************************/
//  446 /*    PWM    互补输出带死区                                                                                         */
//  447 /*                                                                                                                  */
//  448 /********************************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  449 void CPWM_COMBINE_INIT(void)
//  450 {
//  451     PORTA_PCR8 = PORT_PCR_MUX(0x3) | PORT_PCR_DSE_MASK;
CPWM_COMBINE_INIT:
        MOV      R0,#+832
        LDR.W    R1,??DataTable12_42  ;; 0x40049020
        STR      R0,[R1, #+0]
//  452     PORTA_PCR9 = PORT_PCR_MUX(0x3) | PORT_PCR_DSE_MASK;
        MOV      R0,#+832
        LDR.W    R1,??DataTable12_21  ;; 0x40049024
        STR      R0,[R1, #+0]
//  453     SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
        LDR.W    R0,??DataTable12  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable12  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  454     FTM1_SC = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_6  ;; 0x40039000
        STR      R0,[R1, #+0]
//  455     //FTM1_SC |= FTM_SC_CPWMS_MASK;       //CPWM
//  456     FTM1_SC |= (FTM_SC_CLKS(1)           // CLKS=1:System clock
//  457                |FTM_SC_PS(7));
        LDR.W    R0,??DataTable12_6  ;; 0x40039000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0xF
        LDR.W    R1,??DataTable12_6  ;; 0x40039000
        STR      R0,[R1, #+0]
//  458     FTM1_MODE |= FTM_MODE_WPDIS_MASK;//写保护禁止
        LDR.W    R0,??DataTable12_46  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable12_46  ;; 0x40039054
        STR      R0,[R1, #+0]
//  459     FTM1_MODE |=FTM_MODE_FTMEN_MASK;//FTMEN=1
        LDR.W    R0,??DataTable12_46  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable12_46  ;; 0x40039054
        STR      R0,[R1, #+0]
//  460     FTM1_QDCTRL &= ~FTM_QDCTRL_QUADEN_MASK;//禁止正交解码模式
        LDR.W    R0,??DataTable12_47  ;; 0x40039080
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable12_47  ;; 0x40039080
        STR      R0,[R1, #+0]
//  461     FTM1_COMBINE |= FTM_COMBINE_COMBINE0_MASK;//FTM1通道0,1联合使用
        LDR.W    R0,??DataTable12_48  ;; 0x40039064
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable12_48  ;; 0x40039064
        STR      R0,[R1, #+0]
//  462     FTM1_COMBINE |= FTM_COMBINE_COMP0_MASK;//FTM1通道0,1互补输出
        LDR.W    R0,??DataTable12_48  ;; 0x40039064
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable12_48  ;; 0x40039064
        STR      R0,[R1, #+0]
//  463     FTM1_COMBINE |= FTM_COMBINE_SYNCEN0_MASK;//使能FTM1通道0,1 PWM同步
        LDR.W    R0,??DataTable12_48  ;; 0x40039064
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable12_48  ;; 0x40039064
        STR      R0,[R1, #+0]
//  464     FTM1_COMBINE |= FTM_COMBINE_DTEN0_MASK;//死区插入
        LDR.W    R0,??DataTable12_48  ;; 0x40039064
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.W    R1,??DataTable12_48  ;; 0x40039064
        STR      R0,[R1, #+0]
//  465     FTM1_DEADTIME = FTM_DEADTIME_DTPS(3)|FTM_DEADTIME_DTVAL(6);     //16分频 （0x 1；10 4；11 16）   6个周期  =2us  48M/16
        MOVS     R0,#+198
        LDR.W    R1,??DataTable12_49  ;; 0x40039068
        STR      R0,[R1, #+0]
//  466     FTM1_SYNCONF|=FTM_SYNCONF_SWWRBUF_MASK;//使能MOD,CNTIN,CV寄存器的软件触发同步
        LDR.W    R0,??DataTable12_50  ;; 0x4003908c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.W    R1,??DataTable12_50  ;; 0x4003908c
        STR      R0,[R1, #+0]
//  467     FTM1_SYNC=FTM_SYNC_CNTMIN_MASK|FTM_SYNC_CNTMAX_MASK;//设置load point
        MOVS     R0,#+3
        LDR.W    R1,??DataTable12_51  ;; 0x40039058
        STR      R0,[R1, #+0]
//  468     FTM1_C0SC |= FTM_CnSC_ELSA_MASK;    //低高低
        LDR.W    R0,??DataTable12_43  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable12_43  ;; 0x4003900c
        STR      R0,[R1, #+0]
//  469     FTM1_C1SC |= FTM_CnSC_ELSA_MASK;    //低高低
        LDR.W    R0,??DataTable12_52  ;; 0x40039014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable12_52  ;; 0x40039014
        STR      R0,[R1, #+0]
//  470     FTM1_OUTMASK=0XFC;//通道0，1输出，屏蔽其它通道
        MOVS     R0,#+252
        LDR.W    R1,??DataTable12_44  ;; 0x40039060
        STR      R0,[R1, #+0]
//  471     FTM1_CNTIN = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_5  ;; 0x4003904c
        STR      R0,[R1, #+0]
//  472     FTM1_MOD = 374; 
        MOV      R0,#+374
        LDR.N    R1,??DataTable12_4  ;; 0x40039008
        STR      R0,[R1, #+0]
//  473     FTM1_C0V = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_45  ;; 0x40039010
        STR      R0,[R1, #+0]
//  474     FTM1_C1V = 50 * 374 / 100;
        MOVS     R0,#+187
        LDR.W    R1,??DataTable12_53  ;; 0x40039018
        STR      R0,[R1, #+0]
//  475     FTM1_CNT = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable12_54  ;; 0x40039004
        STR      R0,[R1, #+0]
//  476     FTM1_SYNC|=FTM_SYNC_SWSYNC_MASK;//使能软件触发
        LDR.W    R0,??DataTable12_51  ;; 0x40039058
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable12_51  ;; 0x40039058
        STR      R0,[R1, #+0]
//  477     
//  478     
//  479 }
        BX       LR               ;; return
//  480 
//  481 
//  482 /***FUNC+*********************************************************************/
//  483 /* Name   : PWM1Output                                                       */
//  484 /* Descrp : output for PWM1                                                  */
//  485 /* Input  : None.                                                            */   
//  486 /* Output : None.                                                            */
//  487 /* Return : None.                                                            */   
//  488 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  489 void PWM1Output(UCHAR ucDuty)
//  490 {
//  491 
//  492     if (ucDuty >= 100)
PWM1Output:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+100
        BLT.N    ??PWM1Output_0
//  493     {
//  494         FTM1_C0V = 375;
        MOVW     R0,#+375
        LDR.W    R1,??DataTable12_45  ;; 0x40039010
        STR      R0,[R1, #+0]
//  495         FTM1_SYNC |= FTM_SYNC_SWSYNC_MASK;//使能软件触发
        LDR.W    R0,??DataTable12_51  ;; 0x40039058
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable12_51  ;; 0x40039058
        STR      R0,[R1, #+0]
        B.N      ??PWM1Output_1
//  496     }
//  497     
//  498     else
//  499     {    
//  500         FTM1_C0V = (U16)ucDuty * 374 / 100;
??PWM1Output_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOV      R1,#+374
        MULS     R0,R1,R0
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable12_45  ;; 0x40039010
        STR      R0,[R1, #+0]
//  501         FTM1_SYNC |= FTM_SYNC_SWSYNC_MASK;//使能软件触发
        LDR.N    R0,??DataTable12_51  ;; 0x40039058
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable12_51  ;; 0x40039058
        STR      R0,[R1, #+0]
//  502     }
//  503     
//  504 }
??PWM1Output_1:
        BX       LR               ;; return
//  505 
//  506 
//  507 
//  508 
//  509 /************************************************************************/
//  510 /*正交解码*/
//  511 //查看FTM1_CNT、FTM2_CNT就可知道当前计数值，查看TOFDIR、QUADIR可以知道转向。
//  512 /************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  513 void FTM_QUAD_init()
//  514 {
//  515     /*开启端口时钟*/
//  516     SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
FTM_QUAD_init:
        LDR.N    R0,??DataTable12_11  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable12_11  ;; 0x40048038
        STR      R0,[R1, #+0]
//  517 
//  518     /*选择管脚复用功能*/
//  519     //PORTA_PCR12 = PORT_PCR_MUX(7);
//  520     //PORTA_PCR13 = PORT_PCR_MUX(7);
//  521     //PORTA_PCR10 = PORT_PCR_MUX(6);
//  522     //PORTA_PCR11 = PORT_PCR_MUX(6);
//  523     
//  524     
//  525     PORTB_PCR0 = PORT_PCR_MUX(6);
        MOV      R0,#+1536
        LDR.N    R1,??DataTable12_20  ;; 0x4004a000
        STR      R0,[R1, #+0]
//  526     PORTB_PCR1 = PORT_PCR_MUX(6); 
        MOV      R0,#+1536
        LDR.N    R1,??DataTable12_55  ;; 0x4004a004
        STR      R0,[R1, #+0]
//  527     PORTB_PCR18 = PORT_PCR_MUX(6);
        MOV      R0,#+1536
        LDR.N    R1,??DataTable12_56  ;; 0x4004a048
        STR      R0,[R1, #+0]
//  528     PORTB_PCR19 = PORT_PCR_MUX(6); 
        MOV      R0,#+1536
        LDR.N    R1,??DataTable12_57  ;; 0x4004a04c
        STR      R0,[R1, #+0]
//  529     
//  530     
//  531     
//  532 
//  533     /*使能FTM1、FTM2时钟*/
//  534     SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
        LDR.N    R0,??DataTable12  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable12  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  535     SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;
        LDR.N    R0,??DataTable12_7  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable12_7  ;; 0x40048030
        STR      R0,[R1, #+0]
//  536 
//  537     FTM1_MOD = 14000; //可根据需要设置
        MOVW     R0,#+14000
        LDR.N    R1,??DataTable12_4  ;; 0x40039008
        STR      R0,[R1, #+0]
//  538     FTM2_MOD = 14000;
        MOVW     R0,#+14000
        LDR.N    R1,??DataTable12_8  ;; 0x400b8008
        STR      R0,[R1, #+0]
//  539 
//  540     FTM1_CNTIN = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_5  ;; 0x4003904c
        STR      R0,[R1, #+0]
//  541     FTM2_CNTIN = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_9  ;; 0x400b804c
        STR      R0,[R1, #+0]
//  542 
//  543     FTM1_MODE |= FTM_MODE_WPDIS_MASK; //禁止写保护
        LDR.N    R0,??DataTable12_46  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable12_46  ;; 0x40039054
        STR      R0,[R1, #+0]
//  544     FTM2_MODE |= FTM_MODE_WPDIS_MASK; //禁止写保护
        LDR.N    R0,??DataTable12_58  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable12_58  ;; 0x400b8054
        STR      R0,[R1, #+0]
//  545     FTM1_MODE |= FTM_MODE_FTMEN_MASK; //FTMEN=1,关闭TPM兼容模式，开启FTM所有功能
        LDR.N    R0,??DataTable12_46  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_46  ;; 0x40039054
        STR      R0,[R1, #+0]
//  546     FTM2_MODE |= FTM_MODE_FTMEN_MASK; //FTMEN=1,关闭TPM兼容模式，开启FTM所有功能
        LDR.N    R0,??DataTable12_58  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_58  ;; 0x400b8054
        STR      R0,[R1, #+0]
//  547 
//  548     //FTM1_QDCTRL &= ~FTM_QDCTRL_QUADMODE_MASK; //选定编码模式为A相与B相编码模式
//  549     FTM1_QDCTRL |= FTM_QDCTRL_QUADMODE_MASK;//AB相同时判断极性
        LDR.N    R0,??DataTable12_47  ;; 0x40039080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable12_47  ;; 0x40039080
        STR      R0,[R1, #+0]
//  550     
//  551     FTM1_QDCTRL |= FTM_QDCTRL_QUADEN_MASK; //使能正交解码模式
        LDR.N    R0,??DataTable12_47  ;; 0x40039080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_47  ;; 0x40039080
        STR      R0,[R1, #+0]
//  552     //FTM2_QDCTRL &= ~FTM_QDCTRL_QUADMODE_MASK; //选定编码模式为A相与B相编码模式
//  553     FTM2_QDCTRL |= FTM_QDCTRL_QUADMODE_MASK;
        LDR.N    R0,??DataTable12_59  ;; 0x400b8080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable12_59  ;; 0x400b8080
        STR      R0,[R1, #+0]
//  554     
//  555     FTM2_QDCTRL |= FTM_QDCTRL_QUADEN_MASK; //使能正交解码模式
        LDR.N    R0,??DataTable12_59  ;; 0x400b8080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_59  ;; 0x400b8080
        STR      R0,[R1, #+0]
//  556 
//  557     FTM1_SC |= FTM_SC_CLKS(3);  //选择外部时钟
        LDR.N    R0,??DataTable12_6  ;; 0x40039000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x18
        LDR.N    R1,??DataTable12_6  ;; 0x40039000
        STR      R0,[R1, #+0]
//  558 //   FTM1_CONF |=FTM_CONF_BDMMODE(3); //可根据需要选择
//  559     FTM2_SC |= FTM_SC_CLKS(3);
        LDR.N    R0,??DataTable12_10  ;; 0x400b8000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x18
        LDR.N    R1,??DataTable12_10  ;; 0x400b8000
        STR      R0,[R1, #+0]
//  560 //   FTM2_CONF |=FTM_CONF_BDMMODE(3);
//  561 
//  562 }
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  563 int speed_L;
speed_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  564 int direction;
direction:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  565 void lptmr_pulse_clean(void)
//  566 {
//  567     LPTMR0_CSR  &= ~LPTMR_CSR_TEN_MASK;     //禁用LPT的时候就会自动清计数器的值
lptmr_pulse_clean:
        LDR.N    R0,??DataTable12_60  ;; 0x40040000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable12_60  ;; 0x40040000
        STR      R0,[R1, #+0]
//  568     LPTMR0_CSR  |= LPTMR_CSR_TEN_MASK;
        LDR.N    R0,??DataTable12_60  ;; 0x40040000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_60  ;; 0x40040000
        STR      R0,[R1, #+0]
//  569 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  570 int QUADRead_L(void)   
//  571 {                     
QUADRead_L:
        PUSH     {R7,LR}
//  572       direction =GPIO_GetBit(PORT_A,13); //1正转
        MOVS     R1,#+13
        MOVS     R0,#+0
        BL       GPIO_GetBit
        LDR.N    R1,??DataTable12_61
        STR      R0,[R1, #+0]
//  573       
//  574       if(direction)
        LDR.N    R0,??DataTable12_61
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??QUADRead_L_0
//  575       {     
//  576       speed_L = LPTMR0_CNR;     //保存脉冲计数器计算值
        LDR.N    R0,??DataTable12_62  ;; 0x4004000c
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable12_63
        STR      R0,[R1, #+0]
        B.N      ??QUADRead_L_1
//  577       }
//  578       else
//  579       {        
//  580        speed_L =-LPTMR0_CNR;   
??QUADRead_L_0:
        LDR.N    R0,??DataTable12_62  ;; 0x4004000c
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+0
        LDR.N    R1,??DataTable12_63
        STR      R0,[R1, #+0]
//  581       }
//  582       lptmr_pulse_clean();
??QUADRead_L_1:
        BL       lptmr_pulse_clean
//  583       
//  584       return speed_L;
        LDR.N    R0,??DataTable12_63
        LDR      R0,[R0, #+0]
        POP      {R1,PC}          ;; return
//  585 }
//  586 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  587 void lptmr_pulse_counter(char pin_select)
//  588 {
//  589   uint16 compare_value=3056;     //3056
lptmr_pulse_counter:
        MOV      R1,#+3056
//  590  
//  591   //Reset LPTMR module
//  592   LPTMR0_CSR=0x00;
        MOVS     R2,#+0
        LDR.N    R3,??DataTable12_60  ;; 0x40040000
        STR      R2,[R3, #+0]
//  593   LPTMR0_PSR=0x00;
        MOVS     R2,#+0
        LDR.N    R3,??DataTable12_64  ;; 0x40040004
        STR      R2,[R3, #+0]
//  594   LPTMR0_CMR=0x00;
        MOVS     R2,#+0
        LDR.N    R3,??DataTable12_65  ;; 0x40040008
        STR      R2,[R3, #+0]
//  595     SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;
        LDR.N    R2,??DataTable12_11  ;; 0x40048038
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x1
        LDR.N    R3,??DataTable12_11  ;; 0x40048038
        STR      R2,[R3, #+0]
//  596     
//  597   //Set up GPIO
//  598   if(pin_select==LPTMR_ALT1)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??lptmr_pulse_counter_0
//  599   {
//  600     SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK; //Turn on PORTA clock
        LDR.N    R2,??DataTable12_11  ;; 0x40048038
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x200
        LDR.N    R3,??DataTable12_11  ;; 0x40048038
        STR      R2,[R3, #+0]
//  601     PORTA_PCR19=PORT_PCR_MUX(0x6); //Use ALT6 on PTA19
        MOV      R2,#+1536
        LDR.N    R3,??DataTable12_66  ;; 0x4004904c
        STR      R2,[R3, #+0]
//  602 
//  603     //printf("Testing ALT1 pin on PORTA19\n");
//  604     //printf("\tTWR-K70F120M: ALT1 is conected to pin 18 on J15\n");
//  605   }
//  606   else if(pin_select==LPTMR_ALT2)
//  607   {
//  608     SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK; //Turn on PORTC clock
//  609     PORTC_PCR5=PORT_PCR_MUX(0x3); //Use ALT4 on PTC5
//  610   }
//  611   else
//  612   {
//  613     return;
//  614   }
//  615 
//  616   LPTMR0_PSR=LPTMR_PSR_PCS(0x01)|LPTMR_PSR_PBYP_MASK; //Use LPO clock but bypass glitch filter  ox1
??lptmr_pulse_counter_1:
        MOVS     R2,#+5
        LDR.N    R3,??DataTable12_64  ;; 0x40040004
        STR      R2,[R3, #+0]
//  617   LPTMR0_CMR=LPTMR_CMR_COMPARE(compare_value);  //Set compare value
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R2,??DataTable12_65  ;; 0x40040008
        STR      R1,[R2, #+0]
//  618   LPTMR0_CSR=LPTMR_CSR_TPS(pin_select)|LPTMR_CSR_TMS_MASK; //Set LPT to use the pin selected, and put in pulse count mode, on rising edge (default)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+4
        ANDS     R0,R0,#0x30
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable12_60  ;; 0x40040000
        STR      R0,[R1, #+0]
//  619 
//  620   
//  621 
//  622   LPTMR0_CSR|=LPTMR_CSR_TEN_MASK; //Turn on LPT
        LDR.N    R0,??DataTable12_60  ;; 0x40040000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_60  ;; 0x40040000
        STR      R0,[R1, #+0]
//  623   LPTMR0_CSR|=LPTMR_CSR_TPP_MASK;  //低电平触发
        LDR.N    R0,??DataTable12_60  ;; 0x40040000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable12_60  ;; 0x40040000
        STR      R0,[R1, #+0]
//  624  // LPTMR0_CSR|=LPTMR_CSR_TIE_MASK;  
//  625   /*When the Timer Interrupt Enable is set, the LPTMR Interrupt is generated whenever the Timer Compare
//  626 Flag is also set.
//  627 0 Timer Interrupt Disabled.
//  628 1 Timer Interrupt Enabled.
//  629   */
//  630   //Wait for compare flag to be set
//  631  //while((LPTMR0_CSR&LPTMR_CSR_TCF_MASK)==0)
//  632   {
//  633     //This may not get proper counter data if the CNR is read at the same time it is incremented
//  634     //printf("Current value of pulse count register CNR is %d\n",get_counter_value());
//  635   }
//  636 
//  637   
//  638 }
??lptmr_pulse_counter_2:
        BX       LR               ;; return
??lptmr_pulse_counter_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??lptmr_pulse_counter_3
        LDR.N    R2,??DataTable12_11  ;; 0x40048038
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x800
        LDR.N    R3,??DataTable12_11  ;; 0x40048038
        STR      R2,[R3, #+0]
        MOV      R2,#+768
        LDR.N    R3,??DataTable12_67  ;; 0x4004b014
        STR      R2,[R3, #+0]
        B.N      ??lptmr_pulse_counter_1
??lptmr_pulse_counter_3:
        B.N      ??lptmr_pulse_counter_2
//  639 
//  640 
//  641 /*!
//  642  *  @brief      LPTMR脉冲计数初始化
//  643  *  @param      LPT0_ALTn   LPTMR脉冲计数管脚
//  644  *  @param      count       LPTMR脉冲比较值
//  645  *  @param      LPT_CFG     LPTMR脉冲计数方式：上升沿计数或下降沿计数
//  646  *  @since      v5.0
//  647  *  Sample usage:       lptmr_pulse_init(LPT0_ALT1,0xFFFF,LPT_Rising);     // LPTMR 脉冲捕捉，捕捉0xFFFF后触发中断请求（需要开中断才执行中断复位函数），上升沿捕捉
//  648  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  649 void lptmr_pulse_init(LPT0_ALTn altn, uint16 count, LPT_CFG cfg)
//  650 {
lptmr_pulse_init:
        PUSH     {R4}
//  651 
//  652 #if  defined(MK60F15)
//  653     OSC0_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
//  654 #endif
//  655 
//  656     // 开启模块时钟
//  657     SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;                        //使能LPT模块时钟
        LDR.N    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1
        LDR.N    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
//  658 
//  659     //设置输入管脚
//  660     if(altn == LPTMR_ALT1)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??lptmr_pulse_init_0
//  661     {
//  662        // port_init(PTA19, 0x06 << PORT_PCR_MUX_SHIFT );            //在PTA19上使用 ALT6
//  663         //GPIO_Init(PORT_B,9,GPO,LVL_H);    // 前   CLK
//  664           SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK; //Turn on PORTA clock
        LDR.N    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x200
        LDR.N    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
//  665           PORTA_PCR19=PORT_PCR_MUX(0x6); //Use ALT6 on PTA19
        MOV      R3,#+1536
        LDR.N    R4,??DataTable12_66  ;; 0x4004904c
        STR      R3,[R4, #+0]
        B.N      ??lptmr_pulse_init_1
//  666     }
//  667     else if(altn == LPTMR_ALT2)
??lptmr_pulse_init_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??lptmr_pulse_init_1
//  668     {
//  669           SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK; //Turn on PORTC clock
        LDR.N    R3,??DataTable12_11  ;; 0x40048038
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.N    R4,??DataTable12_11  ;; 0x40048038
        STR      R3,[R4, #+0]
//  670          PORTC_PCR5=PORT_PCR_MUX(0x4); //Use ALT4 on PTC5
        MOV      R3,#+1024
        LDR.N    R4,??DataTable12_67  ;; 0x4004b014
        STR      R3,[R4, #+0]
//  671        // port_init(PTC5, 0x04 << PORT_PCR_MUX_SHIFT );             //在PTC5上使用 ALT4
//  672     }
//  673     else                                    //不可能发生事件
//  674     {
//  675        // ASSERT((altn == LPTMR_ALT1 ) || (altn == LPTMR_ALT2 ));   //设置管脚有误？
//  676     }
//  677 
//  678     // 清状态寄存器
//  679     LPTMR0_CSR = 0x00;                                          //先关了LPT，这样才能设置时钟分频,清空计数值等
??lptmr_pulse_init_1:
        MOVS     R3,#+0
        LDR.N    R4,??DataTable12_60  ;; 0x40040000
        STR      R3,[R4, #+0]
//  680 
//  681 #if defined(MK60DZ10)
//  682     //选择时钟源
//  683     LPTMR0_PSR  =   ( 0
//  684                       | LPTMR_PSR_PCS(1)                  //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
//  685                       | LPTMR_PSR_PBYP_MASK               //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
//  686                       //| LPTMR_PSR_PRESCALE(1)           //预分频值 = 2^(n+1) ,n = 0~ 0xF
//  687                     );
//  688 #elif defined(MK60F15)
//  689     //选择时钟源
//  690     LPTMR0_PSR  =   ( 0
//  691                       | LPTMR_PSR_PCS(3)          //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
//  692                       //| LPTMR_PSR_PBYP_MASK     //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
//  693                       | LPTMR_PSR_PRESCALE(4)     //预分频值 = 2^(n+1) ,n = 0~ 0xF
//  694                     );
//  695 #endif
//  696 
//  697     // 设置累加计数值
//  698     LPTMR0_CMR  =   LPTMR_CMR_COMPARE(count);                   //设置比较值
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R3,??DataTable12_65  ;; 0x40040008
        STR      R1,[R3, #+0]
//  699 
//  700     // 管脚设置、使能中断
//  701     LPTMR0_CSR  =  (0
//  702                     | LPTMR_CSR_TPS(altn)       // 选择输入管脚 选择
//  703                     | LPTMR_CSR_TMS_MASK        // 选择脉冲计数 (注释了表示时间计数模式)
//  704                     | ( cfg == LPT_Falling ?  LPTMR_CSR_TPP_MASK :   0  )  //脉冲计数器触发方式选择：0为高电平有效，上升沿加1
//  705                     | LPTMR_CSR_TEN_MASK        //使能LPT(注释了表示禁用)
//  706                     | LPTMR_CSR_TIE_MASK        //中断使能
//  707                     //| LPTMR_CSR_TFC_MASK      //0:计数值等于比较值就复位；1：溢出复位（注释表示0）
//  708                    );
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??lptmr_pulse_init_2
        MOVS     R1,#+8
        B.N      ??lptmr_pulse_init_3
??lptmr_pulse_init_2:
        MOVS     R1,#+0
??lptmr_pulse_init_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+4
        ANDS     R0,R0,#0x30
        ORRS     R0,R1,R0
        ORRS     R0,R0,#0x43
        LDR.N    R1,??DataTable12_60  ;; 0x40040000
        STR      R0,[R1, #+0]
//  709 }
        POP      {R4}
        BX       LR               ;; return
//  710 
//  711 
//  712 /*!
//  713  *  @brief      获取LPTMR脉冲计数值
//  714  *  @return     脉冲计数值
//  715  *  @since      v5.0
//  716  *  Sample usage:       uint16 data = lptmr_pulse_get();  //获取脉冲计数值
//  717  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  718 uint16 lptmr_pulse_get(void)
//  719 {
//  720     uint16 data;
//  721     if(LPTMR0_CSR & LPTMR_CSR_TCF_MASK)     //已经溢出了
lptmr_pulse_get:
        LDR.N    R0,??DataTable12_60  ;; 0x40040000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??lptmr_pulse_get_0
//  722     {
//  723 
//  724         data = ~0;                          //返回 0xffffffff 表示错误
        MOVW     R0,#+65535
        B.N      ??lptmr_pulse_get_1
//  725     }
//  726     else
//  727     {
//  728 #if defined(MK60F15)
//  729         LPTMR0_CNR = 0;
//  730 #endif
//  731         data = LPTMR0_CNR;
??lptmr_pulse_get_0:
        LDR.N    R0,??DataTable12_62  ;; 0x4004000c
        LDR      R0,[R0, #+0]
//  732     }
//  733     return data;
??lptmr_pulse_get_1:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
//  734 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x40038008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     0x4003804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     0x40039008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     0x4003904c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     0x400b8008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_9:
        DC32     0x400b804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_10:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_11:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_12:
        DC32     0x4004b004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_13:
        DC32     0x4004b008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_14:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_15:
        DC32     0x4004b010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_16:
        DC32     0x4004c010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_17:
        DC32     0x4004c014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_18:
        DC32     0x4004c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_19:
        DC32     0x4004c01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_20:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_21:
        DC32     0x40049024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_22:
        DC32     0x40049028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_23:
        DC32     0x4004902c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_24:
        DC32     FTMx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_25:
        DC32     0x4003802c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_26:
        DC32     0x40038034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_27:
        DC32     0x4003803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_28:
        DC32     0x40038044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_29:
        DC32     0x40038054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_30:
        DC32     0x40038064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_31:
        DC32     0x4003805c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_32:
        DC32     0x4003806c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_33:
        DC32     0x40038070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_34:
        DC32     0x40038080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_35:
        DC32     0x40038090

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_36:
        DC32     0x40038094

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_37:
        DC32     0x40038098

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_38:
        DC32     0x40038040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_39:
        DC32     0x40038048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_40:
        DC32     0x40038030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_41:
        DC32     0x40038038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_42:
        DC32     0x40049020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_43:
        DC32     0x4003900c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_44:
        DC32     0x40039060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_45:
        DC32     0x40039010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_46:
        DC32     0x40039054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_47:
        DC32     0x40039080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_48:
        DC32     0x40039064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_49:
        DC32     0x40039068

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_50:
        DC32     0x4003908c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_51:
        DC32     0x40039058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_52:
        DC32     0x40039014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_53:
        DC32     0x40039018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_54:
        DC32     0x40039004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_55:
        DC32     0x4004a004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_56:
        DC32     0x4004a048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_57:
        DC32     0x4004a04c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_58:
        DC32     0x400b8054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_59:
        DC32     0x400b8080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_60:
        DC32     0x40040000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_61:
        DC32     direction

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_62:
        DC32     0x4004000c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_63:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_64:
        DC32     0x40040004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_65:
        DC32     0x40040008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_66:
        DC32     0x4004904c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_67:
        DC32     0x4004b014

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//     8 bytes in section .bss
//    12 bytes in section .data
// 2 818 bytes in section .text
// 
// 2 818 bytes of CODE memory
//    20 bytes of DATA memory
//
//Errors: none
//Warnings: none
