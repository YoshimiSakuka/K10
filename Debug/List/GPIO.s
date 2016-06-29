///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:53
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\GPIO.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\GPIO.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\GPIO.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC GPIO_GetBit
        PUBLIC GPIO_Init
        PUBLIC GPIO_SetBit
        PUBLIC GPIOx
        PUBLIC PORTX
        PUBLIC gpio_reverse

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\GPIO.c
//    1 #include "GPIO.h"
//    2 
//    3 
//    4 //#ifdef  __cplusplus
//    5 //extern "C" {
//    6 //#endif
//    7   
//    8   
//    9 /******************************************************************************************************************/
//   10 /*GPIO port                                                                                                        */
//   11 /******************************************************************************************************************/
//   12 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13 volatile struct GPIO_MemMap *GPIOx[5] = {PTA_BASE_PTR, PTB_BASE_PTR, PTC_BASE_PTR, PTD_BASE_PTR, PTE_BASE_PTR}; //定义五个指针数组保存 GPIOx 的地址
GPIOx:
        DATA
        DC32 400FF000H, 400FF040H, 400FF080H, 400FF0C0H, 400FF100H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   14 volatile struct PORT_MemMap *PORTX[5] = {PORTA_BASE_PTR, PORTB_BASE_PTR, PORTC_BASE_PTR, PORTD_BASE_PTR, PORTE_BASE_PTR};
PORTX:
        DATA
        DC32 40049000H, 4004A000H, 4004B000H, 4004C000H, 4004D000H
//   15 
//   16 
//   17 /***FUNC+*********************************************************************/
//   18 /* Name   : GPIO_init                                                        */
//   19 /* Descrp : init Prot pin state                                              */
//   20 /* Input  : port -- select PORT A/B/C/D/E                                    */
//   21 /*          PinNum -- set pin number                                         */
//   22 /*          Dir -- pin in or out                                             */
//   23 /*          Level -- high or low                                             */
//   24 /* Output : None.                                                            */
//   25 /* Return : Prot  high or low level                                          */   
//   26 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   27 BOOL GPIO_Init(U8 Port, U8 PinNum, GPIO_CFG cfg, U8 Level)
//   28 {
GPIO_Init:
        PUSH     {R4-R8,LR}
        MOVS     R7,R0
        MOVS     R4,R1
        MOV      R8,R2
        MOVS     R6,R3
//   29     //将GPIO端口号转换成端口寄存器组指针
//   30     GPIO_MemMapPtr pt = GPIO_get_pt_addr(Port);
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       GPIO_get_pt_addr
        MOVS     R5,R0
//   31     PORT_MemMapPtr p  = GPIO_get_port_addr(Port);
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       GPIO_get_port_addr
//   32     
//   33     if (!p||!pt) 
        CMP      R0,#+0
        BEQ.N    ??GPIO_Init_0
        CMP      R5,#+0
        BNE.N    ??GPIO_Init_1
//   34     {
//   35         return FALSE;  //参数错误
??GPIO_Init_0:
        MOVS     R0,#+0
        B.N      ??GPIO_Init_2
