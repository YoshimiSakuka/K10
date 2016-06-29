///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:42
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\assert.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\assert.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\assert.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN printf

        PUBLIC ASSERT_FAILED_STR1
        PUBLIC assert_failed1

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\assert.c
//    1 #include "assert.h"
//    2 
//    3 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//    4 const char ASSERT_FAILED_STR1[] = "Assertion failed in %s at line %d\n";
ASSERT_FAILED_STR1:
        DATA
        DC8 "Assertion failed in %s at line %d\012"
        DC8 0
//    5 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    6 void assert_failed1(char *file, int line)
//    7 {
assert_failed1:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//    8     //int i;
//    9     //LED_init();
//   10     while (1)
//   11     {
//   12         #ifdef DEBUG_PRINT
//   13         printf(ASSERT_FAILED_STR1, file, line);  //打印错误信息
??assert_failed1_0:
        MOVS     R2,R5
        MOVS     R1,R4
        LDR.N    R0,??assert_failed1_1
        BL       printf
        B.N      ??assert_failed1_0
        Nop      
        DATA
??assert_failed1_1:
        DC32     ASSERT_FAILED_STR1
//   14         #endif
//   15         //for (i = 0xffffff; i; i--) ;
//   16         //water_lights();                         //用流水灯来指示进入错误状态
//   17         //for (i = 0xffffff; i; i--) ;
//   18     }
//   19 }

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
// 36 bytes in section .rodata
// 24 bytes in section .text
// 
// 24 bytes of CODE  memory
// 36 bytes of CONST memory
//
//Errors: none
//Warnings: none
