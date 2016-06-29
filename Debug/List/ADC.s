///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:40
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - ����\common\ADC.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - ����\common\ADC.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - ����\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - ����\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - ����\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - ����\Debug\List\ADC.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC ADCx
        PUBLIC Master_Adc_Config
        PUBLIC ad_ave
        PUBLIC ad_flt
        PUBLIC ad_mid
        PUBLIC ad_once
        PUBLIC adc_IO_init
        PUBLIC adc_start
        PUBLIC adc_stop

// C:\Users\ye\Desktop\NFS.NO 2 - ����\common\ADC.c
//    1 #include "ADC.h"
//    2 
//    3 
//    4 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 tADC_Config Master_Adc_Config;          //�ýṹ���������Ҫ��ADC/PGA����
Master_Adc_Config:
        DS8 16
//    6 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    7 volatile struct ADC_MemMap *ADCx[2] = {ADC0_BASE_PTR, ADC1_BASE_PTR}; //��������ָ�����鱣�� ADCx �ĵ�ַ
ADCx:
        DATA
        DC32 4003B000H, 400BB000H
//    8 
//    9 
//   10 
//   11 
//   12 /*
//   13 // AD IO ��ʼ��
//   14 //
//   15 //
//   16 //
//   17 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   18 void adc_IO_init(ADCn adcn, ADC_Ch ch)
//   19 {
//   20     //ASSERT( ((adcn == ADC0) && (ch >= AD8 && ch <= AD18)) || ((adcn == ADC1) && (ch >= AD4a && ch <= AD17)) ) ; //ʹ�ö��Լ��ADCn_CHn�Ƿ�����
//   21 
//   22     switch(adcn)
adc_IO_init:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??adc_IO_init_0
        CMP      R0,#+1
        BEQ.W    ??adc_IO_init_1
        B.N      ??adc_IO_init_2