//   36     }
//   37      
//   38     //设定通用端口引脚控制寄存器的值，设定为GPIO功能
//   39     PORT_PCR_REG(p, PinNum) = (0|PORT_PCR_MUX(1)|cfg);
??GPIO_Init_1:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ORRS     R1,R8,#0x100
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STR      R1,[R0, R4, LSL #+2]
//   40 
//   41     //端口方向控制输入还是输出
//   42     if(((cfg&0x01) == GPI)||(cfg == GPI_UP)|| (cfg == GPI_UP_PF))
        LSLS     R0,R8,#+31
        BPL.N    ??GPIO_Init_3
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+3
        BEQ.N    ??GPIO_Init_3
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+19
        BNE.N    ??GPIO_Init_4
//   43     //   最低位为0则输入   ||   输入上拉模式  ||   输入上拉，带无源滤波器
//   44     {
//   45         GPIO_PDDR_REG(pt) &= ~(1<< PinNum);         //设置端口方向为输入
??GPIO_Init_3:
        LDR      R0,[R5, #+20]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        BICS     R0,R0,R1
        STR      R0,[R5, #+20]
        B.N      ??GPIO_Init_5
//   46     }
//   47     else
//   48     {
//   49         GPIO_PDDR_REG(pt) |= (1<<PinNum);           //设置端口方向为输出
??GPIO_Init_4:
        LDR      R0,[R5, #+20]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        ORRS     R0,R1,R0
        STR      R0,[R5, #+20]
//   50         
//   51         if(LVL_H == Level)                          //output
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??GPIO_Init_6
//   52         {
//   53             BIT_SET(PinNum, GPIO_PDOR_REG(pt));     //对端口输出控制，输出为1
        LDR      R0,[R5, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        ORRS     R0,R1,R0
        STR      R0,[R5, #+0]
        B.N      ??GPIO_Init_5
//   54         }
//   55         else
//   56         {
//   57             BIT_CLR(PinNum, GPIO_PDOR_REG(pt));     //对端口输出控制，输出为0
??GPIO_Init_6:
        LDR      R0,[R5, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        BICS     R0,R0,R1
        STR      R0,[R5, #+0]
//   58         }
//   59     }
//   60 
//   61     return TRUE;  //成功返回
??GPIO_Init_5:
        MOVS     R0,#+1
??GPIO_Init_2:
        POP      {R4-R8,PC}       ;; return
//   62 }
//   63 
//   64 /***FUNC+*********************************************************************/
//   65 /* Name   : GPIO_SetBit                                                      */
//   66 /* Descrp : Set Prot pin high or low level                                   */
//   67 /* Input  : port -- select PORT A/B/C/D/E                                    */
//   68 /*          PinNum -- set pin number                                         */
//   69 /*          Level -- state high or low                                       */
//   70 /* Output : None.                                                            */
//   71 /* Return : Prot  high or low level                                          */   
//   72 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   73 void GPIO_SetBit(U8 Port, U8 PinNum, U8 Level)
//   74 {
GPIO_SetBit:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
        MOVS     R5,R2
//   75     //将GPIO端口号转换成端口寄存器组指针
//   76     GPIO_MemMapPtr pt = GPIO_get_pt_addr(Port);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       GPIO_get_pt_addr
//   77         
//   78     if (Level == 0) //控制为低电平
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??GPIO_SetBit_0
//   79     {
//   80         BIT_CLR(PinNum, GPIO_PDOR_REG(pt));
        LDR      R1,[R0, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R4
        BICS     R1,R1,R2
        STR      R1,[R0, #+0]
        B.N      ??GPIO_SetBit_1
//   81     }
//   82     else 
//   83     {
//   84         //控制为高电平
//   85         BIT_SET(PinNum, GPIO_PDOR_REG(pt));
??GPIO_SetBit_0:
        LDR      R1,[R0, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R4
        ORRS     R1,R2,R1
        STR      R1,[R0, #+0]
//   86     }
//   87 }
??GPIO_SetBit_1:
        POP      {R0,R4,R5,PC}    ;; return
//   88 
//   89 /***FUNC+*********************************************************************/
//   90 /* Name   : Gpio_GetBit                                                      */
//   91 /* Descrp : get Prot Pin number high or low level                            */
//   92 /* Input  : port -- select PORT A/B/C/D/E                                    */
//   93 /*          PinNum -- select pin 0～31                                       */
//   94 /* Output : None.                                                            */
//   95 /* Return : Prot Pin number high or low level                                */   
//   96 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   97 U8 GPIO_GetBit(U8 Port, U8 PinNum)
//   98 {
GPIO_GetBit:
        PUSH     {R4,LR}
        MOVS     R4,R1
//   99     U8 i; 
//  100     //将GPIO端口号转换成端口寄存器组指针
//  101     GPIO_MemMapPtr pt = GPIO_get_pt_addr(Port);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       GPIO_get_pt_addr
//  102     //查看引脚状态
//  103     i = BIT_GET(PinNum, GPIO_PDIR_REG(pt));
        LDR      R0,[R0, #+16]
        LSRS     R0,R0,R4
        ANDS     R0,R0,#0x1
//  104     return i;     //返回引脚状态（0或1）
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//  105 }
//  106 
//  107 /***FUNC+*********************************************************************/
//  108 /* Name   : Gpio_get_port_addr                                               */
//  109 /* Descrp : get Prot PTR.                                                    */
//  110 /* Input  : port -- select PORT A/B/C/D/E                                    */ 
//  111 /* Output : None.                                                            */
//  112 /* Return : PORT A/B/C/D/E Ptr.                                              */   
//  113 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  114 static PORT_MemMapPtr GPIO_get_port_addr (U8 port)
//  115 {
//  116     PORT_MemMapPtr p;
//  117     
//  118     switch(port)
GPIO_get_port_addr:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??GPIO_get_port_addr_0
        CMP      R0,#+2
        BEQ.N    ??GPIO_get_port_addr_1
        BCC.N    ??GPIO_get_port_addr_2
        CMP      R0,#+4
        BEQ.N    ??GPIO_get_port_addr_3
        BCC.N    ??GPIO_get_port_addr_4
        B.N      ??GPIO_get_port_addr_5
//  119     {
//  120     case PORT_A:
//  121         p = PORTA_BASE_PTR;
??GPIO_get_port_addr_0:
        LDR.N    R0,??DataTable1  ;; 0x40049000
//  122         break;
//  123     case PORT_B:
//  124         p = PORTB_BASE_PTR;
//  125         break;
//  126     case PORT_C:
//  127         p = PORTC_BASE_PTR;
//  128         break;
//  129     case PORT_D:
//  130         p = PORTD_BASE_PTR;
//  131         break;
//  132     case PORT_E:
//  133         p = PORTE_BASE_PTR;
//  134         break;
//  135     default:
//  136         return 0; //输入参数无效返回
//  137     }
//  138     
//  139     return p;
??GPIO_get_port_addr_6:
??GPIO_get_port_addr_7:
        BX       LR               ;; return
??GPIO_get_port_addr_2:
        LDR.N    R0,??DataTable1_1  ;; 0x4004a000
        B.N      ??GPIO_get_port_addr_6
??GPIO_get_port_addr_1:
        LDR.N    R0,??DataTable1_2  ;; 0x4004b000
        B.N      ??GPIO_get_port_addr_6
??GPIO_get_port_addr_4:
        LDR.N    R0,??DataTable1_3  ;; 0x4004c000
        B.N      ??GPIO_get_port_addr_6
??GPIO_get_port_addr_3:
        LDR.N    R0,??DataTable1_4  ;; 0x4004d000
        B.N      ??GPIO_get_port_addr_6
??GPIO_get_port_addr_5:
        MOVS     R0,#+0
        B.N      ??GPIO_get_port_addr_7
//  140 }
//  141 
//  142 /***FUNC+*********************************************************************/
//  143 /* Name   : Gpio_get_pt_addr                                                 */
//  144 /* Descrp : get Prot PTR.                                                    */
//  145 /* Input  : port -- select PORT A/B/C/D/E                                    */ 
//  146 /* Output : None.                                                            */
//  147 /* Return : PORT A/B/C/D/E Ptr.                                              */   
//  148 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  149 static GPIO_MemMapPtr GPIO_get_pt_addr(U8 port)
//  150 {
//  151     GPIO_MemMapPtr p;
//  152     
//  153     switch(port)
GPIO_get_pt_addr:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??GPIO_get_pt_addr_0
        CMP      R0,#+2
        BEQ.N    ??GPIO_get_pt_addr_1
        BCC.N    ??GPIO_get_pt_addr_2
        CMP      R0,#+4
        BEQ.N    ??GPIO_get_pt_addr_3
        BCC.N    ??GPIO_get_pt_addr_4
        B.N      ??GPIO_get_pt_addr_5
//  154     {
//  155     case PORT_A:
//  156         p = PTA_BASE_PTR;
??GPIO_get_pt_addr_0:
        LDR.N    R0,??DataTable1_5  ;; 0x400ff000
//  157         break;
//  158     case PORT_B:
//  159         p = PTB_BASE_PTR;
//  160         break;
//  161     case PORT_C:
//  162         p = PTC_BASE_PTR;
//  163         break;
//  164     case PORT_D:
//  165         p = PTD_BASE_PTR;
//  166         break;
//  167     case PORT_E:
//  168         p = PTE_BASE_PTR;
//  169         break;
//  170     default:
//  171         return 0; //输入参数无效返回
//  172     }
//  173     
//  174     return p;
??GPIO_get_pt_addr_6:
??GPIO_get_pt_addr_7:
        BX       LR               ;; return
??GPIO_get_pt_addr_2:
        LDR.N    R0,??DataTable1_6  ;; 0x400ff040
        B.N      ??GPIO_get_pt_addr_6
??GPIO_get_pt_addr_1:
        LDR.N    R0,??DataTable1_7  ;; 0x400ff080
        B.N      ??GPIO_get_pt_addr_6
??GPIO_get_pt_addr_4:
        LDR.N    R0,??DataTable1_8  ;; 0x400ff0c0
        B.N      ??GPIO_get_pt_addr_6
??GPIO_get_pt_addr_3:
        LDR.N    R0,??DataTable1_9  ;; 0x400ff100
        B.N      ??GPIO_get_pt_addr_6
??GPIO_get_pt_addr_5:
        MOVS     R0,#+0
        B.N      ??GPIO_get_pt_addr_7
//  175 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40049000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0x400ff100
//  176 
//  177 
//  178   
//  179 /******************翻转电平************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  180 void gpio_reverse (GPIO_MemMapPtr port, int index)
//  181 {
//  182     GPIO_PDOR_REG(port) ^= (1<<index);
gpio_reverse:
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        EORS     R1,R1,R2
        STR      R1,[R0, #+0]
//  183 }
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  184   
//  185   
//  186 //#ifdef  __cplusplus
//  187 //}
//  188 //#endif
// 
//  40 bytes in section .data
// 344 bytes in section .text
// 
// 344 bytes of CODE memory
//  40 bytes of DATA memory
//
//Errors: none
//Warnings: none
