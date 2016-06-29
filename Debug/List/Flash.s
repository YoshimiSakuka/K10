///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:50
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\Flash.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\Flash.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\Flash.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Angle_Kd
        EXTERN Angle_Kp
        EXTERN D_D
        EXTERN D_I
        EXTERN D_P
        EXTERN Ka
        EXTERN Midline
        EXTERN SpecialPWM
        EXTERN SpeedWant
        EXTERN Speed_Kd
        EXTERN Speed_Ki
        EXTERN Speed_Kp
        EXTERN Stoptime
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_ui2f
        EXTERN angleoffset
        EXTERN weight_Max
        EXTERN weight_Min

        PUBLIC FlashSetPara
        PUBLIC FlashWrite_flag
        PUBLIC InitFlashLcd
        PUBLIC LCD_KD
        PUBLIC LCD_KI
        PUBLIC LCD_KP
        PUBLIC flash_erase_sector
        PUBLIC flash_init
        PUBLIC flash_write

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\Flash.c
//    1 #include "Flash.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 u32 LCD_KP = 0;
LCD_KP:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 u32 LCD_KD = 0;
LCD_KD:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 u32 LCD_KI = 0;
LCD_KI:
        DS8 4
//    6 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 u32 FlashWrite_flag = 0;
FlashWrite_flag:
        DS8 4
