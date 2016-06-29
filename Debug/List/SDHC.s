///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    13/Mar/2015  12:44:23 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Administrator\Desktop\3.11换结构BLOCK nd       /
//                    black\common\SDHC.c                                     /
//    Command line =  "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\common\SDHC.c" -D DEBUG -lCN                      /
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
//                    black\Debug\List\SDHC.s                                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME SDHC

        #define SHT_PROGBITS 0x1

        EXTERN Delay

        PUBLIC GetCardStat
        PUBLIC GetFatTimer
        PUBLIC K60_SDHC0_init
        PUBLIC SDHC_Card
        PUBLIC SDHC_Device
        PUBLIC SDHC_Info
        PUBLIC SDHC_Init
        PUBLIC SDHC_init
        PUBLIC SDHC_ioctl
        PUBLIC SetCardStat
        PUBLIC SetFatTimer
        PUBLIC disk_initialize
        PUBLIC disk_ioctl
        PUBLIC disk_read
        PUBLIC disk_status
        PUBLIC disk_timerproc
        PUBLIC disk_write
        PUBLIC get_fattime
        PUBLIC rtc

// C:\Users\Administrator\Desktop\3.11换结构BLOCK nd  black\common\SDHC.c
//    1 /*
//    2  * SDHC.c
//    3  *
//    4  *  Created on: 16/05/2011
//    5  *      Author: gustavo
//    6  */
//    7 
//    8 #include "..\K60_datatype.h"
//    9 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 OS_RTC rtc;
rtc:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 SDCARD_STRUCT       SDHC_Card;
SDHC_Card:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 SDCARD_INIT_STRUCT  SDHC_Init;
SDHC_Init:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 ESDHC_INFO_STRUCT   SDHC_Info;
SDHC_Info:
        DS8 516

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 ESDHC_DEVICE_STRUCT SDHC_Device;
SDHC_Device:
        DS8 8
//   15 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   16 static volatile DSTATUS   Stat             = STA_NOINIT;    /* Disk status */
Stat:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 static volatile U32  Timer            = 0;             /* Read/Write timer */
Timer:
        DS8 4
//   18 
//   19 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   20 const ESDHC_INIT_STRUCT K60_SDHC0_init = {
K60_SDHC0_init:
        DATA
        DC32 0, 25000000, 100000000
