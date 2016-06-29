///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:45
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\CCDH.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\CCDH.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\CCDH.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Ka
        EXTERN ad_once
        EXTERN delay
        EXTERN midlineH

        PUBLIC ADVH
        PUBLIC AVH
        PUBLIC Add_thresholdH
        PUBLIC ControlH
        PUBLIC DVH
        PUBLIC Dev_calH
        PUBLIC GrayMaxH
        PUBLIC GrayMinH
        PUBLIC LGrayMaxH
        PUBLIC L_edgeFlagH
        PUBLIC LedgeH
        PUBLIC R_edgeFlagH
        PUBLIC RedgeH
        PUBLIC TSL1401_GetLine_OneshotH
        PUBLIC fH
        PUBLIC firstshotH
        PUBLIC iH
        PUBLIC jH
        PUBLIC len_showH
        PUBLIC save_midlineH
        PUBLIC thresholdH
        PUBLIC yanLLH
        PUBLIC yanRRH

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\CCDH.c
//    1 
//    2 
//    3 
//    4 //#include "Balance.h"
//    5 //#include "math.h"
//    6 
//    7 #include "CCDH.h"
//    8 //#include "include.h"
//    9 #include "math.h"
//   10 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 byte ADVH[128]={0,0};         //声明数组，用于存放采集的线性数值 
ADVH:
        DS8 128

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 byte DVH[128]={0,0}; 
DVH:
        DS8 128

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 byte AVH[128]={0,0};
AVH:
        DS8 128

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 int fH;
fH:
        DS8 4
//   15 
//   16 
//   17 
//   18 
//   19  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   20 void firstshotH()
//   21 {
firstshotH:
        PUSH     {R4,LR}
//   22  
//   23  int i;
//   24  //单次采集曝光处理                   
//   25  GPIOC_PDOR |=  (1<<11);//TSL_SI=1; //上升沿
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   26  delay();  
        BL       delay
//   27  GPIOC_PDOR |=  (1<<10);//TSL_CLK=1;//起始电平高
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   28  //delay();
//   29  GPIOC_PDOR &= ~(1<<11);//TSL_SI=0; //起始电平低
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x800
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   30  //发送第1个CLK
//   31  delay();
        BL       delay
//   32  //   delay();
//   33  
//   34  
//   35  GPIOC_PDOR &= ~(1<<10);//TSL_CLK=0;//下降沿  
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x400
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   36  
//   37  //发送第2~129个CLK
//   38  for(i=1; i<129; i++)
        MOVS     R4,#+1
        B.N      ??firstshotH_0
//   39  {
//   40   delay();
??firstshotH_1:
        BL       delay
//   41   GPIOC_PDOR |=  (1<<10);//TSL_CLK=1;//起始电平高
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   42   delay(); 
        BL       delay
//   43   GPIOC_PDOR &= ~(1<<10);//TSL_CLK=0;//下降沿  
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x400
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   44  }
        ADDS     R4,R4,#+1
??firstshotH_0:
        CMP      R4,#+129
        BLT.N    ??firstshotH_1
//   45 }
        POP      {R4,PC}          ;; return
//   46 
//   47 //*************************************************************************
//   48 //  * 单次采集
//   49 //************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   50 void TSL1401_GetLine_OneshotH(uint8 *pixel)
//   51 {
TSL1401_GetLine_OneshotH:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   52  uint8 i;
//   53  //  byte  Er;
//   54  byte  po;
//   55  //曝光延时
//   56  //采集上次曝光得到的图像
//   57  //开始SI
//   58  GPIOC_PDOR |=  (1<<11);//TSL_SI=1; //上升沿
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   59  delay();
        BL       delay
