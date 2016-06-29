///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    13/Mar/2015  12:44:29 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Administrator\Desktop\3.11换结构BLOCK nd       /
//                    black\common\sccb.c                                     /
//    Command line =  "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\common\sccb.c" -D DEBUG -lCN                      /
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
//                    black\Debug\List\sccb.s                                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME sccb

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_Init

        PUBLIC SCCBreadByte
        PUBLIC SCCBwriteByte
        PUBLIC delay_sccb
        PUBLIC noAck
        PUBLIC startSCCB
        PUBLIC stopSCCB

// C:\Users\Administrator\Desktop\3.11换结构BLOCK nd  black\common\sccb.c
//    1 #include "sccb.h"
//    2 
//    3 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    4 void delay_sccb(unsigned long i)//34us 1000,34ms 1000000
//    5 {     
//    6     while( i--)
delay_sccb:
??delay_sccb_0:
        MOVS     R1,R0
        SUBS     R0,R1,#+1
        CMP      R1,#+0
        BNE.N    ??delay_sccb_0
//    7     {	
//    8           
//    9     }
//   10 }
        BX       LR               ;; return
//   11 
//   12 /*-----------------------------------------------
//   13    功能: start命令,SCCB的起始信号
//   14    参数: 无
//   15  返回值: 无
//   16 -----------------------------------------------
//   17 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   18 void startSCCB(void)
//   19 {
startSCCB:
        PUSH     {R7,LR}