//   21     0,                          /* ESDHC device number */ 
//   22     25000000,                   /* ESDHC baudrate      */
//   23     BSP_SYSTEM_CLOCK            /* ESDHC clock source  */ 
//   24 };
//   25 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   26 U32 get_fattime (void)
//   27 {
//   28  
//   29   
//   30   
//   31 
//   32   return  (  ((U32)(rtc.Year - 1980) << 25)
//   33           | ((U32)rtc.Month << 21)
//   34           | ((U32)rtc.Day   << 16)
//   35           | ((U32)rtc.Hour  << 11)
//   36           | ((U32)rtc.Min << 5)
//   37           | ((U32)rtc.Sec << 1));   
get_fattime:
        LDR.W    R0,??DataTable9
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable7  ;; 0xfffff844
        UXTAH    R0,R1,R0
        LDR.W    R1,??DataTable9
        LDRB     R1,[R1, #+2]
        LSLS     R1,R1,#+21
        ORRS     R0,R1,R0, LSL #+25
        LDR.W    R1,??DataTable9
        LDRB     R1,[R1, #+3]
        ORRS     R0,R0,R1, LSL #+16
        LDR.W    R1,??DataTable9
        LDRB     R1,[R1, #+4]
        ORRS     R0,R0,R1, LSL #+11
        LDR.W    R1,??DataTable9
        LDRB     R1,[R1, #+5]
        ORRS     R0,R0,R1, LSL #+5
        LDR.W    R1,??DataTable9
        LDRB     R1,[R1, #+6]
        ORRS     R0,R0,R1, LSL #+1
        BX       LR               ;; return
//   38 /*return  (  ((U32)(2011 - 1980) << 25)
//   39           | ((U32)11 << 21)
//   40           | ((U32)10  << 16)
//   41           | ((U32)22  << 11)
//   42           | ((U32)0 << 5)
//   43           | ((U32)0 << 1));*/
//   44 }
//   45 
//   46 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   47 static const unsigned long ESDHC_COMMAND_XFERTYP[] = 
ESDHC_COMMAND_XFERTYP:
        DATA
        DC32 0, 16777216, 34144256, 52035584, 67108864, 84017152, 102367232
        DC32 119209984, 135921664, 151584768, 168361984, 186253312, 215678976
        DC32 219807744, 0, 251658240, 270139392, 286916608, 303693824, 0
        DC32 337248256, 0, 370802688, 387579904, 404357120, 421134336
        DC32 437911552, 454688768, 471531520, 488308736, 505020416, 0
        DC32 538574848, 555352064, 572129280, 588906496, 605683712, 622460928
        DC32 639303680, 654442496, 672792576, 687996928, 706412544, 0, 0, 0, 0
        DC32 0, 0, 0, 0, 857341952, 874119168, 890896384, 0, 924450816
        DC32 941293568, 0, 0, 0, 1008402432, 1025179648, 0, 0
//   48 {   /* CMD0 */
//   49     SDHC_XFERTYP_CMDINX(ESDHC_CMD0) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_NO),
//   50     SDHC_XFERTYP_CMDINX(ESDHC_CMD1) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_NO),
//   51     SDHC_XFERTYP_CMDINX(ESDHC_CMD2) | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_136),
//   52     SDHC_XFERTYP_CMDINX(ESDHC_CMD3) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   53     SDHC_XFERTYP_CMDINX(ESDHC_CMD4) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_NO),
//   54     /* CMD5 */
//   55     SDHC_XFERTYP_CMDINX(ESDHC_CMD5) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   56     SDHC_XFERTYP_CMDINX(ESDHC_CMD6) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   57     SDHC_XFERTYP_CMDINX(ESDHC_CMD7) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   58     SDHC_XFERTYP_CMDINX(ESDHC_CMD8) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   59     SDHC_XFERTYP_CMDINX(ESDHC_CMD9) | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_136),
//   60     /* CMD10 */
//   61     SDHC_XFERTYP_CMDINX(ESDHC_CMD10) | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_136),
//   62     SDHC_XFERTYP_CMDINX(ESDHC_CMD11) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   63     SDHC_XFERTYP_CMDINX(ESDHC_CMD12) | SDHC_XFERTYP_CMDTYP(ESDHC_XFERTYP_CMDTYP_ABORT) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   64     SDHC_XFERTYP_CMDINX(ESDHC_CMD13) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   65     0,
//   66     /* CMD15 */
//   67     SDHC_XFERTYP_CMDINX(ESDHC_CMD15) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_NO),
//   68     SDHC_XFERTYP_CMDINX(ESDHC_CMD16) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   69     SDHC_XFERTYP_CMDINX(ESDHC_CMD17) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   70     SDHC_XFERTYP_CMDINX(ESDHC_CMD18) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   71     0,
//   72     /* CMD20 */
//   73     SDHC_XFERTYP_CMDINX(ESDHC_CMD20) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   74     0,
//   75     SDHC_XFERTYP_CMDINX(ESDHC_ACMD22) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   76     SDHC_XFERTYP_CMDINX(ESDHC_ACMD23) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   77     SDHC_XFERTYP_CMDINX(ESDHC_CMD24) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   78     /* CMD25 */
//   79     SDHC_XFERTYP_CMDINX(ESDHC_CMD25) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   80     SDHC_XFERTYP_CMDINX(ESDHC_CMD26) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   81     SDHC_XFERTYP_CMDINX(ESDHC_CMD27) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   82     SDHC_XFERTYP_CMDINX(ESDHC_CMD28) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   83     SDHC_XFERTYP_CMDINX(ESDHC_CMD29) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   84     /* CMD30 */
//   85     SDHC_XFERTYP_CMDINX(ESDHC_CMD30) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   86     0,
//   87     SDHC_XFERTYP_CMDINX(ESDHC_CMD32) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   88     SDHC_XFERTYP_CMDINX(ESDHC_CMD33) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   89     SDHC_XFERTYP_CMDINX(ESDHC_CMD34) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   90     /* CMD35 */
//   91     SDHC_XFERTYP_CMDINX(ESDHC_CMD35) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   92     SDHC_XFERTYP_CMDINX(ESDHC_CMD36) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   93     SDHC_XFERTYP_CMDINX(ESDHC_CMD37) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   94     SDHC_XFERTYP_CMDINX(ESDHC_CMD38) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   95     SDHC_XFERTYP_CMDINX(ESDHC_CMD39) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   96     /* CMD40 */
//   97     SDHC_XFERTYP_CMDINX(ESDHC_CMD40) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   98     SDHC_XFERTYP_CMDINX(ESDHC_ACMD41) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   99     SDHC_XFERTYP_CMDINX(ESDHC_CMD42) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//  100     0,
//  101     0,
//  102     /* CMD45 */
//  103     0,
//  104     0,
//  105     0,
//  106     0,
//  107     0,
//  108     /* CMD50 */
//  109     0,
//  110     SDHC_XFERTYP_CMDINX(ESDHC_ACMD51) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//  111     SDHC_XFERTYP_CMDINX(ESDHC_CMD52) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//  112     SDHC_XFERTYP_CMDINX(ESDHC_CMD53) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//  113     0,
//  114     /* CMD55 */
//  115     SDHC_XFERTYP_CMDINX(ESDHC_CMD55) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//  116     SDHC_XFERTYP_CMDINX(ESDHC_CMD56) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//  117     0,
//  118     0,
//  119     0,
//  120     /* CMD60 */
//  121     SDHC_XFERTYP_CMDINX(ESDHC_CMD60) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//  122     SDHC_XFERTYP_CMDINX(ESDHC_CMD61) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//  123     0,
//  124     0
//  125 };
//  126 
//  127 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  128 static void SDHC_set_baudrate 
//  129 (       
//  130         /* [IN] Module input clock in Hz */
//  131         U32         clock, 
//  132         
//  133         /* [IN] Desired baudrate in Hz */
//  134         U32         baudrate
//  135 ) 
//  136 {
SDHC_set_baudrate:
        PUSH     {R3-R7,LR}
//  137     U32 pres, div, min, minpres = 0x80, mindiv = 0x0F;
        MOVS     R2,#+128
        MOVS     R3,#+15
//  138     S32  val;
//  139 
//  140     /* Find closest setting */
//  141     min = (U32)-1;
        MOVS     R6,#-1
//  142     for (pres = 2; pres <= 256; pres <<= 1) 
        MOVS     R4,#+2
        B.N      ??SDHC_set_baudrate_0
//  143     {
//  144         for (div = 1; div <= 16; div++) 
//  145         {
//  146             val = pres * div * baudrate - clock;
??SDHC_set_baudrate_1:
        MUL      R7,R5,R4
        MULS     R7,R1,R7
        SUBS     R7,R7,R0
//  147             if (val >= 0)
        CMP      R7,#+0
        BMI.N    ??SDHC_set_baudrate_2
//  148             {
//  149                 if (min > val) 
        CMP      R7,R6
        BCS.N    ??SDHC_set_baudrate_2
//  150                 {
//  151                     min = val;
        MOVS     R6,R7
//  152                     minpres = pres;
        MOVS     R2,R4
//  153                     mindiv = div;
        MOVS     R3,R5
//  154                 }
//  155             }
//  156         }
??SDHC_set_baudrate_2:
        ADDS     R5,R5,#+1
??SDHC_set_baudrate_3:
        CMP      R5,#+17
        BCC.N    ??SDHC_set_baudrate_1
        LSLS     R4,R4,#+1
??SDHC_set_baudrate_0:
        CMP      R4,#+256
        BHI.N    ??SDHC_set_baudrate_4
        MOVS     R5,#+1
        B.N      ??SDHC_set_baudrate_3
//  157     }
//  158 
//  159     /* Disable ESDHC clocks */
//  160     SDHC_SYSCTL &= (~ SDHC_SYSCTL_SDCLKEN_MASK);
??SDHC_set_baudrate_4:
        LDR.W    R0,??DataTable8  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x8
        LDR.W    R1,??DataTable8  ;; 0x400b102c
        STR      R0,[R1, #+0]
//  161 
//  162     /* Change dividers */
//  163     div = SDHC_SYSCTL & (~ (SDHC_SYSCTL_DTOCV_MASK | SDHC_SYSCTL_SDCLKFS_MASK | SDHC_SYSCTL_DVS_MASK));
        LDR.W    R0,??DataTable8  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable8_1  ;; 0xfff0000f
        ANDS     R5,R1,R0
//  164     SDHC_SYSCTL = div | (SDHC_SYSCTL_DTOCV(0x0E) | SDHC_SYSCTL_SDCLKFS(minpres >> 1) | SDHC_SYSCTL_DVS(mindiv - 1));
        LSLS     R0,R2,#+7
        ANDS     R0,R0,#0xFF00
        ORRS     R0,R0,R5
        SUBS     R1,R3,#+1
        LSLS     R1,R1,#+4
        ANDS     R1,R1,#0xF0
        ORRS     R0,R1,R0
        ORRS     R0,R0,#0xE0000
        LDR.W    R1,??DataTable8  ;; 0x400b102c
        STR      R0,[R1, #+0]
        B.N      ??SDHC_set_baudrate_5
//  165 
//  166     /* Wait for stable clock */
//  167     while (0 == (SDHC_PRSSTAT & SDHC_PRSSTAT_SDSTB_MASK))
//  168     {
//  169         /* Workaround... */
//  170          Delay(10);
??SDHC_set_baudrate_6:
        MOVS     R0,#+10
        BL       Delay
//  171     };
??SDHC_set_baudrate_5:
        LDR.W    R0,??DataTable8_2  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??SDHC_set_baudrate_6
//  172 
//  173     /* Enable ESDHC clocks */
//  174     SDHC_SYSCTL |= SDHC_SYSCTL_SDCLKEN_MASK;
        LDR.W    R0,??DataTable8  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable8  ;; 0x400b102c
        STR      R0,[R1, #+0]
//  175     SDHC_IRQSTAT |= SDHC_IRQSTAT_DTOE_MASK;
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100000
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  176 }
        POP      {R0,R4-R7,PC}    ;; return
//  177 
//  178 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  179 U32 SDHC_init(
//  180         /* [IN/OUT] Device runtime information */
//  181         ESDHC_INFO_STRUCT_PTR  esdhc_info_ptr,
//  182 
//  183         /* [IN] Device initialization data */
//  184         ESDHC_INIT_STRUCT_CPTR esdhc_init_ptr
//  185         )   
//  186 {
SDHC_init:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R1
//  187     esdhc_info_ptr->CARD = ESDHC_CARD_NONE;
        MOVS     R1,#+0
        STR      R1,[R4, #+0]
//  188     
//  189     /* Reset ESDHC */
//  190     SDHC_SYSCTL = SDHC_SYSCTL_RSTA_MASK | SDHC_SYSCTL_SDCLKFS(0x80);    
        LDR.W    R1,??DataTable8  ;; 0x400b102c
        LDR.W    R2,??DataTable8_3  ;; 0x1008000
        STR      R2,[R1, #+0]
//  191     while (SDHC_SYSCTL & SDHC_SYSCTL_RSTA_MASK){};
??SDHC_init_0:
        LDR.W    R1,??DataTable8  ;; 0x400b102c
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+7
        BMI.N    ??SDHC_init_0
//  192     
//  193     /* Initial values */
//  194     SDHC_VENDOR = 0;
        LDR.W    R1,??DataTable8_4  ;; 0x400b10c0
        MOVS     R2,#+0
        STR      R2,[R1, #+0]
//  195     SDHC_BLKATTR = SDHC_BLKATTR_BLKCNT(1) | SDHC_BLKATTR_BLKSIZE(512);
        LDR.W    R1,??DataTable8_5  ;; 0x400b1004
        MOVS     R2,#+66048
        STR      R2,[R1, #+0]
//  196     SDHC_PROCTL = SDHC_PROCTL_EMODE(ESDHC_PROCTL_EMODE_INVARIANT) | SDHC_PROCTL_D3CD_MASK; 
        LDR.W    R1,??DataTable8_6  ;; 0x400b1028
        MOVS     R2,#+40
        STR      R2,[R1, #+0]
//  197     SDHC_WML = SDHC_WML_RDWML(1) | SDHC_WML_WRWML(1);
        LDR.W    R1,??DataTable8_7  ;; 0x400b1044
        MOVS     R2,#+65537
        STR      R2,[R1, #+0]
//  198     
//  199     /* Set the ESDHC initial baud rate divider and start */
//  200     SDHC_set_baudrate (esdhc_init_ptr->CLOCK_SPEED,380000);
        LDR.W    R1,??DataTable8_8  ;; 0x5cc60
        LDR      R0,[R0, #+8]
        BL       SDHC_set_baudrate
//  201     
//  202     /* Poll inhibit bits */
//  203     while (SDHC_PRSSTAT & (SDHC_PRSSTAT_CIHB_MASK | SDHC_PRSSTAT_CDIHB_MASK)){};
??SDHC_init_1:
        LDR.W    R0,??DataTable8_2  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x3
        CMP      R0,#+0
        BNE.N    ??SDHC_init_1
//  204 
//  205     /* Init GPIO again */
//  206     PORTE_PCR(0) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D1  */
        LDR.W    R0,??DataTable9_1  ;; 0x4004d000
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  207     PORTE_PCR(1) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D0  */
        LDR.W    R0,??DataTable9_2  ;; 0x4004d004
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  208     PORTE_PCR(2) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_DSE_MASK);                                          /* ESDHC.CLK */
        LDR.W    R0,??DataTable9_3  ;; 0x4004d008
        MOV      R1,#+1088
        STR      R1,[R0, #+0]
//  209     PORTE_PCR(3) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.CMD */
        LDR.W    R0,??DataTable9_4  ;; 0x4004d00c
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  210     PORTE_PCR(4) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D3  */
        LDR.W    R0,??DataTable9_5  ;; 0x4004d010
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  211     PORTE_PCR(5) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D2  */
        LDR.W    R0,??DataTable9_6  ;; 0x4004d014
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  212 
//  213     /* Enable clock gate to SDHC module */
//  214     SIM_SCGC3 |= SIM_SCGC3_SDHC_MASK;
        LDR.W    R0,??DataTable9_7  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.W    R1,??DataTable9_7  ;; 0x40048030
        STR      R0,[R1, #+0]
//  215     
//  216     /* Enable requests */
//  217     SDHC_IRQSTAT = 0xFFFF;
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        MOVW     R1,#+65535
        STR      R1,[R0, #+0]
//  218     SDHC_IRQSTATEN = 	  SDHC_IRQSTATEN_DEBESEN_MASK | SDHC_IRQSTATEN_DCESEN_MASK | SDHC_IRQSTATEN_DTOESEN_MASK 
//  219                          | SDHC_IRQSTATEN_CIESEN_MASK | SDHC_IRQSTATEN_CEBESEN_MASK | SDHC_IRQSTATEN_CCESEN_MASK | SDHC_IRQSTATEN_CTOESEN_MASK 
//  220                          | SDHC_IRQSTATEN_BRRSEN_MASK | SDHC_IRQSTATEN_BWRSEN_MASK | SDHC_IRQSTATEN_CRMSEN_MASK
//  221                          | SDHC_IRQSTATEN_TCSEN_MASK | SDHC_IRQSTATEN_CCSEN_MASK;
        LDR.W    R0,??DataTable10_1  ;; 0x400b1034
        LDR.W    R1,??DataTable10_2  ;; 0x7f00b3
        STR      R1,[R0, #+0]
//  222     
//  223     /* 80 initial clocks */
//  224     SDHC_SYSCTL |= SDHC_SYSCTL_INITA_MASK;
        LDR.W    R0,??DataTable8  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.W    R1,??DataTable8  ;; 0x400b102c
        STR      R0,[R1, #+0]
//  225     while (SDHC_SYSCTL & SDHC_SYSCTL_INITA_MASK){};
??SDHC_init_2:
        LDR.W    R0,??DataTable8  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+4
        BMI.N    ??SDHC_init_2
//  226 
//  227     /* Check card */
//  228     if (SDHC_PRSSTAT & SDHC_PRSSTAT_CINS_MASK)
        LDR.W    R0,??DataTable8_2  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+15
        BPL.N    ??SDHC_init_3
//  229     {
//  230         esdhc_info_ptr->CARD = ESDHC_CARD_UNKNOWN;
        MOVS     R0,#+1
        STR      R0,[R4, #+0]
//  231     }
//  232     SDHC_IRQSTAT |= SDHC_IRQSTAT_CRM_MASK;
??SDHC_init_3:
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  233     
//  234     return ESDHC_OK;
        MOVS     R0,#+0
        POP      {R4,PC}          ;; return
//  235 }
//  236 
//  237 /*FUNCTION****************************************************************
//  238 * 
//  239 * Function Name    : _esdhc_is_running
//  240 * Returned Value   : TRUE if running, FALSE otherwise
//  241 * Comments         :
//  242 *    Checks whether eSDHC module is currently in use.
//  243 *
//  244 *END*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  245 static U8 SDHC_is_running(void)
//  246 {
//  247     return (0 != (SDHC_PRSSTAT & (SDHC_PRSSTAT_RTA_MASK | SDHC_PRSSTAT_WTA_MASK | SDHC_PRSSTAT_DLA_MASK | SDHC_PRSSTAT_CDIHB_MASK | SDHC_PRSSTAT_CIHB_MASK)));
SDHC_is_running:
        LDR.W    R0,??DataTable8_2  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        MOVW     R1,#+775
        TST      R0,R1
        BEQ.N    ??SDHC_is_running_0
        MOVS     R0,#+1
        B.N      ??SDHC_is_running_1
??SDHC_is_running_0:
        MOVS     R0,#+0
??SDHC_is_running_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  248 }   
//  249 
//  250 /*FUNCTION****************************************************************
//  251 * 
//  252 * Function Name    : SDHC_status_wait
//  253 * Returned Value   : bits set for given mask
//  254 * Comments         :
//  255 *    Waits for ESDHC interrupt status register bits according to given mask.
//  256 *
//  257 *END*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  258 static U32 SDHC_status_wait(U32 mask)        /* [IN] Mask of IRQSTAT bits to wait for */
//  259 {
//  260     U32 result;
//  261     do
//  262     {
//  263         result = SDHC_IRQSTAT & mask;
SDHC_status_wait:
??SDHC_status_wait_0:
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        LDR      R1,[R1, #+0]
        ANDS     R1,R0,R1
//  264     } 
//  265     while (0 == result);
        CMP      R1,#+0
        BEQ.N    ??SDHC_status_wait_0
//  266     return result;
        MOVS     R0,R1
        BX       LR               ;; return
//  267 }   
//  268 
//  269 /*FUNCTION****************************************************************
//  270 * 
//  271 * Function Name    : SDHC_send_command
//  272 * Returned Value   : 0 on success, 1 on error, -1 on timeout
//  273 * Comments         :
//  274 *    One ESDHC command transaction.
//  275 *
//  276 *END*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  277 static U32 SDHC_send_command (ESDHC_COMMAND_STRUCT_PTR command) /* [IN/OUT] Command specification */
//  278 {
SDHC_send_command:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  279     U32 xfertyp;
//  280     
//  281     /* Check command */
//  282     xfertyp = ESDHC_COMMAND_XFERTYP[command->COMMAND & 0x3F];
        LDRB     R0,[R4, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable10_3
        LDR      R5,[R1, R0, LSL #+2]
//  283     if ((0 == xfertyp) && (0 != command->COMMAND))
        CMP      R5,#+0
        BNE.N    ??SDHC_send_command_0
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??SDHC_send_command_0
//  284     {
//  285         return 1;
        MOVS     R0,#+1
        B.N      ??SDHC_send_command_1
//  286     }
//  287 
//  288     /* Card removal check preparation */
//  289     SDHC_IRQSTAT |= SDHC_IRQSTAT_CRM_MASK;
??SDHC_send_command_0:
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  290 
//  291     /* Wait for cmd line idle */
//  292     while (SDHC_PRSSTAT & SDHC_PRSSTAT_CIHB_MASK){};
??SDHC_send_command_2:
        LDR.W    R0,??DataTable8_2  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BMI.N    ??SDHC_send_command_2
//  293 
//  294     /* Setup command */
//  295     SDHC_CMDARG = command->ARGUMENT;
        LDR      R0,[R4, #+4]
        LDR.W    R1,??DataTable10_4  ;; 0x400b1008
        STR      R0,[R1, #+0]
//  296     xfertyp &= (~ SDHC_XFERTYP_CMDTYP_MASK);
        BICS     R5,R5,#0xC00000
//  297     xfertyp |= SDHC_XFERTYP_CMDTYP(command->TYPE);
        LDRB     R0,[R4, #+1]
        LSLS     R0,R0,#+22
        ANDS     R0,R0,#0xC00000
        ORRS     R5,R0,R5
//  298     if (ESDHC_TYPE_RESUME == command->TYPE)
        LDRB     R0,[R4, #+1]
        CMP      R0,#+2
        BNE.N    ??SDHC_send_command_3
//  299     {
//  300         xfertyp |= SDHC_XFERTYP_DPSEL_MASK;
        ORRS     R5,R5,#0x200000
//  301     }
//  302     if (ESDHC_TYPE_SWITCH_BUSY == command->TYPE)
??SDHC_send_command_3:
        LDRB     R0,[R4, #+1]
        CMP      R0,#+4
        BNE.N    ??SDHC_send_command_4
//  303     {
//  304         if ((xfertyp & SDHC_XFERTYP_RSPTYP_MASK) == SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48))
        ANDS     R0,R5,#0x30000
        CMP      R0,#+131072
        BNE.N    ??SDHC_send_command_5
//  305         {
//  306             xfertyp &= (~ SDHC_XFERTYP_RSPTYP_MASK);
        BICS     R5,R5,#0x30000
//  307             xfertyp |= SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY);
        ORRS     R5,R5,#0x30000
        B.N      ??SDHC_send_command_4
//  308         }
//  309         else
//  310         {
//  311             xfertyp &= (~ SDHC_XFERTYP_RSPTYP_MASK);
??SDHC_send_command_5:
        BICS     R5,R5,#0x30000
//  312             xfertyp |= SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48);
        ORRS     R5,R5,#0x20000
//  313         }
//  314     }
//  315     SDHC_BLKATTR &= (~ SDHC_BLKATTR_BLKCNT_MASK);
??SDHC_send_command_4:
        LDR.W    R0,??DataTable8_5  ;; 0x400b1004
        LDR      R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.W    R1,??DataTable8_5  ;; 0x400b1004
        STR      R0,[R1, #+0]
//  316     if (0 != command->BLOCKS)
        LDR      R0,[R4, #+12]
        CMP      R0,#+0
        BEQ.N    ??SDHC_send_command_6
//  317     {
//  318         if ((xfertyp & SDHC_XFERTYP_RSPTYP_MASK) != SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY))
        ANDS     R0,R5,#0x30000
        CMP      R0,#+196608
        BEQ.N    ??SDHC_send_command_7
//  319         {
//  320             xfertyp |= SDHC_XFERTYP_DPSEL_MASK;
        ORRS     R5,R5,#0x200000
//  321         }
//  322         if (command->READ)
??SDHC_send_command_7:
        LDRB     R0,[R4, #+8]
        CMP      R0,#+0
        BEQ.N    ??SDHC_send_command_8
//  323         {
//  324             xfertyp |= SDHC_XFERTYP_DTDSEL_MASK;    
        ORRS     R5,R5,#0x10
//  325         }
//  326         if (command->BLOCKS > 1)
??SDHC_send_command_8:
        LDR      R0,[R4, #+12]
        CMP      R0,#+2
        BCC.N    ??SDHC_send_command_9
//  327         {
//  328             xfertyp |= SDHC_XFERTYP_MSBSEL_MASK;    
        ORRS     R5,R5,#0x20
//  329         }
//  330         if ((U32)-1 != command->BLOCKS)
??SDHC_send_command_9:
        LDR      R0,[R4, #+12]
        CMN      R0,#+1
        BEQ.N    ??SDHC_send_command_6
//  331         {
//  332             SDHC_BLKATTR |= SDHC_BLKATTR_BLKCNT(command->BLOCKS);
        LDR.W    R0,??DataTable8_5  ;; 0x400b1004
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+12]
        ORRS     R0,R0,R1, LSL #+16
        LDR.W    R1,??DataTable8_5  ;; 0x400b1004
        STR      R0,[R1, #+0]
//  333             xfertyp |= SDHC_XFERTYP_BCEN_MASK;
        ORRS     R5,R5,#0x2
//  334         }
//  335     }
//  336 
//  337     /* Issue command */
//  338     SDHC_DSADDR = 0;
??SDHC_send_command_6:
        LDR.W    R0,??DataTable11  ;; 0x400b1000
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  339     SDHC_XFERTYP = xfertyp;
        LDR.W    R0,??DataTable11_1  ;; 0x400b100c
        STR      R5,[R0, #+0]
//  340     
//  341     /* Wait for response */
//  342     if (SDHC_status_wait (SDHC_IRQSTAT_CIE_MASK | SDHC_IRQSTAT_CEBE_MASK | SDHC_IRQSTAT_CCE_MASK | SDHC_IRQSTAT_CC_MASK) != SDHC_IRQSTAT_CC_MASK)
        LDR.W    R0,??DataTable11_2  ;; 0xe0001
        BL       SDHC_status_wait
        CMP      R0,#+1
        BEQ.N    ??SDHC_send_command_10
//  343     {
//  344         SDHC_IRQSTAT |= SDHC_IRQSTAT_CTOE_MASK | SDHC_IRQSTAT_CIE_MASK | SDHC_IRQSTAT_CEBE_MASK | SDHC_IRQSTAT_CCE_MASK | SDHC_IRQSTAT_CC_MASK;
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0xF0000
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  345         return 1;
        MOVS     R0,#+1
        B.N      ??SDHC_send_command_1
//  346     }
//  347 
//  348     /* Check card removal */
//  349     if (SDHC_IRQSTAT & SDHC_IRQSTAT_CRM_MASK)
??SDHC_send_command_10:
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??SDHC_send_command_11
//  350     {
//  351         SDHC_IRQSTAT |= SDHC_IRQSTAT_CTOE_MASK | SDHC_IRQSTAT_CC_MASK;
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10001
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  352         return 1;
        MOVS     R0,#+1
        B.N      ??SDHC_send_command_1
//  353     }
//  354 
//  355     /* Get response, if available */
//  356     if (SDHC_IRQSTAT & SDHC_IRQSTAT_CTOE_MASK)
??SDHC_send_command_11:
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+15
        BPL.N    ??SDHC_send_command_12
//  357     {
//  358         SDHC_IRQSTAT |= SDHC_IRQSTAT_CTOE_MASK | SDHC_IRQSTAT_CC_MASK;
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10001
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  359         return -1;
        MOVS     R0,#-1
        B.N      ??SDHC_send_command_1
//  360     }
//  361     if ((xfertyp & SDHC_XFERTYP_RSPTYP_MASK) != SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_NO))
??SDHC_send_command_12:
        TST      R5,#0x30000
        BEQ.N    ??SDHC_send_command_13
//  362     {
//  363         command->RESPONSE[0] = SDHC_CMDRSP(0);
        LDR.W    R0,??DataTable12  ;; 0x400b1010
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+16]
//  364         if ((xfertyp & SDHC_XFERTYP_RSPTYP_MASK) == SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_136))
        ANDS     R0,R5,#0x30000
        CMP      R0,#+65536
        BNE.N    ??SDHC_send_command_13
//  365         {
//  366             command->RESPONSE[1] = SDHC_CMDRSP(1);
        LDR.W    R0,??DataTable14  ;; 0x400b1014
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+20]
//  367             command->RESPONSE[2] = SDHC_CMDRSP(2);
        LDR.W    R0,??DataTable14_1  ;; 0x400b1018
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+24]
//  368             command->RESPONSE[3] = SDHC_CMDRSP(3);
        LDR.W    R0,??DataTable15  ;; 0x400b101c
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+28]
//  369         }
//  370     }
//  371     
//  372     SDHC_IRQSTAT |= SDHC_IRQSTAT_CC_MASK;
??SDHC_send_command_13:
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  373 
//  374     return 0;
        MOVS     R0,#+0
??SDHC_send_command_1:
        POP      {R1,R4,R5,PC}    ;; return
//  375 }
//  376 
//  377 
//  378 /*FUNCTION****************************************************************
//  379 * 
//  380 * Function Name    : _esdhc_ioctl
//  381 * Returned Value   : MQX error code
//  382 * Comments         : 
//  383 *    This function performs miscellaneous services for the ESDHC I/O device.  
//  384 *
//  385 *END*********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  386 S32 SDHC_ioctl
//  387         (
//  388         /* [IN] The command to perform */
//  389         U32              cmd,
//  390         
//  391         /* [IN/OUT] Parameters for the command */
//  392         void                *param_ptr
//  393         )
//  394 {
SDHC_ioctl:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+36
        MOVS     R6,R1
//  395     ESDHC_INFO_STRUCT_PTR   esdhc_info_ptr;
//  396     ESDHC_DEVICE_STRUCT_PTR esdhc_device_ptr;
//  397     ESDHC_INIT_STRUCT_CPTR  esdhc_init_ptr;
//  398     ESDHC_COMMAND_STRUCT    command;
//  399     U8                      mem, io, mmc, ceata, mp, hc;
//  400     U32                  val;
//  401     U32                  result = ESDHC_OK;
        MOVS     R11,#+0
//  402     U32                  *param32_ptr = param_ptr;
//  403 
//  404     /* Check parameters */
//  405     esdhc_info_ptr = (ESDHC_INFO_STRUCT_PTR)&SDHC_Info;
        LDR.W    R4,??DataTable16
//  406     
//  407     if (NULL == esdhc_info_ptr)
        CMP      R4,#+0
        BNE.N    ??SDHC_ioctl_0
//  408     {
//  409         return IO_DEVICE_DOES_NOT_EXIST;
        MOVW     R0,#+2561
        B.N      ??SDHC_ioctl_1
//  410     }
//  411     
//  412     esdhc_device_ptr = &SDHC_Device;
??SDHC_ioctl_0:
        LDR.W    R1,??DataTable16_1
//  413     if (NULL == esdhc_device_ptr)
        CMP      R1,#+0
        BNE.N    ??SDHC_ioctl_2
//  414     {
//  415         return IO_ERROR_DEVICE_INVALID;
        MOVW     R0,#+2571
        B.N      ??SDHC_ioctl_1
//  416     }
//  417     
//  418     esdhc_init_ptr = esdhc_device_ptr->INIT;
??SDHC_ioctl_2:
        LDR      R5,[R1, #+0]
//  419     if (NULL == esdhc_init_ptr)
        CMP      R5,#+0
        BNE.N    ??SDHC_ioctl_3
//  420     {
//  421         return IO_ERROR_DEVICE_INVALID;
        MOVW     R0,#+2571
        B.N      ??SDHC_ioctl_1
//  422     }    
//  423     
//  424     switch (cmd) 
??SDHC_ioctl_3:
        SUBS     R0,R0,#+3
        BEQ.W    ??SDHC_ioctl_4
        SUBS     R0,R0,#+6
        BEQ.W    ??SDHC_ioctl_5
        MOVW     R1,#+4856
        SUBS     R0,R0,R1
        BEQ.N    ??SDHC_ioctl_6
        SUBS     R0,R0,#+1
        BEQ.W    ??SDHC_ioctl_7
        SUBS     R0,R0,#+1
        BEQ.W    ??SDHC_ioctl_8
        SUBS     R0,R0,#+1
        BEQ.W    ??SDHC_ioctl_9
        SUBS     R0,R0,#+1
        BEQ.W    ??SDHC_ioctl_10
        SUBS     R0,R0,#+1
        BEQ.W    ??SDHC_ioctl_11
        SUBS     R0,R0,#+1
        BEQ.W    ??SDHC_ioctl_12
        SUBS     R0,R0,#+1
        BEQ.W    ??SDHC_ioctl_13
        SUBS     R0,R0,#+1
        BEQ.W    ??SDHC_ioctl_14
        B.N      ??SDHC_ioctl_15
//  425     {
//  426         case IO_IOCTL_ESDHC_INIT:
//  427 
//  428             result = SDHC_init (esdhc_info_ptr, &K60_SDHC0_init);
??SDHC_ioctl_6:
        LDR.W    R1,??DataTable16_2
        MOVS     R0,R4
        BL       SDHC_init
        MOV      R11,R0
//  429             if (ESDHC_OK != result)
        CMP      R11,#+0
        BNE.W    ??SDHC_ioctl_16
//  430             {
//  431                 break;
//  432             }
//  433             
//  434             mem = FALSE;
??SDHC_ioctl_17:
        MOVS     R6,#+0
//  435             io = FALSE;
        MOVS     R7,#+0
//  436             mmc = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+32]
//  437             ceata = FALSE;
        MOVS     R8,#+0
//  438             hc = FALSE;
        MOVS     R9,#+0
//  439             mp = FALSE;
        MOVS     R10,#+0
//  440 
//  441             /* CMD0 - Go to idle - reset card */
//  442             command.COMMAND = ESDHC_CMD0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  443             command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  444             command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//  445             command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+8]
//  446             command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  447             if (SDHC_send_command (&command))
        ADD      R0,SP,#+0
        BL       SDHC_send_command
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_18
//  448             {
//  449                 result = ESDHC_ERROR_INIT_FAILED;
        MOVS     R11,#+1
//  450                 break;
        B.N      ??SDHC_ioctl_16
//  451             }
//  452             
//  453             Delay(1100);
??SDHC_ioctl_18:
        MOVW     R0,#+1100
        BL       Delay
//  454 
//  455             /* CMD8 - Send interface condition - check HC support */
//  456             command.COMMAND = ESDHC_CMD8;
        MOVS     R0,#+8
        STRB     R0,[SP, #+0]
//  457             command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  458             command.ARGUMENT = 0x000001AA;
        MOV      R0,#+426
        STR      R0,[SP, #+4]
//  459             command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+8]
//  460             command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  461             val = SDHC_send_command (&command);
        ADD      R0,SP,#+0
        BL       SDHC_send_command
        MOV      R10,R0
//  462             
//  463             if (val == 0)
        CMP      R10,#+0
        BNE.N    ??SDHC_ioctl_19
//  464             {
//  465                 // SDHC Card
//  466                 if (command.RESPONSE[0] != command.ARGUMENT)
        LDR      R0,[SP, #+16]
        LDR      R1,[SP, #+4]
        CMP      R0,R1
        BEQ.N    ??SDHC_ioctl_20
//  467                 {
//  468                     result = ESDHC_ERROR_INIT_FAILED;
        MOVS     R11,#+1
//  469                     break;
        B.N      ??SDHC_ioctl_16
//  470                 }
//  471                 hc = TRUE;
??SDHC_ioctl_20:
        MOVS     R9,#+1
//  472             }
//  473 
//  474             mp = TRUE;
??SDHC_ioctl_19:
        MOVS     R10,#+1
//  475             
//  476             if (mp)
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.W    ??SDHC_ioctl_21
//  477             {
//  478                 /* CMD55 - Application specific command - check MMC */
//  479                 command.COMMAND = ESDHC_CMD55;
        MOVS     R0,#+55
        STRB     R0,[SP, #+0]
//  480                 command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  481                 command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//  482                 command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+8]
//  483                 command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  484                 val = SDHC_send_command (&command);
        ADD      R0,SP,#+0
        BL       SDHC_send_command
        MOV      R10,R0
//  485                 if (val > 0)
        CMP      R10,#+0
        BEQ.N    ??SDHC_ioctl_22
//  486                 {
//  487                     result = ESDHC_ERROR_INIT_FAILED;
        MOVS     R11,#+1
//  488                     break;
        B.N      ??SDHC_ioctl_16
//  489                 }
//  490                 if (val < 0)
//  491                 {
//  492                     /* MMC or CE-ATA */
//  493                     io = FALSE;
//  494                     mem = FALSE;
//  495                     hc = FALSE;
//  496                     
//  497                     /* CMD1 - Send operating conditions - check HC */
//  498                     command.COMMAND = ESDHC_CMD1;
//  499                     command.TYPE = ESDHC_TYPE_NORMAL;
//  500                     command.ARGUMENT = 0x40300000;
//  501                     command.READ = FALSE;
//  502                     command.BLOCKS = 0;
//  503                     if (SDHC_send_command (&command))
//  504                     {
//  505                         result = ESDHC_ERROR_INIT_FAILED;
//  506                         break;
//  507                     }
//  508                     if (0x20000000 == (command.RESPONSE[0] & 0x60000000))
//  509                     {
//  510                         hc = TRUE;
//  511                     }
//  512                     mmc = TRUE;
//  513 
//  514                     /* CMD39 - Fast IO - check CE-ATA signature CE */
//  515                     command.COMMAND = ESDHC_CMD39;
//  516                     command.TYPE = ESDHC_TYPE_NORMAL;
//  517                     command.ARGUMENT = 0x0C00;
//  518                     command.READ = FALSE;
//  519                     command.BLOCKS = 0;
//  520                     if (SDHC_send_command (&command))
//  521                     {
//  522                         result = ESDHC_ERROR_INIT_FAILED;
//  523                         break;
//  524                     }
//  525                     if (0xCE == (command.RESPONSE[0] >> 8) & 0xFF)
//  526                     {
//  527                         /* CMD39 - Fast IO - check CE-ATA signature AA */
//  528                         command.COMMAND = ESDHC_CMD39;
//  529                         command.TYPE = ESDHC_TYPE_NORMAL;
//  530                         command.ARGUMENT = 0x0D00;
//  531                         command.READ = FALSE;
//  532                         command.BLOCKS = 0;
//  533                         if (SDHC_send_command (&command))
//  534                         {
//  535                             result = ESDHC_ERROR_INIT_FAILED;
//  536                             break;
//  537                         }
//  538                         if (0xAA == (command.RESPONSE[0] >> 8) & 0xFF)
//  539                         {
//  540                             mmc = FALSE;
//  541                             ceata = TRUE;
//  542                         }
//  543                     }
//  544                 }
//  545                 else
//  546                 {
//  547                     /* SD */
//  548                     /* ACMD41 - Send Operating Conditions */
//  549                     command.COMMAND = ESDHC_ACMD41;
??SDHC_ioctl_22:
        MOVS     R0,#+105
        STRB     R0,[SP, #+0]
//  550                     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  551                     command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//  552                     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+8]
//  553                     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  554                     if (SDHC_send_command (&command))
        ADD      R0,SP,#+0
        BL       SDHC_send_command
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_23
//  555                     {
//  556                         result = ESDHC_ERROR_INIT_FAILED;
        MOVS     R11,#+1
//  557                         break;
        B.N      ??SDHC_ioctl_16
//  558                     }
//  559                     if (command.RESPONSE[0] & 0x300000)
??SDHC_ioctl_23:
        LDR      R0,[SP, #+16]
        TST      R0,#0x300000
        BEQ.N    ??SDHC_ioctl_21
//  560                     {
//  561                         val = 0;
        MOVS     R10,#+0
//  562                         do 
//  563                         {
//  564                             Delay(BSP_ALARM_RESOLUTION);
??SDHC_ioctl_24:
        MOVS     R0,#+10
        BL       Delay
//  565                             val++;
        ADDS     R10,R10,#+1
//  566                             
//  567                             /* CMD55 + ACMD41 - Send OCR */
//  568                             command.COMMAND = ESDHC_CMD55;
        MOVS     R0,#+55
        STRB     R0,[SP, #+0]
//  569                             command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  570                             command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//  571                             command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+8]
//  572                             command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  573                             if (SDHC_send_command (&command))
        ADD      R0,SP,#+0
        BL       SDHC_send_command
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_25
//  574                             {
//  575                                 result = ESDHC_ERROR_INIT_FAILED;
        MOVS     R11,#+1
//  576                                 break;
        B.N      ??SDHC_ioctl_26
//  577                             }
//  578 
//  579                             command.COMMAND = ESDHC_ACMD41;
??SDHC_ioctl_25:
        MOVS     R0,#+105
        STRB     R0,[SP, #+0]
//  580                             command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  581                             if (hc)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??SDHC_ioctl_27
//  582                             {
//  583                                 command.ARGUMENT = 0x40300000;
        LDR.W    R0,??DataTable16_3  ;; 0x40300000
        STR      R0,[SP, #+4]
        B.N      ??SDHC_ioctl_28
//  584                             }
//  585                             else
//  586                             {
//  587                                 command.ARGUMENT = 0x00300000;
??SDHC_ioctl_27:
        MOVS     R0,#+3145728
        STR      R0,[SP, #+4]
//  588                             }
//  589                             command.READ = FALSE;
??SDHC_ioctl_28:
        MOVS     R0,#+0
        STRB     R0,[SP, #+8]
//  590                             command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  591                             if (SDHC_send_command (&command))
        ADD      R0,SP,#+0
        BL       SDHC_send_command
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_29
//  592                             {
//  593                                 result = ESDHC_ERROR_INIT_FAILED;
        MOVS     R11,#+1
//  594                                 break;
        B.N      ??SDHC_ioctl_26
//  595                             }
//  596                         } while ((0 == (command.RESPONSE[0] & 0x80000000)) && (val < BSP_ALARM_FREQUENCY));
??SDHC_ioctl_29:
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BMI.N    ??SDHC_ioctl_26
        CMP      R10,#+100
        BCC.N    ??SDHC_ioctl_24
//  597                         if (ESDHC_OK != result)
??SDHC_ioctl_26:
        CMP      R11,#+0
        BNE.W    ??SDHC_ioctl_16
//  598                         {
//  599                             break;
//  600                         }
//  601                         if (val >= BSP_ALARM_FREQUENCY)
??SDHC_ioctl_30:
        CMP      R10,#+100
        BCC.N    ??SDHC_ioctl_31
//  602                         {
//  603                             hc = FALSE;
        MOVS     R9,#+0
        B.N      ??SDHC_ioctl_21
//  604                         }
//  605                         else
//  606                         {
//  607                             mem = TRUE;
??SDHC_ioctl_31:
        MOVS     R6,#+1
//  608                             if (hc)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??SDHC_ioctl_21
//  609                             {
//  610                                 hc = FALSE;
        MOVS     R9,#+0
//  611                                 if (command.RESPONSE[0] & 0x40000000)
        LDR      R0,[SP, #+16]
        LSLS     R0,R0,#+1
        BPL.N    ??SDHC_ioctl_21
//  612                                 {
//  613                                     hc = TRUE;
        MOVS     R9,#+1
//  614                                 }
//  615                             }
//  616                         }
//  617                     }
//  618                 }
//  619             }
//  620             
//  621             
//  622             if (mmc)
??SDHC_ioctl_21:
        LDRB     R0,[SP, #+32]
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_32
//  623             {
//  624                 esdhc_info_ptr->CARD = ESDHC_CARD_MMC;
        MOVS     R0,#+7
        STR      R0,[R4, #+0]
//  625             }
//  626             if (ceata)
??SDHC_ioctl_32:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??SDHC_ioctl_33
//  627             {
//  628                 esdhc_info_ptr->CARD = ESDHC_CARD_CEATA;
        MOVS     R0,#+8
        STR      R0,[R4, #+0]
//  629             }
//  630             if (io)
??SDHC_ioctl_33:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??SDHC_ioctl_34
//  631             {
//  632                 esdhc_info_ptr->CARD = ESDHC_CARD_SDIO;
        MOVS     R0,#+4
        STR      R0,[R4, #+0]
//  633             }
//  634             if (mem)
??SDHC_ioctl_34:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SDHC_ioctl_35
//  635             {
//  636                 esdhc_info_ptr->CARD = ESDHC_CARD_SD;
        MOVS     R0,#+2
        STR      R0,[R4, #+0]
//  637                 if (hc)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??SDHC_ioctl_35
//  638                 {
//  639                     esdhc_info_ptr->CARD = ESDHC_CARD_SDHC;
        MOVS     R0,#+3
        STR      R0,[R4, #+0]
//  640                 }
//  641             }
//  642             if (io && mem)
??SDHC_ioctl_35:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??SDHC_ioctl_36
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SDHC_ioctl_36
//  643             {
//  644                 esdhc_info_ptr->CARD = ESDHC_CARD_SDCOMBO;
        MOVS     R0,#+5
        STR      R0,[R4, #+0]
//  645                 if (hc)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??SDHC_ioctl_36
//  646                 {
//  647                     esdhc_info_ptr->CARD = ESDHC_CARD_SDHCCOMBO;
        MOVS     R0,#+6
        STR      R0,[R4, #+0]
//  648                 }
//  649             }
//  650 
//  651             /* De-Init GPIO */
//  652             PORTE_PCR(0) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D1  */
??SDHC_ioctl_36:
        LDR.W    R0,??DataTable9_1  ;; 0x4004d000
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  653             PORTE_PCR(1) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D0  */
        LDR.W    R0,??DataTable9_2  ;; 0x4004d004
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  654             PORTE_PCR(2) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_DSE_MASK);                                          /* ESDHC.CLK */
        LDR.W    R0,??DataTable9_3  ;; 0x4004d008
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  655             PORTE_PCR(3) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.CMD */
        LDR.W    R0,??DataTable9_4  ;; 0x4004d00c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  656             PORTE_PCR(4) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D3  */
        LDR.W    R0,??DataTable9_5  ;; 0x4004d010
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  657             PORTE_PCR(5) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D2  */
        LDR.W    R0,??DataTable9_6  ;; 0x4004d014
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  658 
//  659             /* Set the ESDHC default baud rate */
//  660             SDHC_set_baudrate (esdhc_init_ptr->CLOCK_SPEED, esdhc_init_ptr->BAUD_RATE);
        LDR      R1,[R5, #+4]
        LDR      R0,[R5, #+8]
        BL       SDHC_set_baudrate
//  661 
//  662             /* Init GPIO again */
//  663             PORTE_PCR(0) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D1  */
        LDR.W    R0,??DataTable9_1  ;; 0x4004d000
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  664             PORTE_PCR(1) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D0  */
        LDR.W    R0,??DataTable9_2  ;; 0x4004d004
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  665             PORTE_PCR(2) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_DSE_MASK);                                          /* ESDHC.CLK */
        LDR.W    R0,??DataTable9_3  ;; 0x4004d008
        MOV      R1,#+1088
        STR      R1,[R0, #+0]
//  666             PORTE_PCR(3) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.CMD */
        LDR.W    R0,??DataTable9_4  ;; 0x4004d00c
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  667             PORTE_PCR(4) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D3  */
        LDR.W    R0,??DataTable9_5  ;; 0x4004d010
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  668             PORTE_PCR(5) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D2  */
        LDR.W    R0,??DataTable9_6  ;; 0x4004d014
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  669 
//  670             /* Enable clock gate to SDHC module */
//  671             SIM_SCGC3 |= SIM_SCGC3_SDHC_MASK;
        LDR.W    R0,??DataTable9_7  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.W    R1,??DataTable9_7  ;; 0x40048030
        STR      R0,[R1, #+0]
//  672             
//  673             break;
        B.N      ??SDHC_ioctl_16
//  674         case IO_IOCTL_ESDHC_SEND_COMMAND:
//  675             val = SDHC_send_command ((ESDHC_COMMAND_STRUCT_PTR)param32_ptr);
??SDHC_ioctl_7:
        MOVS     R0,R6
        BL       SDHC_send_command
        MOV      R10,R0
//  676             if (val > 0)
        CMP      R10,#+0
        BEQ.N    ??SDHC_ioctl_37
//  677             {
//  678                 result = ESDHC_ERROR_COMMAND_FAILED;
        MOVS     R11,#+2
//  679             }
//  680             if (val < 0)
//  681             {
//  682                 result = ESDHC_ERROR_COMMAND_TIMEOUT;
//  683             }
//  684             break;
??SDHC_ioctl_37:
        B.N      ??SDHC_ioctl_16
//  685         case IO_IOCTL_ESDHC_GET_BAUDRATE:
//  686             if (NULL == param32_ptr) 
??SDHC_ioctl_9:
        CMP      R6,#+0
        BNE.N    ??SDHC_ioctl_38
//  687             {
//  688                 result = BRTOS_INVALID_PARAMETER;
        MOVS     R11,#+12
        B.N      ??SDHC_ioctl_39
//  689             } 
//  690             else 
//  691             {
//  692                 /* Get actual baudrate */
//  693                 val = ((SDHC_SYSCTL & SDHC_SYSCTL_SDCLKFS_MASK) >> SDHC_SYSCTL_SDCLKFS_SHIFT) << 1;
??SDHC_ioctl_38:
        LDR.W    R0,??DataTable8  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+7
        ANDS     R10,R0,#0x1FE
//  694                 val *= ((SDHC_SYSCTL & SDHC_SYSCTL_DVS_MASK) >> SDHC_SYSCTL_DVS_SHIFT) + 1;
        LDR.W    R0,??DataTable8  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+4,#+4
        ADDS     R0,R0,#+1
        MUL      R10,R0,R10
//  695                 *param32_ptr = (U32)((esdhc_init_ptr->CLOCK_SPEED) / val);
        LDR      R0,[R5, #+8]
        UDIV     R0,R0,R10
        STR      R0,[R6, #+0]
//  696             }
//  697             break;
??SDHC_ioctl_39:
        B.N      ??SDHC_ioctl_16
//  698         case IO_IOCTL_ESDHC_SET_BAUDRATE:
//  699             if (NULL == param32_ptr) 
??SDHC_ioctl_10:
        CMP      R6,#+0
        BNE.N    ??SDHC_ioctl_40
//  700             {
//  701                 result = BRTOS_INVALID_PARAMETER;
        MOVS     R11,#+12
        B.N      ??SDHC_ioctl_41
//  702             } 
//  703             else if (0 == (*param32_ptr)) 
??SDHC_ioctl_40:
        LDR      R0,[R6, #+0]
        CMP      R0,#+0
        BNE.N    ??SDHC_ioctl_42
//  704             {
//  705                 result = BRTOS_INVALID_PARAMETER;
        MOVS     R11,#+12
        B.N      ??SDHC_ioctl_41
//  706             } 
//  707             else 
//  708             {
//  709                 if (! SDHC_is_running())
??SDHC_ioctl_42:
        BL       SDHC_is_running
        CMP      R0,#+0
        BNE.N    ??SDHC_ioctl_43
//  710                 {
//  711                     /* De-Init GPIO */
//  712                     PORTE_PCR(0) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D1  */
        LDR.W    R0,??DataTable9_1  ;; 0x4004d000
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  713                     PORTE_PCR(1) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D0  */
        LDR.W    R0,??DataTable9_2  ;; 0x4004d004
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  714                     PORTE_PCR(2) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_DSE_MASK);                                          /* ESDHC.CLK */
        LDR.W    R0,??DataTable9_3  ;; 0x4004d008
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  715                     PORTE_PCR(3) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.CMD */
        LDR.W    R0,??DataTable9_4  ;; 0x4004d00c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  716                     PORTE_PCR(4) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D3  */
        LDR.W    R0,??DataTable9_5  ;; 0x4004d010
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  717                     PORTE_PCR(5) = 0 & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D2  */
        LDR.W    R0,??DataTable9_6  ;; 0x4004d014
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  718 
//  719                     /* Set closest baudrate */
//  720                     SDHC_set_baudrate (esdhc_init_ptr->CLOCK_SPEED, *param32_ptr);
        LDR      R1,[R6, #+0]
        LDR      R0,[R5, #+8]
        BL       SDHC_set_baudrate
//  721 
//  722                     /* Init GPIO again */
//  723                     PORTE_PCR(0) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D1  */
        LDR.W    R0,??DataTable9_1  ;; 0x4004d000
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  724                     PORTE_PCR(1) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D0  */
        LDR.W    R0,??DataTable9_2  ;; 0x4004d004
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  725                     PORTE_PCR(2) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_DSE_MASK);                                          /* ESDHC.CLK */
        LDR.W    R0,??DataTable9_3  ;; 0x4004d008
        MOV      R1,#+1088
        STR      R1,[R0, #+0]
//  726                     PORTE_PCR(3) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.CMD */
        LDR.W    R0,??DataTable9_4  ;; 0x4004d00c
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  727                     PORTE_PCR(4) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D3  */
        LDR.W    R0,??DataTable9_5  ;; 0x4004d010
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  728                     PORTE_PCR(5) = 0xFFFF & (PORT_PCR_MUX(4) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK | PORT_PCR_DSE_MASK);    /* ESDHC.D2  */
        LDR.W    R0,??DataTable9_6  ;; 0x4004d014
        MOVW     R1,#+1091
        STR      R1,[R0, #+0]
//  729 
//  730                     /* Enable clock gate to SDHC module */
//  731                     SIM_SCGC3 |= SIM_SCGC3_SDHC_MASK;
        LDR.W    R0,??DataTable9_7  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.W    R1,??DataTable9_7  ;; 0x40048030
        STR      R0,[R1, #+0]
        B.N      ??SDHC_ioctl_41
//  732                 }
//  733                 else
//  734                 {
//  735                     result = IO_ERROR_DEVICE_BUSY;
??SDHC_ioctl_43:
        MOVW     R11,#+2570
//  736                 }
//  737             }
//  738             break;
??SDHC_ioctl_41:
        B.N      ??SDHC_ioctl_16
//  739         case IO_IOCTL_ESDHC_GET_BLOCK_SIZE:
//  740             if (NULL == param32_ptr) 
??SDHC_ioctl_13:
        CMP      R6,#+0
        BNE.N    ??SDHC_ioctl_44
//  741             {
//  742                 result = BRTOS_INVALID_PARAMETER;
        MOVS     R11,#+12
        B.N      ??SDHC_ioctl_45
//  743             } 
//  744             else 
//  745             {
//  746                 /* Get actual ESDHC block size */
//  747                 *param32_ptr = (SDHC_BLKATTR & SDHC_BLKATTR_BLKSIZE_MASK) >> SDHC_BLKATTR_BLKSIZE_SHIFT;
??SDHC_ioctl_44:
        LDR.W    R0,??DataTable8_5  ;; 0x400b1004
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+19       ;; ZeroExtS R0,R0,#+19,#+19
        LSRS     R0,R0,#+19
        STR      R0,[R6, #+0]
//  748             }       
//  749             break;
??SDHC_ioctl_45:
        B.N      ??SDHC_ioctl_16
//  750         case IO_IOCTL_ESDHC_SET_BLOCK_SIZE:
//  751             if (NULL == param32_ptr) 
??SDHC_ioctl_14:
        CMP      R6,#+0
        BNE.N    ??SDHC_ioctl_46
//  752             {
//  753                 result = BRTOS_INVALID_PARAMETER;
        MOVS     R11,#+12
        B.N      ??SDHC_ioctl_47
//  754             } 
//  755             else 
//  756             {
//  757                 /* Set actual ESDHC block size */
//  758                 if (! SDHC_is_running())
??SDHC_ioctl_46:
        BL       SDHC_is_running
        CMP      R0,#+0
        BNE.N    ??SDHC_ioctl_48
//  759                 {
//  760                     if (*param32_ptr > 0x0FFF)
        LDR      R0,[R6, #+0]
        CMP      R0,#+4096
        BCC.N    ??SDHC_ioctl_49
//  761                     {
//  762                         result = BRTOS_INVALID_PARAMETER;
        MOVS     R11,#+12
        B.N      ??SDHC_ioctl_47
//  763                     }
//  764                     else
//  765                     {
//  766                         SDHC_BLKATTR &= (~ SDHC_BLKATTR_BLKSIZE_MASK); 
??SDHC_ioctl_49:
        LDR.W    R0,??DataTable8_5  ;; 0x400b1004
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+13
        LSLS     R0,R0,#+13
        LDR.W    R1,??DataTable8_5  ;; 0x400b1004
        STR      R0,[R1, #+0]
//  767                         SDHC_BLKATTR |= SDHC_BLKATTR_BLKSIZE(*param32_ptr);
        LDR.W    R0,??DataTable8_5  ;; 0x400b1004
        LDR      R0,[R0, #+0]
        LDR      R1,[R6, #+0]
        LSLS     R1,R1,#+19       ;; ZeroExtS R1,R1,#+19,#+19
        LSRS     R1,R1,#+19
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable8_5  ;; 0x400b1004
        STR      R0,[R1, #+0]
        B.N      ??SDHC_ioctl_47
//  768                     }
//  769                 }
//  770                 else
//  771                 {
//  772                     result = IO_ERROR_DEVICE_BUSY;
??SDHC_ioctl_48:
        MOVW     R11,#+2570
//  773                 }
//  774             }       
//  775             break;
??SDHC_ioctl_47:
        B.N      ??SDHC_ioctl_16
//  776         case IO_IOCTL_ESDHC_GET_BUS_WIDTH:
//  777             if (NULL == param32_ptr) 
??SDHC_ioctl_11:
        CMP      R6,#+0
        BNE.N    ??SDHC_ioctl_50
//  778             {
//  779                 result = BRTOS_INVALID_PARAMETER;
        MOVS     R11,#+12
        B.N      ??SDHC_ioctl_51
//  780             } 
//  781             else 
//  782             {
//  783                 /* Get actual ESDHC bus width */
//  784                 val = (SDHC_PROCTL & SDHC_PROCTL_DTW_MASK) >> SDHC_PROCTL_DTW_SHIFT;
??SDHC_ioctl_50:
        LDR.W    R0,??DataTable8_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        UBFX     R10,R0,#+1,#+2
//  785                 if (ESDHC_PROCTL_DTW_1BIT == val)
        CMP      R10,#+0
        BNE.N    ??SDHC_ioctl_52
//  786                 {
//  787                     *param32_ptr = ESDHC_BUS_WIDTH_1BIT;
        MOVS     R0,#+0
        STR      R0,[R6, #+0]
        B.N      ??SDHC_ioctl_51
//  788                 }
//  789                 else if (ESDHC_PROCTL_DTW_4BIT == val)
??SDHC_ioctl_52:
        CMP      R10,#+1
        BNE.N    ??SDHC_ioctl_53
//  790                 {
//  791                     *param32_ptr = ESDHC_BUS_WIDTH_4BIT;
        MOVS     R0,#+1
        STR      R0,[R6, #+0]
        B.N      ??SDHC_ioctl_51
//  792                 }
//  793                 else if (ESDHC_PROCTL_DTW_8BIT == val)
??SDHC_ioctl_53:
        CMP      R10,#+16
        BNE.N    ??SDHC_ioctl_54
//  794                 {
//  795                     *param32_ptr = ESDHC_BUS_WIDTH_8BIT;
        MOVS     R0,#+2
        STR      R0,[R6, #+0]
        B.N      ??SDHC_ioctl_51
//  796                 }
//  797                 else
//  798                 {
//  799                     result = ESDHC_ERROR_INVALID_BUS_WIDTH; 
??SDHC_ioctl_54:
        MOVS     R11,#+5
//  800                 }
//  801             }       
//  802             break;
??SDHC_ioctl_51:
        B.N      ??SDHC_ioctl_16
//  803         case IO_IOCTL_ESDHC_SET_BUS_WIDTH:
//  804             if (NULL == param32_ptr) 
??SDHC_ioctl_12:
        CMP      R6,#+0
        BNE.N    ??SDHC_ioctl_55
//  805             {
//  806                 result = BRTOS_INVALID_PARAMETER;
        MOVS     R11,#+12
        B.N      ??SDHC_ioctl_56
//  807             } 
//  808             else 
//  809             {
//  810                 /* Set actual ESDHC bus width */
//  811                 if (! SDHC_is_running())
??SDHC_ioctl_55:
        BL       SDHC_is_running
        CMP      R0,#+0
        BNE.N    ??SDHC_ioctl_57
//  812                 {
//  813                     if (ESDHC_BUS_WIDTH_1BIT == *param32_ptr)
        LDR      R0,[R6, #+0]
        CMP      R0,#+0
        BNE.N    ??SDHC_ioctl_58
//  814                     {
//  815                         SDHC_PROCTL &= (~ SDHC_PROCTL_DTW_MASK);
        LDR.W    R0,??DataTable8_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x6
        LDR.W    R1,??DataTable8_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
//  816                         SDHC_PROCTL |= SDHC_PROCTL_DTW(ESDHC_PROCTL_DTW_1BIT);
        LDR.W    R0,??DataTable8_6  ;; 0x400b1028
        LDR.W    R1,??DataTable8_6  ;; 0x400b1028
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
        B.N      ??SDHC_ioctl_56
//  817                     }
//  818                     else if (ESDHC_BUS_WIDTH_4BIT == *param32_ptr)
??SDHC_ioctl_58:
        LDR      R0,[R6, #+0]
        CMP      R0,#+1
        BNE.N    ??SDHC_ioctl_59
//  819                     {
//  820                         SDHC_PROCTL &= (~ SDHC_PROCTL_DTW_MASK);
        LDR.W    R0,??DataTable8_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x6
        LDR.W    R1,??DataTable8_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
//  821                         SDHC_PROCTL |= SDHC_PROCTL_DTW(ESDHC_PROCTL_DTW_4BIT);
        LDR.W    R0,??DataTable8_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable8_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
        B.N      ??SDHC_ioctl_56
//  822                     }
//  823                     else if (ESDHC_BUS_WIDTH_8BIT == *param32_ptr)
??SDHC_ioctl_59:
        LDR      R0,[R6, #+0]
        CMP      R0,#+2
        BNE.N    ??SDHC_ioctl_60
//  824                     {
//  825                         SDHC_PROCTL &= (~ SDHC_PROCTL_DTW_MASK);
        LDR.W    R0,??DataTable8_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x6
        LDR.W    R1,??DataTable8_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
//  826                         SDHC_PROCTL |= SDHC_PROCTL_DTW(ESDHC_PROCTL_DTW_8BIT);
        LDR.W    R0,??DataTable8_6  ;; 0x400b1028
        LDR.W    R1,??DataTable8_6  ;; 0x400b1028
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
        B.N      ??SDHC_ioctl_56
//  827                     }
//  828                     else
//  829                     {
//  830                         result = ESDHC_ERROR_INVALID_BUS_WIDTH; 
??SDHC_ioctl_60:
        MOVS     R11,#+5
        B.N      ??SDHC_ioctl_56
//  831                     }
//  832                 }
//  833                 else
//  834                 {
//  835                     result = IO_ERROR_DEVICE_BUSY;
??SDHC_ioctl_57:
        MOVW     R11,#+2570
//  836                 }
//  837             }       
//  838             break;
??SDHC_ioctl_56:
        B.N      ??SDHC_ioctl_16
//  839         case IO_IOCTL_ESDHC_GET_CARD:
//  840             if (NULL == param32_ptr) 
??SDHC_ioctl_8:
        CMP      R6,#+0
        BNE.N    ??SDHC_ioctl_61
//  841             {
//  842                 result = BRTOS_INVALID_PARAMETER;
        MOVS     R11,#+12
        B.N      ??SDHC_ioctl_62
//  843             } 
//  844             else 
//  845             {
//  846                 /* 80 clocks to update levels */
//  847                 SDHC_SYSCTL |= SDHC_SYSCTL_INITA_MASK;
??SDHC_ioctl_61:
        LDR.W    R0,??DataTable8  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.W    R1,??DataTable8  ;; 0x400b102c
        STR      R0,[R1, #+0]
//  848                 while (SDHC_SYSCTL & SDHC_SYSCTL_INITA_MASK)
??SDHC_ioctl_63:
        LDR.W    R0,??DataTable8  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+4
        BMI.N    ??SDHC_ioctl_63
//  849                     { };
//  850                     
//  851                 /* Update and return actual card status */
//  852                 if (SDHC_IRQSTAT & SDHC_IRQSTAT_CRM_MASK)
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??SDHC_ioctl_64
//  853                 {
//  854                     SDHC_IRQSTAT |= SDHC_IRQSTAT_CRM_MASK;
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  855                     esdhc_info_ptr->CARD = ESDHC_CARD_NONE;
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
//  856                 }
//  857                 if (SDHC_PRSSTAT & SDHC_PRSSTAT_CINS_MASK)
??SDHC_ioctl_64:
        LDR.W    R0,??DataTable8_2  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+15
        BPL.N    ??SDHC_ioctl_65
//  858                 {
//  859                     if (ESDHC_CARD_NONE == esdhc_info_ptr->CARD)
        LDR      R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??SDHC_ioctl_66
//  860                     {
//  861                         esdhc_info_ptr->CARD = ESDHC_CARD_UNKNOWN;
        MOVS     R0,#+1
        STR      R0,[R4, #+0]
        B.N      ??SDHC_ioctl_66
//  862                     }
//  863                 }
//  864                 else
//  865                 {
//  866                     esdhc_info_ptr->CARD = ESDHC_CARD_NONE;
??SDHC_ioctl_65:
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
//  867                 }
//  868                 *param32_ptr = esdhc_info_ptr->CARD;
??SDHC_ioctl_66:
        LDR      R0,[R4, #+0]
        STR      R0,[R6, #+0]
//  869             }
//  870             break;
??SDHC_ioctl_62:
        B.N      ??SDHC_ioctl_16
//  871         case IO_IOCTL_DEVICE_IDENTIFY:
//  872             /* Get ESDHC device parameters */
//  873             param32_ptr[IO_IOCTL_ID_PHY_ELEMENT]  = IO_DEV_TYPE_PHYS_ESDHC;
??SDHC_ioctl_5:
        MOVS     R0,#+28
        STR      R0,[R6, #+0]
//  874             param32_ptr[IO_IOCTL_ID_LOG_ELEMENT]  = IO_DEV_TYPE_LOGICAL_MFS;
        MOVS     R0,#+4
        STR      R0,[R6, #+4]
//  875             param32_ptr[IO_IOCTL_ID_ATTR_ELEMENT] = IO_ESDHC_ATTRIBS;
        MOV      R0,#+632
        STR      R0,[R6, #+8]
//  876             /*
//  877             if (esdhc_fd_ptr->FLAGS & IO_O_RDONLY)
//  878             {
//  879                 param32_ptr[IO_IOCTL_ID_ATTR_ELEMENT] &= (~ IO_DEV_ATTR_WRITE);
//  880             }
//  881             */
//  882             break;
        B.N      ??SDHC_ioctl_16
//  883         case IO_IOCTL_FLUSH_OUTPUT:
//  884             /* Wait for transfer complete */
//  885             SDHC_status_wait (SDHC_IRQSTAT_TC_MASK);
??SDHC_ioctl_4:
        MOVS     R0,#+2
        BL       SDHC_status_wait
//  886             if (SDHC_IRQSTAT & (SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK))
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        TST      R0,#0x700000
        BEQ.N    ??SDHC_ioctl_67
//  887             {
//  888                 SDHC_IRQSTAT |= SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK;
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x700000
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  889                 result = ESDHC_ERROR_DATA_TRANSFER;
        MOVS     R11,#+4
//  890             }
//  891             SDHC_IRQSTAT |= SDHC_IRQSTAT_TC_MASK | SDHC_IRQSTAT_BRR_MASK | SDHC_IRQSTAT_BWR_MASK;
??SDHC_ioctl_67:
        LDR.W    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x32
        LDR.W    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  892             break;
        B.N      ??SDHC_ioctl_16
//  893         default:
//  894             result = IO_ERROR_INVALID_IOCTL_CMD;
??SDHC_ioctl_15:
        MOVW     R11,#+2569
//  895             break;
//  896     }
//  897     return result;
??SDHC_ioctl_16:
        MOV      R0,R11
??SDHC_ioctl_1:
        ADD      SP,SP,#+36
        POP      {R4-R11,PC}      ;; return
//  898 }
//  899 
//  900 
//  901 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  902 U8 disk_initialize (unsigned char drv)
//  903 {
disk_initialize:
        PUSH     {R4,LR}
        SUB      SP,SP,#+40
//  904     U32                 param, c_size, c_size_mult, read_bl_len;
//  905     ESDHC_COMMAND_STRUCT    command;
//  906     ESDHC_DEVICE_STRUCT_PTR     esdhc_device_ptr = &SDHC_Device;
        LDR.W    R1,??DataTable16_1
//  907     SDCARD_STRUCT_PTR   sdcard_ptr = (SDCARD_STRUCT_PTR)&SDHC_Card;
        LDR.W    R4,??DataTable16_4
//  908     sdcard_ptr->INIT =  &SDHC_Init;
        LDR.W    R2,??DataTable16_5
        STR      R2,[R4, #+0]
//  909     
//  910     if (drv) return STA_NOINIT;         /* Supports only single drive */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_0
        MOVS     R0,#+1
        B.N      ??disk_initialize_1
//  911     if (Stat & STA_NODISK) return Stat; /* No card in the socket */
??disk_initialize_0:
        LDR.W    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??disk_initialize_2
        LDR.W    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
        B.N      ??disk_initialize_1
//  912     if ((Stat & 0x03) == 0) return 0;
??disk_initialize_2:
        LDR.W    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
        MOVS     R2,#+3
        TST      R0,R2
        BNE.N    ??disk_initialize_3
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  913     
//  914     /* Check parameters */
//  915     if ((NULL == sdcard_ptr) || (NULL == sdcard_ptr->INIT))
??disk_initialize_3:
        CMP      R4,#+0
        BEQ.N    ??disk_initialize_4
        LDR      R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??disk_initialize_5
//  916     {
//  917         return FALSE;
??disk_initialize_4:
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  918     }
//  919     
//  920     esdhc_device_ptr->INIT = &K60_SDHC0_init;
??disk_initialize_5:
        LDR.W    R0,??DataTable16_2
        STR      R0,[R1, #+0]
//  921     // Indicates one SDHC open
//  922     esdhc_device_ptr->COUNT = 1;
        MOVS     R0,#+1
        STR      R0,[R1, #+4]
//  923 
//  924     sdcard_ptr->SD_TIMEOUT = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+4]
//  925     sdcard_ptr->NUM_BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
//  926     sdcard_ptr->ADDRESS = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
//  927     sdcard_ptr->SDHC = FALSE;
        MOVS     R0,#+0
        STRB     R0,[R4, #+12]
//  928     sdcard_ptr->VERSION2 = FALSE;
        MOVS     R0,#+0
        STRB     R0,[R4, #+13]
//  929     
//  930     /* Enable clock gate to SDHC module */
//  931     SIM_SCGC3 |= SIM_SCGC3_SDHC_MASK;
        LDR.W    R0,??DataTable9_7  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.W    R1,??DataTable9_7  ;; 0x40048030
        STR      R0,[R1, #+0]
//  932     
//  933     /* Initialize and detect card */
//  934     if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_INIT, NULL))
        MOVS     R1,#+0
        MOVW     R0,#+4865
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_6
//  935     {
//  936         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  937     }
//  938 
//  939     /* SDHC check */
//  940     param = 0;
??disk_initialize_6:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  941     if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_GET_CARD, &param))
        ADD      R1,SP,#+0
        MOVW     R0,#+4867
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_7
//  942     {
//  943         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  944     }
//  945     if ((ESDHC_CARD_SD == param) || (ESDHC_CARD_SDHC == param) || (ESDHC_CARD_SDCOMBO == param) || (ESDHC_CARD_SDHCCOMBO == param))
??disk_initialize_7:
        LDR      R0,[SP, #+0]
        CMP      R0,#+2
        BEQ.N    ??disk_initialize_8
        LDR      R0,[SP, #+0]
        CMP      R0,#+3
        BEQ.N    ??disk_initialize_8
        LDR      R0,[SP, #+0]
        CMP      R0,#+5
        BEQ.N    ??disk_initialize_8
        LDR      R0,[SP, #+0]
        CMP      R0,#+6
        BNE.N    ??disk_initialize_9
//  946     {
//  947         if ((ESDHC_CARD_SDHC == param) || (ESDHC_CARD_SDHCCOMBO == param))
??disk_initialize_8:
        LDR      R0,[SP, #+0]
        CMP      R0,#+3
        BEQ.N    ??disk_initialize_10
        LDR      R0,[SP, #+0]
        CMP      R0,#+6
        BNE.N    ??disk_initialize_11
//  948         {
//  949             sdcard_ptr->SDHC = TRUE;
??disk_initialize_10:
        MOVS     R0,#+1
        STRB     R0,[R4, #+12]
//  950         }
//  951     }
//  952     else
//  953     {
//  954         return FALSE;
//  955     }
//  956 
//  957     /* Card identify */
//  958     command.COMMAND = ESDHC_CMD2;
??disk_initialize_11:
        MOVS     R0,#+2
        STRB     R0,[SP, #+4]
//  959     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  960     command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  961     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+12]
//  962     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//  963     if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+4
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BNE.N    ??disk_initialize_12
//  964     {
//  965         return FALSE;
//  966     }
//  967 
//  968     /* Get card address */
//  969     command.COMMAND = ESDHC_CMD3;
        MOVS     R0,#+3
        STRB     R0,[SP, #+4]
//  970     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  971     command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  972     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+12]
//  973     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//  974     if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+4
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_13
//  975     {
//  976         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  977     }
??disk_initialize_9:
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
??disk_initialize_12:
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  978     sdcard_ptr->ADDRESS = command.RESPONSE[0] & 0xFFFF0000;
??disk_initialize_13:
        LDR      R0,[SP, #+20]
        LSRS     R0,R0,#+16
        LSLS     R0,R0,#+16
        STR      R0,[R4, #+16]
//  979     
//  980     /* Get card parameters */
//  981     command.COMMAND = ESDHC_CMD9;
        MOVS     R0,#+9
        STRB     R0,[SP, #+4]
//  982     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  983     command.ARGUMENT = sdcard_ptr->ADDRESS;
        LDR      R0,[R4, #+16]
        STR      R0,[SP, #+8]
//  984     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+12]
//  985     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//  986     if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+4
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_14
//  987     {
//  988         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  989     }
//  990     if (0 == (command.RESPONSE[3] & 0x00C00000))
??disk_initialize_14:
        LDR      R0,[SP, #+32]
        TST      R0,#0xC00000
        BNE.N    ??disk_initialize_15
//  991     {
//  992         read_bl_len = (command.RESPONSE[2] >> 8) & 0x0F;
        LDR      R0,[SP, #+28]
        UBFX     R2,R0,#+8,#+4
//  993         c_size = command.RESPONSE[2] & 0x03;
        LDRB     R0,[SP, #+28]
        ANDS     R0,R0,#0x3
//  994         c_size = (c_size << 10) | (command.RESPONSE[1] >> 22);
        LDR      R1,[SP, #+24]
        LSRS     R1,R1,#+22
        ORRS     R0,R1,R0, LSL #+10
//  995         c_size_mult = (command.RESPONSE[1] >> 7) & 0x07;
        LDR      R1,[SP, #+24]
        UBFX     R1,R1,#+7,#+3
//  996         sdcard_ptr->NUM_BLOCKS = (c_size + 1) * (1 << (c_size_mult + 2)) * (1 << (read_bl_len - 9));
        ADDS     R0,R0,#+1
        MOVS     R3,#+1
        ADDS     R1,R1,#+2
        LSLS     R1,R3,R1
        MULS     R0,R1,R0
        MOVS     R1,#+1
        SUBS     R2,R2,#+9
        LSLS     R1,R1,R2
        MULS     R0,R1,R0
        STR      R0,[R4, #+8]
        B.N      ??disk_initialize_16
//  997     }
//  998     else
//  999     {
// 1000         sdcard_ptr->VERSION2 = TRUE;
??disk_initialize_15:
        MOVS     R0,#+1
        STRB     R0,[R4, #+13]
// 1001         c_size = (command.RESPONSE[1] >> 8) & 0x003FFFFF;
        LDR      R0,[SP, #+24]
        UBFX     R0,R0,#+8,#+22
// 1002         sdcard_ptr->NUM_BLOCKS = (c_size + 1) << 10;
        ADDS     R0,R0,#+1
        LSLS     R0,R0,#+10
        STR      R0,[R4, #+8]
// 1003     }
// 1004 
// 1005     /* Select card */
// 1006     command.COMMAND = ESDHC_CMD7;
??disk_initialize_16:
        MOVS     R0,#+7
        STRB     R0,[SP, #+4]
// 1007     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
// 1008     command.ARGUMENT = sdcard_ptr->ADDRESS;
        LDR      R0,[R4, #+16]
        STR      R0,[SP, #+8]
// 1009     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+12]
// 1010     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
// 1011     if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+4
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_17
// 1012     {
// 1013         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
// 1014     }
// 1015 
// 1016     /* Set block size */
// 1017     command.COMMAND = ESDHC_CMD16;
??disk_initialize_17:
        MOVS     R0,#+16
        STRB     R0,[SP, #+4]
// 1018     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
// 1019     command.ARGUMENT = IO_SDCARD_BLOCK_SIZE;
        MOV      R0,#+512
        STR      R0,[SP, #+8]
// 1020     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+12]
// 1021     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
// 1022     if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+4
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_18
// 1023     {
// 1024         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
// 1025     }
// 1026 
// 1027     if (ESDHC_BUS_WIDTH_4BIT == sdcard_ptr->INIT->SIGNALS)
??disk_initialize_18:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??disk_initialize_19
// 1028     {
// 1029         /* Application specific command */
// 1030         command.COMMAND = ESDHC_CMD55;
        MOVS     R0,#+55
        STRB     R0,[SP, #+4]
// 1031         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
// 1032         command.ARGUMENT = sdcard_ptr->ADDRESS;
        LDR      R0,[R4, #+16]
        STR      R0,[SP, #+8]
// 1033         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+12]
// 1034         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
// 1035         if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+4
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_20
// 1036         {
// 1037             return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
// 1038         }
// 1039 
// 1040         /* Set bus width == 4 */
// 1041         command.COMMAND = ESDHC_ACMD6;
??disk_initialize_20:
        MOVS     R0,#+70
        STRB     R0,[SP, #+4]
// 1042         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
// 1043         command.ARGUMENT = 2;
        MOVS     R0,#+2
        STR      R0,[SP, #+8]
// 1044         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+12]
// 1045         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
// 1046         if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+4
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_21
// 1047         {
// 1048             return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
// 1049         }
// 1050 
// 1051         param = ESDHC_BUS_WIDTH_4BIT;
??disk_initialize_21:
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
// 1052         if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_SET_BUS_WIDTH, &param))
        ADD      R1,SP,#+0
        MOVW     R0,#+4871
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_19
// 1053         {
// 1054             return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
// 1055         }
// 1056     }
// 1057 
// 1058     Stat &= ~STA_NOINIT;        /* Clear STA_NOINIT */
??disk_initialize_19:
        LDR.W    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFE
        LDR.W    R1,??DataTable16_6
        STRB     R0,[R1, #+0]
// 1059     
// 1060     return (Stat & 0x03);
        LDR.W    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3
??disk_initialize_1:
        ADD      SP,SP,#+40
        POP      {R4,PC}          ;; return
// 1061 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0xfffff844
// 1062 
// 1063 
// 1064 
// 1065 /*-----------------------------------------------------------------------*/
// 1066 /* Receive a data packet from MMC                                        */
// 1067 /*-----------------------------------------------------------------------*/
// 1068 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1069 static int rcvr_datablock (
// 1070     U8   *buff,  /* Data buffer to store received data */
// 1071     U32  btr /* Byte count (must be multiple of 4) */
// 1072 )
// 1073 {
rcvr_datablock:
        PUSH     {R4}
// 1074     U32 bytes, i, j;
// 1075     U32 *ptr = (U32*)buff;
// 1076     ESDHC_INFO_STRUCT_PTR   esdhc_info_ptr;
// 1077 
// 1078     /* Check parameters */
// 1079     esdhc_info_ptr = (ESDHC_INFO_STRUCT_PTR)&SDHC_Info;
        LDR.W    R2,??DataTable16
// 1080     
// 1081     /* Check parameters */    
// 1082     if (NULL == esdhc_info_ptr)
        CMP      R2,#+0
        BNE.N    ??rcvr_datablock_0
// 1083     {
// 1084         return 0;
        MOVS     R0,#+0
        B.N      ??rcvr_datablock_1
// 1085     }    
// 1086     
// 1087     /* Workaround for random bit polling failures - not suitable for IO cards */
// 1088     if ((esdhc_info_ptr->CARD == ESDHC_CARD_SD) || (esdhc_info_ptr->CARD == ESDHC_CARD_SDHC) || (esdhc_info_ptr->CARD == ESDHC_CARD_MMC) || (esdhc_info_ptr->CARD == ESDHC_CARD_CEATA))
??rcvr_datablock_0:
        LDR      R3,[R2, #+0]
        CMP      R3,#+2
        BEQ.N    ??rcvr_datablock_2
        LDR      R3,[R2, #+0]
        CMP      R3,#+3
        BEQ.N    ??rcvr_datablock_2
        LDR      R3,[R2, #+0]
        CMP      R3,#+7
        BEQ.N    ??rcvr_datablock_2
        LDR      R2,[R2, #+0]
        CMP      R2,#+8
        BNE.N    ??rcvr_datablock_3
// 1089     {
// 1090         while (SDHC_PRSSTAT & SDHC_PRSSTAT_DLA_MASK){};
??rcvr_datablock_2:
        LDR.N    R2,??DataTable8_2  ;; 0x400b1024
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+29
        BMI.N    ??rcvr_datablock_2
// 1091     }    
// 1092     
// 1093     /* Read data in 4 byte counts */
// 1094     bytes = btr;
??rcvr_datablock_3:
        B.N      ??rcvr_datablock_4
// 1095     while (bytes)
// 1096     {
// 1097         i = bytes > 512 ? 512 : bytes;
// 1098         for (j = (i + 3) >> 2; j != 0; j--)
// 1099         {
// 1100             if (SDHC_IRQSTAT & (SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK))
// 1101             {
// 1102                 SDHC_IRQSTAT |= SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK | SDHC_IRQSTAT_BRR_MASK;
// 1103                 return 0;
// 1104             }
// 1105             
// 1106             while (0 == (SDHC_PRSSTAT & SDHC_PRSSTAT_BREN_MASK)){};
// 1107     
// 1108 #if BRTOS_ENDIAN == BRTOS_LITTLE_ENDIAN
// 1109             *ptr++ = SDHC_DATPORT;
// 1110 #else
// 1111             *ptr++ = _psp_swap4byte (SDHC_DATPORT);
// 1112 #endif
// 1113         }
// 1114         bytes -= i;
??rcvr_datablock_5:
        SUBS     R1,R1,R2
??rcvr_datablock_4:
        CMP      R1,#+0
        BEQ.N    ??rcvr_datablock_6
        CMP      R1,#+512
        BLS.N    ??rcvr_datablock_7
        MOV      R2,#+512
        B.N      ??rcvr_datablock_8
??rcvr_datablock_7:
        MOVS     R2,R1
??rcvr_datablock_8:
        ADDS     R3,R2,#+3
        LSRS     R3,R3,#+2
        B.N      ??rcvr_datablock_9
??rcvr_datablock_10:
        LDR.N    R4,??DataTable8_2  ;; 0x400b1024
        LDR      R4,[R4, #+0]
        LSLS     R4,R4,#+20
        BPL.N    ??rcvr_datablock_10
        LDR.W    R4,??DataTable16_7  ;; 0x400b1020
        LDR      R4,[R4, #+0]
        STR      R4,[R0, #+0]
        ADDS     R0,R0,#+4
        SUBS     R3,R3,#+1
??rcvr_datablock_9:
        CMP      R3,#+0
        BEQ.N    ??rcvr_datablock_5
        LDR.N    R4,??DataTable10  ;; 0x400b1030
        LDR      R4,[R4, #+0]
        TST      R4,#0x700000
        BEQ.N    ??rcvr_datablock_10
        LDR.N    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0x700000
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        B.N      ??rcvr_datablock_1
// 1115     }
// 1116     
// 1117 	return 1;           /* Return with success */    
??rcvr_datablock_6:
        MOVS     R0,#+1
??rcvr_datablock_1:
        POP      {R4}
        BX       LR               ;; return
// 1118 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x400b102c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0xfff0000f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x400b1024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x1008000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x400b10c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x400b1004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0x400b1028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     0x400b1044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     0x5cc60
// 1119 
// 1120 /*-----------------------------------------------------------------------*/
// 1121 /* Read Sector(s)                                                        */
// 1122 /*-----------------------------------------------------------------------*/
// 1123 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1124 DRESULT disk_read (
// 1125     U8  drv,         /* Physical drive nmuber (0) */
// 1126     U8  *buff,       /* Pointer to the data buffer to store read data */
// 1127     U32 sector,      /* Start sector number (LBA) */
// 1128     U8  count        /* Sector count (1..255) */
// 1129 )
// 1130 {
disk_read:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+36
        MOVS     R4,R1
        MOVS     R5,R3
// 1131     ESDHC_COMMAND_STRUCT command;
// 1132     SDCARD_STRUCT_PTR    sdcard_ptr = (SDCARD_STRUCT_PTR)&SDHC_Card;
        LDR.W    R1,??DataTable16_4
// 1133     
// 1134     if (drv || !count) return RES_PARERR;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??disk_read_0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??disk_read_1
??disk_read_0:
        MOVS     R0,#+4
        B.N      ??disk_read_2
// 1135     if (Stat & STA_NOINIT) return RES_NOTRDY;
??disk_read_1:
        LDR.W    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??disk_read_3
        MOVS     R0,#+3
        B.N      ??disk_read_2
// 1136         
// 1137     /* Check parameters */
// 1138     if ((NULL == buff))
??disk_read_3:
        CMP      R4,#+0
        BNE.N    ??disk_read_4
// 1139     {
// 1140         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_read_2
// 1141     }   
// 1142     if (!sdcard_ptr->SDHC)
??disk_read_4:
        LDRB     R0,[R1, #+12]
        CMP      R0,#+0
        BNE.N    ??disk_read_5
// 1143     {
// 1144         sector *= 512;	/* Convert to byte address if needed */
        MOV      R0,#+512
        MULS     R2,R0,R2
// 1145     }
// 1146 
// 1147     if (count == 1)	/* Single block read */
??disk_read_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??disk_read_6
// 1148     {
// 1149         command.COMMAND = ESDHC_CMD17;
        MOVS     R0,#+17
        STRB     R0,[SP, #+0]
// 1150         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
// 1151         command.ARGUMENT = sector;
        STR      R2,[SP, #+4]
// 1152         command.READ = TRUE;
        MOVS     R0,#+1
        STRB     R0,[SP, #+8]
// 1153         command.BLOCKS = count;	
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STR      R5,[SP, #+12]
// 1154         
// 1155         if (ESDHC_OK == SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+0
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BNE.N    ??disk_read_7
// 1156         {
// 1157             if (rcvr_datablock(buff, 512))
        MOV      R1,#+512
        MOVS     R0,R4
        BL       rcvr_datablock
        CMP      R0,#+0
        BEQ.N    ??disk_read_7
// 1158             {
// 1159                 count = 0;
        MOVS     R5,#+0
        B.N      ??disk_read_7
// 1160             }
// 1161         }
// 1162     }
// 1163     else 
// 1164     {   /* Multiple block read */
// 1165         // N     sei se  17 ou 18 no ESDHC
// 1166         command.COMMAND = ESDHC_CMD18;
??disk_read_6:
        MOVS     R0,#+18
        STRB     R0,[SP, #+0]
// 1167         //command.COMMAND = ESDHC_CMD17;
// 1168         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
// 1169         command.ARGUMENT = sector;
        STR      R2,[SP, #+4]
// 1170         command.READ = TRUE;
        MOVS     R0,#+1
        STRB     R0,[SP, #+8]
// 1171         command.BLOCKS = count; 
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STR      R5,[SP, #+12]
// 1172         
// 1173         if (ESDHC_OK == SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+0
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BNE.N    ??disk_read_7
// 1174         {
// 1175             if (rcvr_datablock(buff, 512*count))
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOV      R0,#+512
        MUL      R1,R0,R5
        MOVS     R0,R4
        BL       rcvr_datablock
        CMP      R0,#+0
        BEQ.N    ??disk_read_7
// 1176             {
// 1177                 count = 0;
        MOVS     R5,#+0
// 1178             }
// 1179         }
// 1180     }
// 1181 
// 1182     return count ? RES_ERROR : RES_OK;
??disk_read_7:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??disk_read_8
        MOVS     R0,#+1
        B.N      ??disk_read_9
??disk_read_8:
        MOVS     R0,#+0
??disk_read_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??disk_read_2:
        ADD      SP,SP,#+36
        POP      {R4,R5,PC}       ;; return
// 1183 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     rtc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x4004d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0x4004d008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     0x4004d00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     0x4004d010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     0x4004d014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     0x40048030
// 1184 
// 1185 /*-----------------------------------------------------------------------*/
// 1186 /* Send a data packet to MMC                                             */
// 1187 /*-----------------------------------------------------------------------*/
// 1188 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1189 static int xmit_datablock (
// 1190     const U8 *buff,         /* 512 byte data block to be transmitted */
// 1191     U32 btr              /* Byte count (must be multiple of 4) */
// 1192 )
// 1193 {
xmit_datablock:
        PUSH     {R4}
// 1194     U32  bytes, i;
// 1195     U32  *ptr = (U32*)buff;
// 1196 
// 1197     /* Write data in 4 byte counts */
// 1198     bytes = btr;
// 1199     while (bytes)
??xmit_datablock_0:
        CMP      R1,#+0
        BEQ.N    ??xmit_datablock_1
// 1200     {
// 1201         i = bytes > 512 ? 512 : bytes;
        CMP      R1,#+512
        BLS.N    ??xmit_datablock_2
        MOV      R2,#+512
        B.N      ??xmit_datablock_3
??xmit_datablock_2:
        MOVS     R2,R1
// 1202         bytes -= i;
??xmit_datablock_3:
        SUBS     R1,R1,R2
// 1203         for (i = (i + 3) >> 2; i != 0; i--)
        ADDS     R2,R2,#+3
        LSRS     R2,R2,#+2
        B.N      ??xmit_datablock_4
// 1204         {
// 1205             if (SDHC_IRQSTAT & (SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK))
// 1206             {
// 1207             	SDHC_IRQSTAT |= SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK | SDHC_IRQSTAT_BWR_MASK;
// 1208                 return IO_ERROR;
// 1209             }
// 1210             while (0 == (SDHC_PRSSTAT & SDHC_PRSSTAT_BWEN_MASK)){};
??xmit_datablock_5:
        LDR.N    R3,??DataTable16_8  ;; 0x400b1024
        LDR      R3,[R3, #+0]
        LSLS     R3,R3,#+21
        BPL.N    ??xmit_datablock_5
// 1211 
// 1212 #if PSP_ENDIAN == BRTOS_LITTLE_ENDIAN
// 1213             SDHC_DATPORT = *ptr++;
        LDR.N    R3,??DataTable16_7  ;; 0x400b1020
        LDR      R4,[R0, #+0]
        STR      R4,[R3, #+0]
        ADDS     R0,R0,#+4
        SUBS     R2,R2,#+1
??xmit_datablock_4:
        CMP      R2,#+0
        BEQ.N    ??xmit_datablock_0
        LDR.N    R3,??DataTable10  ;; 0x400b1030
        LDR      R3,[R3, #+0]
        TST      R3,#0x700000
        BEQ.N    ??xmit_datablock_5
        LDR.N    R0,??DataTable10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0x700000
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable10  ;; 0x400b1030
        STR      R0,[R1, #+0]
        MOVS     R0,#-1
        B.N      ??xmit_datablock_6
// 1214 #else
// 1215             SDHC_DATPORT = _psp_swap4byte (*ptr++);
// 1216 #endif
// 1217 
// 1218         }
// 1219     }	
// 1220 
// 1221 
// 1222 	return 1;
??xmit_datablock_1:
        MOVS     R0,#+1
??xmit_datablock_6:
        POP      {R4}
        BX       LR               ;; return
// 1223 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x400b1030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x400b1034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x7f00b3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     ESDHC_COMMAND_XFERTYP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     0x400b1008
// 1224 
// 1225 
// 1226 
// 1227 /*-----------------------------------------------------------------------*/
// 1228 /* Write Sector(s)                                                        */
// 1229 /*-----------------------------------------------------------------------*/
// 1230 //=========================================================================
// 1231 //函数名称：disk_write                                                        
// 1232 //功能概要：写数据盘扇区                                                
// 1233 //参数说明：drv:设备号
// 1234 //         buff:待写入SD卡的数据的缓存区首地址
// 1235 //         sector:起始扇区号
// 1236 //         count:扇区数
// 1237 //函数返回：RES_OK：成功，其它：失败                                                              
// 1238 //=========================================================================
// 1239 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1240 DRESULT disk_write (
// 1241     U8  drv,     /* Physical drive nmuber (0) */
// 1242     const U8  *buff, /* Pointer to the data buffer to store read data */
// 1243     U32 sector,      /* Start sector number (LBA) */
// 1244     U8  count        /* Sector count (1..255) */
// 1245 )
// 1246 {
disk_write:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+32
        MOVS     R6,R1
        MOVS     R5,R3
// 1247     ESDHC_COMMAND_STRUCT command;
// 1248     SDCARD_STRUCT_PTR    sdcard_ptr = (SDCARD_STRUCT_PTR)&SDHC_Card;
        LDR.N    R4,??DataTable16_4
// 1249 	
// 1250 	if (drv || !count) return RES_PARERR;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??disk_write_0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??disk_write_1
??disk_write_0:
        MOVS     R0,#+4
        B.N      ??disk_write_2
// 1251 	if (Stat & STA_NOINIT) return RES_NOTRDY;
??disk_write_1:
        LDR.N    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??disk_write_3
        MOVS     R0,#+3
        B.N      ??disk_write_2
// 1252 	if (Stat & STA_PROTECT) return RES_WRPRT;
??disk_write_3:
        LDR.N    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??disk_write_4
        MOVS     R0,#+2
        B.N      ??disk_write_2
// 1253 	
// 1254     /* Check parameters */
// 1255     if ((NULL == buff))
??disk_write_4:
        CMP      R6,#+0
        BNE.N    ??disk_write_5
// 1256     {
// 1257         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_write_2
// 1258     }	
// 1259 
// 1260     if (!sdcard_ptr->SDHC)
??disk_write_5:
        LDRB     R0,[R4, #+12]
        CMP      R0,#+0
        BNE.N    ??disk_write_6
// 1261     {
// 1262     	sector *= 512;	/* Convert to byte address if needed */
        MOV      R0,#+512
        MULS     R2,R0,R2
// 1263     }
// 1264 
// 1265 	if (count == 1)	/* Single block write */
??disk_write_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??disk_write_7
// 1266 	{
// 1267 	    command.COMMAND = ESDHC_CMD24;
        MOVS     R0,#+24
        STRB     R0,[SP, #+0]
// 1268 	    command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
// 1269 	    command.ARGUMENT = sector;
        STR      R2,[SP, #+4]
// 1270 	    command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+8]
// 1271 	    command.BLOCKS = count;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STR      R5,[SP, #+12]
// 1272 	
// 1273 	    if (ESDHC_OK == SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+0
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BNE.N    ??disk_write_8
// 1274 	    {
// 1275 	    	if (xmit_datablock(buff,512))
        MOV      R1,#+512
        MOVS     R0,R6
        BL       xmit_datablock
        CMP      R0,#+0
        BEQ.N    ??disk_write_8
// 1276 	    	{
// 1277 	    		count = 0;
        MOVS     R5,#+0
        B.N      ??disk_write_8
// 1278 	    	}
// 1279 	    }
// 1280 	}
// 1281 	else 
// 1282 	{
// 1283 		//if (CardType & CT_SDC) send_cmd(ACMD23, count);
// 1284 		//if (send_cmd(CMD25, sector) == 0) {	/* WRITE_MULTIPLE_BLOCK */
// 1285 		command.COMMAND = ESDHC_CMD25;
??disk_write_7:
        MOVS     R0,#+25
        STRB     R0,[SP, #+0]
// 1286 	    command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
// 1287 	    command.ARGUMENT = sector;
        STR      R2,[SP, #+4]
// 1288 	    command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+8]
// 1289 	    command.BLOCKS = count;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STR      R5,[SP, #+12]
// 1290 	    		
// 1291 	    if (ESDHC_OK == SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+0
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BNE.N    ??disk_write_8
// 1292 	    {
// 1293 	    	if (xmit_datablock(buff,512*count))
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOV      R0,#+512
        MUL      R1,R0,R5
        MOVS     R0,R6
        BL       xmit_datablock
        CMP      R0,#+0
        BEQ.N    ??disk_write_8
// 1294 	    	{
// 1295 	    		count = 0;
        MOVS     R5,#+0
// 1296 	    	}
// 1297 	    }
// 1298 	}
// 1299 	
// 1300 	/* Wait for card ready / transaction state */
// 1301     do
// 1302     {
// 1303         command.COMMAND = ESDHC_CMD13;
??disk_write_8:
        MOVS     R0,#+13
        STRB     R0,[SP, #+0]
// 1304         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
// 1305         command.ARGUMENT = sdcard_ptr->ADDRESS;
        LDR      R0,[R4, #+16]
        STR      R0,[SP, #+4]
// 1306         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+8]
// 1307         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
// 1308         if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+0
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_write_9
// 1309         {
// 1310             return RES_ERROR;
        MOVS     R0,#+1
        B.N      ??disk_write_2
// 1311         }
// 1312 
// 1313         /* Card status error check */
// 1314         if (command.RESPONSE[0] & 0xFFD98008)
??disk_write_9:
        LDR      R0,[SP, #+16]
        LDR.N    R1,??DataTable16_9  ;; 0xffd98008
        TST      R0,R1
        BEQ.N    ??disk_write_10
// 1315         {
// 1316             return RES_ERROR;
        MOVS     R0,#+1
        B.N      ??disk_write_2
// 1317         }
// 1318     } while (0x000000900 != (command.RESPONSE[0] & 0x00001F00));		
??disk_write_10:
        LDR      R0,[SP, #+16]
        ANDS     R0,R0,#0x1F00
        CMP      R0,#+2304
        BNE.N    ??disk_write_8
// 1319 	    	
// 1320 	return count ? RES_ERROR : RES_OK;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??disk_write_11
        MOVS     R0,#+1
        B.N      ??disk_write_12
??disk_write_11:
        MOVS     R0,#+0
??disk_write_12:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??disk_write_2:
        ADD      SP,SP,#+32
        POP      {R4-R6,PC}       ;; return
// 1321 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x400b1000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x400b100c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     0xe0001
// 1322 
// 1323 
// 1324 /*-----------------------------------------------------------------------*/
// 1325 /* Miscellaneous Functions                                               */
// 1326 /*-----------------------------------------------------------------------*/
// 1327 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1328 DRESULT disk_ioctl (
// 1329     U8 drv,             /* Physical drive nmuber (0) */
// 1330     U8 ctrl,            /* Control code */
// 1331     void  *buff         /* Buffer to send/receive control data */
// 1332 )
// 1333 {
disk_ioctl:
        PUSH     {R4,LR}
        SUB      SP,SP,#+32
        MOVS     R4,R2
// 1334     DRESULT      res;
// 1335     ESDHC_COMMAND_STRUCT command;
// 1336     SDCARD_STRUCT_PTR	 sdcard_ptr = (SDCARD_STRUCT_PTR)&SDHC_Card;	
        LDR.N    R2,??DataTable16_4
// 1337 
// 1338     if (drv) return RES_PARERR;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_ioctl_0
        MOVS     R0,#+4
        B.N      ??disk_ioctl_1
// 1339 
// 1340     res = RES_ERROR;
??disk_ioctl_0:
        MOVS     R0,#+1
// 1341 
// 1342     if (Stat & STA_NOINIT) return RES_NOTRDY;
        LDR.N    R3,??DataTable16_6
        LDRB     R3,[R3, #+0]
        LSLS     R3,R3,#+31
        BPL.N    ??disk_ioctl_2
        MOVS     R0,#+3
        B.N      ??disk_ioctl_1
// 1343 
// 1344     switch (ctrl) 
??disk_ioctl_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??disk_ioctl_3
        CMP      R1,#+2
        BEQ.N    ??disk_ioctl_4
        BCC.N    ??disk_ioctl_5
        CMP      R1,#+3
        BEQ.N    ??disk_ioctl_6
        B.N      ??disk_ioctl_7
// 1345     {
// 1346         case CTRL_SYNC :        /* Make sure that no pending write process. Do not remove this or written sector might not left updated. */		
// 1347             res = RES_OK;
??disk_ioctl_3:
        MOVS     R0,#+0
// 1348         break;
        B.N      ??disk_ioctl_8
// 1349 
// 1350         case GET_SECTOR_COUNT :	/* Get number of sectors on the disk (DWORD) */
// 1351             *(unsigned long*)buff = sdcard_ptr->NUM_BLOCKS;
??disk_ioctl_5:
        LDR      R0,[R2, #+8]
        STR      R0,[R4, #+0]
// 1352             res = RES_OK;
        MOVS     R0,#+0
// 1353         break;  
        B.N      ??disk_ioctl_8
// 1354 
// 1355     case GET_SECTOR_SIZE :	/* Get R/W sector size (WORD) */
// 1356         *(unsigned short*)buff = 512;
??disk_ioctl_4:
        MOV      R0,#+512
        STRH     R0,[R4, #+0]
// 1357         res = RES_OK;
        MOVS     R0,#+0
// 1358         break;
        B.N      ??disk_ioctl_8
// 1359 
// 1360     case GET_BLOCK_SIZE :           /* Get erase block size in unit of sector (DWORD) */
// 1361         // Implementar
// 1362         command.COMMAND = ESDHC_CMD9;
??disk_ioctl_6:
        MOVS     R0,#+9
        STRB     R0,[SP, #+0]
// 1363         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
// 1364         command.ARGUMENT = sdcard_ptr->ADDRESS;
        LDR      R0,[R2, #+16]
        STR      R0,[SP, #+4]
// 1365         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+8]
// 1366         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
// 1367         if (ESDHC_OK != SDHC_ioctl (IO_IOCTL_ESDHC_SEND_COMMAND, &command))
        ADD      R1,SP,#+0
        MOVW     R0,#+4866
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_ioctl_9
// 1368         {
// 1369             return RES_ERROR;
        MOVS     R0,#+1
        B.N      ??disk_ioctl_1
// 1370         }
// 1371         if (0 == (command.RESPONSE[3] & 0x00C00000))
??disk_ioctl_9:
        LDR      R0,[SP, #+28]
        TST      R0,#0xC00000
        BNE.N    ??disk_ioctl_10
// 1372         {
// 1373             //SD V1
// 1374             *(unsigned long*)buff = ((((command.RESPONSE[2] >> 18) & 0x7F) + 1) << (((command.RESPONSE[3] >> 8) & 0x03) - 1));
        LDR      R0,[SP, #+24]
        UBFX     R0,R0,#+18,#+7
        ADDS     R0,R0,#+1
        LDR      R1,[SP, #+28]
        LSRS     R1,R1,#+8
        ANDS     R1,R1,#0x3
        SUBS     R1,R1,#+1
        LSLS     R0,R0,R1
        STR      R0,[R4, #+0]
// 1375         }
// 1376         else
// 1377         {
// 1378              //SD V2
// 1379             // Implementar
// 1380             //*(DWORD*)buff = (((command.RESPONSE[2] >> 18) & 0x7F) << (((command.RESPONSE[3] >> 8) & 0x03) - 1));
// 1381         }           
// 1382         res = RES_OK;
??disk_ioctl_10:
        MOVS     R0,#+0
// 1383         break;
        B.N      ??disk_ioctl_8
// 1384 
// 1385     default:
// 1386         res = RES_PARERR;
??disk_ioctl_7:
        MOVS     R0,#+4
// 1387     }
// 1388 
// 1389     return res;
??disk_ioctl_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??disk_ioctl_1:
        ADD      SP,SP,#+32
        POP      {R4,PC}          ;; return
// 1390 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x400b1010
// 1391 
// 1392 /*-----------------------------------------------------------------------*/
// 1393 /* Get Card Stat                                                         */
// 1394 /*-----------------------------------------------------------------------*/
// 1395 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1396 U8 GetCardStat(void)
// 1397 {
// 1398   return Stat;
GetCardStat:
        LDR.N    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
// 1399 }
// 1400 
// 1401 /*-----------------------------------------------------------------------*/
// 1402 /* Set Card Stat                                                         */
// 1403 /*-----------------------------------------------------------------------*/
// 1404 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1405 void SetCardStat(U8 state)
// 1406 {
// 1407   Stat = state;
SetCardStat:
        LDR.N    R1,??DataTable16_6
        STRB     R0,[R1, #+0]
// 1408 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     0x400b1014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     0x400b1018
// 1409 
// 1410 /*-----------------------------------------------------------------------*/
// 1411 /* Get Disk Status                                                       */
// 1412 /*-----------------------------------------------------------------------*/
// 1413 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1414 DSTATUS disk_status (
// 1415     U8 drv      /* Physical drive nmuber (0) */
// 1416 )
// 1417 {
// 1418     if (drv) return STA_NOINIT; /* Supports only single drive */
disk_status:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disk_status_0
        MOVS     R0,#+1
        B.N      ??disk_status_1
// 1419     return Stat;
??disk_status_0:
        LDR.N    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
??disk_status_1:
        BX       LR               ;; return
// 1420 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0x400b101c
// 1421 
// 1422 
// 1423 
// 1424 /*-----------------------------------------------------------------------*/
// 1425 /* Device Timer Interrupt Procedure                                      */
// 1426 /*-----------------------------------------------------------------------*/
// 1427 /* This function must be called in period of 10ms                        */
// 1428 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1429 void disk_timerproc (void)
// 1430 {
// 1431     U8 s;   
// 1432     
// 1433     Timer++;
disk_timerproc:
        LDR.N    R0,??DataTable16_10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable16_10
        STR      R0,[R1, #+0]
// 1434     s = Stat;
        LDR.N    R0,??DataTable16_6
        LDRB     R0,[R0, #+0]
// 1435 
// 1436     #if (SOCKWP == 1)
// 1437     if (SDCARD_GPIO_PROTECT == 0)             
// 1438     {
// 1439         s &= ~STA_PROTECT;      /* Write enabled */
// 1440     }
// 1441     else     
// 1442     {
// 1443         s |= STA_PROTECT;       /* Write protected */
// 1444     }
// 1445     #else
// 1446       s &= ~STA_PROTECT;
        ANDS     R0,R0,#0xFB
// 1447     #endif
// 1448 
// 1449     if (SDCARD_GPIO_DETECT == 0)        /* Card inserted */
// 1450         s &= ~STA_NODISK;
        ANDS     R0,R0,#0xFD
// 1451     else                                /* Socket empty */
// 1452         s |= (STA_NODISK | STA_NOINIT);
// 1453 
// 1454     Stat = s;                           /* Update MMC status */
        LDR.N    R1,??DataTable16_6
        STRB     R0,[R1, #+0]
// 1455 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     SDHC_Info

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     SDHC_Device

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     K60_SDHC0_init

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_3:
        DC32     0x40300000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_4:
        DC32     SDHC_Card

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_5:
        DC32     SDHC_Init

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_6:
        DC32     Stat

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_7:
        DC32     0x400b1020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_8:
        DC32     0x400b1024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_9:
        DC32     0xffd98008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_10:
        DC32     Timer
// 1456 
// 1457 
// 1458 ////////////////////////////////////////////////////////////
// 1459 ////////////////////////////////////////////////////////////
// 1460 /////      Return Calendar Function                    /////
// 1461 ////////////////////////////////////////////////////////////
// 1462 ////////////////////////////////////////////////////////////
// 1463 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1464 void GetFatTimer(U32 *time)
// 1465 {
// 1466   //UserEnterCritical();
// 1467  // *time = Timer;
// 1468  // UserExitCritical();
// 1469 }
GetFatTimer:
        BX       LR               ;; return
// 1470 
// 1471 ////////////////////////////////////////////////////////////
// 1472 ////////////////////////////////////////////////////////////
// 1473 ////////////////////////////////////////////////////////////
// 1474 ////////////////////////////////////////////////////////////
// 1475 
// 1476 
// 1477 ////////////////////////////////////////////////////////////
// 1478 ////////////////////////////////////////////////////////////
// 1479 /////      Set Calendar Function                       /////
// 1480 ////////////////////////////////////////////////////////////
// 1481 ////////////////////////////////////////////////////////////
// 1482 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1483 void SetFatTimer(U32 time)
// 1484 {
// 1485   //UserEnterCritical();
// 1486   //Timer = time;
// 1487   //UserExitCritical();
// 1488 }
SetFatTimer:
        BX       LR               ;; return

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
//   560 bytes in section .bss
//     1 byte  in section .data
//   268 bytes in section .rodata
// 4 160 bytes in section .text
// 
// 4 160 bytes of CODE  memory
//   268 bytes of CONST memory
//   561 bytes of DATA  memory
//
//Errors: none
//Warnings: 4
