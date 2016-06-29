///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       07/Jun/2016  22:55:40
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\yu2ho\Desktop\K10\common\main.c
//    Command line =  
//        C:\Users\yu2ho\Desktop\K10\common\main.c -D DEBUG -lCN
//        C:\Users\yu2ho\Desktop\K10\Debug\List\ -lB
//        C:\Users\yu2ho\Desktop\K10\Debug\List\ -o
//        C:\Users\yu2ho\Desktop\K10\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "E:\Program Files\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\yu2ho\Desktop\K10\Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FTM_QUAD_init
        EXTERN GPIO_Init
        EXTERN PWM_Init
        EXTERN QUADRead
        EXTERN R_Motor_Speed
        EXTERN SpeedEss
        EXTERN SpeedInt
        EXTERN SpeedUd
        EXTERN SpeedUi
        EXTERN SpeedUp
        EXTERN SpeedWant
        EXTERN Speed_Kd
        EXTERN Speed_Ki
        EXTERN Speed_Kp
        EXTERN Timer0_Init
        EXTERN Timer1_Init
        EXTERN VECTableInit
        EXTERN WatchdogDisable
        EXTERN irdata
        EXTERN pll_init

        PUBLIC AngleACC
        PUBLIC BmaCnt
        PUBLIC Delay_ccd
        PUBLIC H
        PUBLIC IO_init
        PUBLIC Key_H
        PUBLIC Key_Q
        PUBLIC Middlel
        PUBLIC Middler
        PUBLIC Pit0_cnt
        PUBLIC QUAD_Left
        PUBLIC QUAD_Left_Cnt
        PUBLIC QUAD_Right
        PUBLIC QUAD_Right_Cnt
        PUBLIC SPEED
        PUBLIC Singleflag
        PUBLIC SpeedCnt
        PUBLIC SpeedOUT
        PUBLIC SpeedWant1
        PUBLIC Speed_Control
        PUBLIC Speed_Set_R
        PUBLIC Start
        PUBLIC SteerEssOld
        PUBLIC SteerEssmax
        PUBLIC SteerOUT
        PUBLIC StopFlag
        PUBLIC Stopflag
        PUBLIC THreshold
        PUBLIC TurnCnt
        PUBLIC TurnGyro_offset
        PUBLIC White_mark
        PUBLIC White_markL
        PUBLIC White_markR
        PUBLIC abc
        PUBLIC accangle
        PUBLIC angleInit
        PUBLIC count
        PUBLIC disp
        PUBLIC distance
        PUBLIC fanzhuan
        PUBLIC g_aucImageTable
        PUBLIC ircode
        PUBLIC irpros
        PUBLIC irpros_ok
        PUBLIC irwork
        PUBLIC irwork_ok
        PUBLIC jibu
        PUBLIC key_code
        PUBLIC key_num
        PUBLIC key_num_COUNT
        PUBLIC key_num_change
        PUBLIC key_num_end
        PUBLIC main
        PUBLIC midline
        PUBLIC midlineH
        PUBLIC s
        PUBLIC speed
        PUBLIC start
        PUBLIC status
        PUBLIC testpwm
        PUBLIC testpwm1
        PUBLIC testpwm2
        PUBLIC testpwm3
        PUBLIC testpwm4
        PUBLIC txbuf
        PUBLIC white_mark
        PUBLIC white_markL
        PUBLIC white_markR
        PUBLIC x
        PUBLIC zhengfanzhuan
        PUBLIC zhengfanzhuan2
        PUBLIC zhengzhuan

// C:\Users\yu2ho\Desktop\K10\common\main.c
//    1 #include "..\K60_datatype.h"
//    2 
//    3 #include "stdio.h"
//    4 #include "stdlib.h"
//    5 #include "string.h"
//    6 #include "Oled.h"
//    7 
//    8 
//    9 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 int x=0;
x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 int abc=0;
abc:
        DS8 4