//   20     SCCB_SID_H();     //数据线高电平
        LDR.N    R0,??DataTable4  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4  ;; 0x400ff084
        STR      R0,[R1, #+0]
//   21     delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   22 
//   23     SCCB_SIC_H();	   //在时钟线高的时候数据线由高至低
        LDR.N    R0,??DataTable4  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4  ;; 0x400ff084
        STR      R0,[R1, #+0]
//   24     delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   25  
//   26     SCCB_SID_L();
        LDR.N    R0,??DataTable4_1  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4_1  ;; 0x400ff088
        STR      R0,[R1, #+0]
//   27     delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   28 
//   29     SCCB_SIC_L();	 //数据线恢复低电平，单操作函数必要
        LDR.N    R0,??DataTable4_1  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_1  ;; 0x400ff088
        STR      R0,[R1, #+0]
//   30     delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   31 
//   32 
//   33 }
        POP      {R0,PC}          ;; return
//   34 
//   35 
//   36 
//   37 
//   38 /*
//   39 -----------------------------------------------
//   40    功能: stop命令,SCCB的停止信号
//   41    参数: 无
//   42  返回值: 无
//   43 -----------------------------------------------
//   44 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   45 void stopSCCB(void)
//   46 {
stopSCCB:
        PUSH     {R7,LR}
//   47     SCCB_SID_L();
        LDR.N    R0,??DataTable4_1  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4_1  ;; 0x400ff088
        STR      R0,[R1, #+0]
//   48     delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   49  
//   50     SCCB_SIC_H();	
        LDR.N    R0,??DataTable4  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4  ;; 0x400ff084
        STR      R0,[R1, #+0]
//   51     delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   52   
//   53 
//   54     SCCB_SID_H();	
        LDR.N    R0,??DataTable4  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4  ;; 0x400ff084
        STR      R0,[R1, #+0]
//   55     delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   56    
//   57     ///////////////////////
//   58    // SCCB_SIC_L();	
//   59     //delay_us(SCCB_TIME);
//   60     //////////////////////
//   61 }
        POP      {R0,PC}          ;; return
//   62 
//   63 
//   64 
//   65 
//   66 /*
//   67 -----------------------------------------------
//   68    功能: noAck,用于连续读取中的最后一个结束周期
//   69    参数: 无
//   70  返回值: 无
//   71 -----------------------------------------------
//   72 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   73 void noAck(void)
//   74 {
noAck:
        PUSH     {R7,LR}
//   75 	
//   76 	SCCB_SID_H();	
        LDR.N    R0,??DataTable4  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4  ;; 0x400ff084
        STR      R0,[R1, #+0]
//   77 	delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   78 	
//   79 	SCCB_SIC_H();	
        LDR.N    R0,??DataTable4  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4  ;; 0x400ff084
        STR      R0,[R1, #+0]
//   80 	delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   81 	
//   82 	SCCB_SIC_L();	
        LDR.N    R0,??DataTable4_1  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_1  ;; 0x400ff088
        STR      R0,[R1, #+0]
//   83 	delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   84 	
//   85 	SCCB_SID_L();	
        LDR.N    R0,??DataTable4_1  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4_1  ;; 0x400ff088
        STR      R0,[R1, #+0]
//   86 	delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//   87 
//   88 }
        POP      {R0,PC}          ;; return
//   89 
//   90 
//   91 
//   92 
//   93 /*
//   94 -----------------------------------------------
//   95    功能: 写入一个字节的数据到SCCB
//   96    参数: 写入数据
//   97  返回值: 发送成功返回1，发送失败返回0
//   98 -----------------------------------------------
//   99 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  100 unsigned char SCCBwriteByte(unsigned char m_data)
//  101 {
SCCBwriteByte:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  102 	unsigned char j,tem;
//  103     
//  104 	SCCB_SID_OUT;//设置SDA为输出
        LDR.N    R0,??DataTable4_2  ;; 0x400ff094
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4_2  ;; 0x400ff094
        STR      R0,[R1, #+0]
//  105 	for(j=0;j<8;j++) //循环8次发送数据
        MOVS     R5,#+0
        B.N      ??SCCBwriteByte_0
//  106 	{
//  107 		if((m_data<<j)&0x80)
//  108 		{
//  109 			SCCB_SID_H();	
//  110 		}
//  111 		else
//  112 		{
//  113 			SCCB_SID_L();	
??SCCBwriteByte_1:
        LDR.N    R0,??DataTable4_1  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4_1  ;; 0x400ff088
        STR      R0,[R1, #+0]
//  114 		}
//  115 		delay_sccb(SCCB_TIME);
??SCCBwriteByte_2:
        MOVW     R0,#+1500
        BL       delay_sccb
//  116 		SCCB_SIC_H();	
        LDR.N    R0,??DataTable4  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4  ;; 0x400ff084
        STR      R0,[R1, #+0]
//  117 		delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//  118 		SCCB_SIC_L();	
        LDR.N    R0,??DataTable4_1  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_1  ;; 0x400ff088
        STR      R0,[R1, #+0]
//  119 		delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
        ADDS     R5,R5,#+1
??SCCBwriteByte_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BCS.N    ??SCCBwriteByte_3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R0,R4,R5
        LSLS     R0,R0,#+24
        BPL.N    ??SCCBwriteByte_1
        LDR.N    R0,??DataTable4  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4  ;; 0x400ff084
        STR      R0,[R1, #+0]
        B.N      ??SCCBwriteByte_2
//  120 
//  121 	}
//  122 	delay_sccb(TIME1);
??SCCBwriteByte_3:
        MOV      R0,#+1200
        BL       delay_sccb
//  123 	SCCB_SID_IN;//设置SDA为输入/
        MOVS     R3,#+3
        MOVS     R2,#+3
        MOVS     R1,#+11
        MOVS     R0,#+2
        BL       GPIO_Init
//  124 	delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//  125 	SCCB_SIC_H();	
        LDR.N    R0,??DataTable4  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4  ;; 0x400ff084
        STR      R0,[R1, #+0]
//  126 	delay_sccb(TIME1);
        MOV      R0,#+1200
        BL       delay_sccb
//  127 	
//  128 	if(GPIO_PIN_GET(SCCB_SID_PORT,SCCB_SID_PIN))
        LDR.N    R0,??DataTable4_3  ;; 0x400ff090
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+20
        BPL.N    ??SCCBwriteByte_4
//  129 	{
//  130 		tem=0;
        MOVS     R4,#+0
        B.N      ??SCCBwriteByte_5
//  131 	}   //SDA=1发送失败，返回0}
//  132 	else 
//  133 	{
//  134 		tem=1;
??SCCBwriteByte_4:
        MOVS     R4,#+1
//  135 	}   //SDA=0发送成功，返回1
//  136 	SCCB_SIC_L();	
??SCCBwriteByte_5:
        LDR.N    R0,??DataTable4_1  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_1  ;; 0x400ff088
        STR      R0,[R1, #+0]
//  137 	delay_sccb(SCCB_TIME);	
        MOVW     R0,#+1500
        BL       delay_sccb
//  138     SCCB_SID_OUT;//设置SDA为输出
        LDR.N    R0,??DataTable4_2  ;; 0x400ff094
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4_2  ;; 0x400ff094
        STR      R0,[R1, #+0]
//  139 
//  140 	return (tem);  
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  141 }
//  142 
//  143 
//  144 
//  145 
//  146 /*
//  147 -----------------------------------------------
//  148    功能: 一个字节数据读取并且返回
//  149    参数: 无
//  150  返回值: 读取到的数据
//  151 -----------------------------------------------
//  152 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  153 unsigned char SCCBreadByte(void)
//  154 {
SCCBreadByte:
        PUSH     {R3-R5,LR}
//  155 	unsigned char read,j;
//  156 
//  157 	read=0x00;
        MOVS     R5,#+0
//  158 	
//  159 	SCCB_SID_IN;//设置SDA为输入//
        MOVS     R3,#+3
        MOVS     R2,#+3
        MOVS     R1,#+11
        MOVS     R0,#+2
        BL       GPIO_Init
//  160 	
//  161 	for(j=0;j<8;j++) //循环8次接收数据
        MOVS     R4,#+0
        B.N      ??SCCBreadByte_0
//  162 	{		     
//  163 		delay_sccb(SCCB_TIME);
??SCCBreadByte_1:
        MOVW     R0,#+1500
        BL       delay_sccb
//  164 		SCCB_SIC_H();
        LDR.N    R0,??DataTable4  ;; 0x400ff084
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4  ;; 0x400ff084
        STR      R0,[R1, #+0]
//  165 		delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//  166 		
//  167 		read=read<<1;
        LSLS     R5,R5,#+1
//  168 		
//  169 		if(GPIO_PIN_GET(SCCB_SID_PORT,SCCB_SID_PIN)) 
        LDR.N    R0,??DataTable4_3  ;; 0x400ff090
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+20
        BPL.N    ??SCCBreadByte_2
//  170 		{
//  171 			read=read+1;
        ADDS     R5,R5,#+1
//  172 		}
//  173 		SCCB_SIC_L();
??SCCBreadByte_2:
        LDR.N    R0,??DataTable4_1  ;; 0x400ff088
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4_1  ;; 0x400ff088
        STR      R0,[R1, #+0]
//  174 		delay_sccb(SCCB_TIME);
        MOVW     R0,#+1500
        BL       delay_sccb
//  175 	}	
        ADDS     R4,R4,#+1
??SCCBreadByte_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BCC.N    ??SCCBreadByte_1
//  176     SCCB_SID_OUT;//设置SDA为输出//
        LDR.N    R0,??DataTable4_2  ;; 0x400ff094
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R1,??DataTable4_2  ;; 0x400ff094
        STR      R0,[R1, #+0]
//  177 	return(read);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  178 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x400ff084

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x400ff088

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x400ff094

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x400ff090

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 598 bytes in section .text
// 
// 598 bytes of CODE memory
//
//Errors: none
//Warnings: none
