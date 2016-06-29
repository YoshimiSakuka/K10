///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:43
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\Balance.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\Balance.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\Balance.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN BlackflagEN
        EXTERN BlocklEN
        EXTERN BlockrEN
        EXTERN BmaEN
        EXTERN Delay_ccd
        EXTERN ElbowbendlEN
        EXTERN ElbowbendrEN
        EXTERN FieldCnt
        EXTERN FlashSetPara
        EXTERN GPIO_GetBit
        EXTERN LCD_CLS
        EXTERN LCD_P6x8Str
        EXTERN LighthouseEN
        EXTERN Midline
        EXTERN OledShowEN
        EXTERN ProtectEN
        EXTERN RampEN
        EXTERN ReadAcceleration
        EXTERN SinglineEN
        EXTERN SpeedextraEN
        EXTERN SteerEssEN
        EXTERN WhiteEN
        EXTERN YZ
        EXTERN __aeabi_cdcmple
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2d
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN abs
        EXTERN acos
        EXTERN ad_once
        EXTERN sprintf
        EXTERN sqrt

        PUBLIC AngleControl
        PUBLIC AngleConvert
        PUBLIC AngleGyroscope
        PUBLIC AngleSpeedOut
        PUBLIC Angle_Kd
        PUBLIC Angle_Kp
        PUBLIC Choice
        PUBLIC Complementary
        PUBLIC D_D
        PUBLIC D_I
        PUBLIC D_P
        PUBLIC Gyro_angle
        PUBLIC Gyro_offset
        PUBLIC Ka
        PUBLIC LCD_Flag
        PUBLIC MotorControlLeft
        PUBLIC MotorControlRight
        PUBLIC QUADRead
        PUBLIC SpecialPWM
        PUBLIC SpecialPWML
        PUBLIC SpecialPWMR
        PUBLIC SpeedControl
        PUBLIC SpeedEss
        PUBLIC SpeedEss_f
        PUBLIC SpeedExtraNew
        PUBLIC SpeedExtraOld
        PUBLIC SpeedInt
        PUBLIC SpeedUd
        PUBLIC SpeedUi
        PUBLIC SpeedUp
        PUBLIC SpeedWant
        PUBLIC SpeedWant_
        PUBLIC Speed_Kd
        PUBLIC Speed_Ki
        PUBLIC Speed_Ki_
        PUBLIC Speed_Kp
        PUBLIC Speeda
        PUBLIC Speedextra
        PUBLIC Stoptime
        PUBLIC TurnGyro
        PUBLIC Turn_Max
        PUBLIC a
        PUBLIC a_i
        PUBLIC angle
        PUBLIC angleoffset
        PUBLIC chushihua
        PUBLIC dSpeedUd
        PUBLIC rate
        PUBLIC specialfield
        PUBLIC speedmiddle
        PUBLIC `str`
        PUBLIC tau
        PUBLIC weight_Max
        PUBLIC weight_Min

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\Balance.c
//    1 #include "Balance.h"
//    2 #include "math.h"
//    3 
//    4 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 float angle ;
angle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 float D_I;
D_I:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 long Speed_Kp;
Speed_Kp:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 long Speed_Kd; 
Speed_Kd:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 long Speed_Ki;
Speed_Ki:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 long Speed_Ki_;
Speed_Ki_:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 float TurnGyro;
TurnGyro:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 float D_P;
D_P:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 float D_D;
D_D:
        DS8 4
//   14 
//   15 
//   16 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 long weight_Max;
weight_Max:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 long weight_Min;
weight_Min:
        DS8 4
//   19 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   20 long Angle_Kp=1990;
Angle_Kp:
        DATA
        DC32 1990

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 long Angle_Kd=60;
Angle_Kd:
        DATA
        DC32 60
//   22 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 int Choice;
Choice:
        DS8 4
//   24 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 long SpecialPWM;
SpecialPWM:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 long SpecialPWML;
SpecialPWML:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 long SpecialPWMR;
SpecialPWMR:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 int Ka;
Ka:
        DS8 4
//   29 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30 int Turn_Max;
Turn_Max:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 long SpeedWant;
SpeedWant:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 int Stoptime;
Stoptime:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   33 float angleoffset=83;
angleoffset:
        DATA
        DC32 42A60000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 uint8 str[80];
`str`:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 int specialfield;
specialfield:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   36 float Gyro_angle;                   
Gyro_angle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   37 float Gyro_offset;    
Gyro_offset:
        DS8 4
//   38 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39 int SpeedEss_f[4] = {0,0,0,0};              //速度偏差滤波存储
SpeedEss_f:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   40 int SpeedEss[3] = {0,0,0};
SpeedEss:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41 int SpeedInt = 0;
SpeedInt:
        DS8 4
//   42 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   43 int SpeedUp = 0,SpeedUi = 0,SpeedUd = 0;
SpeedUp:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SpeedUi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SpeedUd:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   44 int speedmiddle = 0;
speedmiddle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 int Speedextra = 0;
Speedextra:
        DS8 4
//   46 
//   47 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   48 float Speeda = 0.1;
Speeda:
        DATA
        DC32 3DCCCCCDH

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   49 int dSpeedUd[2] = 0;
dSpeedUd:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   50 long SpeedWant_ = 0;
SpeedWant_:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   51 int SpeedExtraOld = 0,SpeedExtraNew = 0;
SpeedExtraOld:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SpeedExtraNew:
        DS8 4
//   52 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53 int AngleSpeedOut;
AngleSpeedOut:
        DS8 4
//   54 
//   55 
//   56 
//   57 
//   58 
//   59 //float rate=0.55;
//   60 //float tau=1.4;
//   61 
//   62 
//   63 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   64 float rate=0.55;
rate:
        DATA
        DC32 3F0CCCCDH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   65 float tau=1.6;
tau:
        DATA
        DC32 3FCCCCCDH
//   66 
//   67 
//   68 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   69 float AngleConvert(void)                //加速度计角度转化
//   70 {
AngleConvert:
        PUSH     {R4-R6,LR}
//   71  float jsdangle,jsdy,jsdz,jsdx,g;
//   72  //jsdz = ReadAcceleration(10,0);//Z
//   73  jsdy = ReadAcceleration(2,1);
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       ReadAcceleration
        MOVS     R4,R0
//   74  jsdz = ReadAcceleration(0,1);
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       ReadAcceleration
        MOVS     R5,R0
//   75  jsdx = ReadAcceleration(1,1);
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       ReadAcceleration
//   76  g = sqrt(jsdx * jsdx + jsdy * jsdy);
        MOVS     R1,R0
        BL       __aeabi_fmul
        MOVS     R6,R0
        MOVS     R1,R4
        MOVS     R0,R4
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        BL       sqrt
        BL       __aeabi_d2f
        MOVS     R2,R0
//   77  
//   78  if(jsdz > 4095)
        MOVS     R0,R5
        LDR.W    R1,??DataTable7  ;; 0x457ff001
        BL       __aeabi_cfrcmple
        BHI.N    ??AngleConvert_0
//   79  {
//   80   jsdz = 4095;
        LDR.W    R5,??DataTable7_1  ;; 0x457ff000
//   81  }
//   82  if(jsdz < -4095)
??AngleConvert_0:
        MOVS     R0,R5
        LDR.W    R1,??DataTable7_2  ;; 0xc57ff000
        BL       __aeabi_cfcmple
        BCS.N    ??AngleConvert_1
//   83  {
//   84   jsdz = -4095;
        LDR.W    R5,??DataTable7_2  ;; 0xc57ff000
//   85  }
//   86  jsdangle = (acos((float)jsdz / 4095)) * 57.325;//180 / 3.14;
??AngleConvert_1:
        MOVS     R0,R5
        LDR.W    R1,??DataTable7_1  ;; 0x457ff000
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        BL       acos
        LDR.W    R2,??DataTable7_3  ;; 0x9999999a
        LDR.W    R3,??DataTable7_4  ;; 0x404ca999
        BL       __aeabi_dmul
        BL       __aeabi_d2f
//   87  
//   88  return (jsdangle - angleoffset);//
        LDR.W    R1,??DataTable7_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        POP      {R4-R6,PC}       ;; return
//   89  
//   90 }
//   91 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   92 void AngleGyroscope(void)                  //陀螺程序 暂时未加转向侧角速度
//   93 {
AngleGyroscope:
        PUSH     {R7,LR}
//   94  uint16 gyro_balance,gyro_turn;
//   95  gyro_balance = ad_once(ADC1,AD15,ADC_12bit);
        MOVS     R2,#+1
        MOVS     R1,#+15
        MOVS     R0,#+1
        BL       ad_once