//   23     {
//   24     case ADC0:       /*   ADC0  */
//   25         SIM_SCGC6 |= (SIM_SCGC6_ADC0_MASK );        //����ADC0ʱ��
??adc_IO_init_0:
        LDR.W    R0,??DataTable4  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.W    R2,??DataTable4  ;; 0x4004803c
        STR      R0,[R2, #+0]
//   26         SIM_SOPT7 &= ~(SIM_SOPT7_ADC0ALTTRGEN_MASK  | SIM_SOPT7_ADC0PRETRGSEL_MASK);
        LDR.W    R0,??DataTable4_1  ;; 0x40048018
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x90
        LDR.W    R2,??DataTable4_1  ;; 0x40048018
        STR      R0,[R2, #+0]
//   27         SIM_SOPT7 = SIM_SOPT7_ADC0TRGSEL(0);
        MOVS     R0,#+0
        LDR.W    R2,??DataTable4_1  ;; 0x40048018
        STR      R0,[R2, #+0]
//   28         ADC0_SC3 |= (ADC_SC3_AVGE_MASK | ADC_SC3_AVGS(2));
        LDR.W    R0,??DataTable4_2  ;; 0x4003b024
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x6
        LDR.W    R2,??DataTable4_2  ;; 0x4003b024
        STR      R0,[R2, #+0]
//   29         switch(ch)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R1
        SUBS     R0,R0,#+8
        CMP      R0,#+1
        BLS.N    ??adc_IO_init_3
        SUBS     R0,R0,#+2
        CMP      R0,#+1
        BLS.N    ??adc_IO_init_4
        SUBS     R0,R0,#+2
        CMP      R0,#+1
        BLS.N    ??adc_IO_init_5
        SUBS     R0,R0,#+2
        CMP      R0,#+1
        BLS.N    ??adc_IO_init_6
        SUBS     R0,R0,#+3
        CMP      R0,#+1
        BLS.N    ??adc_IO_init_7
        B.N      ??adc_IO_init_8
//   30         {
//   31         case AD8:   //ADC0_SE8 -- PTB0
//   32         case AD9:   //ADC0_SE9 -- PTB1
//   33             SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
??adc_IO_init_3:
        LDR.W    R0,??DataTable4_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R2,??DataTable4_3  ;; 0x40048038
        STR      R0,[R2, #+0]
//   34             PORT_PCR_REG(PORTB_BASE_PTR, ch - AD8 + 0) =  PORT_PCR_MUX(0);
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+2
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+303104
        STR      R0,[R1, #-32]
//   35             break;
//   36         case AD10:  //ADC0_SE10 -- PTA7
//   37         case AD11:  //ADC0_SE11 -- PTA8
//   38             SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//   39             PORT_PCR_REG(PORTA_BASE_PTR, ch - AD10 + 7) =  PORT_PCR_MUX(0);
//   40             break;
//   41         case AD12:  //ADC0_SE12 -- PTB2
//   42         case AD13:  //ADC0_SE13 -- PTB3
//   43             SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//   44             PORT_PCR_REG(PORTB_BASE_PTR, ch - AD12 + 2) =  PORT_PCR_MUX(0);
//   45             break;
//   46         case AD14:  //ADC0_SE14 -- PTC0
//   47         case AD15:  //ADC0_SE15 -- PTC1
//   48             SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
//   49             PORT_PCR_REG(PORTC_BASE_PTR, ch - AD14 + 0) =  PORT_PCR_MUX(0);
//   50             break;
//   51         case AD17:   //ADC0_SE17 -- PTE24
//   52         case AD18:   //ADC0_SE17 -- PTE25
//   53             SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;
//   54             PORT_PCR_REG(PORTE_BASE_PTR, ch - AD17 + 24) =  PORT_PCR_MUX(0);
//   55             break;
//   56         default:
//   57             return;
//   58         }
//   59         return;
??adc_IO_init_9:
        B.N      ??adc_IO_init_10
??adc_IO_init_4:
        LDR.W    R0,??DataTable4_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.W    R2,??DataTable4_3  ;; 0x40048038
        STR      R0,[R2, #+0]
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+2
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+299008
        STR      R0,[R1, #-12]
        B.N      ??adc_IO_init_9
??adc_IO_init_5:
        LDR.W    R0,??DataTable4_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R2,??DataTable4_3  ;; 0x40048038
        STR      R0,[R2, #+0]
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+2
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+303104
        STR      R0,[R1, #-40]
        B.N      ??adc_IO_init_9
??adc_IO_init_6:
        LDR.W    R0,??DataTable4_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.N    R2,??DataTable4_3  ;; 0x40048038
        STR      R0,[R2, #+0]
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+2
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+307200
        STR      R0,[R1, #-56]
        B.N      ??adc_IO_init_9
??adc_IO_init_7:
        LDR.N    R0,??DataTable4_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000
        LDR.N    R2,??DataTable4_3  ;; 0x40048038
        STR      R0,[R2, #+0]
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+2
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+315392
        STR      R0,[R1, #+28]
        B.N      ??adc_IO_init_9
??adc_IO_init_8:
        B.N      ??adc_IO_init_10
//   60 
//   61     case ADC1:       /*   ADC1    */
//   62         SIM_SCGC3 |= (SIM_SCGC3_ADC1_MASK );
??adc_IO_init_1:
        LDR.N    R0,??DataTable4_4  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R2,??DataTable4_4  ;; 0x40048030
        STR      R0,[R2, #+0]
//   63         SIM_SOPT7 &= ~(SIM_SOPT7_ADC1ALTTRGEN_MASK  | SIM_SOPT7_ADC1PRETRGSEL_MASK) ;
        LDR.N    R0,??DataTable4_1  ;; 0x40048018
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x9000
        LDR.N    R2,??DataTable4_1  ;; 0x40048018
        STR      R0,[R2, #+0]
//   64         SIM_SOPT7 = SIM_SOPT7_ADC1TRGSEL(0);
        MOVS     R0,#+0
        LDR.N    R2,??DataTable4_1  ;; 0x40048018
        STR      R0,[R2, #+0]
//   65         ADC1_SC3 |= (ADC_SC3_AVGE_MASK | ADC_SC3_AVGS(2));
        LDR.N    R0,??DataTable4_5  ;; 0x400bb024
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x6
        LDR.N    R2,??DataTable4_5  ;; 0x400bb024
        STR      R0,[R2, #+0]
//   66         switch(ch)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R1
        SUBS     R0,R0,#+4
        CMP      R0,#+3
        BLS.N    ??adc_IO_init_11
        SUBS     R0,R0,#+4
        CMP      R0,#+1
        BLS.N    ??adc_IO_init_12
        SUBS     R0,R0,#+2
        CMP      R0,#+3
        BLS.N    ??adc_IO_init_13
        SUBS     R0,R0,#+4
        CMP      R0,#+1
        BLS.N    ??adc_IO_init_14
        SUBS     R0,R0,#+3
        BEQ.N    ??adc_IO_init_15
        B.N      ??adc_IO_init_16
//   67         {
//   68         case AD4a:   //ADC1_SE4a -- PTE0
//   69         case AD5a:   //ADC1_SE5a -- PTE1
//   70         case AD6a:   //ADC1_SE6a -- PTE2
//   71         case AD7a:   //ADC1_SE7a -- PTE3
//   72             SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK;
??adc_IO_init_11:
        LDR.N    R0,??DataTable4_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000
        LDR.N    R2,??DataTable4_3  ;; 0x40048038
        STR      R0,[R2, #+0]
//   73             PORT_PCR_REG(PORTE_BASE_PTR, ch - AD4a + 0) =  PORT_PCR_MUX(0);
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+2
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+315392
        STR      R0,[R1, #-16]
//   74             break;
        B.N      ??adc_IO_init_17
//   75         case AD8:  //ADC1_SE8 -- PTB0
//   76         case AD9:  //ADC1_SE9 -- PTB1
//   77             SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
??adc_IO_init_12:
        LDR.N    R0,??DataTable4_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.N    R2,??DataTable4_3  ;; 0x40048038
        STR      R0,[R2, #+0]
//   78             PORT_PCR_REG(PORTB_BASE_PTR, ch - AD8 + 0) =  PORT_PCR_MUX(0);
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+2
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+303104
        STR      R0,[R1, #-32]
//   79             break;
        B.N      ??adc_IO_init_17
//   80         case AD10:  //ADC1_SE10 -- PTB4
//   81         case AD11:  //ADC1_SE11 -- PTB5
//   82         case AD12:  //ADC1_SE12 -- PTB6
//   83         case AD13:  //ADC1_SE13 -- PTB7
//   84             SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
??adc_IO_init_13:
        LDR.N    R0,??DataTable4_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.N    R2,??DataTable4_3  ;; 0x40048038
        STR      R0,[R2, #+0]
//   85             PORT_PCR_REG(PORTB_BASE_PTR, ch - 6) =  PORT_PCR_MUX(0);
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+2
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+303104
        STR      R0,[R1, #-24]
//   86             break;
        B.N      ??adc_IO_init_17
//   87         case AD14:  //ADC1_SE14 -- PTB10
//   88         case AD15:  //ADC1_SE15 -- PTB11
//   89             SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
??adc_IO_init_14:
        LDR.N    R0,??DataTable4_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.N    R2,??DataTable4_3  ;; 0x40048038
        STR      R0,[R2, #+0]
//   90             PORT_PCR_REG(PORTB_BASE_PTR, ch - AD10 + 4) =  PORT_PCR_MUX(0);
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+2
        ADD      R1,R1,#+1073741824
        ADDS     R1,R1,#+303104
        STR      R0,[R1, #-24]
//   91             break;
        B.N      ??adc_IO_init_17
//   92         case AD17:  //ADC1_SE17 -- PTA17
//   93             SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
??adc_IO_init_15:
        LDR.N    R0,??DataTable4_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.N    R2,??DataTable4_3  ;; 0x40048038
        STR      R0,[R2, #+0]
//   94             PORT_PCR_REG(PORTA_BASE_PTR, ch) =  PORT_PCR_MUX(0);
        MOVS     R0,#+0
        LDR.N    R2,??DataTable4_6  ;; 0x40049000
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R0,[R2, R1, LSL #+2]
//   95             break;
        B.N      ??adc_IO_init_17
//   96         default:
//   97             break;
//   98         }
//   99         break;
??adc_IO_init_16:
??adc_IO_init_17:
        B.N      ??adc_IO_init_18
//  100     default:
//  101         break;
//  102     }
//  103 }
??adc_IO_init_2:
??adc_IO_init_18:
??adc_IO_init_10:
        BX       LR               ;; return
//  104 
//  105 
//  106 
//  107 
//  108 /*************************************************************************
//  109 *                             Ұ��Ƕ��ʽ����������
//  110 *
//  111 *  �������ƣ�ad_once
//  112 *  ����˵�����ɼ�һ��һ·ģ������ADֵ
//  113 *  ����˵����ADCn        ģ��ţ� ADC0�� ADC1��
//  114 *            ADC_Channel ͨ����
//  115 *            ADC_nbit    ���ȣ� ADC_8bit,ADC_12bit, ADC_10bit, ADC_16bit ��
//  116 *  �������أ��޷��Ž��ֵ
//  117 *  �޸�ʱ�䣺2012-2-10
//  118 *  ��    ע���ο����ݴ�ѧ�����̣�Bͨ���������������������
//  119 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  120 u16 ad_once(ADCn adcn, ADC_Ch ch, ADC_nbit bit) //�ɼ�ĳ·ģ������ADֵ
//  121 {
ad_once:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  122     u16 result = 0;
        MOVS     R5,#+0
//  123     //ASSERT( ((adcn == ADC0) && (ch >= AD8 && ch <= AD18)) || ((adcn == ADC1) && (ch >= AD4a && ch <= AD17)) ) ; //ʹ�ö��Լ��ADCn_CHn�Ƿ�����
//  124 
//  125     adc_start(adcn, ch, bit);	  //����ADCת��
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       adc_start
//  126 
//  127     while (( ADC_SC1_REG(ADCx[adcn], 0 ) & ADC_SC1_COCO_MASK ) != ADC_SC1_COCO_MASK);
??ad_once_0:
        LDR.N    R0,??DataTable4_7
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??ad_once_0
//  128     result = ADC_R_REG(ADCx[adcn], 0);
        LDR.N    R0,??DataTable4_7
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R5,[R0, #+16]
//  129     ADC_SC1_REG(ADCx[adcn], 0) &= ~ADC_SC1_COCO_MASK;
        LDR.N    R0,??DataTable4_7
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x80
        LDR.N    R1,??DataTable4_7
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//  130     return result;
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R1,R4,R5,PC}    ;; return
//  131 }
//  132 
//  133 /*************************************************************************
//  134 *                             Ұ��Ƕ��ʽ����������
//  135 *
//  136 *  �������ƣ�ad_mid
//  137 *  ����˵�����ɼ�����һ·ģ������ADֵ������ ��ֵ
//  138 *  ����˵����ADCx        ģ��ţ� ADC0�� ADC1��
//  139 *            ADC_Channel ͨ����
//  140 *            ADC_nbit    ���ȣ� ADC_8bit,ADC_12bit, ADC_10bit, ADC_16bit ��
//  141 *  �������أ��޷��Ž��ֵ
//  142 *  �޸�ʱ�䣺2012-2-10
//  143 *  ��    ע���޸����ݴ�ѧ������
//  144 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  145 u16 ad_mid(ADCn adcn, ADC_Ch ch, ADC_nbit bit)
//  146 {
ad_mid:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  147     u16 i, j, k, tmp;
//  148     //ASSERT( ((adcn == ADC0) && (ch >= AD8 && ch <= AD18)) || ((adcn == ADC1) && (ch >= AD4a && ch <= AD17)) ) ; //ʹ�ö��Լ��ADCn_CHn�Ƿ�����
//  149 
//  150     //3��ADCת��
//  151     i = ad_once(adcn, ch, bit);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       ad_once
        MOVS     R7,R0
//  152     j = ad_once(adcn, ch, bit);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       ad_once
        MOV      R8,R0
//  153     k = ad_once(adcn, ch, bit);
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       ad_once
//  154 
//  155     //ȡ��ֵ
//  156     tmp = i > j ? i : j;          //tmpȡ�������ֵ
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R8,R7
        BCS.N    ??ad_mid_0
        MOV      R8,R7
        B.N      ??ad_mid_1
//  157     return k > tmp ?    tmp :  (   k > i  ?    k   :     i  );
??ad_mid_0:
??ad_mid_1:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R8,R0
        BCS.N    ??ad_mid_2
        MOV      R7,R8
        B.N      ??ad_mid_3
??ad_mid_2:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R7,R0
        BCS.N    ??ad_mid_4
        MOVS     R7,R0
        B.N      ??ad_mid_3
??ad_mid_4:
??ad_mid_3:
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4-R8,PC}       ;; return
//  158     //                k>tmp>i             tmp>k>i   tmp>i>k
//  159 }
//  160 
//  161 /*************************************************************************
//  162 *                             Ұ��Ƕ��ʽ����������
//  163 *
//  164 *  �������ƣ�ad_ave
//  165 *  ����˵������β�����ȡƽ��ֵ
//  166 *  ����˵����ADCx        ģ��ţ� ADC0�� ADC1��
//  167 *            ADC_Channel ͨ����
//  168 *            ADC_nbit    ���ȣ� ADC_8bit,ADC_12bit, ADC_10bit, ADC_16bit ��
//  169 *            N           ��ֵ�˲�����(��Χ:0~255)
//  170 *  �������أ�16λ�޷��Ž��ֵ
//  171 *  �޸�ʱ�䣺2012-2-10
//  172 *  ��    ע���޸����ݴ�ѧ������
//  173 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  174 u16 ad_ave(ADCn adcn, ADC_Ch ch, ADC_nbit bit, u8 N) //��ֵ�˲�
//  175 {
ad_ave:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  176     u32 tmp = 0;
        MOVS     R8,#+0
//  177     u8  i;
//  178     //ASSERT( ((adcn == ADC0) && (ch >= AD8 && ch <= AD18)) || ((adcn == ADC1) && (ch >= AD4a && ch <= AD17)) ) ; //ʹ�ö��Լ��ADCn_CHn�Ƿ�����
//  179 
//  180     for(i = 0; i < N; i++)
        MOVS     R9,#+0
        B.N      ??ad_ave_0
//  181         tmp += ad_once(adcn, ch, bit);
??ad_ave_1:
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       ad_once
        UXTAH    R8,R8,R0
        ADDS     R9,R9,#+1
??ad_ave_0:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R9,R7
        BCC.N    ??ad_ave_1
//  182     tmp = tmp / N;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UDIV     R8,R8,R7
//  183     return (u16)tmp;
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R1,R4-R9,PC}    ;; return
//  184 }
//  185 
//  186 
//  187 /*************************************************************************
//  188 *                             Ұ��Ƕ��ʽ����������
//  189 *
//  190 *  �������ƣ�ad_flt
//  191 *  ����˵����һ�β�������ǰ���β�������ƽ��ֵ
//  192 *  ����˵����ADCx        ģ��ţ� ADC0�� ADC1��
//  193 *            ADC_Channel ͨ����
//  194 *            ADC_nbit    ���ȣ� ADC_8bit,ADC_12bit, ADC_10bit, ADC_16bit ��
//  195 *  �������أ�16λ�޷��Ž��ֵ
//  196 *  �޸�ʱ�䣺2012-2-10
//  197 *  ��    ע��
//  198 *************************************************************************/
//  199 #define SAMP_COUNT  2       //��ǰ�˲� 2^SAMP_COUNT ����  ����̫�󣬲�Ȼ������׼

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  200 u16 ad_flt(ADCn adcn, ADC_Ch ch, ADC_nbit bit)
//  201 {
ad_flt:
        PUSH     {R3-R5,LR}
//  202     static u16 buf[(1<<(SAMP_COUNT))] = {0};  //����ǰ  2^SAMP_COUNT �� �Ĳ�������
//  203     static u8 n = (u8)(0x100 - (char)(1 << (SAMP_COUNT)));
//  204     static u32 sum = 0;
//  205 
//  206     //ASSERT( ((adcn == ADC0) && (ch >= AD8 && ch <= AD18)) || ((adcn == ADC1) && (ch >= AD4a && ch <= AD17)) ) ; //ʹ�ö��Լ��ADCn_CHn�Ƿ�����
//  207 
//  208     if(n >= (u8)(0x100 - (char)(1 << (SAMP_COUNT))))
        LDR.N    R3,??DataTable4_8
        LDRB     R3,[R3, #+0]
        CMP      R3,#+252
        BLT.N    ??ad_flt_0
//  209     {
//  210         buf[(u8)((1<<(SAMP_COUNT))+n)] = ad_once(adcn, ch, bit);
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       ad_once
        LDR.N    R1,??DataTable4_9
        LDR.N    R2,??DataTable4_8
        LDRB     R2,[R2, #+0]
        ADDS     R2,R2,#+4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STRH     R0,[R1, R2, LSL #+1]
//  211         sum += buf[(u8)((1<<(SAMP_COUNT))+n)];
        LDR.N    R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_9
        LDR.N    R2,??DataTable4_8
        LDRB     R2,[R2, #+0]
        ADDS     R2,R2,#+4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDRH     R1,[R1, R2, LSL #+1]
        UXTAH    R0,R0,R1
        LDR.N    R1,??DataTable4_10
        STR      R0,[R1, #+0]
//  212         n++;
        LDR.N    R0,??DataTable4_8
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_8
        STRB     R0,[R1, #+0]
//  213         return ((u16)(sum >> SAMP_COUNT));
        LDR.N    R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        B.N      ??ad_flt_1
//  214     }
//  215 
//  216     sum -= buf[n];
??ad_flt_0:
        LDR.N    R3,??DataTable4_10
        LDR      R3,[R3, #+0]
        LDR.N    R4,??DataTable4_9
        LDR.N    R5,??DataTable4_8
        LDRB     R5,[R5, #+0]
        LDRH     R4,[R4, R5, LSL #+1]
        SUBS     R3,R3,R4
        LDR.N    R4,??DataTable4_10
        STR      R3,[R4, #+0]
//  217     buf[n] = ad_once(adcn, ch, bit);
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       ad_once
        LDR.N    R1,??DataTable4_9
        LDR.N    R2,??DataTable4_8
        LDRB     R2,[R2, #+0]
        STRH     R0,[R1, R2, LSL #+1]
//  218     sum += buf[n];
        LDR.N    R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_9
        LDR.N    R2,??DataTable4_8
        LDRB     R2,[R2, #+0]
        LDRH     R1,[R1, R2, LSL #+1]
        UXTAH    R0,R0,R1
        LDR.N    R1,??DataTable4_10
        STR      R0,[R1, #+0]
//  219 
//  220     if (++n >= (1 << (SAMP_COUNT)))
        LDR.N    R0,??DataTable4_8
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_8
        STRB     R0,[R1, #+0]
        LDR.N    R0,??DataTable4_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BLT.N    ??ad_flt_2
//  221     {
//  222         n = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_8
        STRB     R0,[R1, #+0]
//  223     }
//  224     return ((u16)(sum >> SAMP_COUNT)); /* ADC����ֵ�����ɴβ���ֵƽ�� */
??ad_flt_2:
        LDR.N    R0,??DataTable4_10
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
??ad_flt_1:
        POP      {R1,R4,R5,PC}    ;; return
//  225 }

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??buf:
        DS8 8

        SECTION `.data`:DATA:REORDER:NOROOT(0)
??n:
        DATA
        DC8 252

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??sum:
        DS8 4
//  226 #undef  SAMP_COUNT
//  227 
//  228 
//  229 
//  230 
//  231 /*************************************************************************
//  232 *                             Ұ��Ƕ��ʽ����������
//  233 *
//  234 *  �������ƣ�adc_start
//  235 *  ����˵��������adc���������Bͨ�������������������������
//  236 *  ����˵����ADCx        ģ��ţ� ADC0�� ADC1��
//  237 *            ADC_Channel ͨ����
//  238 *            ADC_nbit    ���ȣ� ADC_8bit,ADC_12bit, ADC_10bit, ADC_16bit ��
//  239 *  �������أ���
//  240 *  �޸�ʱ�䣺2012-2-10
//  241 *  ��    ע���޸����ݴ�ѧ������
//  242 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  243 void adc_start(ADCn adcn, ADC_Ch ch, ADC_nbit bit)
//  244 {
adc_start:
        PUSH     {R7,LR}
//  245 
//  246     Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH( ch );
        ANDS     R1,R1,#0x1F
        ORRS     R1,R1,#0x40
        LDR.N    R3,??DataTable4_11
        STRB     R1,[R3, #+8]
//  247 
//  248     //��ʼ��ADCĬ������
//  249     Master_Adc_Config.CONFIG1  = ADLPC_NORMAL
//  250                                  | ADC_CFG1_ADIV(ADIV_4)
//  251                                  | ADLSMP_LONG
//  252                                  | ADC_CFG1_MODE(bit)
//  253                                  | ADC_CFG1_ADICLK(ADICLK_BUS);
        LSLS     R1,R2,#+2
        ANDS     R1,R1,#0xC
        ORRS     R1,R1,#0x50
        LDR.N    R2,??DataTable4_11
        STRB     R1,[R2, #+0]
//  254     Master_Adc_Config.CONFIG2  = MUXSEL_ADCA    //MUXSEL_ADCA
//  255                                  | ADACKEN_DISABLED
//  256                                  | ADHSC_HISPEED
//  257                                  | ADC_CFG2_ADLSTS(ADLSTS_20) ;
        MOVS     R1,#+4
        LDR.N    R2,??DataTable4_11
        STRB     R1,[R2, #+1]
//  258 
//  259     Master_Adc_Config.COMPARE1 = 0x1234u ;                 //����ֵ
        MOVW     R1,#+4660
        LDR.N    R2,??DataTable4_11
        STRH     R1,[R2, #+2]
//  260     Master_Adc_Config.COMPARE2 = 0x5678u ;                 //����ֵ
        MOVW     R1,#+22136
        LDR.N    R2,??DataTable4_11
        STRH     R1,[R2, #+4]
//  261 
//  262     adc_config_alt(ADCx[adcn], &Master_Adc_Config);       // ���� ADCn
        LDR.N    R1,??DataTable4_11
        LDR.N    R2,??DataTable4_7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R0,[R2, R0, LSL #+2]
        BL       adc_config_alt
//  263 }
        POP      {R0,PC}          ;; return
//  264 
//  265 /*************************************************************************
//  266 *                             Ұ��Ƕ��ʽ����������
//  267 *
//  268 *  �������ƣ�adc_stop
//  269 *  ����˵����ֹͣADCת��
//  270 *  ����˵����ADCx        ģ��ţ� ADC0�� ADC1��
//  271 *            ADC_Channel ͨ����
//  272 *  �������أ���
//  273 *  �޸�ʱ�䣺2012-2-10
//  274 *  ��    ע���޸����ݴ�ѧ������
//  275 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  276 void adc_stop(ADCn adcn)
//  277 {
adc_stop:
        PUSH     {R7,LR}
//  278     Master_Adc_Config.STATUS1A = AIEN_ON | DIFF_SINGLE | ADC_SC1_ADCH(Module_disabled);
        MOVS     R1,#+95
        LDR.N    R2,??DataTable4_11
        STRB     R1,[R2, #+8]
//  279     adc_config_alt(ADCx[adcn], &Master_Adc_Config);  // ����ADC0
        LDR.N    R1,??DataTable4_11
        LDR.N    R2,??DataTable4_7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R0,[R2, R0, LSL #+2]
        BL       adc_config_alt
//  280 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40048018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x4003b024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x400bb024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x40049000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     ADCx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     ??n

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     ??buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     ??sum

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     Master_Adc_Config
//  281 
//  282 
//  283 /*************************************************************************
//  284 *                             Ұ��Ƕ��ʽ����������
//  285 *
//  286 *  �������ƣ�adc_config_alt
//  287 *  ����˵������adc�Ĵ����ṹ�����ý�adc�Ĵ���
//  288 *  ����˵����adcmap      adc��ַ�Ĵ�����ַ��ADC0_BASE_PTR,ADC1_BASE_PTR��
//  289 *            ADC_CfgPtr  ��� �Ĵ���ֵ�Ľṹ��
//  290 *  �������أ���
//  291 *  �޸�ʱ�䣺2012-2-10
//  292 *  ��    ע���޸Ĺٷ����̵�����
//  293 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  294 void adc_config_alt(ADC_MemMapPtr adcmap, tADC_ConfigPtr ADC_CfgPtr)
//  295 {
//  296     ADC_CFG1_REG(adcmap) = ADC_CfgPtr->CONFIG1;
adc_config_alt:
        LDRB     R2,[R1, #+0]
        STR      R2,[R0, #+8]
//  297     ADC_CFG2_REG(adcmap) = ADC_CfgPtr->CONFIG2;
        LDRB     R2,[R1, #+1]
        STR      R2,[R0, #+12]
//  298     ADC_CV1_REG(adcmap)  = ADC_CfgPtr->COMPARE1;
        LDRH     R2,[R1, #+2]
        STR      R2,[R0, #+24]
//  299     ADC_CV2_REG(adcmap)  = ADC_CfgPtr->COMPARE2;
        LDRH     R2,[R1, #+4]
        STR      R2,[R0, #+28]
//  300     ADC_SC2_REG(adcmap)  = ADC_CfgPtr->STATUS2;
        LDRB     R2,[R1, #+6]
        STR      R2,[R0, #+32]
//  301     ADC_SC3_REG(adcmap)  = ADC_CfgPtr->STATUS3;
        LDRB     R2,[R1, #+7]
        STR      R2,[R0, #+36]
//  302     ADC_PGA_REG(adcmap)  = ADC_CfgPtr->PGA;
        LDR      R2,[R1, #+12]
        STR      R2,[R0, #+80]
//  303     ADC_SC1_REG(adcmap, A) = ADC_CfgPtr->STATUS1A;
        LDRB     R2,[R1, #+8]
        STR      R2,[R0, #+0]
//  304     ADC_SC1_REG(adcmap, B) = ADC_CfgPtr->STATUS1B;
        LDRB     R1,[R1, #+9]
        STR      R1,[R0, #+4]
//  305 }
        BX       LR               ;; return

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
//    28 bytes in section .bss
//     9 bytes in section .data
// 1 116 bytes in section .text
// 
// 1 116 bytes of CODE memory
//    37 bytes of DATA memory
//
//Errors: none
//Warnings: none
