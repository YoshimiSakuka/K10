///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    13/Mar/2015  12:44:27 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Administrator\Desktop\3.11换结构BLOCK nd       /
//                    black\common\DMA.c                                      /
//    Command line =  "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\common\DMA.c" -D DEBUG -lCN                       /
//                    "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\Debug\List\" -lB "C:\Users\Administrator\Desktop\ /
//                    3.11换结构BLOCK nd  black\Debug\List\" -o               /
//                    "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\Debug\Obj\" --no_cse --no_unroll --no_inline      /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.0\arm\INC\c\DLib_Config_Normal.h" -Ol                 /
//                    --use_c++_inline                                        /
//    List file    =  C:\Users\Administrator\Desktop\3.11换结构BLOCK nd       /
//                    black\Debug\List\DMA.s                                  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME DMA

        #define SHT_PROGBITS 0x1

        EXTERN GPIOx
        EXTERN PORTX
        EXTERN enable_irq

        PUBLIC DMA_PORTx2BUFF_Init
        PUBLIC DMA_count_Init
        PUBLIC DMA_count_get
        PUBLIC DMA_count_reset
        PUBLIC count_init

// C:\Users\Administrator\Desktop\3.11换结构BLOCK nd  black\common\DMA.c
//    1 #include "DMA.h"
//    2 
//    3 
//    4 
//    5 
//    6 //u8 counttempaddr;
//    7 #define COUNTSADDR   0x4004000C  //(&counttempaddr)
//    8 #define COUNTDADDR   0x4004000C  //(&counttempaddr)
//    9 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 u32 count_init[16];         //用来保存16个通道的初始化计数值
count_init:
        DS8 64
