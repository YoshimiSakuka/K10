///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       07/Jun/2016  22:55:13
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\yu2ho\Desktop\K10\common\isr.c
//    Command line =  
//        C:\Users\yu2ho\Desktop\K10\common\isr.c -D DEBUG -lCN
//        C:\Users\yu2ho\Desktop\K10\Debug\List\ -lB
//        C:\Users\yu2ho\Desktop\K10\Debug\List\ -o
//        C:\Users\yu2ho\Desktop\K10\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "E:\Program Files\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\yu2ho\Desktop\K10\Debug\List\isr.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC DMA_CH0_Handle
        PUBLIC DTcnt
        PUBLIC DTcntsum
        PUBLIC DTflag
        PUBLIC DTlost
        PUBLIC DTreceive
        PUBLIC DTstate
        PUBLIC FTM0_ISR
        PUBLIC FTM1_ISR
        PUBLIC FTM2_ISR
        PUBLIC FieldCnt
        PUBLIC L_DTcntsum
        PUBLIC LineReadOverFlag
        PUBLIC PIT0_ISR
        PUBLIC PIT1_ISR
        PUBLIC PIT2_ISR
        PUBLIC PIT3_ISR
        PUBLIC PicLine
        PUBLIC Porta_Isr
        PUBLIC Portb_Isr
        PUBLIC Portc_Isr
        PUBLIC Portd_Isr
        PUBLIC Porte_Isr
        PUBLIC ProcessLinePtr
        PUBLIC ProssessLineSto
        PUBLIC R_Motor_Speed
        PUBLIC Real_LineCnt
        PUBLIC SensorState
        PUBLIC SensorStateCnt
        PUBLIC StandFlag
        PUBLIC Startflag
        PUBLIC UART1_ISR
        PUBLIC VSYNC_STA
        PUBLIC _h
        PUBLIC _v
        PUBLIC bitnum
        PUBLIC cnT
        PUBLIC cnta
        PUBLIC counta
        PUBLIC `data`
        PUBLIC dir
        PUBLIC direct_gyroscope
        PUBLIC fangxiang1
        PUBLIC fangxiang2
        PUBLIC fir_time
        PUBLIC irdata
        PUBLIC irreceiveok
        PUBLIC irtime
        PUBLIC last
        PUBLIC m
        PUBLIC now
        PUBLIC p
        PUBLIC q
        PUBLIC renzi_cnt
        PUBLIC renziq_cnt
        PUBLIC sby_flag
        PUBLIC sec_time
        PUBLIC sensorcntmax
        PUBLIC true_time
        PUBLIC u

// C:\Users\yu2ho\Desktop\K10\common\isr.c
//    1 #include "isr.h"
//    2 #include "..\K60_datatype.h"
//    3 #include "math.h"
//    4 
//    5 
//    6 
//    7 /***********************************ISR中变量************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 u8 SensorState[5] = {0};
SensorState:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 u8 SensorStateCnt[5] = {0};
SensorStateCnt:
        DS8 8

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   10 u8 sensorcntmax=78;
sensorcntmax:
        DATA
        DC8 78

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   11 u8 StandFlag = 0;
StandFlag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 int Startflag=0;
Startflag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 int cnT;
cnT:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 int counta = 0;
counta:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 int cnta = 0,fangxiang1 = 0,fangxiang2 = 0;
cnta:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
fangxiang1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
fangxiang2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 int VSYNC_STA = 0;
VSYNC_STA:
        DS8 4
//   17 int q;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 u32 p,m;
p:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
m:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 u32 FieldCnt = 0;                    //场计数器 暂时只计到2 未定义全局变量
FieldCnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   20 u8 _v = 0,_h = 0;                   //调试用计数器
_v:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
_h:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 int Real_LineCnt = 0;               //行中断计数器
Real_LineCnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 int ProcessLinePtr = 0;             //行采样计数器
ProcessLinePtr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 u8 PicLine[160];                    //单行图像
PicLine:
        DS8 160

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   24 u8 LineReadOverFlag = 0;
LineReadOverFlag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 int renzi_cnt;
renzi_cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 int renziq_cnt;
renziq_cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 int direct_gyroscope=0;
direct_gyroscope:
        DS8 4
//   28 //int ProssessLineSto[72 ] = {91,93,95,97,99,101,103,105,107,109,111,113,115,117,119,121,123,125,127,129,131,133,135,137,139,141,143,145,147,149,151,153,155,157,159,161,163,165,167,169,171,173,175,177,179,181,183,185,187,189,191,193,195,197,199,201,203,205,207,209,211,213,215,217,219,221,223,225,227,229,231,233};
//   29 //int ProssessLineSto[72] = {60,63,66,69,72,75,78,81,84,87,90,93,96,99,102,105,108,111,114,117,120,123,126,129,132,135,138,141,144,147,150,153,156,159,162,165,168,171,174,177,180,183,186,189,192,195,198,201,204,207,210,213,216,219,222,225,228,231,234,237,240,243,246,249,252,255,258,261,264,267,270,273};

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   30 int ProssessLineSto[36] = {70,80,89,97,104,110,116,122,128,134,140,146,152,158,164,169,174,179,184,189,194,199,204,209,214,219,223,227,231,235,239,243,247,251,255,259};
ProssessLineSto:
        DATA
        DC32 70, 80, 89, 97, 104, 110, 116, 122, 128, 134, 140, 146, 152, 158
        DC32 164, 169, 174, 179, 184, 189, 194, 199, 204, 209, 214, 219, 223
        DC32 227, 231, 235, 239, 243, 247, 251, 255, 259