//   12 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 int zhengfanzhuan2;
zhengfanzhuan2:
        DS8 4

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   14 void Delay_ccd(int num)
//   15 {
//   16 int i,j,k;
//   17 for(j = 0;j < num;j++)
Delay_ccd:
        MOVS     R2,#+0
        B.N      ??Delay_ccd_0
??Delay_ccd_1:
        ADDS     R2,R2,#+1
??Delay_ccd_0:
        CMP      R2,R0
        BGE.N    ??Delay_ccd_2
//   18 {
//   19 for(i = 0;i < 245;i++)
        MOVS     R1,#+0
        B.N      ??Delay_ccd_3
//   20 {
//   21 for(k = 0;k < 245;k++)
//   22 {
//   23 asm("nop");
??Delay_ccd_4:
        nop
//   24 asm("nop");
        nop
//   25 asm("nop");
        nop
//   26 asm("nop");
        nop
//   27 asm("nop");
        nop
//   28 asm("nop");
        nop
//   29 asm("nop");
        nop
//   30 asm("nop");
        nop
//   31 asm("nop");
        nop
//   32 asm("nop");
        nop
//   33 }
        ADDS     R3,R3,#+1
??Delay_ccd_5:
        CMP      R3,#+245
        BLT.N    ??Delay_ccd_4
        ADDS     R1,R1,#+1
??Delay_ccd_3:
        CMP      R1,#+245
        BGE.N    ??Delay_ccd_1
        MOVS     R3,#+0
        B.N      ??Delay_ccd_5