//   11 
//   12 
//   13 
//   14 /*************************************************************************
//   15 *                             野火嵌入式开发工作室
//   16 *
//   17 *  函数名称：DMA_PORTx2BUFF_Init
//   18 *  功能说明：DMA初始化，读取端口数据到内存
//   19 *  参数说明：DMA_CHn              通道号（DMA_CH0 ~ DMA_CH15）
//   20 *            SADDR                源地址( (void * )&PTx_BYTEn_IN 或 (void * )&PTx_WORDn_IN   )
//   21 *            DADDR                目的地址
//   22 *            PTxn                 触发端口
//   23 *            DMA_BYTEn            每次DMA传输字节数
//   24 *            count                一个主循环传输字节数
//   25 *            DMA_PORTx2BUFF_cfg   DMA传输配置
//   26 *  函数返回：无
//   27 *  修改时间：2012-2-20
//   28 *  备    注：
//   29 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   30 void DMA_PORTx2BUFF_Init(DMA_CHn CHn, void *SADDR, void *DADDR, U32 ptxn, DMA_BYTEn byten, u32 count, DMA_PORTx2BUFF_cfg cfg)
//   31 {
DMA_PORTx2BUFF_Init:
        PUSH     {R3-R7,LR}
        LDR      R3,[SP, #+24]
        LDR      R5,[SP, #+28]
        LDR      R4,[SP, #+32]
//   32     u8 n, i;
//   33 //    u8 tmp;
//   34 //
//   35 //    ASSERT(                                             //用断言检测 源地址和每次传输字节数是否正确
//   36 //        (   (byten == DMA_BYTE1)                    //传输一个字节
//   37 //            && ( (SADDR >= &PTA_BYTE0_IN) && (SADDR <= ( &PTE_BYTE3_IN )))
//   38 //        )
//   39 //
//   40 //        || (   (byten == DMA_BYTE2)                   //传输两个字节(注意，不能跨端口)
//   41 //               && ( (SADDR >= &PTA_BYTE0_IN)
//   42 //                    && (SADDR <= ( &PTE_WORD1_IN ))
//   43 //                    && (((u32)SADDR & 0x03) != 0x03) )         //保证不跨端口
//   44 //           )
//   45 //
//   46 //        || (   (byten == DMA_BYTE4)                   //传输四个字节
//   47 //               && ((SADDR >= &PTA_BYTE0_IN) && (SADDR <= ( &PTE_BYTE0_IN )))
//   48 //               && (((u32)SADDR & 0x03) == 0x00)           //保证不跨端口
//   49 //           )
//   50 //    );
//   51 
//   52     u8 BYTEs = (byten == DMA_BYTE1 ? 1 : (byten == DMA_BYTE2 ? 2 : (byten == DMA_BYTE4 ? 4 : 16 ) ) ); //计算传输字节数
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BNE.N    ??DMA_PORTx2BUFF_Init_0
        MOVS     R6,#+1
        B.N      ??DMA_PORTx2BUFF_Init_1
??DMA_PORTx2BUFF_Init_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??DMA_PORTx2BUFF_Init_2
        MOVS     R6,#+2
        B.N      ??DMA_PORTx2BUFF_Init_3
??DMA_PORTx2BUFF_Init_2:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??DMA_PORTx2BUFF_Init_4
        MOVS     R6,#+4
        B.N      ??DMA_PORTx2BUFF_Init_5
??DMA_PORTx2BUFF_Init_4:
        MOVS     R6,#+16
//   53 
//   54     /* 开启时钟 */
//   55     SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;                        //打开DMA模块时钟
??DMA_PORTx2BUFF_Init_5:
??DMA_PORTx2BUFF_Init_3:
??DMA_PORTx2BUFF_Init_1:
        LDR.N    R7,??DataTable3  ;; 0x40048040
        LDR      R7,[R7, #+0]
        ORRS     R7,R7,#0x2
        LDR.W    R12,??DataTable3  ;; 0x40048040
        STR      R7,[R12, #+0]
//   56     SIM_SCGC6 |= SIM_SCGC6_DMAMUX_MASK;                     //打开DMA多路复用器时钟
        LDR.N    R7,??DataTable3_1  ;; 0x4004803c
        LDR      R7,[R7, #+0]
        ORRS     R7,R7,#0x2
        LDR.W    R12,??DataTable3_1  ;; 0x4004803c
        STR      R7,[R12, #+0]
//   57 
//   58     /* 配置 DMA 通道 的 传输控制块 TCD ( Transfer Control Descriptor ) */
//   59     DMA_SADDR(CHn) =    (u32)SADDR;                         // 设置  源地址
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R7,R0,#+5
        LDR.W    R12,??DataTable3_2  ;; 0x40009000
        STR      R1,[R7, R12]
//   60     DMA_DADDR(CHn) =    (u32)DADDR;                         // 设置目的地址
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R7,R0,#+5
        ADD      R7,R7,#+1073741824
        ADDS     R7,R7,#+36864
        STR      R2,[R7, #+16]
//   61     DMA_SOFF(CHn)  =    0x00u;                              // 设置源地址偏移 = 0x0, 即不变
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        MOVS     R7,#+0
        STRH     R7,[R2, #+4]
//   62     DMA_DOFF(CHn)  =    BYTEs;                              // 每次传输后，目的地址加 BYTEs
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STRH     R6,[R2, #+20]
//   63 
//   64     DMA_ATTR(CHn)  =    (0
//   65                          | DMA_ATTR_SMOD(0x0)                // 源地址模数禁止  Source address modulo feature is disabled
//   66                          | DMA_ATTR_SSIZE(byten)             // 源数据位宽 ：DMA_BYTEn  。    SSIZE = 0 -> 8-bit ，SSIZE = 1 -> 16-bit ，SSIZE = 2 -> 32-bit ，SSIZE = 4 -> 16-byte
//   67                          | DMA_ATTR_DMOD(0x0)                // 目标地址模数禁止
//   68                          | DMA_ATTR_DSIZE(byten)             // 目标数据位宽 ：DMA_BYTEn  。  设置参考  SSIZE
//   69                         );
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSLS     R2,R3,#+8
        ANDS     R2,R2,#0x700
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ANDS     R7,R3,#0x7
        ORRS     R2,R7,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R7,R0,#+5
        ADD      R7,R7,#+1073741824
        ADDS     R7,R7,#+36864
        STRH     R2,[R7, #+6]
//   70 
//   71     DMA_CITER_ELINKNO(CHn)  = DMA_CITER_ELINKNO_CITER(count); //当前主循环次数
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        MOVS     R7,R5
        LSLS     R7,R7,#+17       ;; ZeroExtS R7,R7,#+17,#+17
        LSRS     R7,R7,#+17
        STRH     R7,[R2, #+22]
//   72     DMA_BITER_ELINKNO(CHn)  = DMA_BITER_ELINKYES_BITER(count);//起始主循环次数
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        MOVS     R7,R5
        LSLS     R7,R7,#+23       ;; ZeroExtS R7,R7,#+23,#+23
        LSRS     R7,R7,#+23
        STRH     R7,[R2, #+30]
//   73 
//   74 
//   75     DMA_CR &= ~DMA_CR_EMLM_MASK;                            // CR[EMLM] = 0
        LDR.N    R2,??DataTable3_3  ;; 0x40008000
        LDR      R2,[R2, #+0]
        BICS     R2,R2,#0x80
        LDR.N    R7,??DataTable3_3  ;; 0x40008000
        STR      R2,[R7, #+0]
//   76 
//   77     //当CR[EMLM] = 0 时:
//   78     DMA_NBYTES_MLNO(CHn) =   DMA_NBYTES_MLNO_NBYTES(BYTEs); // 通道每次传输字节数，这里设置为BYTEs个字节。注：值为0表示传输4GB */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STR      R6,[R2, #+8]
//   79 
//   80 
//   81     /* 配置 DMA 传输结束后的操作 */
//   82     DMA_SLAST(CHn)      =   0;                              //调整  源地址的附加值,主循环结束后恢复  源地址
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        MOVS     R6,#+0
        STR      R6,[R2, #+12]
//   83     DMA_DLAST_SGA(CHn)  =   (u32)( (cfg & 0x20) == 0 ? (-count)  : 0 ); //调整目的地址的附加值,主循环结束后恢复目的地址或者保持地址
        LSLS     R2,R4,#+26
        BMI.N    ??DMA_PORTx2BUFF_Init_6
        RSBS     R2,R5,#+0
        B.N      ??DMA_PORTx2BUFF_Init_7
??DMA_PORTx2BUFF_Init_6:
        MOVS     R2,#+0
??DMA_PORTx2BUFF_Init_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R4,R0,#+5
        ADD      R4,R4,#+1073741824
        ADDS     R4,R4,#+36864
        STR      R2,[R4, #+24]
//   84     DMA_CSR(CHn)        =   (0
//   85                              | DMA_CSR_DREQ_MASK            //主循环结束后停止硬件请求
//   86                              | DMA_CSR_INTMAJOR_MASK        //主循环结束后产生中断
//   87                             );
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        MOVS     R4,#+10
        STRH     R4,[R2, #+28]
//   88 
//   89     /* 配置 DMA 触发源 */
//   90 //    DMAMUX_CHCFG_REG(DMAMUX_BASE_PTR, CHn) = (0
//   91 //            | DMAMUX_CHCFG_ENBL_MASK                        /* Enable routing of DMA request */
//   92 //            //| DMAMUX_CHCFG_TRIG_MASK                        /* Trigger Mode: Periodic   PIT周期触发传输模式   通道1对应PIT1，必须使能PIT1，且配置相应的PIT定时触发 */
//   93 //            | DMAMUX_CHCFG_SOURCE((ptxn >> 5) + DMA_Port_A) /* 通道触发传输源:     */
//   94 //                                             );
//   95 //
//   96 //    SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK << (ptxn>>5));                                                               //开启PORTx端口
//   97 //    GPIO_PDDR_REG(GPIOx[(ptxn>>5)]) &= ~(1 << (ptxn & 0x1f));                                                       //设置端口方向为输入
//   98 //    PORT_PCR_REG(PORTX[(ptxn>>5)], (ptxn & 0x1F)) = ( 0
//   99 //            | PORT_PCR_MUX(1)               // 复用GPIO
//  100 //            | PORT_PCR_IRQC(cfg & 0x03 )    // 确定触发模式
//  101 //            | ((cfg & 0xc0 ) >> 6)          // 开启上拉或下拉电阻，或者没有
//  102 //                                                    );
//  103 //    GPIO_PDDR_REG(GPIOx[(ptxn>>5)]) &= ~(1 << (ptxn && 0x1F));                                                      //输入模式
//  104    /********************************************************************/ 
//  105     
//  106     
//  107     DMAMUX_CHCFG_REG(DMAMUX_BASE_PTR, CHn) = (0
//  108             | DMAMUX_CHCFG_ENBL_MASK                        /* Enable routing of DMA request */
//  109             | DMAMUX_CHCFG_TRIG_MASK                        /* Trigger Mode: Periodic   PIT周期触发传输模式   通道1对应PIT1，必须使能PIT1，且配置相应的PIT定时触发 */
//  110             //| DMAMUX_CHCFG_SOURCE((ptxn >> 5) + DMA_Port_A) /* 通道触发传输源:     */
//  111             | DMAMUX_CHCFG_SOURCE(59)                         //always   
//  112               );
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable3_4  ;; 0x40021000
        MOVS     R4,#+251
        STRB     R4,[R0, R2]
//  113 /******************************************************************/
//  114 //    SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK << (ptxn>>5));                                                               //开启PORTx端口
//  115 //    GPIO_PDDR_REG(GPIOx[(ptxn>>5)]) &= ~(1 << (ptxn & 0x1f));                                                       //设置端口方向为输入
//  116 //    PORT_PCR_REG(PORTX[(ptxn>>5)], (ptxn & 0x1F)) = ( 0
//  117 //            | PORT_PCR_MUX(1)               // 复用GPIO
//  118 //            | PORT_PCR_IRQC(cfg & 0x03 )    // 确定触发模式
//  119 //            | ((cfg & 0xc0 ) >> 6)          // 开启上拉或下拉电阻，或者没有
//  120 //                                                    );
//  121 //    GPIO_PDDR_REG(GPIOx[(ptxn>>5)]) &= ~(1 << (ptxn && 0x1F));                                                      //输入模式
//  122 /*******************************************************************/
//  123     /*  配置输入源   */
//  124     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK << ((((u32)SADDR) & 0x1ff)>>6));             //开启PORTx端口
        LDR.N    R2,??DataTable3_5  ;; 0x40048038
        LDR      R2,[R2, #+0]
        MOV      R4,#+512
        LSRS     R5,R1,#+6
        ANDS     R5,R5,#0x7
        LSLS     R4,R4,R5
        ORRS     R2,R4,R2
        LDR.N    R4,??DataTable3_5  ;; 0x40048038
        STR      R2,[R4, #+0]
//  125     switch(byten)
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??DMA_PORTx2BUFF_Init_8
        CMP      R3,#+2
        BEQ.N    ??DMA_PORTx2BUFF_Init_9
        BCC.N    ??DMA_PORTx2BUFF_Init_10
        B.N      ??DMA_PORTx2BUFF_Init_11
//  126     {
//  127     case DMA_BYTE1:
//  128         *((u8 *)((u32)SADDR + 4)) = 0;   //设置为输入方向。为什么加4？PDIR地址加4后，就变成对应的PDDR地址
??DMA_PORTx2BUFF_Init_8:
        MOVS     R2,#+0
        STRB     R2,[R1, #+4]
//  129         break;
        B.N      ??DMA_PORTx2BUFF_Init_12
//  130     case DMA_BYTE2:
//  131         *((u16 *)((u32)SADDR + 4)) = 0;
??DMA_PORTx2BUFF_Init_10:
        MOVS     R2,#+0
        STRH     R2,[R1, #+4]
//  132         break;
        B.N      ??DMA_PORTx2BUFF_Init_12
//  133     case DMA_BYTE4:
//  134         *((u32 *)((u32)SADDR + 4)) = 0;
??DMA_PORTx2BUFF_Init_9:
        MOVS     R2,#+0
        STR      R2,[R1, #+4]
//  135         break;
        B.N      ??DMA_PORTx2BUFF_Init_12
//  136     default:
//  137 //        assert_failed(__FILE__, __LINE__);
//  138         break;
//  139     }
//  140 //////////////////////////////////////////////////////////////////////////////////
//  141     
//  142     
//  143     
//  144 //    /*  输入源管脚选择功能脚  */
//  145 //    n = (u8)(((u32)SADDR - ((u32)(&PTA_BYTE0_IN))) & 0x3f);         //最小的引脚号
//  146 //    tmp = n + (BYTEs << 3);                                         //最大的引脚号
//  147 //    for(i = n; i < tmp; i++)
//  148 //    {
//  149 //        PORT_PCR_REG(PORTX[   ((((u32)SADDR)&0x1ff)>>6)    ], i) = (0
//  150 //                | PORT_PCR_MUX(1)
//  151 //                | GPI_DOWN             //输入源应该下拉，默认读取到的是0
//  152 //                                                                   );
//  153 //    }
//  154 
//  155     /* 开启中断 */
//  156     //DMA_EN(CHn);                                    //使能通道CHn 硬件请求
//  157     DMA_IRQ_EN(CHn);                                //允许DMA通道传输//晓克注：允许DMA通道CHn产生中断,一次采集结束触发中断
??DMA_PORTx2BUFF_Init_11:
??DMA_PORTx2BUFF_Init_12:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       enable_irq
//  158 }
        POP      {R0,R4-R7,PC}    ;; return
//  159 
//  160 
//  161 
//  162 
//  163 
//  164 /*************************************************************************
//  165 *                             野火嵌入式开发工作室
//  166 *
//  167 *  函数名称：DMA_count_Init
//  168 *  功能说明：DMA累加计数初始化
//  169 *  参数说明：DMA_CHn              通道号（DMA_CH0 ~ DMA_CH15）
//  170 *            PTxn                 触发端口
//  171 *            count                累加计数中断值
//  172 *            DMA_Count_cfg        DMA传输配置
//  173 *  函数返回：无
//  174 *  修改时间：2012-1-20
//  175 *  备    注：
//  176 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  177 void DMA_count_Init(DMA_CHn CHn, U32 ptxn, u32 count, DMA_Count_cfg cfg)
//  178 {
DMA_count_Init:
        PUSH     {R3-R7,LR}
//  179     u8 byten = DMA_BYTE1;
        MOVS     R4,#+0
//  180     u8 BYTEs = (byten == DMA_BYTE1 ? 1 : (byten == DMA_BYTE2 ? 2 : (byten == DMA_BYTE4 ? 4 : 16 ) ) ); //计算传输字节数
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??DMA_count_Init_0
        MOVS     R5,#+1
        B.N      ??DMA_count_Init_1
??DMA_count_Init_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??DMA_count_Init_2
        MOVS     R5,#+2
        B.N      ??DMA_count_Init_3
??DMA_count_Init_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BNE.N    ??DMA_count_Init_4
        MOVS     R5,#+4
        B.N      ??DMA_count_Init_5
??DMA_count_Init_4:
        MOVS     R5,#+16
//  181     if(count > 0x7FFF )count = 0x7FFF;
??DMA_count_Init_5:
??DMA_count_Init_3:
??DMA_count_Init_1:
        CMP      R2,#+32768
        BCC.N    ??DMA_count_Init_6
        MOVW     R2,#+32767
//  182     count_init[CHn] = count;
??DMA_count_Init_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R6,??DataTable3_6
        STR      R2,[R6, R0, LSL #+2]
//  183 
//  184     /* 开启时钟 */
//  185     SIM_SCGC7 |= SIM_SCGC7_DMA_MASK;                        //打开DMA模块时钟
        LDR.N    R6,??DataTable3  ;; 0x40048040
        LDR      R6,[R6, #+0]
        ORRS     R6,R6,#0x2
        LDR.N    R7,??DataTable3  ;; 0x40048040
        STR      R6,[R7, #+0]
//  186     SIM_SCGC6 |= SIM_SCGC6_DMAMUX_MASK;                     //打开DMA多路复用器时钟
        LDR.N    R6,??DataTable3_1  ;; 0x4004803c
        LDR      R6,[R6, #+0]
        ORRS     R6,R6,#0x2
        LDR.N    R7,??DataTable3_1  ;; 0x4004803c
        STR      R6,[R7, #+0]
//  187 
//  188     /* 配置 DMA 通道 的 传输控制块 TCD ( Transfer Control Descriptor ) */
//  189     DMA_SADDR(CHn) =    (u32)COUNTSADDR;                    // 设置  源地址
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        LDR.N    R7,??DataTable3_2  ;; 0x40009000
        LDR.W    R12,??DataTable3_7  ;; 0x4004000c
        STR      R12,[R6, R7]
//  190     DMA_DADDR(CHn) =    (u32)COUNTDADDR;                    // 设置目的地址
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        LDR.N    R7,??DataTable3_7  ;; 0x4004000c
        STR      R7,[R6, #+16]
//  191     DMA_SOFF(CHn)  =    0;                                  // 设置源地址不变
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        MOVS     R7,#+0
        STRH     R7,[R6, #+4]
//  192     DMA_DOFF(CHn)  =    0;                                  // 每次传输后，目的地址不变
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        MOVS     R7,#+0
        STRH     R7,[R6, #+20]
//  193 
//  194     DMA_ATTR(CHn)  =    (0
//  195                          | DMA_ATTR_SMOD(0x0)                // 源地址模数禁止  Source address modulo feature is disabled
//  196                          | DMA_ATTR_SSIZE(byten)             // 源数据位宽 ：DMA_BYTEn  。    SSIZE = 0 -> 8-bit ，SSIZE = 1 -> 16-bit ，SSIZE = 2 -> 32-bit ，SSIZE = 4 -> 16-byte
//  197                          | DMA_ATTR_DMOD(0x0)                // 目标地址模数禁止
//  198                          | DMA_ATTR_DSIZE(byten)             // 目标数据位宽 ：DMA_BYTEn  。  设置参考  SSIZE
//  199                         );
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R6,R4,#+8
        ANDS     R6,R6,#0x700
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ANDS     R4,R4,#0x7
        ORRS     R4,R4,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R6,R0,#+5
        ADD      R6,R6,#+1073741824
        ADDS     R6,R6,#+36864
        STRH     R4,[R6, #+6]
//  200 
//  201     DMA_CITER_ELINKNO(CHn)  = DMA_CITER_ELINKNO_CITER(count); //当前主循环次数
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R4,R0,#+5
        ADD      R4,R4,#+1073741824
        ADDS     R4,R4,#+36864
        MOVS     R6,R2
        LSLS     R6,R6,#+17       ;; ZeroExtS R6,R6,#+17,#+17
        LSRS     R6,R6,#+17
        STRH     R6,[R4, #+22]
//  202     DMA_BITER_ELINKNO(CHn)  = DMA_BITER_ELINKYES_BITER(count);//起始主循环次数
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R4,R0,#+5
        ADD      R4,R4,#+1073741824
        ADDS     R4,R4,#+36864
        MOVS     R6,R2
        LSLS     R6,R6,#+23       ;; ZeroExtS R6,R6,#+23,#+23
        LSRS     R6,R6,#+23
        STRH     R6,[R4, #+30]
//  203 
//  204     DMA_CR &= ~DMA_CR_EMLM_MASK;                            // CR[EMLM] = 0
        LDR.N    R4,??DataTable3_3  ;; 0x40008000
        LDR      R4,[R4, #+0]
        BICS     R4,R4,#0x80
        LDR.N    R6,??DataTable3_3  ;; 0x40008000
        STR      R4,[R6, #+0]
//  205 
//  206     DMA_NBYTES_MLNO(CHn) =   DMA_NBYTES_MLNO_NBYTES(BYTEs); // 通道每次传输字节数，这里设置为BYTEs个字节。注：值为0表示传输4GB */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R4,R0,#+5
        ADD      R4,R4,#+1073741824
        ADDS     R4,R4,#+36864
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STR      R5,[R4, #+8]
//  207 
//  208     /* 配置 DMA 传输结束后的操作 */
//  209     DMA_SLAST(CHn)      =   -count;                              //调整  源地址的附加值,主循环结束后恢复  源地址
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R4,R0,#+5
        ADD      R4,R4,#+1073741824
        ADDS     R4,R4,#+36864
        RSBS     R2,R2,#+0
        STR      R2,[R4, #+12]
//  210     DMA_DLAST_SGA(CHn)  =   0;                                  //调整目的地址的附加值,主循环结束后恢复目的地址或者保持地址
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        MOVS     R4,#+0
        STR      R4,[R2, #+24]
//  211     DMA_CSR(CHn)        =   (0
//  212                              | DMA_CSR_DREQ_MASK            //主循环结束后停止硬件请求
//  213                              | DMA_CSR_INTMAJOR_MASK        //主循环结束后产生中断
//  214                             );
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+5
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+36864
        MOVS     R4,#+10
        STRH     R4,[R2, #+28]
//  215 
//  216     /* 配置 DMA 触发源 */
//  217     DMAMUX_CHCFG_REG(DMAMUX_BASE_PTR, CHn) = (0
//  218             | DMAMUX_CHCFG_ENBL_MASK                        /* Enable routing of DMA request */
//  219             | DMAMUX_CHCFG_SOURCE((ptxn >> 5) + DMA_Port_A) /* 通道触发传输源:     */
//  220                                              );
        LSRS     R2,R1,#+5
        ADDS     R2,R2,#+49
        ANDS     R2,R2,#0x3F
        ORRS     R2,R2,#0x80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R4,??DataTable3_4  ;; 0x40021000
        STRB     R2,[R0, R4]
//  221 
//  222     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK << (ptxn>>5));                                                               //开启PORTx端口
        LDR.N    R2,??DataTable3_5  ;; 0x40048038
        LDR      R2,[R2, #+0]
        MOV      R4,#+512
        LSRS     R5,R1,#+5
        LSLS     R4,R4,R5
        ORRS     R2,R4,R2
        LDR.N    R4,??DataTable3_5  ;; 0x40048038
        STR      R2,[R4, #+0]
//  223     GPIO_PDDR_REG(GPIOx[(ptxn>>5)]) &= ~(1 << (ptxn & 0x1f));                                                       //设置端口方向为输入
        LSRS     R2,R1,#+5
        LDR.N    R4,??DataTable3_8
        LDR      R2,[R4, R2, LSL #+2]
        LDR      R2,[R2, #+20]
        MOVS     R4,#+1
        ANDS     R5,R1,#0x1F
        LSLS     R4,R4,R5
        BICS     R2,R2,R4
        LSRS     R4,R1,#+5
        LDR.N    R5,??DataTable3_8
        LDR      R4,[R5, R4, LSL #+2]
        STR      R2,[R4, #+20]
//  224     PORT_PCR_REG(PORTX[(ptxn>>5)], (ptxn & 0x1F)) = ( 0
//  225             | PORT_PCR_MUX(1)               // 复用GPIO
//  226             | PORT_PCR_IRQC(cfg & 0x03 )    // 确定触发模式
//  227             | ((cfg & 0xc0 ) >> 6)          // 开启上拉或下拉电阻，或者没有
//  228                                                     );
        ANDS     R2,R1,#0x1F
        LSRS     R4,R1,#+5
        LDR.N    R5,??DataTable3_9
        LDR      R4,[R5, R4, LSL #+2]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ANDS     R5,R3,#0x3
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSRS     R3,R3,#+6
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ORRS     R3,R3,R5, LSL #+16
        MOV      R5,#+256
        ORRS     R3,R5,R3
        STR      R3,[R4, R2, LSL #+2]
//  229     GPIO_PDDR_REG(GPIOx[(ptxn>>5)]) &= ~(1 << (ptxn && 0x1F));                                                      //输入模式
        CMP      R1,#+0
        BEQ.N    ??DMA_count_Init_7
        MOVS     R2,#+1
        B.N      ??DMA_count_Init_8
??DMA_count_Init_7:
        MOVS     R2,#+0
??DMA_count_Init_8:
        LSRS     R3,R1,#+5
        LDR.N    R4,??DataTable3_8
        LDR      R3,[R4, R3, LSL #+2]
        LDR      R3,[R3, #+20]
        MOVS     R4,#+1
        LSLS     R2,R4,R2
        BICS     R2,R3,R2
        LSRS     R1,R1,#+5
        LDR.N    R3,??DataTable3_8
        LDR      R1,[R3, R1, LSL #+2]
        STR      R2,[R1, #+20]
//  230 
//  231     /* 开启中断 */
//  232     DMA_EN(CHn);                                    //使能通道CHn 硬件请求
        LDR.N    R1,??DataTable3_10  ;; 0x4000800c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable3_10  ;; 0x4000800c
        STR      R1,[R2, #+0]
//  233     DMA_IRQ_EN(CHn);                                //允许DMA通道传输
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       enable_irq
//  234 }
        POP      {R0,R4-R7,PC}    ;; return
//  235 
//  236 /*************************************************************************
//  237 *                             野火嵌入式开发工作室
//  238 *
//  239 *  函数名称：DMA_count_get
//  240 *  功能说明：返回累加计数值
//  241 *  参数说明：DMA_CHn              通道号（DMA_CH0 ~ DMA_CH15）
//  242 *  函数返回：累加计数值
//  243 *  修改时间：2012-3-320
//  244 *  备    注：
//  245 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  246 u32 DMA_count_get(DMA_CHn CHn)
//  247 {
//  248     u32 temp =  count_init[CHn] - DMA_CITER_ELINKNO(CHn)  ;
DMA_count_get:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable3_6
        LDR      R1,[R1, R0, LSL #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R0,R0,#+5
        ADD      R0,R0,#+1073741824
        ADDS     R0,R0,#+36864
        LDRH     R0,[R0, #+22]
        SUBS     R0,R1,R0
//  249     return temp;
        BX       LR               ;; return
//  250 }
//  251 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  252 void DMA_count_reset(DMA_CHn CHn)
//  253 {
//  254     DMA_CITER_ELINKNO(CHn) = count_init[CHn] ;
DMA_count_reset:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R1,R0,#+5
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+36864
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable3_6
        LDR      R0,[R2, R0, LSL #+2]
        STRH     R0,[R1, #+22]
//  255 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x40048040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x40009000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x40008000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x40021000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     count_init

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x4004000c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     GPIOx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     PORTX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x4000800c

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  256 
// 
//  64 bytes in section .bss
// 900 bytes in section .text
// 
// 900 bytes of CODE memory
//  64 bytes of DATA memory
//
//Errors: none
//Warnings: 2
