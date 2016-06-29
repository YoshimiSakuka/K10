///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    13/Mar/2015  12:44:27 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Administrator\Desktop\3.11换结构BLOCK nd       /
//                    black\common\NRF24L0.c                                  /
//    Command line =  "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\common\NRF24L0.c" -D DEBUG -lCN                   /
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
//                    black\Debug\List\NRF24L0.s                              /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME NRF24L0

        #define SHT_PROGBITS 0x1

        EXTERN Delay_ms
        EXTERN GPIO_Init
        EXTERN spi_WR
        EXTERN spi_init
        EXTERN spi_send

        PUBLIC NRF_Handler
        PUBLIC NRF_ISR_Rx_Dat
        PUBLIC NRF_ISR_Rx_rst
        PUBLIC NRF_ISR_Tx_Dat
        PUBLIC NRF_ISR_Tx_State
        PUBLIC NRF_Init
        PUBLIC NRF_RX_Mode
        PUBLIC NRF_ReadReg
        PUBLIC NRF_Rx_Dat
        PUBLIC NRF_TX_Mode
        PUBLIC NRF_Tx_Dat
        PUBLIC RX_ADDRESS
        PUBLIC RX_BUF
        PUBLIC RX_ISR_FIFO
        PUBLIC TX_ADDRESS
        PUBLIC front
        PUBLIC isr_L
        PUBLIC isr_addr
        PUBLIC isr_state
        PUBLIC nrf_cpy
        PUBLIC nrf_mode
        PUBLIC re_flag
        PUBLIC rear

// C:\Users\Administrator\Desktop\3.11换结构BLOCK nd  black\common\NRF24L0.c
//    1 //#include "common.h"
//    2 //#include "gpio.h"   gpio_init
//    3 //#include "exti.h"
//    4 #include "spi.h"
//    5 #include "NRF24L0.h"
//    6 //#include "GPIO.h"
//    7 
//    8 typedef enum
//    9 {
//   10     NOT_INIT=0,
//   11     TX_MODE,
//   12     RX_MODE,
//   13 }nrf_mode_e;
//   14 
//   15 
//   16 typedef enum
//   17 {
//   18     QUEUE_EMPTY = 0,        //队列空模式，只可入队列
//   19     QUEUE_NORMAL,           //正常模式，可正常出入队列，即队列不空不满
//   20     QUEUE_FULL,             //队列满模式，满了则不再添加，丢弃掉数据
//   21 }nrf_rx_queueflag_e; //中断接收时，队列状态标记位
//   22 //------------------------------------------------------------------------------需改
//   23 #define NRF_CE_HIGH()	    PTE0_OUT=1
//   24 #define NRF_CE_LOW()	    PTE0_OUT=0			  //CE置低
//   25 #define NRF_PCSN_LOW()      PTE4_OUT=0
//   26 #define NRF_PCSN_HIGH()     PTE4_OUT=1
//   27 #define NRF_Read_IRQ()	    PTE5_IN
//   28 //------------------------------------------------------------------------------
//   29 static  uint8      NRF_WriteReg(uint8 reg,uint8 dat);
//   30 
//   31 
//   32 static  uint8      NRF_ReadBuf(uint8 reg,uint8 *pBuf,uint8 len);
//   33 static  uint8      NRF_WriteBuf(uint8 reg ,uint8 *pBuf,uint32 len);
//   34 static  uint8      NRF_RW(uint8 dat);
//   35 static  void    NRF_ISR_Tx_Handler(void);               //发送中断处理函数
//   36 static  void    NRF_ISR_Rx_Handler(void);
//   37 static  uint8      NRF_Check(void);
//   38 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   39 volatile uint8     nrf_mode=NOT_INIT;
nrf_mode:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   40 volatile uint8 *   isr_addr   =NULL;
isr_addr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41 volatile uint32    isr_L      =0;     //L = len / MAX_ONCE_TX_NUM
isr_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   42 volatile uint8     isr_state  =0;
isr_state:
        DS8 1
//   43 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   44 volatile uint8     front = 0,rear = 0; //接收FIFO的指针
front:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
rear:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   45 volatile uint8     re_flag = QUEUE_EMPTY;
re_flag:
        DS8 1
//   46 
//   47 static  void    NRF_ISR_Tx_Dat_Once(void);
//   48 
//   49 
//   50 
//   51 #define TX_ADR_WIDTH 	ADR_WIDTH  	//发射地址宽度
//   52 #define TX_PLOAD_WIDTH  MAX_ONCE_TX_NUM   //发射数据通道有效数据宽度0~32Byte 
//   53 
//   54 #define RX_ADR_WIDTH    ADR_WIDTH
//   55 #define RX_PLOAD_WIDTH  MAX_ONCE_TX_NUM
//   56 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   57 uint8 RX_BUF[RX_PLOAD_WIDTH];		//接收数据缓存
RX_BUF:
        DS8 32
//   58 //u8 TX_BUF[TX_PLOAD_WIDTH];		//发射数据缓存
//   59 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   60 uint8 RX_ISR_FIFO[RX_ISR_FIFO_PACKET][MAX_ONCE_TX_NUM];      //中断接收的FIFO
RX_ISR_FIFO:
        DS8 640
//   61 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   62 uint8 TX_ADDRESS[5] = {0xFF,0xFF,0xFF,0xFF,0xFF};  // 定义一个静态发送地址
TX_ADDRESS:
        DATA
        DC8 255, 255, 255, 255, 255, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   63 uint8 RX_ADDRESS[5] = {0xFF,0xFF,0xFF,0xFF,0xFF};
RX_ADDRESS:
        DATA
        DC8 255, 255, 255, 255, 255, 0, 0, 0
