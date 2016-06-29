///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:47
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\CCDQ.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\CCDQ.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\CCDQ.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BmaCnt
        EXTERN D_D
        EXTERN D_I
        EXTERN D_P
        EXTERN FieldCnt
        EXTERN H
        EXTERN Ka
        EXTERN Singleflag
        EXTERN SpecialPWM
        EXTERN SteerEss
        EXTERN SteerEssOld
        EXTERN Stopflag
        EXTERN THreshold
        EXTERN TurnGyro
        EXTERN TurnGyro_offset
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN abs
        EXTERN ad_once
        EXTERN delay
        EXTERN midline
        EXTERN weight_Min

        PUBLIC ADV
        PUBLIC Add_threshold
        PUBLIC BlackFlag
        PUBLIC BlackFlagcnt
        PUBLIC Blackflag
        PUBLIC BlackflagEN
        PUBLIC Blackflagl
        PUBLIC Blackflagr
        PUBLIC BlockFlag
        PUBLIC BlockL
        PUBLIC BlockR
        PUBLIC Blockflag
        PUBLIC Blockflagl
        PUBLIC Blockflagr
        PUBLIC BlocklEN
        PUBLIC BlockrEN
        PUBLIC BmaEN
        PUBLIC CCD_H
        PUBLIC CCD_Q
        PUBLIC CNT
        PUBLIC Cnt
        PUBLIC Control
        PUBLIC Dev_cal
        PUBLIC Elbowbendflag
        PUBLIC Elbowbendflagl
        PUBLIC Elbowbendflagr
        PUBLIC ElbowbendlEN
        PUBLIC ElbowbendrEN
        PUBLIC End
        PUBLIC Ess
        PUBLIC GrayMAX
        PUBLIC GrayMIN
        PUBLIC GrayMax
        PUBLIC GrayMaxMinflagL
        PUBLIC GrayMaxMinflagR
        PUBLIC GrayMaxPtrL
        PUBLIC GrayMaxPtrR
        PUBLIC GrayMaxl
        PUBLIC GrayMaxr
        PUBLIC GrayMin
        PUBLIC GrayMinPtrL
        PUBLIC GrayMinPtrR
        PUBLIC GrayMinl
        PUBLIC GrayMinr
        PUBLIC GraydownL
        PUBLIC GraydownL1
        PUBLIC GraydownR
        PUBLIC GraydownR1
        PUBLIC GrayleftedgeL
        PUBLIC GrayleftedgeR
        PUBLIC Kp_Ess
        PUBLIC LEDGE
        PUBLIC LGrayMax
        PUBLIC LGrayMaxl
        PUBLIC LGrayMaxr
        PUBLIC L_edgeFlag
        PUBLIC Ledge
        PUBLIC LighthouseEN
        PUBLIC Lthreshold
        PUBLIC Midline
        PUBLIC OledShowEN
        PUBLIC ProtectEN
        PUBLIC R
        PUBLIC REDGE
        PUBLIC R_edgeFlag
        PUBLIC RampEN
        PUBLIC Redge
        PUBLIC SingleFlag
        PUBLIC SinglineEN
        PUBLIC SpeedextraEN
        PUBLIC Startl
        PUBLIC Startr
        PUBLIC SteerEssEN
        PUBLIC Straight
        PUBLIC TSL1401_GetLine_Oneshot
        PUBLIC Turn_Kp_N
        PUBLIC Weight_Denominator
        PUBLIC Weight_Molecular
        PUBLIC WhiteEN
        PUBLIC X
        PUBLIC X_Correct
        PUBLIC Xcal_L
        PUBLIC Xcal_R
        PUBLIC YZ
        PUBLIC aa
        PUBLIC add_midline
        PUBLIC barrier_dss
        PUBLIC cnt
        PUBLIC ctt
        PUBLIC dir_error
        PUBLIC error_flag
        PUBLIC ess
        PUBLIC f
        PUBLIC firstshot
        PUBLIC i
        PUBLIC issue_threshold
        PUBLIC j
        PUBLIC len_real
        PUBLIC len_realcnt
        PUBLIC len_realsum
        PUBLIC len_show
        PUBLIC save_midline
        PUBLIC single
        PUBLIC singleL
        PUBLIC singleR
        PUBLIC singleflag
        PUBLIC singleflag1
        PUBLIC singleflag2
        PUBLIC startflag
        PUBLIC startl
        PUBLIC startr
        PUBLIC straight
        PUBLIC straightFlag
        PUBLIC straightflag
        PUBLIC threshold
        PUBLIC weight
        PUBLIC weight_max
        PUBLIC yanLL
        PUBLIC yanRR

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\CCDQ.c
//    1 #include "CCDQ.h"
//    2 
//    3 
//    4 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 int CCD_Q;
CCD_Q:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 int CCD_H;
CCD_H:
        DS8 4
//    7 
//    8 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 int BlocklEN ;
BlocklEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 int BlockrEN ;
BlockrEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 int ElbowbendrEN;
ElbowbendrEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 int ElbowbendlEN;
ElbowbendlEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 int RampEN;
RampEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 int ProtectEN;
ProtectEN:
        DS8 4
//   15 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 int SteerEssEN;
SteerEssEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 int SpeedextraEN;
SpeedextraEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 int SinglineEN;
SinglineEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 int OledShowEN;
OledShowEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 int BmaEN;
BmaEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 int WhiteEN;
WhiteEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 int LighthouseEN;
LighthouseEN:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 int BlackflagEN;
BlackflagEN:
        DS8 4
//   24 ////////////////////////////////////////////////////////////////////////////////////
//   25 
//   26 
//   27 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 int weight[4]={0,0,0,0};
weight:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   29 int Xcal_L=15;              //起始搜索范围  左  0-160
Xcal_L:
        DATA
        DC32 15

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   30 int Xcal_R=113;              //起始搜索范围  右  0-160
Xcal_R:
        DATA
        DC32 113
//   31 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 int Elbowbendflag=0;
Elbowbendflag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   33 int Elbowbendflagl=0;
Elbowbendflagl:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 int Elbowbendflagr=0;
Elbowbendflagr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 int Blackflag=0;
Blackflag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   36 int BlackFlagcnt=0;
BlackFlagcnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   37 int Blackflagr=0;
Blackflagr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   38 int Blackflagl=0;
Blackflagl:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39 int BlackFlag=0;
BlackFlag:
        DS8 4
//   40 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41 int SingleFlag=0;
SingleFlag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   42 int Blockflag=0;
Blockflag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   43 int BlockFlag=0;
BlockFlag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   44 int Blockflagr=0;
Blockflagr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 int BlockL=0;
BlockL:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   46 int Blockflagl=0;
Blockflagl:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   47 int BlockR=0;
BlockR:
        DS8 4
//   48 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   49 int straight;
straight:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   50 int Straight=0;
Straight:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   51 int straightflag;
straightflag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   52 int straightFlag[10];    
straightFlag:
        DS8 40
//   53 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 int X[10];
X:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   55 int GrayMin;
GrayMin:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   56 int GrayMIN[20];
GrayMIN:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   57 int startr;
startr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   58 int startl;
startl:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   59 int Startr[10]={30,30,30,30,30,30,30,30};
Startr:
        DATA
        DC32 30, 30, 30, 30, 30, 30, 30, 30, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   60 int Startl[10]={30,30,30,30,30,30,30,30};
Startl:
        DATA
        DC32 30, 30, 30, 30, 30, 30, 30, 30, 0, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   61 int cnt=0;
cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   62 int Cnt[10];
Cnt:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   63 int CNT[200];
CNT:
        DS8 800

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   64 int YZ;
YZ:
        DS8 4
//   65 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   66 byte GraydownR;         //右灰度沿降
GraydownR:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   67 byte GraydownR1;
GraydownR1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   68 byte LGrayMaxr;         //上一时刻的左灰度最大值
LGrayMaxr:
        DS8 1
//   69 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   70 byte GraydownL;         //左灰度沿降 
GraydownL:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   71 byte GraydownL1; 
GraydownL1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   72 byte LGrayMaxl;         //上一时刻的左灰度最大值
LGrayMaxl:
        DS8 1
//   73 
//   74 
//   75 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   76 int startflag=0;
startflag:
        DS8 4
//   77 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   78 int End=0;
End:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   79 int GrayMax=0;
GrayMax:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   80 int GrayMAX[20];
GrayMAX:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   81 int LGrayMax=0;
LGrayMax:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   82 int singleflag=0;
singleflag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   83 int single=0;
single:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   84 int singleL;
singleL:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   85 int singleR;
singleR:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   86 int singleflag1=0; 
singleflag1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   87 int singleflag2=0; 
singleflag2:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   88 int Midline=70; 
Midline:
        DATA
        DC32 70

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   89 int ctt=0;
ctt:
        DS8 4
//   90 
//   91 
//   92 //float X_Correct[50]={
//   93 //                   0.02,0.04,0.06,0.08,0.10,
//   94 //                   0.12,0.14,0.16,0.18,0.20,
//   95 //                   0.22,0.24,0.26,0.28,0.30,
//   96 //                   0.32,0.34,0.36,0.38,0.40,
//   97 //                   0.42,0.44,0.46,0.48,0.50,
//   98 //                   0.52,0.54,0.56,0.58,0.60,
//   99 //                   0.62,0.64,0.66,0.68,0.70,
//  100 //                   0.72,0.74,0.76,0.78,0.80,
//  101 //                   0.82,0.84,0.86,0.88,0.90,
//  102 //                   0.92,0.94,0.96,0.98,1.00
//  103 //                   };
//  104 
//  105 //float X_Correct[60]={
//  106 //                   1.00,1.00,1.00,1.00,1.00,
//  107 //                   1.10,1.10,1.10,1.10,1.10,
//  108 //                   1.15,1.15,1.15,1.15,1.15,
//  109 //                   1.20,1.20,1.20,1.20,1.20,
//  110 //                   1.25,1.25,1.25,1.25,1.25,
//  111 //                   1.30,1.30,1.30,1.30,1.30,
//  112 //                   1.35,1.35,1.35,1.35,1.35,
//  113 //                   1.40,1.40,1.40,1.40,1.40,
//  114 //                   1.45,1.45,1.45,1.45,1.45,
//  115 //                   1.50,1.50,1.50,1.50,1.50,
//  116 //                   };
//  117 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  118 float X_Correct[60]={
X_Correct:
        DATA
        DC32 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H
        DC32 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H
        DC32 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H
        DC32 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H
        DC32 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H
        DC32 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H
        DC32 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H
        DC32 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H, 3F800000H
        DC32 3F800000H, 3F800000H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0