//   60  GPIOC_PDOR |=  (1<<10);//TSL_CLK=1;//起始电平高
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   61  //delay();
//   62  GPIOC_PDOR &= ~(1<<11);//TSL_SI=0; //起始电平低
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x800
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   63  //delay();
//   64  //采集第1个点
//   65  for(fH=0;fH<500;fH++)
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1
        STR      R0,[R1, #+0]
        B.N      ??TSL1401_GetLine_OneshotH_0
//   66  { delay();}   
??TSL1401_GetLine_OneshotH_1:
        BL       delay
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable3_1
        STR      R0,[R1, #+0]
??TSL1401_GetLine_OneshotH_0:
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+500
        BLT.N    ??TSL1401_GetLine_OneshotH_1
//   67  po = ad_once(0,15,8);                                  //AD赋值
        MOVS     R2,#+8
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       ad_once
//   68  //  pixel[0] =po<<2;
//   69  pixel[0] = po ;
        STRB     R0,[R4, #+0]
//   70  // Er    =   PTA12;
//   71  // pixel[0]  =  Er ;
//   72  //   pixel[0] =  PTA12;
//   73  GPIOC_PDOR &= ~(1<<10);//TSL_CLK=0;//下降沿  
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x400
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   74  //采集第1~128个点
//   75  for(i=1; i<128;i++)
        MOVS     R5,#+1
        B.N      ??TSL1401_GetLine_OneshotH_2
//   76  { 
//   77   //delay(); 
//   78   delay();
??TSL1401_GetLine_OneshotH_3:
        BL       delay
//   79   GPIOC_PDOR |=  (1<<10);    //TSL_CLK=1;//起始电平高
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   80   po = ad_once(0,15,8);                             //AD赋值
        MOVS     R2,#+8
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       ad_once
//   81   //  pixel[i] = po<<2 ;
//   82   pixel[i] =  po;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STRB     R0,[R5, R4]
//   83   // Er  = PTA12;
//   84   //   pixel[i] = Er;
//   85   //   pixel[i] = PTA12;
//   86   
//   87   GPIOC_PDOR &= ~(1<<10);//TSL_CLK=0;//下降沿  
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x400
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   88  }
        ADDS     R5,R5,#+1
??TSL1401_GetLine_OneshotH_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+128
        BLT.N    ??TSL1401_GetLine_OneshotH_3
//   89  //发送第129个clk
//   90  delay();
        BL       delay
//   91  GPIOC_PDOR &= ~(1<<10);//TSL_CLK=0;//下降沿  
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x400
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   92  delay(); 
        BL       delay
//   93  GPIOC_PDOR |=  (1<<10);//TSL_CLK=1;//起始电平高
        LDR.W    R0,??DataTable3  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable3  ;; 0x400ff080
        STR      R0,[R1, #+0]
//   94  delay();
        BL       delay
//   95 }
        POP      {R0,R4,R5,PC}    ;; return
//   96 
//   97 
//   98 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   99 int jH,iH; 
jH:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
iH:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  100 word Add_thresholdH;  
Add_thresholdH:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  101 int thresholdH;  
thresholdH:
        DS8 4
//  102 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  103 int GrayMinH;
GrayMinH:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  104 int GrayMaxH;
GrayMaxH:
        DS8 4
//  105 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  106 int yanLLH;
yanLLH:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  107 int yanRRH;
yanRRH:
        DS8 4
//  108 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  109 byte L_edgeFlagH[30]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
L_edgeFlagH:
        DATA
        DC8 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  110 byte R_edgeFlagH[30]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
R_edgeFlagH:
        DATA
        DC8 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
//  111 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  112 int LedgeH[30]={34,34,34,34,34,34,34,34,34,34,34,34,34,34,34};
LedgeH:
        DATA
        DC32 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 0
        DC32 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  113 int RedgeH[30]={94,94,94,94,94,94,94,94,94,94,94,94,94,94,94};
RedgeH:
        DATA
        DC32 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 0, 0
        DC32 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//  114 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  115 int LGrayMaxH=0;  
LGrayMaxH:
        DS8 4
//  116 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  117 byte len_showH[10]={80,80,80,80,80};
len_showH:
        DATA
        DC8 80, 80, 80, 80, 80, 0, 0, 0, 0, 0, 0, 0
//  118 
//  119 
//  120 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  121 void Dev_calH()
//  122 {
//  123  
//  124  Add_thresholdH=0;
Dev_calH:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2
        STR      R0,[R1, #+0]
//  125  for(jH=10;jH<=118;jH++)
        MOVS     R0,#+10
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_calH_0
//  126  {
//  127   Add_thresholdH += ADVH[jH];      
??Dev_calH_1:
        LDR.W    R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        ADDS     R0,R0,R1
        LDR.W    R1,??DataTable3_2
        STR      R0,[R1, #+0]
//  128   
//  129  }
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
??Dev_calH_0:
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+119
        BLT.N    ??Dev_calH_1
//  130  thresholdH = Add_thresholdH/109; 
        LDR.W    R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        MOVS     R1,#+109
        UDIV     R0,R0,R1
        LDR.W    R1,??DataTable3_5
        STR      R0,[R1, #+0]
//  131  
//  132  GrayMinH=255;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable3_6
        STR      R0,[R1, #+0]
//  133  GrayMaxH=0; 
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_7
        STR      R0,[R1, #+0]
//  134  
//  135  for(iH=10;iH<118;iH++)
        MOVS     R0,#+10
        LDR.W    R1,??DataTable3_8
        STR      R0,[R1, #+0]
        B.N      ??Dev_calH_2
//  136  {
//  137   
//  138   
//  139   if(ADVH[iH]<GrayMinH)
//  140   {
//  141    if(ADVH[iH-1]>ADVH[iH+1])
//  142    {
//  143 	if(ADVH[iH]>ADVH[iH-1])
//  144 	{
//  145 	 ADVH[iH]=ADVH[iH-1];
//  146 	}
//  147 	else if(ADVH[iH]<ADVH[iH+1])
//  148 	{                                                     
//  149 	 ADVH[iH]=ADVH[iH+1];
//  150 	}
//  151    }
//  152    else
//  153    {
//  154 	if(ADVH[iH]>ADVH[iH+1])
//  155 	{
//  156 	 ADVH[iH]=ADVH[iH+1];
//  157 	}
//  158 	else if(ADVH[iH]<ADVH[iH-1])
//  159 	{
//  160 	 ADVH[iH]=ADVH[iH-1];
//  161 	}
//  162    }
//  163    if(ADVH[iH]<GrayMinH)
//  164    {
//  165 	GrayMinH = ADVH[iH];                    
//  166 	
//  167    }
//  168   }
//  169   ///********************************中值滤波，提取赛道中的最白处*************************************************          
//  170   if(ADVH[iH]>GrayMaxH)
//  171   {
//  172    if(ADVH[iH-1]>ADVH[iH+1])
//  173    {
//  174 	if(ADVH[iH]>ADVH[iH-1])
//  175 	{
//  176 	 ADVH[iH]=ADVH[iH-1];
//  177 	}
//  178 	else if(ADVH[iH]<ADVH[iH+1])
//  179 	{
//  180 	 ADVH[iH]=ADVH[iH+1];
//  181 	}
//  182    }
//  183    else
//  184    {
//  185 	if(ADVH[iH]>ADVH[iH+1])
//  186 	{
//  187 	 ADVH[iH]=ADVH[iH+1];
//  188 	}
//  189 	else if(ADVH[iH]<ADVH[iH-1])
??Dev_calH_3:
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_4
//  190 	{
//  191 	 ADVH[iH]=ADVH[iH-1];
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
//  192 	}
//  193    }
//  194    if(ADVH[iH]>GrayMaxH)
??Dev_calH_4:
        LDR.W    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BGE.N    ??Dev_calH_5
//  195    {
//  196 	GrayMaxH=ADVH[iH];
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_7
        STR      R0,[R1, #+0]
//  197 	
//  198    }
??Dev_calH_5:
        LDR.W    R0,??DataTable3_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable3_8
        STR      R0,[R1, #+0]
??Dev_calH_2:
        LDR.W    R0,??DataTable3_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+118
        BGE.W    ??Dev_calH_6
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_6
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.W    ??Dev_calH_7
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_8
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_9
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_calH_10
??Dev_calH_9:
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_10
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_calH_10
??Dev_calH_8:
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_11
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_calH_10
??Dev_calH_11:
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_10
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
??Dev_calH_10:
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_6
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??Dev_calH_7
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_6
        STR      R0,[R1, #+0]
??Dev_calH_7:
        LDR.W    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BGE.W    ??Dev_calH_5
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_12
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_13
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_calH_4
??Dev_calH_13:
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BCS.W    ??Dev_calH_4
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_calH_4
??Dev_calH_12:
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.W    ??Dev_calH_3
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_8
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_calH_4
//  199    
//  200   }
//  201  }
//  202  
//  203  
//  204  
//  205  
//  206  
//  207  
//  208  L_edgeFlagH[0]=0; 
??Dev_calH_6:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_9
        STRB     R0,[R1, #+0]
//  209  yanLLH=midlineH-64;
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+64
        LDR.W    R1,??DataTable3_11
        STR      R0,[R1, #+0]
//  210  if(yanLLH<10)
        LDR.W    R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+10
        BGE.N    ??Dev_calH_14
//  211   yanLLH=10;                     //划定左跳沿范围
        MOVS     R0,#+10
        LDR.W    R1,??DataTable3_11
        STR      R0,[R1, #+0]
//  212  
//  213  for(jH=midlineH;jH>yanLLH;jH--)
??Dev_calH_14:
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_calH_15
??Dev_calH_16:
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
??Dev_calH_15:
        LDR.W    R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.W    ??Dev_calH_17
//  214  {
//  215   if(ADVH[jH]>thresholdH)
        LDR.W    R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BGE.N    ??Dev_calH_16
//  216    
//  217    if(ADVH[jH+1]>ADVH[jH])  
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_16
//  218 	if(ADVH[jH]>ADVH[jH-1])
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_16
//  219 	 if(ADVH[jH-1]>ADVH[jH-2])
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-2]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_16
//  220 	  
//  221 	  if(ADVH[jH-1]<=thresholdH)
        LDR.W    R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BLT.N    ??Dev_calH_16
//  222 	   
//  223 	   if((ADVH[jH+1]-ADVH[jH-2])>Ka)  
        LDR.W    R0,??DataTable3_12
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        LDR.W    R2,??DataTable3_4
        LDR.W    R3,??DataTable3_3
        LDR      R3,[R3, #+0]
        ADDS     R2,R3,R2
        LDRB     R2,[R2, #-2]
        SUBS     R1,R1,R2
        CMP      R0,R1
        BGE.N    ??Dev_calH_16
//  224 		
//  225 		
//  226 		if(ADVH[jH+2]>ADVH[jH-2])   
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-2]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+2]
        CMP      R0,R1
        BCS.W    ??Dev_calH_16
//  227 		 
//  228 		 
//  229 		 if(ADVH[jH+7]>220)
        LDR.W    R0,??DataTable3_4
        LDR.W    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+7]
        CMP      R0,#+221
        BLT.W    ??Dev_calH_16
//  230 		  
//  231 		 { 
//  232 		  LedgeH[0] = jH;              
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_13
        STR      R0,[R1, #+0]
//  233 		  L_edgeFlagH[0]=1;  
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_9
        STRB     R0,[R1, #+0]
//  234 		  break;
//  235 		 }
//  236  }
//  237  
//  238  
//  239  R_edgeFlagH[0]=0;  
??Dev_calH_17:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_14
        STRB     R0,[R1, #+0]
//  240  yanRRH=midlineH+64;
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+64
        LDR.W    R1,??DataTable3_15
        STR      R0,[R1, #+0]
//  241  if( yanRRH>117)                   //划定右跳沿范围
        LDR.W    R0,??DataTable3_15
        LDR      R0,[R0, #+0]
        CMP      R0,#+118
        BLT.N    ??Dev_calH_18
//  242   yanRRH=117; 
        MOVS     R0,#+117
        LDR.W    R1,??DataTable3_15
        STR      R0,[R1, #+0]
//  243  
//  244  for(jH=midlineH;jH<yanRRH;jH++)
??Dev_calH_18:
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_calH_19
??Dev_calH_20:
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
??Dev_calH_19:
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_15
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??Dev_calH_21
//  245   
//  246  {
//  247   
//  248   if(ADVH[jH]>thresholdH)
        LDR.W    R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_4
        LDR.W    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BGE.N    ??Dev_calH_20
//  249    
//  250    if(ADVH[jH-1]>ADVH[jH])   
        LDR.W    R0,??DataTable3_4
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.N    R1,??DataTable3_4
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_20
//  251 	if(ADVH[jH]>ADVH[jH+1])
        LDR.N    R0,??DataTable3_4
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable3_4
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_20
//  252 	 if(ADVH[jH+1]>ADVH[jH+2])  
        LDR.N    R0,??DataTable3_4
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+2]
        LDR.N    R1,??DataTable3_4
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BCS.N    ??Dev_calH_20
//  253 	  
//  254 	  if(ADVH[jH+1]<=thresholdH)
        LDR.N    R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_4
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BLT.N    ??Dev_calH_20
//  255 	   
//  256 	   if((ADVH[jH-1]-ADVH[jH+2])>Ka)  
        LDR.N    R0,??DataTable3_12
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_4
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        LDR.N    R2,??DataTable3_4
        LDR.N    R3,??DataTable3_3
        LDR      R3,[R3, #+0]
        ADDS     R2,R3,R2
        LDRB     R2,[R2, #+2]
        SUBS     R1,R1,R2
        CMP      R0,R1
        BGE.N    ??Dev_calH_20
//  257 		
//  258 		if(ADVH[jH-2]>ADVH[jH+2])
        LDR.N    R0,??DataTable3_4
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+2]
        LDR.N    R1,??DataTable3_4
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-2]
        CMP      R0,R1
        BCS.N    ??Dev_calH_20
//  259 		 
//  260 		 
//  261 		 
//  262 		 if(ADVH[jH-7]>220)
        LDR.N    R0,??DataTable3_4
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-7]
        CMP      R0,#+221
        BLT.N    ??Dev_calH_20
//  263 		  
//  264 		 { 
//  265 		  RedgeH[0] = jH;              
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_16
        STR      R0,[R1, #+0]
//  266 		  R_edgeFlagH[0]=1;  
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_14
        STRB     R0,[R1, #+0]
//  267 		  break;
//  268 		 }            
//  269  }
//  270  
//  271  
//  272  
//  273  
//  274  
//  275  if(LedgeH[0]>RedgeH[0])
??Dev_calH_21:
        LDR.N    R0,??DataTable3_16
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_13
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??Dev_calH_22
//  276  {
//  277   L_edgeFlagH[0]=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_9
        STRB     R0,[R1, #+0]
//  278   R_edgeFlagH[0]=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_14
        STRB     R0,[R1, #+0]
//  279   RedgeH[0]=RedgeH[1];
        LDR.N    R0,??DataTable3_16
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable3_16
        STR      R0,[R1, #+0]
//  280   LedgeH[0]=LedgeH[1];
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+0]
//  281   len_showH[0]=len_showH[1];        
        LDR.N    R0,??DataTable3_17
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable3_17
        STRB     R0,[R1, #+0]
        B.N      ??Dev_calH_23
//  282  }
//  283  else
//  284  {
//  285   if(L_edgeFlagH[0]+R_edgeFlagH[0]==2)
??Dev_calH_22:
        LDR.N    R0,??DataTable3_9
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable3_14
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        CMP      R0,#+2
        BNE.N    ??Dev_calH_24
//  286   {  
//  287    len_showH[0]=RedgeH[0]-LedgeH[0];
        LDR.N    R0,??DataTable3_16
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_13
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable3_17
        STRB     R0,[R1, #+0]
//  288    
//  289    if(len_showH[0]<40)
        LDR.N    R0,??DataTable3_17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+40
        BGE.N    ??Dev_calH_23
//  290    {
//  291 	L_edgeFlagH[0]=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_9
        STRB     R0,[R1, #+0]
//  292 	R_edgeFlagH[0]=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_14
        STRB     R0,[R1, #+0]
//  293 	RedgeH[0]=RedgeH[1];
        LDR.N    R0,??DataTable3_16
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable3_16
        STR      R0,[R1, #+0]
//  294 	LedgeH[0]=LedgeH[1];
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+0]
//  295 	len_showH[0]=len_showH[1];    
        LDR.N    R0,??DataTable3_17
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable3_17
        STRB     R0,[R1, #+0]
        B.N      ??Dev_calH_23
//  296    }
//  297   }
//  298   else
//  299   {
//  300    len_showH[0]=len_showH[1];
??Dev_calH_24:
        LDR.N    R0,??DataTable3_17
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable3_17
        STRB     R0,[R1, #+0]
//  301   }    
//  302  }
//  303  
//  304  
//  305  
//  306  for(jH=28;jH>=0;jH--)                      
??Dev_calH_23:
        MOVS     R0,#+28
        LDR.N    R1,??DataTable3_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_calH_25
//  307  {
//  308   L_edgeFlagH[jH+1]=L_edgeFlagH[jH];
??Dev_calH_26:
        LDR.N    R0,??DataTable3_9
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.N    R1,??DataTable3_9
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+1]
//  309   R_edgeFlagH[jH+1]=R_edgeFlagH[jH]; 
        LDR.N    R0,??DataTable3_14
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.N    R1,??DataTable3_14
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+1]
//  310   LedgeH[jH+1]=LedgeH[jH];
        LDR.N    R0,??DataTable3_13
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable3_13
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
//  311   RedgeH[jH+1]=RedgeH[jH]; 
        LDR.N    R0,??DataTable3_16
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable3_16
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
//  312  }  
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable3_3
        STR      R0,[R1, #+0]
??Dev_calH_25:
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??Dev_calH_26
//  313  
//  314  
//  315  for(jH=7;jH>=0;jH--) 
        MOVS     R0,#+7
        LDR.N    R1,??DataTable3_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_calH_27
//  316  {
//  317   len_showH[jH+1]=len_showH[jH];
??Dev_calH_28:
        LDR.N    R0,??DataTable3_17
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.N    R1,??DataTable3_17
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+1]
//  318  }
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable3_3
        STR      R0,[R1, #+0]
??Dev_calH_27:
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??Dev_calH_28
//  319  
//  320  LGrayMaxH=GrayMaxH-5;
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR.N    R1,??DataTable3_18
        STR      R0,[R1, #+0]
//  321  
//  322  
//  323  if(LGrayMaxH<200)
        LDR.N    R0,??DataTable3_18
        LDR      R0,[R0, #+0]
        CMP      R0,#+200
        BGE.N    ??Dev_calH_29
//  324   LGrayMaxH=200;  
        MOVS     R0,#+200
        LDR.N    R1,??DataTable3_18
        STR      R0,[R1, #+0]
//  325  
//  326 }  
??Dev_calH_29:
        BX       LR               ;; return
//  327 
//  328 
//  329 
//  330 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  331 byte save_midlineH[10]={63,63,63,63,63,63,63,63,63,63};
save_midlineH:
        DATA
        DC8 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 0, 0
//  332 
//  333 
//  334 
//  335 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  336 void  ControlH()
//  337 {
//  338  
//  339  
//  340  if(L_edgeFlagH[0]+R_edgeFlagH[0]==2)
ControlH:
        LDR.N    R0,??DataTable3_9
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable3_14
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        CMP      R0,#+2
        BNE.N    ??ControlH_0
//  341  {         
//  342   midlineH = (LedgeH[1] + RedgeH[1])/2;
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable3_16
        LDR      R1,[R1, #+4]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+0]
//  343  }           
//  344  if((L_edgeFlagH[0]==0)&&(R_edgeFlagH[0]==1))
??ControlH_0:
        LDR.N    R0,??DataTable3_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??ControlH_1
        LDR.N    R0,??DataTable3_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??ControlH_1
//  345  {        
//  346   midlineH = RedgeH[1]-len_showH[2]/2;         
        LDR.N    R0,??DataTable3_16
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable3_17
        LDRB     R1,[R1, #+2]
        MOVS     R2,#+2
        SDIV     R1,R1,R2
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+0]
//  347  }    
//  348  if((R_edgeFlagH[0]==0)&&(L_edgeFlagH[0]==1))
??ControlH_1:
        LDR.N    R0,??DataTable3_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??ControlH_2
        LDR.N    R0,??DataTable3_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??ControlH_2
//  349  {        
//  350   midlineH = LedgeH[1]+len_showH[2]/2;  
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable3_17
        LDRB     R1,[R1, #+2]
        MOVS     R2,#+2
        SDIV     R1,R1,R2
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+0]
//  351  }     
//  352  if((R_edgeFlagH[0]==0)&&(L_edgeFlagH[0]==0))
??ControlH_2:
        LDR.N    R0,??DataTable3_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??ControlH_3
        LDR.N    R0,??DataTable3_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??ControlH_3
//  353  {          
//  354   midlineH = (int)(save_midlineH[1]); 
        LDR.N    R0,??DataTable3_19
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+0]
//  355   
//  356  }
//  357  
//  358  
//  359  if(midlineH<15)
??ControlH_3:
        LDR.N    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+15
        BGE.N    ??ControlH_4
//  360  {
//  361   midlineH=15;
        MOVS     R0,#+15
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+0]
//  362  }
//  363  if(midlineH>112)
??ControlH_4:
        LDR.N    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+113
        BLT.N    ??ControlH_5
//  364  {
//  365   midlineH=112;
        MOVS     R0,#+112
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+0]
//  366  }        
//  367  
//  368  
//  369  for(jH=7;jH>=0;jH--)  
??ControlH_5:
        MOVS     R0,#+7
        LDR.N    R1,??DataTable3_3
        STR      R0,[R1, #+0]
        B.N      ??ControlH_6
//  370  { 
//  371   save_midlineH[jH+1]=save_midlineH[jH];
??ControlH_7:
        LDR.N    R0,??DataTable3_19
        LDR.N    R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.N    R1,??DataTable3_19
        LDR.N    R2,??DataTable3_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+1]
//  372  }                
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable3_3
        STR      R0,[R1, #+0]
??ControlH_6:
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??ControlH_7
//  373  save_midlineH[0]=midlineH; 
        LDR.N    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_19
        STRB     R0,[R1, #+0]
//  374  
//  375  
//  376  
//  377  
//  378 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     fH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     Add_thresholdH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     jH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     ADVH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     thresholdH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     GrayMinH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     GrayMaxH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     iH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     L_edgeFlagH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     midlineH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     yanLLH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     Ka

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     LedgeH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     R_edgeFlagH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     yanRRH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     RedgeH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     len_showH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     LGrayMaxH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     save_midlineH

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
//   424 bytes in section .bss
//   328 bytes in section .data
// 2 406 bytes in section .text
// 
// 2 406 bytes of CODE memory
//   752 bytes of DATA memory
//
//Errors: none
//Warnings: 8