//    8 
//    9 //==========================================================================
//   10 //函数名称：flash_cmd_launch
//   11 //函数返回：0-成功 1-失败
//   12 //参数说明：无
//   13 //功能概要：启动Flash命令
//   14 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   15 static u32 flash_cmd_launch(void)
//   16 {
//   17     
//   18     FTFL_FSTAT = (0
//   19               |	FTFL_FSTAT_CCIF_MASK 		// 启动命令
//   20               |	FTFL_FSTAT_ACCERR_MASK 		// 清除访问错误标志位
//   21               | FTFL_FSTAT_FPVIOL_MASK		// 非法访问标志位
//   22               );	
flash_cmd_launch:
        MOVS     R0,#+176
        LDR.N    R1,??DataTable5  ;; 0x40020000
        STRB     R0,[R1, #+0]
//   23     									
//   24     while(!(FTFL_FSTAT & FTFL_FSTAT_CCIF_MASK));	// 等待命令完成
??flash_cmd_launch_0:
        LDR.N    R0,??DataTable5  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??flash_cmd_launch_0
//   25 
//   26     // 检查错误标志
//   27     if( FTFL_FSTAT & (FTFL_FSTAT_ACCERR_MASK | FTFL_FSTAT_FPVIOL_MASK | FTFL_FSTAT_MGSTAT0_MASK))
        LDR.N    R0,??DataTable5  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+49
        TST      R0,R1
        BEQ.N    ??flash_cmd_launch_1
//   28         return 1 ; 	//执行命令出错
        MOVS     R0,#+1
        B.N      ??flash_cmd_launch_2
//   29   
//   30     return 0; 	//执行命令成功
??flash_cmd_launch_1:
        MOVS     R0,#+0
??flash_cmd_launch_2:
        BX       LR               ;; return
//   31 }
//   32 //===========================================================================
//   33 
//   34 //=================外部接口函数==============================================
//   35 //==========================================================================
//   36 //函数名称：flash_init
//   37 //函数返回：无
//   38 //参数说明：无
//   39 //功能概要：初始化flash模块
//   40 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   41 void flash_init(void)
//   42 {
//   43 // 清除Flash预读取缓冲区
//   44     FMC_PFB0CR |= FMC_PFB0CR_S_B_INV_MASK;
flash_init:
        LDR.N    R0,??DataTable5_1  ;; 0x4001f004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.N    R1,??DataTable5_1  ;; 0x4001f004
        STR      R0,[R1, #+0]
//   45     FMC_PFB1CR |= FMC_PFB0CR_S_B_INV_MASK;
        LDR.N    R0,??DataTable5_2  ;; 0x4001f008
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80000
        LDR.N    R1,??DataTable5_2  ;; 0x4001f008
        STR      R0,[R1, #+0]
//   46     
//   47     while(!(FTFL_FSTAT & FTFL_FSTAT_CCIF_MASK));// 等待命令完成
??flash_init_0:
        LDR.N    R0,??DataTable5  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??flash_init_0
//   48     
//   49     FTFL_FSTAT = (0
//   50                   |FTFL_FSTAT_ACCERR_MASK 	// 清除访问错误标志位
//   51                   |FTFL_FSTAT_FPVIOL_MASK	// 非法访问标志位
//   52                   );	
        MOVS     R0,#+48
        LDR.N    R1,??DataTable5  ;; 0x40020000
        STRB     R0,[R1, #+0]
//   53 }
        BX       LR               ;; return
//   54 
//   55 //==========================================================================
//   56 //函数名称：flash_erase_sector
//   57 //函数返回：函数执行执行状态：0=正常；非0=异常。
//   58 //参数说明：sectorNo：扇区号（K60N512实际使用0~255）
//   59 //功能概要：擦除指定flash扇区
//   60 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   61 uint8 flash_erase_sector(uint16 sectorNo)
//   62 {
flash_erase_sector:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
//   63     Dtype	addr;	
//   64     addr.DW = (u32)(sectorNo<<11);	
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LSLS     R0,R4,#+11
        STR      R0,[SP, #+0]
//   65     //每个扇区2KB，所以扇区地址=扇区号*2K ，这里用 <<11 表示 *2*1024 
//   66     
//   67     // 设置擦除命令
//   68     FTFL_FCCOB0 = ERSSCR; // 擦除扇区命令
        MOVS     R0,#+9
        LDR.N    R1,??DataTable5_3  ;; 0x40020007
        STRB     R0,[R1, #+0]
//   69     
//   70     // 设置目标地址
//   71     FTFL_FCCOB1 = addr.BB[2];
        LDRB     R0,[SP, #+2]
        LDR.N    R1,??DataTable5_4  ;; 0x40020006
        STRB     R0,[R1, #+0]
//   72     FTFL_FCCOB2 = addr.BB[1];
        LDRB     R0,[SP, #+1]
        LDR.N    R1,??DataTable5_5  ;; 0x40020005
        STRB     R0,[R1, #+0]
//   73     FTFL_FCCOB3 = addr.BB[0];
        LDRB     R0,[SP, #+0]
        LDR.N    R1,??DataTable5_6  ;; 0x40020004
        STRB     R0,[R1, #+0]
//   74     
//   75     // 执行命令序列
//   76     if(1 == flash_cmd_launch())    //若执行命令出现错误
        BL       flash_cmd_launch
        CMP      R0,#+1
        BNE.N    ??flash_erase_sector_0
//   77         return 1;     //擦除命令错误
        MOVS     R0,#+1
        B.N      ??flash_erase_sector_1
//   78    
//   79     // 若擦除sector0时，则解锁设备
//   80     if(sectorNo ==0)
??flash_erase_sector_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BNE.N    ??flash_erase_sector_2
//   81     {
//   82         // 写入4字节
//   83         FTFL_FCCOB0 = PGM4; 
        MOVS     R0,#+6
        LDR.N    R1,??DataTable5_3  ;; 0x40020007
        STRB     R0,[R1, #+0]
//   84         // 设置目标地址
//   85         FTFL_FCCOB1 = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_4  ;; 0x40020006
        STRB     R0,[R1, #+0]
//   86         FTFL_FCCOB2 = 0x04;
        MOVS     R0,#+4
        LDR.N    R1,??DataTable5_5  ;; 0x40020005
        STRB     R0,[R1, #+0]
//   87         FTFL_FCCOB3 = 0x0C;
        MOVS     R0,#+12
        LDR.N    R1,??DataTable5_6  ;; 0x40020004
        STRB     R0,[R1, #+0]
//   88         // 数据
//   89         FTFL_FCCOB4 = 0xFF;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable5_7  ;; 0x4002000b
        STRB     R0,[R1, #+0]
//   90         FTFL_FCCOB5 = 0xFF;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable5_8  ;; 0x4002000a
        STRB     R0,[R1, #+0]
//   91         FTFL_FCCOB6 = 0xFF;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable5_9  ;; 0x40020009
        STRB     R0,[R1, #+0]
//   92         FTFL_FCCOB7 = 0xFE;
        MOVS     R0,#+254
        LDR.N    R1,??DataTable5_10  ;; 0x40020008
        STRB     R0,[R1, #+0]
//   93         // 执行命令序列
//   94         if(1 == flash_cmd_launch())  //若执行命令出现错误
        BL       flash_cmd_launch
        CMP      R0,#+1
        BNE.N    ??flash_erase_sector_2
//   95             return 2;   //解锁命令错误
        MOVS     R0,#+2
        B.N      ??flash_erase_sector_1
//   96     }  
//   97     
//   98     return 0;  //成功返回
??flash_erase_sector_2:
        MOVS     R0,#+0
??flash_erase_sector_1:
        POP      {R1,R2,R4,PC}    ;; return
//   99 }
//  100 
//  101 //==========================================================================
//  102 //函数名称：flash_write
//  103 //函数返回：函数执行状态：0=正常；非0=异常。
//  104 //参数说明：sectorNo：目标扇区号 （K60N512实际使用0~255）
//  105 //         offset:写入扇区内部偏移地址（0~2043）
//  106 //         data：需要写入的变量（uint32型）
//  107 //功能概要：flash写入操作
//  108 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  109 uint8 flash_write(uint16 sectorNo,uint16 offset,u32 data)
//  110 {
flash_write:
        PUSH     {LR}
        SUB      SP,SP,#+12
//  111     Dtype	addr;	
//  112     Dtype	Data;
//  113 		
//  114     addr.DW = (u32)((sectorNo<<11) + offset);//计算地址
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSLS     R0,R0,#+11
        UXTAH    R0,R0,R1
        STR      R0,[SP, #+4]
//  115 	Data.DW	= data;	
        STR      R2,[SP, #+0]
//  116 	    
//  117     FTFL_FCCOB0 = PGM4;	// 设置写入命令
        MOVS     R0,#+6
        LDR.N    R1,??DataTable5_3  ;; 0x40020007
        STRB     R0,[R1, #+0]
//  118 
//  119     FTFL_FCCOB1 = addr.BB[2];// 设置目标地址
        LDRB     R0,[SP, #+6]
        LDR.N    R1,??DataTable5_4  ;; 0x40020006
        STRB     R0,[R1, #+0]
//  120     FTFL_FCCOB2 = addr.BB[1];
        LDRB     R0,[SP, #+5]
        LDR.N    R1,??DataTable5_5  ;; 0x40020005
        STRB     R0,[R1, #+0]
//  121     FTFL_FCCOB3 = addr.BB[0];
        LDRB     R0,[SP, #+4]
        LDR.N    R1,??DataTable5_6  ;; 0x40020004
        STRB     R0,[R1, #+0]
//  122 
//  123 
//  124     FTFL_FCCOB4 = Data.BB[3];// 设置写入数据
        LDRB     R0,[SP, #+3]
        LDR.N    R1,??DataTable5_7  ;; 0x4002000b
        STRB     R0,[R1, #+0]
//  125     FTFL_FCCOB5 = Data.BB[2];
        LDRB     R0,[SP, #+2]
        LDR.N    R1,??DataTable5_8  ;; 0x4002000a
        STRB     R0,[R1, #+0]
//  126     FTFL_FCCOB6 = Data.BB[1];
        LDRB     R0,[SP, #+1]
        LDR.N    R1,??DataTable5_9  ;; 0x40020009
        STRB     R0,[R1, #+0]
//  127     FTFL_FCCOB7 = Data.BB[0];
        LDRB     R0,[SP, #+0]
        LDR.N    R1,??DataTable5_10  ;; 0x40020008
        STRB     R0,[R1, #+0]
//  128     
//  129     if(1 == flash_cmd_launch()) 	
        BL       flash_cmd_launch
        CMP      R0,#+1
        BNE.N    ??flash_write_0
//  130       return 2;  //写入命令错误
        MOVS     R0,#+2
        B.N      ??flash_write_1
//  131 
//  132     return 0;  //成功执行
??flash_write_0:
        MOVS     R0,#+0
??flash_write_1:
        POP      {R1-R3,PC}       ;; return
//  133 }
//  134 
//  135 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  136 void InitFlashLcd(void) 
//  137 {
InitFlashLcd:
        PUSH     {R7,LR}
//  138   flash_init();
        BL       flash_init
//  139   FlashWrite_flag = flash_read(SecNum1,0,u32);
        MOVS     R0,#+260096
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_11
        STR      R0,[R1, #+0]
//  140   if(FlashWrite_flag!=0xffffffff)//flash若全部清除，则不读取flash，变量使用程序本身的变量值
        LDR.N    R0,??DataTable5_11
        LDR      R0,[R0, #+0]
        CMN      R0,#+1
        BEQ.N    ??InitFlashLcd_0
//  141   {
//  142     SpeedWant = flash_read(SecNum1,0,u32);
        MOVS     R0,#+260096
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_12
        STR      R0,[R1, #+0]
//  143     Speed_Kp = flash_read(SecNum1,32,u32);
        LDR.N    R0,??DataTable5_13  ;; 0x3f820
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_14
        STR      R0,[R1, #+0]
//  144     Speed_Ki = flash_read(SecNum1,64,u32);
        LDR.N    R0,??DataTable5_15  ;; 0x3f840
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_16
        STR      R0,[R1, #+0]
//  145     angleoffset = flash_read(SecNum1,96,u32);
        LDR.N    R0,??DataTable5_17  ;; 0x3f860
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable5_18
        STR      R0,[R1, #+0]
//  146     D_P = flash_read(SecNum1,128,u32);
        LDR.N    R0,??DataTable5_19  ;; 0x3f880
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable5_20
        STR      R0,[R1, #+0]
//  147     D_D = flash_read(SecNum1,160,u32);
        LDR.N    R0,??DataTable5_21  ;; 0x3f8a0
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable5_22
        STR      R0,[R1, #+0]
//  148     SpecialPWM= flash_read(SecNum1,192,u32);
        LDR.N    R0,??DataTable5_23  ;; 0x3f8c0
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_24
        STR      R0,[R1, #+0]
//  149     weight_Max = flash_read(SecNum1,224,u32);
        LDR.N    R0,??DataTable5_25  ;; 0x3f8e0
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_26
        STR      R0,[R1, #+0]
//  150     weight_Min = flash_read(SecNum1,256,u32);
        LDR.N    R0,??DataTable5_27  ;; 0x3f900
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_28
        STR      R0,[R1, #+0]
//  151     Ka = flash_read(SecNum1,288,u32);
        LDR.N    R0,??DataTable5_29  ;; 0x3f920
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_30
        STR      R0,[R1, #+0]
//  152     Midline = flash_read(SecNum1,320,u32);
        LDR.N    R0,??DataTable5_31  ;; 0x3f940
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_32
        STR      R0,[R1, #+0]
//  153     Stoptime = flash_read(SecNum1,352,u32);
        LDR.N    R0,??DataTable5_33  ;; 0x3f960
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_34
        STR      R0,[R1, #+0]
//  154     Angle_Kp = flash_read(SecNum1,384,u32);
        LDR.N    R0,??DataTable5_35  ;; 0x3f980
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_36
        STR      R0,[R1, #+0]
//  155     Angle_Kd = flash_read(SecNum1,416,u32);
        LDR.N    R0,??DataTable5_37  ;; 0x3f9a0
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_38
        STR      R0,[R1, #+0]
//  156     D_I = flash_read(SecNum1,448,u32);
        LDR.N    R0,??DataTable5_39  ;; 0x3f9c0
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable5_40
        STR      R0,[R1, #+0]
//  157     Speed_Kd = flash_read(SecNum1,480,u32);
        LDR.N    R0,??DataTable5_41  ;; 0x3f9e0
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable5_42
        STR      R0,[R1, #+0]
//  158     
//  159   }
//  160    
//  161 
//  162 }
??InitFlashLcd_0:
        POP      {R0,PC}          ;; return
//  163 
//  164 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  165 void FlashSetPara(void)
//  166 {
FlashSetPara:
        PUSH     {R7,LR}
//  167   
//  168   
//  169 //  Speed_Kp=0;
//  170 //  Speed_Kp=0;
//  171 //  Speed_Ki=0;
//  172 //  Speed_Kd=0;
//  173 //  Turn_Kp=0;
//  174 //  Turn_Kd=0;
//  175 //  weight_Max=0;
//  176 //  weight_Min=0;
//  177 //  SpeedWant=0;
//  178 //  Angle_Kp=0;
//  179 //  Angle_Kd=0;
//  180 //  Turn_Kp_cir=0;
//  181 //  SpecialPWML=0;
//  182 //  Stoptime=0;
//  183 //  specialfield=0;
//  184 // SpecialPWMR=0;
//  185 // Turn_Max=0;
//  186   //angleoffset=0; 
//  187 
//  188   
//  189   flash_erase_sector(SecNum1);//清除扇区
        MOVS     R0,#+127
        BL       flash_erase_sector
//  190   flash_write(SecNum1,0,SpeedWant);      
        LDR.N    R0,??DataTable5_12
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+127
        BL       flash_write
//  191   flash_write(SecNum1,32,Speed_Kp);
        LDR.N    R0,??DataTable5_14
        LDR      R2,[R0, #+0]
        MOVS     R1,#+32
        MOVS     R0,#+127
        BL       flash_write
//  192   flash_write(SecNum1,64,Speed_Ki);
        LDR.N    R0,??DataTable5_16
        LDR      R2,[R0, #+0]
        MOVS     R1,#+64
        MOVS     R0,#+127
        BL       flash_write
//  193   flash_write(SecNum1,480,Speed_Kd);
        LDR.N    R0,??DataTable5_42
        LDR      R2,[R0, #+0]
        MOV      R1,#+480
        MOVS     R0,#+127
        BL       flash_write
//  194   flash_write(SecNum1,128,D_P);
        LDR.N    R0,??DataTable5_20
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R2,R0
        MOVS     R1,#+128
        MOVS     R0,#+127
        BL       flash_write
//  195   flash_write(SecNum1,448,D_I); 
        LDR.N    R0,??DataTable5_40
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R2,R0
        MOV      R1,#+448
        MOVS     R0,#+127
        BL       flash_write
//  196   flash_write(SecNum1,160,D_D);
        LDR.N    R0,??DataTable5_22
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R2,R0
        MOVS     R1,#+160
        MOVS     R0,#+127
        BL       flash_write
//  197   flash_write(SecNum1,320,Midline);
        LDR.N    R0,??DataTable5_32
        LDR      R2,[R0, #+0]
        MOV      R1,#+320
        MOVS     R0,#+127
        BL       flash_write
//  198   flash_write(SecNum1,96,angleoffset);
        LDR.N    R0,??DataTable5_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R2,R0
        MOVS     R1,#+96
        MOVS     R0,#+127
        BL       flash_write
//  199   flash_write(SecNum1,384,Angle_Kp);
        LDR.N    R0,??DataTable5_36
        LDR      R2,[R0, #+0]
        MOV      R1,#+384
        MOVS     R0,#+127
        BL       flash_write
//  200   flash_write(SecNum1,416,Angle_Kd);
        LDR.N    R0,??DataTable5_38
        LDR      R2,[R0, #+0]
        MOV      R1,#+416
        MOVS     R0,#+127
        BL       flash_write
//  201   flash_write(SecNum1,224,weight_Max);
        LDR.N    R0,??DataTable5_26
        LDR      R2,[R0, #+0]
        MOVS     R1,#+224
        MOVS     R0,#+127
        BL       flash_write
//  202   flash_write(SecNum1,256,weight_Min);
        LDR.N    R0,??DataTable5_28
        LDR      R2,[R0, #+0]
        MOV      R1,#+256
        MOVS     R0,#+127
        BL       flash_write
//  203   flash_write(SecNum1,192,SpecialPWM);
        LDR.N    R0,??DataTable5_24
        LDR      R2,[R0, #+0]
        MOVS     R1,#+192
        MOVS     R0,#+127
        BL       flash_write
//  204   flash_write(SecNum1,352,Stoptime);
        LDR.N    R0,??DataTable5_34
        LDR      R2,[R0, #+0]
        MOV      R1,#+352
        MOVS     R0,#+127
        BL       flash_write
//  205   flash_write(SecNum1,288,Ka);
        LDR.N    R0,??DataTable5_30
        LDR      R2,[R0, #+0]
        MOV      R1,#+288
        MOVS     R0,#+127
        BL       flash_write
//  206   
//  207   
//  208 } 
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x4001f004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x4001f008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40020007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x40020006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x40020005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40020004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x4002000b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0x4002000a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     0x40020009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     0x40020008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     FlashWrite_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     SpeedWant

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     0x3f820

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     Speed_Kp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     0x3f840

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     Speed_Ki

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     0x3f860

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_18:
        DC32     angleoffset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_19:
        DC32     0x3f880

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_20:
        DC32     D_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_21:
        DC32     0x3f8a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_22:
        DC32     D_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_23:
        DC32     0x3f8c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_24:
        DC32     SpecialPWM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_25:
        DC32     0x3f8e0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_26:
        DC32     weight_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_27:
        DC32     0x3f900

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_28:
        DC32     weight_Min

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_29:
        DC32     0x3f920

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_30:
        DC32     Ka

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_31:
        DC32     0x3f940

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_32:
        DC32     Midline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_33:
        DC32     0x3f960

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_34:
        DC32     Stoptime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_35:
        DC32     0x3f980

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_36:
        DC32     Angle_Kp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_37:
        DC32     0x3f9a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_38:
        DC32     Angle_Kd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_39:
        DC32     0x3f9c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_40:
        DC32     D_I

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_41:
        DC32     0x3f9e0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_42:
        DC32     Speed_Kd

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
//  16 bytes in section .bss
// 878 bytes in section .text
// 
// 878 bytes of CODE memory
//  16 bytes of DATA memory
//
//Errors: none
//Warnings: 4