//   64 
//   65 
//   66 
//   67 #define CHANAL 0	//频道选择 
//   68 
//   69 // SPI(nRF24L01) commands ,	NRF的SPI命令宏定义，详见NRF功能使用文档   MOSI
//   70 #define NRF_READ_REG    0x00  // Define read command to register
//   71 #define NRF_WRITE_REG   0x20  // Define write command to register
//   72 #define RD_RX_PLOAD     0x61  // Define RX payload register address
//   73 #define WR_TX_PLOAD     0xA0  // Define TX payload register address
//   74 #define FLUSH_TX        0xE1  // Define flush TX register command
//   75 #define FLUSH_RX        0xE2  // Define flush RX register command
//   76 #define REUSE_TX_PL     0xE3  // Define reuse TX payload register command
//   77 #define NOP             0xFF  // Define No Operation, might be used to read status register
//   78 
//   79 // SPI(nRF24L01) registers(addresses) ，NRF24L01 相关寄存器地址的宏定义
//   80 #define CONFIG      0x00  // 'Config' register address
//   81 #define EN_AA       0x01  // 'Enable Auto Acknowledgment' register address
//   82 #define EN_RXADDR   0x02  // 'Enabled RX addresses' register address
//   83 #define SETUP_AW    0x03  // 'Setup address width' register address
//   84 #define SETUP_RETR  0x04  // 'Setup Auto. Retrans' register address
//   85 #define RF_CH       0x05  // 'RF channel' register address
//   86 #define RF_SETUP    0x06  // 'RF setup' register address
//   87 #define STATUS      0x07  // 'Status' register address
//   88 #define OBSERVE_TX  0x08  // 'Observe TX' register address
//   89 #define CD          0x09  // 'Carrier Detect' register address
//   90 #define RX_ADDR_P0  0x0A  // 'RX address pipe0' register address
//   91 #define RX_ADDR_P1  0x0B  // 'RX address pipe1' register address
//   92 #define RX_ADDR_P2  0x0C  // 'RX address pipe2' register address
//   93 #define RX_ADDR_P3  0x0D  // 'RX address pipe3' register address
//   94 #define RX_ADDR_P4  0x0E  // 'RX address pipe4' register address
//   95 #define RX_ADDR_P5  0x0F  // 'RX address pipe5' register address
//   96 #define TX_ADDR     0x10  // 'TX address' register address
//   97 #define RX_PW_P0    0x11  // 'RX payload width, pipe0' register address
//   98 #define RX_PW_P1    0x12  // 'RX payload width, pipe1' register address
//   99 #define RX_PW_P2    0x13  // 'RX payload width, pipe2' register address
//  100 #define RX_PW_P3    0x14  // 'RX payload width, pipe3' register address
//  101 #define RX_PW_P4    0x15  // 'RX payload width, pipe4' register address
//  102 #define RX_PW_P5    0x16  // 'RX payload width, pipe5' register address
//  103 #define FIFO_STATUS 0x17  // 'FIFO Status Register' register address
//  104 
//  105 
//  106 /*
//  107  * 函数名：NRF_Init
//  108  * 描述  ：SPI的 I/O配置
//  109  * 输入  ：无
//  110  * 输出  ：无
//  111  * 调用  ：外部调用
//  112  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  113 void NRF_Init(void)
//  114 {
NRF_Init:
        PUSH     {R7,LR}
//  115 //------------------------------------------------------------------------------需改	
//  116     //配置NRF管脚复用
//  117     spi_init(NRF_SPI,MASTER);               //初始化SPI,主机模式
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       spi_init
//  118     
//  119     GPIO_Init(PORT_E,0, 1,0);           //初始化CE，默认进入待机模式
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       GPIO_Init
//  120     //gpio_init(PORTE,5, GPI,LOW);           //初始化IRQ管脚为输入 
//  121     GPIO_Init(PORT_E,4, 1,1);          //初始化PCSN管脚为输出，低电平选中  
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+4
        MOVS     R0,#+4
        BL       GPIO_Init
//  122     
//  123 #if IS_USE_ISR
//  124     exti_init(PORT_E,5, falling_up);        //初始化IRQ管脚为 :下降沿触发，内部上拉
//  125 #else
//  126     GPIO_Init(PORT_E,5, 0,0);           //初始化IRQ管脚为输入     
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+5
        MOVS     R0,#+4
        BL       GPIO_Init
//  127 #endif
//  128 //------------------------------------------------------------------------------    
//  129     //配置NRF寄存器
//  130     NRF_CE_LOW();///使能NRF模块	
        LDR.W    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  131     
//  132     NRF_WriteReg(NRF_WRITE_REG+SETUP_AW,ADR_WIDTH - 2);     //设置地址长度为 TX_ADR_WIDTH
        MOVS     R1,#+3
        MOVS     R0,#+35
        BL       NRF_WriteReg
//  133  
//  134     
//  135     NRF_WriteReg(NRF_WRITE_REG+RF_CH,CHANAL);               //设置RF通道为CHANAL
        MOVS     R1,#+0
        MOVS     R0,#+37
        BL       NRF_WriteReg
//  136 
//  137     NRF_WriteReg(NRF_WRITE_REG+RF_SETUP,0x0f);              //设置TX发射参数,0db增益,2Mbps,低噪声增益开启 
        MOVS     R1,#+15
        MOVS     R0,#+38
        BL       NRF_WriteReg
//  138  
//  139     NRF_WriteReg(NRF_WRITE_REG+EN_AA,0x01);//,0x01);                 //使能通道0的自动应答///通道0自动应答允许 
        MOVS     R1,#+1
        MOVS     R0,#+33
        BL       NRF_WriteReg
//  140 
//  141     NRF_WriteReg(NRF_WRITE_REG+EN_RXADDR,0x01);//,0x01);             //使能通道0的接收地址///接收数据通道0允许     
        MOVS     R1,#+1
        MOVS     R0,#+34
        BL       NRF_WriteReg
//  142 
//  143     //RX模式配置
//  144     //NRF_WriteBuf(NRF_WRITE_REG+RX_ADDR_P0,RX_ADDRESS,RX_ADR_WIDTH);//写RX节点地址
//  145 
//  146     NRF_WriteReg(NRF_WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH);    //选择通道0的有效数据宽度   
        MOVS     R1,#+32
        MOVS     R0,#+49
        BL       NRF_WriteReg
//  147 
//  148     //TX模式配置
//  149     //NRF_WriteBuf(NRF_WRITE_REG+TX_ADDR,TX_ADDRESS,TX_ADR_WIDTH);    //写TX节点地址 ,主要为了使能ACK   
//  150 
//  151     NRF_WriteReg(NRF_WRITE_REG+SETUP_RETR,0x0F);//,0x0f);            //设置自动重发间隔时间:250us + 86us;最大自动重发次数:15次
        MOVS     R1,#+15
        MOVS     R0,#+36
        BL       NRF_WriteReg
//  152 
//  153 #if IS_AUTO_RX_MODE
//  154     NRF_RX_Mode();          //默认进入接收模式
//  155 #endif
//  156     NRF_CE_HIGH();
        LDR.W    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  157 
//  158    while(NRF_Check() == 0);                            //检测无线模块是否插入：如果卡在这里，说明没检测到无线模块
??NRF_Init_0:
        BL       NRF_Check
        CMP      R0,#+0
        BEQ.N    ??NRF_Init_0
//  159     
//  160 }
        POP      {R0,PC}          ;; return
