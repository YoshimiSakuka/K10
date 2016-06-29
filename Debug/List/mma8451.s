///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       26/May/2016  12:04:57
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\mma8451.c
//    Command line =  
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\mma8451.c" -D DEBUG -lCN
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -lB
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\" -o
//        "C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\Obj\" --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -Ol --use_c++_inline
//    List file    =  C:\Users\ye\Desktop\NFS.NO 2 - 副本\Debug\List\mma8451.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN I2C_ReadAddr
        EXTERN I2C_WriteAddr
        EXTERN I2C_init
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fmul
        EXTERN __aeabi_i2d
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f

        PUBLIC MMA8451_Init
        PUBLIC ReadAcceleration

// C:\Users\ye\Desktop\NFS.NO 2 - 副本\common\mma8451.c
//    1 #include"mma8451.h"
//    2 
//    3 
//    4 
//    5 
//    6 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 void MMA8451_Init(void)                    //地址0x1d
//    8 {
MMA8451_Init:
        PUSH     {R7,LR}
//    9     I2C_init(I2C0);
        MOVS     R0,#+0
        BL       I2C_init
//   10     I2C_WriteAddr(I2C0, 0x1d, 0x0f, 0x10); //低通滤波
        MOVS     R3,#+16
        MOVS     R2,#+15
        MOVS     R1,#+29
        MOVS     R0,#+0
        BL       I2C_WriteAddr
//   11     I2C_WriteAddr(I2C0, 0x1d, 0x0e, 0x00); //2G
        MOVS     R3,#+0
        MOVS     R2,#+14
        MOVS     R1,#+29
        MOVS     R0,#+0
        BL       I2C_WriteAddr
//   12     I2C_WriteAddr(I2C0, 0x1d, 0x2a, 0x01); //激活 
        MOVS     R3,#+1
        MOVS     R2,#+42
        MOVS     R1,#+29
        MOVS     R0,#+0
        BL       I2C_WriteAddr
//   13 }
        POP      {R0,PC}          ;; return
//   14 
//   15 
//   16 
//   17 
//   18 
//   19 //uint16 ReadAcceleration(int time)
//   20 //{
//   21 //    uint16 n;
//   22 //    uint8 zz[2];
//   23 //    int sign;
//   24 //    float v;
//   25 //    uint16 w;
//   26 //    int z=0; 
//   27 //    
//   28 //    for(z=0;z<time;z++)
//   29 //    {
//   30 //      zz[0] = I2C_ReadAddr(I2C0, 0x1d, 0x05);       //z轴高有效位  X 0x01 Y 0x03
//   31 //      zz[1] = I2C_ReadAddr(I2C0, 0x1d, 0x06);       //z轴低有效位  X 0x02 Y 0x04      
//   32 //      if(zz[0]>0x7f)
//   33 //      {
//   34 //        sign = -1;
//   35 //        n = (int)zz[0];	
//   36 //        zz[1] = zz[1]>>2;
//   37 //        n = n<<6 | zz[1];
//   38 //        n = (~n + 1)&0X3FFF;                    //
//   39 //      }
//   40 //      else
//   41 //      {
//   42 //        sign = 1;
//   43 //        n = (int)zz[0];	
//   44 //        zz[1] = zz[1]>>2;
//   45 //        n = n<<6 | zz[1];
//   46 //      }
//   47 //      v = sign * ((float)n);
//   48 //      w += (uint16)((v ) * 0.25);//+ 5120
//   49 //    }
//   50 //      return w; 
//   51 //
//   52 //}
//   53 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   54 float ReadAcceleration(int f,int time)//0 1
//   55 {
ReadAcceleration:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+8
        MOVS     R6,R0
        MOV      R8,R1
//   56     uint16 n;
//   57     uint8 zz[2];
//   58     int sign;
//   59     float v;
//   60     double w = 0;
        MOVS     R4,#+0
        MOVS     R5,#+0
//   61     int z=0; 
        MOVS     R7,#+0