//   96  //Gyro_angle += ((float)gyro_balance - (float)Gyro_offset) / 200;
//   97  Gyro_angle = ((float)gyro_balance - (float)Gyro_offset) * rate;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable7_6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable7_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_8
        STR      R0,[R1, #+0]
//   98 }
        POP      {R0,PC}          ;; return
//   99 
//  100 
//  101 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  102 int QUADRead(uint8 dir)                    //0为右1为左
//  103 {
//  104  uint8 direction;
//  105  int speed;
//  106  if(dir)
QUADRead:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??QUADRead_0
//  107  {
//  108   direction = (FTM2_QDCTRL & FTM_QDCTRL_QUADIR_MASK) >> FTM_QDCTRL_QUADIR_SHIFT;//正负标志
        LDR.W    R0,??DataTable7_9  ;; 0x400b8080
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+1
//  109   if(direction)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??QUADRead_1
//  110   {
//  111    speed = -(int)FTM2_CNT;
        LDR.W    R0,??DataTable7_10  ;; 0x400b8004
        LDR      R0,[R0, #+0]
        RSBS     R0,R0,#+0
        B.N      ??QUADRead_2
//  112    
//  113   }
//  114   else
//  115   {
//  116    speed = 1 * (14000 - (int)FTM2_CNT);  
??QUADRead_1:
        MOVW     R0,#+14000
        LDR.W    R1,??DataTable7_10  ;; 0x400b8004
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
//  117    
//  118   }
//  119   FTM2_CNT = 0;
??QUADRead_2:
        MOVS     R1,#+0
        LDR.W    R2,??DataTable7_10  ;; 0x400b8004
        STR      R1,[R2, #+0]
        B.N      ??QUADRead_3
//  120  }
//  121  else
//  122  {
//  123   direction = (FTM1_QDCTRL & FTM_QDCTRL_QUADIR_MASK) >> FTM_QDCTRL_QUADIR_SHIFT;//正负标志
??QUADRead_0:
        LDR.W    R0,??DataTable7_11  ;; 0x40039080
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+1
//  124   if(direction)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??QUADRead_4
//  125   {
//  126    speed = (int)FTM1_CNT;
        LDR.W    R0,??DataTable7_12  ;; 0x40039004
        LDR      R0,[R0, #+0]
        B.N      ??QUADRead_5
//  127    
//  128   }
//  129   else
//  130   {
//  131    speed = -1 * (14000 - (int)FTM1_CNT);  
??QUADRead_4:
        MOVW     R0,#+14000
        LDR.W    R1,??DataTable7_12  ;; 0x40039004
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        MOVS     R1,#-1
        MULS     R0,R1,R0
//  132    
//  133   }
//  134   FTM1_CNT = 0;
??QUADRead_5:
        MOVS     R1,#+0
        LDR.W    R2,??DataTable7_12  ;; 0x40039004
        STR      R1,[R2, #+0]
//  135  }
//  136  if(speed < -10000)    speed = 0;
??QUADRead_3:
        LDR.W    R1,??DataTable7_13  ;; 0xffffd8f0
        CMP      R0,R1
        BGE.N    ??QUADRead_6
        MOVS     R0,#+0
//  137  if(speed > 10000)     speed = 0;
??QUADRead_6:
        MOVW     R1,#+10001
        CMP      R0,R1
        BLT.N    ??QUADRead_7
        MOVS     R0,#+0
//  138  return speed;
??QUADRead_7:
        BX       LR               ;; return
//  139 }
//  140 
//  141 
//  142 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  143 float a = 0.0;
a:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  144 float a_i = 0;
a_i:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  145 float Complementary(float newAngle,float newRate,int looptime)
//  146 {
Complementary:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R2
//  147  
//  148  float dtC = (float)(looptime)/1000.0;
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable7_14  ;; 0x408f4000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOVS     R6,R0
//  149  a = tau/(tau + dtC);
        LDR.W    R0,??DataTable7_15
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R1,R0
        LDR.W    R0,??DataTable7_15
        LDR      R0,[R0, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable7_16
        STR      R0,[R1, #+0]
//  150  angle = a * (angle + newRate * dtC) + (1 - a) * (newAngle) + a_i * (newAngle - angle);
        MOVS     R0,R5
        MOVS     R1,R6
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_17
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_16
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        MOVS     R0,#+1065353216
        LDR.W    R1,??DataTable7_16
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
        MOVS     R0,R4
        LDR.N    R1,??DataTable7_17
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable7_18
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable7_17
        STR      R0,[R1, #+0]
//  151  return angle;
        LDR.N    R0,??DataTable7_17
        LDR      R0,[R0, #+0]
        POP      {R4-R6,PC}       ;; return
//  152  
//  153  
//  154 }
//  155 
//  156 
//  157 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  158 void AngleControl(void)
//  159 {
AngleControl:
        PUSH     {R4,LR}
//  160  float diss = 0;
        MOVS     R4,#+0
//  161  diss = angle;
        LDR.N    R0,??DataTable7_17
        LDR      R0,[R0, #+0]
        MOVS     R4,R0
//  162  AngleSpeedOut = (int)((diss) * Angle_Kp + Gyro_angle * Angle_Kd);
        LDR.N    R0,??DataTable7_19
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.N    R0,??DataTable7_20
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable7_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable7_21
        STR      R0,[R1, #+0]
//  163 }
        POP      {R4,PC}          ;; return
//  164 
//  165 
//  166 
//  167 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  168 void MotorControlLeft(int data)
//  169 {
//  170  if(data > 0)
MotorControlLeft:
        CMP      R0,#+1
        BLT.N    ??MotorControlLeft_0
//  171  {
//  172   
//  173   if(data > 14999)
        MOVW     R1,#+15000
        CMP      R0,R1
        BLT.N    ??MotorControlLeft_1
//  174    data = 14999;
        MOVW     R0,#+14999
//  175   FTM0_C4V = data;
??MotorControlLeft_1:
        LDR.N    R1,??DataTable7_22  ;; 0x40038030
        STR      R0,[R1, #+0]
//  176   FTM0_C5V = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_23  ;; 0x40038038
        STR      R0,[R1, #+0]
        B.N      ??MotorControlLeft_2
//  177  }
//  178  else if(data < 0)
??MotorControlLeft_0:
        CMP      R0,#+0
        BPL.N    ??MotorControlLeft_3
//  179  {
//  180   
//  181   
//  182   if(data < -14999)
        LDR.N    R1,??DataTable7_24  ;; 0xffffc569
        CMP      R0,R1
        BGE.N    ??MotorControlLeft_4
//  183    data = -14999;
        LDR.N    R0,??DataTable7_24  ;; 0xffffc569
//  184   
//  185   FTM0_C4V = 0;
??MotorControlLeft_4:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable7_22  ;; 0x40038030
        STR      R1,[R2, #+0]
//  186   FTM0_C5V = -1 * data;
        MOVS     R1,#-1
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable7_23  ;; 0x40038038
        STR      R0,[R1, #+0]
        B.N      ??MotorControlLeft_2
//  187   
//  188  }
//  189  else if (data == 0)
??MotorControlLeft_3:
        CMP      R0,#+0
        BNE.N    ??MotorControlLeft_2
//  190  {
//  191   FTM0_C6V = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_25  ;; 0x40038040
        STR      R0,[R1, #+0]
//  192   FTM0_C5V = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_23  ;; 0x40038038
        STR      R0,[R1, #+0]
//  193  }
//  194 }
??MotorControlLeft_2:
        BX       LR               ;; return
//  195 
//  196 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  197 void MotorControlRight(int data)
//  198 {
//  199  if(data > 0)
MotorControlRight:
        CMP      R0,#+1
        BLT.N    ??MotorControlRight_0
//  200  {
//  201   
//  202   
//  203   if(data > 14999)
        MOVW     R1,#+15000
        CMP      R0,R1
        BLT.N    ??MotorControlRight_1
//  204    data = 14999;
        MOVW     R0,#+14999
//  205   FTM0_C7V = data;
??MotorControlRight_1:
        LDR.N    R1,??DataTable7_26  ;; 0x40038048
        STR      R0,[R1, #+0]
//  206   FTM0_C6V = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_25  ;; 0x40038040
        STR      R0,[R1, #+0]
        B.N      ??MotorControlRight_2
//  207  }
//  208  else if(data < 0)
??MotorControlRight_0:
        CMP      R0,#+0
        BPL.N    ??MotorControlRight_3
//  209  {
//  210   
//  211   if(data < -14999)
        LDR.N    R1,??DataTable7_24  ;; 0xffffc569
        CMP      R0,R1
        BGE.N    ??MotorControlRight_4
//  212    data = -14999;
        LDR.N    R0,??DataTable7_24  ;; 0xffffc569
//  213   FTM0_C7V = 0;
??MotorControlRight_4:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable7_26  ;; 0x40038048
        STR      R1,[R2, #+0]
//  214   FTM0_C6V = -1 * data;
        MOVS     R1,#-1
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable7_25  ;; 0x40038040
        STR      R0,[R1, #+0]
        B.N      ??MotorControlRight_2
//  215   
//  216  }
//  217  else if(data == 0)
??MotorControlRight_3:
        CMP      R0,#+0
        BNE.N    ??MotorControlRight_2
//  218  {
//  219   FTM0_C7V = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_26  ;; 0x40038048
        STR      R0,[R1, #+0]
//  220   FTM0_C6V = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_25  ;; 0x40038040
        STR      R0,[R1, #+0]
//  221  }
//  222 }
??MotorControlRight_2:
        BX       LR               ;; return
//  223 
//  224 
//  225 
//  226 
//  227 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  228 void SpeedControl(int left,int right)
//  229 {
SpeedControl:
        PUSH     {R4-R6,LR}
//  230  
//  231  
//  232  if(FieldCnt < 150)
        LDR.N    R2,??DataTable7_27
        LDR      R2,[R2, #+0]
        CMP      R2,#+150
        BCS.N    ??SpeedControl_0
//  233  {
//  234   SpeedWant_ = 0;
        MOVS     R2,#+0
        LDR.N    R3,??DataTable7_28
        STR      R2,[R3, #+0]
        B.N      ??SpeedControl_1
//  235  }
//  236  else if(FieldCnt < 400)
??SpeedControl_0:
        LDR.N    R2,??DataTable7_27
        LDR      R2,[R2, #+0]
        CMP      R2,#+400
        BCS.N    ??SpeedControl_2
//  237  {
//  238   SpeedWant_ = (int)(SpeedWant * (FieldCnt - 150) / 250 );
        LDR.N    R2,??DataTable7_29
        LDR      R2,[R2, #+0]
        LDR.N    R3,??DataTable7_27
        LDR      R3,[R3, #+0]
        SUBS     R3,R3,#+150
        MULS     R2,R3,R2
        MOVS     R3,#+250
        UDIV     R2,R2,R3
        LDR.N    R3,??DataTable7_28
        STR      R2,[R3, #+0]
        B.N      ??SpeedControl_1
//  239  }
//  240  else
//  241  {
//  242   SpeedWant_ = SpeedWant;
??SpeedControl_2:
        LDR.N    R2,??DataTable7_29
        LDR      R2,[R2, #+0]
        LDR.N    R3,??DataTable7_28
        STR      R2,[R3, #+0]
//  243   
//  244  }
//  245  
//  246 //  if(FieldCnt >400)
//  247 //  Speed_Ki_=Speed_Ki;
//  248  
//  249  
//  250  //SpeedWant_ = SpeedWant;
//  251  
//  252  int speedmiddle = 0,speeddis = 0;
??SpeedControl_1:
        MOVS     R2,#+0
        MOVS     R6,#+0
//  253  speedmiddle = (left + right) / 20;
        ADDS     R0,R1,R0
        MOVS     R1,#+20
        SDIV     R0,R0,R1
        MOVS     R2,R0
//  254  
//  255  SpeedExtraOld = SpeedExtraNew;
        LDR.N    R0,??DataTable7_30
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_31
        STR      R0,[R1, #+0]
//  256  SpeedEss_f[3] = SpeedEss_f[2];
        LDR.N    R0,??DataTable7_32
        LDR      R0,[R0, #+8]
        LDR.N    R1,??DataTable7_32
        STR      R0,[R1, #+12]
//  257  SpeedEss_f[2] = SpeedEss_f[1];
        LDR.N    R0,??DataTable7_32
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable7_32
        STR      R0,[R1, #+8]
//  258  SpeedEss_f[1] = SpeedEss_f[0];
        LDR.N    R0,??DataTable7_32
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_32
        STR      R0,[R1, #+4]
//  259  
//  260  
//  261  
//  262  SpeedEss[2] = SpeedEss[1];
        LDR.N    R0,??DataTable7_33
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable7_33
        STR      R0,[R1, #+8]
//  263  SpeedEss[1] = SpeedEss[0];
        LDR.N    R0,??DataTable7_33
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_33
        STR      R0,[R1, #+4]
//  264  
//  265  
//  266  
//  267  
//  268  speeddis = 0.6 * speedmiddle + 0.4 * SpeedEss_f[1];
        MOVS     R0,R2
        BL       __aeabi_i2d
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable7_34  ;; 0x3fe33333
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable7_32
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2d
        LDR.N    R2,??DataTable7_3  ;; 0x9999999a
        LDR.N    R3,??DataTable7_35  ;; 0x3fd99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2iz
        MOVS     R6,R0
//  269  
//  270  SpeedEss_f[0] = speeddis;
        LDR.N    R0,??DataTable7_32
        STR      R6,[R0, #+0]
//  271  
//  272  
//  273  SpeedEss[0] = SpeedWant_ - speeddis;
        LDR.N    R0,??DataTable7_28
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,R6
        LDR.N    R1,??DataTable7_33
        STR      R0,[R1, #+0]
//  274  
//  275  if(abs(SpeedEss[0]) < (SpeedWant_ * 1.2))
        LDR.N    R0,??DataTable7_28
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable7_36  ;; 0x3ff33333
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R4,R2
        MOVS     R5,R3
        LDR.N    R0,??DataTable7_33
        LDR      R0,[R0, #+0]
        BL       abs
        BL       __aeabi_i2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_cdcmple
        BCS.N    ??SpeedControl_3
//  276   SpeedInt += SpeedEss[0];
        LDR.N    R0,??DataTable7_37
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_33
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable7_37
        STR      R0,[R1, #+0]
//  277  
//  278  SpeedExtraOld = SpeedExtraNew;
??SpeedControl_3:
        LDR.N    R0,??DataTable7_30
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_31
        STR      R0,[R1, #+0]
//  279  
//  280  if((abs(SpeedEss[0]) > 0) && (abs(SpeedEss[0]) < (SpeedWant * 1.2)))//(int)(SpeedWant / 10)   //死区
        LDR.N    R0,??DataTable7_33
        LDR      R0,[R0, #+0]
        BL       abs
        CMP      R0,#+1
        BLT.N    ??SpeedControl_4
        LDR.N    R0,??DataTable7_29
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable7_36  ;; 0x3ff33333
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R4,R2
        MOVS     R5,R3
        LDR.N    R0,??DataTable7_33
        LDR      R0,[R0, #+0]
        BL       abs
        BL       __aeabi_i2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_cdcmple
        BCS.N    ??SpeedControl_4
//  281  {
//  282   //dSpeedUd[0] = (int)(Speed_Kd * (SpeedEss[0] - 2 * SpeedEss[1] + SpeedEss[2]));
//  283   SpeedUp += (int)(Speed_Kp * (SpeedEss[0] - SpeedEss[1]));
        LDR.N    R0,??DataTable7_38
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_39
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable7_33
        LDR      R2,[R2, #+0]
        LDR.N    R3,??DataTable7_33
        LDR      R3,[R3, #+4]
        SUBS     R2,R2,R3
        MLA      R0,R2,R1,R0
        LDR.N    R1,??DataTable7_38
        STR      R0,[R1, #+0]
//  284   SpeedUi = (int)(Speed_Ki_ * SpeedInt / 10);
        LDR.N    R0,??DataTable7_40
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_37
        LDR      R1,[R1, #+0]
        MULS     R0,R1,R0
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable7_41
        STR      R0,[R1, #+0]
//  285   
//  286   SpeedUd += (int)((1 - Speeda) * dSpeedUd[0] + Speeda * dSpeedUd[1]);
        LDR.N    R0,??DataTable7_42
        LDR      R4,[R0, #+0]
        MOVS     R0,#+1065353216
        LDR.N    R1,??DataTable7_43
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR.N    R0,??DataTable7_44
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??DataTable7_44
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable7_43
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        ADDS     R0,R0,R4
        LDR.N    R1,??DataTable7_42
        STR      R0,[R1, #+0]
//  287  }
//  288  if((abs(SpeedEss[0]) < 5) && (SpeedWant_ > 0)) //积分分离(SpeedWant / 2)(int)(SpeedWant / 10)abs
??SpeedControl_4:
        LDR.N    R0,??DataTable7_33
        LDR      R0,[R0, #+0]
        BL       abs
//  289  {
//  290   
//  291   //BmaCnt = 10;
//  292  }
//  293  
//  294  
//  295  {
//  296   
//  297   Speedextra = SpeedUp + SpeedUi;
        LDR.N    R1,??DataTable7_38
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable7_41
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDR.N    R2,??DataTable7_45
        STR      R1,[R2, #+0]
//  298   SpeedExtraNew = SpeedUp + SpeedUi;
        LDR.N    R1,??DataTable7_38
        LDR      R1,[R1, #+0]
        LDR.N    R2,??DataTable7_41
        LDR      R2,[R2, #+0]
        ADDS     R1,R2,R1
        LDR.N    R2,??DataTable7_30
        STR      R1,[R2, #+0]
//  299   
//  300  }
//  301  
//  302  
//  303 }
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x457ff001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x457ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0xc57ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x404ca999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     angleoffset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     Gyro_offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     rate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     Gyro_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     0x400b8080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0x400b8004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     0x40039080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_12:
        DC32     0x40039004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_13:
        DC32     0xffffd8f0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_14:
        DC32     0x408f4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_15:
        DC32     tau

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_16:
        DC32     a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_17:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_18:
        DC32     a_i

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_19:
        DC32     Angle_Kp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_20:
        DC32     Angle_Kd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_21:
        DC32     AngleSpeedOut

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_22:
        DC32     0x40038030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_23:
        DC32     0x40038038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_24:
        DC32     0xffffc569

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_25:
        DC32     0x40038040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_26:
        DC32     0x40038048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_27:
        DC32     FieldCnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_28:
        DC32     SpeedWant_

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_29:
        DC32     SpeedWant

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_30:
        DC32     SpeedExtraNew

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_31:
        DC32     SpeedExtraOld

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_32:
        DC32     SpeedEss_f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_33:
        DC32     SpeedEss

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_34:
        DC32     0x3fe33333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_35:
        DC32     0x3fd99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_36:
        DC32     0x3ff33333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_37:
        DC32     SpeedInt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_38:
        DC32     SpeedUp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_39:
        DC32     Speed_Kp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_40:
        DC32     Speed_Ki_

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_41:
        DC32     SpeedUi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_42:
        DC32     SpeedUd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_43:
        DC32     Speeda

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_44:
        DC32     dSpeedUd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_45:
        DC32     Speedextra
//  304 
//  305 
//  306 
//  307 
//  308 
//  309 
//  310 
//  311 
//  312 
//  313 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  314 int LCD_Flag = 0;
LCD_Flag:
        DS8 4

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  315 void chushihua()
//  316 
//  317 {
chushihua:
        PUSH     {R7,LR}
//  318  
//  319 ///////////倍///////////////////////////////////////
//  320 //////////////////////////////////////////////////
//  321 
//  322 BlocklEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0
        STR      R0,[R1, #+0]
//  323 BlockrEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x4
        STR      R0,[R1, #+0]
//  324 ElbowbendrEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x8
        STR      R0,[R1, #+0]
//  325 ElbowbendlEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0xC
        STR      R0,[R1, #+0]
//  326 RampEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x10
        STR      R0,[R1, #+0]
//  327 ProtectEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x14
        STR      R0,[R1, #+0]
//  328 
//  329 SteerEssEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x18
        STR      R0,[R1, #+0]
//  330 SpeedextraEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x1C
        STR      R0,[R1, #+0]
//  331 SinglineEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x20
        STR      R0,[R1, #+0]
//  332 OledShowEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x24
        STR      R0,[R1, #+0]
//  333 BmaEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x28
        STR      R0,[R1, #+0]
//  334 WhiteEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x2C
        STR      R0,[R1, #+0]
//  335 LighthouseEN=1;
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x30
        STR      R0,[R1, #+0]
//  336 BlackflagEN=0;
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_0+0x34
        STR      R0,[R1, #+0]
//  337 
//  338 
//  339 
//  340  while(1)
//  341  {
//  342   if(!GPIO_GetBit(PORT_B,17))       //上
??chushihua_1:
        MOVS     R1,#+17
        MOVS     R0,#+1
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_2
//  343   {
//  344    LCD_Flag++;
        LDR.W    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x38
        STR      R0,[R1, #+0]
//  345    Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  346   }
//  347   if(!GPIO_GetBit(PORT_A,15))       //下
??chushihua_2:
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_3
//  348   {
//  349    LCD_Flag--;
        LDR.W    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x38
        STR      R0,[R1, #+0]
//  350    Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  351   }
//  352   if(LCD_Flag > 15)
??chushihua_3:
        LDR.W    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+16
        BLT.N    ??chushihua_4
//  353   {
//  354    LCD_Flag = 0;
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_0+0x38
        STR      R0,[R1, #+0]
//  355   }
//  356   if(LCD_Flag < 0)
??chushihua_4:
        LDR.W    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_5
//  357   {
//  358    LCD_Flag = 15;
        MOVS     R0,#+15
        LDR.W    R1,??chushihua_0+0x38
        STR      R0,[R1, #+0]
//  359   }
//  360   
//  361   if(LCD_Flag < 8)                //第一页
??chushihua_5:
        LDR.W    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+8
        BGE.W    ??chushihua_6
//  362   {
//  363    switch(LCD_Flag)
        LDR.W    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_7
        CMP      R0,#+2
        BEQ.N    ??chushihua_8
        BCC.N    ??chushihua_9
        CMP      R0,#+4
        BEQ.W    ??chushihua_10
        BCC.W    ??chushihua_11
        CMP      R0,#+6
        BEQ.W    ??chushihua_12
        BCC.W    ??chushihua_13
        CMP      R0,#+7
        BEQ.W    ??chushihua_14
        B.N      ??chushihua_15
//  364    {
//  365 	case 0:{LCD_P6x8Str(70,0,"=");
??chushihua_7:
        ADR.N    R2,??chushihua_16  ;; "="
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  366 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  367 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  368 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  369 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  370 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  371 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  372 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  373 	break;}
        B.N      ??chushihua_17
//  374 	case 1:{LCD_P6x8Str(70,0," ");
??chushihua_9:
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  375 	LCD_P6x8Str(70,1,"=");
        ADR.N    R2,??chushihua_16  ;; "="
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  376 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  377 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  378 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  379 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  380 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  381 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  382 	break;}
        B.N      ??chushihua_17
//  383 	case 2:{LCD_P6x8Str(70,0," ");
??chushihua_8:
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  384 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  385 	LCD_P6x8Str(70,2,"=");
        ADR.N    R2,??chushihua_16  ;; "="
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  386 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  387 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  388 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  389 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  390 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  391 	break;}
        B.N      ??chushihua_17
//  392 	case 3:{LCD_P6x8Str(70,0," ");
??chushihua_11:
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  393 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  394 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  395 	LCD_P6x8Str(70,3,"=");
        ADR.N    R2,??chushihua_16  ;; "="
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  396 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  397 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  398 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  399 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  400 	break;}
        B.N      ??chushihua_17
//  401 	case 4:{LCD_P6x8Str(70,0," ");
??chushihua_10:
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  402 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  403 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  404 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  405 	LCD_P6x8Str(70,4,"=");
        ADR.N    R2,??chushihua_16  ;; "="
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  406 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  407 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  408 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  409 	break;}
        B.N      ??chushihua_17
//  410 	case 5:{LCD_P6x8Str(70,0," ");
??chushihua_13:
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  411 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  412 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  413 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  414 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  415 	LCD_P6x8Str(70,5,"=");
        ADR.N    R2,??chushihua_16  ;; "="
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  416 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  417 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  418 	break;}
        B.N      ??chushihua_17
//  419 	case 6:{LCD_P6x8Str(70,0," ");
??chushihua_12:
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  420 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  421 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  422 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  423 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  424 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  425 	LCD_P6x8Str(70,6,"=");
        ADR.N    R2,??chushihua_16  ;; "="
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  426 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  427 	break;}
        B.N      ??chushihua_17
//  428    case 7:{LCD_P6x8Str(70,0," ");
??chushihua_14:
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  429 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  430 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  431 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  432 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  433 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  434 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_16+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  435 	LCD_P6x8Str(70,7,"=");
        ADR.N    R2,??chushihua_16  ;; "="
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  436 	break;}
        B.N      ??chushihua_17
        Nop      
        DATA
??chushihua_16:
        DC8      "=",0x0,0x0
        DC8      " ",0x0,0x0
        THUMB
//  437 	default:  break;
//  438    }
//  439    if(!GPIO_GetBit(PORT_A,12))
??chushihua_15:
??chushihua_17:
        MOVS     R1,#+12
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.W    ??chushihua_18
//  440    {
//  441 	Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  442 	switch(LCD_Flag)
        LDR.W    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_19
        CMP      R0,#+2
        BEQ.N    ??chushihua_20
        BCC.N    ??chushihua_21
        CMP      R0,#+4
        BEQ.N    ??chushihua_22
        BCC.N    ??chushihua_23
        CMP      R0,#+6
        BEQ.N    ??chushihua_24
        BCC.N    ??chushihua_25
        CMP      R0,#+7
        BEQ.N    ??chushihua_26
        B.N      ??chushihua_27
//  443 	{
//  444 	 case 0: BlocklEN += 1;if(BlocklEN)BlocklEN=1;break;
??chushihua_19:
        LDR.W    R0,??chushihua_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_0
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_28
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0
        STR      R0,[R1, #+0]
??chushihua_28:
        B.N      ??chushihua_18
//  445 	 case 1: BlockrEN += 1;if(BlockrEN)BlockrEN=1;break;
??chushihua_21:
        LDR.W    R0,??chushihua_0+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x4
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_29
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x4
        STR      R0,[R1, #+0]
??chushihua_29:
        B.N      ??chushihua_18
//  446 	 case 2: ElbowbendrEN += 1;if(ElbowbendrEN)ElbowbendrEN=1;break;
??chushihua_20:
        LDR.W    R0,??chushihua_0+0x8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x8
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_30
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x8
        STR      R0,[R1, #+0]
??chushihua_30:
        B.N      ??chushihua_18
//  447 	 case 3: ElbowbendlEN += 1;if(ElbowbendlEN)ElbowbendlEN=1;break;
??chushihua_23:
        LDR.W    R0,??chushihua_0+0xC
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0xC
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_31
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0xC
        STR      R0,[R1, #+0]
??chushihua_31:
        B.N      ??chushihua_18
//  448 	 case 4: RampEN += 1;if(RampEN)RampEN=1;break;
??chushihua_22:
        LDR.W    R0,??chushihua_0+0x10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x10
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_32
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x10
        STR      R0,[R1, #+0]
??chushihua_32:
        B.N      ??chushihua_18
//  449 	 case 5: ProtectEN += 1;if(ProtectEN)ProtectEN=1;break;
??chushihua_25:
        LDR.W    R0,??chushihua_0+0x14
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x14
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_33
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x14
        STR      R0,[R1, #+0]
??chushihua_33:
        B.N      ??chushihua_18
//  450 	 case 6: SteerEssEN += 1;if(SteerEssEN)SteerEssEN=1;break;
??chushihua_24:
        LDR.W    R0,??chushihua_0+0x18
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x18
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x18
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_34
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x18
        STR      R0,[R1, #+0]
??chushihua_34:
        B.N      ??chushihua_18
//  451 	 case 7: SpeedextraEN += 1;if(SpeedextraEN)SpeedextraEN=1;break;
??chushihua_26:
        LDR.W    R0,??chushihua_0+0x1C
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x1C
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x1C
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_35
        MOVS     R0,#+1
        LDR.W    R1,??chushihua_0+0x1C
        STR      R0,[R1, #+0]
??chushihua_35:
        B.N      ??chushihua_18
//  452 	 default:  break;
//  453 	}
//  454    }
//  455    if(!GPIO_GetBit(PORT_A,14))
??chushihua_27:
??chushihua_18:
        MOVS     R1,#+14
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.W    ??chushihua_36
//  456    {
//  457 	Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  458 	switch(LCD_Flag)
        LDR.W    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_37
        CMP      R0,#+2
        BEQ.N    ??chushihua_38
        BCC.N    ??chushihua_39
        CMP      R0,#+4
        BEQ.N    ??chushihua_40
        BCC.N    ??chushihua_41
        CMP      R0,#+6
        BEQ.N    ??chushihua_42
        BCC.N    ??chushihua_43
        CMP      R0,#+7
        BEQ.N    ??chushihua_44
        B.N      ??chushihua_45
//  459 	{
//  460 	 case 0: BlocklEN -= 1;if(BlocklEN<0)BlocklEN=0;break;
??chushihua_37:
        LDR.W    R0,??chushihua_0
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_0
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_46
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_0
        STR      R0,[R1, #+0]
??chushihua_46:
        B.N      ??chushihua_36
//  461 	 case 1: BlockrEN -= 1;if(BlockrEN<0)BlockrEN=0;break;
??chushihua_39:
        LDR.W    R0,??chushihua_0+0x4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x4
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_47
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_0+0x4
        STR      R0,[R1, #+0]
??chushihua_47:
        B.N      ??chushihua_36
//  462 	 case 2: ElbowbendrEN -= 1;if(ElbowbendrEN<0)ElbowbendrEN=0;break;
??chushihua_38:
        LDR.W    R0,??chushihua_0+0x8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x8
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_48
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_0+0x8
        STR      R0,[R1, #+0]
??chushihua_48:
        B.N      ??chushihua_36
//  463 	 case 3: ElbowbendlEN -= 1;if(ElbowbendlEN<0)ElbowbendlEN=0;break;
??chushihua_41:
        LDR.W    R0,??chushihua_0+0xC
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0xC
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_49
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_0+0xC
        STR      R0,[R1, #+0]
??chushihua_49:
        B.N      ??chushihua_36
//  464 	 case 4: RampEN -= 1;if(RampEN<0)RampEN=0;break;
??chushihua_40:
        LDR.W    R0,??chushihua_0+0x10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x10
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_50
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_0+0x10
        STR      R0,[R1, #+0]
??chushihua_50:
        B.N      ??chushihua_36
//  465 	 case 5: ProtectEN -= 1;if(ProtectEN<0)ProtectEN=0;break;
??chushihua_43:
        LDR.W    R0,??chushihua_0+0x14
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x14
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_51
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_0+0x14
        STR      R0,[R1, #+0]
??chushihua_51:
        B.N      ??chushihua_36
//  466 	 case 6: SteerEssEN -= 1;if(SteerEssEN<0)SteerEssEN=0;break;
??chushihua_42:
        LDR.W    R0,??chushihua_0+0x18
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x18
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x18
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_52
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_0+0x18
        STR      R0,[R1, #+0]
??chushihua_52:
        B.N      ??chushihua_36
//  467 	 case 7: SpeedextraEN -= 1;if(SpeedextraEN<0)SpeedextraEN=0;break;
??chushihua_44:
        LDR.W    R0,??chushihua_0+0x1C
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_0+0x1C
        STR      R0,[R1, #+0]
        LDR.W    R0,??chushihua_0+0x1C
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_53
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_0+0x1C
        STR      R0,[R1, #+0]
??chushihua_53:
        B.N      ??chushihua_36
//  468 	 default:  break;
//  469 	}
//  470    }
//  471    LCD_P6x8Str(0,0,"BlocklEN:   ");
??chushihua_45:
??chushihua_36:
        LDR.W    R2,??chushihua_54
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  472    LCD_P6x8Str(0,1,"BlockrEN:   ");
        LDR.W    R2,??chushihua_54+0x4
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  473    LCD_P6x8Str(0,2,"ElbobedrEN: ");
        LDR.W    R2,??chushihua_54+0x8
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  474    LCD_P6x8Str(0,3,"ElbobedlEN: ");
        LDR.W    R2,??chushihua_54+0xC
        MOVS     R1,#+3
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  475    LCD_P6x8Str(0,4,"RampEN:     ");
        LDR.W    R2,??chushihua_54+0x10
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  476    LCD_P6x8Str(0,5,"ProtectEN:  ");
        LDR.W    R2,??chushihua_54+0x14
        MOVS     R1,#+5
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  477    LCD_P6x8Str(0,6,"SteerEssEN: ");
        LDR.W    R2,??chushihua_54+0x18
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  478    LCD_P6x8Str(0,7,"SpedextrEN: ");
        LDR.W    R2,??chushihua_55
        MOVS     R1,#+7
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  479    sprintf(str,"%6d",BlocklEN);
        LDR.W    R0,??chushihua_0
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_56  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  480    LCD_P6x8Str(90,0,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+0
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  481    sprintf(str,"%6d",BlockrEN);
        LDR.W    R0,??chushihua_0+0x4
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_56  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  482    LCD_P6x8Str(90,1,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+1
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  483    sprintf(str,"%6d",ElbowbendrEN);
        LDR.W    R0,??chushihua_0+0x8
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_56  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  484    LCD_P6x8Str(90,2,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+2
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  485    sprintf(str,"%6d",ElbowbendlEN);
        LDR.W    R0,??chushihua_0+0xC
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_56  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  486    LCD_P6x8Str(90,3,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+3
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  487    sprintf(str,"%6d",RampEN);
        LDR.W    R0,??chushihua_0+0x10
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_56  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  488    LCD_P6x8Str(90,4,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+4
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  489    sprintf(str,"%6d",ProtectEN);
        LDR.W    R0,??chushihua_0+0x14
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_56  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  490    LCD_P6x8Str(90,5,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+5
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  491    sprintf(str,"%6d",SteerEssEN);
        LDR.W    R0,??chushihua_0+0x18
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_56  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  492    LCD_P6x8Str(90,6,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+6
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  493    sprintf(str,"%6d",SpeedextraEN);
        LDR.W    R0,??chushihua_0+0x1C
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_56  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  494    LCD_P6x8Str(90,7,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+7
        MOVS     R0,#+90
        BL       LCD_P6x8Str
        B.N      ??chushihua_57
//  495   }//end 1
//  496   else                            //第二页
//  497   {
//  498    switch(LCD_Flag)
??chushihua_6:
        LDR.W    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+8
        BEQ.N    ??chushihua_58
        BCC.W    ??chushihua_59
        CMP      R0,#+10
        BEQ.N    ??chushihua_60
        BCC.N    ??chushihua_61
        CMP      R0,#+12
        BEQ.W    ??chushihua_62
        BCC.W    ??chushihua_63
        CMP      R0,#+14
        BEQ.W    ??chushihua_64
        BCC.W    ??chushihua_65
        CMP      R0,#+15
        BEQ.W    ??chushihua_66
        B.N      ??chushihua_59
//  499    {
//  500 	case 8:{LCD_P6x8Str(70,0,"=");
??chushihua_58:
        ADR.N    R2,??chushihua_56+0x4  ;; "="
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  501 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  502 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  503 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  504 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  505 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  506 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  507 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  508 	break;}
        B.N      ??chushihua_67
//  509 	case 9:{LCD_P6x8Str(70,0," ");
??chushihua_61:
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  510 	LCD_P6x8Str(70,1,"=");
        ADR.N    R2,??chushihua_56+0x4  ;; "="
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  511 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  512 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  513 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  514 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  515 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  516 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  517 	break;}
        B.N      ??chushihua_67
//  518 	case 10:{LCD_P6x8Str(70,0," ");
??chushihua_60:
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  519 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  520 	LCD_P6x8Str(70,2,"=");
        ADR.N    R2,??chushihua_56+0x4  ;; "="
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  521 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  522 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  523 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  524 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  525 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  526 	break;}
        B.N      ??chushihua_67
//  527 	case 11:{LCD_P6x8Str(70,0," ");
??chushihua_63:
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  528 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  529 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  530 	LCD_P6x8Str(70,3,"=");
        ADR.N    R2,??chushihua_56+0x4  ;; "="
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  531 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  532 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  533 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  534 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  535 	break;}
        B.N      ??chushihua_67
//  536 	case 12:{LCD_P6x8Str(70,0," ");
??chushihua_62:
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  537 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  538 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  539 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  540 	LCD_P6x8Str(70,4,"=");
        ADR.N    R2,??chushihua_56+0x4  ;; "="
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  541 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  542 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  543 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  544 	break;}
        B.N      ??chushihua_67
//  545 	case 13:{LCD_P6x8Str(70,0," ");
??chushihua_65:
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  546 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  547 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  548 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  549 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  550 	LCD_P6x8Str(70,5,"=");
        ADR.N    R2,??chushihua_56+0x4  ;; "="
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  551 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  552 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  553 	break;}
        B.N      ??chushihua_67
//  554 	case 14:{LCD_P6x8Str(70,0," ");
??chushihua_64:
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  555 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  556 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  557 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  558 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  559 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  560 	LCD_P6x8Str(70,6,"=");
        ADR.N    R2,??chushihua_56+0x4  ;; "="
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  561 	LCD_P6x8Str(70,7," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  562 	break;}
        B.N      ??chushihua_67
//  563 	case 15:{LCD_P6x8Str(70,0," ");
??chushihua_66:
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  564 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  565 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  566 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  567 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  568 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  569 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_56+0x8  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  570 	LCD_P6x8Str(70,7,"=");
        ADR.N    R2,??chushihua_56+0x4  ;; "="
        MOVS     R1,#+7
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  571 	break;}
        B.N      ??chushihua_67
        Nop      
        DATA
??chushihua_56:
        DC8      "%6d"
        DC8      "=",0x0,0x0
        DC8      " ",0x0,0x0
        THUMB
//  572 	default:  break;       
//  573    }
//  574    if(!GPIO_GetBit(PORT_A,12))
??chushihua_59:
??chushihua_67:
        MOVS     R1,#+12
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_68
//  575    {
//  576 	Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  577 	switch(LCD_Flag)
        LDR.N    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+8
        BEQ.N    ??chushihua_69
        BCC.N    ??chushihua_70
        CMP      R0,#+10
        BEQ.N    ??chushihua_71
        BCC.N    ??chushihua_72
        CMP      R0,#+12
        BEQ.N    ??chushihua_73
        BCC.N    ??chushihua_74
        CMP      R0,#+13
        BEQ.N    ??chushihua_75
        B.N      ??chushihua_70
//  578 	{
//  579 	 case 8: SinglineEN += 1; if(SinglineEN)SinglineEN=1;    break;
??chushihua_69:
        LDR.N    R0,??chushihua_0+0x20
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x20
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x20
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_76
        MOVS     R0,#+1
        LDR.N    R1,??chushihua_0+0x20
        STR      R0,[R1, #+0]
??chushihua_76:
        B.N      ??chushihua_68
//  580 	 case 9: OledShowEN += 1;if(OledShowEN)OledShowEN=1;  break;
??chushihua_72:
        LDR.N    R0,??chushihua_0+0x24
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x24
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x24
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_77
        MOVS     R0,#+1
        LDR.N    R1,??chushihua_0+0x24
        STR      R0,[R1, #+0]
??chushihua_77:
        B.N      ??chushihua_68
//  581 	 case 10: BmaEN += 1; if(BmaEN)BmaEN=1;   break;
??chushihua_71:
        LDR.N    R0,??chushihua_0+0x28
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x28
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x28
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_78
        MOVS     R0,#+1
        LDR.N    R1,??chushihua_0+0x28
        STR      R0,[R1, #+0]
??chushihua_78:
        B.N      ??chushihua_68
//  582 	 case 11: WhiteEN+= 1; if(WhiteEN)WhiteEN=1;   break;
??chushihua_74:
        LDR.N    R0,??chushihua_0+0x2C
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x2C
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x2C
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_79
        MOVS     R0,#+1
        LDR.N    R1,??chushihua_0+0x2C
        STR      R0,[R1, #+0]
??chushihua_79:
        B.N      ??chushihua_68
//  583 	 case 12: LighthouseEN+=1;  if(LighthouseEN)LighthouseEN=1;   break;
??chushihua_73:
        LDR.N    R0,??chushihua_0+0x30
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x30
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x30
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_80
        MOVS     R0,#+1
        LDR.N    R1,??chushihua_0+0x30
        STR      R0,[R1, #+0]
??chushihua_80:
        B.N      ??chushihua_68
//  584  	 case 13: BlackflagEN+=1;if(BlackflagEN)BlackflagEN=1;break;
??chushihua_75:
        LDR.N    R0,??chushihua_0+0x34
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x34
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x34
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_81
        MOVS     R0,#+1
        LDR.N    R1,??chushihua_0+0x34
        STR      R0,[R1, #+0]
??chushihua_81:
        B.N      ??chushihua_68
//  585 //	 case 14: break;
//  586 //	 case 15:  break;
//  587 	 default:  break;
//  588 	}
//  589    }
//  590    if(!GPIO_GetBit(PORT_A,14))
??chushihua_70:
??chushihua_68:
        MOVS     R1,#+14
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.W    ??chushihua_82
//  591    {
//  592 	Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  593 	switch(LCD_Flag)
        LDR.N    R0,??chushihua_0+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+8
        BEQ.N    ??chushihua_83
        BCC.N    ??chushihua_84
        CMP      R0,#+10
        BEQ.N    ??chushihua_85
        BCC.N    ??chushihua_86
        CMP      R0,#+12
        BEQ.N    ??chushihua_87
        BCC.N    ??chushihua_88
        CMP      R0,#+13
        BEQ.N    ??chushihua_89
        B.N      ??chushihua_84
//  594 	{
//  595 	 case 8: SinglineEN -= 1;  if(SinglineEN<0)SinglineEN=0;   break;
??chushihua_83:
        LDR.N    R0,??chushihua_0+0x20
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x20
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x20
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_90
        MOVS     R0,#+0
        LDR.N    R1,??chushihua_0+0x20
        STR      R0,[R1, #+0]
??chushihua_90:
        B.N      ??chushihua_82
//  596 	 case 9: OledShowEN -= 1; if(OledShowEN<0)OledShowEN=0; break;
??chushihua_86:
        LDR.N    R0,??chushihua_0+0x24
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x24
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x24
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_91
        MOVS     R0,#+0
        LDR.N    R1,??chushihua_0+0x24
        STR      R0,[R1, #+0]
??chushihua_91:
        B.N      ??chushihua_82
//  597 	 case 10:BmaEN -= 1; if(BmaEN<0)BmaEN=0;break;
??chushihua_85:
        LDR.N    R0,??chushihua_0+0x28
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x28
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x28
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_92
        MOVS     R0,#+0
        LDR.N    R1,??chushihua_0+0x28
        STR      R0,[R1, #+0]
??chushihua_92:
        B.N      ??chushihua_82
//  598  	 case 11:WhiteEN-= 1; if(WhiteEN<0)WhiteEN=0;   break;
??chushihua_88:
        LDR.N    R0,??chushihua_0+0x2C
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x2C
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x2C
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_93
        MOVS     R0,#+0
        LDR.N    R1,??chushihua_0+0x2C
        STR      R0,[R1, #+0]
??chushihua_93:
        B.N      ??chushihua_82
//  599 	 case 12:LighthouseEN-= 1;if(LighthouseEN<0)LighthouseEN=0; break;
??chushihua_87:
        LDR.N    R0,??chushihua_0+0x30
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x30
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x30
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_94
        MOVS     R0,#+0
        LDR.N    R1,??chushihua_0+0x30
        STR      R0,[R1, #+0]
??chushihua_94:
        B.N      ??chushihua_82
//  600 	 case 13:BlackflagEN-=1;if(BlackflagEN<0)BlackflagEN=0;break;
??chushihua_89:
        LDR.N    R0,??chushihua_0+0x34
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??chushihua_0+0x34
        STR      R0,[R1, #+0]
        LDR.N    R0,??chushihua_0+0x34
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_95
        MOVS     R0,#+0
        LDR.N    R1,??chushihua_0+0x34
        STR      R0,[R1, #+0]
??chushihua_95:
        B.N      ??chushihua_82
        Nop      
        DATA
??chushihua_0:
        DC32     BlocklEN
        DC32     BlockrEN
        DC32     ElbowbendrEN
        DC32     ElbowbendlEN
        DC32     RampEN
        DC32     ProtectEN
        DC32     SteerEssEN
        DC32     SpeedextraEN
        DC32     SinglineEN
        DC32     OledShowEN
        DC32     BmaEN
        DC32     WhiteEN
        DC32     LighthouseEN
        DC32     BlackflagEN
        DC32     LCD_Flag
        THUMB
//  601 //	 case 14: break;
//  602 //	 case 15:  break;
//  603 	 default:  break;
//  604 	}
//  605    }
//  606    LCD_P6x8Str(0,0,"SinglineEN: ");
??chushihua_84:
??chushihua_82:
        LDR.W    R2,??chushihua_96+0x4
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  607    LCD_P6x8Str(0,1,"OledShowEN: ");
        LDR.W    R2,??chushihua_96+0x8
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  608    LCD_P6x8Str(0,2,"BmaEN:      ");
        LDR.W    R2,??chushihua_97
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  609    LCD_P6x8Str(0,3,"WhiteEN:    ");
        LDR.W    R2,??chushihua_97+0x4
        MOVS     R1,#+3
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  610    LCD_P6x8Str(0,4,"LighhouseEN:");
        LDR.W    R2,??chushihua_97+0x8
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  611    LCD_P6x8Str(0,5,"BlackflagEN:");
        LDR.W    R2,??chushihua_97+0xC
        MOVS     R1,#+5
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  612    LCD_P6x8Str(0,6,"            ");
        LDR.W    R2,??chushihua_97+0x10
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  613    LCD_P6x8Str(0,7,"            ");
        LDR.W    R2,??chushihua_97+0x10
        MOVS     R1,#+7
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  614    sprintf(str,"%6d",SinglineEN);//将SinglineEN转换到str中
        LDR.W    R0,??chushihua_97+0x14
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_98  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  615    LCD_P6x8Str(90,0,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+0
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  616    sprintf(str,"%6d",OledShowEN);
        LDR.W    R0,??chushihua_97+0x18
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_98  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  617    LCD_P6x8Str(90,1,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+1
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  618    sprintf(str,"%6d",BmaEN);
        LDR.W    R0,??chushihua_97+0x1C
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_98  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  619    LCD_P6x8Str(90,2,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+2
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  620    sprintf(str,"%6d",WhiteEN);
        LDR.W    R0,??chushihua_97+0x20
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_98  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  621    LCD_P6x8Str(90,3,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+3
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  622    sprintf(str,"%6d",LighthouseEN);
        LDR.W    R0,??chushihua_97+0x24
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_98  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  623    LCD_P6x8Str(90,4,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+4
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  624    sprintf(str,"%6d",BlackflagEN);
        LDR.W    R0,??chushihua_97+0x30
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_98  ;; "%6d"
        LDR.W    R0,??chushihua_55+0x4
        BL       sprintf
//  625    LCD_P6x8Str(90,5,str);
        LDR.W    R2,??chushihua_55+0x4
        MOVS     R1,#+5
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  626    LCD_P6x8Str(90,6,"       ");
        LDR.W    R2,??chushihua_97+0x34
        MOVS     R1,#+6
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  627    LCD_P6x8Str(90,7,"       ");
        LDR.W    R2,??chushihua_97+0x34
        MOVS     R1,#+7
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  628   }//end 2
//  629     if(!GPIO_GetBit(PORT_A,16))
??chushihua_57:
        MOVS     R1,#+16
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.W    ??chushihua_1
//  630   {
//  631    Delay_ccd(180);
        MOVS     R0,#+180
        BL       Delay_ccd
//  632    break;
//  633   }
//  634   
//  635   
//  636  }
//  637 
//  638 
//  639 
//  640 
//  641 
//  642 
//  643 
//  644 
//  645 
//  646 
//  647 //////////////////////////////////////////////////////
//  648 ///////////////////////////////////////////////////// 
//  649 
//  650  
//  651  
//  652  
//  653  LCD_Flag = 0;
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_97+0x38
        STR      R0,[R1, #+0]
//  654  LCD_CLS();
        BL       LCD_CLS
//  655  
//  656  while(1)                                 //调参
//  657  {
//  658   if(!GPIO_GetBit(PORT_B,17))       //上
??chushihua_99:
        MOVS     R1,#+17
        MOVS     R0,#+1
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_100
//  659   {
//  660    LCD_Flag++;
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_97+0x38
        STR      R0,[R1, #+0]
//  661    Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  662   }
//  663   if(!GPIO_GetBit(PORT_A,15))       //下
??chushihua_100:
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_101
//  664   {
//  665    LCD_Flag--;
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_97+0x38
        STR      R0,[R1, #+0]
//  666    Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  667   }
//  668   if(LCD_Flag > 20)
??chushihua_101:
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+21
        BLT.N    ??chushihua_102
//  669   {
//  670    LCD_Flag = 0;
        MOVS     R0,#+0
        LDR.W    R1,??chushihua_97+0x38
        STR      R0,[R1, #+0]
//  671   }
//  672   if(LCD_Flag < 0)
??chushihua_102:
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BPL.N    ??chushihua_103
//  673   {
//  674    LCD_Flag = 20;
        MOVS     R0,#+20
        LDR.W    R1,??chushihua_97+0x38
        STR      R0,[R1, #+0]
//  675   }
//  676   if(LCD_Flag < 7)                //第一页
??chushihua_103:
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+7
        BGE.W    ??chushihua_104
//  677   {
//  678    switch(LCD_Flag)
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_105
        CMP      R0,#+2
        BEQ.N    ??chushihua_106
        BCC.N    ??chushihua_107
        CMP      R0,#+4
        BEQ.W    ??chushihua_108
        BCC.N    ??chushihua_109
        CMP      R0,#+6
        BEQ.W    ??chushihua_110
        BCC.W    ??chushihua_111
        B.N      ??chushihua_112
//  679    {
//  680 	case 0:{LCD_P6x8Str(70,0,"=");
??chushihua_105:
        ADR.N    R2,??chushihua_113  ;; "="
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  681 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  682 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  683 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  684 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  685 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  686 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  687 	break;}
        B.N      ??chushihua_114
//  688 	case 1:{LCD_P6x8Str(70,0," ");
??chushihua_107:
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  689 	LCD_P6x8Str(70,1,"=");
        ADR.N    R2,??chushihua_113  ;; "="
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  690 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  691 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  692 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  693 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  694 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  695 	break;}
        B.N      ??chushihua_114
//  696 	case 2:{LCD_P6x8Str(70,0," ");
??chushihua_106:
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  697 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  698 	LCD_P6x8Str(70,2,"=");
        ADR.N    R2,??chushihua_113  ;; "="
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  699 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  700 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  701 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  702 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  703 	break;}
        B.N      ??chushihua_114
//  704 	case 3:{LCD_P6x8Str(70,0," ");
??chushihua_109:
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  705 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  706 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  707 	LCD_P6x8Str(70,3,"=");
        ADR.N    R2,??chushihua_113  ;; "="
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  708 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  709 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  710 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  711 	break;}
        B.N      ??chushihua_114
//  712 	case 4:{LCD_P6x8Str(70,0," ");
??chushihua_108:
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  713 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  714 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  715 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  716 	LCD_P6x8Str(70,4,"=");
        ADR.N    R2,??chushihua_113  ;; "="
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  717 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  718 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  719 	break;}
        B.N      ??chushihua_114
//  720 	case 5:{LCD_P6x8Str(70,0," ");
??chushihua_111:
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  721 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  722 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  723 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  724 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  725 	LCD_P6x8Str(70,5,"=");
        ADR.N    R2,??chushihua_113  ;; "="
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  726 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  727 	break;}
        B.N      ??chushihua_114
//  728 	case 6:{LCD_P6x8Str(70,0," ");
??chushihua_110:
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  729 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  730 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  731 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  732 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  733 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_113+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  734 	LCD_P6x8Str(70,6,"=");
        ADR.N    R2,??chushihua_113  ;; "="
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  735 	break;}
        B.N      ??chushihua_114
        DATA
??chushihua_98:
        DC8      "%6d"
        THUMB
//  736 	default:  break;
//  737    }
//  738    if(!GPIO_GetBit(PORT_A,12))
??chushihua_112:
??chushihua_114:
        MOVS     R1,#+12
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_115
//  739    {
//  740 	Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  741 	switch(LCD_Flag)
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_116
        CMP      R0,#+2
        BEQ.N    ??chushihua_117
        BCC.N    ??chushihua_118
        CMP      R0,#+4
        BEQ.N    ??chushihua_119
        BCC.N    ??chushihua_120
        CMP      R0,#+6
        BEQ.N    ??chushihua_121
        BCC.N    ??chushihua_122
        B.N      ??chushihua_123
//  742 	{
//  743 	 case 0: SpeedWant += 1;break;
??chushihua_116:
        LDR.W    R0,??chushihua_124
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_124
        STR      R0,[R1, #+0]
        B.N      ??chushihua_115
//  744 	 case 1: Speed_Kp += 10;break;
??chushihua_118:
        LDR.W    R0,??chushihua_124+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??chushihua_124+0x4
        STR      R0,[R1, #+0]
        B.N      ??chushihua_115
//  745 	 case 2: Speed_Ki += 1;break;
??chushihua_117:
        LDR.W    R0,??chushihua_124+0x8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??chushihua_124+0x8
        STR      R0,[R1, #+0]
        B.N      ??chushihua_115
//  746 	 case 3: Speed_Kd += 2;break;
??chushihua_120:
        LDR.W    R0,??chushihua_124+0x10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+2
        LDR.W    R1,??chushihua_124+0x10
        STR      R0,[R1, #+0]
        B.N      ??chushihua_115
//  747 	 case 4: D_P += 10;break;
??chushihua_119:
        LDR.W    R0,??chushihua_124+0x14
        LDR      R0,[R0, #+0]
        LDR.W    R1,??chushihua_124+0x18  ;; 0x41200000
        BL       __aeabi_fadd
        LDR.W    R1,??chushihua_124+0x14
        STR      R0,[R1, #+0]
        B.N      ??chushihua_115
//  748 	 case 5: D_I += 2;break;
??chushihua_122:
        LDR.W    R0,??chushihua_124+0x1C
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1073741824
        BL       __aeabi_fadd
        LDR.W    R1,??chushihua_124+0x1C
        STR      R0,[R1, #+0]
        B.N      ??chushihua_115
//  749 	 case 6: D_D += 5;break;
??chushihua_121:
        LDR.W    R0,??chushihua_124+0x20
        LDR      R0,[R0, #+0]
        LDR.W    R1,??chushihua_124+0x24  ;; 0x40a00000
        BL       __aeabi_fadd
        LDR.W    R1,??chushihua_124+0x20
        STR      R0,[R1, #+0]
        B.N      ??chushihua_115
//  750 	 default:  break;
//  751 	}
//  752    }
//  753    if(!GPIO_GetBit(PORT_A,14))
??chushihua_123:
??chushihua_115:
        MOVS     R1,#+14
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_125
//  754    {
//  755 	Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  756 	switch(LCD_Flag)
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_126
        CMP      R0,#+2
        BEQ.N    ??chushihua_127
        BCC.N    ??chushihua_128
        CMP      R0,#+4
        BEQ.N    ??chushihua_129
        BCC.N    ??chushihua_130
        CMP      R0,#+6
        BEQ.N    ??chushihua_131
        BCC.N    ??chushihua_132
        B.N      ??chushihua_133
//  757 	{
//  758 	 case 0: SpeedWant -= 1;break;
??chushihua_126:
        LDR.W    R0,??chushihua_124
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_124
        STR      R0,[R1, #+0]
        B.N      ??chushihua_125
//  759 	 case 1: Speed_Kp -= 10;break;
??chushihua_128:
        LDR.W    R0,??chushihua_124+0x4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.W    R1,??chushihua_124+0x4
        STR      R0,[R1, #+0]
        B.N      ??chushihua_125
//  760 	 case 2: Speed_Ki -= 1;break;
??chushihua_127:
        LDR.W    R0,??chushihua_124+0x8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??chushihua_124+0x8
        STR      R0,[R1, #+0]
        B.N      ??chushihua_125
//  761 	 case 3: Speed_Kd -= 2;break;
??chushihua_130:
        LDR.W    R0,??chushihua_124+0x10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+2
        LDR.W    R1,??chushihua_124+0x10
        STR      R0,[R1, #+0]
        B.N      ??chushihua_125
//  762 	 case 4: D_P -= 10;break;
??chushihua_129:
        LDR.W    R0,??chushihua_124+0x14
        LDR      R0,[R0, #+0]
        LDR.W    R1,??chushihua_124+0x28  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR.W    R1,??chushihua_124+0x14
        STR      R0,[R1, #+0]
        B.N      ??chushihua_125
//  763 	 case 5: D_I -= 2;break;
??chushihua_132:
        LDR.W    R0,??chushihua_124+0x1C
        LDR      R0,[R0, #+0]
        MOVS     R1,#-1073741824
        BL       __aeabi_fadd
        LDR.W    R1,??chushihua_124+0x1C
        STR      R0,[R1, #+0]
        B.N      ??chushihua_125
        Nop      
        DATA
??chushihua_113:
        DC8      "=",0x0,0x0
        DC8      " ",0x0,0x0
        THUMB
//  764 	 case 6: D_D -= 5;break;
??chushihua_131:
        LDR.W    R0,??chushihua_124+0x20
        LDR      R0,[R0, #+0]
        LDR.W    R1,??chushihua_124+0x2C  ;; 0xc0a00000
        BL       __aeabi_fadd
        LDR.W    R1,??chushihua_124+0x20
        STR      R0,[R1, #+0]
        B.N      ??chushihua_125
//  765 	 default:  break;
//  766 	}
//  767    }
//  768    
//  769    LCD_P6x8Str(0,0,"SpeedWant:  ");
??chushihua_133:
??chushihua_125:
        LDR.W    R2,??chushihua_124+0x30
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  770    LCD_P6x8Str(0,1,"Speed_Kp:   ");
        LDR.W    R2,??chushihua_124+0x34
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  771    LCD_P6x8Str(0,2,"Speed_Ki:   ");
        LDR.W    R2,??chushihua_124+0x38
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  772    LCD_P6x8Str(0,3,"Speed_Kd:   ");
        LDR.W    R2,??chushihua_124+0x3C
        MOVS     R1,#+3
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  773    LCD_P6x8Str(0,4,"D_P:        ");
        LDR.W    R2,??chushihua_124+0x40
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  774    LCD_P6x8Str(0,5,"D_I:        ");
        LDR.W    R2,??chushihua_124+0x44
        MOVS     R1,#+5
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  775    LCD_P6x8Str(0,6,"D_D:        ");
        LDR.W    R2,??chushihua_124+0x48
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  776    sprintf(str,"%6d",(long)SpeedWant);
        LDR.W    R0,??chushihua_124
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_134  ;; "%6d"
        LDR.N    R0,??chushihua_55+0x4
        BL       sprintf
//  777    LCD_P6x8Str(90,0,str);
        LDR.N    R2,??chushihua_55+0x4
        MOVS     R1,#+0
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  778    sprintf(str,"%6d",(long)Speed_Kp);
        LDR.W    R0,??chushihua_124+0x4
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_134  ;; "%6d"
        LDR.N    R0,??chushihua_55+0x4
        BL       sprintf
//  779    LCD_P6x8Str(90,1,str);
        LDR.N    R2,??chushihua_55+0x4
        MOVS     R1,#+1
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  780    sprintf(str,"%6d",(long)Speed_Ki);
        LDR.W    R0,??chushihua_124+0x8
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_134  ;; "%6d"
        LDR.N    R0,??chushihua_55+0x4
        BL       sprintf
//  781    LCD_P6x8Str(90,2,str);
        LDR.N    R2,??chushihua_55+0x4
        MOVS     R1,#+2
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  782    sprintf(str,"%6d",(long)Speed_Kd);
        LDR.W    R0,??chushihua_124+0x10
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_134  ;; "%6d"
        LDR.N    R0,??chushihua_55+0x4
        BL       sprintf
//  783    LCD_P6x8Str(90,3,str);
        LDR.N    R2,??chushihua_55+0x4
        MOVS     R1,#+3
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  784    sprintf(str,"%6.0f",(float)D_P);
        LDR.W    R0,??chushihua_124+0x14
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR.W    R1,??chushihua_124+0x4C
        LDR.N    R0,??chushihua_55+0x4
        BL       sprintf
//  785    LCD_P6x8Str(90,4,str);
        LDR.N    R2,??chushihua_55+0x4
        MOVS     R1,#+4
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  786    sprintf(str,"%6.0f",(float)D_I);
        LDR.W    R0,??chushihua_124+0x1C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR.W    R1,??chushihua_124+0x4C
        LDR.N    R0,??chushihua_55+0x4
        BL       sprintf
//  787    LCD_P6x8Str(90,5,str);
        LDR.N    R2,??chushihua_55+0x4
        MOVS     R1,#+5
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  788    sprintf(str,"%6.0f",(float)D_D);
        LDR.W    R0,??chushihua_124+0x20
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR.W    R1,??chushihua_124+0x4C
        LDR.N    R0,??chushihua_55+0x4
        BL       sprintf
//  789    LCD_P6x8Str(90,6,str);
        LDR.N    R2,??chushihua_55+0x4
        MOVS     R1,#+6
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  790    sprintf(str,"%6d",SpeedWant);
        LDR.W    R0,??chushihua_124
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_134  ;; "%6d"
        LDR.N    R0,??chushihua_55+0x4
        BL       sprintf
//  791    LCD_P6x8Str(90,7,str);
        LDR.N    R2,??chushihua_55+0x4
        MOVS     R1,#+7
        MOVS     R0,#+90
        BL       LCD_P6x8Str
        B.W      ??chushihua_135
        DATA
??chushihua_54:
        DC32     ?_2
        DC32     ?_3
        DC32     ?_4
        DC32     ?_5
        DC32     ?_6
        DC32     ?_7
        DC32     ?_8
        THUMB
//  792   }//end 1
//  793   else if(LCD_Flag < 14)                            //第二页
??chushihua_104:
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+14
        BGE.W    ??chushihua_136
//  794   {
//  795    switch(LCD_Flag)
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+7
        BEQ.N    ??chushihua_137
        BCC.W    ??chushihua_138
        CMP      R0,#+9
        BEQ.N    ??chushihua_139
        BCC.N    ??chushihua_140
        CMP      R0,#+11
        BEQ.W    ??chushihua_141
        BCC.N    ??chushihua_142
        CMP      R0,#+13
        BEQ.W    ??chushihua_143
        BCC.W    ??chushihua_144
        B.N      ??chushihua_138
//  796    {
//  797 	case 7:{LCD_P6x8Str(70,0,"=");
??chushihua_137:
        ADR.N    R2,??chushihua_145  ;; "="
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  798 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  799 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  800 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  801 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  802 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  803 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  804 	break;}
        B.N      ??chushihua_146
//  805 	case 8:{LCD_P6x8Str(70,0," ");
??chushihua_140:
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  806 	LCD_P6x8Str(70,1,"=");
        ADR.N    R2,??chushihua_145  ;; "="
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  807 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  808 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  809 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  810 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  811 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  812 	break;}
        B.N      ??chushihua_146
//  813 	case 9:{LCD_P6x8Str(70,0," ");
??chushihua_139:
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  814 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  815 	LCD_P6x8Str(70,2,"=");
        ADR.N    R2,??chushihua_145  ;; "="
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  816 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  817 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  818 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  819 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  820 	break;}
        B.N      ??chushihua_146
//  821 	case 10:{LCD_P6x8Str(70,0," ");
??chushihua_142:
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  822 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  823 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  824 	LCD_P6x8Str(70,3,"=");
        ADR.N    R2,??chushihua_145  ;; "="
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  825 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  826 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  827 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  828 	break;}
        B.N      ??chushihua_146
//  829 	case 11:{LCD_P6x8Str(70,0," ");
??chushihua_141:
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  830 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  831 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  832 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  833 	LCD_P6x8Str(70,4,"=");
        ADR.N    R2,??chushihua_145  ;; "="
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  834 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  835 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  836 	break;}
        B.N      ??chushihua_146
//  837 	case 12:{LCD_P6x8Str(70,0," ");
??chushihua_144:
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  838 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  839 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  840 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  841 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  842 	LCD_P6x8Str(70,5,"=");
        ADR.N    R2,??chushihua_145  ;; "="
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  843 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  844 	break;}
        B.N      ??chushihua_146
        DATA
??chushihua_55:
        DC32     ?_9
        DC32     `str`
        THUMB
//  845 	case 13:{LCD_P6x8Str(70,0," ");
??chushihua_143:
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  846 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  847 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  848 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  849 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  850 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_145+0x4  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  851 	LCD_P6x8Str(70,6,"=");
        ADR.N    R2,??chushihua_145  ;; "="
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  852 	break;}
        B.N      ??chushihua_146
        DATA
??chushihua_134:
        DC8      "%6d"
        THUMB
//  853 	default:  break;       
//  854    }
//  855    if(!GPIO_GetBit(PORT_A,12))
??chushihua_138:
??chushihua_146:
        MOVS     R1,#+12
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_147
//  856    {
//  857 	Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  858 	switch(LCD_Flag)
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+7
        BEQ.N    ??chushihua_148
        BCC.N    ??chushihua_149
        CMP      R0,#+9
        BEQ.N    ??chushihua_150
        BCC.N    ??chushihua_151
        CMP      R0,#+11
        BEQ.N    ??chushihua_152
        BCC.N    ??chushihua_153
        CMP      R0,#+13
        BEQ.N    ??chushihua_154
        BCC.N    ??chushihua_155
        B.N      ??chushihua_149
//  859 	{
//  860 	 case 7: Midline += 1;     break;
??chushihua_148:
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable8
        STR      R0,[R1, #+0]
        B.N      ??chushihua_147
//  861 	 case 8: angleoffset += 1;  break;
??chushihua_151:
        LDR.W    R0,??DataTable8_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1065353216
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable8_1
        STR      R0,[R1, #+0]
        B.N      ??chushihua_147
//  862 	 case 9: Angle_Kp += 20;    break;
??chushihua_150:
        LDR.W    R0,??DataTable8_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+20
        LDR.W    R1,??DataTable8_2
        STR      R0,[R1, #+0]
        B.N      ??chushihua_147
//  863 	 case 10: Angle_Kd += 1;     break;
??chushihua_153:
        LDR.W    R0,??DataTable8_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable8_3
        STR      R0,[R1, #+0]
        B.N      ??chushihua_147
//  864 	 case 11: YZ += 1;        break;
??chushihua_152:
        LDR.W    R0,??DataTable8_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable8_4
        STR      R0,[R1, #+0]
        B.N      ??chushihua_147
//  865 	 case 12: weight_Min += 1;       break;
??chushihua_155:
        LDR.W    R0,??DataTable8_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable8_5
        STR      R0,[R1, #+0]
        B.N      ??chushihua_147
//  866 	 case 13: SpecialPWM += 100; break;
??chushihua_154:
        LDR.W    R0,??DataTable8_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+100
        LDR.W    R1,??DataTable8_6
        STR      R0,[R1, #+0]
        B.N      ??chushihua_147
//  867 	 default:  break;
//  868 	}
//  869    }
//  870    if(!GPIO_GetBit(PORT_A,14))
??chushihua_149:
??chushihua_147:
        MOVS     R1,#+14
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_156
//  871    {
//  872 	Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  873 	switch(LCD_Flag)
        LDR.W    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+7
        BEQ.N    ??chushihua_157
        BCC.N    ??chushihua_158
        CMP      R0,#+9
        BEQ.N    ??chushihua_159
        BCC.N    ??chushihua_160
        CMP      R0,#+11
        BEQ.N    ??chushihua_161
        BCC.N    ??chushihua_162
        CMP      R0,#+13
        BEQ.N    ??chushihua_163
        BCC.N    ??chushihua_164
        B.N      ??chushihua_158
//  874 	{
//  875 	 case 7: Midline -= 1;     break;
??chushihua_157:
        LDR.W    R0,??DataTable8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable8
        STR      R0,[R1, #+0]
        B.N      ??chushihua_156
//  876 	 case 8: angleoffset -=1;  break;
??chushihua_160:
        LDR.W    R0,??DataTable8_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable8_7  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable8_1
        STR      R0,[R1, #+0]
        B.N      ??chushihua_156
//  877 	 case 9: Angle_Kp -= 20;    break;
??chushihua_159:
        LDR.W    R0,??DataTable8_2
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+20
        LDR.W    R1,??DataTable8_2
        STR      R0,[R1, #+0]
        B.N      ??chushihua_156
//  878 	 case 10: Angle_Kd -= 1;     break;
??chushihua_162:
        LDR.W    R0,??DataTable8_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable8_3
        STR      R0,[R1, #+0]
        B.N      ??chushihua_156
//  879 	 case 11: YZ -= 1;        break;
??chushihua_161:
        LDR.W    R0,??DataTable8_4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable8_4
        STR      R0,[R1, #+0]
        B.N      ??chushihua_156
//  880 	 case 12: weight_Min -= 1;       break;
??chushihua_164:
        LDR.W    R0,??DataTable8_5
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable8_5
        STR      R0,[R1, #+0]
        B.N      ??chushihua_156
//  881 	 case 13: SpecialPWM -= 100; break;
??chushihua_163:
        LDR.W    R0,??DataTable8_6
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+100
        LDR.W    R1,??DataTable8_6
        STR      R0,[R1, #+0]
        B.N      ??chushihua_156
        DATA
??chushihua_145:
        DC8      "=",0x0,0x0
        DC8      " ",0x0,0x0
        THUMB
//  882 	 default:  break;
//  883 	}
//  884    }
//  885    
//  886    LCD_P6x8Str(0,0,"Midline:    ");
??chushihua_158:
??chushihua_156:
        LDR.W    R2,??DataTable8_8
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  887    LCD_P6x8Str(0,1,"angleoffset:");
        LDR.W    R2,??DataTable8_9
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  888    LCD_P6x8Str(0,2,"Angle_Kp:   ");
        LDR.W    R2,??DataTable8_10
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  889    LCD_P6x8Str(0,3,"Angle_Kd:   ");
        LDR.W    R2,??DataTable8_11
        MOVS     R1,#+3
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  890    LCD_P6x8Str(0,4,"YZ:         ");
        LDR.W    R2,??DataTable8_12
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  891    LCD_P6x8Str(0,5,"weight_Min: ");
        LDR.W    R2,??DataTable8_13
        MOVS     R1,#+5
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  892    LCD_P6x8Str(0,6,"SpecialPWM: ");
        LDR.W    R2,??DataTable8_14
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  893    sprintf(str,"%6d",Midline);
        LDR.W    R0,??DataTable8
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_96  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
//  894    LCD_P6x8Str(90,0,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+0
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  895    sprintf(str,"%6.1f",(float)angleoffset);
        LDR.W    R0,??DataTable8_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR.W    R1,??DataTable8_16
        LDR.W    R0,??DataTable8_15
        BL       sprintf
//  896    LCD_P6x8Str(90,1,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+1
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  897    sprintf(str,"%6d",(long)Angle_Kp);
        LDR.W    R0,??DataTable8_2
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_96  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
//  898    LCD_P6x8Str(90,2,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+2
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  899    sprintf(str,"%6d",(long)Angle_Kd);
        LDR.W    R0,??DataTable8_3
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_96  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
//  900    LCD_P6x8Str(90,3,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+3
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  901    sprintf(str,"%6d",YZ);
        LDR.W    R0,??DataTable8_4
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_96  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
//  902    LCD_P6x8Str(90,4,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+4
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  903    sprintf(str,"%6d",weight_Min);
        LDR.W    R0,??DataTable8_5
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_96  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
//  904    LCD_P6x8Str(90,5,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+5
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  905    sprintf(str,"%6d",SpecialPWM);
        LDR.W    R0,??DataTable8_6
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_96  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
//  906    LCD_P6x8Str(90,6,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+6
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  907    sprintf(str,"%6d",SpeedWant);
        LDR.W    R0,??chushihua_124
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_96  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
//  908    LCD_P6x8Str(90,7,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+7
        MOVS     R0,#+90
        BL       LCD_P6x8Str
        B.N      ??chushihua_135
//  909   }//end 2
//  910   else
//  911   {
//  912    switch(LCD_Flag)
??chushihua_136:
        LDR.N    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+14
        BEQ.N    ??chushihua_165
        BCC.W    ??chushihua_166
        CMP      R0,#+16
        BEQ.N    ??chushihua_167
        BCC.N    ??chushihua_168
        CMP      R0,#+18
        BEQ.W    ??chushihua_169
        BCC.N    ??chushihua_170
        CMP      R0,#+20
        BEQ.W    ??chushihua_171
        BCC.W    ??chushihua_172
        B.N      ??chushihua_166
//  913    {
//  914 	case 14:{LCD_P6x8Str(70,0,"=");
??chushihua_165:
        ADR.N    R2,??chushihua_97+0x28  ;; "="
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  915 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  916 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  917 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  918 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  919 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  920 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  921 	break;}
        B.N      ??chushihua_173
//  922 	case 15:{LCD_P6x8Str(70,0," ");
??chushihua_168:
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  923 	LCD_P6x8Str(70,1,"=");
        ADR.N    R2,??chushihua_97+0x28  ;; "="
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  924 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  925 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  926 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  927 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  928 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  929 	break;}
        B.N      ??chushihua_173
//  930 	case 16:{LCD_P6x8Str(70,0," ");
??chushihua_167:
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  931 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  932 	LCD_P6x8Str(70,2,"=");
        ADR.N    R2,??chushihua_97+0x28  ;; "="
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  933 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  934 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  935 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  936 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  937 	break;}
        B.N      ??chushihua_173
//  938 	case 17:{LCD_P6x8Str(70,0," ");
??chushihua_170:
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  939 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  940 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  941 	LCD_P6x8Str(70,3,"=");
        ADR.N    R2,??chushihua_97+0x28  ;; "="
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  942 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  943 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  944 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  945 	break;}
        B.N      ??chushihua_173
//  946 	case 18:{LCD_P6x8Str(70,0," ");
??chushihua_169:
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  947 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  948 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  949 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  950 	LCD_P6x8Str(70,4,"=");
        ADR.N    R2,??chushihua_97+0x28  ;; "="
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  951 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  952 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  953 	break;}
        B.N      ??chushihua_173
//  954 	case 19:{LCD_P6x8Str(70,0," ");
??chushihua_172:
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  955 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  956 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  957 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  958 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  959 	LCD_P6x8Str(70,5,"=");
        ADR.N    R2,??chushihua_97+0x28  ;; "="
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  960 	LCD_P6x8Str(70,6," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  961 	break;}
        B.N      ??chushihua_173
//  962 	case 20:{LCD_P6x8Str(70,0," ");
??chushihua_171:
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+0
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  963 	LCD_P6x8Str(70,1," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  964 	LCD_P6x8Str(70,2," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+2
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  965 	LCD_P6x8Str(70,3," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+3
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  966 	LCD_P6x8Str(70,4," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+4
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  967 	LCD_P6x8Str(70,5," ");
        ADR.N    R2,??chushihua_97+0x2C  ;; " "
        MOVS     R1,#+5
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  968 	LCD_P6x8Str(70,6,"=");
        ADR.N    R2,??chushihua_97+0x28  ;; "="
        MOVS     R1,#+6
        MOVS     R0,#+70
        BL       LCD_P6x8Str
//  969 	break;}
        B.N      ??chushihua_173
//  970 	default:  break;       
//  971    }
//  972    if(!GPIO_GetBit(PORT_A,12))
??chushihua_166:
??chushihua_173:
        MOVS     R1,#+12
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_174
//  973    {
//  974 	Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  975 	switch(LCD_Flag)
        LDR.N    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+14
        BEQ.N    ??chushihua_175
        BCC.N    ??chushihua_176
        CMP      R0,#+16
        BEQ.N    ??chushihua_177
        BCC.N    ??chushihua_178
        B.N      ??chushihua_176
//  976 	{
//  977 	 case 14: Choice += 1;     break;
??chushihua_175:
        LDR.W    R0,??DataTable8_17
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable8_17
        STR      R0,[R1, #+0]
        B.N      ??chushihua_174
//  978 	 case 15: Stoptime += 1;  break;
??chushihua_178:
        LDR.W    R0,??DataTable8_18
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable8_18
        STR      R0,[R1, #+0]
        B.N      ??chushihua_174
//  979 	 case 16: Ka += 1;  break;
??chushihua_177:
        LDR.W    R0,??DataTable8_19
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable8_19
        STR      R0,[R1, #+0]
        B.N      ??chushihua_174
//  980 	 default:  break;
//  981 	}
//  982    }
//  983    if(!GPIO_GetBit(PORT_A,14))
??chushihua_176:
??chushihua_174:
        MOVS     R1,#+14
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.N    ??chushihua_179
//  984    {
//  985 	Delay_ccd(30);
        MOVS     R0,#+30
        BL       Delay_ccd
//  986 	switch(LCD_Flag)
        LDR.N    R0,??chushihua_97+0x38
        LDR      R0,[R0, #+0]
        CMP      R0,#+14
        BEQ.N    ??chushihua_180
        BCC.N    ??chushihua_181
        CMP      R0,#+16
        BEQ.N    ??chushihua_182
        BCC.N    ??chushihua_183
        B.N      ??chushihua_181
        Nop      
        DATA
??chushihua_96:
        DC8      "%6d"
        DC32     ?_11
        DC32     ?_12
        THUMB
//  987 	{
//  988 	 case 14: Choice -= 1;     break;
??chushihua_180:
        LDR.W    R0,??DataTable8_17
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable8_17
        STR      R0,[R1, #+0]
        B.N      ??chushihua_179
//  989 	 case 15: Stoptime -= 1;   break;
??chushihua_183:
        LDR.W    R0,??DataTable8_18
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable8_18
        STR      R0,[R1, #+0]
        B.N      ??chushihua_179
        DATA
??chushihua_97:
        DC32     ?_13
        DC32     ?_14
        DC32     ?_15
        DC32     ?_16
        DC32     ?_17
        DC32     SinglineEN
        DC32     OledShowEN
        DC32     BmaEN
        DC32     WhiteEN
        DC32     LighthouseEN
        DC8      "=",0x0,0x0
        DC8      " ",0x0,0x0
        DC32     BlackflagEN
        DC32     ?_18
        DC32     LCD_Flag
        THUMB
//  990 	 case 16: Ka -= 1;    break;
??chushihua_182:
        LDR.W    R0,??DataTable8_19
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable8_19
        STR      R0,[R1, #+0]
        B.N      ??chushihua_179
//  991 	 default:  break;
//  992 	}
//  993    }
//  994    
//  995    LCD_P6x8Str(0,0,"Choice:     ");
??chushihua_181:
??chushihua_179:
        LDR.W    R2,??DataTable8_20
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  996    LCD_P6x8Str(0,1,"Stoptime:   ");
        LDR.W    R2,??DataTable8_21
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  997    LCD_P6x8Str(0,2,"Ka:         ");
        LDR.W    R2,??DataTable8_22
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  998    LCD_P6x8Str(0,3,"            ");
        LDR.W    R2,??DataTable8_23
        MOVS     R1,#+3
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  999    LCD_P6x8Str(0,4,"            ");
        LDR.W    R2,??DataTable8_23
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P6x8Str
// 1000    LCD_P6x8Str(0,5,"            ");
        LDR.W    R2,??DataTable8_23
        MOVS     R1,#+5
        MOVS     R0,#+0
        BL       LCD_P6x8Str
// 1001    LCD_P6x8Str(0,6,"            ");
        LDR.W    R2,??DataTable8_23
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       LCD_P6x8Str
// 1002    sprintf(str,"%6d",Choice);
        LDR.W    R0,??DataTable8_17
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_124+0xC  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
// 1003    LCD_P6x8Str(90,0,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+0
        MOVS     R0,#+90
        BL       LCD_P6x8Str
// 1004    sprintf(str,"%6d",Stoptime);
        LDR.W    R0,??DataTable8_18
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_124+0xC  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
// 1005    LCD_P6x8Str(90,1,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+1
        MOVS     R0,#+90
        BL       LCD_P6x8Str
// 1006    sprintf(str,"%6d",Ka);
        LDR.W    R0,??DataTable8_19
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_124+0xC  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
// 1007    LCD_P6x8Str(90,2,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+2
        MOVS     R0,#+90
        BL       LCD_P6x8Str
// 1008    LCD_P6x8Str(90,3,"       ");
        LDR.W    R2,??DataTable8_24
        MOVS     R1,#+3
        MOVS     R0,#+90
        BL       LCD_P6x8Str
// 1009    LCD_P6x8Str(90,4,"       ");
        LDR.W    R2,??DataTable8_24
        MOVS     R1,#+4
        MOVS     R0,#+90
        BL       LCD_P6x8Str
// 1010    LCD_P6x8Str(90,5,"       ");
        LDR.W    R2,??DataTable8_24
        MOVS     R1,#+5
        MOVS     R0,#+90
        BL       LCD_P6x8Str
// 1011    LCD_P6x8Str(90,6,"       ");
        LDR.W    R2,??DataTable8_24
        MOVS     R1,#+6
        MOVS     R0,#+90
        BL       LCD_P6x8Str
// 1012    sprintf(str,"%6d",SpeedWant);
        LDR.N    R0,??chushihua_124
        LDR      R2,[R0, #+0]
        ADR.N    R1,??chushihua_124+0xC  ;; "%6d"
        LDR.W    R0,??DataTable8_15
        BL       sprintf
// 1013    LCD_P6x8Str(90,7,str);
        LDR.W    R2,??DataTable8_15
        MOVS     R1,#+7
        MOVS     R0,#+90
        BL       LCD_P6x8Str
// 1014   }
// 1015   switch(Choice)
??chushihua_135:
        LDR.W    R0,??DataTable8_17
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??chushihua_184
        CMP      R0,#+1
        BEQ.W    ??chushihua_185
        CMP      R0,#+2
        BEQ.W    ??chushihua_186
        CMP      R0,#+3
        BEQ.W    ??chushihua_187
        CMP      R0,#+4
        BEQ.W    ??chushihua_188
        CMP      R0,#+5
        BEQ.W    ??chushihua_189
        CMP      R0,#+6
        BEQ.W    ??chushihua_190
        CMP      R0,#+7
        BEQ.W    ??chushihua_191
        CMP      R0,#+8
        BEQ.W    ??chushihua_192
        CMP      R0,#+9
        BEQ.W    ??chushihua_193
        CMP      R0,#-1
        BEQ.N    ??chushihua_194
        B.N      ??chushihua_195
        Nop      
        DATA
??chushihua_124:
        DC32     SpeedWant
        DC32     Speed_Kp
        DC32     Speed_Ki
        DC8      "%6d"
        DC32     Speed_Kd
        DC32     D_P
        DC32     0x41200000
        DC32     D_I
        DC32     D_D
        DC32     0x40a00000
        DC32     0xc1200000
        DC32     0xc0a00000
        DC32     ?_19
        DC32     ?_20
        DC32     ?_21
        DC32     ?_22
        DC32     ?_23
        DC32     ?_24
        DC32     ?_25
        DC32     ?_26
        THUMB
// 1016   {
// 1017    case 0: break;
??chushihua_184:
        B.N      ??chushihua_196
// 1018    case -1: {
// 1019 	SpeedWant =135;
??chushihua_194:
        MOVS     R0,#+135
        LDR.W    R1,??DataTable8_25
        STR      R0,[R1, #+0]
// 1020 	Speed_Kp = -280;
        LDR.W    R0,??DataTable8_26  ;; 0xfffffee8
        LDR.W    R1,??DataTable8_27
        STR      R0,[R1, #+0]
// 1021 	Speed_Ki = -8;
        MVNS     R0,#+7
        LDR.W    R1,??DataTable8_28
        STR      R0,[R1, #+0]
// 1022 	Speed_Kd=3;  
        MOVS     R0,#+3
        LDR.W    R1,??DataTable8_29
        STR      R0,[R1, #+0]
// 1023 	D_P = 460;
        LDR.W    R0,??DataTable8_30  ;; 0x43e60000
        LDR.W    R1,??DataTable8_31
        STR      R0,[R1, #+0]
// 1024 	D_I=38;
        LDR.W    R0,??DataTable8_32  ;; 0x42180000
        LDR.W    R1,??DataTable8_33
        STR      R0,[R1, #+0]
// 1025 	D_D = 110;
        LDR.W    R0,??DataTable8_34  ;; 0x42dc0000
        LDR.W    R1,??DataTable8_35
        STR      R0,[R1, #+0]
// 1026 	Midline=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable8
        STR      R0,[R1, #+0]
// 1027 	angleoffset = 71;
        LDR.W    R0,??DataTable8_36  ;; 0x428e0000
        LDR.W    R1,??DataTable8_1
        STR      R0,[R1, #+0]
// 1028 	Angle_Kp=1800;
        MOV      R0,#+1800
        LDR.W    R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1029 	Angle_Kd=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1030 	YZ=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1031 	weight_Min=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_5
        STR      R0,[R1, #+0]
// 1032 	SpecialPWM=5000;
        MOVW     R0,#+5000
        LDR.W    R1,??DataTable8_6
        STR      R0,[R1, #+0]
// 1033 	Stoptime=117;
        MOVS     R0,#+117
        LDR.W    R1,??DataTable8_18
        STR      R0,[R1, #+0]
// 1034 	Ka=20;            
        MOVS     R0,#+20
        LDR.W    R1,??DataTable8_19
        STR      R0,[R1, #+0]
// 1035 	break;}
        B.N      ??chushihua_196
// 1036    case 1: {
// 1037 	SpeedWant =120;
??chushihua_185:
        MOVS     R0,#+120
        LDR.W    R1,??DataTable8_25
        STR      R0,[R1, #+0]
// 1038 	Speed_Kp = -310;
        LDR.W    R0,??DataTable8_37  ;; 0xfffffeca
        LDR.W    R1,??DataTable8_27
        STR      R0,[R1, #+0]
// 1039 	Speed_Ki = -8;
        MVNS     R0,#+7
        LDR.W    R1,??DataTable8_28
        STR      R0,[R1, #+0]
// 1040 	Speed_Kd=3;  
        MOVS     R0,#+3
        LDR.W    R1,??DataTable8_29
        STR      R0,[R1, #+0]
// 1041 	D_P = 440;
        LDR.W    R0,??DataTable8_38  ;; 0x43dc0000
        LDR.W    R1,??DataTable8_31
        STR      R0,[R1, #+0]
// 1042 	D_I=38;
        LDR.W    R0,??DataTable8_32  ;; 0x42180000
        LDR.W    R1,??DataTable8_33
        STR      R0,[R1, #+0]
// 1043 	D_D = 110;
        LDR.W    R0,??DataTable8_34  ;; 0x42dc0000
        LDR.W    R1,??DataTable8_35
        STR      R0,[R1, #+0]
// 1044 	Midline=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable8
        STR      R0,[R1, #+0]
// 1045 	angleoffset = 71;
        LDR.W    R0,??DataTable8_36  ;; 0x428e0000
        LDR.W    R1,??DataTable8_1
        STR      R0,[R1, #+0]
// 1046 	Angle_Kp=1800;
        MOV      R0,#+1800
        LDR.W    R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1047 	Angle_Kd=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1048 	YZ=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1049 	weight_Min=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_5
        STR      R0,[R1, #+0]
// 1050 	SpecialPWM=5000;
        MOVW     R0,#+5000
        LDR.W    R1,??DataTable8_6
        STR      R0,[R1, #+0]
// 1051 	Stoptime=117;
        MOVS     R0,#+117
        LDR.W    R1,??DataTable8_18
        STR      R0,[R1, #+0]
// 1052 	Ka=20;         
        MOVS     R0,#+20
        LDR.W    R1,??DataTable8_19
        STR      R0,[R1, #+0]
// 1053 	break;}
        B.N      ??chushihua_196
// 1054    case 2: {
// 1055 	SpeedWant =145;
??chushihua_186:
        MOVS     R0,#+145
        LDR.W    R1,??DataTable8_25
        STR      R0,[R1, #+0]
// 1056 	Speed_Kp = -280;
        LDR.W    R0,??DataTable8_26  ;; 0xfffffee8
        LDR.W    R1,??DataTable8_27
        STR      R0,[R1, #+0]
// 1057 	Speed_Ki = -8;
        MVNS     R0,#+7
        LDR.W    R1,??DataTable8_28
        STR      R0,[R1, #+0]
// 1058 	Speed_Kd=3;  
        MOVS     R0,#+3
        LDR.W    R1,??DataTable8_29
        STR      R0,[R1, #+0]
// 1059 	D_P = 470;
        LDR.W    R0,??DataTable8_39  ;; 0x43eb0000
        LDR.W    R1,??DataTable8_31
        STR      R0,[R1, #+0]
// 1060 	D_I=38;
        LDR.W    R0,??DataTable8_32  ;; 0x42180000
        LDR.W    R1,??DataTable8_33
        STR      R0,[R1, #+0]
// 1061 	D_D = 115;
        LDR.W    R0,??DataTable8_40  ;; 0x42e60000
        LDR.W    R1,??DataTable8_35
        STR      R0,[R1, #+0]
// 1062 	Midline=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable8
        STR      R0,[R1, #+0]
// 1063 	angleoffset = 72;
        LDR.W    R0,??DataTable8_41  ;; 0x42900000
        LDR.W    R1,??DataTable8_1
        STR      R0,[R1, #+0]
// 1064 	Angle_Kp=980;
        MOV      R0,#+980
        LDR.W    R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1065 	Angle_Kd=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1066 	YZ=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1067 	weight_Min=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_5
        STR      R0,[R1, #+0]
// 1068 	SpecialPWM=4500;
        MOVW     R0,#+4500
        LDR.W    R1,??DataTable8_6
        STR      R0,[R1, #+0]
// 1069 	Stoptime=117;
        MOVS     R0,#+117
        LDR.W    R1,??DataTable8_18
        STR      R0,[R1, #+0]
// 1070 	Ka=20; 
        MOVS     R0,#+20
        LDR.W    R1,??DataTable8_19
        STR      R0,[R1, #+0]
// 1071 	break;}
        B.N      ??chushihua_196
// 1072    case 3:  {
// 1073 	SpeedWant =45;
??chushihua_187:
        MOVS     R0,#+45
        LDR.W    R1,??DataTable8_25
        STR      R0,[R1, #+0]
// 1074 	Speed_Kp = -350; 
        LDR.W    R0,??DataTable8_42  ;; 0xfffffea2
        LDR.W    R1,??DataTable8_27
        STR      R0,[R1, #+0]
// 1075 	Speed_Ki = -18; 
        MVNS     R0,#+17
        LDR.W    R1,??DataTable8_28
        STR      R0,[R1, #+0]
// 1076 	Speed_Kd=3;
        MOVS     R0,#+3
        LDR.W    R1,??DataTable8_29
        STR      R0,[R1, #+0]
// 1077 	D_P = 960;
        LDR.W    R0,??DataTable8_43  ;; 0x44700000
        LDR.W    R1,??DataTable8_31
        STR      R0,[R1, #+0]
// 1078 	D_I=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_33
        STR      R0,[R1, #+0]
// 1079 	D_D = 280;
        LDR.W    R0,??DataTable8_44  ;; 0x438c0000
        LDR.W    R1,??DataTable8_35
        STR      R0,[R1, #+0]
// 1080 	Midline=69;
        MOVS     R0,#+69
        LDR.N    R1,??DataTable8
        STR      R0,[R1, #+0]
// 1081 	angleoffset = 77; 
        LDR.W    R0,??DataTable8_45  ;; 0x429a0000
        LDR.N    R1,??DataTable8_1
        STR      R0,[R1, #+0]
// 1082 	Angle_Kp=1800;
        MOV      R0,#+1800
        LDR.N    R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1083 	Angle_Kd=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1084 	YZ=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1085 	weight_Min=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5
        STR      R0,[R1, #+0]
// 1086 	SpecialPWM=8000;
        MOV      R0,#+8000
        LDR.N    R1,??DataTable8_6
        STR      R0,[R1, #+0]
// 1087 	Stoptime=117;
        MOVS     R0,#+117
        LDR.N    R1,??DataTable8_18
        STR      R0,[R1, #+0]
// 1088 	Ka=7;
        MOVS     R0,#+7
        LDR.N    R1,??DataTable8_19
        STR      R0,[R1, #+0]
// 1089 	break;}
        B.N      ??chushihua_196
// 1090    case 4: {
// 1091 	SpeedWant =45;
??chushihua_188:
        MOVS     R0,#+45
        LDR.N    R1,??DataTable8_25
        STR      R0,[R1, #+0]
// 1092 	Speed_Kp = -350; 
        LDR.W    R0,??DataTable8_42  ;; 0xfffffea2
        LDR.N    R1,??DataTable8_27
        STR      R0,[R1, #+0]
// 1093 	Speed_Ki = -18; 
        MVNS     R0,#+17
        LDR.N    R1,??DataTable8_28
        STR      R0,[R1, #+0]
// 1094 	Speed_Kd=3;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable8_29
        STR      R0,[R1, #+0]
// 1095 	D_P = 960;
        LDR.W    R0,??DataTable8_43  ;; 0x44700000
        LDR.N    R1,??DataTable8_31
        STR      R0,[R1, #+0]
// 1096 	D_I=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_33
        STR      R0,[R1, #+0]
// 1097 	D_D = 280;
        LDR.W    R0,??DataTable8_44  ;; 0x438c0000
        LDR.N    R1,??DataTable8_35
        STR      R0,[R1, #+0]
// 1098 	Midline=69;
        MOVS     R0,#+69
        LDR.N    R1,??DataTable8
        STR      R0,[R1, #+0]
// 1099 	angleoffset = 77; 
        LDR.W    R0,??DataTable8_45  ;; 0x429a0000
        LDR.N    R1,??DataTable8_1
        STR      R0,[R1, #+0]
// 1100 	Angle_Kp=1800;
        MOV      R0,#+1800
        LDR.N    R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1101 	Angle_Kd=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1102 	YZ=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1103 	weight_Min=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5
        STR      R0,[R1, #+0]
// 1104 	SpecialPWM=8000;
        MOV      R0,#+8000
        LDR.N    R1,??DataTable8_6
        STR      R0,[R1, #+0]
// 1105 	Stoptime=117;
        MOVS     R0,#+117
        LDR.N    R1,??DataTable8_18
        STR      R0,[R1, #+0]
// 1106 	Ka=7;
        MOVS     R0,#+7
        LDR.N    R1,??DataTable8_19
        STR      R0,[R1, #+0]
// 1107 	break;}
        B.N      ??chushihua_196
// 1108    case 5: {
// 1109 	SpeedWant =45;
??chushihua_189:
        MOVS     R0,#+45
        LDR.N    R1,??DataTable8_25
        STR      R0,[R1, #+0]
// 1110 	Speed_Kp = -350; 
        LDR.N    R0,??DataTable8_42  ;; 0xfffffea2
        LDR.N    R1,??DataTable8_27
        STR      R0,[R1, #+0]
// 1111 	Speed_Ki = -18; 
        MVNS     R0,#+17
        LDR.N    R1,??DataTable8_28
        STR      R0,[R1, #+0]
// 1112 	Speed_Kd=3;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable8_29
        STR      R0,[R1, #+0]
// 1113 	D_P = 960;
        LDR.N    R0,??DataTable8_43  ;; 0x44700000
        LDR.N    R1,??DataTable8_31
        STR      R0,[R1, #+0]
// 1114 	D_I=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_33
        STR      R0,[R1, #+0]
// 1115 	D_D = 280;
        LDR.N    R0,??DataTable8_44  ;; 0x438c0000
        LDR.N    R1,??DataTable8_35
        STR      R0,[R1, #+0]
// 1116 	Midline=69;
        MOVS     R0,#+69
        LDR.N    R1,??DataTable8
        STR      R0,[R1, #+0]
// 1117 	angleoffset =77; 
        LDR.N    R0,??DataTable8_45  ;; 0x429a0000
        LDR.N    R1,??DataTable8_1
        STR      R0,[R1, #+0]
// 1118 	Angle_Kp=1800;
        MOV      R0,#+1800
        LDR.N    R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1119 	Angle_Kd=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1120 	YZ=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1121 	weight_Min=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5
        STR      R0,[R1, #+0]
// 1122 	SpecialPWM=8000;
        MOV      R0,#+8000
        LDR.N    R1,??DataTable8_6
        STR      R0,[R1, #+0]
// 1123 	Stoptime=117;
        MOVS     R0,#+117
        LDR.N    R1,??DataTable8_18
        STR      R0,[R1, #+0]
// 1124 	Ka=7;
        MOVS     R0,#+7
        LDR.N    R1,??DataTable8_19
        STR      R0,[R1, #+0]
// 1125 	break;}
        B.N      ??chushihua_196
// 1126    case 6: {              
// 1127 	SpeedWant =45;
??chushihua_190:
        MOVS     R0,#+45
        LDR.N    R1,??DataTable8_25
        STR      R0,[R1, #+0]
// 1128 	Speed_Kp = -350; 
        LDR.N    R0,??DataTable8_42  ;; 0xfffffea2
        LDR.N    R1,??DataTable8_27
        STR      R0,[R1, #+0]
// 1129 	Speed_Ki = -18; 
        MVNS     R0,#+17
        LDR.N    R1,??DataTable8_28
        STR      R0,[R1, #+0]
// 1130 	Speed_Kd=3;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable8_29
        STR      R0,[R1, #+0]
// 1131 	D_P = 960;
        LDR.N    R0,??DataTable8_43  ;; 0x44700000
        LDR.N    R1,??DataTable8_31
        STR      R0,[R1, #+0]
// 1132 	D_I=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_33
        STR      R0,[R1, #+0]
// 1133 	D_D = 280;
        LDR.N    R0,??DataTable8_44  ;; 0x438c0000
        LDR.N    R1,??DataTable8_35
        STR      R0,[R1, #+0]
// 1134 	Midline=69;
        MOVS     R0,#+69
        LDR.N    R1,??DataTable8
        STR      R0,[R1, #+0]
// 1135 	angleoffset = 77; 
        LDR.N    R0,??DataTable8_45  ;; 0x429a0000
        LDR.N    R1,??DataTable8_1
        STR      R0,[R1, #+0]
// 1136 	Angle_Kp=1800;
        MOV      R0,#+1800
        LDR.N    R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1137 	Angle_Kd=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1138 	YZ=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1139 	weight_Min=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5
        STR      R0,[R1, #+0]
// 1140 	SpecialPWM=8000;
        MOV      R0,#+8000
        LDR.N    R1,??DataTable8_6
        STR      R0,[R1, #+0]
// 1141 	Stoptime=117;
        MOVS     R0,#+117
        LDR.N    R1,??DataTable8_18
        STR      R0,[R1, #+0]
// 1142 	Ka=7;
        MOVS     R0,#+7
        LDR.N    R1,??DataTable8_19
        STR      R0,[R1, #+0]
// 1143 	break;}
        B.N      ??chushihua_196
// 1144    case 7: {              
// 1145 	SpeedWant =45;
??chushihua_191:
        MOVS     R0,#+45
        LDR.N    R1,??DataTable8_25
        STR      R0,[R1, #+0]
// 1146 	Speed_Kp = -350; 
        LDR.N    R0,??DataTable8_42  ;; 0xfffffea2
        LDR.N    R1,??DataTable8_27
        STR      R0,[R1, #+0]
// 1147 	Speed_Ki = -18; 
        MVNS     R0,#+17
        LDR.N    R1,??DataTable8_28
        STR      R0,[R1, #+0]
// 1148 	Speed_Kd=3;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable8_29
        STR      R0,[R1, #+0]
// 1149 	D_P = 960;
        LDR.N    R0,??DataTable8_43  ;; 0x44700000
        LDR.N    R1,??DataTable8_31
        STR      R0,[R1, #+0]
// 1150 	D_I=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_33
        STR      R0,[R1, #+0]
// 1151 	D_D = 280;
        LDR.N    R0,??DataTable8_44  ;; 0x438c0000
        LDR.N    R1,??DataTable8_35
        STR      R0,[R1, #+0]
// 1152 	Midline=69;
        MOVS     R0,#+69
        LDR.N    R1,??DataTable8
        STR      R0,[R1, #+0]
// 1153 	angleoffset = 77; 
        LDR.N    R0,??DataTable8_45  ;; 0x429a0000
        LDR.N    R1,??DataTable8_1
        STR      R0,[R1, #+0]
// 1154 	Angle_Kp=1800;
        MOV      R0,#+1800
        LDR.N    R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1155 	Angle_Kd=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1156 	YZ=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1157 	weight_Min=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5
        STR      R0,[R1, #+0]
// 1158 	SpecialPWM=8000;
        MOV      R0,#+8000
        LDR.N    R1,??DataTable8_6
        STR      R0,[R1, #+0]
// 1159 	Stoptime=117;
        MOVS     R0,#+117
        LDR.N    R1,??DataTable8_18
        STR      R0,[R1, #+0]
// 1160 	Ka=7;
        MOVS     R0,#+7
        LDR.N    R1,??DataTable8_19
        STR      R0,[R1, #+0]
// 1161 	break;}
        B.N      ??chushihua_196
// 1162    case 8: {
// 1163 	SpeedWant =45;
??chushihua_192:
        MOVS     R0,#+45
        LDR.N    R1,??DataTable8_25
        STR      R0,[R1, #+0]
// 1164 	Speed_Kp = -350; 
        LDR.N    R0,??DataTable8_42  ;; 0xfffffea2
        LDR.N    R1,??DataTable8_27
        STR      R0,[R1, #+0]
// 1165 	Speed_Ki = -18; 
        MVNS     R0,#+17
        LDR.N    R1,??DataTable8_28
        STR      R0,[R1, #+0]
// 1166 	Speed_Kd=3;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable8_29
        STR      R0,[R1, #+0]
// 1167 	D_P = 960;
        LDR.N    R0,??DataTable8_43  ;; 0x44700000
        LDR.N    R1,??DataTable8_31
        STR      R0,[R1, #+0]
// 1168 	D_I=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_33
        STR      R0,[R1, #+0]
// 1169 	D_D = 280;
        LDR.N    R0,??DataTable8_44  ;; 0x438c0000
        LDR.N    R1,??DataTable8_35
        STR      R0,[R1, #+0]
// 1170 	Midline=69;
        MOVS     R0,#+69
        LDR.N    R1,??DataTable8
        STR      R0,[R1, #+0]
// 1171 	angleoffset = 77; 
        LDR.N    R0,??DataTable8_45  ;; 0x429a0000
        LDR.N    R1,??DataTable8_1
        STR      R0,[R1, #+0]
// 1172 	Angle_Kp=1800;
        MOV      R0,#+1800
        LDR.N    R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1173 	Angle_Kd=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1174 	YZ=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1175 	weight_Min=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5
        STR      R0,[R1, #+0]
// 1176 	SpecialPWM=8000;
        MOV      R0,#+8000
        LDR.N    R1,??DataTable8_6
        STR      R0,[R1, #+0]
// 1177 	Stoptime=117;
        MOVS     R0,#+117
        LDR.N    R1,??DataTable8_18
        STR      R0,[R1, #+0]
// 1178 	Ka=7;
        MOVS     R0,#+7
        LDR.N    R1,??DataTable8_19
        STR      R0,[R1, #+0]
// 1179 	break;}
        B.N      ??chushihua_196
// 1180    case 9: {   
// 1181 	SpeedWant =90;
??chushihua_193:
        MOVS     R0,#+90
        LDR.N    R1,??DataTable8_25
        STR      R0,[R1, #+0]
// 1182 	Speed_Kp = -500; 
        LDR.N    R0,??DataTable8_46  ;; 0xfffffe0c
        LDR.N    R1,??DataTable8_27
        STR      R0,[R1, #+0]
// 1183 	Speed_Ki = -10; 
        MVNS     R0,#+9
        LDR.N    R1,??DataTable8_28
        STR      R0,[R1, #+0]
// 1184 	Speed_Kd=3; 
        MOVS     R0,#+3
        LDR.N    R1,??DataTable8_29
        STR      R0,[R1, #+0]
// 1185 	D_P= 960;
        LDR.N    R0,??DataTable8_43  ;; 0x44700000
        LDR.N    R1,??DataTable8_31
        STR      R0,[R1, #+0]
// 1186 	D_I=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_33
        STR      R0,[R1, #+0]
// 1187 	D_D = 280;
        LDR.N    R0,??DataTable8_44  ;; 0x438c0000
        LDR.N    R1,??DataTable8_35
        STR      R0,[R1, #+0]
// 1188 	Midline=69;
        MOVS     R0,#+69
        LDR.N    R1,??DataTable8
        STR      R0,[R1, #+0]
// 1189 	angleoffset = 77;
        LDR.N    R0,??DataTable8_45  ;; 0x429a0000
        LDR.N    R1,??DataTable8_1
        STR      R0,[R1, #+0]
// 1190 	Angle_Kp=1800;
        MOV      R0,#+1800
        LDR.N    R1,??DataTable8_2
        STR      R0,[R1, #+0]
// 1191 	Angle_Kd=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable8_3
        STR      R0,[R1, #+0]
// 1192 	YZ=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable8_4
        STR      R0,[R1, #+0]
// 1193 	weight_Min=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_5
        STR      R0,[R1, #+0]
// 1194 	SpecialPWM=8000;
        MOV      R0,#+8000
        LDR.N    R1,??DataTable8_6
        STR      R0,[R1, #+0]
// 1195 	Stoptime=117;
        MOVS     R0,#+117
        LDR.N    R1,??DataTable8_18
        STR      R0,[R1, #+0]
// 1196 	Ka=7;
        MOVS     R0,#+7
        LDR.N    R1,??DataTable8_19
        STR      R0,[R1, #+0]
// 1197 	break;}               
        B.N      ??chushihua_196
// 1198    default:  break;       
// 1199   }//end choice
// 1200   if(!GPIO_GetBit(PORT_A,16))
??chushihua_195:
??chushihua_196:
        MOVS     R1,#+16
        MOVS     R0,#+0
        BL       GPIO_GetBit
        CMP      R0,#+0
        BNE.W    ??chushihua_99
// 1201   {
// 1202    Delay_ccd(180);
        MOVS     R0,#+180
        BL       Delay_ccd
// 1203    FlashSetPara();
        BL       FlashSetPara
// 1204    break;
// 1205   }
// 1206  }//end while
// 1207  
// 1208  
// 1209  
// 1210 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     Midline

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     angleoffset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     Angle_Kp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     Angle_Kd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     YZ

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     weight_Min

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     SpecialPWM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     ?_27

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     ?_28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     ?_29

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     ?_30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     ?_31

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_13:
        DC32     ?_32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_14:
        DC32     ?_33

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_15:
        DC32     `str`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_16:
        DC32     ?_34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_17:
        DC32     Choice

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_18:
        DC32     Stoptime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_19:
        DC32     Ka

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_20:
        DC32     ?_35

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_21:
        DC32     ?_36

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_22:
        DC32     ?_37

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_23:
        DC32     ?_17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_24:
        DC32     ?_18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_25:
        DC32     SpeedWant

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_26:
        DC32     0xfffffee8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_27:
        DC32     Speed_Kp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_28:
        DC32     Speed_Ki

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_29:
        DC32     Speed_Kd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_30:
        DC32     0x43e60000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_31:
        DC32     D_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_32:
        DC32     0x42180000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_33:
        DC32     D_I

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_34:
        DC32     0x42dc0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_35:
        DC32     D_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_36:
        DC32     0x428e0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_37:
        DC32     0xfffffeca

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_38:
        DC32     0x43dc0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_39:
        DC32     0x43eb0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_40:
        DC32     0x42e60000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_41:
        DC32     0x42900000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_42:
        DC32     0xfffffea2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_43:
        DC32     0x44700000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_44:
        DC32     0x438c0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_45:
        DC32     0x429a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_46:
        DC32     0xfffffe0c

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "="

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 " "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "BlocklEN:   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "BlockrEN:   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_4:
        DATA
        DC8 "ElbobedrEN: "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "ElbobedlEN: "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_6:
        DATA
        DC8 "RampEN:     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_7:
        DATA
        DC8 "ProtectEN:  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_8:
        DATA
        DC8 "SteerEssEN: "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_9:
        DATA
        DC8 "SpedextrEN: "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%6d"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_11:
        DATA
        DC8 "SinglineEN: "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_12:
        DATA
        DC8 "OledShowEN: "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_13:
        DATA
        DC8 "BmaEN:      "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_14:
        DATA
        DC8 "WhiteEN:    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_15:
        DATA
        DC8 "LighhouseEN:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_16:
        DATA
        DC8 "BlackflagEN:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_17:
        DATA
        DC8 "            "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_18:
        DATA
        DC8 "       "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_19:
        DATA
        DC8 "SpeedWant:  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_20:
        DATA
        DC8 "Speed_Kp:   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_21:
        DATA
        DC8 "Speed_Ki:   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_22:
        DATA
        DC8 "Speed_Kd:   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_23:
        DATA
        DC8 "D_P:        "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_24:
        DATA
        DC8 "D_I:        "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_25:
        DATA
        DC8 "D_D:        "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_26:
        DATA
        DC8 "%6.0f"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_27:
        DATA
        DC8 "Midline:    "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_28:
        DATA
        DC8 "angleoffset:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_29:
        DATA
        DC8 "Angle_Kp:   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_30:
        DATA
        DC8 "Angle_Kd:   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_31:
        DATA
        DC8 "YZ:         "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_32:
        DATA
        DC8 "weight_Min: "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_33:
        DATA
        DC8 "SpecialPWM: "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_34:
        DATA
        DC8 "%6.1f"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_35:
        DATA
        DC8 "Choice:     "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_36:
        DATA
        DC8 "Stoptime:   "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_37:
        DATA
        DC8 "Ka:         "
        DC8 0, 0, 0

        END
// 
//   256 bytes in section .bss
//    24 bytes in section .data
//   544 bytes in section .rodata
// 9 932 bytes in section .text
// 
// 9 932 bytes of CODE  memory
//   544 bytes of CONST memory
//   280 bytes of DATA  memory
//
//Errors: none
//Warnings: 54