//  161 
//  162 
//  163 /*
//  164  * 函数名：NRF_WriteReg
//  165  * 描述  ：用于向NRF特定的寄存器写入数据
//  166  * 输入  ：reg:NRF的命令+寄存器地址。
//  167  		   dat:将要向寄存器写入的数据
//  168  * 输出  ：NRF的status寄存器的状态
//  169  * 调用  ：内部调用
//  170  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  171 uint8 NRF_WriteReg(uint8 reg,uint8 dat)
//  172 {
NRF_WriteReg:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
//  173  	uint8 status;
//  174 	 NRF_CE_LOW();
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        LDR.W    R2,??DataTable18  ;; 0x400ff100
        STR      R1,[R2, #+0]
//  175      
//  176    	 /*置低CSN，使能SPI传输*/
//  177     NRF_PCSN_LOW(); 
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x10
        LDR.W    R2,??DataTable18  ;; 0x400ff100
        STR      R1,[R2, #+0]
//  178      
//  179 	/*发送命令及寄存器号 */
//  180 	status = NRF_RW(reg);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF_RW
        MOVS     R5,R0
//  181 		 
//  182 	 /*向寄存器写入数据*/
//  183     NRF_RW(dat); 
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF_RW
//  184     
//  185 	/*CSN拉高，完成*/
//  186 	NRF_PCSN_HIGH();
        LDR.W    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  187     
//  188 	/*返回状态寄存器的值*/
//  189    	return(status);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  190 }
//  191 
//  192 
//  193 /*
//  194  * 函数名：NRF_ReadReg
//  195  * 描述  ：用于从NRF特定的寄存器读出数据
//  196  * 输入  ：reg:NRF的命令+寄存器地址。
//  197  * 输出  ：寄存器中的数据
//  198  * 调用  ：内部调用
//  199  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  200 uint8 NRF_ReadReg(uint8 reg)
//  201 {
NRF_ReadReg:
        PUSH     {R7,LR}
//  202  	uint8 reg_val;
//  203 
//  204 	NRF_CE_LOW();
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        LDR.W    R2,??DataTable18  ;; 0x400ff100
        STR      R1,[R2, #+0]
//  205     
//  206    	 /*置低CSN，使能SPI传输*/
//  207     NRF_PCSN_LOW(); 
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x10
        LDR.W    R2,??DataTable18  ;; 0x400ff100
        STR      R1,[R2, #+0]
//  208 				
//  209   	 /*发送寄存器号*/
//  210 	NRF_RW(reg); 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF_RW
//  211 
//  212 	 /*读取寄存器的值 */
//  213 	reg_val = NRF_RW(NOP);
        MOVS     R0,#+255
        BL       NRF_RW
//  214     
//  215 	/*CSN拉高，完成*/
//  216 	NRF_PCSN_HIGH();
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10
        LDR.W    R2,??DataTable18  ;; 0x400ff100
        STR      R1,[R2, #+0]
//  217     
//  218 	return reg_val;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return
//  219 }
//  220 
//  221 /*
//  222  * 函数名：NRF_WriteBuf
//  223  * 描述  ：用于向NRF的寄存器中写入一串数据
//  224  * 输入  ：reg:NRF的命令+寄存器地址。
//  225  		   pBuf：存储了将要写入写寄存器数据的数组，外部定义
//  226 		   bytes: pBuf的数据长度	
//  227  * 输出  ：NRF的status寄存器的状态
//  228  * 调用  ：外部调用
//  229  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  230 uint8 NRF_WriteBuf(uint8 reg ,uint8 *pBuf,uint32 len)
//  231 {
NRF_WriteBuf:
        PUSH     {R4-R6,LR}
        MOVS     R4,R1
        MOVS     R5,R2
//  232 	 uint8 status;
//  233      
//  234    	 /*置低CSN，使能SPI传输*/
//  235     NRF_PCSN_LOW(); 
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x10
        LDR.W    R2,??DataTable18  ;; 0x400ff100
        STR      R1,[R2, #+0]
//  236     
//  237     /*发送寄存器号*/	
//  238      status= NRF_RW(reg);      //continue,即不会取消片选
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF_RW
        MOVS     R6,R0
//  239 
//  240     /*向缓冲区写入数据*/
//  241     spi_send(NRF_SPI,pBuf,len);	
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,#+1
        BL       spi_send
//  242     
//  243   	/*CSN拉高，完成*/
//  244 	NRF_PCSN_HIGH();    
        LDR.W    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  245   	return (status);	//返回NRF24L01的状态 		
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
//  246 }
//  247 
//  248 
//  249 /*
//  250  * 函数名：NRF_ReadBuf
//  251  * 描述  ：用于从NRF的寄存器中读出一串数据
//  252  * 输入  ：reg:NRF的命令+寄存器地址。
//  253  		   pBuf：用于存储将被读出的寄存器数据的数组，外部定义
//  254 		   bytes: pBuf的数据长度	
//  255  * 输出  ：NRF的status寄存器的状态
//  256  * 调用  ：外部调用
//  257  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  258 uint8 NRF_ReadBuf(uint8 reg,uint8 *pBuf,uint8 len)
//  259 {
NRF_ReadBuf:
        PUSH     {R4-R6,LR}
        MOVS     R4,R1
        MOVS     R5,R2
//  260  	uint8 status, byte_cnt;
//  261    // u8 time=0xff;
//  262     NRF_CE_LOW();
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        LDR.W    R2,??DataTable18  ;; 0x400ff100
        STR      R1,[R2, #+0]
//  263     
//  264    	 /*置低CSN，使能SPI传输*/
//  265     NRF_PCSN_LOW(); 
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x10
        LDR.W    R2,??DataTable18  ;; 0x400ff100
        STR      R1,[R2, #+0]
//  266     
//  267     for(byte_cnt = 0 ;byte_cnt < len;byte_cnt++)
        MOVS     R1,#+0
        B.N      ??NRF_ReadBuf_0
//  268     {
//  269         pBuf[byte_cnt] = NOP;
??NRF_ReadBuf_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R2,#+255
        STRB     R2,[R1, R4]
//  270     }
        ADDS     R1,R1,#+1
??NRF_ReadBuf_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R1,R5
        BCC.N    ??NRF_ReadBuf_1
//  271     
//  272 	/*发送寄存器号*/	
//  273 	status = NRF_RW(reg); 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       NRF_RW
        MOVS     R6,R0
//  274 
//  275  	/*读取缓冲区数据*/
//  276     spi_WR(NRF_SPI,pBuf,len);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,#+1
        BL       spi_WR
//  277     
//  278 	/*CSN拉高，完成*/
//  279 	NRF_PCSN_HIGH();
        LDR.W    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  280     
//  281  	return status;		//返回寄存器状态值
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
//  282 }
//  283 
//  284 
//  285 /*
//  286  * 函数名：NRF_RW
//  287  * 描述  ：用于向NRF读/写一字节数据
//  288  * 输入  ：写入的数据
//  289  * 输出  ：读取得的数据
//  290  * 调用  ：内部调用
//  291  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  292 uint8 NRF_RW(uint8 dat)
//  293 { 
NRF_RW:
        PUSH     {R0,LR}
//  294     spi_WR(NRF_SPI,&dat,1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        MOVS     R0,#+1
        BL       spi_WR
//  295     return  dat;
        LDRB     R0,[SP, #+0]
        POP      {R1,PC}          ;; return
//  296 }
//  297 
//  298 /*
//  299  * 函数名：NRF_Check
//  300  * 描述  ：主要用于NRF与MCU是否正常连接
//  301  * 输入  ：无	
//  302  * 输出  ：SUCCESS/ERROR 连接正常/连接失败
//  303  * 调用  ：外部调用
//  304  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  305 uint8 NRF_Check(void)
//  306 {
NRF_Check:
        PUSH     {LR}
        SUB      SP,SP,#+20
//  307 #define NRF_CHECH_DATA  0xC2
//  308 	uint8 buf[5]={NRF_CHECH_DATA,NRF_CHECH_DATA,NRF_CHECH_DATA,NRF_CHECH_DATA,NRF_CHECH_DATA};
        ADD      R0,SP,#+8
        LDR.W    R1,??DataTable18_1
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  309 	uint8 buf1[5];
//  310 	uint8 i; 
//  311 
//  312 	/*写入5个字节的地址.  */ 
//  313     NRF_WriteBuf(NRF_WRITE_REG+TX_ADDR,buf,5);
        MOVS     R2,#+5
        ADD      R1,SP,#+8
        MOVS     R0,#+48
        BL       NRF_WriteBuf
//  314     
//  315 	/*读出写入的地址 */
//  316 	NRF_ReadBuf(TX_ADDR,buf1,5); 
        MOVS     R2,#+5
        ADD      R1,SP,#+0
        MOVS     R0,#+16
        BL       NRF_ReadBuf
//  317 	
//  318 	/*比较*/
//  319 	for(i=0;i<5;i++)
        MOVS     R0,#+0
        B.N      ??NRF_Check_0
??NRF_Check_1:
        ADDS     R0,R0,#+1
??NRF_Check_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BCS.N    ??NRF_Check_2
//  320 	{
//  321 		if(buf1[i] != NRF_CHECH_DATA)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      R1,SP,#+0
        LDRB     R1,[R0, R1]
        CMP      R1,#+194
        BEQ.N    ??NRF_Check_1
//  322         {
//  323             return 0 ;        //MCU与NRF不正常连接
        MOVS     R0,#+0
        B.N      ??NRF_Check_3
//  324         }
//  325 	} 
//  326 	return 1 ;             //MCU与NRF成功连接 	
??NRF_Check_2:
        MOVS     R0,#+1
??NRF_Check_3:
        ADD      SP,SP,#+20
        POP      {PC}             ;; return
//  327 }
//  328 
//  329 //传输一次，数据最长为 32字节

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  330 static uint8 NRF_TX_Dat_Once(uint8 *txbuf)
//  331 {
NRF_TX_Dat_Once:
        PUSH     {R4,LR}
//  332 	uint8 state;
//  333 
//  334     /*ce为低，进入待机模式1*/
//  335 	NRF_CE_LOW();
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        LDR.W    R2,??DataTable18  ;; 0x400ff100
        STR      R1,[R2, #+0]
//  336     
//  337 	/*写数据到TX BUF 最大 32个字节*/						
//  338     NRF_WriteBuf(WR_TX_PLOAD,txbuf,MAX_ONCE_TX_NUM);
        MOVS     R2,#+32
        MOVS     R1,R0
        MOVS     R0,#+160
        BL       NRF_WriteBuf
//  339 
//  340     /*CE为高，txbuf非空，发送数据包 */   
//  341     NRF_CE_HIGH();
        LDR.W    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  342 	
//  343 	/*等待发送完成中断 */                            
//  344 	while(NRF_Read_IRQ()!=0);
??NRF_TX_Dat_Once_0:
        LDR.W    R0,??DataTable18_2  ;; 0x400ff110
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+5,#+1
        LSLS     R0,R0,#+31
        BMI.N    ??NRF_TX_Dat_Once_0
//  345 	
//  346 	/*读取状态寄存器的值 */                              
//  347 	state = NRF_ReadReg(STATUS);
        MOVS     R0,#+7
        BL       NRF_ReadReg
        MOVS     R4,R0
//  348 
//  349 	 /*清除TX_DS或MAX_RT中断标志*/                  
//  350 	NRF_WriteReg(NRF_WRITE_REG+STATUS,state); 	
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+39
        BL       NRF_WriteReg
//  351 
//  352 	NRF_WriteReg(FLUSH_TX,NOP);    //清除TX FIFO寄存器 
        MOVS     R1,#+255
        MOVS     R0,#+225
        BL       NRF_WriteReg
//  353 
//  354 	 /*判断中断类型*/   
//  355     return state;
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//  356 }
//  357 
//  358  /*
//  359  * 函数名：NRF_Tx_Dat
//  360  * 描述  ：用于向NRF的发送缓冲区中写入数据
//  361  * 输入  ：txBuf：存储了将要发送的数据的数组，外部定义	
//  362  * 输出  ：发送结果，成功返回TXDS,失败返回MAXRT或ERROR
//  363  * 调用  ：外部调用
//  364  */ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  365 uint8 NRF_Tx_Dat(uint8 *txbuf,uint32 len)
//  366 {
NRF_Tx_Dat:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R6,R1
//  367     uint8 state;  
//  368     uint32 L;
//  369   
//  370     if( nrf_mode != TX_MODE)
        LDR.W    R0,??DataTable18_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??NRF_Tx_Dat_0
//  371     {
//  372         NRF_TX_Mode();
        BL       NRF_TX_Mode
//  373     }
//  374     
//  375     L = (len+MAX_ONCE_TX_NUM-1) / MAX_ONCE_TX_NUM ; //进位取整
??NRF_Tx_Dat_0:
        ADDS     R0,R6,#+31
        LSRS     R6,R0,#+5
        B.N      ??NRF_Tx_Dat_1
//  376     
//  377     while(L--)
//  378     {
//  379         state = NRF_TX_Dat_Once(txbuf);
//  380         if( !(state & TX_DS))             //如果发送不成功，则结束
//  381         {
//  382             break;          //跳出while循环
//  383         }
//  384         txbuf += MAX_ONCE_TX_NUM;       //修正指向的位置
??NRF_Tx_Dat_2:
        ADDS     R4,R4,#+32
??NRF_Tx_Dat_1:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??NRF_Tx_Dat_3
        MOVS     R0,R4
        BL       NRF_TX_Dat_Once
        MOVS     R5,R0
        LSLS     R0,R5,#+26
        BMI.N    ??NRF_Tx_Dat_2
//  385     }
//  386 
//  387 #if IS_AUTO_RX_MODE     //自动进入接收模式
//  388     NRF_RX_Mode();      
//  389 #endif
//  390     
//  391     return state;
??NRF_Tx_Dat_3:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return
//  392 } 
//  393 
//  394  /*
//  395  * 函数名：NRF_Tx_Dat
//  396  * 描述  ：用于向NRF的发送缓冲区中写入数据
//  397  * 输入  ：txBuf：存储了将要发送的数据的数组，外部定义	
//  398  * 输出  ：发送结果，成功返回TXDS,失败返回MAXRT或ERROR
//  399  * 调用  ：外部调用
//  400  */ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  401 void NRF_ISR_Tx_Dat(uint8 *txbuf,uint32 len)
//  402 {
NRF_ISR_Tx_Dat:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  403     uint32 L = (len+ MAX_ONCE_TX_NUM -1)/MAX_ONCE_TX_NUM;
        ADDS     R0,R1,#+31
        LSRS     R5,R0,#+5
//  404     
//  405     if( nrf_mode != TX_MODE)
        LDR.W    R0,??DataTable18_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??NRF_ISR_Tx_Dat_0
//  406     {
//  407         NRF_TX_Mode();
        BL       NRF_TX_Mode
//  408     }
//  409     
//  410     while(isr_L != 0);          //等待isr_L 为 0 ，即 发送完毕
??NRF_ISR_Tx_Dat_0:
        LDR.W    R0,??DataTable18_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??NRF_ISR_Tx_Dat_0
//  411     
//  412     isr_addr    = txbuf;
        LDR.W    R0,??DataTable18_5
        STR      R4,[R0, #+0]
//  413     isr_L       = L;
        LDR.W    R0,??DataTable18_4
        STR      R5,[R0, #+0]
//  414     
//  415     NRF_ISR_Tx_Dat_Once();      //激活一次发送，此后的发送由中断来调用
        BL       NRF_ISR_Tx_Dat_Once
//  416 } 
        POP      {R0,R4,R5,PC}    ;; return
//  417 
//  418 
//  419 //由中断服务函数调用

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  420 void NRF_ISR_Tx_Handler(void)
//  421 {
NRF_ISR_Tx_Handler:
        PUSH     {R7,LR}
//  422     if(isr_addr == NULL)
        LDR.W    R0,??DataTable18_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??NRF_ISR_Tx_Handler_0
//  423     {
//  424         return;         //无效
//  425     }
//  426     
//  427     //检测发送结果                
//  428 	isr_state = NRF_ReadReg(STATUS);                    /*读取状态寄存器的值 */  
??NRF_ISR_Tx_Handler_1:
        MOVS     R0,#+7
        BL       NRF_ReadReg
        LDR.W    R1,??DataTable18_6
        STRB     R0,[R1, #+0]
//  429 
//  430 	NRF_WriteReg(NRF_WRITE_REG+STATUS,isr_state); 	    /*清除TX_DS或MAX_RT中断标志*/    
        LDR.W    R0,??DataTable18_6
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+39
        BL       NRF_WriteReg
//  431 
//  432 	NRF_WriteReg(FLUSH_TX,NOP);                         //清除TX FIFO寄存器 
        MOVS     R1,#+255
        MOVS     R0,#+225
        BL       NRF_WriteReg
//  433     
//  434     if( (!(isr_state & TX_DS) ) || (isr_L==0) )         //如果发送不成功,或者已经发送完成，则结束
        LDR.W    R0,??DataTable18_6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??NRF_ISR_Tx_Handler_2
        LDR.W    R0,??DataTable18_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??NRF_ISR_Tx_Handler_3
//  435     {
//  436         isr_addr = NULL;                                //通过判断 isr_addr 就知道是否发送完毕。
??NRF_ISR_Tx_Handler_2:
        LDR.W    R0,??DataTable18_5
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  437         isr_L    = 0;                                   //isr_L就不一定了
        LDR.W    R0,??DataTable18_4
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  438         return;                                         //通过 isr_state 判断状态
        B.N      ??NRF_ISR_Tx_Handler_0
//  439     }
//  440     
//  441     //还没发送完成，就继续发送
//  442     isr_addr += MAX_ONCE_TX_NUM;       //指向下一个地址
??NRF_ISR_Tx_Handler_3:
        LDR.W    R0,??DataTable18_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+32
        LDR.W    R1,??DataTable18_5
        STR      R0,[R1, #+0]
//  443     
//  444     NRF_ISR_Tx_Dat_Once();
        BL       NRF_ISR_Tx_Dat_Once
//  445 }
??NRF_ISR_Tx_Handler_0:
        POP      {R0,PC}          ;; return
//  446 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  447 void nrf_cpy( uint8 * dst, uint8 * src, uint32 count)
//  448 {
nrf_cpy:
        PUSH     {R4,R5}
//  449       uint32 n = (count + 7 ) / 8 ;
        ADDS     R3,R2,#+7
        LSRS     R3,R3,#+3
//  450       switch (count % 8 ) {
        MOVS     R4,#+8
        UDIV     R5,R2,R4
        MLS      R5,R5,R4,R2
        CMP      R5,#+0
        BEQ.N    ??nrf_cpy_0
        CMP      R5,#+2
        BEQ.N    ??nrf_cpy_1
        BCC.N    ??nrf_cpy_2
        CMP      R5,#+4
        BEQ.N    ??nrf_cpy_3
        BCC.N    ??nrf_cpy_4
        CMP      R5,#+6
        BEQ.N    ??nrf_cpy_5
        BCC.N    ??nrf_cpy_6
        CMP      R5,#+7
        BEQ.N    ??nrf_cpy_7
        B.N      ??nrf_cpy_8
//  451       case 0 :   do {   * dst ++ = * src ++ ;
??nrf_cpy_0:
        LDRB     R2,[R1, #+0]
        STRB     R2,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  452       case 7 :          * dst ++ = * src ++ ;
??nrf_cpy_7:
        LDRB     R2,[R1, #+0]
        STRB     R2,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  453       case 6 :          * dst ++ = * src ++ ;
??nrf_cpy_5:
        LDRB     R2,[R1, #+0]
        STRB     R2,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  454       case 5 :          * dst ++ = * src ++ ;
??nrf_cpy_6:
        LDRB     R2,[R1, #+0]
        STRB     R2,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  455       case 4 :          * dst ++ = * src ++ ;
??nrf_cpy_3:
        LDRB     R2,[R1, #+0]
        STRB     R2,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  456       case 3 :          * dst ++ = * src ++ ;
??nrf_cpy_4:
        LDRB     R2,[R1, #+0]
        STRB     R2,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  457       case 2 :          * dst ++ = * src ++ ;
??nrf_cpy_1:
        LDRB     R2,[R1, #+0]
        STRB     R2,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  458       case 1 :          * dst ++ = * src ++ ;
??nrf_cpy_2:
        LDRB     R2,[R1, #+0]
        STRB     R2,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
//  459                 } while ( -- n >    0 );
        SUBS     R3,R3,#+1
        CMP      R3,#+0
        BNE.N    ??nrf_cpy_0
//  460       }
//  461 }  
??nrf_cpy_8:
        POP      {R4,R5}
        BX       LR               ;; return
//  462 
//  463 //中断发送函数，仅仅发送一次，就等待中断发送

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  464 void NRF_ISR_Tx_Dat_Once(void)
//  465 {
NRF_ISR_Tx_Dat_Once:
        PUSH     {R7,LR}
//  466     if(isr_L > 0)
        LDR.N    R0,??DataTable18_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??NRF_ISR_Tx_Dat_Once_0
//  467     {
//  468         /*ce为低，进入待机模式1*/
//  469         NRF_CE_LOW();
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  470 
//  471         /*写数据到TX BUF 最大 32个字节*/						
//  472         NRF_WriteBuf(WR_TX_PLOAD,(uint8 *)isr_addr,MAX_ONCE_TX_NUM);
        MOVS     R2,#+32
        LDR.N    R0,??DataTable18_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+160
        BL       NRF_WriteBuf
//  473 
//  474         /*CE为高，txbuf非空，发送数据包 */   
//  475         NRF_CE_HIGH();
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  476 
//  477         isr_L--;
        LDR.N    R0,??DataTable18_4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable18_4
        STR      R0,[R1, #+0]
//  478     }
//  479 }
??NRF_ISR_Tx_Dat_Once_0:
        POP      {R0,PC}          ;; return
//  480 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  481 uint8 NRF_ISR_Tx_State(void)
//  482 {
//  483     if( nrf_mode != TX_MODE)
NRF_ISR_Tx_State:
        LDR.N    R0,??DataTable18_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??NRF_ISR_Tx_State_0
//  484     {
//  485         return TX_ISR_NULL;     //不是发送模式，没发送
        MOVS     R0,#+0
        B.N      ??NRF_ISR_Tx_State_1
//  486     }
//  487     
//  488     if( isr_addr == NULL)
??NRF_ISR_Tx_State_0:
        LDR.N    R0,??DataTable18_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??NRF_ISR_Tx_State_2
//  489     {
//  490         if(isr_state & TX_DS) 
        LDR.N    R0,??DataTable18_6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??NRF_ISR_Tx_State_3
//  491         {
//  492             return TX_ISR_SUCCEED;  //发送成功
        MOVS     R0,#+2
        B.N      ??NRF_ISR_Tx_State_1
//  493         }
//  494         
//  495         if(isr_state != 0)
??NRF_ISR_Tx_State_3:
        LDR.N    R0,??DataTable18_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??NRF_ISR_Tx_State_4
//  496         {
//  497             return TX_ISR_FAIL; //发送失败
        MOVS     R0,#+3
        B.N      ??NRF_ISR_Tx_State_1
//  498         }
//  499         
//  500         return TX_ISR_NULL;     //没发送
??NRF_ISR_Tx_State_4:
        MOVS     R0,#+0
        B.N      ??NRF_ISR_Tx_State_1
//  501     }
//  502     else
//  503     {
//  504         return TX_ISR_SEND;     //发送中
??NRF_ISR_Tx_State_2:
        MOVS     R0,#+1
??NRF_ISR_Tx_State_1:
        BX       LR               ;; return
//  505     }
//  506 }
//  507 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  508 void NRF_Handler(void)
//  509 {
NRF_Handler:
        PUSH     {R7,LR}
//  510     if( nrf_mode == TX_MODE)
        LDR.N    R0,??DataTable18_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??NRF_Handler_0
//  511     {
//  512         NRF_ISR_Tx_Handler();
        BL       NRF_ISR_Tx_Handler
        B.N      ??NRF_Handler_1
//  513     }
//  514     else if( nrf_mode == RX_MODE )
??NRF_Handler_0:
        LDR.N    R0,??DataTable18_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??NRF_Handler_1
//  515     {
//  516         NRF_ISR_Rx_Handler();
        BL       NRF_ISR_Rx_Handler
//  517     }
//  518 }
??NRF_Handler_1:
        POP      {R0,PC}          ;; return
//  519 
//  520  /*
//  521  * 函数名：NRF_Rx_Dat
//  522  * 描述  ：用于从NRF的接收缓冲区中读出数据
//  523  * 输入  ：rxBuf：用于接收该数据的数组，外部定义	
//  524  * 输出  ：接收结果，
//  525  * 调用  ：外部调用
//  526  */ 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  527 uint8 NRF_Rx_Dat(uint8 *rxbuf)
//  528 {
NRF_Rx_Dat:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  529 	uint8 state; 
//  530     
//  531     if( nrf_mode != RX_MODE)
        LDR.N    R0,??DataTable18_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ.N    ??NRF_Rx_Dat_0
//  532     {
//  533         NRF_RX_Mode();
        BL       NRF_RX_Mode
//  534     }
//  535     
//  536 	NRF_CE_HIGH();	 //进入接收状态
??NRF_Rx_Dat_0:
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  537 	 /*等待接收中断*/
//  538 	while(NRF_Read_IRQ()!=0); 
??NRF_Rx_Dat_1:
        LDR.N    R0,??DataTable18_2  ;; 0x400ff110
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+5,#+1
        LSLS     R0,R0,#+31
        BMI.N    ??NRF_Rx_Dat_1
//  539 	
//  540 	NRF_CE_LOW();  	 //进入待机状态
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  541 	/*读取status寄存器的值  */               
//  542 	state=NRF_ReadReg(STATUS);
        MOVS     R0,#+7
        BL       NRF_ReadReg
        MOVS     R5,R0
//  543 	 
//  544 	/* 清除中断标志*/      
//  545 	NRF_WriteReg(NRF_WRITE_REG+STATUS,state);
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+39
        BL       NRF_WriteReg
//  546 
//  547 	/*判断是否接收到数据*/
//  548 	if(state & RX_DR)                                 //接收到数据
        LSLS     R0,R5,#+25
        BPL.N    ??NRF_Rx_Dat_2
//  549 	{
//  550 	    NRF_ReadBuf(RD_RX_PLOAD,rxbuf,RX_PLOAD_WIDTH);//读取数据
        MOVS     R2,#+32
        MOVS     R1,R4
        MOVS     R0,#+97
        BL       NRF_ReadBuf
//  551 	    NRF_WriteReg(FLUSH_RX,NOP);                     //清除RX FIFO寄存器
        MOVS     R1,#+255
        MOVS     R0,#+226
        BL       NRF_WriteReg
//  552 	    return RX_DR; 
        MOVS     R0,#+64
        B.N      ??NRF_Rx_Dat_3
//  553 	}
//  554 	else
//  555     {
//  556 		return ERROR;                    //没收到任何数据
??NRF_Rx_Dat_2:
        MOVS     R0,#+0
??NRF_Rx_Dat_3:
        POP      {R1,R4,R5,PC}    ;; return
//  557     }
//  558 }
//  559 
//  560 //由中断服务函数调用

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  561 void NRF_ISR_Rx_Handler(void)
//  562 {
NRF_ISR_Rx_Handler:
        PUSH     {R4,LR}
//  563     uint8 state;
//  564     
//  565 	NRF_CE_LOW();  	 //进入待机状态
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  566     
//  567 	/*读取status寄存器的值  */               
//  568 	state=NRF_ReadReg(STATUS);
        MOVS     R0,#+7
        BL       NRF_ReadReg
        MOVS     R4,R0
//  569 	 
//  570 	/* 清除中断标志*/      
//  571 	NRF_WriteReg(NRF_WRITE_REG+STATUS,state);
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+39
        BL       NRF_WriteReg
//  572     
//  573     if(re_flag == QUEUE_FULL)       //满了就直接清FIFO，退出
        LDR.N    R0,??DataTable18_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??NRF_ISR_Rx_Handler_0
//  574     {
//  575         NRF_WriteReg(FLUSH_RX,NOP);                     //清除RX FIFO寄存器
        MOVS     R1,#+255
        MOVS     R0,#+226
        BL       NRF_WriteReg
//  576         NRF_CE_HIGH();  	 //进入接收模式
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  577         return;       //接收队列满了，不进行处理
        B.N      ??NRF_ISR_Rx_Handler_1
//  578     }
//  579     
//  580     //还没满，则继续接收
//  581 
//  582 	/*判断是否接收到数据*/
//  583 	if(state & RX_DR)                                 //接收到数据
??NRF_ISR_Rx_Handler_0:
        LSLS     R0,R4,#+25
        BPL.N    ??NRF_ISR_Rx_Handler_2
//  584 	{
//  585 	    NRF_ReadBuf(RD_RX_PLOAD,(uint8 *)&(RX_ISR_FIFO[rear]),RX_PLOAD_WIDTH);  //读取数据
        MOVS     R2,#+32
        LDR.N    R0,??DataTable18_8
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable18_9
        ADDS     R1,R1,R0, LSL #+5
        MOVS     R0,#+97
        BL       NRF_ReadBuf
//  586 	    NRF_WriteReg(FLUSH_RX,NOP);                     //清除RX FIFO寄存器
        MOVS     R1,#+255
        MOVS     R0,#+226
        BL       NRF_WriteReg
//  587 
//  588         rear++;
        LDR.N    R0,??DataTable18_8
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable18_8
        STRB     R0,[R1, #+0]
//  589         
//  590         if(rear >= RX_ISR_FIFO_PACKET)
        LDR.N    R0,??DataTable18_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+20
        BCC.N    ??NRF_ISR_Rx_Handler_3
//  591         {
//  592             rear=0;                         //重头开始
        LDR.N    R0,??DataTable18_8
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  593         }
//  594         
//  595         if(rear == front)                   //追到屁股了，满了
??NRF_ISR_Rx_Handler_3:
        LDR.N    R0,??DataTable18_8
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable18_10
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??NRF_ISR_Rx_Handler_4
//  596         {
//  597             re_flag = QUEUE_FULL;   
        LDR.N    R0,??DataTable18_7
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
        B.N      ??NRF_ISR_Rx_Handler_2
//  598         }
//  599         else
//  600         {
//  601             re_flag = QUEUE_NORMAL;
??NRF_ISR_Rx_Handler_4:
        LDR.N    R0,??DataTable18_7
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  602         } 
//  603 	}
//  604 	else    
//  605     {
//  606 		                  //没收到任何数据
//  607     }
//  608     
//  609     NRF_CE_HIGH();  	 //进入接收模式
??NRF_ISR_Rx_Handler_2:
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  610 
//  611 }
??NRF_ISR_Rx_Handler_1:
        POP      {R4,PC}          ;; return
//  612 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  613 void    NRF_ISR_Rx_rst()
//  614 {
//  615     front = 0;
NRF_ISR_Rx_rst:
        LDR.N    R0,??DataTable18_10
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  616     rear =0;
        LDR.N    R0,??DataTable18_8
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  617     re_flag = QUEUE_EMPTY;
        LDR.N    R0,??DataTable18_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  618 }
        BX       LR               ;; return
//  619 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  620 uint8  NRF_ISR_Rx_Dat(uint8 *rxbuf)
//  621 {
NRF_ISR_Rx_Dat:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  622     
//  623     if( nrf_mode != RX_MODE)
        LDR.N    R0,??DataTable18_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ.N    ??NRF_ISR_Rx_Dat_0
//  624     {
//  625         NRF_RX_Mode();
        BL       NRF_RX_Mode
        B.N      ??NRF_ISR_Rx_Dat_1
//  626     }
//  627     else
//  628     {
//  629         NRF_CE_HIGH();	 //进入接收状态
??NRF_ISR_Rx_Dat_0:
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  630     }
//  631     
//  632     if(re_flag == QUEUE_EMPTY)   //空，直接返回0
??NRF_ISR_Rx_Dat_1:
        LDR.N    R0,??DataTable18_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??NRF_ISR_Rx_Dat_2
//  633     {
//  634         return 0;
        MOVS     R0,#+0
        B.N      ??NRF_ISR_Rx_Dat_3
//  635     }
//  636 
//  637     //复制数据
//  638     nrf_cpy(rxbuf,(uint8 *)&(RX_ISR_FIFO[front]),MAX_ONCE_TX_NUM);
??NRF_ISR_Rx_Dat_2:
        MOVS     R2,#+32
        LDR.N    R0,??DataTable18_10
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable18_9
        ADDS     R1,R1,R0, LSL #+5
        MOVS     R0,R4
        BL       nrf_cpy
//  639     
//  640     NRF_CE_LOW();  	 //进入待机状态
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  641     
//  642     front++;                //由于非空，所以可以直接出队列
        LDR.N    R0,??DataTable18_10
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable18_10
        STRB     R0,[R1, #+0]
//  643     
//  644     if(front >= RX_ISR_FIFO_PACKET)
        LDR.N    R0,??DataTable18_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+20
        BCC.N    ??NRF_ISR_Rx_Dat_4
//  645     {
//  646         front=0;            //重头开始
        LDR.N    R0,??DataTable18_10
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  647     }
//  648     
//  649     if(front == rear)       //追到屁股了，接收队列空
??NRF_ISR_Rx_Dat_4:
        LDR.N    R0,??DataTable18_10
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable18_8
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??NRF_ISR_Rx_Dat_5
//  650     {
//  651         re_flag = QUEUE_EMPTY;
        LDR.N    R0,??DataTable18_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  652 //        front=0;            //重头开始(可以省掉)
//  653 //        rear=0;
//  654     }
//  655     
//  656     NRF_CE_HIGH();  	 //进入接收模式
??NRF_ISR_Rx_Dat_5:
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  657     
//  658     return RX_DR;
        MOVS     R0,#+64
??NRF_ISR_Rx_Dat_3:
        POP      {R4,PC}          ;; return
//  659     
//  660 }
//  661 
//  662 /*
//  663  * 函数名：NRF_RX_Mode
//  664  * 描述  ：配置并进入接收模式
//  665  * 输入  ：无	
//  666  * 输出  ：无
//  667  * 调用  ：外部调用
//  668  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  669 void NRF_RX_Mode(void)
//  670 {
NRF_RX_Mode:
        PUSH     {R7,LR}
//  671 	NRF_CE_LOW();	
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  672     
//  673     NRF_WriteReg(NRF_WRITE_REG+EN_AA,0x01);             //使能通道0的自动应答  
        MOVS     R1,#+1
        MOVS     R0,#+33
        BL       NRF_WriteReg
//  674     
//  675     NRF_WriteReg(NRF_WRITE_REG+EN_RXADDR,0x01);         //使能通道0的接收地址 
        MOVS     R1,#+1
        MOVS     R0,#+34
        BL       NRF_WriteReg
//  676     
//  677     NRF_WriteBuf(NRF_WRITE_REG+RX_ADDR_P0,RX_ADDRESS,RX_ADR_WIDTH);//写RX节点地址
        MOVS     R2,#+5
        LDR.N    R1,??DataTable18_11
        MOVS     R0,#+42
        BL       NRF_WriteBuf
//  678     
//  679     
//  680     NRF_WriteReg(NRF_WRITE_REG+CONFIG, 0x0B | (IS_CRC16<<2));           //配置基本工作模式的参数;PWR_UP,EN_CRC,16BIT_CRC,接收模式 
        MOVS     R1,#+15
        MOVS     R0,#+32
        BL       NRF_WriteReg
//  681 
//  682 #if 1
//  683     /* 清除中断标志*/      
//  684 	NRF_WriteReg(NRF_WRITE_REG+STATUS,0xff);
        MOVS     R1,#+255
        MOVS     R0,#+39
        BL       NRF_WriteReg
//  685     
//  686     NRF_WriteReg(FLUSH_RX,NOP);                     //清除RX FIFO寄存器
        MOVS     R1,#+255
        MOVS     R0,#+226
        BL       NRF_WriteReg
//  687 #endif    
//  688     
//  689     /*CE拉高，进入接收模式*/	
//  690     NRF_CE_HIGH();
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  691     
//  692     nrf_mode = RX_MODE;
        LDR.N    R0,??DataTable18_3
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  693 }
        POP      {R0,PC}          ;; return
//  694 
//  695 extern uint8 state,fifostatu;
//  696 
//  697 /*
//  698  * 函数名：NRF_TX_Mode
//  699  * 描述  ：配置发送模式
//  700  * 输入  ：无	
//  701  * 输出  ：无
//  702  * 调用  ：外部调用
//  703  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  704 void NRF_TX_Mode(void)
//  705 {  
NRF_TX_Mode:
        PUSH     {R7,LR}
//  706     uint32 i;
//  707 
//  708     NRF_CE_LOW();		
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  709      
//  710     NRF_WriteBuf(NRF_WRITE_REG+TX_ADDR,TX_ADDRESS,TX_ADR_WIDTH);    //写TX节点地址 
        MOVS     R2,#+5
        LDR.N    R1,??DataTable18_12
        MOVS     R0,#+48
        BL       NRF_WriteBuf
//  711   
//  712     NRF_WriteBuf(NRF_WRITE_REG+RX_ADDR_P0,RX_ADDRESS,RX_ADR_WIDTH); //设置RX节点地址 ,主要为了使能ACK   
        MOVS     R2,#+5
        LDR.N    R1,??DataTable18_11
        MOVS     R0,#+42
        BL       NRF_WriteBuf
//  713    
//  714     NRF_WriteReg(NRF_WRITE_REG+CONFIG,0x0A | (IS_CRC16<<2));    //配置基本工作模式的参数;PWR_UP,EN_CRC,16BIT_CRC,发射模式,开启所有中断
        MOVS     R1,#+14
        MOVS     R0,#+32
        BL       NRF_WriteReg
//  715  
//  716     /*CE拉高，进入发送模式*/
//  717     NRF_CE_HIGH();
        LDR.N    R0,??DataTable18  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable18  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  718 
//  719     i=0xffff;
        MOVW     R0,#+65535
//  720     while(i--);         //CE要拉高一段时间才进入发送模式
??NRF_TX_Mode_0:
        MOVS     R1,R0
        SUBS     R0,R1,#+1
        CMP      R1,#+0
        BNE.N    ??NRF_TX_Mode_0
//  721     Delay_ms(1);
        MOVS     R0,#+1
        BL       Delay_ms
//  722 	
//  723 	
//  724 
//  725     nrf_mode = TX_MODE;
        LDR.N    R0,??DataTable18_3
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  726 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_1:
        DC32     `?<Constant {194, 194, 194, 194, 194}>`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_2:
        DC32     0x400ff110

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_3:
        DC32     nrf_mode

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_4:
        DC32     isr_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_5:
        DC32     isr_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_6:
        DC32     isr_state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_7:
        DC32     re_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_8:
        DC32     rear

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_9:
        DC32     RX_ISR_FIFO

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_10:
        DC32     front

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_11:
        DC32     RX_ADDRESS

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_12:
        DC32     TX_ADDRESS

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant {194, 194, 194, 194, 194}>`:
        DATA
        DC8 194, 194, 194, 194, 194, 0, 0, 0

        END
// 
//   685 bytes in section .bss
//    16 bytes in section .data
//     8 bytes in section .rodata
// 1 714 bytes in section .text
// 
// 1 714 bytes of CODE  memory
//     8 bytes of CONST memory
//   701 bytes of DATA  memory
//
//Errors: none
//Warnings: 6