//   62     
//   63     for(z=0;z<time;z++)
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??ReadAcceleration_0
//   64     {
//   65       if(f == 0)//Z
//   66       {
//   67         zz[0] = I2C_ReadAddr(I2C0, 0x1d, 0x05);       //z轴高有效位  X 0x01 Y 0x03
//   68         zz[1] = I2C_ReadAddr(I2C0, 0x1d, 0x06);       //z轴低有效位  X 0x02 Y 0x04      
//   69       }
//   70       else if(f == 1)//X
//   71       {
//   72         zz[0] = I2C_ReadAddr(I2C0, 0x1d, 0x01);       //z轴高有效位  X 0x01 Y 0x03
//   73         zz[1] = I2C_ReadAddr(I2C0, 0x1d, 0x02);       //z轴低有效位  X 0x02 Y 0x04
//   74       }
//   75       else if(f == 2)//Y
//   76       {
//   77         zz[0] = I2C_ReadAddr(I2C0, 0x1d, 0x03);       //z轴高有效位  X 0x01 Y 0x03
//   78         zz[1] = I2C_ReadAddr(I2C0, 0x1d, 0x04);       //z轴低有效位  X 0x02 Y 0x04
//   79       }
//   80       if(zz[0]>0x7f)
//   81       {
//   82         sign = -1;
//   83         n = (int)zz[0];	
//   84         zz[1] = zz[1]>>2;
//   85         n = n<<6 | zz[1];
//   86         n = (~n + 1)&0X3FFF;                    //
//   87       }
//   88       else
//   89       {
//   90         sign = 1;
??ReadAcceleration_1:
        MOVS     R0,#+1
//   91         n = (int)zz[0];	
        LDRB     R9,[SP, #+0]
//   92         zz[1] = zz[1]>>2;
        LDRB     R1,[SP, #+1]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+2
        STRB     R1,[SP, #+1]
//   93         n = n<<6 | zz[1];
        LDRB     R1,[SP, #+1]
        ORRS     R9,R1,R9, LSL #+6
//   94       }
//   95       v = sign * ((float)n);
??ReadAcceleration_2:
        BL       __aeabi_i2f
        MOV      R10,R0
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOV      R0,R9
        BL       __aeabi_ui2f
        MOV      R1,R10
        BL       __aeabi_fmul
//   96       w += v ;//+ 5120
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        ADDS     R7,R7,#+1
??ReadAcceleration_0:
        CMP      R7,R8
        BGE.N    ??ReadAcceleration_3
        CMP      R6,#+0
        BNE.N    ??ReadAcceleration_4
        MOVS     R2,#+5
        MOVS     R1,#+29
        MOVS     R0,#+0
        BL       I2C_ReadAddr
        STRB     R0,[SP, #+0]
        MOVS     R2,#+6
        MOVS     R1,#+29
        MOVS     R0,#+0
        BL       I2C_ReadAddr
        STRB     R0,[SP, #+1]
        B.N      ??ReadAcceleration_5
??ReadAcceleration_4:
        CMP      R6,#+1
        BNE.N    ??ReadAcceleration_6
        MOVS     R2,#+1
        MOVS     R1,#+29
        MOVS     R0,#+0
        BL       I2C_ReadAddr
        STRB     R0,[SP, #+0]
        MOVS     R2,#+2
        MOVS     R1,#+29
        MOVS     R0,#+0
        BL       I2C_ReadAddr
        STRB     R0,[SP, #+1]
        B.N      ??ReadAcceleration_5
??ReadAcceleration_6:
        CMP      R6,#+2
        BNE.N    ??ReadAcceleration_5
        MOVS     R2,#+3
        MOVS     R1,#+29
        MOVS     R0,#+0
        BL       I2C_ReadAddr
        STRB     R0,[SP, #+0]
        MOVS     R2,#+4
        MOVS     R1,#+29
        MOVS     R0,#+0
        BL       I2C_ReadAddr
        STRB     R0,[SP, #+1]
??ReadAcceleration_5:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+128
        BLT.N    ??ReadAcceleration_1
        MOVS     R0,#-1
        LDRB     R9,[SP, #+0]
        LDRB     R1,[SP, #+1]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+2
        STRB     R1,[SP, #+1]
        LDRB     R1,[SP, #+1]
        ORRS     R9,R1,R9, LSL #+6
        MVNS     R1,R9
        ADDS     R1,R1,#+1
        LSLS     R9,R1,#+18       ;; ZeroExtS R9,R1,#+18,#+18
        LSRS     R9,R9,#+18
        B.N      ??ReadAcceleration_2
//   97     }
//   98     v = w / time;
??ReadAcceleration_3:
        MOV      R0,R8
        BL       __aeabi_i2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
//   99       return v; 
        POP      {R1,R2,R4-R10,PC}  ;; return
//  100 
//  101 }

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
// 316 bytes in section .text
// 
// 316 bytes of CODE memory
//
//Errors: none
//Warnings: none