//  119 1.00,1.00,1.00,1.00,1.00,
//  120 1.00,1.00,1.00,1.00,1.00,
//  121 1.00,1.00,1.00,1.00,1.00,
//  122 1.00,1.00,1.00,1.00,1.00,
//  123 1.00,1.00,1.00,1.00,1.00,
//  124 1.00,1.00,1.00,1.00,1.00,
//  125 1.00,1.00,1.00,1.00,1.00,
//  126 1.00,1.00,1.00,1.00,1.00,
//  127 1.00,1.00,1.00,1.00,1.00,
//  128 1.00,1.00,1.00,1.00,1.00,
//  129 };
//  130 
//  131 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  132 long Turn_Kp_N = 0;
Turn_Kp_N:
        DS8 4
//  133 
//  134 
//  135 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  136 float Kp_Ess[4]={0.4,0.3,0.2,0.1};
Kp_Ess:
        DATA
        DC32 3ECCCCCDH, 3E99999AH, 3E4CCCCDH, 3DCCCCCDH
//  137 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  138 int i,j,f;    
i:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
j:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
f:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  139 byte ADV[128]={0,0};
ADV:
        DS8 128

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  140 byte save_midline[10]={63,63,63,63,63,63,63,63,63,63};
save_midline:
        DATA
        DC8 63, 63, 63, 63, 63, 63, 63, 63, 63, 63, 0, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  141 float ess=0;
ess:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  142 int Ess[10];
Ess:
        DS8 40
//  143 
//  144 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  145 byte L_edgeFlag[30]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
L_edgeFlag:
        DATA
        DC8 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  146 byte R_edgeFlag[30]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
R_edgeFlag:
        DATA
        DC8 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
//  147 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  148 int Ledge[30]={34,34,34,34,34,34,34,34,34,34,34,34,34,34,34};
Ledge:
        DATA
        DC32 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 0
        DC32 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  149 int Redge[30]={94,94,94,94,94,94,94,94,94,94,94,94,94,94,94};
Redge:
        DATA
        DC32 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 94, 0, 0
        DC32 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  150 int LEDGE=30;
LEDGE:
        DATA
        DC32 30

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  151 int REDGE=100;
REDGE:
        DATA
        DC32 100

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  152 int yanLL;
yanLL:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  153 int yanRR;
yanRR:
        DS8 4
//  154 
//  155 
//  156 
//  157 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  158 word Add_threshold;     //灰度值和
Add_threshold:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  159 int threshold;         //阈值
threshold:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  160 int Lthreshold;
Lthreshold:
        DS8 4
//  161 
//  162 
//  163 
//  164 
//  165 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  166 void firstshot()
//  167 {
firstshot:
        PUSH     {R7,LR}
//  168 //单次采集曝光处理                   
//  169 GPIOC_PDOR |=  (1<<9);//TSL_SI=1; //上升沿
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  170 delay();  
        BL       delay
//  171 GPIOC_PDOR |=  (1<<8);//TSL_CLK=1;//起始电平高
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  172 //delay();
//  173 GPIOC_PDOR &= ~(1<<9);//TSL_SI=0; //起始电平低
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x200
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  174 //发送第1个CLK
//  175 delay();
        BL       delay
//  176 GPIOC_PDOR &= ~(1<<8);//TSL_CLK=0;//下降沿  
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  177 
//  178 //发送第2~129个CLK
//  179 for(i=1; i<129; i++)
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
        B.N      ??firstshot_0
//  180 {
//  181 delay();
??firstshot_1:
        BL       delay
//  182 GPIOC_PDOR |=  (1<<8);//TSL_CLK=1;//起始电平高
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  183 delay(); 
        BL       delay
//  184 GPIOC_PDOR &= ~(1<<8);//TSL_CLK=0;//下降沿  
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  185 }
        LDR.N    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
??firstshot_0:
        LDR.N    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+129
        BLT.N    ??firstshot_1
//  186 FieldCnt++;
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  187 }
        POP      {R0,PC}          ;; return
//  188 
//  189 
//  190 //*************************************************************************
//  191 //  * 单次采集
//  192 //************************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  193 void TSL1401_GetLine_Oneshot(uint8 *pixel)
//  194 {
TSL1401_GetLine_Oneshot:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  195 uint8 i;
//  196 //  byte  Er;
//  197 byte  po;
//  198 //曝光延时
//  199 //采集上次曝光得到的图像
//  200 //开始SI
//  201 GPIOC_PDOR |=  (1<<9);//TSL_SI=1; //上升沿
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  202 delay();
        BL       delay
