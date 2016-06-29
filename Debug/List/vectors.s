///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:05:03
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\vectors.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\vectors.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\vectors.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION `.data_init`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION CodeRelocate:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION CodeRelocateRam:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        EXTERN DMA_CH0_Handle
        EXTERN FTM0_ISR
        EXTERN FTM1_ISR
        EXTERN FTM2_ISR
        EXTERN PIT0_ISR
        EXTERN PIT1_ISR
        EXTERN PIT2_ISR
        EXTERN PIT3_ISR
        EXTERN Porta_Isr
        EXTERN Portb_Isr
        EXTERN Portc_Isr
        EXTERN Portd_Isr
        EXTERN Porte_Isr
        EXTERN UART1_ISR
        EXTERN __BOOT_STACK_ADDRESS
        EXTERN __VECTOR_RAM
        EXTERN __VECTOR_TABLE
        EXTERN __startup
        EXTERN printf

        PUBLIC DummyISR
        PUBLIC VECTableInit
        PUBLIC WatchdogDisable
        PUBLIC __vector_table
        PUBLIC default_isr
        PUBLIC disable_irq
        PUBLIC enable_irq
        PUBLIC set_irq_priority

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\vectors.c
//    1 //*******************************************************************************************
//    2 //  MK60DN512ZVL(K/L/Q)10 Demo - Vectors, Ultra-Low Pwr UART 115200 Echo ISR, 50MHz ACLK
//    3 //
//    4 //           MK60DN512ZVL(K/L/Q)10
//    5 //            -----------------
//    6 //        /|\|              XIN|-
//    7 //         | |                 | 32kHz
//    8 //         --|RST          XOUT|-
//    9 //           |                 |
//   10 //           |                 |
//   11 //           |           P1.1  |<----L1 
//   12 //           |           P1.3  |<----L2
//   13 //           |           P1.5  |<----L3
//   14 //           |                 |
//   15 //           |                 |
//   16 //           |           P1.4  |---->H1 
//   17 //           |           P1.2  |---->H2
//   18 //           |           P1.0  |---->H3
//   19 //           |                 |
//   20 //           |                 |
//   21 //
//   22 //  Copyright (c) 2012.04  WH, All Rights Reserved.
//   23 //  WebSite     : http://un-el.taobao.com/
//   24 //  Email       : dragonhzw@163.com
//   25 //  Description : The vectors module
//   26 //  History     :                                                           
//   27 //     [Author]   [Date]      [Version]    [Description]                     
//   28 //     [1] dragonhzw   2009/04/09  Ver 1.0.0    Initial file.
//   29 //
//   30 //  Built with IAR Embedded Workbench for ARM 6.30  
//   31 //***********************************************************************************************
//   32 
//   33 //#include "..\K60_datatype.h"
//   34 #include "vectors.h"
//   35 #include "isr.h"
//   36 //#ifdef  __cplusplus
//   37 //extern "C" {
//   38 //#endif
//   39 
//   40 
//   41   
//   42   
//   43 /***GBL+**********************************************************************/
//   44 /* Vectors table address.                                                    */
//   45 /***GBL-**********************************************************************/
//   46 extern unsigned long __BOOT_STACK_ADDRESS[];
//   47 
//   48 /***FUNC+*********************************************************************/
//   49 /* Name   : WatchdogDisable                                                  */
//   50 /* Descrp : watchdog disable                                                 */
//   51 /* Input  : None                                                             */   
//   52 /* Output : None.                                                            */
//   53 /* Return : None.                                                            */   
//   54 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   55 void WatchdogDisable(void)
//   56 {
//   57     WDOG_UNLOCK = 0xC520;
WatchdogDisable:
        MOVW     R0,#+50464
        LDR.N    R1,??DataTable4  ;; 0x4005200e
        STRH     R0,[R1, #+0]
//   58     WDOG_UNLOCK = 0xD928;
        MOVW     R0,#+55592
        LDR.N    R1,??DataTable4  ;; 0x4005200e
        STRH     R0,[R1, #+0]
//   59     WDOG_STCTRLH &= ~WDOG_STCTRLH_WDOGEN_MASK; 
        LDR.N    R0,??DataTable4_1  ;; 0x40052000
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+65534
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable4_1  ;; 0x40052000
        STRH     R0,[R1, #+0]
//   60 }
        BX       LR               ;; return
//   61 /***FUNC+*********************************************************************/
//   62 /* Name   : VECTableInit                                                     */
//   63 /* Descrp : Copy the vector table to RAM                                     */
//   64 /* Input  : None                                                             */   
//   65 /* Output : None.                                                            */
//   66 /* Return : None.                                                            */   
//   67 /***FUNC-*********************************************************************/
//   68 #pragma section = ".data"
//   69 #pragma section = ".data_init"
//   70 #pragma section = ".bss"
//   71 #pragma section = "CodeRelocate"
//   72 #pragma section = "CodeRelocateRam" 
//   73 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   74 void VECTableInit(void)
//   75 {
//   76  
//   77     /* Declare a counter we'll use in all of the copy loops */
//   78     ULONG n;
//   79  
//   80  
//   81     /* Addresses for VECTOR_TABLE and VECTOR_RAM come from the linker file */  
//   82     extern ULONG __VECTOR_TABLE[];
//   83     extern ULONG __VECTOR_RAM[];
//   84 
//   85     /* Copy the vector table to RAM */
//   86     if (__VECTOR_RAM != __VECTOR_TABLE)
VECTableInit:
        LDR.N    R0,??DataTable4_2
        LDR.N    R1,??DataTable4_3
        CMP      R0,R1
        BEQ.N    ??VECTableInit_0
//   87     {
//   88         for (n = 0; n < 0x410; n++)
        MOVS     R0,#+0
        B.N      ??VECTableInit_1
//   89             __VECTOR_RAM[n] = __VECTOR_TABLE[n];
??VECTableInit_2:
        LDR.N    R1,??DataTable4_3
        LDR      R1,[R1, R0, LSL #+2]
        LDR.N    R2,??DataTable4_2
        STR      R1,[R2, R0, LSL #+2]
        ADDS     R0,R0,#+1
??VECTableInit_1:
        CMP      R0,#+1040
        BCC.N    ??VECTableInit_2
//   90     }
//   91     /* Point the VTOR to the new copy of the vector table */
//   92     //write_vtor((uint32)__VECTOR_RAM);  
//   93     
//   94     SCB_VTOR = (ULONG)__VECTOR_RAM;
??VECTableInit_0:
        LDR.N    R0,??DataTable4_2
        LDR.N    R1,??DataTable4_4  ;; 0xe000ed08
        STR      R0,[R1, #+0]
//   95     
//   96     /* Get the addresses for the .data section (initialized data section) */
//   97     U8* data_ram = __section_begin(".data");
        LDR.N    R1,??DataTable4_5
//   98     U8* data_rom = __section_begin(".data_init");
        LDR.N    R2,??DataTable4_6
//   99     U8* data_rom_end = __section_end(".data_init");
        LDR.N    R0,??DataTable4_7
//  100     
//  101     /* Copy initialized data from ROM to RAM */
//  102     n = data_rom_end - data_rom;
        SUBS     R0,R0,R2
        B.N      ??VECTableInit_3
//  103     while (n--)
//  104       *data_ram++ = *data_rom++;
??VECTableInit_4:
        LDRB     R3,[R2, #+0]
        STRB     R3,[R1, #+0]
        ADDS     R2,R2,#+1
        ADDS     R1,R1,#+1
??VECTableInit_3:
        MOVS     R3,R0
        SUBS     R0,R3,#+1
        CMP      R3,#+0
        BNE.N    ??VECTableInit_4
//  105  
//  106  
//  107     /* Get the addresses for the .bss section (zero-initialized data) */
//  108     U8* bss_start = __section_begin(".bss");
        LDR.N    R1,??DataTable4_8
//  109     U8* bss_end = __section_end(".bss");
        LDR.N    R0,??DataTable4_9
//  110     
//  111     /* Clear the zero-initialized data section */
//  112     n = bss_end - bss_start;
        SUBS     R0,R0,R1
        B.N      ??VECTableInit_5
//  113     while(n--)
//  114       *bss_start++ = 0;    
??VECTableInit_6:
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
        ADDS     R1,R1,#+1
??VECTableInit_5:
        MOVS     R2,R0
        SUBS     R0,R2,#+1
        CMP      R2,#+0
        BNE.N    ??VECTableInit_6
//  115     
//  116     /* Get addresses for any code sections that need to be copied from ROM to RAM.
//  117      * The IAR tools have a predefined keyword that can be used to mark individual
//  118      * functions for execution from RAM. Add "__ramfunc" before the return type in
//  119      * the function prototype for any routines you need to execute from RAM instead 
//  120      * of ROM. ex: __ramfunc void foo(void);
//  121      */
//  122     U8* code_relocate_ram = __section_begin("CodeRelocateRam");
        LDR.N    R1,??DataTable4_10
//  123     U8* code_relocate = __section_begin("CodeRelocate");
        LDR.N    R2,??DataTable4_11
//  124     U8* code_relocate_end = __section_end("CodeRelocate");
        LDR.N    R0,??DataTable4_12
//  125     
//  126     /* Copy functions from ROM to RAM */
//  127     n = code_relocate_end - code_relocate;
        SUBS     R0,R0,R2
        B.N      ??VECTableInit_7
//  128     while (n--)
//  129       *code_relocate_ram++ = *code_relocate++;
??VECTableInit_8:
        LDRB     R3,[R2, #+0]
        STRB     R3,[R1, #+0]
        ADDS     R2,R2,#+1
        ADDS     R1,R1,#+1
??VECTableInit_7:
        MOVS     R3,R0
        SUBS     R0,R3,#+1
        CMP      R3,#+0
        BNE.N    ??VECTableInit_8
//  130     
//  131 }
        BX       LR               ;; return
//  132 /***FUNC+*********************************************************************/
//  133 /* Name   : enable_irq                                                       */
//  134 /* Descrp : Initialize the NVIC to enable the specified IRQ.                 */
//  135 /* Input  : irq    irq number to be enabled (the irq number NOT the          */
//  136 /*          vector number).                                                  */   
//  137 /* Output : None.                                                            */
//  138 /* Return : None.                                                            */   
//  139 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  140 void enable_irq (INT irq)
//  141 {
enable_irq:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  142     INT div;
//  143     
//  144     /* Make sure that the IRQ is an allowable number. Right now up to 91 is 
//  145      * used.
//  146      */
//  147     if (irq > MAX_IRQ_NUM)
        CMP      R4,#+92
        BLT.N    ??enable_irq_0
//  148     {
//  149         printf("\nERR! Invalid IRQ value passed to enable irq function!\n");
        LDR.N    R0,??DataTable4_13
        BL       printf
//  150     }
//  151     
//  152     /* Determine which of the NVICISERs corresponds to the irq */
//  153     div = irq/32;
??enable_irq_0:
        MOVS     R0,#+32
        SDIV     R0,R4,R0
//  154     
//  155     switch (div)
        CMP      R0,#+0
        BEQ.N    ??enable_irq_1
        CMP      R0,#+2
        BEQ.N    ??enable_irq_2
        BCC.N    ??enable_irq_3
        B.N      ??enable_irq_4
//  156     {
//  157         case 0x0:
//  158               NVICICPR0 |= 1 << (irq%32);
??enable_irq_1:
        LDR.N    R0,??DataTable4_14  ;; 0xe000e280
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R4,R2
        MLS      R3,R3,R2,R4
        LSLS     R1,R1,R3
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_14  ;; 0xe000e280
        STR      R0,[R1, #+0]
//  159               NVICISER0 |= 1 << (irq%32);
        LDR.N    R0,??DataTable4_15  ;; 0xe000e100
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R4,R2
        MLS      R3,R3,R2,R4
        LSLS     R1,R1,R3
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_15  ;; 0xe000e100
        STR      R0,[R1, #+0]
//  160               break;
        B.N      ??enable_irq_4
//  161         case 0x1:
//  162               NVICICPR1 |= 1 << (irq%32);
??enable_irq_3:
        LDR.N    R0,??DataTable4_16  ;; 0xe000e284
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R4,R2
        MLS      R3,R3,R2,R4
        LSLS     R1,R1,R3
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_16  ;; 0xe000e284
        STR      R0,[R1, #+0]
//  163               NVICISER1 |= 1 << (irq%32);
        LDR.N    R0,??DataTable4_17  ;; 0xe000e104
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R4,R2
        MLS      R3,R3,R2,R4
        LSLS     R1,R1,R3
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_17  ;; 0xe000e104
        STR      R0,[R1, #+0]
//  164               break;
        B.N      ??enable_irq_4
//  165         case 0x2:
//  166               NVICICPR2 |= 1 << (irq%32);
??enable_irq_2:
        LDR.N    R0,??DataTable4_18  ;; 0xe000e288
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R4,R2
        MLS      R3,R3,R2,R4
        LSLS     R1,R1,R3
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_18  ;; 0xe000e288
        STR      R0,[R1, #+0]
//  167               NVICISER2 |= 1 << (irq%32);
        LDR.N    R0,??DataTable4_19  ;; 0xe000e108
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R4,R2
        MLS      R3,R3,R2,R4
        LSLS     R1,R1,R3
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_19  ;; 0xe000e108
        STR      R0,[R1, #+0]
//  168               break;
//  169     }              
//  170 }
??enable_irq_4:
        POP      {R4,PC}          ;; return
//  171 
//  172 /***FUNC+*********************************************************************/
//  173 /* Name   : disable_irq                                                      */
//  174 /* Descrp : Initialize the NVIC to disable the specified IRQ.                */
//  175 /* Input  : irq    irq number to be disable (the irq number NOT the          */
//  176 /*          vector number).                                                  */   
//  177 /* Output : None.                                                            */
//  178 /* Return : None.                                                            */   
//  179 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  180 void disable_irq (INT irq)
//  181 {
disable_irq:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  182     INT div;
//  183     
//  184     /* Make sure that the IRQ is an allowable number. Right now up to 91 is 
//  185      * used.
//  186      */
//  187     if (irq > MAX_IRQ_NUM)
        CMP      R4,#+92
        BLT.N    ??disable_irq_0
//  188     {
//  189         printf("\nERR! Invalid IRQ value passed to disable irq function!\n");
        LDR.N    R0,??DataTable4_20
        BL       printf
//  190     }
//  191     
//  192     /* Determine which of the NVICICERs corresponds to the irq */
//  193     div = irq/32;
??disable_irq_0:
        MOVS     R0,#+32
        SDIV     R0,R4,R0
//  194     
//  195     switch (div)
        CMP      R0,#+0
        BEQ.N    ??disable_irq_1
        CMP      R0,#+2
        BEQ.N    ??disable_irq_2
        BCC.N    ??disable_irq_3
        B.N      ??disable_irq_4
//  196     {
//  197         case 0x0:
//  198                NVICICER0 |= 1 << (irq%32);
??disable_irq_1:
        LDR.N    R0,??DataTable4_21  ;; 0xe000e180
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R4,R2
        MLS      R3,R3,R2,R4
        LSLS     R1,R1,R3
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_21  ;; 0xe000e180
        STR      R0,[R1, #+0]
//  199               break;
        B.N      ??disable_irq_4
//  200         case 0x1:
//  201               NVICICER1 |= 1 << (irq%32);
??disable_irq_3:
        LDR.N    R0,??DataTable4_22  ;; 0xe000e184
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R4,R2
        MLS      R3,R3,R2,R4
        LSLS     R1,R1,R3
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_22  ;; 0xe000e184
        STR      R0,[R1, #+0]
//  202               break;
        B.N      ??disable_irq_4
//  203         case 0x2:
//  204               NVICICER2 |= 1 << (irq%32);
??disable_irq_2:
        LDR.N    R0,??DataTable4_23  ;; 0xe000e188
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R4,R2
        MLS      R3,R3,R2,R4
        LSLS     R1,R1,R3
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_23  ;; 0xe000e188
        STR      R0,[R1, #+0]
//  205               break;
//  206     }              
//  207 }
??disable_irq_4:
        POP      {R4,PC}          ;; return
//  208 #if 1
//  209 /***FUNC+*********************************************************************/
//  210 /* Name   : set_irq_priority                                                 */
//  211 /* Descrp : Initialize the NVIC to set specified IRQ priority.               */
//  212 /* Input  : irq    irq number to be enabled (the irq number NOT the          */
//  213 /*          vector number).                                                  */
//  214 /*          prio   irq priority. 0-15 levels. 0 max priority                 */
//  215 /* Output : None.                                                            */
//  216 /* Return : None.                                                            */   
//  217 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  218 void set_irq_priority (INT irq, INT prio)
//  219 {
set_irq_priority:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  220     /*irq priority pointer*/
//  221     uint8 *prio_reg;
//  222     
//  223     /* Make sure that the IRQ is an allowable number. Right now up to 91 is 
//  224      * used.
//  225      */
//  226     if (irq > MAX_IRQ_NUM)
        CMP      R4,#+92
        BLT.N    ??set_irq_priority_0
//  227     {
//  228         printf("\nERR! Invalid IRQ value passed to priority irq function!\n");
        LDR.N    R0,??DataTable4_24
        BL       printf
//  229     }
//  230 
//  231     if (prio > 15)
??set_irq_priority_0:
        CMP      R5,#+16
        BLT.N    ??set_irq_priority_1
//  232     {
//  233         printf("\nERR! Invalid priority value passed to priority irq function!\n");
        LDR.N    R0,??DataTable4_25
        BL       printf
//  234     }
//  235     
//  236     /* Determine which of the NVICIPx corresponds to the irq */
//  237     prio_reg = (uint8 *)(((u32)&NVICIP0) + irq);
??set_irq_priority_1:
        ADD      R0,R4,#-536870912
        ADDS     R0,R0,#+58368
//  238 
//  239     /* Assign priority to IRQ */
//  240     *prio_reg = ( (prio&0xF) << (8 - ARM_INTERRUPT_LEVEL_BITS) );             
        LSLS     R1,R5,#+4
        STRB     R1,[R0, #+0]
//  241 }
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x4005200e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40052000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     __VECTOR_RAM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     __VECTOR_TABLE

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0xe000ed08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     SFB(`.data`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     SFB(`.data_init`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     SFE(`.data_init`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     SFB(`.bss`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     SFE(`.bss`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     SFB(CodeRelocateRam)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     SFB(CodeRelocate)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     SFE(CodeRelocate)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_16:
        DC32     0xe000e284

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_17:
        DC32     0xe000e104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_18:
        DC32     0xe000e288

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_19:
        DC32     0xe000e108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_20:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_21:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_22:
        DC32     0xe000e184

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_23:
        DC32     0xe000e188

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_24:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_25:
        DC32     ?_3
//  242 #endif
//  243 /***FUNC+*********************************************************************/
//  244 /* Name   : Vector Table                                                     */
//  245 /* Descrp : struct Vector Table                                              */
//  246 /* Input  : None.                                                            */   
//  247 /* Output : None.                                                            */
//  248 /* Return : None.                                                            */   
//  249 /***FUNC-*********************************************************************/
//  250 typedef void (*vector_entry)(void);
//  251 
//  252 #pragma location = ".intvec"
//  253 

        SECTION `.intvec`:CONST:REORDER:NOROOT(2)
//  254 const vector_entry  __vector_table[] = //@ ".intvec" =
__vector_table:
        DATA
        DC32 __BOOT_STACK_ADDRESS, __startup, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, DMA_CH0_Handle, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 UART1_ISR, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, FTM0_ISR
        DC32 FTM1_ISR, FTM2_ISR, default_isr, default_isr, default_isr
        DC32 PIT0_ISR, PIT1_ISR, PIT2_ISR, PIT3_ISR, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, Porta_Isr, Portb_Isr
        DC32 Portc_Isr, Portd_Isr, Porte_Isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, 0FFFFFFFFH, 0FFFFFFFFH, 0FFFFFFFFH, 0FFFFFFFEH
//  255 {
//  256    VECTOR_000,           /* Initial SP           */
//  257    VECTOR_001,           /* Initial PC           */
//  258    VECTOR_002,
//  259    VECTOR_003,
//  260    VECTOR_004,
//  261    VECTOR_005,
//  262    VECTOR_006,
//  263    VECTOR_007,
//  264    VECTOR_008,
//  265    VECTOR_009,
//  266    VECTOR_010,
//  267    VECTOR_011,
//  268    VECTOR_012,
//  269    VECTOR_013,
//  270    VECTOR_014,
//  271    VECTOR_015,
//  272    VECTOR_016,
//  273    VECTOR_017,
//  274    VECTOR_018,
//  275    VECTOR_019,
//  276    VECTOR_020,
//  277    VECTOR_021,
//  278    VECTOR_022,
//  279    VECTOR_023,
//  280    VECTOR_024,
//  281    VECTOR_025,
//  282    VECTOR_026,
//  283    VECTOR_027,
//  284    VECTOR_028,
//  285    VECTOR_029,
//  286    VECTOR_030,
//  287    VECTOR_031,
//  288    VECTOR_032,
//  289    VECTOR_033,
//  290    VECTOR_034,
//  291    VECTOR_035,
//  292    VECTOR_036,
//  293    VECTOR_037,
//  294    VECTOR_038,
//  295    VECTOR_039,
//  296    VECTOR_040,
//  297    VECTOR_041,
//  298    VECTOR_042,
//  299    VECTOR_043,
//  300    VECTOR_044,
//  301    VECTOR_045,
//  302    VECTOR_046,
//  303    VECTOR_047,
//  304    VECTOR_048,
//  305    VECTOR_049,
//  306    VECTOR_050,
//  307    VECTOR_051,
//  308    VECTOR_052,
//  309    VECTOR_053,
//  310    VECTOR_054,
//  311    VECTOR_055,
//  312    VECTOR_056,
//  313    VECTOR_057,
//  314    VECTOR_058,
//  315    VECTOR_059,
//  316    VECTOR_060,
//  317    VECTOR_061,
//  318    VECTOR_062,
//  319    VECTOR_063,
//  320    VECTOR_064,
//  321    VECTOR_065,
//  322    VECTOR_066,
//  323    VECTOR_067,
//  324    VECTOR_068,
//  325    VECTOR_069,
//  326    VECTOR_070,
//  327    VECTOR_071,
//  328    VECTOR_072,
//  329    VECTOR_073,
//  330    VECTOR_074,
//  331    VECTOR_075,
//  332    VECTOR_076,
//  333    VECTOR_077,
//  334    VECTOR_078,
//  335    VECTOR_079,
//  336    VECTOR_080,
//  337    VECTOR_081,
//  338    VECTOR_082,
//  339    VECTOR_083,
//  340    VECTOR_084,
//  341    VECTOR_085,
//  342    VECTOR_086,
//  343    VECTOR_087,
//  344    VECTOR_088,
//  345    VECTOR_089,
//  346    VECTOR_090,
//  347    VECTOR_091,
//  348    VECTOR_092,
//  349    VECTOR_093,
//  350    VECTOR_094,
//  351    VECTOR_095,
//  352    VECTOR_096,
//  353    VECTOR_097,
//  354    VECTOR_098,
//  355    VECTOR_099,
//  356    VECTOR_100,
//  357    VECTOR_101,
//  358    VECTOR_102,
//  359    VECTOR_103,
//  360    VECTOR_104,
//  361    VECTOR_105,
//  362    VECTOR_106,
//  363    VECTOR_107,
//  364    VECTOR_108,
//  365    VECTOR_109,
//  366    VECTOR_110,
//  367    VECTOR_111,
//  368    VECTOR_112,
//  369    VECTOR_113,
//  370    VECTOR_114,
//  371    VECTOR_115,
//  372    VECTOR_116,
//  373    VECTOR_117,
//  374    VECTOR_118,
//  375    VECTOR_119,
//  376    VECTOR_120,
//  377    VECTOR_121,
//  378    VECTOR_122,
//  379    VECTOR_123,
//  380    VECTOR_124,
//  381    VECTOR_125,
//  382    VECTOR_126,
//  383    VECTOR_127,
//  384    VECTOR_128,
//  385    VECTOR_129,
//  386    VECTOR_130,
//  387    VECTOR_131,
//  388    VECTOR_132,
//  389    VECTOR_133,
//  390    VECTOR_134,
//  391    VECTOR_135,
//  392    VECTOR_136,
//  393    VECTOR_137,
//  394    VECTOR_138,
//  395    VECTOR_139,
//  396    VECTOR_140,
//  397    VECTOR_141,
//  398    VECTOR_142,
//  399    VECTOR_143,
//  400    VECTOR_144,
//  401    VECTOR_145,
//  402    VECTOR_146,
//  403    VECTOR_147,
//  404    VECTOR_148,
//  405    VECTOR_149,
//  406    VECTOR_150,
//  407    VECTOR_151,
//  408    VECTOR_152,
//  409    VECTOR_153,
//  410    VECTOR_154,
//  411    VECTOR_155,
//  412    VECTOR_156,
//  413    VECTOR_157,
//  414    VECTOR_158,
//  415    VECTOR_159,
//  416    VECTOR_160,
//  417    VECTOR_161,
//  418    VECTOR_162,
//  419    VECTOR_163,
//  420    VECTOR_164,
//  421    VECTOR_165,
//  422    VECTOR_166,
//  423    VECTOR_167,
//  424    VECTOR_168,
//  425    VECTOR_169,
//  426    VECTOR_170,
//  427    VECTOR_171,
//  428    VECTOR_172,
//  429    VECTOR_173,
//  430    VECTOR_174,
//  431    VECTOR_175,
//  432    VECTOR_176,
//  433    VECTOR_177,
//  434    VECTOR_178,
//  435    VECTOR_179,
//  436    VECTOR_180,
//  437    VECTOR_181,
//  438    VECTOR_182,
//  439    VECTOR_183,
//  440    VECTOR_184,
//  441    VECTOR_185,
//  442    VECTOR_186,
//  443    VECTOR_187,
//  444    VECTOR_188,
//  445    VECTOR_189,
//  446    VECTOR_190,
//  447    VECTOR_191,
//  448    VECTOR_192,
//  449    VECTOR_193,
//  450    VECTOR_194,
//  451    VECTOR_195,
//  452    VECTOR_196,
//  453    VECTOR_197,
//  454    VECTOR_198,
//  455    VECTOR_199,
//  456    VECTOR_200,
//  457    VECTOR_201,
//  458    VECTOR_202,
//  459    VECTOR_203,
//  460    VECTOR_204,
//  461    VECTOR_205,
//  462    VECTOR_206,
//  463    VECTOR_207,
//  464    VECTOR_208,
//  465    VECTOR_209,
//  466    VECTOR_210,
//  467    VECTOR_211,
//  468    VECTOR_212,
//  469    VECTOR_213,
//  470    VECTOR_214,
//  471    VECTOR_215,
//  472    VECTOR_216,
//  473    VECTOR_217,
//  474    VECTOR_218,
//  475    VECTOR_219,
//  476    VECTOR_220,
//  477    VECTOR_221,
//  478    VECTOR_222,
//  479    VECTOR_223,
//  480    VECTOR_224,
//  481    VECTOR_225,
//  482    VECTOR_226,
//  483    VECTOR_227,
//  484    VECTOR_228,
//  485    VECTOR_229,
//  486    VECTOR_230,
//  487    VECTOR_231,
//  488    VECTOR_232,
//  489    VECTOR_233,
//  490    VECTOR_234,
//  491    VECTOR_235,
//  492    VECTOR_236,
//  493    VECTOR_237,
//  494    VECTOR_238,
//  495    VECTOR_239,
//  496    VECTOR_240,
//  497    VECTOR_241,
//  498    VECTOR_242,
//  499    VECTOR_243,
//  500    VECTOR_244,
//  501    VECTOR_245,
//  502    VECTOR_246,
//  503    VECTOR_247,
//  504    VECTOR_248,
//  505    VECTOR_249,
//  506    VECTOR_250,
//  507    VECTOR_251,
//  508    VECTOR_252,
//  509    VECTOR_253,
//  510    VECTOR_254,
//  511    VECTOR_255,
//  512    CONFIG_1,
//  513    CONFIG_2,
//  514    CONFIG_3,
//  515    CONFIG_4,
//  516 };
//  517 
//  518 /***FUNC+*********************************************************************/
//  519 /* Name   : default_isr                                                      */
//  520 /* Descrp : Default ISR definition                                           */
//  521 /* Input  : num.                                                             */   
//  522 /* Output : None.                                                            */
//  523 /* Return : None.                                                            */   
//  524 /***FUNC-*********************************************************************/

        SECTION `.vec2nd`:CODE:NOROOT(1)
        THUMB
//  525 void default_isr(void) @ ".vec2nd"
//  526 {
default_isr:
        PUSH     {R7,LR}
//  527    (void)DummyISR();   
        BL       DummyISR
//  528 }
        POP      {R0,PC}          ;; return
//  529 
//  530 
//  531 
//  532 /***FUNC+*********************************************************************/
//  533 /* Name   : DummyISR                                                         */
//  534 /* Descrp : Default ISR definition                                           */
//  535 /* Input  : num.                                                             */   
//  536 /* Output : None.                                                            */
//  537 /* Return : None.                                                            */   
//  538 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  539 void DummyISR(void)
//  540 {
//  541     return;   
DummyISR:
        BX       LR               ;; return
//  542 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.data_init`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION CodeRelocate:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION CodeRelocateRam:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 0AH, 45H, 52H, 52H, 21H, 20H, 49H, 6EH
        DC8 76H, 61H, 6CH, 69H, 64H, 20H, 49H, 52H
        DC8 51H, 20H, 76H, 61H, 6CH, 75H, 65H, 20H
        DC8 70H, 61H, 73H, 73H, 65H, 64H, 20H, 74H
        DC8 6FH, 20H, 65H, 6EH, 61H, 62H, 6CH, 65H
        DC8 20H, 69H, 72H, 71H, 20H, 66H, 75H, 6EH
        DC8 63H, 74H, 69H, 6FH, 6EH, 21H, 0AH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 0AH, 45H, 52H, 52H, 21H, 20H, 49H, 6EH
        DC8 76H, 61H, 6CH, 69H, 64H, 20H, 49H, 52H
        DC8 51H, 20H, 76H, 61H, 6CH, 75H, 65H, 20H
        DC8 70H, 61H, 73H, 73H, 65H, 64H, 20H, 74H
        DC8 6FH, 20H, 64H, 69H, 73H, 61H, 62H, 6CH
        DC8 65H, 20H, 69H, 72H, 71H, 20H, 66H, 75H
        DC8 6EH, 63H, 74H, 69H, 6FH, 6EH, 21H, 0AH
        DC8 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 0AH, 45H, 52H, 52H, 21H, 20H, 49H, 6EH
        DC8 76H, 61H, 6CH, 69H, 64H, 20H, 49H, 52H
        DC8 51H, 20H, 76H, 61H, 6CH, 75H, 65H, 20H
        DC8 70H, 61H, 73H, 73H, 65H, 64H, 20H, 74H
        DC8 6FH, 20H, 70H, 72H, 69H, 6FH, 72H, 69H
        DC8 74H, 79H, 20H, 69H, 72H, 71H, 20H, 66H
        DC8 75H, 6EH, 63H, 74H, 69H, 6FH, 6EH, 21H
        DC8 0AH, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 0AH, 45H, 52H, 52H, 21H, 20H, 49H, 6EH
        DC8 76H, 61H, 6CH, 69H, 64H, 20H, 70H, 72H
        DC8 69H, 6FH, 72H, 69H, 74H, 79H, 20H, 76H
        DC8 61H, 6CH, 75H, 65H, 20H, 70H, 61H, 73H
        DC8 73H, 65H, 64H, 20H, 74H, 6FH, 20H, 70H
        DC8 72H, 69H, 6FH, 72H, 69H, 74H, 79H, 20H
        DC8 69H, 72H, 71H, 20H, 66H, 75H, 6EH, 63H
        DC8 74H, 69H, 6FH, 6EH, 21H, 0AH, 0
        DC8 0

        END
//  543 
//  544 //#ifdef  __cplusplus
//  545 //}
//  546 //#endif
//  547 
// 
// 1 040 bytes in section .intvec
//   240 bytes in section .rodata
//   584 bytes in section .text
//     8 bytes in section .vec2nd
// 
//   592 bytes of CODE  memory
// 1 280 bytes of CONST memory
//
//Errors: none
//Warnings: none
