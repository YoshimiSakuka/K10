///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    13/Mar/2015  12:44:20 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Administrator\Desktop\3.11���ṹBLOCK nd       /
//                    black\common\LCD_5110.c                                 /
//    Command line =  "C:\Users\Administrator\Desktop\3.11���ṹBLOCK nd      /
//                    black\common\LCD_5110.c" -D DEBUG -lCN                  /
//                    "C:\Users\Administrator\Desktop\3.11���ṹBLOCK nd      /
//                    black\Debug\List\" -lB "C:\Users\Administrator\Desktop\ /
//                    3.11���ṹBLOCK nd  black\Debug\List\" -o               /
//                    "C:\Users\Administrator\Desktop\3.11���ṹBLOCK nd      /
//                    black\Debug\Obj\" --no_cse --no_unroll --no_inline      /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.0\arm\INC\c\DLib_Config_Normal.h" -Ol                 /
//                    --use_c++_inline                                        /
//    List file    =  C:\Users\Administrator\Desktop\3.11���ṹBLOCK nd       /
//                    black\Debug\List\LCD_5110.s                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME LCD_5110

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_Init

        PUBLIC Delay_ms
        PUBLIC Delay_us
        PUBLIC GB_12
        PUBLIC LCD_Init
        PUBLIC LCD_Write_Char
        PUBLIC LCD_Write_Num
        PUBLIC LCD_Write_String
        PUBLIC LCD_clear
        PUBLIC LCD_draw_bmp_pixel
        PUBLIC LCD_set_XY
        PUBLIC LCD_write_byte
        PUBLIC LCD_write_char
        PUBLIC LCD_write_chinese
        PUBLIC LCD_write_chinese_string
        PUBLIC LCD_write_english_string
        PUBLIC Nokia5110_IO_Init
        PUBLIC font6x8


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC16 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
// C:\Users\Administrator\Desktop\3.11���ṹBLOCK nd  black\common\LCD_5110.c
//    1 //#include "..\K60_datatype.h"
//    2 #include "LCD_5110.h"
//    3 #include "WordLib.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute struct typHZ_GB12 const GB_12[13]
GB_12:
        DATA
        DC8 0C7H, 0B0H
        DC8 4, 244, 84, 85, 86, 244, 4, 246, 5, 4, 246, 4, 0, 15, 1, 1, 9, 15
        DC8 0, 3, 4, 8, 7, 0
        DC8 0BDH, 0F8H
        DC8 32, 34, 228, 0, 68, 68, 255, 68, 68, 255, 68, 68, 8, 4, 3, 4, 10, 9
        DC8 8, 8, 8, 11, 8, 8
        DC8 0D7H, 0F3H
        DC8 4, 4, 132, 100, 92, 71, 68, 196, 68, 100, 70, 4, 2, 9, 8, 8, 8, 8
        DC8 8, 15, 8, 8, 12, 8
        DC8 0D7H, 0AAH
        DC8 36, 60, 39, 244, 160, 20, 84, 124, 87, 84, 212, 16, 2, 3, 1, 15, 0
        DC8 0, 2, 2, 6, 13, 0, 0
        DC8 0D3H, 0D2H
        DC8 4, 132, 68, 228, 92, 71, 68, 68, 68, 228, 70, 4, 1, 0, 0, 15, 4, 4
        DC8 4, 4, 4, 15, 0, 0
        DC8 0B1H, 0A3H
        DC8 32, 16, 252, 67, 64, 94, 210, 242, 82, 95, 66, 64, 0, 0, 15, 4, 2
        DC8 1, 0, 15, 1, 2, 4, 4
        DC8 0B3H, 0D6H
        DC8 68, 68, 255, 36, 80, 84, 84, 95, 84, 246, 84, 80, 4, 8, 15, 0, 0, 1
        DC8 2, 8, 8, 15, 0, 0
        DC8 0B3H, 0B5H
        DC8 2, 2, 34, 58, 38, 35, 250, 34, 50, 34, 131, 2, 1, 1, 1, 1, 1, 1, 15
        DC8 1, 1, 1, 1, 1
        DC8 0BEH, 0E0H
        DC8 0, 222, 18, 242, 94, 0, 254, 146, 146, 146, 243, 2, 4, 7, 4, 3, 2
        DC8 4, 15, 4, 4, 4, 6, 4
        DC8 0CEH, 0E5H
        DC8 0, 0, 62, 34, 34, 34, 34, 34, 34, 194, 0, 0, 0, 0, 4, 8, 8, 8, 8, 8
        DC8 4, 3, 0, 0
        DC8 0C1H, 0E3H
        DC8 0, 248, 4, 130, 66, 34, 18, 4, 248, 0, 0, 0, 0, 3, 4, 8, 8, 8, 8, 4
        DC8 3, 0, 0, 0
        DC8 0C0H, 0E5H
        DC8 0, 0, 254, 2, 250, 170, 170, 250, 170, 170, 251, 2, 4, 3, 8, 10, 10
        DC8 10, 10, 15, 10, 10, 10, 8
        DC8 0C3H, 0D7H
        DC8 0, 16, 18, 156, 112, 16, 255, 88, 148, 18, 24, 16, 4, 2, 1, 0, 0, 0
        DC8 15, 0, 0, 1, 2, 2, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute uint8 font6x8[92][6]