//  203 GPIOC_PDOR |=  (1<<8);//TSL_CLK=1;//起始电平高
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  204 //delay();
//  205 GPIOC_PDOR &= ~(1<<9);//TSL_SI=0; //起始电平低      ADV
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x200
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  206 //delay();
//  207 //采集第1个点
//  208 
//  209 for(f=0;f<500;f++)
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_3
        STR      R0,[R1, #+0]
        B.N      ??TSL1401_GetLine_Oneshot_0
//  210 { delay();}   
??TSL1401_GetLine_Oneshot_1:
        BL       delay
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_3
        STR      R0,[R1, #+0]
??TSL1401_GetLine_Oneshot_0:
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+500
        BLT.N    ??TSL1401_GetLine_Oneshot_1
//  211 
//  212 //       po = ad_once(1,15,8);  
//  213 po = ad_once(1,17,8);                                  //AD赋值
        MOVS     R2,#+8
        MOVS     R1,#+17
        MOVS     R0,#+1
        BL       ad_once
//  214 //  pixel[0] =po<<2;
//  215 pixel[0] = po ;
        STRB     R0,[R4, #+0]
//  216 // Er    =   PTA12;
//  217 // pixel[0]  =  Er ;
//  218 //   pixel[0] =  PTA12;
//  219 GPIOC_PDOR &= ~(1<<8);//TSL_CLK=0;//下降沿  
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  220 //采集第1~128个点
//  221 for(i=1; i<128; i++)
        MOVS     R5,#+1
        B.N      ??TSL1401_GetLine_Oneshot_2
//  222 { 
//  223 //delay(); 
//  224 delay();
??TSL1401_GetLine_Oneshot_3:
        BL       delay
//  225 GPIOC_PDOR |=  (1<<8);    //TSL_CLK=1;//起始电平高
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  226 po = ad_once(1,17,8);                             //AD赋值
        MOVS     R2,#+8
        MOVS     R1,#+17
        MOVS     R0,#+1
        BL       ad_once
//  227 //  pixel[i] = po<<2 ;
//  228 pixel[i] =  po;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STRB     R0,[R5, R4]
//  229 // Er  = PTA12;
//  230 //   pixel[i] = Er;
//  231 //   pixel[i] = PTA12;
//  232 
//  233 GPIOC_PDOR &= ~(1<<8);//TSL_CLK=0;//下降沿  
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  234 }
        ADDS     R5,R5,#+1
??TSL1401_GetLine_Oneshot_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+128
        BLT.N    ??TSL1401_GetLine_Oneshot_3
//  235 //发送第129个clk
//  236 delay();
        BL       delay
//  237 GPIOC_PDOR &= ~(1<<8);//TSL_CLK=0;//下降沿  
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x100
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  238 delay(); 
        BL       delay
//  239 GPIOC_PDOR |=  (1<<8);//TSL_CLK=1;//起始电平高
        LDR.N    R0,??DataTable1  ;; 0x400ff080
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable1  ;; 0x400ff080
        STR      R0,[R1, #+0]
//  240 delay();
        BL       delay
//  241 }
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     i

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     FieldCnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     f
//  242 
//  243 
//  244 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  245 int GrayMinl;          //左灰度最小值，初始化为255 
GrayMinl:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  246 int GrayMaxl;          //左灰度最大值，初始化为0
GrayMaxl:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  247 word GrayMinPtrL;       //左灰度最小值指针，初始化为0
GrayMinPtrL:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  248 word GrayMaxPtrL;       //左灰度最大值指针，初始化为0
GrayMaxPtrL:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  249 byte GrayMaxMinflagL;   //左灰度最大最小值标志
GrayMaxMinflagL:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  250 byte GrayMinr;          //右灰度最小值，初始化为255
GrayMinr:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  251 byte GrayMaxr;          //右灰度最大值，初始化为0
GrayMaxr:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  252 word GrayMinPtrR;       //右灰度最小值指针，初始化为0
GrayMinPtrR:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  253 word GrayMaxPtrR;       //右灰度最大值指针，初始化为0      
GrayMaxPtrR:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  254 byte GrayMaxMinflagR;   //右灰度最大最小值标志      
GrayMaxMinflagR:
        DS8 1
//  255 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  256 byte error_flag=0;
error_flag:
        DS8 1
//  257 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  258 byte len_show[10]={80,80,80,80,80};
len_show:
        DATA
        DC8 80, 80, 80, 80, 80, 0, 0, 0, 0, 0, 0, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  259 long  len_realsum=0;
len_realsum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  260 long  len_real=0; 
len_real:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  261 int  len_realcnt;
len_realcnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  262 int dir_error=0;
dir_error:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  263 int issue_threshold;
issue_threshold:
        DS8 4
//  264 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  265 int aa[5]={0,0,0,0,0};
aa:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  266 int barrier_dss;
barrier_dss:
        DS8 4
//  267 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  268 byte GrayleftedgeL;
GrayleftedgeL:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  269 byte GrayleftedgeR;
GrayleftedgeR:
        DS8 1
//  270 
//  271 
//  272 
//  273 
//  274 
//  275 
//  276 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  277 void Dev_cal()
//  278 {
//  279 
//  280 cnt=0;
Dev_cal:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2
        STR      R0,[R1, #+0]
//  281 Add_threshold=0;     //清阈值和  
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  282 
//  283 //****************************************************************************************
//  284 // 计算动态阈值
//  285 //****************************************************************************************CNT        
//  286 i=0;  
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
//  287 for(j=10;j<=118;j++)
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_0
//  288 {
//  289 Add_threshold += ADV[j];      
??Dev_cal_1:
        LDR.W    R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        ADDS     R0,R0,R1
        LDR.W    R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  290 if(ADV[j]>LGrayMax-5)
        LDR.W    R0,??DataTable2_5
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BGE.N    ??Dev_cal_2
//  291 cnt++; 
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2
        STR      R0,[R1, #+0]
//  292 if(ADV[j]>220)
??Dev_cal_2:
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        CMP      R0,#+221
        BLT.N    ??Dev_cal_3
//  293 i++;
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
//  294 }
??Dev_cal_3:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_0:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+119
        BLT.N    ??Dev_cal_1
//  295 Cnt[0]=cnt;
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_6
        STR      R0,[R1, #+0]
//  296 CNT[0]=i;
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_7
        STR      R0,[R1, #+0]
//  297 
//  298 threshold = Add_threshold/109;    //计算阈值
        LDR.W    R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+109
        UDIV     R0,R0,R1
        LDR.W    R1,??DataTable2_8
        STR      R0,[R1, #+0]
//  299 
//  300 THreshold[0] = threshold;
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_9
        STR      R0,[R1, #+0]
//  301 
//  302 
//  303 Stopflag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  304 
//  305 for(i=0;i<119;i++)
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_4
//  306 {
//  307 if((L_edgeFlag[0]+R_edgeFlag[0]==0))
//  308 {
//  309 Stopflag++;      
??Dev_cal_5:
        LDR.W    R0,??DataTable2_10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  310 }
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
??Dev_cal_4:
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+119
        BGE.N    ??Dev_cal_6
        LDR.W    R0,??DataTable2_11
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_12
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        CMP      R0,#+0
        BEQ.N    ??Dev_cal_5
//  311 else
//  312 {
//  313 break;
//  314 }  
//  315 }
//  316 
//  317 
//  318 
//  319 
//  320 
//  321 ///*   
//  322 
//  323 //    /****************************中值滤波提取黑线最黑值,作为假设的黑线位置****************************************      
//  324 
//  325 
//  326 GrayMin=255;
??Dev_cal_6:
        MOVS     R0,#+255
        LDR.W    R1,??DataTable2_13
        STR      R0,[R1, #+0]
//  327 GrayMax=0; 
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_14
        STR      R0,[R1, #+0]
//  328 
//  329 
//  330 
//  331 for(i=10;i<117;i++)
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_7
//  332 {
//  333 
//  334 
//  335 if(ADV[i]<GrayMin)
//  336 {
//  337 if(ADV[i-1]>ADV[i+1])
//  338 {
//  339 if(ADV[i]>ADV[i-1])
//  340 {
//  341 ADV[i]=ADV[i-1];
//  342 }
//  343 else if(ADV[i]<ADV[i+1])
//  344 {                                                     
//  345 ADV[i]=ADV[i+1];
//  346 }
//  347 }
//  348 else
//  349 {
//  350 if(ADV[i]>ADV[i+1])
//  351 {
//  352 ADV[i]=ADV[i+1];
//  353 }
//  354 else if(ADV[i]<ADV[i-1])
//  355 {
//  356 ADV[i]=ADV[i-1];
//  357 }
//  358 }
//  359 if(ADV[i]<GrayMin)
//  360 {
//  361 GrayMin = ADV[i];                    
//  362 
//  363 }
//  364 }
//  365 ///********************************中值滤波，提取赛道中的最白处*************************************************          
//  366 if(ADV[i]>GrayMax)
//  367 {
//  368 if(ADV[i-1]>ADV[i+1])
//  369 {
//  370 if(ADV[i]>ADV[i-1])
//  371 {
//  372 ADV[i]=ADV[i-1];
//  373 }
//  374 else if(ADV[i]<ADV[i+1])
//  375 {
//  376 ADV[i]=ADV[i+1];
//  377 }
//  378 }
//  379 else
//  380 {
//  381 if(ADV[i]>ADV[i+1])
//  382 {
//  383 ADV[i]=ADV[i+1];
//  384 }
//  385 else if(ADV[i]<ADV[i-1])
??Dev_cal_8:
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_9
//  386 {
//  387 ADV[i]=ADV[i-1];
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
//  388 }
//  389 }
//  390 if(ADV[i]>GrayMax)
??Dev_cal_9:
        LDR.W    R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BGE.N    ??Dev_cal_10
//  391 {
//  392 GrayMax=ADV[i];
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable2_14
        STR      R0,[R1, #+0]
//  393 // GrayMaxPtr = i;
//  394 }
??Dev_cal_10:
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
??Dev_cal_7:
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+117
        BGE.W    ??Dev_cal_11
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable2_13
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.W    ??Dev_cal_12
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_13
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_14
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_cal_15
??Dev_cal_14:
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_15
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_cal_15
??Dev_cal_13:
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_16
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_cal_15
??Dev_cal_16:
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_15
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
??Dev_cal_15:
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable2_13
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??Dev_cal_12
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable2_13
        STR      R0,[R1, #+0]
??Dev_cal_12:
        LDR.W    R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BGE.W    ??Dev_cal_10
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_17
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_18
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_cal_9
??Dev_cal_18:
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BCS.W    ??Dev_cal_9
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_cal_9
??Dev_cal_17:
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.W    ??Dev_cal_8
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
        B.N      ??Dev_cal_9
//  395 
//  396 }
//  397 }
//  398 
//  399 GrayMIN[0]=GrayMin;
??Dev_cal_11:
        LDR.W    R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_15
        STR      R0,[R1, #+0]
//  400 GrayMAX[0]=GrayMax;
        LDR.W    R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_16
        STR      R0,[R1, #+0]
//  401 
//  402 ////////////////////////////////////////////////////////////    
//  403 //////////////////////////////////////////////////////////// 
//  404 ////////////////////////////////////////////////////////////     
//  405 for(j=0;j<10;j++)
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_19
//  406 X[j]=0;
??Dev_cal_20:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_17
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        STR      R0,[R1, R2, LSL #+2]
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_19:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+10
        BLT.N    ??Dev_cal_20
//  407 
//  408 i=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
//  409 for(j=0;j<127;j++)
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_21
//  410 {
//  411 if(((ADV[j-1]<=threshold)&&(ADV[j]>threshold))||((ADV[j]>threshold)&&(ADV[j+1]<=threshold)))
??Dev_cal_22:
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BLT.N    ??Dev_cal_23
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BLT.N    ??Dev_cal_24
??Dev_cal_23:
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BGE.N    ??Dev_cal_25
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BLT.N    ??Dev_cal_25
//  412 {
//  413 X[i]=j;
??Dev_cal_24:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_17
        LDR.W    R2,??DataTable2_2
        LDR      R2,[R2, #+0]
        STR      R0,[R1, R2, LSL #+2]
//  414 i++;
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
//  415 j++;
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
//  416 }  
//  417 }        
??Dev_cal_25:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_21:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+127
        BLT.N    ??Dev_cal_22
//  418 
//  419 ////////////////////////////////////////////////////////////    
//  420 //////////////////////////////////////////////////////////// 
//  421 ////////////////////////////////////////////////////////////    
//  422 
//  423 
//  424 
//  425 
//  426 
//  427 
//  428 
//  429 
//  430 
//  431 
//  432 //*****************************************************************************          
//  433 //寻找左线 上跳沿 
//  434 //***************************************************************************** 
//  435 
//  436 startl=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_18
        STR      R0,[R1, #+0]
//  437 for(j=64;j>10;j--)
        MOVS     R0,#+64
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_26
//  438 {
//  439 if(ADV[j]>220)
??Dev_cal_27:
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        CMP      R0,#+221
        BLT.N    ??Dev_cal_28
//  440 {
//  441 startl++;
        LDR.W    R0,??DataTable2_18
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_18
        STR      R0,[R1, #+0]
//  442 }       
//  443 }
??Dev_cal_28:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_26:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BGE.N    ??Dev_cal_27
//  444 Startl[0]=startl;
        LDR.W    R0,??DataTable2_18
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_19
        STR      R0,[R1, #+0]
//  445 
//  446 
//  447 
//  448 
//  449 L_edgeFlag[0]=0; 
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
//  450 yanLL=midline-64;
        LDR.W    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+64
        LDR.W    R1,??DataTable2_21
        STR      R0,[R1, #+0]
//  451 if(yanLL<10)
        LDR.W    R0,??DataTable2_21
        LDR      R0,[R0, #+0]
        CMP      R0,#+10
        BGE.N    ??Dev_cal_29
//  452 yanLL=10;                     //划定左跳沿范围
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2_21
        STR      R0,[R1, #+0]
//  453 
//  454 for(j=midline;j>yanLL;j--)
??Dev_cal_29:
        LDR.W    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_30
??Dev_cal_31:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_30:
        LDR.W    R0,??DataTable2_21
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.W    ??Dev_cal_32
//  455 {
//  456 if(ADV[j]>threshold)
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BGE.N    ??Dev_cal_31
//  457 
//  458 if(ADV[j+1]>ADV[j])  
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_31
//  459 if(ADV[j]>ADV[j-1])
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_31
//  460 if(ADV[j-1]>ADV[j-2])
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-2]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_31
//  461 
//  462 if(ADV[j-1]<=threshold)
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BLT.N    ??Dev_cal_31
//  463 
//  464 if((ADV[j+1]-ADV[j-2])>Ka)  
        LDR.W    R0,??DataTable2_22
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        LDR.W    R2,??DataTable2_4
        LDR.W    R3,??DataTable2_3
        LDR      R3,[R3, #+0]
        ADDS     R2,R3,R2
        LDRB     R2,[R2, #-2]
        SUBS     R1,R1,R2
        CMP      R0,R1
        BGE.N    ??Dev_cal_31
//  465 if((ADV[j+5]-ADV[j-5])>50)  
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-5]
        SUBS     R0,R0,R1
        CMP      R0,#+51
        BLT.W    ??Dev_cal_31
//  466 
//  467 
//  468 if(ADV[j+2]>ADV[j-2])   
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-2]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+2]
        CMP      R0,R1
        BCS.W    ??Dev_cal_31
//  469 
//  470 
//  471 if(ADV[j+7]>220)
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+7]
        CMP      R0,#+221
        BLT.W    ??Dev_cal_31
//  472 
//  473 { 
//  474 Ledge[0] = j;              
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3
        STR      R0,[R1, #+0]
//  475 L_edgeFlag[0]=1;  
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
//  476 break;
//  477 }
//  478 }
//  479 
//  480 
//  481 
//  482 
//  483 //******************************************************************************      
//  484 //寻找右 下跳沿
//  485 //****************************************************************************** 
//  486 
//  487 
//  488 
//  489 
//  490 startr=0;
??Dev_cal_32:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_23
        STR      R0,[R1, #+0]
//  491 for(j=64;j<117;j++)
        MOVS     R0,#+64
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_33
//  492 {  
//  493 if(ADV[j]>220)
??Dev_cal_34:
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        CMP      R0,#+221
        BLT.N    ??Dev_cal_35
//  494 {
//  495 startr++;
        LDR.W    R0,??DataTable2_23
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_23
        STR      R0,[R1, #+0]
//  496 }     
//  497 }
??Dev_cal_35:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_33:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+117
        BLT.N    ??Dev_cal_34
//  498 Startr[0]=startr;
        LDR.W    R0,??DataTable2_23
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_1
        STR      R0,[R1, #+0]
//  499 
//  500 
//  501 
//  502 R_edgeFlag[0]=0;  
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_12
        STRB     R0,[R1, #+0]
//  503 yanRR=midline+64;
        LDR.W    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+64
        LDR.W    R1,??DataTable3_2
        STR      R0,[R1, #+0]
//  504 if( yanRR>117)                   //划定右跳沿范围
        LDR.W    R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+118
        BLT.N    ??Dev_cal_36
//  505 yanRR=117; 
        MOVS     R0,#+117
        LDR.W    R1,??DataTable3_2
        STR      R0,[R1, #+0]
//  506 
//  507 for(j=midline;j<yanRR;j++)
??Dev_cal_36:
        LDR.W    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_37
??Dev_cal_38:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_37:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.W    ??Dev_cal_39
//  508 
//  509 {
//  510 
//  511 if(ADV[j]>threshold)
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BGE.N    ??Dev_cal_38
//  512 
//  513 if(ADV[j-1]>ADV[j])   
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_38
//  514 if(ADV[j]>ADV[j+1])
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_38
//  515 if(ADV[j+1]>ADV[j+2])  
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+2]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BCS.N    ??Dev_cal_38
//  516 
//  517 if(ADV[j+1]<=threshold)
        LDR.W    R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BLT.N    ??Dev_cal_38
//  518 
//  519 if((ADV[j-1]-ADV[j+2])>Ka)  
        LDR.W    R0,??DataTable2_22
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-1]
        LDR.W    R2,??DataTable2_4
        LDR.W    R3,??DataTable2_3
        LDR      R3,[R3, #+0]
        ADDS     R2,R3,R2
        LDRB     R2,[R2, #+2]
        SUBS     R1,R1,R2
        CMP      R0,R1
        BGE.N    ??Dev_cal_38
//  520 if((ADV[j-5]-ADV[j+5])>50)  
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-5]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+5]
        SUBS     R0,R0,R1
        CMP      R0,#+51
        BLT.N    ??Dev_cal_38
//  521 
//  522 if(ADV[j-2]>ADV[j+2])
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+2]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #-2]
        CMP      R0,R1
        BCS.W    ??Dev_cal_38
//  523 
//  524 
//  525 
//  526 if(ADV[j-7]>220)            
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-7]
        CMP      R0,#+221
        BLT.W    ??Dev_cal_38
//  527 { 
//  528 Redge[0] = j;              
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
//  529 R_edgeFlag[0]=1;  
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_12
        STRB     R0,[R1, #+0]
//  530 break;
//  531 }            
//  532 }
//  533 
//  534 
//  535 
//  536 
//  537 
//  538 
//  539 //******************************************************************************      
//  540 //计算赛道宽度
//  541 //******************************************************************************       
//  542 if(Ledge[0]>Redge[0])
??Dev_cal_39:
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??Dev_cal_40
//  543 {
//  544 L_edgeFlag[0]=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
//  545 R_edgeFlag[0]=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_12
        STRB     R0,[R1, #+0]
//  546 Redge[0]=Redge[1];
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
//  547 Ledge[0]=Ledge[1];
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3
        STR      R0,[R1, #+0]
//  548 len_show[0]=len_show[1];        
        LDR.W    R0,??DataTable3_4
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        STRB     R0,[R1, #+0]
        B.N      ??Dev_cal_41
//  549 }
//  550 else
//  551 {
//  552 if(L_edgeFlag[0]+R_edgeFlag[0]==2)
??Dev_cal_40:
        LDR.W    R0,??DataTable2_11
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable2_12
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        CMP      R0,#+2
        BNE.N    ??Dev_cal_42
//  553 {  
//  554 len_show[0]=Redge[0]-Ledge[0];
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable3_4
        STRB     R0,[R1, #+0]
//  555 
//  556 if(len_show[0]<35)
        LDR.W    R0,??DataTable3_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+35
        BGE.N    ??Dev_cal_41
//  557 {
//  558 L_edgeFlag[0]=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
//  559 R_edgeFlag[0]=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_12
        STRB     R0,[R1, #+0]
//  560 Redge[0]=Redge[1];
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
//  561 Ledge[0]=Ledge[1];
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3
        STR      R0,[R1, #+0]
//  562 len_show[0]=len_show[1];    
        LDR.W    R0,??DataTable3_4
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        STRB     R0,[R1, #+0]
        B.N      ??Dev_cal_41
//  563 }
//  564 }
//  565 else
//  566 {
//  567 len_show[0]=len_show[1];
??Dev_cal_42:
        LDR.W    R0,??DataTable3_4
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        STRB     R0,[R1, #+0]
//  568 }    
//  569 }
//  570 
//  571 
//  572 //////////////////////////////////////////////////////////////     
//  573 //if(FieldCnt>500)
//  574 //if(FieldCnt<=550)
//  575 //if(Ess[0]<=4)
//  576 //if(L_edgeFlag[0]+R_edgeFlag[0]==2)
//  577 //{
//  578 //len_realsum=len_realsum+len_show[0];
//  579 //len_realcnt++;
//  580 //BmaCnt=2;
//  581 //}
//  582 ////////////////////////////////////////////////////////////////
//  583 
//  584 
//  585 
//  586 
//  587 ///////////////////////////////////////////////////
//  588 ///砖头
//  589 ///////////////////////////////////////////////////
//  590 
//  591 //Blockflag=0;
//  592 //BlockFlag=0;
//  593 //
//  594 //
//  595 //if(BlocklEN)
//  596 //if(FieldCnt>100)
//  597 //if(CNT[7]-CNT[0]>10) 
//  598 //if(GrayMAX[0]>220)
//  599 //if(THreshold[7]-THreshold[0]>10)   
//  600 //
//  601 //
//  602 //if(R_edgeFlag[0]==1)
//  603 //if(R_edgeFlag[1]==1)
//  604 //if(R_edgeFlag[2]==1)
//  605 //if(R_edgeFlag[3]==1)
//  606 //if(R_edgeFlag[4]==1)
//  607 //if(R_edgeFlag[5]==1)
//  608 //
//  609 //
//  610 //
//  611 //if(abs(Redge[5]-Redge[0])<8)
//  612 //
//  613 //
//  614 //if(L_edgeFlag[0]==1)
//  615 //if(L_edgeFlag[1]==1)
//  616 ////if(L_edgeFlag[2]==1)
//  617 ////if(L_edgeFlag[3]==1)
//  618 //if(L_edgeFlag[4]==1)
//  619 //if(L_edgeFlag[5]==1)
//  620 //
//  621 //if((Ledge[0]-Ledge[5])>15)
//  622 //
//  623 //
//  624 //
//  625 //{  
//  626 //Blockflagl=1; 
//  627 //}
//  628 //
//  629 //if(Blockflagl)
//  630 //{ 
//  631 //Blockflagl++;
//  632 //if(Blockflagl<40)
//  633 //{
//  634 //L_edgeFlag[0]=1;   
//  635 //Ledge[0]=Redge[0]-31;
//  636 //
//  637 //
//  638 //if(Blockflagl<30)
//  639 //{
//  640 //L_edgeFlag[0]=1;   
//  641 //Ledge[0]=Redge[0]-29;   
//  642 //}
//  643 //
//  644 //if(Blockflagl<20)
//  645 //{
//  646 //L_edgeFlag[0]=1;   
//  647 //Ledge[0]=Redge[0]-22;   
//  648 //}
//  649 //
//  650 //
//  651 //if(Blockflagl<10)
//  652 //{
//  653 //L_edgeFlag[0]=1;   
//  654 //Ledge[0]=Redge[0]-20;   
//  655 //}
//  656 //
//  657 ////BmaCnt=5;
//  658 //}
//  659 //else
//  660 //{
//  661 //Blockflagl=0;
//  662 //}
//  663 //} 
//  664 //
//  665 //
//  666 //
//  667 //
//  668 //
//  669 //
//  670 //
//  671 //
//  672 //
//  673 //
//  674 //
//  675 //if(BlockrEN)
//  676 //if(FieldCnt>100)
//  677 //if(CNT[7]-CNT[0]>10) 
//  678 //if(GrayMAX[0]>220)
//  679 //if(THreshold[7]-THreshold[0]>10)  
//  680 //
//  681 //
//  682 //if(R_edgeFlag[0]==1)
//  683 //if(R_edgeFlag[1]==1)
//  684 ////if(R_edgeFlag[2]==1)
//  685 ////if(R_edgeFlag[3]==1)
//  686 //if(R_edgeFlag[4]==1)
//  687 //if(R_edgeFlag[5]==1)
//  688 //
//  689 //if((Redge[5]-Redge[0])>15)
//  690 //
//  691 //
//  692 //
//  693 //
//  694 //if(L_edgeFlag[0]==1)
//  695 //if(L_edgeFlag[1]==1)
//  696 //if(L_edgeFlag[2]==1)
//  697 //if(L_edgeFlag[3]==1)
//  698 //if(L_edgeFlag[4]==1)
//  699 //if(L_edgeFlag[5]==1)
//  700 //
//  701 //
//  702 //if(abs(Ledge[0]-Ledge[5])<8)
//  703 //
//  704 //
//  705 //
//  706 //{  
//  707 //Blockflagr=1; 
//  708 //
//  709 //}
//  710 //
//  711 //
//  712 //if(Blockflagr)
//  713 //{ 
//  714 //Blockflagr++;
//  715 //
//  716 //if(Blockflagr<40)
//  717 //{
//  718 //R_edgeFlag[0]=1;  
//  719 //Redge[0]=Ledge[0]+31;
//  720 //
//  721 //if(Blockflagr<30)
//  722 //{
//  723 //R_edgeFlag[0]=1;  
//  724 //Redge[0]=Ledge[0]+29;  
//  725 //}
//  726 //
//  727 //if(Blockflagr<20)
//  728 //{
//  729 //R_edgeFlag[0]=1;  
//  730 //Redge[0]=Ledge[0]+22;  
//  731 //}
//  732 //if(Blockflagr<10)
//  733 //{
//  734 //R_edgeFlag[0]=1;  
//  735 //Redge[0]=Ledge[0]+20;  
//  736 //}
//  737 //
//  738 ////BmaCnt=5; 
//  739 //}
//  740 //else
//  741 //{
//  742 //Blockflagr=0;
//  743 //}
//  744 //} 
//  745 
//  746 
//  747 
//  748 
//  749 
//  750 
//  751 
//  752 
//  753 
//  754 ///////////////////////////////////////////////////////////////////
//  755 ///////////////////////////////////////////////////////////////////
//  756 
//  757 
//  758 
//  759 ///////////////////////////////////////////////////////////////////
//  760 ////////十字
//  761 ///////////////////////////////////////////////////////////////////
//  762 //if(!Singleflag[0])
//  763 //if(!Singleflag[1])
//  764 //if(!Singleflag[2])
//  765 //if(!Singleflag[3])
//  766 //if(!Singleflag[4])
//  767 //if(!Singleflag[5])
//  768 //if(!Singleflag[6])
//  769 //if(WhiteEN)
//  770 //{
//  771 //white_mark=0;
//  772 //
//  773 //if(FieldCnt>100)
//  774 //if(CNT[0]-CNT[7]>10) 
//  775 //if(GrayMAX[0]>220)
//  776 //if(THreshold[0]-THreshold[7]>5)
//  777 //if(abs(Ess[3])<20)
//  778 //if(L_edgeFlag[0]==0)
//  779 //if(L_edgeFlag[1]==0)
//  780 //if(L_edgeFlag[2]==0)
//  781 //
//  782 //
//  783 //
//  784 //
//  785 //
//  786 //if(R_edgeFlag[0]==0)
//  787 //if(R_edgeFlag[1]==0)
//  788 //if(R_edgeFlag[2]==0)
//  789 //
//  790 //
//  791 //
//  792 //
//  793 //if(R_edgeFlag[3]==1||L_edgeFlag[3])
//  794 //
//  795 //
//  796 //white_mark=1;
//  797 //
//  798 //
//  799 //if(white_mark)
//  800 //{
//  801 //White_mark=1;
//  802 //
//  803 //}
//  804 //
//  805 //if(White_mark)
//  806 //{
//  807 // BmaCnt=1;
//  808 //White_mark++;
//  809 //if(White_mark<7)
//  810 //{
//  811 //L_edgeFlag[0]==1;
//  812 //R_edgeFlag[0]==1;
//  813 //Redge[0]=Redge[3];
//  814 //Ledge[0]=Ledge[3];
//  815 //Redge[2]=Redge[3];
//  816 //Ledge[2]=Ledge[3];
//  817 //}
//  818 //}
//  819 //
//  820 //if(White_mark>100)
//  821 //{
//  822 // 
//  823 //White_mark=0;
//  824 //}
//  825 //
//  826 //}
//  827 
//  828 
//  829 
//  830 
//  831 /*/////////////////////////////////////////////////////////////////////////////////*/
//  832 
//  833 
//  834 /*///////////////////////////////////////////////
//  835 ///////直角弯
//  836 //////////////////////////////////////////////*/
//  837 
//  838 
//  839 
//  840 /*/////////////////////////////////////////////////////////////////////////////////*/
//  841 
//  842 ////Elbowbendflag=0;
//  843 //Blackflag=0;
//  844 //Blackflagr=0;
//  845 //Blackflagl=0;
//  846 //
//  847 //
//  848 //
//  849 ////    if(FieldCnt>100)
//  850 ////    if(GrayMAX[0]<150)
//  851 ////    if(THreshold[8]-THreshold[0]>60)
//  852 ////    Blackflag=1; 
//  853 //
//  854 //if(BlackflagEN)
//  855 //if(FieldCnt>100)
//  856 //if(Ess[5]<30)
//  857 //if(R_edgeFlag[0]==0)
//  858 //if(L_edgeFlag[0]==0)
//  859 //if(GrayMAX[0]<150)
//  860 //if(CNT[0]<10)
//  861 //{
//  862 //Blackflag=1; 
//  863 //}
//  864 //
//  865 //
//  866 //
//  867 ////if(!BlackFlag)
//  868 //if(Blackflagr||Blackflagl||Blackflag)
//  869 //
//  870 //{
//  871 //
//  872 //BlackFlag=1;
//  873 ////BmaCnt=5;
//  874 //}
//  875 //
//  876 //
//  877 ///////////////////////////////////////
//  878 //if(BlackFlag)
//  879 //{
//  880 ////BmaCnt=5;
//  881 //if(R_edgeFlag[0]==0||L_edgeFlag[0]==0) 
//  882 //{
//  883 //R_edgeFlag[0]=1;
//  884 //Redge[0]=Redge[7];
//  885 //L_edgeFlag[0]=1;
//  886 //Ledge[0]=Ledge[7];
//  887 //Redge[6]=Redge[7];
//  888 //Ledge[6]=Ledge[7];
//  889 //}
//  890 //else
//  891 //{
//  892 ////BmaCnt=5;
//  893 //BlackFlag=0;
//  894 //BlackFlagcnt++;
//  895 //Elbowbendflag=1; 
//  896 //}
//  897 //}
//  898 //
//  899 //
//  900 //
//  901 ////  if(BlackFlagcnt)
//  902 ////  {
//  903 ////    
//  904 ////  }
//  905 //
//  906 //if(BlackFlagcnt>1)
//  907 //{
//  908 //BlackFlagcnt=0;
//  909 //Elbowbendflag=0;
//  910 //}
//  911 //
//  912 //
//  913 //
//  914 //if(ElbowbendrEN)
//  915 //if(Elbowbendflag)
//  916 //{
//  917 //if(THreshold[0]>=THreshold[5])
//  918 //
//  919 //
//  920 //if(R_edgeFlag[0]==1)
//  921 //if(R_edgeFlag[1]==1)
//  922 //if(R_edgeFlag[2]==1)
//  923 //
//  924 //
//  925 //
//  926 //if(Startl[0]>=Startl[3])
//  927 //if(L_edgeFlag[0]==0)
//  928 //if(L_edgeFlag[1]==0)                   
//  929 //{
//  930 //Elbowbendflagl=D_I;
//  931 //Elbowbendflag=0;                    
//  932 //}    
//  933 //}
//  934 //
//  935 //
//  936 //if(ElbowbendlEN)
//  937 //if(Elbowbendflag)
//  938 //{      
//  939 //if(THreshold[0]>=THreshold[5])
//  940 //
//  941 //if(Startr[0]>=Startr[3])
//  942 //
//  943 //if(R_edgeFlag[0]==0)
//  944 //if(R_edgeFlag[1]==0)
//  945 //
//  946 //if(L_edgeFlag[0]==1)
//  947 //if(L_edgeFlag[1]==1)
//  948 //if(L_edgeFlag[2]==1)                   
//  949 //{
//  950 //
//  951 //Elbowbendflagr=D_I;
//  952 //Elbowbendflag=0;
//  953 //}    
//  954 //}
//  955 //
//  956 //if(Elbowbendflagl>0)
//  957 //{
//  958 //Elbowbendflagl--;
//  959 //Blackflag=0;
//  960 //}
//  961 //
//  962 //if(Elbowbendflagr>0)
//  963 //{
//  964 //Elbowbendflagr--;
//  965 //Blackflag=0;
//  966 //}
//  967 //
//  968 //
//  969 //if(FieldCnt>100)
//  970 //if(abs(Ess[0])<5)
//  971 //if(R_edgeFlag[0]==1)
//  972 //if(R_edgeFlag[1]==1)
//  973 //if(R_edgeFlag[2]==1)
//  974 //if(R_edgeFlag[3]==1)
//  975 //if(R_edgeFlag[4]==1)
//  976 //if(R_edgeFlag[5]==1)
//  977 //if(abs(Redge[5]-Redge[0])<8)
//  978 //if(L_edgeFlag[0]==0)
//  979 //if(L_edgeFlag[1]==0)
//  980 //if(L_edgeFlag[2]==1)
//  981 //if(L_edgeFlag[3]==1)
//  982 //if(L_edgeFlag[4]==1)
//  983 //if(L_edgeFlag[5]==1)
//  984 //if(abs(Ledge[5]-Ledge[2])<8)
//  985 //{
//  986 // //BmaCnt=10;
//  987 //}
//  988 //
//  989 //if(FieldCnt>100)
//  990 //if(abs(Ess[0])<5)
//  991 //if(L_edgeFlag[0]==1)
//  992 //if(L_edgeFlag[1]==1)
//  993 //if(L_edgeFlag[2]==1)
//  994 //if(L_edgeFlag[3]==1)
//  995 //if(L_edgeFlag[4]==1)
//  996 //if(L_edgeFlag[5]==1)
//  997 //if(abs(Ledge[5]-Ledge[0])<8)
//  998 //if(R_edgeFlag[0]==0)
//  999 //if(R_edgeFlag[1]==0)
// 1000 //if(R_edgeFlag[2]==1)
// 1001 //if(R_edgeFlag[3]==1)
// 1002 //if(R_edgeFlag[4]==1)
// 1003 //if(R_edgeFlag[5]==1)
// 1004 //if(abs(Redge[5]-Redge[2])<8)
// 1005 //{
// 1006 // //BmaCnt=10;
// 1007 //}
// 1008 
// 1009 
// 1010 
// 1011 ///////////////////////////////////////////////////////////////////////////////////////////
// 1012 ///////////////////////////////////////////////////////////////////////////////////////////
// 1013 ////////////////////////      单
// 1014 ////////////////////////      线
// 1015 //////////////////////////////////////////////////////////////////////////////////////////
// 1016 //////////////////////////////////////////////////////////////////////////////////////////
// 1017 
// 1018 
// 1019 
// 1020 
// 1021 
// 1022 if(SinglineEN)
??Dev_cal_41:
        LDR.W    R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??Dev_cal_43
// 1023 //if(R_edgeFlag[0]==1||L_edgeFlag[0]==1)
// 1024 //if(!White_mark)
// 1025 {
// 1026  
// 1027  
// 1028  singleflag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_6
        STR      R0,[R1, #+0]
// 1029  single=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_7
        STR      R0,[R1, #+0]
// 1030 
// 1031 if(midline<40)
        LDR.W    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        CMP      R0,#+40
        BGE.N    ??Dev_cal_44
// 1032 singleL=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable3_8
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_45
// 1033 else
// 1034 singleL=midline-30;
??Dev_cal_44:
        LDR.W    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+30
        LDR.W    R1,??DataTable3_8
        STR      R0,[R1, #+0]
// 1035 
// 1036 if(midline>87)
??Dev_cal_45:
        LDR.W    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        CMP      R0,#+88
        BLT.N    ??Dev_cal_46
// 1037 singleR=117;
        MOVS     R0,#+117
        LDR.W    R1,??DataTable3_9
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_47
// 1038 else
// 1039 singleR=midline+30;
??Dev_cal_46:
        LDR.W    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+30
        LDR.W    R1,??DataTable3_9
        STR      R0,[R1, #+0]
// 1040 
// 1041 
// 1042 for(j=15;j<112;j++)
??Dev_cal_47:
        MOVS     R0,#+15
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_48
??Dev_cal_49:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_48:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+112
        BGE.N    ??Dev_cal_50
// 1043 {
// 1044 if((ADV[j-6]-ADV[j])>60&&(ADV[j+6]-ADV[j])>60)
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-6]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        SUBS     R0,R0,R1
        CMP      R0,#+61
        BLT.N    ??Dev_cal_49
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+6]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        SUBS     R0,R0,R1
        CMP      R0,#+61
        BLT.N    ??Dev_cal_49
// 1045 if(ADV[j]<=ADV[j-1])
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCC.N    ??Dev_cal_49
// 1046 if(ADV[j]<=ADV[j+1])
        LDR.W    R0,??DataTable2_4
        LDR.W    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable2_4
        LDR.W    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        LDRB     R1,[R2, R1]
        CMP      R0,R1
        BCC.N    ??Dev_cal_49
// 1047 //if(abs(midline-j)>25)
// 1048 //if(abs(midline-j)>25)
// 1049 { 
// 1050 //BmaCnt=1;  
// 1051 singleflag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_6
        STR      R0,[R1, #+0]
// 1052 //L_edgeFlag[0]=1;
// 1053 //R_edgeFlag[0]=1;
// 1054 //Ledge[0]=j-40;
// 1055 //Redge[0]=j+40;
// 1056 //midline=j; 
// 1057 break;
// 1058 }
// 1059 
// 1060 }  
// 1061 
// 1062 Singleflag[0]=singleflag;
??Dev_cal_50:
        LDR.W    R0,??DataTable3_6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_10
        STR      R0,[R1, #+0]
// 1063 
// 1064 
// 1065 
// 1066 
// 1067 if(Singleflag[0])
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Dev_cal_51
// 1068 if(Singleflag[1])
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+4]
        CMP      R0,#+0
        BEQ.N    ??Dev_cal_51
// 1069 if(Singleflag[2])
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+8]
        CMP      R0,#+0
        BEQ.N    ??Dev_cal_51
// 1070 single=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_7
        STR      R0,[R1, #+0]
// 1071 
// 1072 
// 1073 if(single)
??Dev_cal_51:
        LDR.W    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Dev_cal_52
// 1074 {
// 1075 L_edgeFlag[0]=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
// 1076 R_edgeFlag[0]=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_12
        STRB     R0,[R1, #+0]
// 1077 Ledge[0]=j-40;
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+40
        LDR.W    R1,??DataTable3
        STR      R0,[R1, #+0]
// 1078 Redge[0]=j+40;
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+40
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
// 1079 midline=j;
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_20
        STR      R0,[R1, #+0]
// 1080 
// 1081 
// 1082 {
// 1083 //midline = (int)(save_midline[0]);
// 1084 BmaCnt=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_11
        STRB     R0,[R1, #+0]
// 1085 }
// 1086 
// 1087 
// 1088 }
// 1089 
// 1090 
// 1091 
// 1092 
// 1093 
// 1094 
// 1095 
// 1096 
// 1097 
// 1098 if(single)
??Dev_cal_52:
        LDR.W    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Dev_cal_43
// 1099 {
// 1100 if(Ledge[0]<10)L_edgeFlag[0]=0;
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+10
        BGE.N    ??Dev_cal_53
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
// 1101 if(Redge[0]>117)R_edgeFlag[0]=0;
??Dev_cal_53:
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+118
        BLT.N    ??Dev_cal_54
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_12
        STRB     R0,[R1, #+0]
// 1102 
// 1103 if(Ledge[0]>Redge[0])
??Dev_cal_54:
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??Dev_cal_55
// 1104 {
// 1105 L_edgeFlag[0]=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
// 1106 R_edgeFlag[0]=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_12
        STRB     R0,[R1, #+0]
// 1107 Redge[0]=Redge[1];
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
// 1108 Ledge[0]=Ledge[1];
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3
        STR      R0,[R1, #+0]
// 1109 len_show[0]=len_show[1];        
        LDR.W    R0,??DataTable3_4
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        STRB     R0,[R1, #+0]
        B.N      ??Dev_cal_43
// 1110 }
// 1111 else
// 1112 {
// 1113 if(L_edgeFlag[0]+R_edgeFlag[0]==2)
??Dev_cal_55:
        LDR.N    R0,??DataTable2_11
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable2_12
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        CMP      R0,#+2
        BNE.N    ??Dev_cal_56
// 1114 {  
// 1115 len_show[0]=Redge[0]-Ledge[0];
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable3_4
        STRB     R0,[R1, #+0]
// 1116 
// 1117 if(len_show[0]<40)
        LDR.W    R0,??DataTable3_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+40
        BGE.N    ??Dev_cal_43
// 1118 {
// 1119 L_edgeFlag[0]=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
// 1120 R_edgeFlag[0]=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_12
        STRB     R0,[R1, #+0]
// 1121 Redge[0]=Redge[1];
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
// 1122 Ledge[0]=Ledge[1];
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3
        STR      R0,[R1, #+0]
// 1123 len_show[0]=len_show[1];    
        LDR.W    R0,??DataTable3_4
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        STRB     R0,[R1, #+0]
        B.N      ??Dev_cal_43
// 1124 }
// 1125 }
// 1126 else
// 1127 {
// 1128 Redge[0]=Redge[1];
??Dev_cal_56:
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
// 1129 Ledge[0]=Ledge[1]; 
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3
        STR      R0,[R1, #+0]
// 1130 len_show[0]=len_show[1];
        LDR.W    R0,??DataTable3_4
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_4
        STRB     R0,[R1, #+0]
// 1131 }    
// 1132 } 
// 1133 }
// 1134 }
// 1135 
// 1136 
// 1137 
// 1138 
// 1139 //***************************************************************************** 
// 1140 //存储跳沿位置
// 1141 //*****************************************************************************         
// 1142 
// 1143 
// 1144 
// 1145 for(j=28;j>=0;j--)                      
??Dev_cal_43:
        MOVS     R0,#+28
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_57
// 1146 {
// 1147 L_edgeFlag[j+1]=L_edgeFlag[j];
??Dev_cal_58:
        LDR.N    R0,??DataTable2_11
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.N    R1,??DataTable2_11
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+1]
// 1148 R_edgeFlag[j+1]=R_edgeFlag[j]; 
        LDR.N    R0,??DataTable2_12
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.N    R1,??DataTable2_12
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+1]
// 1149 Ledge[j+1]=Ledge[j];
        LDR.W    R0,??DataTable3
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R1,??DataTable3
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1150 Redge[j+1]=Redge[j]; 
        LDR.W    R0,??DataTable3_3
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R1,??DataTable3_3
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1151 }
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_57:
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??Dev_cal_58
// 1152 
// 1153 
// 1154 for(j=7;j>=0;j--)                       
        MOVS     R0,#+7
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_59
// 1155 {
// 1156 Startl[j+1]=Startl[j];
??Dev_cal_60:
        LDR.N    R0,??DataTable2_19
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable2_19
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1157 Startr[j+1]=Startr[j]; 
        LDR.W    R0,??DataTable3_1
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R1,??DataTable3_1
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1158 straightFlag[j+1]=straightFlag[j];
        LDR.W    R0,??DataTable3_12
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R1,??DataTable3_12
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1159 len_show[j+1]=len_show[j];
        LDR.W    R0,??DataTable3_4
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_4
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+1]
// 1160 Cnt[j+1]=Cnt[j];
        LDR.N    R0,??DataTable2_6
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable2_6
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1161 Singleflag[j+1]=Singleflag[j];
        LDR.W    R0,??DataTable3_10
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.W    R1,??DataTable3_10
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1162 } 
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_59:
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??Dev_cal_60
// 1163 
// 1164 
// 1165 for(j=118;j>=0;j--)
        MOVS     R0,#+118
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_61
// 1166 {
// 1167 CNT[j+1]=CNT[j];
??Dev_cal_62:
        LDR.N    R0,??DataTable2_7
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable2_7
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1168 THreshold[j+1]=THreshold[j];
        LDR.N    R0,??DataTable2_9
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable2_9
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1169 }
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_61:
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??Dev_cal_62
// 1170 
// 1171 for(j=18;j>=0;j--)
        MOVS     R0,#+18
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??Dev_cal_63
// 1172 {     
// 1173 GrayMIN[j+1]=GrayMIN[j];
??Dev_cal_64:
        LDR.N    R0,??DataTable2_15
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable2_15
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1174 GrayMAX[j+1]=GrayMAX[j];
        LDR.N    R0,??DataTable2_16
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable2_16
        LDR.N    R2,??DataTable2_3
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1175 
// 1176 } 
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
??Dev_cal_63:
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??Dev_cal_64
// 1177 
// 1178 
// 1179 
// 1180 
// 1181 
// 1182 
// 1183 
// 1184 
// 1185 
// 1186 
// 1187 LGrayMax=GrayMax-5;
        LDR.N    R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR.N    R1,??DataTable2_5
        STR      R0,[R1, #+0]
// 1188 
// 1189 
// 1190 if(LGrayMax<200)
        LDR.N    R0,??DataTable2_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+200
        BGE.N    ??Dev_cal_65
// 1191 LGrayMax=200;         
        MOVS     R0,#+200
        LDR.N    R1,??DataTable2_5
        STR      R0,[R1, #+0]
// 1192 
// 1193 
// 1194 }
??Dev_cal_65:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     Add_threshold

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     i

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     j

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     ADV

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     LGrayMax

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     Cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     CNT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     threshold

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     THreshold

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     Stopflag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     L_edgeFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     R_edgeFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     GrayMin

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     GrayMax

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     GrayMIN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     GrayMAX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     X

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     startl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     Startl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     midline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     yanLL

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     Ka

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     startr
// 1195 
// 1196 
// 1197 
// 1198 
// 1199 
// 1200 
// 1201 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1202 int add_midline;
add_midline:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1203 int R;
R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// 1204 int weight_max=80;
weight_max:
        DATA
        DC32 80
// 1205 
// 1206 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1207 int Weight_Denominator=0;
Weight_Denominator:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1208 int Weight_Molecular=0; 
Weight_Molecular:
        DS8 4
// 1209 //******************************************************************************      
// 1210 //控制函数
// 1211 //****************************************************************************** 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1212 void  Control()
// 1213 
// 1214 {
Control:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+28
// 1215 
// 1216 Weight_Denominator=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_13
        STR      R0,[R1, #+0]
// 1217 Weight_Molecular=0; 
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_14
        STR      R0,[R1, #+0]
// 1218 
// 1219 
// 1220 
// 1221 
// 1222 
// 1223 if(!single)
        LDR.W    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Control_0
// 1224 
// 1225 {
// 1226 if(L_edgeFlag[0]+R_edgeFlag[0]==2)
        LDR.W    R0,??DataTable3_15
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??DataTable3_16
        LDRB     R1,[R1, #+0]
        ADDS     R0,R1,R0
        CMP      R0,#+2
        BNE.N    ??Control_1
// 1227 {         
// 1228 midline = (Ledge[1] + Redge[1])/2;
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3_3
        LDR      R1,[R1, #+4]
        ADDS     R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        LDR.W    R1,??DataTable3_17
        STR      R0,[R1, #+0]
// 1229 }           
// 1230 if((L_edgeFlag[0]==0)&&(R_edgeFlag[0]==1))
??Control_1:
        LDR.W    R0,??DataTable3_15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Control_2
        LDR.W    R0,??DataTable3_16
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Control_2
// 1231 { 
// 1232 //BmaCnt=10;
// 1233 // midline = Redge[1]-45;
// 1234 midline = Redge[1]-len_show[2]/2;         
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3_4
        LDRB     R1,[R1, #+2]
        MOVS     R2,#+2
        SDIV     R1,R1,R2
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable3_17
        STR      R0,[R1, #+0]
// 1235 }    
// 1236 if((R_edgeFlag[0]==0)&&(L_edgeFlag[0]==1))
??Control_2:
        LDR.W    R0,??DataTable3_16
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Control_3
        LDR.W    R0,??DataTable3_15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Control_3
// 1237 { 
// 1238 //BmaCnt=10;
// 1239 //midline = Ledge[1]+45;
// 1240 midline = Ledge[1]+len_show[2]/2;  
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable3_4
        LDRB     R1,[R1, #+2]
        MOVS     R2,#+2
        SDIV     R1,R1,R2
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable3_17
        STR      R0,[R1, #+0]
// 1241 }     
// 1242 if((R_edgeFlag[0]==0)&&(L_edgeFlag[0]==0))
??Control_3:
        LDR.W    R0,??DataTable3_16
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Control_0
        LDR.W    R0,??DataTable3_15
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Control_0
// 1243 {          
// 1244 midline = (int)(save_midline[1]); 
        LDR.W    R0,??DataTable3_18
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable3_17
        STR      R0,[R1, #+0]
// 1245 }
// 1246 }
// 1247 
// 1248 //******************************************************************************
// 1249 // 中值限幅
// 1250 //****************************************************************************** 
// 1251 
// 1252 
// 1253 
// 1254 
// 1255 
// 1256 
// 1257 
// 1258 
// 1259 
// 1260 if(midline<15)
??Control_0:
        LDR.W    R0,??DataTable3_17
        LDR      R0,[R0, #+0]
        CMP      R0,#+15
        BGE.N    ??Control_4
// 1261 {
// 1262 midline=15;
        MOVS     R0,#+15
        LDR.W    R1,??DataTable3_17
        STR      R0,[R1, #+0]
// 1263 }
// 1264 if(midline>112)
??Control_4:
        LDR.W    R0,??DataTable3_17
        LDR      R0,[R0, #+0]
        CMP      R0,#+113
        BLT.N    ??Control_5
// 1265 {
// 1266 midline=112;
        MOVS     R0,#+112
        LDR.W    R1,??DataTable3_17
        STR      R0,[R1, #+0]
// 1267 }   
// 1268 
// 1269 
// 1270 
// 1271 
// 1272 
// 1273 
// 1274 
// 1275 
// 1276 
// 1277 
// 1278 for(j=7;j>=0;j--)  
??Control_5:
        MOVS     R0,#+7
        LDR.W    R1,??DataTable3_19
        STR      R0,[R1, #+0]
        B.N      ??Control_6
// 1279 { 
// 1280 save_midline[j+1]=save_midline[j];
??Control_7:
        LDR.W    R0,??DataTable3_18
        LDR.W    R1,??DataTable3_19
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_18
        LDR.W    R2,??DataTable3_19
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+1]
// 1281 }                
        LDR.W    R0,??DataTable3_19
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable3_19
        STR      R0,[R1, #+0]
??Control_6:
        LDR.W    R0,??DataTable3_19
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??Control_7
// 1282 save_midline[0]=midline; 
        LDR.W    R0,??DataTable3_17
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_18
        STRB     R0,[R1, #+0]
// 1283 
// 1284 
// 1285 
// 1286 
// 1287 
// 1288 
// 1289 for(j=0;j<4;j++)
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_19
        STR      R0,[R1, #+0]
        B.N      ??Control_8
// 1290 {
// 1291 
// 1292 weight[j] = weight_max-(weight_max-weight_Min)*j/4; 
??Control_9:
        LDR.W    R0,??DataTable3_20
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_20
        LDR      R1,[R1, #+0]
        LDR.W    R2,??DataTable3_21
        LDR      R2,[R2, #+0]
        SUBS     R1,R1,R2
        LDR.W    R2,??DataTable3_19
        LDR      R2,[R2, #+0]
        MULS     R1,R2,R1
        MOVS     R2,#+4
        SDIV     R1,R1,R2
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable3_22
        LDR.W    R2,??DataTable3_19
        LDR      R2,[R2, #+0]
        STR      R0,[R1, R2, LSL #+2]
// 1293 dir_error = save_midline[j]-Midline;                      
        LDR.N    R0,??DataTable3_18
        LDR.N    R1,??DataTable3_19
        LDR      R1,[R1, #+0]
        LDRB     R0,[R1, R0]
        LDR.W    R1,??DataTable3_23
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable3_24
        STR      R0,[R1, #+0]
// 1294 Weight_Molecular += (dir_error)*weight[j];
        LDR.N    R0,??DataTable3_14
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_24
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable3_22
        LDR.N    R3,??DataTable3_19
        LDR      R3,[R3, #+0]
        LDR      R2,[R2, R3, LSL #+2]
        MLA      R0,R2,R1,R0
        LDR.N    R1,??DataTable3_14
        STR      R0,[R1, #+0]
// 1295 Weight_Denominator += weight[j];
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_22
        LDR.N    R2,??DataTable3_19
        LDR      R2,[R2, #+0]
        LDR      R1,[R1, R2, LSL #+2]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+0]
// 1296 }
        LDR.N    R0,??DataTable3_19
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_19
        STR      R0,[R1, #+0]
??Control_8:
        LDR.N    R0,??DataTable3_19
        LDR      R0,[R0, #+0]
        CMP      R0,#+4
        BLT.N    ??Control_9
// 1297 
// 1298 ess = Weight_Molecular/Weight_Denominator;
        LDR.N    R0,??DataTable3_14
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_13
        LDR      R1,[R1, #+0]
        SDIV     R0,R0,R1
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable3_25
        STR      R0,[R1, #+0]
// 1299 
// 1300 
// 1301 
// 1302 long SteerDis[2] = 0;           //微分项a
        ADD      R0,SP,#+16
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1303 float TurnGyroDis[2] = 0;
        ADD      R0,SP,#+8
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1304 float TurnUda = 0.0;
        MOVS     R4,#+0
// 1305 float TurnUd[2] = 0;      
        ADD      R0,SP,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
// 1306 int TurnGyrodis = 0; 
        MOVS     R5,#+0
// 1307 
// 1308 TurnGyroDis[1] = TurnGyroDis[0];
        LDR      R0,[SP, #+8]
        STR      R0,[SP, #+12]
// 1309 TurnUd[1] = TurnUd[0];
        LDR      R0,[SP, #+0]
        STR      R0,[SP, #+4]
// 1310 SteerDis[1] = SteerDis[0];
        LDR      R0,[SP, #+16]
        STR      R0,[SP, #+20]
// 1311 
// 1312 
// 1313 // while(1)
// 1314 {
// 1315 TurnGyro = ad_once(ADC1,AD14,ADC_12bit);
        MOVS     R2,#+1
        MOVS     R1,#+14
        MOVS     R0,#+1
        BL       ad_once
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable3_26
        STR      R0,[R1, #+0]
// 1316 }
// 1317 TurnGyrodis = (int)((TurnGyro - TurnGyro_offset) * 0.33);
        LDR.N    R0,??DataTable3_26
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_27
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable3_28  ;; 0x51eb851f
        LDR.N    R3,??DataTable3_29  ;; 0x3fd51eb8
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        MOVS     R5,R0
// 1318 
// 1319 TurnUd[0] = -D_D* TurnGyrodis;
        MOVS     R0,R5
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable3_30
        LDR      R1,[R1, #+0]
        EORS     R1,R1,#0x80000000
        BL       __aeabi_fmul
        STR      R0,[SP, #+0]
// 1320 
// 1321 
// 1322 R=(ess*ess+H*H)/(2*ess);
        LDR.N    R0,??DataTable3_25
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_25
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_31
        LDR      R1,[R1, #+0]
        MULS     R0,R1,R0
        BL       __aeabi_i2f
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
        LDR.N    R0,??DataTable3_25
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable3_32
        STR      R0,[R1, #+0]
// 1323 
// 1324 
// 1325 
// 1326 SteerEssOld = SteerEss;
        LDR.N    R0,??DataTable3_33
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_34
        STR      R0,[R1, #+0]
// 1327 
// 1328 Turn_Kp_N=D_P*X_Correct[abs(ess)];
        LDR.N    R0,??DataTable3_25
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        BL       abs
        LDR.N    R1,??DataTable3_35
        LDR      R0,[R1, R0, LSL #+2]
        LDR.N    R1,??DataTable3_36
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable3_37
        STR      R0,[R1, #+0]
// 1329 
// 1330 SteerEss =Turn_Kp_N* ess+ TurnUd[0];//Ka*speedmiddle*speedmiddle/R;
        LDR.N    R0,??DataTable3_37
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable3_25
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable3_33
        STR      R0,[R1, #+0]
// 1331 
// 1332 
// 1333 
// 1334 
// 1335 if(Elbowbendflagl)
        LDR.N    R0,??DataTable3_38
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Control_10
// 1336 {
// 1337 //BmaCnt=1;
// 1338 SteerEss=-SpecialPWM*Elbowbendflagl/(D_I/2);   
        LDR.N    R0,??DataTable3_39
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+0
        LDR.N    R1,??DataTable3_38
        LDR      R1,[R1, #+0]
        MULS     R0,R1,R0
        BL       __aeabi_i2f
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_40
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable3_33
        STR      R0,[R1, #+0]
// 1339 if(Elbowbendflagl>(D_I/2))     
        LDR.N    R0,??DataTable3_38
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        MOVS     R4,R1
        LDR.N    R0,??DataTable3_40
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R4
        BL       __aeabi_cfcmple
        BCS.N    ??Control_10
// 1340 SteerEss=-SpecialPWM*(D_I-Elbowbendflagl)/(D_I/2);   
        LDR.N    R0,??DataTable3_39
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+0
        BL       __aeabi_i2f
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_38
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_40
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_40
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable3_33
        STR      R0,[R1, #+0]
// 1341 }
// 1342 
// 1343 if(Elbowbendflagr)
??Control_10:
        LDR.N    R0,??DataTable3_41
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Control_11
// 1344 {
// 1345 //BmaCnt=1;
// 1346 SteerEss=SpecialPWM*Elbowbendflagr/(D_I/2);   
        LDR.N    R0,??DataTable3_39
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_41
        LDR      R1,[R1, #+0]
        MULS     R0,R1,R0
        BL       __aeabi_i2f
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_40
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable3_33
        STR      R0,[R1, #+0]
// 1347 if(Elbowbendflagr>(D_I/2))     
        LDR.N    R0,??DataTable3_41
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        MOVS     R4,R1
        LDR.N    R0,??DataTable3_40
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R4
        BL       __aeabi_cfcmple
        BCS.N    ??Control_11
// 1348 SteerEss=SpecialPWM*(D_I-Elbowbendflagr)/(D_I/2);   
        LDR.N    R0,??DataTable3_39
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_41
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_40
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_40
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable3_33
        STR      R0,[R1, #+0]
// 1349 }
// 1350 
// 1351 
// 1352 
// 1353 //      BmaCnt=1;
// 1354 //    SteerEss=(SpecialPWM/4)*(D_I-Elbowbendflagl)/(D_I/4)
// 1355 //    if(Elbowbendflagl<(D_I/(3*4)))
// 1356 //     SteerEss=(SpecialPWM/4)+(SpecialPWM*0.75)*(D_I*0.75-Elbowbendflagl)/(D_I/4);
// 1357 //    if(Elbowbendflagl<(D_I/2))
// 1358 //    SteerEss=SpecialPWM+(SpecialPWM*0.75)*(D_I*0.5-Elbowbendflagl)/(D_I/4);   
// 1359 //    if(Elbowbendflagl<(D_I/4))     
// 1360 //    SteerEss=SpecialPWM*0.75+0.25*SpecialPWM*(D_I*0.75-Elbowbendflagl)/(D_I/4); 
// 1361 
// 1362 
// 1363 //if(Elbowbendflagl)
// 1364 //{
// 1365 //BmaCnt=1;
// 1366 //
// 1367 //if(Elbowbendflagl<Speed_Kd)
// 1368 //
// 1369 //SteerEss=-SpecialPWM*(Speed_Kd-Elbowbendflagl)/(Speed_Kd/2);
// 1370 //
// 1371 //if(Elbowbendflagl<(Speed_Kd/2))
// 1372 //
// 1373 //SteerEss=-SpecialPWM*Elbowbendflagl/(Speed_Kd/2);
// 1374 //
// 1375 //
// 1376 //}
// 1377 //
// 1378 //if(Elbowbendflagr)
// 1379 //{
// 1380 //
// 1381 //BmaCnt=1;
// 1382 //
// 1383 //if(Elbowbendflagr<Speed_Kd)
// 1384 //
// 1385 //SteerEss=SpecialPWM*(Speed_Kd-Elbowbendflagr)/(Speed_Kd/2);
// 1386 //
// 1387 //if(Elbowbendflagr<(Speed_Kd/2))
// 1388 //
// 1389 //SteerEss=SpecialPWM*Elbowbendflagr/(Speed_Kd/2);
// 1390 //
// 1391 //
// 1392 //
// 1393 //
// 1394 //
// 1395 //}
// 1396 
// 1397 
// 1398 
// 1399 
// 1400 if(SteerEss<-15000)
??Control_11:
        LDR.N    R0,??DataTable3_33
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_42  ;; 0xffffc568
        CMP      R0,R1
        BGE.N    ??Control_12
// 1401 {
// 1402 SteerEss=-15000;
        LDR.N    R0,??DataTable3_42  ;; 0xffffc568
        LDR.N    R1,??DataTable3_33
        STR      R0,[R1, #+0]
// 1403 //BmaCnt=2; 
// 1404 }
// 1405 
// 1406 if(SteerEss>15000)
??Control_12:
        LDR.N    R0,??DataTable3_33
        LDR      R0,[R0, #+0]
        MOVW     R1,#+15001
        CMP      R0,R1
        BLT.N    ??Control_13
// 1407 {
// 1408 SteerEss=15000;
        MOVW     R0,#+15000
        LDR.N    R1,??DataTable3_33
        STR      R0,[R1, #+0]
// 1409 //BmaCnt=2; 
// 1410 
// 1411 }
// 1412 
// 1413 for(j=7;j>=0;j--)
??Control_13:
        MOVS     R0,#+7
        LDR.N    R1,??DataTable3_19
        STR      R0,[R1, #+0]
        B.N      ??Control_14
// 1414 {
// 1415 Ess[j+1]=Ess[j];
??Control_15:
        LDR.N    R0,??DataTable3_43
        LDR.N    R1,??DataTable3_19
        LDR      R1,[R1, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable3_43
        LDR.N    R2,??DataTable3_19
        LDR      R2,[R2, #+0]
        ADDS     R1,R1,R2, LSL #+2
        STR      R0,[R1, #+4]
// 1416 }
        LDR.N    R0,??DataTable3_19
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable3_19
        STR      R0,[R1, #+0]
??Control_14:
        LDR.N    R0,??DataTable3_19
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??Control_15
// 1417 Ess[0]=ess;
        LDR.N    R0,??DataTable3_25
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable3_43
        STR      R0,[R1, #+0]
// 1418 
// 1419 
// 1420 
// 1421 }
        ADD      SP,SP,#+28
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     Ledge

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     Startr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     yanRR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     Redge

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     len_show

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     SinglineEN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     singleflag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     single

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     singleL

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     singleR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     Singleflag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     BmaCnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     straightFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     Weight_Denominator

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     Weight_Molecular

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     L_edgeFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     R_edgeFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     midline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     save_midline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     j

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     weight_max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     weight_Min

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     weight

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     Midline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     dir_error

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_25:
        DC32     ess

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_26:
        DC32     TurnGyro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_27:
        DC32     TurnGyro_offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_28:
        DC32     0x51eb851f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_29:
        DC32     0x3fd51eb8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_30:
        DC32     D_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_31:
        DC32     H

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_32:
        DC32     R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_33:
        DC32     SteerEss

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_34:
        DC32     SteerEssOld

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_35:
        DC32     X_Correct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_36:
        DC32     D_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_37:
        DC32     Turn_Kp_N

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_38:
        DC32     Elbowbendflagl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_39:
        DC32     SpecialPWM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_40:
        DC32     D_I

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_41:
        DC32     Elbowbendflagr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_42:
        DC32     0xffffc568

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_43:
        DC32     Ess

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0
        DC8 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H
        DC8 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H
        DC8 0, 0, 0, 0

        END
// 1422 
// 1423 
// 1424 
// 1425 
// 1426 
// 1427 
// 1428 
// 1429 
// 1430 
// 1431 
// 1432 
// 1433 
// 
// 1 601 bytes in section .bss
//   688 bytes in section .data
//    24 bytes in section .rodata
// 5 184 bytes in section .text
// 
// 5 184 bytes of CODE  memory
//    24 bytes of CONST memory
// 2 289 bytes of DATA  memory
//
//Errors: none
//Warnings: 24
