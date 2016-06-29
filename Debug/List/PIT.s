///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:05:00
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\PIT.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\PIT.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\PIT.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN enable_irq

        PUBLIC DisableTimer0
        PUBLIC DisableTimer1
        PUBLIC EnableTimer0
        PUBLIC EnableTimer1
        PUBLIC Timer0_Init
        PUBLIC Timer1_Init

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\PIT.c
//    1 #include "PIT.h"
//    2 /*************************************************************************
//    3 PIT0初始化
//    4 
//    5 
//    6 
//    7 *************************************************************************/
//    8 
//    9 
//   10 
//   11 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   12 void Timer0_Init(void)
//   13 {
Timer0_Init:
        PUSH     {R7,LR}
//   14  
//   15     // PIT clock enable:
//   16     SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;
        LDR.N    R0,??DataTable5  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable5  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   17     
//   18     // enable the clock for PIT Timers:
//   19     PIT_MCR = 0;        //使能PIT时钟
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_1  ;; 0x40037000
        STR      R0,[R1, #+0]
//   20      
//   21     // config the period of PIT0:
//   22     PIT_LDVAL0 = PIT0_INIT_VAL;         //定时器未设置  频率为PLL频率 （96M） 
        MOVW     R0,#+45000
        LDR.N    R1,??DataTable5_2  ;; 0x40037100
        STR      R0,[R1, #+0]
//   23     
//   24     // enable interrupt for PIT0:
//   25     PIT_TCTRL0 |= PIT_TCTRL_TIE_MASK;  // TIE=1:Interrupt will be requested whenever TIF is set
        LDR.N    R0,??DataTable5_3  ;; 0x40037108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable5_3  ;; 0x40037108
        STR      R0,[R1, #+0]
//   26     
//   27     enable_irq(IRQ_NUM_PIT0);
        MOVS     R0,#+68
        BL       enable_irq
//   28     
//   29 }
        POP      {R0,PC}          ;; return
//   30 
//   31 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void Timer1_Init(void)
//   33 {
Timer1_Init:
        PUSH     {R7,LR}
//   34  
//   35     // PIT clock enable:
//   36     SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;
        LDR.N    R0,??DataTable5  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800000
        LDR.N    R1,??DataTable5  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   37     
//   38     // enable the clock for PIT Timers:
//   39     PIT_MCR = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_1  ;; 0x40037000
        STR      R0,[R1, #+0]
//   40      
//   41     // config the period of PIT0:
//   42     PIT_LDVAL1 = PIT1_INIT_VAL;
        LDR.N    R0,??DataTable5_4  ;; 0xb71b0
        LDR.N    R1,??DataTable5_5  ;; 0x40037110
        STR      R0,[R1, #+0]
//   43     
//   44     // enable interrupt for PIT0:
//   45     PIT_TCTRL1 |= PIT_TCTRL_TIE_MASK;  // TIE=1:Interrupt will be requested whenever TIF is set
        LDR.N    R0,??DataTable5_6  ;; 0x40037118
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable5_6  ;; 0x40037118
        STR      R0,[R1, #+0]
//   46     
//   47     enable_irq(IRQ_NUM_PIT1);
        MOVS     R0,#+69
        BL       enable_irq
//   48     
//   49 }
        POP      {R0,PC}          ;; return
//   50 
//   51 /******************************************************************
//   52 Function:           EnableTimer0
//   53 Description:        Initialize timer
//   54 Calls:
//   55 Called By:          NONE
//   56 Input:              NONE
//   57 Output:             NONE
//   58 Return:             NONE
//   59 ******************************************************************/
//   60 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   61 void EnableTimer0(void) 
//   62 {
//   63     ENABLE_PIT0;   
EnableTimer0:
        LDR.N    R0,??DataTable5_3  ;; 0x40037108
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable5_3  ;; 0x40037108
        STR      R0,[R1, #+0]
//   64 }
        BX       LR               ;; return
//   65 
//   66 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 void EnableTimer1(void) 
//   68 {
//   69     ENABLE_PIT1;   
EnableTimer1:
        LDR.N    R0,??DataTable5_6  ;; 0x40037118
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable5_6  ;; 0x40037118
        STR      R0,[R1, #+0]
//   70 }
        BX       LR               ;; return
//   71 /******************************************************************
//   72 Function:           DisableTimer0
//   73 Description:        Initialize timer
//   74 Calls:
//   75 Called By:          NONE
//   76 Input:              NONE
//   77 Output:             NONE
//   78 Return:             NONE
//   79 ******************************************************************/
//   80 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   81 void DisableTimer0(void) 
//   82 {  
//   83     DISABLE_PIT0;  
DisableTimer0:
        LDR.N    R0,??DataTable5_3  ;; 0x40037108
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable5_3  ;; 0x40037108
        STR      R0,[R1, #+0]
//   84 }
        BX       LR               ;; return
//   85 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   86 void DisableTimer1(void) 
//   87 {  
//   88     DISABLE_PIT1;  
DisableTimer1:
        LDR.N    R0,??DataTable5_6  ;; 0x40037118
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable5_6  ;; 0x40037118
        STR      R0,[R1, #+0]
//   89 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x40037000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x40037100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40037108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0xb71b0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x40037110

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40037118

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
// 178 bytes in section .text
// 
// 178 bytes of CODE memory
//
//Errors: none
//Warnings: none
