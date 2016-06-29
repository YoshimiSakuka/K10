///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:39
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\_printf.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\_printf.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\_printf.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN atoi
        EXTERN disable_irq
        EXTERN enable_irq
        EXTERN isalpha
        EXTERN isupper
        EXTERN strlen
        EXTERN vsprintf

        PUBLIC Delay
        PUBLIC UART_Init
        PUBLIC Uart_GetIntNum
        PUBLIC Uart_GetString
        PUBLIC Uart_Getch
        PUBLIC Uart_Printf
        PUBLIC Uart_SendByte
        PUBLIC Uart_SendByte_4
        PUBLIC Uart_SendString
        PUBLIC uart_irq_DIS
        PUBLIC uart_irq_EN

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\_printf.c
//    1 //*******************************************************************************************
//    2 //  MK60DN512ZVL(K/L/Q)10 Demo - _printf, Ultra-Low Pwr UART 115200 Echo ISR, 50MHz ACLK
//    3 //
//    4 //           MK60DN512ZVL(K/L/Q)10
//    5 //            -----------------
//    6 //        /|\|              XIN|-
//    7 //         | |                 | 50MHz
//    8 //         --|RST          XOUT|-
//    9 //           |                 |
//   10 //           |                 |
//   11 //           |           PTC14 |---->TXD 
//   12 //           |           PTC15 |<----RXD
//   13 //           |                 |
//   14 //           |                 |
//   15 //           |                 |
//   16 //           |                 | 
//   17 //           |                 |
//   18 //           |                 |
//   19 //           |                 |
//   20 //           |                 |
//   21 //
//   22 //  Copyright (c) 2012.04  WH, All Rights Reserved.
//   23 //  WebSite     : http://un-el.taobao.com/
//   24 //  QQ群        : 226846867 (Kinetis ARM)
//   25 //  Email       : dragonhzw@163.com
//   26 //  Description : The _printf module
//   27 //  History     :                                                           
//   28 //     [Author]   [Date]      [Version]    [Description]                     
//   29 //     [1] dragonhzw   2012/04/09  Ver 1.0.0    Initial file.
//   30 //
//   31 //  Built with IAR Embedded Workbench for ARM 6.30  
//   32 //***********************************************************************************************
//   33 //#include "..\K60_datatype.h"
//   34 
//   35 #include "_printf.h"
//   36 //#ifdef  __cplusplus
//   37 //extern "C" {
//   38 //#endif
//   39 
//   40   
//   41 /***FUNC+*********************************************************************/
//   42 /* Name   : Init_UART1                                                       */
//   43 /* Descrp : init Uart1 port.                                                 */
//   44 /* Input  : None.                                                            */   
//   45 /* Output : None.                                                            */
//   46 /* Return : None.                                                            */   
//   47 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   48 void UART_Init(U32 SystemClock, U32 BaudRate, U8 UARTChannel)
//   49 {
UART_Init:
        PUSH     {R4,R5}
//   50   register U16 ubd, brfa;
//   51   
//   52   UART_MemMapPtr Channel;
//   53   
//   54   U8 temp;
//   55     
//   56   switch (UARTChannel)
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??UART_Init_0
        CMP      R2,#+2
        BEQ.N    ??UART_Init_1
        BCC.N    ??UART_Init_2
        CMP      R2,#+4
        BEQ.N    ??UART_Init_3
        BCC.N    ??UART_Init_4
        CMP      R2,#+5
        BEQ.N    ??UART_Init_5
        B.N      ??UART_Init_6