font6x8:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 7, 0, 7, 0, 0, 20, 127
        DC8 20, 127, 20, 0, 36, 42, 127, 42, 18, 0, 98, 100, 8, 19, 35, 0, 54
        DC8 73, 85, 34, 80, 0, 0, 5, 3, 0, 0, 0, 0, 28, 34, 65, 0, 0, 0, 65, 34
        DC8 28, 0, 0, 20, 8, 62, 8, 20, 0, 8, 8, 62, 8, 8, 0, 0, 0, 160, 96, 0
        DC8 0, 8, 8, 8, 8, 8, 0, 0, 96, 96, 0, 0, 0, 32, 16, 8, 4, 2, 0, 62, 81
        DC8 73, 69, 62, 0, 0, 66, 127, 64, 0, 0, 66, 97, 81, 73, 70, 0, 33, 65
        DC8 69, 75, 49, 0, 24, 20, 18, 127, 16, 0, 39, 69, 69, 69, 57, 0, 60
        DC8 74, 73, 73, 48, 0, 1, 113, 9, 5, 3, 0, 54, 73, 73, 73, 54, 0, 6, 73
        DC8 73, 41, 30, 0, 0, 54, 54, 0, 0, 0, 0, 86, 54, 0, 0, 0, 8, 20, 34
        DC8 65, 0, 0, 20, 20, 20, 20, 20, 0, 0, 65, 34, 20, 8, 0, 2, 1, 81, 9
        DC8 6, 0, 50, 73, 89, 81, 62, 0, 124, 18, 17, 18, 124, 0, 127, 73, 73
        DC8 73, 54, 0, 62, 65, 65, 65, 34, 0, 127, 65, 65, 34, 28, 0, 127, 73
        DC8 73, 73, 65, 0, 127, 9, 9, 9, 1, 0, 62, 65, 73, 73, 122, 0, 127, 8
        DC8 8, 8, 127, 0, 0, 65, 127, 65, 0, 0, 32, 64, 65, 63, 1, 0, 127, 8
        DC8 20, 34, 65, 0, 127, 64, 64, 64, 64, 0, 127, 2, 12, 2, 127, 0, 127
        DC8 4, 8, 16, 127, 0, 62, 65, 65, 65, 62, 0, 127, 9, 9, 9, 6, 0, 62, 65
        DC8 81, 33, 94, 0, 127, 9, 25, 41, 70, 0, 70, 73, 73, 73, 49, 0, 1, 1
        DC8 127, 1, 1, 0, 63, 64, 64, 64, 63, 0, 31, 32, 64, 32, 31, 0, 63, 64
        DC8 56, 64, 63, 0, 99, 20, 8, 20, 99, 0, 7, 8, 112, 8, 7, 0, 97, 81, 73
        DC8 69, 67, 0, 0, 127, 65, 65, 0, 0, 85, 42, 85, 42, 85, 0, 0, 65, 65
        DC8 127, 0, 0, 4, 2, 1, 2, 4, 0, 64, 64, 64, 64, 64, 0, 0, 1, 2, 4, 0
        DC8 0, 32, 84, 84, 84, 120, 0, 127, 72, 68, 68, 56, 0, 56, 68, 68, 68
        DC8 32, 0, 56, 68, 68, 72, 127, 0, 56, 84, 84, 84, 24, 0, 8, 126, 9, 1
        DC8 2, 0, 24, 164, 164, 164, 124, 0, 127, 8, 4, 4, 120, 0, 0, 68, 125
        DC8 64, 0, 0, 64, 128, 132, 125, 0, 0, 127, 16, 40, 68, 0, 0, 0, 65
        DC8 127, 64, 0, 0, 124, 4, 24, 4, 120, 0, 124, 8, 4, 4, 120, 0, 56, 68
        DC8 68, 68, 56, 0, 252, 36, 36, 36, 24, 0, 24, 36, 36, 24, 252, 0, 124
        DC8 8, 4, 4, 8, 0, 72, 84, 84, 84, 32, 0, 4, 63, 68, 64, 32, 0, 60, 64
        DC8 64, 32, 124, 0, 28, 32, 64, 32, 28, 0, 60, 64, 48, 64, 60, 0, 68
        DC8 40, 16, 40, 68, 0, 28, 160, 160, 160, 124, 0, 68, 100, 84, 76, 68
        DC8 20, 20, 20, 20, 20, 20
//    4 
//    5 //#ifdef  __cplusplus
//    6 //extern "C" {
//    7 //#endif
//    8   
//    9   
//   10 
//   11 /*=============================�ڲ���������===================================*/
//   12 
//   13 void LCD_write_byte(uint8, uint8);
//   14 void LCD_set_XY(uint8 , uint8 );  
//   15 void Delay_ms(uint16);
//   16 void Delay_us(uint16);
//   17 
//   18 
//   19 /*=============================�ⲿ����ʵ��===================================*/ 
//   20   
//   21   
//   22 /**********************************************************************
//   23 * �������ƣ�5110Һ�����˿ڳ�ʼ��
//   24 * �������ܣ�
//   25 * ��ڲ���
//   26 * ���ڲ���
//   27 * �޸���  
//   28 * �޸�ʱ��
//   29 **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   30 void Nokia5110_IO_Init(void)
//   31 {
Nokia5110_IO_Init:
        PUSH     {R4-R8,LR}
//   32 //    SIM_SCGC5 = ( SIM_SCGC5_PORTA_MASK  //���˿�ʱ��
//   33 //                  | SIM_SCGC5_PORTB_MASK
//   34 //                  | SIM_SCGC5_PORTC_MASK
//   35 //                  | SIM_SCGC5_PORTD_MASK
//   36 //                  | SIM_SCGC5_PORTE_MASK );
//   37     (void)GPIO_Init(PORT_E,5,GPO,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+5
        MOVS     R0,#+4
        BL       GPIO_Init
        MOVS     R4,R0
//   38     (void)GPIO_Init(PORT_E,0,GPO,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       GPIO_Init
        MOVS     R5,R0
//   39     (void)GPIO_Init(PORT_E,1,GPO,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       GPIO_Init
        MOVS     R6,R0