//   31 /************************************ISR中断函数********************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void UART1_ISR(void)
//   33 {
//   34 }
UART1_ISR:
        BX       LR               ;; return
//   35 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   36 void DMA_CH0_Handle(void)           //DMA通道0采集一次处理Error[Li005]: no definition for "GPIO_PIN" [referenced from C:\Users\Administrator\Desktop\3.11换结构BLOCK nd  black\Debug\Obj\Oled.o] 
//   37 
//   38 {
//   39  
//   40 }
DMA_CH0_Handle:
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41 int q, dir,bitnum;
dir:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   42 long irtime;
irtime:
        DS8 4
//   43 
//   44 
//   45 
//   46 
//   47 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   48  int now;
now:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   49 int last;
last:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   50  int DTflag;
DTflag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   51 int DTstate;
DTstate:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   52 long DTcnt;
DTcnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 long DTcntsum;
DTcntsum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   54 long L_DTcntsum;
L_DTcntsum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   55 long DTlost;
DTlost:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   56 int DTreceive;
DTreceive:
        DS8 4
//   57 
//   58 
//   59  
//   60  
//   61  
//   62 
//   63  
//   64 
//   65  
//   66  
//   67 
//   68  
//   69  
//   70  
//   71   
//   72  
//   73  
//   74  
//   75 
//   76  
//   77  
//   78  
//   79  
//   80 
//   81 
//   82 
//   83 
//   84 
//   85 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   86 void FTM0_ISR(void)
//   87 {
//   88  
//   89  
//   90  
//   91  
//   92  FTM0_STATUS = 0X00;
FTM0_ISR:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10  ;; 0x40038050
        STR      R0,[R1, #+0]
//   93 }
        BX       LR               ;; return
//   94 
//   95 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   96 void FTM1_ISR(void)
//   97 {
//   98  
//   99  
//  100  
//  101  FTM1_STATUS = 0X00;
FTM1_ISR:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_1  ;; 0x40039050
        STR      R0,[R1, #+0]
//  102 }
        BX       LR               ;; return
//  103 
//  104 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  105 void FTM2_ISR(void)
//  106 {
//  107  
//  108 }
FTM2_ISR:
        BX       LR               ;; return
//  109 
//  110 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  111 int q;
q:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  112 int R_Motor_Speed;
R_Motor_Speed:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  113 void PIT0_ISR(void)
//  114 {
//  115   
//  116   
//  117   
//  118 irtime++;
PIT0_ISR:
        LDR.N    R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable10_2
        STR      R0,[R1, #+0]
//  119 
//  120 CLR_PIT0;
        LDR.N    R0,??DataTable10_3  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_3  ;; 0x4003710c
        STR      R0,[R1, #+0]
//  121 }
        BX       LR               ;; return
//  122 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//  123  uint16 data;
`data`:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  124 void PIT1_ISR(void)
//  125 {
//  126  //data = lptmr_pulse_get();
//  127 //R_Motor_Speed=QUADRead_L();
//  128   FTM1_CNT=0;
PIT1_ISR:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_4  ;; 0x40039004
        STR      R0,[R1, #+0]
//  129  CLR_PIT1;
        LDR.N    R0,??DataTable10_5  ;; 0x4003711c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_5  ;; 0x4003711c
        STR      R0,[R1, #+0]
//  130 }
        BX       LR               ;; return
//  131 
//  132 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  133 void PIT2_ISR(void)
//  134 {
//  135  CLR_PIT2;
PIT2_ISR:
        LDR.N    R0,??DataTable10_6  ;; 0x4003712c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_6  ;; 0x4003712c
        STR      R0,[R1, #+0]
//  136 }
        BX       LR               ;; return
//  137 
//  138 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  139 void PIT3_ISR(void)
//  140 {
//  141  CLR_PIT3;
PIT3_ISR:
        LDR.N    R0,??DataTable10_7  ;; 0x4003713c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_7  ;; 0x4003713c
        STR      R0,[R1, #+0]
//  142 }
        BX       LR               ;; return
//  143 
//  144 
//  145 
//  146 
//  147 
//  148 
//  149 
//  150 
//  151 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  152 void Porta_Isr(void)
//  153 {
//  154  
//  155  if(PORTA_ISFR & (1<<24))          //行中断
Porta_Isr:
        LDR.N    R0,??DataTable10_8  ;; 0x400490a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+7
        BPL.N    ??Porta_Isr_0
//  156  {
//  157   PORTA_ISFR |= (1<<24);       //清中断
        LDR.N    R0,??DataTable10_8  ;; 0x400490a0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable10_8  ;; 0x400490a0
        STR      R0,[R1, #+0]
//  158  }
//  159 }
??Porta_Isr_0:
        BX       LR               ;; return
//  160 
//  161 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  162 void Portb_Isr(void)
//  163 {
//  164  if(PORTB_ISFR & (1<<23))         //场中断
Portb_Isr:
        LDR.N    R0,??DataTable10_9  ;; 0x4004a0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+8
        BPL.N    ??Portb_Isr_0
//  165  {
//  166   
//  167   PORTB_PCR23|=PORT_PCR_ISF_MASK;//清除中断标志
        LDR.N    R0,??DataTable10_10  ;; 0x4004a05c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable10_10  ;; 0x4004a05c
        STR      R0,[R1, #+0]
//  168   
//  169   
//  170  }
//  171  
//  172 }
??Portb_Isr_0:
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  173 int bitnum;
bitnum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  174 int u = 0,irreceiveok=0;
u:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
irreceiveok:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  175 char irdata[33];
irdata:
        DS8 36

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  176 int sby_flag=0;
sby_flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  177 long fir_time;
fir_time:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  178 long sec_time;
sec_time:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  179 long  true_time;
true_time:
        DS8 4
//  180 
//  181 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  182 void Portc_Isr(void)
//  183 {
//  184  
//  185  if(PORTC_ISFR & (1<<14))                       //行中断
Portc_Isr:
        LDR.N    R0,??DataTable10_11  ;; 0x4004b0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+17
        BPL.N    ??Portc_Isr_0
//  186  { 
//  187 //   bitnum++;
//  188         if(irtime>40)
        LDR.N    R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+41
        BLT.N    ??Portc_Isr_1
//  189      {
//  190       bitnum=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_12
        STR      R0,[R1, #+0]
//  191      }
//  192   irdata[bitnum]=irtime;
??Portc_Isr_1:
        LDR.N    R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable10_13
        LDR.N    R2,??DataTable10_12
        LDR      R2,[R2, #+0]
        STRB     R0,[R2, R1]
//  193    irtime=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_2
        STR      R0,[R1, #+0]
//  194    bitnum++;
        LDR.N    R0,??DataTable10_12
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable10_12
        STR      R0,[R1, #+0]
//  195   if(bitnum==33)
        LDR.N    R0,??DataTable10_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+33
        BNE.N    ??Portc_Isr_2
//  196  {
//  197 //  bitnum=0;
//  198     irreceiveok=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable10_14
        STR      R0,[R1, #+0]
//  199   }
//  200 
//  201    
//  202      PORTC_ISFR |= (1<<14);       //清中断
??Portc_Isr_2:
        LDR.N    R0,??DataTable10_11  ;; 0x4004b0a0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4000
        LDR.N    R1,??DataTable10_11  ;; 0x4004b0a0
        STR      R0,[R1, #+0]
//  203    
//  204  // PORTC_PCR14|=PORT_PCR_ISF_MASK;//清除中断标志位
//  205 
//  206 }
//  207 
//  208 
//  209 }
??Portc_Isr_0:
        BX       LR               ;; return
//  210 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  211 void Portd_Isr(void)
//  212 {
//  213  if(PORTD_ISFR & (1<<0))
Portd_Isr:
        LDR.N    R0,??DataTable10_15  ;; 0x4004c0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??Portd_Isr_0
//  214  {
//  215   PORTD_ISFR |= (1<<0);
        LDR.N    R0,??DataTable10_15  ;; 0x4004c0a0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_15  ;; 0x4004c0a0
        STR      R0,[R1, #+0]
//  216  }
//  217 }
??Portd_Isr_0:
        BX       LR               ;; return
//  218 
//  219 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  220 void Porte_Isr(void)
//  221 {
//  222  if(PORTE_ISFR & (1<<0))
Porte_Isr:
        LDR.N    R0,??DataTable10_16  ;; 0x4004d0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??Porte_Isr_0
//  223  {
//  224   PORTE_ISFR |= (1<<0);
        LDR.N    R0,??DataTable10_16  ;; 0x4004d0a0
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_16  ;; 0x4004d0a0
        STR      R0,[R1, #+0]
//  225  }
//  226 }
??Porte_Isr_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x40038050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x40039050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     irtime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     0x40039004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     0x4003711c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0x4003712c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     0x4003713c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     0x400490a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     0x4004a0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_10:
        DC32     0x4004a05c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_11:
        DC32     0x4004b0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_12:
        DC32     bitnum

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_13:
        DC32     irdata

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_14:
        DC32     irreceiveok

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_15:
        DC32     0x4004c0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_16:
        DC32     0x4004d0a0

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
// 358 bytes in section .bss
// 145 bytes in section .data
// 328 bytes in section .text
// 
// 328 bytes of CODE memory
// 503 bytes of DATA memory
//
//Errors: none
//Warnings: none