//   57   {
//   58     case UART0:
//   59         /* Enable the UART0_TXD function on PTD6 */
//   60         PORTD_PCR6 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
??UART_Init_0:
        MOV      R3,#+768
        LDR.W    R4,??DataTable5  ;; 0x4004c018
        STR      R3,[R4, #+0]
//   61         /* Enable the UART0_RXD function on PTD7 */
//   62         PORTD_PCR7 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        MOV      R3,#+768
        LDR.W    R4,??DataTable5_1  ;; 0x4004c01c
        STR      R3,[R4, #+0]
//   63 
//   64         SIM_SCGC4 |= SIM_SCGC4_UART0_MASK;
        LDR.W    R3,??DataTable5_2  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x400
        LDR.W    R4,??DataTable5_2  ;; 0x40048034
        STR      R3,[R4, #+0]
//   65         Channel = UART_0;
        LDR.W    R3,??DataTable5_3  ;; 0x4006a000
//   66       break;
        B.N      ??UART_Init_7
//   67       
//   68     case UART1:
//   69         /* Enable the UART1_TXD function on PTC4 */
//   70         PORTC_PCR4 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
??UART_Init_2:
        MOV      R3,#+768
        LDR.W    R4,??DataTable5_4  ;; 0x4004b010
        STR      R3,[R4, #+0]
//   71         /* Enable the UART1_RXD function on PTC3 */
//   72         PORTC_PCR3 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        MOV      R3,#+768
        LDR.W    R4,??DataTable5_5  ;; 0x4004b00c
        STR      R3,[R4, #+0]
//   73 
//   74         SIM_SCGC4 |= SIM_SCGC4_UART1_MASK;
        LDR.N    R3,??DataTable5_2  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.N    R4,??DataTable5_2  ;; 0x40048034
        STR      R3,[R4, #+0]
//   75         Channel = UART_1;
        LDR.N    R3,??DataTable5_6  ;; 0x4006b000
//   76       break;
        B.N      ??UART_Init_7
//   77       
//   78     case UART2:
//   79         /* Enable the UART2_TXD function on PTD3 */
//   80         PORTD_PCR3 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
??UART_Init_1:
        MOV      R3,#+768
        LDR.N    R4,??DataTable5_7  ;; 0x4004c00c
        STR      R3,[R4, #+0]
//   81         /* Enable the UART2_RXD function on PTD2 */
//   82         PORTD_PCR2 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        MOV      R3,#+768
        LDR.N    R4,??DataTable5_8  ;; 0x4004c008
        STR      R3,[R4, #+0]
//   83 
//   84         SIM_SCGC4 |= SIM_SCGC4_UART2_MASK;      
        LDR.N    R3,??DataTable5_2  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1000
        LDR.N    R4,??DataTable5_2  ;; 0x40048034
        STR      R3,[R4, #+0]
//   85         Channel = UART_2;
        LDR.N    R3,??DataTable5_9  ;; 0x4006c000
//   86       break;
        B.N      ??UART_Init_7
//   87       
//   88     case UART3:    
//   89         /* Enable the UART3_TXD function on PTC17 */
//   90         PORTC_PCR17 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
??UART_Init_4:
        MOV      R3,#+768
        LDR.N    R4,??DataTable5_10  ;; 0x4004b044
        STR      R3,[R4, #+0]
//   91         /* Enable the UART3_RXD function on PTC16 */
//   92         PORTC_PCR16 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        MOV      R3,#+768
        LDR.N    R4,??DataTable5_11  ;; 0x4004b040
        STR      R3,[R4, #+0]
//   93 
//   94         SIM_SCGC4 |= SIM_SCGC4_UART3_MASK;
        LDR.N    R3,??DataTable5_2  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x2000
        LDR.N    R4,??DataTable5_2  ;; 0x40048034
        STR      R3,[R4, #+0]
//   95         
//   96         Channel = UART_3;
        LDR.N    R3,??DataTable5_12  ;; 0x4006d000
//   97       break;
        B.N      ??UART_Init_7
//   98       
//   99     case UART4:
//  100         /* Enable the UART3_TXD function on PTC17 */
//  101         //PORTC_PCR15 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
//  102         PORTE_PCR24 = PORT_PCR_MUX(0x3);    //tx
??UART_Init_3:
        MOV      R3,#+768
        LDR.N    R4,??DataTable5_13  ;; 0x4004d060
        STR      R3,[R4, #+0]
//  103         /* Enable the UART3_RXD function on PTC16 */
//  104         //PORTC_PCR14 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
//  105         PORTE_PCR25 = PORT_PCR_MUX(0x3);    //rx
        MOV      R3,#+768
        LDR.N    R4,??DataTable5_14  ;; 0x4004d064
        STR      R3,[R4, #+0]
//  106         SIM_SCGC1 |= SIM_SCGC1_UART4_MASK;      
        LDR.N    R3,??DataTable5_15  ;; 0x40048028
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x400
        LDR.N    R4,??DataTable5_15  ;; 0x40048028
        STR      R3,[R4, #+0]
//  107         Channel = UART_4;
        LDR.N    R3,??DataTable5_16  ;; 0x400ea000
//  108       break;
        B.N      ??UART_Init_7
//  109       
//  110     case UART5:
//  111         /* Enable the UART3_TXD function on PTC17 */
//  112         PORTE_PCR8 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
??UART_Init_5:
        MOV      R3,#+768
        LDR.N    R4,??DataTable5_17  ;; 0x4004d020
        STR      R3,[R4, #+0]
//  113         /* Enable the UART3_RXD function on PTC16 */
//  114         PORTE_PCR9 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        MOV      R3,#+768
        LDR.N    R4,??DataTable5_18  ;; 0x4004d024
        STR      R3,[R4, #+0]
//  115 
//  116         SIM_SCGC1 |= SIM_SCGC1_UART5_MASK;      
        LDR.N    R3,??DataTable5_15  ;; 0x40048028
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.N    R4,??DataTable5_15  ;; 0x40048028
        STR      R3,[R4, #+0]
//  117 
//  118         Channel = UART_5;
        LDR.N    R3,??DataTable5_19  ;; 0x400eb000
//  119       break;
        B.N      ??UART_Init_7
//  120       
//  121     default: 
//  122       break;
//  123   }  
//  124 
//  125   /* Make sure that the transmitter and receiver are disabled while we
//  126   * change settings.
//  127   */
//  128   UART_C2_REG(Channel) &= ~(UART_C2_TE_MASK | UART_C2_RE_MASK );        //禁止发送接收
??UART_Init_6:
??UART_Init_7:
        LDRB     R4,[R3, #+3]
        ANDS     R4,R4,#0xF3
        STRB     R4,[R3, #+3]
//  129 
//  130   /* Configure the UART for 8-bit mode, no parity */
//  131   /* We need all default settings, so entire register is cleared */
//  132   UART_C1_REG(Channel) = 0;
        MOVS     R4,#+0
        STRB     R4,[R3, #+2]
//  133   if((UART0 == UARTChannel) ||(UART1 == UARTChannel))        //串口01 使用内核时钟 是其他外设时钟的2倍
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??UART_Init_8
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??UART_Init_9
//  134   {
//  135     SystemClock +=SystemClock;
??UART_Init_8:
        ADDS     R0,R0,R0
//  136   }
//  137   /* Calculate baud settings */
//  138   ubd = (U32)((SystemClock)/(BaudRate * 16));   // SBR+BRFA BRFA滤掉
??UART_Init_9:
        LSLS     R2,R1,#+4
        UDIV     R2,R0,R2
//  139 
//  140   /* Save off the current value of the UARTx_BDH except for the SBR */
//  141   temp = UART_BDH_REG(Channel) & ~(UART_BDH_SBR(0x1F));      //保存其他位的值
        LDRB     R4,[R3, #+0]
        ANDS     R4,R4,#0xE0
//  142   UART_BDH_REG(Channel) = temp | UART_BDH_SBR(((ubd & 0x1F00) >> 8));   //设置BDH
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R5,R2,#+8
        ANDS     R5,R5,#0x1F
        ORRS     R4,R5,R4
        STRB     R4,[R3, #+0]
//  143   UART_BDL_REG(Channel) = (U8)(ubd & UART_BDL_SBR_MASK);    //设置BDL
        STRB     R2,[R3, #+1]
//  144 
//  145   /* Determine if a fractional divider is needed to get closer to the baud rate */
//  146   brfa = (((SystemClock*32)/(BaudRate * 16)) - (ubd * 32)); //计算BRFA  精度1/32
        LSLS     R0,R0,#+5
        LSLS     R1,R1,#+4
        UDIV     R0,R0,R1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        SUBS     R0,R0,R2, LSL #+5
//  147 
//  148   /* Save off the current value of the UARTx_C4 register except for the BRFA */
//  149   temp = UART_C4_REG(Channel) & ~(UART_C4_BRFA(0x1F));  //保存高3位
        LDRB     R1,[R3, #+10]
        ANDS     R4,R1,#0xE0
//  150   UART_C4_REG(Channel) = temp | UART_C4_BRFA(brfa); //设置BRFA
        ANDS     R0,R0,#0x1F
        ORRS     R0,R0,R4
        STRB     R0,[R3, #+10]
//  151   
//  152   /* Enable receiver and transmitter */
//  153   UART_C2_REG(Channel) |= (UART_C2_TE_MASK | UART_C2_RE_MASK);   //使能发送接收
        LDRB     R0,[R3, #+3]
        ORRS     R0,R0,#0xC
        STRB     R0,[R3, #+3]
//  154 
//  155   return;
        POP      {R4,R5}
        BX       LR               ;; return
//  156 }
//  157 /***FUNC+*********************************************************************/
//  158 /* Name   : Uart_Printf                                                      */
//  159 /* Descrp : 处理来自串口的发送中断                                           */
//  160 /* Input  : None.                                                            */   
//  161 /* Output : None.                                                            */
//  162 /* Return : None.                                                            */   
//  163 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  164 void Uart_Printf(const char *fmt,...)
//  165 {
Uart_Printf:
        PUSH     {R1-R3}
        PUSH     {LR}
        SUB      SP,SP,#+256
//  166     va_list ap;
//  167     char string[256];
//  168 
//  169     va_start(ap,fmt);
        ADD      R2,SP,#+260
//  170     vsprintf(string,fmt,ap);
        MOVS     R1,R0
        ADD      R0,SP,#+0
        BL       vsprintf
//  171     Uart_SendString(string);
        ADD      R0,SP,#+0
        BL       Uart_SendString
//  172     va_end(ap);
//  173     return;
        ADD      SP,SP,#+256
        LDR      PC,[SP], #+16    ;; return
//  174 }
//  175 /***FUNC+*********************************************************************/
//  176 /* Name   : Uart_SendString                                                  */
//  177 /* Descrp : 发送字符串                                                       */
//  178 /* Input  : None.                                                            */   
//  179 /* Output : None.                                                            */
//  180 /* Return : None.                                                            */   
//  181 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  182 void Uart_SendString(char *pt)
//  183 {
Uart_SendString:
        PUSH     {R4,LR}
        MOVS     R4,R0
        B.N      ??Uart_SendString_0
//  184     while(*pt)
//  185     {
//  186         Uart_SendByte(UART4,*pt++);
??Uart_SendString_1:
        LDRB     R1,[R4, #+0]
        MOVS     R0,#+4
        BL       Uart_SendByte
        ADDS     R4,R4,#+1
//  187     }
??Uart_SendString_0:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??Uart_SendString_1
//  188     return;
        POP      {R4,PC}          ;; return
//  189 }
//  190 /***FUNC+*********************************************************************/
//  191 /* Name   : Uart_SendByte                                                    */
//  192 /* Descrp : 发送数据到串口的发送中断                                         */
//  193 /* Input  : None.                                                            */   
//  194 /* Output : None.                                                            */
//  195 /* Return : None.                                                            */   
//  196 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  197 void Uart_SendByte(U8 UARTChannel, U8 Char)
//  198 {
//  199     UART_MemMapPtr Channel;
//  200   
//  201     switch (UARTChannel)
Uart_SendByte:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??Uart_SendByte_0
        CMP      R0,#+2
        BEQ.N    ??Uart_SendByte_1
        BCC.N    ??Uart_SendByte_2
        CMP      R0,#+4
        BEQ.N    ??Uart_SendByte_3
        BCC.N    ??Uart_SendByte_4
        CMP      R0,#+5
        BEQ.N    ??Uart_SendByte_5
        B.N      ??Uart_SendByte_6
//  202     {
//  203         case UART0:
//  204             Channel = UART_0;
??Uart_SendByte_0:
        LDR.N    R2,??DataTable5_3  ;; 0x4006a000
//  205             break;
        B.N      ??Uart_SendByte_7
//  206         case UART1:
//  207             Channel = UART_1;
??Uart_SendByte_2:
        LDR.N    R2,??DataTable5_6  ;; 0x4006b000
//  208             break;
        B.N      ??Uart_SendByte_7
//  209         case UART2:
//  210             Channel = UART_2;
??Uart_SendByte_1:
        LDR.N    R2,??DataTable5_9  ;; 0x4006c000
//  211             break;
        B.N      ??Uart_SendByte_7
//  212         case UART3:
//  213             Channel = UART_3;
??Uart_SendByte_4:
        LDR.N    R2,??DataTable5_12  ;; 0x4006d000
//  214             break;
        B.N      ??Uart_SendByte_7
//  215         case UART4:
//  216             Channel = UART_4;
??Uart_SendByte_3:
        LDR.N    R2,??DataTable5_16  ;; 0x400ea000
//  217             break;
        B.N      ??Uart_SendByte_7
//  218         case UART5:
//  219             Channel = UART_5;
??Uart_SendByte_5:
        LDR.N    R2,??DataTable5_19  ;; 0x400eb000
//  220             break;
        B.N      ??Uart_SendByte_7
//  221         default: 
//  222             break;
//  223     }  
//  224     
//  225     /* Wait until space is available in the FIFO */
//  226     while(!(UART_S1_REG(Channel) & UART_S1_TDRE_MASK))
??Uart_SendByte_6:
??Uart_SendByte_7:
        LDRB     R0,[R2, #+4]
        LSLS     R0,R0,#+24
        BPL.N    ??Uart_SendByte_7
//  227     {
//  228 
//  229     }
//  230     /* Send the character */
//  231     UART_D_REG(Channel) = (S8)Char;
        STRB     R1,[R2, #+7]
//  232 
//  233     return;
        BX       LR               ;; return
//  234 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  235 void Uart_SendByte_4(unsigned char data)     //最简程序
//  236 {
//  237     while(!(UART_S1_REG(UART4_BASE_PTR) & UART_S1_TDRE_MASK))
Uart_SendByte_4:
??Uart_SendByte_4_0:
        LDR.N    R1,??DataTable5_20  ;; 0x400ea004
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+24
        BPL.N    ??Uart_SendByte_4_0
//  238     {
//  239 
//  240     }
//  241     /* Send the character */
//  242     UART_D_REG(UART4_BASE_PTR) = (S8)data;
        LDR.N    R1,??DataTable5_21  ;; 0x400ea007
        STRB     R0,[R1, #+0]
//  243 }
        BX       LR               ;; return
//  244 /***FUNC+*********************************************************************/
//  245 /* Name   : Uart_GetString                                                   */
//  246 /* Descrp : 获取字符串                                                       */
//  247 /* Input  : None.                                                            */   
//  248 /* Output : None.                                                            */
//  249 /* Return : None.                                                            */   
//  250 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  251 void Uart_GetString(char *string)
//  252 {
Uart_GetString:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  253     char *string2 = string;
        MOVS     R5,R4
        B.N      ??Uart_GetString_0
//  254     char c;
//  255     while((c = Uart_Getch(UART4))!='\r')
//  256     {
//  257         if(c=='\b')
//  258         {
//  259             if( (int)string2 < (int)string )
//  260             {
//  261                 //Uart_Printf("\b \b");
//  262                 string--;
//  263             }
//  264         }
//  265         else 
//  266         {
//  267             *string++ = c;
??Uart_GetString_1:
        STRB     R0,[R4, #+0]
        ADDS     R4,R4,#+1
//  268             //Uart_SendByte(UART4,c);
//  269         }
??Uart_GetString_0:
        MOVS     R0,#+4
        BL       Uart_Getch
        MOVS     R1,R0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+13
        BEQ.N    ??Uart_GetString_2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+8
        BNE.N    ??Uart_GetString_1
        CMP      R5,R4
        BGE.N    ??Uart_GetString_0
        SUBS     R4,R4,#+1
        B.N      ??Uart_GetString_0
//  270     }
//  271     *string='\0';
??Uart_GetString_2:
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
//  272     //Uart_SendByte(UART4,'\n');
//  273     return;
        POP      {R0,R4,R5,PC}    ;; return
//  274 }
//  275 /***FUNC+*********************************************************************/
//  276 /* Name   : Uart_GetIntNum                                                   */
//  277 /* Descrp : 获取数据                                                         */
//  278 /* Input  : None.                                                            */   
//  279 /* Output : None.                                                            */
//  280 /* Return : None.                                                            */   
//  281 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  282 SHORT Uart_GetIntNum(void)
//  283 {
Uart_GetIntNum:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+32
//  284     char str[30];
//  285     char *string = str;
        ADD      R6,SP,#+0
//  286     unsigned short base     = 10;
        MOVS     R7,#+10
//  287     unsigned short minus    = 0;
        MOVS     R5,#+0
//  288     short result   = 0;
        MOVS     R4,#+0
//  289     short lastIndex;    
//  290     unsigned short i;
//  291     
//  292     Uart_GetString(string);
        MOVS     R0,R6
        BL       Uart_GetString
//  293     
//  294     if(string[0]=='-')
        LDRB     R0,[R6, #+0]
        CMP      R0,#+45
        BNE.N    ??Uart_GetIntNum_0
//  295     {
//  296         minus = 1;
        MOVS     R5,#+1
//  297         string++;
        ADDS     R6,R6,#+1
//  298     }
//  299     
//  300     if(string[0]=='0' && (string[1]=='x' || string[1]=='X'))
??Uart_GetIntNum_0:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+48
        BNE.N    ??Uart_GetIntNum_1
        LDRB     R0,[R6, #+1]
        CMP      R0,#+120
        BEQ.N    ??Uart_GetIntNum_2
        LDRB     R0,[R6, #+1]
        CMP      R0,#+88
        BNE.N    ??Uart_GetIntNum_1
//  301     {
//  302         base    = 16;
??Uart_GetIntNum_2:
        MOVS     R7,#+16
//  303         string += 2;
        ADDS     R6,R6,#+2
//  304     }
//  305     
//  306     lastIndex = strlen(string) - 1;
??Uart_GetIntNum_1:
        MOVS     R0,R6
        BL       strlen
        SUBS     R8,R0,#+1
//  307     
//  308     if(lastIndex<0)
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BPL.N    ??Uart_GetIntNum_3
//  309         return -1;
        MOVS     R0,#-1
        B.N      ??Uart_GetIntNum_4
//  310     
//  311     if(string[lastIndex]=='h' || string[lastIndex]=='H' )
??Uart_GetIntNum_3:
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        LDRB     R0,[R8, R6]
        CMP      R0,#+104
        BEQ.N    ??Uart_GetIntNum_5
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        LDRB     R0,[R8, R6]
        CMP      R0,#+72
        BNE.N    ??Uart_GetIntNum_6
//  312     {
//  313         base = 16;
??Uart_GetIntNum_5:
        MOVS     R7,#+16
//  314         string[lastIndex] = 0;
        MOVS     R0,#+0
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        STRB     R0,[R8, R6]
//  315         lastIndex--;
        SUBS     R8,R8,#+1
//  316     }
//  317 
//  318     if(base==10)
??Uart_GetIntNum_6:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+10
        BNE.N    ??Uart_GetIntNum_7
//  319     {
//  320         result = atoi(string);
        MOVS     R0,R6
        BL       atoi
        MOVS     R4,R0
//  321         result = minus ? (-1*result):result;
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??Uart_GetIntNum_8
        MOVS     R0,#-1
        SMULBB   R4,R4,R0
        B.N      ??Uart_GetIntNum_9
??Uart_GetIntNum_8:
        B.N      ??Uart_GetIntNum_9
//  322     }
//  323     else
//  324     {
//  325         for(i=0;i<=lastIndex;i++)
??Uart_GetIntNum_7:
        MOVS     R7,#+0
        B.N      ??Uart_GetIntNum_10
//  326         {
//  327             if(isalpha(string[i]))
//  328             {
//  329                 if(isupper(string[i]))
//  330                     result = (result<<4) + string[i] - 'A' + 10;
//  331                 else
//  332                     result = (result<<4) + string[i] - 'a' + 10;
//  333             }
//  334             else
//  335                 result = (result<<4) + string[i] - '0';
??Uart_GetIntNum_11:
        LSLS     R0,R4,#+4
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRB     R1,[R7, R6]
        ADDS     R0,R0,R1
        SUBS     R4,R0,#+48
??Uart_GetIntNum_12:
        ADDS     R7,R7,#+1
??Uart_GetIntNum_10:
        SXTH     R8,R8            ;; SignExt  R8,R8,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R8,R7
        BLT.N    ??Uart_GetIntNum_13
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRB     R0,[R7, R6]
        BL       isalpha
        CMP      R0,#+0
        BEQ.N    ??Uart_GetIntNum_11
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRB     R0,[R7, R6]
        BL       isupper
        CMP      R0,#+0
        BEQ.N    ??Uart_GetIntNum_14
        LSLS     R0,R4,#+4
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRB     R1,[R7, R6]
        ADDS     R0,R0,R1
        SUBS     R4,R0,#+55
        B.N      ??Uart_GetIntNum_12
??Uart_GetIntNum_14:
        LSLS     R0,R4,#+4
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRB     R1,[R7, R6]
        ADDS     R0,R0,R1
        SUBS     R4,R0,#+87
        B.N      ??Uart_GetIntNum_12
//  336         }
//  337         result = minus ? (-1*result):result;
??Uart_GetIntNum_13:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??Uart_GetIntNum_15
        MOVS     R0,#-1
        SMULBB   R4,R4,R0
        B.N      ??Uart_GetIntNum_9
//  338     }
//  339     return result;
??Uart_GetIntNum_15:
??Uart_GetIntNum_9:
        MOVS     R0,R4
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
??Uart_GetIntNum_4:
        ADD      SP,SP,#+32
        POP      {R4-R8,PC}       ;; return
//  340 }
//  341 /***FUNC+*********************************************************************/
//  342 /* Name   : Uart_Getch                                                       */
//  343 /* Descrp : 接收串口数据                                                     */
//  344 /* Input  : None.                                                            */   
//  345 /* Output : None.                                                            */
//  346 /* Return : None.                                                            */   
//  347 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  348 CHAR Uart_Getch(U8 UARTChannel)
//  349 {
//  350     UART_MemMapPtr Channel;
//  351   
//  352     switch (UARTChannel)
Uart_Getch:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??Uart_Getch_0
        CMP      R0,#+2
        BEQ.N    ??Uart_Getch_1
        BCC.N    ??Uart_Getch_2
        CMP      R0,#+4
        BEQ.N    ??Uart_Getch_3
        BCC.N    ??Uart_Getch_4
        CMP      R0,#+5
        BEQ.N    ??Uart_Getch_5
        B.N      ??Uart_Getch_6
//  353     {
//  354         case UART0:
//  355             Channel = UART_0;
??Uart_Getch_0:
        LDR.N    R1,??DataTable5_3  ;; 0x4006a000
//  356             break;
        B.N      ??Uart_Getch_7
//  357         case UART1:
//  358             Channel = UART_1;
??Uart_Getch_2:
        LDR.N    R1,??DataTable5_6  ;; 0x4006b000
//  359             break;
        B.N      ??Uart_Getch_7
//  360         case UART2:
//  361             Channel = UART_2;
??Uart_Getch_1:
        LDR.N    R1,??DataTable5_9  ;; 0x4006c000
//  362             break;
        B.N      ??Uart_Getch_7
//  363         case UART3:
//  364             Channel = UART_3;
??Uart_Getch_4:
        LDR.N    R1,??DataTable5_12  ;; 0x4006d000
//  365             break;
        B.N      ??Uart_Getch_7
//  366         case UART4:
//  367             Channel = UART_4;
??Uart_Getch_3:
        LDR.N    R1,??DataTable5_16  ;; 0x400ea000
//  368             break;
        B.N      ??Uart_Getch_7
//  369         case UART5:
//  370             Channel = UART_5;
??Uart_Getch_5:
        LDR.N    R1,??DataTable5_19  ;; 0x400eb000
//  371             break;
        B.N      ??Uart_Getch_7
//  372         default: 
//  373             break;
//  374     }  
//  375     /* Wait until character has been received */
//  376     while (!(UART_S1_REG(Channel) & UART_S1_RDRF_MASK));
??Uart_Getch_6:
??Uart_Getch_7:
        LDRB     R0,[R1, #+4]
        LSLS     R0,R0,#+26
        BPL.N    ??Uart_Getch_7
//  377     /* Return the 8-bit data from the receiver */
//  378     return UART_D_REG(Channel);
        LDRB     R0,[R1, #+7]
        BX       LR               ;; return
//  379 }
//  380 /***FUNC+*********************************************************************/
//  381 /* Name   : Delay                                                            */
//  382 /* Descrp : 延时                                                             */
//  383 /* Input  : None.                                                            */   
//  384 /* Output : None.                                                            */
//  385 /* Return : None.                                                            */   
//  386 /***FUNC-*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  387 void Delay(SHORT sTime)
//  388 {
Delay:
        B.N      ??Delay_0
//  389     for(;sTime>0;sTime--)
??Delay_1:
        SUBS     R0,R0,#+1
??Delay_0:
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        CMP      R0,#+1
        BGE.N    ??Delay_1
//  390     {
//  391     }
//  392     return; 
        BX       LR               ;; return
//  393 }
//  394 
//  395 
//  396 /*************************************************************************
//  397 *                             野火嵌入式开发工作室
//  398 *
//  399 *  函数名称：uart_irq_EN
//  400 *  功能说明：开串口接收中断
//  401 *  参数说明：UARTn       模块号（UART0~UART5）
//  402 *  函数返回：无
//  403 *  修改时间：2012-1-20
//  404 *  备    注：
//  405 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  406 void uart_irq_EN(void)
//  407 {
uart_irq_EN:
        PUSH     {R7,LR}
//  408     UART_C2_REG(UART_4) |= UART_C2_RIE_MASK;    //开放UART接收中断
        LDR.N    R0,??DataTable5_22  ;; 0x400ea003
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable5_22  ;; 0x400ea003
        STRB     R0,[R1, #+0]
//  409     enable_irq(53);			        //开接收引脚的IRQ中断
        MOVS     R0,#+53
        BL       enable_irq
//  410 }
        POP      {R0,PC}          ;; return
//  411 
//  412 
//  413 /*************************************************************************
//  414 *                             野火嵌入式开发工作室
//  415 *
//  416 *  函数名称：uart_irq_DIS
//  417 *  功能说明：关串口接收中断
//  418 *  参数说明：UARTn       模块号（UART0~UART5）
//  419 *  函数返回：无
//  420 *  修改时间：2012-1-20
//  421 *  备    注：
//  422 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  423 void uart_irq_DIS(void)
//  424 {
uart_irq_DIS:
        PUSH     {R7,LR}
//  425     UART_C2_REG(UART_4) &= ~UART_C2_RIE_MASK;   //禁止UART接收中断
        LDR.N    R0,??DataTable5_22  ;; 0x400ea003
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xDF
        LDR.N    R1,??DataTable5_22  ;; 0x400ea003
        STRB     R0,[R1, #+0]
//  426     disable_irq(53);			        //关接收引脚的IRQ中断
        MOVS     R0,#+53
        BL       disable_irq
//  427 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x4004c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x4004c01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x4004b010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x4006b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x4004c00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0x4004c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     0x4006c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     0x4004b044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0x4004b040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     0x4004d060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     0x4004d064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     0x40048028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     0x400ea000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     0x4004d020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_18:
        DC32     0x4004d024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_19:
        DC32     0x400eb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_20:
        DC32     0x400ea004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_21:
        DC32     0x400ea007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_22:
        DC32     0x400ea003

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  428 
//  429 
//  430 
//  431 
//  432 //#ifdef  __cplusplus
//  433 //}
//  434 //#endif
// 
// 956 bytes in section .text
// 
// 956 bytes of CODE memory
//
//Errors: none
//Warnings: none