//   40     (void)GPIO_Init(PORT_E,2,GPO,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOVS     R0,#+4
        BL       GPIO_Init
        MOVS     R7,R0
//   41     (void)GPIO_Init(PORT_E,3,GPO,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+4
        BL       GPIO_Init
        MOV      R8,R0
//   42     (void)GPIO_Init(PORT_E,4,GPO,LVL_H);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+4
        MOVS     R0,#+4
        BL       GPIO_Init
//   43     
//   44 //    //����E0-E4Ϊ5110�Ĺ��������
//   45 //    PORTE_PCR0 = (PORT_PCR_MUX(1));
//   46 //    PORTE_PCR1 = (PORT_PCR_MUX(1));
//   47 //    PORTE_PCR2 = (PORT_PCR_MUX(1));
//   48 //    PORTE_PCR3 = (PORT_PCR_MUX(1));
//   49 //    PORTE_PCR4 = (PORT_PCR_MUX(1));
//   50 //
//   51 //    //����E0-E4Ϊ�������
//   52 //    GPIOE_PDDR |= GPIO_PDDR_PDD( GPIO_PIN_Set1(0)
//   53 //                                | GPIO_PIN_Set1(1)
//   54 //                                | GPIO_PIN_Set1(2)
//   55 //                                | GPIO_PIN_Set1(3)
//   56 //                                | GPIO_PIN_Set1(4)); //�������֮��Ĭ��Ϊ�ߵ�ƽ
//   57 //
//   58 //    GPIOE_PDOR |= GPIO_PDOR_PDO( GPIO_PIN_Set1(0)
//   59 //                                | GPIO_PIN_Set1(1)
//   60 //                                | GPIO_PIN_Set1(2)
//   61 //                                | GPIO_PIN_Set1(3)
//   62 //                                | GPIO_PIN_Set1(4)); //��������˿ڳ�ʼֵ
//   63 }  
        POP      {R4-R8,PC}       ;; return
//   64 
//   65 
//   66 /**********************************************************************
//   67 * �������ƣ�LCD_init()
//   68 * �������ܣ���ʼ��nokia5110
//   69 * ��ڲ�������
//   70 * ���ڲ�������
//   71 * �޸���  ��MY
//   72 * �޸�ʱ�䣺2012/09/24
//   73 **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   74 void LCD_Init(void)
//   75 {
LCD_Init:
        PUSH     {R7,LR}
