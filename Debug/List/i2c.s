///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:54
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\i2c.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\i2c.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\i2c.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC I2C_ReadAddr
        PUBLIC I2C_StartTransmission
        PUBLIC I2C_WriteAddr
        PUBLIC I2C_init
        PUBLIC I2Cx
        PUBLIC MasterTransmission
        PUBLIC Pause
        PUBLIC SlaveID

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\i2c.c
//    1 #include"i2c.h"
//    2 
//    3 
//    4 
//    5 
//    6 
//    7 
//    8 
//    9 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   10 unsigned char MasterTransmission;
MasterTransmission:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   11 unsigned char SlaveID;
SlaveID:
        DS8 1
//   12 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13 volatile struct I2C_MemMap *I2Cx[2] = {I2C0_BASE_PTR, I2C1_BASE_PTR}; //定义两个指针数组保存 I2Cx 的地址
I2Cx:
        DATA
        DC32 40066000H, 40067000H
//   14 
//   15 
//   16 /*************************************************************************
//   17 *                             野火嵌入式开发工作室
//   18 *
//   19 *  函数名称：I2C_init
//   20 *  功能说明：I2C初始化，设置波特率和启动I2C
//   21 *  参数说明：I2Cn        模块号（I2C0、I2C1）
//   22 *  函数返回：无
//   23 *  修改时间：2012-1-20
//   24 *  备    注：
//   25 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   26 void I2C_init(I2Cn i2cn)
//   27 {
//   28     u8 mult;
//   29     if(PERIPH_SYS_CLK <= 50000)mult = 0;         //bus 一分频
I2C_init:
        LDR.N    R1,??DataTable3  ;; 0x8f0d180
        LDR.N    R2,??DataTable3_1  ;; 0x40048044
        LDR      R2,[R2, #+0]
        UBFX     R2,R2,#+24,#+4
        ADDS     R2,R2,#+1
        UDIV     R1,R1,R2
        MOVW     R2,#+50001
        CMP      R1,R2
        BCS.N    ??I2C_init_0
        MOVS     R1,#+0
        B.N      ??I2C_init_1
//   30     else  if(PERIPH_SYS_CLK <= 100000)mult = 1;  //bus 二分频
??I2C_init_0:
        LDR.N    R1,??DataTable3  ;; 0x8f0d180
        LDR.N    R2,??DataTable3_1  ;; 0x40048044
        LDR      R2,[R2, #+0]
        UBFX     R2,R2,#+24,#+4
        ADDS     R2,R2,#+1
        UDIV     R1,R1,R2
        LDR.N    R2,??DataTable3_2  ;; 0x186a1
        CMP      R1,R2
        BCS.N    ??I2C_init_2
        MOVS     R1,#+1
        B.N      ??I2C_init_1
//   31     else      mult = 2;                       //bus 四分频
??I2C_init_2:
        MOVS     R1,#+2
//   32 
//   33     if(i2cn == I2C0)
??I2C_init_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??I2C_init_3
//   34     {
//   35         /* 开启时钟 */
//   36         SIM_SCGC4 |= SIM_SCGC4_I2C0_MASK;         //开启 I2C0时钟
        LDR.N    R1,??DataTable3_3  ;; 0x40048034
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x40
        LDR.N    R2,??DataTable3_3  ;; 0x40048034
        STR      R1,[R2, #+0]
//   37 
//   38         /* 配置 I2C0功能的 GPIO 接口 */
//   39         //if(I2C0_SCL == PTB0)
//   40             //PORTB_PCR0 = PORT_PCR_MUX(2);
//   41         //else if(I2C0_SCL == PTB2)
//   42             PORTB_PCR2 = PORT_PCR_MUX(2);
        MOV      R1,#+512
        LDR.N    R2,??DataTable3_4  ;; 0x4004a008
        STR      R1,[R2, #+0]
//   43         //else if(I2C0_SCL == PTD8)
//   44             //PORTD_PCR8 = PORT_PCR_MUX(2);
//   45         //else
//   46         //    assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
//   47 
//   48         //if(I2C0_SDA == PTB1)
//   49             //PORTB_PCR1 = PORT_PCR_MUX(2);
//   50         //else if(I2C0_SDA == PTB3)
//   51             PORTB_PCR3 = PORT_PCR_MUX(2);
        MOV      R1,#+512
        LDR.N    R2,??DataTable3_5  ;; 0x4004a00c
        STR      R1,[R2, #+0]
        B.N      ??I2C_init_4
//   52         //else if(I2C0_SDA == PTD9)
//   53             //PORTD_PCR9 = PORT_PCR_MUX(2);
//   54         //else
//   55             //assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
//   56     }
//   57     else
//   58     {
//   59         /* 开启时钟 */
//   60         SIM_SCGC4 |= SIM_SCGC4_I2C1_MASK;         //开启 I2C1时钟
??I2C_init_3:
        LDR.N    R1,??DataTable3_3  ;; 0x40048034
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x80
        LDR.N    R2,??DataTable3_3  ;; 0x40048034
        STR      R1,[R2, #+0]
//   61 
//   62         /* 配置 I2C1功能的 GPIO 接口 */
//   63         //if(I2C1_SCL == PTE1)
//   64             PORTE_PCR1 = PORT_PCR_MUX(6);
        MOV      R1,#+1536
        LDR.N    R2,??DataTable3_6  ;; 0x4004d004
        STR      R1,[R2, #+0]
//   65         //else if(I2C1_SCL == PTC10)
//   66             //PORTC_PCR10 = PORT_PCR_MUX(2);
//   67         //else
//   68             //assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
//   69 
//   70         //if(I2C1_SDA == PTE0)
//   71             PORTE_PCR0 = PORT_PCR_MUX(6);
        MOV      R1,#+1536
        LDR.N    R2,??DataTable3_7  ;; 0x4004d000
        STR      R1,[R2, #+0]
//   72         //else if (I2C1_SDA == PTC11)
//   73             //PORTC_PCR11 = PORT_PCR_MUX(2);
//   74         //else
//   75             //assert_failed(__FILE__, __LINE__);                   //设置管脚有误？
//   76 
//   77     }
//   78 
//   79     /* 设置频率 */
//   80     //I2C_F_REG(I2Cx[i2cn])  = I2C_F_MULT(mult) | I2C_F_ICR(17) ;  // I2C Frequency Divider register (I2Cx_F)  I2C分频寄存器   I2C最大波特率为 400k
//   81     I2C0_F  = 0x13;
??I2C_init_4:
        MOVS     R1,#+19
        LDR.N    R2,??DataTable3_8  ;; 0x40066001
        STRB     R1,[R2, #+0]
//   82     //I2C0_F  = 0x13;
//   83     // MULT=00  即  mul = 1
//   84     // ICR =14  ICR为Clock rate时钟频率
//   85     // 从《k16 reference manual.pdf》P1460 可得：
//   86     // ICR    SCL Divider   SDA Hold Value    SCL Hold (Start) Value    SCL Hold (Stop) Value
//   87     //  14        80              17                   34                         41
//   88     //  17       128              21                   58                         65
//   89     // I2C baud rate = bus speed (Hz)/(mul × SCL divider)  即这里 50MHz/(1 ×128)=390.625kHz
//   90     // SDA hold time = bus period (s) × mul × SDA hold value
//   91     // SCL start hold time = bus period (s) × mul × SCL start hold value
//   92     // SCL stop hold time = bus period (s) × mul × SCL stop hold value
//   93 
//   94     /* 使能 IIC1 */
//   95     I2C_C1_REG(I2Cx[i2cn]) = I2C_C1_IICEN_MASK;
        MOVS     R1,#+128
        LDR.N    R2,??DataTable3_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R0,[R2, R0, LSL #+2]
        STRB     R1,[R0, #+2]
//   96 }
        BX       LR               ;; return
//   97 
//   98 /*************************************************************************
//   99 *                             野火嵌入式开发工作室
//  100 *
//  101 *  函数名称：I2C_StartTransmission
//  102 *  功能说明：启动 I2C 传输
//  103 *  参数说明：I2Cn        模块号（I2C0、I2C1）
//  104 *            SlaveID     7位从机地址
//  105 *            MSmode      读写模式（ MWSR 或 MRSW ）
//  106 *  函数返回：无
//  107 *  修改时间：2012-1-20
//  108 *  备    注：
//  109 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  110 void I2C_StartTransmission (I2Cn i2cn, u8 SlaveID, MSmode Mode)
//  111 {
//  112 
//  113     //ASSERT(Mode == MWSR || Mode == MRSW);         //使用断言，检测 Mode 是否为 读 或 写
//  114 
//  115     SlaveID = ( SlaveID << 1 ) | Mode ;            //确定写地址和读地址
I2C_StartTransmission:
        ORRS     R1,R2,R1, LSL #+1
//  116 
//  117     /* send start signal */
//  118     i2c_Start(i2cn);
        LDR.N    R2,??DataTable3_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        LDRB     R2,[R2, #+2]
        ORRS     R2,R2,#0x10
        LDR.N    R3,??DataTable3_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R3,[R3, R0, LSL #+2]
        STRB     R2,[R3, #+2]
        LDR.N    R2,??DataTable3_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        LDRB     R2,[R2, #+2]
        ORRS     R2,R2,#0x20
        LDR.N    R3,??DataTable3_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R3,[R3, R0, LSL #+2]
        STRB     R2,[R3, #+2]
//  119 
//  120     /* send ID with W/R bit */
//  121     i2c_write_byte(i2cn, SlaveID);
        LDR.N    R2,??DataTable3_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R0,[R2, R0, LSL #+2]
        STRB     R1,[R0, #+4]
//  122 }
        BX       LR               ;; return
//  123 
//  124 /*************************************************************************
//  125 *                             野火嵌入式开发工作室
//  126 *
//  127 *  函数名称：Pause
//  128 *  功能说明：延时，I2C读写后，需要延时一下
//  129 *  参数说明：无
//  130 *  函数返回：无
//  131 *  修改时间：2012-1-20
//  132 *  备    注：在官方基础上增大延时数
//  133 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  134 void Pause(void)
//  135 {
//  136     u16 n;
//  137     for(n = 1; n < 50000; n++)      //注意，这个数据太小，会导致读取错误。
Pause:
        MOVS     R0,#+1
        B.N      ??Pause_0
//  138     {
//  139         asm("nop");
??Pause_1:
        nop
//  140     }
        ADDS     R0,R0,#+1
??Pause_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+50000
        CMP      R0,R1
        BLT.N    ??Pause_1
//  141 }
        BX       LR               ;; return
//  142 
//  143 /*************************************************************************
//  144 *                             野火嵌入式开发工作室
//  145 *
//  146 *  函数名称：I2C_ReadAddr
//  147 *  功能说明：读取I2C设备指定地址寄存器的数据
//  148 *  参数说明：I2Cn        模块号（I2C0、I2C1）
//  149 *            SlaveID     7位从机地址
//  150 *            Addr        从机的寄存器地址
//  151 *  函数返回：从机寄存器的数据
//  152 *  修改时间：2012-1-20
//  153 *  备    注：
//  154 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  155 u8 I2C_ReadAddr(I2Cn i2cn, u8 SlaveID, u8 Addr)
//  156 {
I2C_ReadAddr:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  157     u8 result;
//  158 
//  159     /* Send Slave Address */
//  160     I2C_StartTransmission (i2cn, SlaveID, MWSR);
        MOVS     R2,#+0
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       I2C_StartTransmission
//  161     i2c_Wait(i2cn);
??I2C_ReadAddr_0:
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+30
        BPL.N    ??I2C_ReadAddr_0
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  162 
//  163     /* Write Register Address */
//  164     i2c_write_byte(i2cn, Addr);
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        STRB     R6,[R0, #+4]
//  165     i2c_Wait(i2cn);
??I2C_ReadAddr_1:
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+30
        BPL.N    ??I2C_ReadAddr_1
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  166 
//  167     /* Do a repeated start */
//  168     i2c_RepeatedStart(i2cn);
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+2]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+2]
//  169 
//  170     /* Send Slave Address */
//  171     i2c_write_byte(i2cn, ( SlaveID << 1) | MRSW );
        LSLS     R0,R5,#+1
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+4]
//  172     i2c_Wait(i2cn);
??I2C_ReadAddr_2:
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+30
        BPL.N    ??I2C_ReadAddr_2
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  173 
//  174     /* Put in Rx Mode */
//  175     i2c_PutinRxMode(i2cn);
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+2]
        ANDS     R0,R0,#0xEF
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+2]
//  176 
//  177     /* Turn off ACK since this is second to last byte being read*/
//  178     i2c_DisableAck(i2cn); //不应答
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+2]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+2]
//  179 
//  180     /* Dummy read 虚假读取*/
//  181     result = I2C_D_REG(I2Cx[i2cn]);
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+4]
//  182     i2c_Wait(i2cn);
??I2C_ReadAddr_3:
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+30
        BPL.N    ??I2C_ReadAddr_3
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  183 
//  184     /* Send stop since about to read last byte */
//  185     i2c_Stop(i2cn);
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+2]
        ANDS     R0,R0,#0xDF
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+2]
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+2]
        ANDS     R0,R0,#0xEF
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+2]
//  186 
//  187     /* Read byte */
//  188     result = I2C_D_REG(I2Cx[i2cn]);
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+4]
//  189 
//  190     return result;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
//  191 }
//  192 
//  193 
//  194 /*************************************************************************
//  195 *                             野火嵌入式开发工作室
//  196 *
//  197 *  函数名称：I2C_WriteAddr
//  198 *  功能说明：写入一个字节数据到I2C设备指定寄存器地址
//  199 *  参数说明：I2Cn        模块号（I2C0、I2C1）
//  200 *            SlaveID     7位从机地址
//  201 *            Addr        从机的寄存器地址
//  202 *            Data        数据
//  203 *  函数返回：无
//  204 *  修改时间：2012-1-20
//  205 *  备    注：
//  206 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  207 void I2C_WriteAddr(I2Cn i2cn, u8 SlaveID, u8 Addr, u8 Data)
//  208 {
I2C_WriteAddr:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R2
        MOVS     R6,R3
//  209     /* send data to slave */
//  210     I2C_StartTransmission(i2cn, SlaveID, MWSR);    //启动传输
        MOVS     R2,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       I2C_StartTransmission
//  211     i2c_Wait(i2cn);
??I2C_WriteAddr_0:
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+30
        BPL.N    ??I2C_WriteAddr_0
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  212 
//  213     i2c_write_byte(i2cn, Addr);                    //写地址
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        STRB     R5,[R0, #+4]
//  214     i2c_Wait(i2cn);
??I2C_WriteAddr_1:
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+30
        BPL.N    ??I2C_WriteAddr_1
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  215 
//  216     i2c_write_byte(i2cn, Data);                    //写数据
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        STRB     R6,[R0, #+4]
//  217     i2c_Wait(i2cn);
??I2C_WriteAddr_2:
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+30
        BPL.N    ??I2C_WriteAddr_2
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  218 
//  219     i2c_Stop(i2cn);
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+2]
        ANDS     R0,R0,#0xDF
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+2]
        LDR.N    R0,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+2]
        ANDS     R0,R0,#0xEF
        LDR.N    R1,??DataTable3_9
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+2]
//  220 
//  221     Pause();                                        //延时太短的话，可能写出错
        BL       Pause
//  222 }
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x8f0d180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x186a1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x4004a008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x4004a00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x4004d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x40066001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     I2Cx

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
//   2 bytes in section .bss
//   8 bytes in section .data
// 816 bytes in section .text
// 
// 816 bytes of CODE memory
//  10 bytes of DATA memory
//
//Errors: none
//Warnings: 1