//   34 }
//   35 }
//   36 }
??Delay_ccd_2:
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   37 int zhengfanzhuan=0;
zhengfanzhuan:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   38 void zhengzhuan(void){//zhengzhuan--------------------------------------------
zhengzhuan:
        PUSH     {R7,LR}
//   39   Delay_ccd(100);
        MOVS     R0,#+100
        BL       Delay_ccd
//   40   FTM0_C7V=abc;//abc
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x40038048
        STR      R0,[R1, #+0]
//   41   FTM0_C6V=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable6_2  ;; 0x40038040
        STR      R0,[R1, #+0]
//   42   zhengfanzhuan=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable6_3
        STR      R0,[R1, #+0]
//   43 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void fanzhuan(void){ //fanzhuan-----------------------------------------
fanzhuan:
        PUSH     {R7,LR}
//   45   Delay_ccd(100);
        MOVS     R0,#+100
        BL       Delay_ccd
//   46   FTM0_C7V=0;//abc
        MOVS     R0,#+0
        LDR.W    R1,??DataTable6_1  ;; 0x40038048
        STR      R0,[R1, #+0]
//   47   FTM0_C6V=abc;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_2  ;; 0x40038040
        STR      R0,[R1, #+0]
//   48   zhengfanzhuan=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable6_3
        STR      R0,[R1, #+0]
//   49 }
        POP      {R0,PC}          ;; return
//   50 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   51 void IO_init()
//   52 {
IO_init:
        PUSH     {R7,LR}
//   53 //五向开关
//   54 GPIO_Init(PORT_A,12,GPI_UP,LVL_H); 
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+12
        MOVS     R0,#+0
        BL       GPIO_Init
//   55 GPIO_Init(PORT_A,13,GPI_UP,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+13
        MOVS     R0,#+0
        BL       GPIO_Init
//   56 GPIO_Init(PORT_A,14,GPI_UP,LVL_H); 
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+14
        MOVS     R0,#+0
        BL       GPIO_Init
//   57 GPIO_Init(PORT_A,15,GPI_UP,LVL_H);                                  
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       GPIO_Init
//   58 GPIO_Init(PORT_A,16,GPI_UP,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+16
        MOVS     R0,#+0
        BL       GPIO_Init
//   59 
//   60 
//   61 //guangdianguan
//   62 GPIO_Init(PORT_C,0,GPI,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       GPIO_Init
//   63 GPIO_Init(PORT_C,8,GPI,LVL_H); 
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+8
        MOVS     R0,#+2
        BL       GPIO_Init
//   64 
//   65 
//   66 
//   67 
//   68 //dt
//   69 GPIO_Init(PORT_C,6,GPO,LVL_H);                                  
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+6
        MOVS     R0,#+2
        BL       GPIO_Init
//   70 //GPIO_Init(PORT_C,7,GPI,LVL_H);  //////////////////////////////////////
//   71 
//   72 
//   73 
//   74 GPIO_Init(PORT_A,19,GPO_HDS,LVL_L);               //蜂鸣器
        MOVS     R3,#+0
        MOVS     R2,#+65
        MOVS     R1,#+19
        MOVS     R0,#+0
        BL       GPIO_Init
//   75 
//   76 
//   77 
//   78  GPIO_Init(PORT_C,10,GPI_UP,LVL_H);               //按键
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+10
        MOVS     R0,#+2
        BL       GPIO_Init
//   79  GPIO_Init(PORT_C,12,GPI_UP,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+12
        MOVS     R0,#+2
        BL       GPIO_Init
//   80 
//   81 
//   82 
//   83 GPIO_Init(PORT_B,22,GPO,LVL_H);   // 后  CLK
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+22
        MOVS     R0,#+1
        BL       GPIO_Init
//   84 GPIO_Init(PORT_C,3,GPO,LVL_H);  //  后  SI
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+2
        BL       GPIO_Init
//   85 
//   86  
//   87 GPIO_Init(PORT_B,17,GPI_UP,LVL_H);    // 前   CLK
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+17
        MOVS     R0,#+1
        BL       GPIO_Init
//   88 GPIO_Init(PORT_B,16,GPI_UP,LVL_H);    // 前   SI
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+16
        MOVS     R0,#+1
        BL       GPIO_Init
//   89 
//   90 GPIO_Init(PORT_C,4,GPI_UP,LVL_H);//按键------------------------------------------------------------------
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+4
        MOVS     R0,#+2
        BL       GPIO_Init
//   91   GPIO_Init(PORT_C,6,GPI_UP,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+6
        MOVS     R0,#+2
        BL       GPIO_Init
//   92   GPIO_Init(PORT_C,8,GPI_UP,LVL_H); 
        MOVS     R3,#+1
        MOVS     R2,#+3
        MOVS     R1,#+8
        MOVS     R0,#+2
        BL       GPIO_Init
//   93 
//   94 
//   95 
//   96 
//   97 }
        POP      {R0,PC}          ;; return
//   98 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   99 int H=0;
H:
        DS8 4
//  100 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  101 int white_mark;
white_mark:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  102 int white_markL;
white_markL:
        DS8 4
//  103 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  104 int White_markL=0;
White_markL:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  105 int white_markR;
white_markR:
        DS8 4
//  106 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  107 int White_markR=0;
White_markR:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  108 int White_mark=0;
White_mark:
        DS8 4
//  109 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  110 int Stopflag;
Stopflag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  111 int StopFlag;
StopFlag:
        DS8 4
//  112 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  113 byte Key_Q;
Key_Q:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  114 byte Key_H;
Key_H:
        DS8 1
//  115 
//  116 
//  117 
//  118 
//  119 
//  120 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  121 long testpwm,testpwm1,testpwm2,testpwm3,testpwm4;
testpwm:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
testpwm1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
testpwm2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
testpwm3:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
testpwm4:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  122 int start=0;
start:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  123 int Start=0;
Start:
        DS8 4
//  124 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  125 u8 BmaCnt=0;
BmaCnt:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  126 float angleInit;
angleInit:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  127 float accangle[4] = {0,0,0,0};
accangle:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  128 float AngleACC;
AngleACC:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  129 float TurnGyro_offset;
TurnGyro_offset:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  130 int QUAD_Left_Cnt = 0; 
QUAD_Left_Cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  131 int QUAD_Right_Cnt = 0;
QUAD_Right_Cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  132 int QUAD_Left = 0;
QUAD_Left:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  133 int QUAD_Right = 0;
QUAD_Right:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  134 u8 Pit0_cnt = 0;
Pit0_cnt:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  135 long SteerOUT;
SteerOUT:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  136 int SpeedOUT;
SpeedOUT:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  137 long SteerEssmax = 0; 
SteerEssmax:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  138 int midline= 63;
midline:
        DATA
        DC32 63
//  139 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  140 int Middlel=0;
Middlel:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  141 int Middler=0;
Middler:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  142 int SPEED;
SPEED:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  143 int midlineH=63;
midlineH:
        DATA
        DC32 63

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  144 u8 txbuf[5][32];
txbuf:
        DS8 160
//  145 
//  146 
//  147 
//  148 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  149 uint8 status;
status:
        DS8 1
//  150 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  151 int THreshold[120]={
THreshold:
        DATA
        DC32 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200
        DC32 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200
        DC32 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200
        DC32 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200
        DC32 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200
        DC32 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200
        DC32 200, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC32 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//  152 200,200,200,200,200,200,200,200,200,200,
//  153 200,200,200,200,200,200,200,200,200,200,
//  154 200,200,200,200,200,200,200,200,200,200,
//  155 200,200,200,200,200,200,200,200,200,200,
//  156 200,200,200,200,200,200,200,200,200,200,
//  157 200,200,200,200,200,200,200,200,200,200,
//  158 200,200,200,200,200,200,200,200,200,200,
//  159 200,200,200,200,200,200,200,200,200,200,
//  160 };

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  161 long SteerEssOld = 0;
SteerEssOld:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  162 u8 SpeedCnt = 0;
SpeedCnt:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  163 u8 TurnCnt = 0;
TurnCnt:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  164 int   Singleflag[10]={0,0,0,0,0};
Singleflag:
        DS8 40
//  165 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  166 long jibu;
jibu:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  167 float distance;
distance:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  168 float speed;
speed:
        DS8 4
//  169 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  170 unsigned char g_aucImageTable[64][128];
g_aucImageTable:
        DS8 8192

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  171 char ircode[4];
ircode:
        DS8 4
//  172 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  173 unsigned char disp[8];
disp:
        DS8 8
//  174 
//  175 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  176 int irwork_ok;
irwork_ok:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  177 void irwork()
//  178 {
//  179  disp[0]=ircode[0]/16; 
irwork:
        LDR.W    R0,??DataTable6_4
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+16
        SDIV     R0,R0,R1
        LDR.W    R1,??DataTable6_5
        STRB     R0,[R1, #+0]
//  180  disp[1]=ircode[0]%16; 
        LDR.W    R0,??DataTable6_4
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+16
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable6_5
        STRB     R2,[R0, #+1]
//  181  
//  182  disp[2]=ircode[1]/16; 
        LDR.W    R0,??DataTable6_4
        LDRB     R0,[R0, #+1]
        MOVS     R1,#+16
        SDIV     R0,R0,R1
        LDR.W    R1,??DataTable6_5
        STRB     R0,[R1, #+2]
//  183  disp[3]=ircode[1]%16; 
        LDR.W    R0,??DataTable6_4
        LDRB     R0,[R0, #+1]
        MOVS     R1,#+16
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable6_5
        STRB     R2,[R0, #+3]
//  184  
//  185  disp[4]=ircode[2]/16; 
        LDR.W    R0,??DataTable6_4
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+16
        SDIV     R0,R0,R1
        LDR.W    R1,??DataTable6_5
        STRB     R0,[R1, #+4]
//  186  disp[5]=ircode[2]%16; 
        LDR.W    R0,??DataTable6_4
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+16
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable6_5
        STRB     R2,[R0, #+5]
//  187  
//  188  disp[6]=ircode[3]/16; 
        LDR.W    R0,??DataTable6_4
        LDRB     R0,[R0, #+3]
        MOVS     R1,#+16
        SDIV     R0,R0,R1
        LDR.W    R1,??DataTable6_5
        STRB     R0,[R1, #+6]
//  189  disp[7]=ircode[3]%16; 
        LDR.W    R0,??DataTable6_4
        LDRB     R0,[R0, #+3]
        MOVS     R1,#+16
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        LDR.W    R0,??DataTable6_5
        STRB     R2,[R0, #+7]
//  190  
//  191  
//  192   irwork_ok=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable6_6
        STR      R0,[R1, #+0]
//  193 
//  194 }
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  195 int key_num_COUNT=0;
key_num_COUNT:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  196 int key_num,key_num_end;
key_num:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
key_num_end:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  197 int key_num_change=0; 
key_num_change:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  198 void key_code()
//  199 {
//  200    key_num_COUNT++;
key_code:
        LDR.W    R0,??DataTable6_7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable6_7
        STR      R0,[R1, #+0]
//  201    if( key_num_COUNT>4 )
        LDR.W    R0,??DataTable6_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+5
        BLT.N    ??key_code_0
//  202    {
//  203      key_num_COUNT=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_7
        STR      R0,[R1, #+0]
//  204    }
//  205 if(disp[4]==1&&disp[5]==6){key_num=0;}
??key_code_0:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+1
        BNE.N    ??key_code_1
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+6
        BNE.N    ??key_code_1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  206 if(disp[4]==0&&disp[5]==12)key_num=1;
??key_code_1:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??key_code_2
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+12
        BNE.N    ??key_code_2
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  207 if(disp[4]==1&&disp[5]==8)key_num=2;
??key_code_2:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+1
        BNE.N    ??key_code_3
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+8
        BNE.N    ??key_code_3
        MOVS     R0,#+2
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  208 if(disp[4]==5&&disp[5]==14)key_num=3;
??key_code_3:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+5
        BNE.N    ??key_code_4
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+14
        BNE.N    ??key_code_4
        MOVS     R0,#+3
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  209 if(disp[4]==0&&disp[5]==8)key_num=4;
??key_code_4:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??key_code_5
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+8
        BNE.N    ??key_code_5
        MOVS     R0,#+4
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  210 if(disp[4]==1&&disp[5]==12)key_num=5;
??key_code_5:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+1
        BNE.N    ??key_code_6
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+12
        BNE.N    ??key_code_6
        MOVS     R0,#+5
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  211 if(disp[4]==5&&disp[5]==10)key_num=6;
??key_code_6:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+5
        BNE.N    ??key_code_7
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+10
        BNE.N    ??key_code_7
        MOVS     R0,#+6
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  212 if(disp[4]==4&&disp[5]==2)key_num=7;
??key_code_7:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+4
        BNE.N    ??key_code_8
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+2
        BNE.N    ??key_code_8
        MOVS     R0,#+7
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  213 if(disp[4]==5&&disp[5]==2)key_num=8;
??key_code_8:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+5
        BNE.N    ??key_code_9
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+2
        BNE.N    ??key_code_9
        MOVS     R0,#+8
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  214 if(disp[4]==4&&disp[5]==10)key_num=9;
??key_code_9:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+4
        BNE.N    ??key_code_10
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+10
        BNE.N    ??key_code_10
        MOVS     R0,#+9
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  215 if(disp[4]==0&&disp[5]==7)key_num=10;//-
??key_code_10:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??key_code_11
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+7
        BNE.N    ??key_code_11
        MOVS     R0,#+10
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  216 if(disp[4]==1&&disp[5]==5)key_num=11;//+
??key_code_11:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+1
        BNE.N    ??key_code_12
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+5
        BNE.N    ??key_code_12
        MOVS     R0,#+11
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//  217 if(disp[4]==0&&disp[5]==9)
??key_code_12:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??key_code_13
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+9
        BNE.N    ??key_code_13
//  218 {
//  219 key_num_change=1;//调试
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_9
        STR      R0,[R1, #+0]
        B.N      ??key_code_14
//  220 }
//  221 else
//  222 {
//  223   key_num_change=0;
??key_code_13:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_9
        STR      R0,[R1, #+0]
//  224 }
//  225 if(disp[4]==0&&disp[5]==9){key_num_end=1;}
??key_code_14:
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??key_code_15
        LDR.N    R0,??DataTable6_5
        LDRB     R0,[R0, #+5]
        CMP      R0,#+9
        BNE.N    ??key_code_15
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_10
        STR      R0,[R1, #+0]
//  226 }
??key_code_15:
        BX       LR               ;; return
//  227 
//  228 
//  229 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  230 long count ;
count:
        DS8 4
//  231 
//  232 //void control()
//  233 //{
//  234 //
//  235 //switch (key_num)
//  236 //{
//  237 //case 1: count+=10;  break;
//  238 //case 2:  count-=10; break;
//  239 //default: break;
//  240 //}
//  241 //}
//  242 
//  243 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  244 int irpros_ok;
irpros_ok:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  245 void irpros()
//  246 {
irpros:
        PUSH     {R4}
//  247 
//  248 
//  249 char x,y,z=1;
        MOVS     R2,#+1
//  250 char value;
//  251 for(y=0;y<4;y++)
        MOVS     R1,#+0
        B.N      ??irpros_0
//  252 {
//  253 for(x=0;x<8;x++)
//  254 {
//  255 value=value>>1;
??irpros_1:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSRS     R3,R3,#+1
//  256 if(irdata[z]>6)
        LDR.N    R4,??DataTable6_11
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRB     R4,[R2, R4]
        CMP      R4,#+7
        BLT.N    ??irpros_2
//  257 {
//  258 value=value|0x80;
        ORRS     R3,R3,#0x80
//  259 }
//  260 z++;
??irpros_2:
        ADDS     R2,R2,#+1
//  261 }
        ADDS     R0,R0,#+1
??irpros_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+8
        BLT.N    ??irpros_1
//  262 ircode[y]=value;
        LDR.N    R0,??DataTable6_4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STRB     R3,[R1, R0]
        ADDS     R1,R1,#+1
??irpros_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+4
        BGE.N    ??irpros_4
        MOVS     R0,#+0
        B.N      ??irpros_3
//  263 }
//  264 
//  265 irpros_ok=1;
??irpros_4:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_12
        STR      R0,[R1, #+0]
//  266 
//  267 }
        POP      {R4}
        BX       LR               ;; return
//  268 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  269 int Speed_Set_R;
Speed_Set_R:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  270 void Speed_Control(void)
//  271 {
//  272     FTM2_C0V=0;
Speed_Control:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_13  ;; 0x400b8010
        STR      R0,[R1, #+0]
//  273     R_Motor_Speed=FTM2_C1V;//caihuilaidezhi
        LDR.N    R0,??DataTable6_14  ;; 0x400b8018
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_15
        STR      R0,[R1, #+0]
//  274     SpeedEss[2] = SpeedEss[1];
        LDR.N    R0,??DataTable6_16
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable6_16
        STR      R0,[R1, #+8]
//  275     SpeedEss[1] = SpeedEss[0];
        LDR.N    R0,??DataTable6_16
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_16
        STR      R0,[R1, #+4]
//  276 
//  277     SpeedEss[0] = SpeedWant-R_Motor_Speed;
        LDR.N    R0,??DataTable6_17
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_15
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable6_16
        STR      R0,[R1, #+0]
//  278 
//  279     SpeedEss[0]=SpeedEss[0]>300?300:(SpeedEss[0]<-300?-300:SpeedEss[0]);
        LDR.N    R0,??DataTable6_16
        LDR      R0,[R0, #+0]
        CMP      R0,#+300
        BLE.N    ??Speed_Control_0
        MOV      R0,#+300
        LDR.N    R1,??DataTable6_16
        STR      R0,[R1, #+0]
        B.N      ??Speed_Control_1
??Speed_Control_0:
        LDR.N    R0,??DataTable6_16
        LDR      R0,[R0, #+0]
        CMN      R0,#+300
        BGE.N    ??Speed_Control_2
        LDR.N    R0,??DataTable6_18  ;; 0xfffffed4
        LDR.N    R1,??DataTable6_16
        STR      R0,[R1, #+0]
        B.N      ??Speed_Control_1
??Speed_Control_2:
        LDR.N    R0,??DataTable6_16
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_16
        STR      R0,[R1, #+0]
//  280 
//  281     SpeedInt += SpeedEss[0];
??Speed_Control_1:
        LDR.N    R0,??DataTable6_19
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_16
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable6_19
        STR      R0,[R1, #+0]
//  282     SpeedInt=SpeedInt>2000?2000:(SpeedInt<-2000?-2000:SpeedInt);
        LDR.N    R0,??DataTable6_19
        LDR      R0,[R0, #+0]
        CMP      R0,#+2000
        BLE.N    ??Speed_Control_3
        MOV      R0,#+2000
        LDR.N    R1,??DataTable6_19
        STR      R0,[R1, #+0]
        B.N      ??Speed_Control_4
??Speed_Control_3:
        LDR.N    R0,??DataTable6_19
        LDR      R0,[R0, #+0]
        CMN      R0,#+2000
        BGE.N    ??Speed_Control_5
        LDR.N    R0,??DataTable6_20  ;; 0xfffff830
        LDR.N    R1,??DataTable6_19
        STR      R0,[R1, #+0]
        B.N      ??Speed_Control_4
??Speed_Control_5:
        LDR.N    R0,??DataTable6_19
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_19
        STR      R0,[R1, #+0]
//  283     
//  284     SpeedUp = (int)(Speed_Kp * SpeedEss[0]);
??Speed_Control_4:
        LDR.N    R0,??DataTable6_21
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_16
        LDR      R1,[R1, #+0]
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable6_22
        STR      R0,[R1, #+0]
//  285     SpeedUi = (int)(Speed_Ki * SpeedInt/10);
        LDR.N    R0,??DataTable6_23
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_19
        LDR      R1,[R1, #+0]
        MULS     R0,R1,R0
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable6_24
        STR      R0,[R1, #+0]
//  286     SpeedUd = (int)(Speed_Kd*(SpeedEss[0]-SpeedEss[1]));
        LDR.N    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_16
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable6_16
        LDR      R2,[R2, #+4]
        SUBS     R1,R1,R2
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable6_26
        STR      R0,[R1, #+0]
//  287  
//  288     Speed_Set_R = SpeedUp + SpeedUi + SpeedUd;
        LDR.N    R0,??DataTable6_22
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_24
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable6_26
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable6_27
        STR      R0,[R1, #+0]
//  289 }
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  290 int s[5]={0,0};
s:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  291 int SpeedWant1=0;
SpeedWant1:
        DS8 4
//  292 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  293 void main(void) 
//  294 {
main:
        PUSH     {R7,LR}
//  295  
//  296   
//  297 
//  298 
//  299 DisableInterrupts; 
        CPSID i
//  300 
//  301 WatchdogDisable();  
        BL       WatchdogDisable
//  302 
//  303 
//  304 VECTableInit();
        BL       VECTableInit
//  305 
//  306 
//  307 
//  308 
//  309 SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  310 			  | SIM_SCGC5_PORTB_MASK
//  311 			  | SIM_SCGC5_PORTC_MASK
//  312 			  | SIM_SCGC5_PORTD_MASK
//  313 			  | SIM_SCGC5_PORTE_MASK );
        LDR.N    R0,??DataTable6_28  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable6_28  ;; 0x40048038
        STR      R0,[R1, #+0]
//  314 
//  315 pll_init(PLL150);
        MOVS     R0,#+150
        BL       pll_init
//  316 Timer0_Init();
        BL       Timer0_Init
//  317 Timer1_Init();
        BL       Timer1_Init
//  318 PWM_Init();
        BL       PWM_Init
//  319 FTM_QUAD_init();
        BL       FTM_QUAD_init
//  320 EnableInterrupts;
        CPSIE i
//  321 
//  322 ///FTM_QUAD_init();
//  323 //LCD_Init_Oled();
//  324 //EnableTimer0();                 //PIT0      使能
//  325 //EnableTimer1(); 
//  326 //PORTC_PCR14=PORT_PCR_MUX(1)|PORT_PCR_IRQC(10);
//  327 
//  328  //GPIO_Init(PORT_E,26,GPI_UP,LVL_H);               //按键
//  329 
//  330 //enable_irq(89);
//  331 
//  332 FTM0_C7V=4000;
        MOV      R0,#+4000
        LDR.N    R1,??DataTable6_1  ;; 0x40038048
        STR      R0,[R1, #+0]
//  333 
//  334 while(1)
//  335 {
//  336  testpwm3=QUADRead(1);
??main_0:
        MOVS     R0,#+1
        BL       QUADRead
        LDR.N    R1,??DataTable6_29
        STR      R0,[R1, #+0]
//  337  testpwm4=QUADRead(0);
        MOVS     R0,#+0
        BL       QUADRead
        LDR.N    R1,??DataTable6_30
        STR      R0,[R1, #+0]
//  338 // FTM0_C7V=testpwm1;//abc
//  339 // FTM0_C6V=testpwm2;
//  340  Delay_ccd(1000);
        MOV      R0,#+1000
        BL       Delay_ccd
        B.N      ??main_0
//  341 //   if(GPIO_GetBit(PORT_C,4)==0)
//  342 // { Delay_ccd(100);
//  343 //  FTM0_C7V=6000;
//  344 //  abc=6000;
//  345 //  if(zhengfanzhuan==1){zhengzhuan();
//  346 //  goto knot1;}
//  347 //  else{fanzhuan();
//  348 //  goto knot1;}
//  349 // }
//  350 //knot1:
//  351 //  if(GPIO_GetBit(PORT_C,6)==0)
//  352 // { Delay_ccd(100);
//  353 //  FTM0_C7V+=500;
//  354 // }
//  355 // if(GPIO_GetBit(PORT_C,8)==0)
//  356 // { 
//  357 //   Delay_ccd(100);
//  358 //   FTM0_C7V-=500;
//  359 //}
//  360 // 
//  361  
//  362  
//  363 }
//  364 
//  365                            
//  366 
//  367 
//  368 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     abc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x40038048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x40038040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     zhengfanzhuan

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     ircode

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     disp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     irwork_ok

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     key_num_COUNT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     key_num

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     key_num_change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     key_num_end

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     irdata

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     irpros_ok

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     0x400b8010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     0x400b8018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     R_Motor_Speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     SpeedEss

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC32     SpeedWant

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_18:
        DC32     0xfffffed4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_19:
        DC32     SpeedInt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_20:
        DC32     0xfffff830

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_21:
        DC32     Speed_Kp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_22:
        DC32     SpeedUp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_23:
        DC32     Speed_Ki

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_24:
        DC32     SpeedUi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_25:
        DC32     Speed_Kd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_26:
        DC32     SpeedUd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_27:
        DC32     Speed_Set_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_28:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_29:
        DC32     testpwm3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_30:
        DC32     testpwm4

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  369 
//  370 
//  371 
// 
// 8 631 bytes in section .bss
//   488 bytes in section .data
// 1 366 bytes in section .text
// 
// 1 366 bytes of CODE memory
// 9 119 bytes of DATA memory
//
//Errors: none
//Warnings: none