//   76     LCD_RST(0); // ����һ����LCD��λ�ĵ͵�ƽ����
        LDR.W    R0,??DataTable6  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x10
        LDR.W    R1,??DataTable6  ;; 0x400ff100
        STR      R0,[R1, #+0]
//   77     //GPIOE_PDOR &= GPIO_PDOR_PDO(GPIO_PIN_Set0(25));
//   78     Delay_us(16);
        MOVS     R0,#+16
        BL       Delay_us
//   79     LCD_RST(1);
        LDR.W    R0,??DataTable6  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.W    R1,??DataTable6  ;; 0x400ff100
        STR      R0,[R1, #+0]
//   80     //GPIOE_PDOR |= GPIO_PDOR_PDO(GPIO_PIN_Set1(25));
//   81     LCD_CE(0);// �ر�LCD
        LDR.W    R0,??DataTable6  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x8
        LDR.W    R1,??DataTable6  ;; 0x400ff100
        STR      R0,[R1, #+0]
//   82     //GPIOE_PDOR &= GPIO_PDOR_PDO(GPIO_PIN_Set0(24));
//   83     Delay_us(16);
        MOVS     R0,#+16
        BL       Delay_us
//   84     LCD_CE(1);// ʹ��LCD
        LDR.W    R0,??DataTable6  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable6  ;; 0x400ff100
        STR      R0,[R1, #+0]
//   85     //GPIOE_PDOR |= GPIO_PDOR_PDO(GPIO_PIN_Set1(24));
//   86     Delay_us(16);
        MOVS     R0,#+16
        BL       Delay_us
//   87     LCD_write_byte(0x21, 0);	// ʹ����չ��������LCDģʽ������ˮƽѰַ��ʽ
        MOVS     R1,#+0
        MOVS     R0,#+33
        BL       LCD_write_byte
//   88     LCD_write_byte(0xc8, 0);	// ����ƫ�õ�ѹ
        MOVS     R1,#+0
        MOVS     R0,#+200
        BL       LCD_write_byte
//   89     LCD_write_byte(0x06, 0);	// �¶�У��������Vlcd�¶�ϵ��Ϊ2
        MOVS     R1,#+0
        MOVS     R0,#+6
        BL       LCD_write_byte
//   90     LCD_write_byte(0x13, 0);	// 1:48
        MOVS     R1,#+0
        MOVS     R0,#+19
        BL       LCD_write_byte
//   91     LCD_write_byte(0x20, 0);	// ʹ�û�������
        MOVS     R1,#+0
        MOVS     R0,#+32
        BL       LCD_write_byte
//   92     LCD_clear();	            // ����
        BL       LCD_clear
//   93     LCD_write_byte(0x0c, 0);	// �趨��ʾģʽ��������ʾ
        MOVS     R1,#+0
        MOVS     R0,#+12
        BL       LCD_write_byte
//   94     LCD_CE(0);               // �ر�LCD
        LDR.W    R0,??DataTable6  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x8
        LDR.W    R1,??DataTable6  ;; 0x400ff100
        STR      R0,[R1, #+0]
//   95     //GPIOE_PDOR &= GPIO_PDOR_PDO(GPIO_PIN_Set0(24));
//   96 }
        POP      {R0,PC}          ;; return
//   97 
//   98 /**********************************************************************
//   99 * �������ƣ�LCD_clear()
//  100 * �������ܣ�Һ������
//  101 * ��ڲ�������
//  102 * ���ڲ�������
//  103 * �޸���  ��MY
//  104 * �޸�ʱ�䣺2012/09/24
//  105 **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  106 void LCD_clear(void)
//  107 {
LCD_clear:
        PUSH     {R4,LR}
//  108     uint16 i;
//  109     LCD_write_byte(0x0c, 0);
        MOVS     R1,#+0
        MOVS     R0,#+12
        BL       LCD_write_byte
//  110     LCD_write_byte(0x80, 0);
        MOVS     R1,#+0
        MOVS     R0,#+128
        BL       LCD_write_byte
//  111     for (i = 0; i < 504; i++)
        MOVS     R4,#+0
        B.N      ??LCD_clear_0
//  112         LCD_write_byte(0, 1);
??LCD_clear_1:
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LCD_write_byte
        ADDS     R4,R4,#+1
??LCD_clear_0:
        MOV      R0,#+504
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,R0
        BCC.N    ??LCD_clear_1
//  113 }
        POP      {R4,PC}          ;; return
//  114 
//  115 
//  116 /***********************************************************************
//  117 * �������ƣ�LCD_write_char()
//  118 * �������ܣ�д��1���ַ�
//  119 * ��ڲ�����c   Ҫд�������
//  120 * ���ڲ�������
//  121 * �޸���  ��MY
//  122 * �޸�ʱ�䣺2012/09/24
//  123 **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  124 void LCD_write_char(uint8 c)
//  125 {
LCD_write_char:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  126     uint8 line;
//  127     c -= 32;
        SUBS     R4,R4,#+32
//  128     for (line = 0; line < 6; line++)
        MOVS     R5,#+0
        B.N      ??LCD_write_char_0
//  129         LCD_write_byte(font6x8[c][line], 1);//��ACSII����ж�ȡ�ֽڣ�Ȼ��д��Һ��
??LCD_write_char_1:
        MOVS     R1,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+6
        LDR.W    R2,??DataTable6_1
        MLA      R0,R0,R4,R2
        LDRB     R0,[R5, R0]
        BL       LCD_write_byte
        ADDS     R5,R5,#+1
??LCD_write_char_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+6
        BCC.N    ??LCD_write_char_1
//  130 }
        POP      {R0,R4,R5,PC}    ;; return
//  131 
//  132 /***********************************************************************
//  133 * �������ƣ�LCD_Write_Char()
//  134 * �������ܣ�д��1���ַ�
//  135 * ��ڲ�����X:��;Y:��;asc:Ҫд�������
//  136 * ���ڲ�������
//  137 * �޸���  ��MY
//  138 * �޸�ʱ�䣺2012/09/24
//  139 **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  140 void LCD_Write_Char(uint8 X, uint8 Y, uint8 asc)
//  141 {
LCD_Write_Char:
        PUSH     {R3-R5,LR}
        MOVS     R4,R2
//  142     uint8 line;
//  143     LCD_set_XY(X, Y); //��궨λ
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_set_XY
//  144     // if((asc>=0)&&(asc<=9))
//  145     //   asc = asc+16;
//  146     // else
//  147     asc = asc - 32;
        SUBS     R4,R4,#+32
//  148     for (line = 0; line < 6; line++)
        MOVS     R5,#+0
        B.N      ??LCD_Write_Char_0
//  149         LCD_write_byte(font6x8[asc][line], 1);//��ACSII����ж�ȡ�ֽڣ�Ȼ��д��Һ��
??LCD_Write_Char_1:
        MOVS     R1,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+6
        LDR.W    R2,??DataTable6_1
        MLA      R0,R0,R4,R2
        LDRB     R0,[R5, R0]
        BL       LCD_write_byte
        ADDS     R5,R5,#+1
??LCD_Write_Char_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+6
        BCC.N    ??LCD_Write_Char_1
//  150 }
        POP      {R0,R4,R5,PC}    ;; return
//  151 
//  152 /***********************************************************************
//  153 * �������ƣ�LCD_Write_Num()
//  154 * �������ܣ���ʾ����
//  155 * ��ڲ�����X:��;Y:��;num:����;N:Ҫ��ʾ�ı�����λ��
//  156 * ���ڲ�������
//  157 * �޸���  ��
//  158 * �޸�ʱ�䣺
//  159 **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  160 void LCD_Write_Num(uint8 X, uint8 Y, uint16 num, uint8 N)
//  161 {
LCD_Write_Num:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R3
//  162     uint8 line;
//  163     uint8 i = 0;
        MOVS     R7,#+0
//  164     uint16 n[5] = {0};
        ADD      R0,SP,#+0
        MOVS     R1,#+0
        MOVS     R3,#+0
        MOVS     R12,#+0
        STM      R0!,{R1,R3,R12}
        SUBS     R0,R0,#+12
//  165     n[0] = num % 10;
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R0,#+10
        SDIV     R1,R2,R0
        MLS      R0,R0,R1,R2
        STRH     R0,[SP, #+0]
//  166     n[1] = (num / 10) % 10;
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R0,#+10
        SDIV     R0,R2,R0
        MOVS     R1,#+10
        SDIV     R3,R0,R1
        MLS      R0,R1,R3,R0
        STRH     R0,[SP, #+2]
//  167     n[2] = (num / 100) % 10;
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R0,#+100
        SDIV     R0,R2,R0
        MOVS     R1,#+10
        SDIV     R3,R0,R1
        MLS      R0,R1,R3,R0
        STRH     R0,[SP, #+4]
//  168     n[3] = (num / 1000) % 10;
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R0,#+1000
        SDIV     R0,R2,R0
        MOVS     R1,#+10
        SDIV     R3,R0,R1
        MLS      R0,R1,R3,R0
        STRH     R0,[SP, #+6]
//  169     n[4] = (num / 10000) % 10;
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVW     R0,#+10000
        SDIV     R0,R2,R0
        MOVS     R1,#+10
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        STRH     R0,[SP, #+8]
//  170     for(i = 0; i < 5; i++) n[i] = n[i] + 16;
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??LCD_Write_Num_0
??LCD_Write_Num_1:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R0,SP,#+0
        LDRH     R0,[R0, R7, LSL #+1]
        ADDS     R0,R0,#+16
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R1,SP,#+0
        STRH     R0,[R1, R7, LSL #+1]
        ADDS     R7,R7,#+1
??LCD_Write_Num_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+5
        BCC.N    ??LCD_Write_Num_1
//  171     for(i = N; i > 0; i--)
        MOVS     R7,R6
        B.N      ??LCD_Write_Num_2
//  172     {
//  173         LCD_set_XY(X + (N - i) * 6, Y); //��궨λ
//  174         for (line = 0; line < 6; line++)
//  175             LCD_write_byte(font6x8[n[i - 1]][line], 1); //��ACSII����ж�ȡ�ֽڣ�Ȼ��д��Һ��
??LCD_Write_Num_3:
        MOVS     R1,#+1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADD      R0,SP,#+0
        ADDS     R0,R0,R7, LSL #+1
        LDRH     R0,[R0, #-2]
        MOVS     R2,#+6
        LDR.W    R3,??DataTable6_1
        MLA      R0,R2,R0,R3
        LDRB     R0,[R8, R0]
        BL       LCD_write_byte
        ADDS     R8,R8,#+1
??LCD_Write_Num_4:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+6
        BCC.N    ??LCD_Write_Num_3
        SUBS     R7,R7,#+1
??LCD_Write_Num_2:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BCC.N    ??LCD_Write_Num_5
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        SUBS     R0,R6,R7
        MOVS     R2,#+6
        MULS     R0,R2,R0
        UXTAB    R0,R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_set_XY
        MOVS     R8,#+0
        B.N      ??LCD_Write_Num_4
//  176     }
//  177 }
??LCD_Write_Num_5:
        POP      {R0-R8,PC}       ;; return
//  178 
//  179 /***********************************************************************
//  180 * �������ƣLLCD_write_english_string()
//  181 * �������ܣ�дӢ���ַ���
//  182 * ��ڲ�����X,Y,*S------x��y��*sΪӢ���ַ���
//  183 * ���ڲ�������
//  184 * �޸���  ��MY
//  185 * �޸�ʱ�䣺2012/09/24
//  186 ***********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  187 void LCD_write_english_string(uint8 X, uint8 Y, int8 *s)
//  188 {
LCD_write_english_string:
        PUSH     {R4,LR}
        MOVS     R4,R2
//  189     LCD_set_XY(X, Y); //��궨λ
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_set_XY
        B.N      ??LCD_write_english_string_0
//  190     while (*s)
//  191     {
//  192         LCD_write_char(*s);
??LCD_write_english_string_1:
        LDRB     R0,[R4, #+0]
        BL       LCD_write_char
//  193         s++;
        ADDS     R4,R4,#+1
//  194     }
??LCD_write_english_string_0:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BNE.N    ??LCD_write_english_string_1
//  195 }
        POP      {R4,PC}          ;; return
//  196 
//  197 /**********************************************************************
//  198 * �������ƣ�LCD_write_chinesee()
//  199 * �������ܣ�дһ������
//  200 * ��ڲ�����x,������;y,������;hz,Ҫ��ʾ�ĺ���
//  201 * ���ڲ�������
//  202 * �޸���  ��MY
//  203 * �޸�ʱ�䣺2012/09/24
//  204 **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  205 void LCD_write_chinese(uint8 x, uint8 y, int8 *hz)
//  206 {
LCD_write_chinese:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  207     uint8 k, i;
//  208     for(k = 0; k < sizeof(GB_12) / sizeof(GB_12[0]); k++) //���Һ��ֱ�����еĺ���
        MOVS     R6,#+0
        B.N      ??LCD_write_chinese_0
??LCD_write_chinese_1:
        ADDS     R6,R6,#+1
??LCD_write_chinese_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+13
        BCS.N    ??LCD_write_chinese_2
//  209     {
//  210         if((hz[0] == GB_12[k].Index[0]) && (hz[1] == GB_12[k].Index[1]))
        LDRB     R0,[R2, #+0]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+26
        LDR.N    R3,??DataTable6_2
        MLA      R1,R1,R6,R3
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??LCD_write_chinese_1
        LDRB     R0,[R2, #+1]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+26
        LDR.N    R3,??DataTable6_2
        MLA      R1,R1,R6,R3
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BNE.N    ??LCD_write_chinese_1
//  211             break;
//  212     }
//  213     LCD_set_XY(x, y); //��궨λ
??LCD_write_chinese_2:
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_set_XY
//  214     for(i = 0; i < 12; i++) //��д�ϰ��ֽ�
        MOVS     R7,#+0
        B.N      ??LCD_write_chinese_3
//  215         LCD_write_byte(GB_12[k].Msk[i], 1);
??LCD_write_chinese_4:
        MOVS     R1,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+26
        LDR.N    R2,??DataTable6_2
        MLA      R0,R0,R6,R2
        ADDS     R0,R7,R0
        LDRB     R0,[R0, #+2]
        BL       LCD_write_byte
        ADDS     R7,R7,#+1
??LCD_write_chinese_3:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+12
        BCC.N    ??LCD_write_chinese_4
//  216     LCD_set_XY(x, y + 1); //��궨λ��һ��
        ADDS     R1,R5,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_set_XY
//  217     for(i = 12; i < 24; i++) //��д�°��ֽ�
        MOVS     R7,#+12
        B.N      ??LCD_write_chinese_5
//  218         LCD_write_byte(GB_12[k].Msk[i], 1);
??LCD_write_chinese_6:
        MOVS     R1,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+26
        LDR.N    R2,??DataTable6_2
        MLA      R0,R0,R6,R2
        ADDS     R0,R7,R0
        LDRB     R0,[R0, #+2]
        BL       LCD_write_byte
        ADDS     R7,R7,#+1
??LCD_write_chinese_5:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+24
        BCC.N    ??LCD_write_chinese_6
//  219 }
        POP      {R0,R4-R7,PC}    ;; return
//  220 
//  221 /***********************************************************************
//  222 * �������ƣ� LCD_write_chinese_sring()
//  223 * �������ܣ�д���ִ�
//  224 * ��ڲ�����x,������;y,������;string,Ҫ��ʾ�ĺ��ִ�
//  225 * ���ڲ�������
//  226 * �޸���  ��MY
//  227 * �޸�ʱ�䣺2012/09/24
//  228 ***********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  229 void LCD_write_chinese_string(uint8 x, uint8 y, int8 *string)
//  230 {
LCD_write_chinese_string:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  231     uint8 i = 0;
        MOVS     R7,#+0
        B.N      ??LCD_write_chinese_string_0
//  232     while(string[i])
//  233     {
//  234         LCD_write_chinese(x, y, &string[i]);
??LCD_write_chinese_string_1:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R2,R7,R6
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_write_chinese
//  235         x = x + 12;
        ADDS     R4,R4,#+12
//  236         i = i + 2;
        ADDS     R7,R7,#+2
//  237     }
??LCD_write_chinese_string_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R0,[R7, R6]
        CMP      R0,#+0
        BNE.N    ??LCD_write_chinese_string_1
//  238 }
        POP      {R0,R4-R7,PC}    ;; return
//  239 
//  240 /***********************************************************************
//  241 * �������ƣ� LCD_Write_String()
//  242 * �������ܣ�д�ַ���(��Ӣ��)
//  243 * ��ڲ�����x,������;y,������;String,Ҫ��ʾ���ַ���
//  244 * ���ڲ�������
//  245 * �޸���  ��
//  246 * �޸�ʱ�䣺
//  247 * ����ʵ����LCD_write_string(0, 3, "MyLove:");
//  248 ***********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  249 void LCD_Write_String(uint8 x, uint8 y, int8 *string)
//  250 {
LCD_Write_String:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  251     uint8 i = 0, xh = 0, yh = 0;
        MOVS     R9,#+0
        MOVS     R7,#+0
        MOVS     R8,#+0
//  252     uint8 kk, ii;
//  253     int8 *cc;
//  254     xh = x, yh = y;
        MOVS     R7,R4
        MOV      R8,R5
//  255     while(string[i])
??LCD_Write_String_0:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R6]
        CMP      R0,#+0
        BEQ.W    ??LCD_Write_String_1
//  256     {
//  257         for(kk = 0; kk < sizeof(GB_12) / sizeof(GB_12[0]); kk++) //���Һ��ֱ�����еĺ���
        MOVS     R10,#+0
        B.N      ??LCD_Write_String_2
//  258         {
//  259             if((string[i] == GB_12[kk].Index[0]) && (string[i + 1] == GB_12[kk].Index[1]))
//  260             {
//  261                 LCD_set_XY(xh + i * 6, yh); //��궨λ
//  262                 for(ii = 0; ii < 12; ii++) //��д�ϰ��ֽ�
//  263                     LCD_write_byte(GB_12[kk].Msk[ii], 1);
//  264                 LCD_set_XY(xh + i * 6, yh + 1); //��궨λ��һ��
//  265                 for(ii = 12; ii < 24; ii++) //��д�°��ֽ�
//  266                     LCD_write_byte(GB_12[kk].Msk[ii], 1);
//  267                 i = i + 2;
//  268             }
//  269             else if((string[i] >= 32) && (string[i] <= 121))
??LCD_Write_String_3:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R6]
        SUBS     R0,R0,#+32
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+90
        BCS.N    ??LCD_Write_String_4
//  270             {
//  271                 cc = &string[i];
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        ADDS     R11,R9,R6
//  272                 LCD_set_XY(x + i * 6, y);
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        MOVS     R0,#+6
        MUL      R0,R0,R9
        UXTAB    R0,R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_set_XY
//  273                 LCD_write_char(*cc);
        LDRB     R0,[R11, #+0]
        BL       LCD_write_char
//  274                 i = i + 1;
        ADDS     R9,R9,#+1
//  275             }
??LCD_Write_String_4:
        ADDS     R10,R10,#+1
??LCD_Write_String_2:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+13
        BCS.N    ??LCD_Write_String_0
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R6]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+26
        LDR.N    R2,??DataTable6_2
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE.N    ??LCD_Write_String_3
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        ADDS     R0,R9,R6
        LDRB     R0,[R0, #+1]
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R1,#+26
        LDR.N    R2,??DataTable6_2
        MLA      R1,R1,R10,R2
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BNE.N    ??LCD_Write_String_3
        MOV      R1,R8
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        MOVS     R0,#+6
        MUL      R0,R0,R9
        UXTAB    R0,R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_set_XY
        MOVS     R11,#+0
        B.N      ??LCD_Write_String_5
??LCD_Write_String_6:
        MOVS     R1,#+1
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+26
        LDR.N    R2,??DataTable6_2
        MLA      R0,R0,R10,R2
        ADDS     R0,R11,R0
        LDRB     R0,[R0, #+2]
        BL       LCD_write_byte
        ADDS     R11,R11,#+1
??LCD_Write_String_5:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+12
        BCC.N    ??LCD_Write_String_6
        ADDS     R1,R8,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        MOVS     R0,#+6
        MUL      R0,R0,R9
        UXTAB    R0,R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_set_XY
        MOVS     R11,#+12
        B.N      ??LCD_Write_String_7
??LCD_Write_String_8:
        MOVS     R1,#+1
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        MOVS     R0,#+26
        LDR.N    R2,??DataTable6_2
        MLA      R0,R0,R10,R2
        ADDS     R0,R11,R0
        LDRB     R0,[R0, #+2]
        BL       LCD_write_byte
        ADDS     R11,R11,#+1
??LCD_Write_String_7:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+24
        BCC.N    ??LCD_Write_String_8
        ADDS     R9,R9,#+2
        B.N      ??LCD_Write_String_4
//  276         }
//  277     }
//  278 }
??LCD_Write_String_1:
        POP      {R0,R4-R11,PC}   ;; return
//  279 
//  280 /***********************************************************
//  281 *�������ƣ�LCD_draw_bmp_pixel
//  282 *�������ܣ�λͼ���ƺ���
//  283 *��ڲ�����X��Y    ��λͼ���Ƶ���ʼX��Y���ꣻ
//  284            *map    ��λͼ�������ݣ�
//  285            Pix_x   ��λͼ���أ�����
//  286            Pix_y   ��λͼ���أ���
//  287 *���ڲ�������
//  288 *�޸���  ��MY
//  289 *�޸�ʱ�䣺2012/09/24
//  290 *�� ע��
//  291 ***********************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  292 void LCD_draw_bmp_pixel(uint8 X, uint8 Y, uint8 *map, uint8 Pix_x, uint8 Pix_y)
//  293 {
LCD_draw_bmp_pixel:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R0,[SP, #+32]
//  294     uint8 i, n;
//  295     uint8 row;
//  296     //����λͼ��ռ����
//  297     if (Pix_y % 8 == 0) 		//���Ϊλͼ��ռ����Ϊ����
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+8
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.N    ??LCD_draw_bmp_pixel_0
//  298         row = Pix_y / 8;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+8
        SDIV     R8,R0,R1
        B.N      ??LCD_draw_bmp_pixel_1
//  299     else
//  300         row = Pix_y / 8 + 1;		//���Ϊλͼ��ռ������������
??LCD_draw_bmp_pixel_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,#+8
        SDIV     R0,R0,R1
        ADDS     R8,R0,#+1
//  301 
//  302     LCD_set_XY(X, Y);
??LCD_draw_bmp_pixel_1:
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_set_XY
//  303     for (n = 0; n < row; n++)		//����
        MOVS     R9,#+0
        B.N      ??LCD_draw_bmp_pixel_2
//  304     {
//  305         for(i = 0; i < Pix_x; i++)
//  306         {
//  307             LCD_set_XY(X + i, Y + n);
??LCD_draw_bmp_pixel_3:
        ADDS     R1,R9,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R10,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_set_XY
//  308             LCD_write_byte(map[i + n * Pix_x], 1);
        MOVS     R1,#+1
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MUL      R0,R7,R9
        UXTAB    R0,R0,R10
        LDRB     R0,[R0, R6]
        BL       LCD_write_byte
//  309         }
        ADDS     R10,R10,#+1
??LCD_draw_bmp_pixel_4:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R10,R7
        BCC.N    ??LCD_draw_bmp_pixel_3
        ADDS     R9,R9,#+1
??LCD_draw_bmp_pixel_2:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R9,R8
        BCS.N    ??LCD_draw_bmp_pixel_5
        MOVS     R10,#+0
        B.N      ??LCD_draw_bmp_pixel_4
//  310     }
//  311 }
??LCD_draw_bmp_pixel_5:
        POP      {R4-R10,PC}      ;; return
//  312 
//  313 
//  314 
//  315 /*=============================�ڲ�����ʵ��===================================*/
//  316 
//  317 /**********************************************************************
//  318 * �������ƣ�LCD_write_byte()
//  319 * �������ܣ�дһ���ֽ�
//  320 * ��ڲ�����data,Ҫд����ֽ�;command:0Ϊ����,1Ϊ����
//  321 * ���ڲ�������
//  322 * �޸���  ��MY
//  323 * �޸�ʱ�䣺2012/09/24
//  324 ***********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  325 void LCD_write_byte(uint8 data, uint8 command)
//  326 {
//  327     uint8 i;
//  328     LCD_CE(0);
LCD_write_byte:
        LDR.N    R2,??DataTable6  ;; 0x400ff100
        LDR      R2,[R2, #+0]
        BICS     R2,R2,#0x8
        LDR.N    R3,??DataTable6  ;; 0x400ff100
        STR      R2,[R3, #+0]
//  329     //GPIOE_PDOR &= GPIO_PDOR_PDO(GPIO_PIN_Set0(24));
//  330     if (command == 0)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??LCD_write_byte_0
//  331         LCD_DC(0);
        LDR.N    R1,??DataTable6  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x4
        LDR.N    R2,??DataTable6  ;; 0x400ff100
        STR      R1,[R2, #+0]
        B.N      ??LCD_write_byte_1
//  332         //GPIOE_PDOR &= GPIO_PDOR_PDO(GPIO_PIN_Set0(26));
//  333     else
//  334         LCD_DC(1);
??LCD_write_byte_0:
        LDR.N    R1,??DataTable6  ;; 0x400ff100
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x4
        LDR.N    R2,??DataTable6  ;; 0x400ff100
        STR      R1,[R2, #+0]
//  335         //GPIOE_PDOR |= GPIO_PDOR_PDO(GPIO_PIN_Set1(26));
//  336     for(i = 0; i < 8; i++)
??LCD_write_byte_1:
        MOVS     R1,#+0
        B.N      ??LCD_write_byte_2
//  337     {
//  338         if(data & 0x80)
//  339             SDIN(1);
//  340             //GPIOE_PDOR |= GPIO_PDOR_PDO(GPIO_PIN_Set1(27));
//  341         else
//  342             SDIN(0);
??LCD_write_byte_3:
        LDR.N    R2,??DataTable6  ;; 0x400ff100
        LDR      R2,[R2, #+0]
        BICS     R2,R2,#0x2
        LDR.N    R3,??DataTable6  ;; 0x400ff100
        STR      R2,[R3, #+0]
//  343             //GPIOE_PDOR &= GPIO_PDOR_PDO(GPIO_PIN_Set0(27));
//  344         SCLK(0);        //���ݴӵ�Ƭ������DDRK5�Ĵ���
??LCD_write_byte_4:
        LDR.N    R2,??DataTable6  ;; 0x400ff100
        LDR      R2,[R2, #+0]
        LSRS     R2,R2,#+1
        LSLS     R2,R2,#+1
        LDR.N    R3,??DataTable6  ;; 0x400ff100
        STR      R2,[R3, #+0]
//  345         //GPIOE_PDOR &= GPIO_PDOR_PDO(GPIO_PIN_Set0(28));
//  346         data = data << 1;
        LSLS     R0,R0,#+1
//  347         SCLK(1);        //���ݴ�DDR5�Ĵ��������5110
        LDR.N    R2,??DataTable6  ;; 0x400ff100
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x1
        LDR.N    R3,??DataTable6  ;; 0x400ff100
        STR      R2,[R3, #+0]
        ADDS     R1,R1,#+1
??LCD_write_byte_2:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+8
        BCS.N    ??LCD_write_byte_5
        LSLS     R2,R0,#+24
        BPL.N    ??LCD_write_byte_3
        LDR.N    R2,??DataTable6  ;; 0x400ff100
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x2
        LDR.N    R3,??DataTable6  ;; 0x400ff100
        STR      R2,[R3, #+0]
        B.N      ??LCD_write_byte_4
//  348         //GPIOE_PDOR |= GPIO_PDOR_PDO(GPIO_PIN_Set1(28));
//  349     }
//  350     LCD_CE(1);
??LCD_write_byte_5:
        LDR.N    R0,??DataTable6  ;; 0x400ff100
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable6  ;; 0x400ff100
        STR      R0,[R1, #+0]
//  351     //GPIOE_PDOR |= GPIO_PDOR_PDO(GPIO_PIN_Set1(24));
//  352 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     font6x8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     GB_12
//  353 
//  354 
//  355 /**********************************************************************
//  356 * �������ƣ�LCD_set_XY()
//  357 * �������ܣ���궨λx��y��
//  358 * ��ڲ�����X,Y   x��y��
//  359 * ���ڲ�������
//  360 * �޸���  ��MY
//  361 * �޸�ʱ�䣺2012/09/24
//  362 **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  363 void LCD_set_XY(uint8 X, uint8 Y)
//  364 {
LCD_set_XY:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R1
//  365     LCD_write_byte(0x40 | Y, 0);		// column
        MOVS     R1,#+0
        ORRS     R0,R0,#0x40
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_write_byte
//  366     LCD_write_byte(0x80 | X, 0);        // row
        MOVS     R1,#+0
        ORRS     R0,R4,#0x80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_write_byte
//  367 }
        POP      {R4,PC}          ;; return
//  368 
//  369 
//  370 /**********************************************************************
//  371 * �������ƣ�Delay_ms������Delay_us������
//  372 * �������ܣ���ʱ����
//  373 * ��ڲ�����
//  374 * ���ڲ�����
//  375 * �޸���  ��
//  376 * �޸�ʱ��
//  377 **********************************************************************/
//  378 /******��ʱms******/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  379 void Delay_ms(uint16 mt)
//  380 {
//  381     uint16 mx, my;
//  382     for(mx = 5000; mx > 0; mx--)//7800
Delay_ms:
        MOVW     R1,#+5000
        B.N      ??Delay_ms_0
//  383         for(my = mt; my > 0; my--);
??Delay_ms_1:
        SUBS     R2,R2,#+1
??Delay_ms_2:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+1
        BCS.N    ??Delay_ms_1
        SUBS     R1,R1,#+1
??Delay_ms_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+1
        BCC.N    ??Delay_ms_3
        MOVS     R2,R0
        B.N      ??Delay_ms_2
//  384 }
??Delay_ms_3:
        BX       LR               ;; return
//  385 /******��ʱus******/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  386 void Delay_us(uint16 ut)
//  387 {
//  388     uint16 ux, uy;
//  389     for(ux = 0; ux <= 800; ux++)
Delay_us:
        MOVS     R1,#+0
        B.N      ??Delay_us_0
//  390         for(uy = ut; uy > 0; uy--);
??Delay_us_1:
        SUBS     R2,R2,#+1
??Delay_us_2:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+1
        BCS.N    ??Delay_us_1
        ADDS     R1,R1,#+1
??Delay_us_0:
        MOVW     R2,#+801
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,R2
        BCS.N    ??Delay_us_3
        MOVS     R2,R0
        B.N      ??Delay_us_2
//  391 }
??Delay_us_3:
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
//  392 
//  393 //#ifdef  __cplusplus
//  394 //}
//  395 //#endif
// 
//   552 bytes in section .data
//   352 bytes in section .rodata
// 1 570 bytes in section .text
// 
// 1 570 bytes of CODE  memory
//   352 bytes of CONST memory
//   552 bytes of DATA  memory
//
//Errors: none
//Warnings: none
