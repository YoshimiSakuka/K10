///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    13/Mar/2015  12:44:25 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Administrator\Desktop\3.11换结构BLOCK nd       /
//                    black\common\ov7670.c                                   /
//    Command line =  "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\common\ov7670.c" -D DEBUG -lCN                    /
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
//                    black\Debug\List\ov7670.s                               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ov7670

        #define SHT_PROGBITS 0x1

        PUBLIC OV7670_QQVGA_reg
        PUBLIC OV7670_QVGA_reg

// C:\Users\Administrator\Desktop\3.11换结构BLOCK nd  black\common\ov7670.c
//    1 #include "ov7670.h"
//    2 #include "FIFO.h"
//    3 #include "sccb.h"
//    4 #include "config.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute char const OV7670_QVGA_reg[172][2]
OV7670_QVGA_reg:
        DATA
        DC8 58, 4, 64, 208, 18, 20, 50, 128, 23, 22, 24, 4, 25, 2, 26, 123, 3
        DC8 6, 12, 0, 62, 0, 112, 0, 113, 133, 114, 17, 115, 0, 162, 2, 17, 2
        DC8 122, 32, 123, 28, 124, 40, 125, 60, 126, 85, 127, 104, 128, 118
        DC8 129, 128, 130, 136, 131, 143, 132, 150, 133, 163, 134, 175, 135
        DC8 196, 136, 215, 137, 232, 19, 229, 0, 0, 7, 63, 16, 255, 13, 0, 20
        DC8 56, 165, 5, 171, 7, 36, 117, 37, 99, 38, 165, 159, 120, 160, 104
        DC8 161, 3, 166, 223, 167, 223, 168, 240, 169, 144, 170, 148, 19, 225
        DC8 14, 97, 15, 75, 22, 2, 30, 23, 33, 2, 34, 145, 41, 7, 51, 11, 53
        DC8 11, 55, 29, 56, 113, 57, 42, 60, 120, 77, 64, 78, 32, 105, 12, 107
        DC8 128, 116, 25, 141, 79, 142, 0, 143, 0, 144, 0, 145, 0, 146, 0, 150
        DC8 0, 154, 128, 176, 132, 177, 12, 178, 14, 179, 130, 184, 10, 67, 20
        DC8 68, 240, 69, 52, 70, 88, 71, 40, 72, 58, 89, 136, 90, 136, 91, 68
        DC8 92, 103, 93, 73, 94, 14, 100, 4, 101, 32, 102, 5, 148, 4, 149, 8
        DC8 108, 10, 109, 85, 110, 17, 111, 159, 106, 0, 1, 128, 2, 128, 19
        DC8 231, 21, 2, 79, 128, 80, 128, 81, 0, 82, 34, 83, 94, 84, 128, 88
        DC8 158, 65, 8, 63, 8, 117, 5, 118, 225, 76, 0, 119, 1, 61, 194, 75, 9
        DC8 201, 96, 65, 56, 86, 64, 52, 17, 59, 2, 164, 137, 150, 0, 151, 48
        DC8 152, 32, 153, 48, 154, 132, 155, 41, 156, 3, 157, 76, 158, 63, 120
        DC8 4, 121, 1, 200, 240, 121, 15, 200, 0, 121, 16, 200, 126, 121, 10
        DC8 200, 128, 121, 11, 200, 1, 121, 12, 200, 15, 121, 13, 200, 32, 121
        DC8 9, 200, 128, 121, 2, 200, 192, 121, 3, 200, 64, 121, 5, 200, 48
        DC8 121, 38, 9, 3, 85, 0, 86, 96, 59, 130, 45, 1, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute char const OV7670_QQVGA_reg[172][2]
OV7670_QQVGA_reg:
        DATA
        DC8 17, 128, 59, 10, 58, 4, 18, 4, 140, 0, 64, 208, 23, 22, 24, 4, 50
        DC8 36, 25, 2, 26, 122, 3, 10, 21, 2, 12, 4, 62, 26, 114, 34, 115, 242
        DC8 30, 23, 79, 128, 80, 128, 81, 0, 82, 34, 83, 94, 84, 128, 86, 64
        DC8 88, 158, 89, 136, 90, 136, 91, 68, 92, 103, 93, 73, 94, 14, 105, 0
        DC8 106, 64, 107, 10, 108, 10, 109, 85, 110, 17, 111, 159, 176, 132, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//    5 
//    6 //想使用此模块需要#define   OV7670
//    7 #ifdef OV7670
//    8 extern const  char OV7670_QVGA_reg[OV7670_REG_NUM][2];
//    9 extern const  char OV7670_QQVGA_reg[OV7670_REG_NUM][2];
//   10 uint8 bn = 0;
//   11 
//   12 uint16 OV7670_Pic[160][72] = 0;//240，320
//   13 uint16 Color = 0;
//   14 uint8 ColorH = 0,ColorL = 0;
//   15 
//   16 ///////////////////////////////////////////////////////////////////////////
//   17 //功能：写OV7660寄存器
//   18 //返回：1-成功	0-失败
//   19 //guanfu_wang
//   20 unsigned char wr_Sensor_Reg(unsigned char regID, unsigned char regDat)
//   21 {
//   22 		startSCCB();//发送SCCB 总线开始传输命令
//   23 	if(0==SCCBwriteByte(0x42))//写地址
//   24 	{
//   25 		stopSCCB();//发送SCCB 总线停止传输命令
//   26 		return(0);//错误返回
//   27 	}
//   28 	delay_sccb(SCCB_TIME);
//   29   	if(0==SCCBwriteByte(regID))//积存器ID
//   30 	{
//   31 		stopSCCB();//发送SCCB 总线停止传输命令
//   32 		return(0);//错误返回
//   33 	}
//   34   	delay_sccb(SCCB_TIME);
//   35   	if(0==SCCBwriteByte(regDat))//写数据到积存器
//   36 	{
//   37 		stopSCCB();//发送SCCB 总线停止传输命令
//   38 		return(0);//错误返回
//   39 	}
//   40   	stopSCCB();//发送SCCB 总线停止传输命令
//   41 	
//   42   	return(1);//成功返回
//   43 }
//   44 
//   45 
//   46 
//   47 
//   48 ////////////////////////////
//   49 //功能：读OV7660寄存器
//   50 //返回：1-成功	0-失败
//   51 //guanfu_wang
//   52 unsigned char rd_Sensor_Reg(unsigned char regID, unsigned char *regDat)
//   53 {
//   54 	//通过写操作设置寄存器地址
//   55 	startSCCB();
//   56 	if(0==SCCBwriteByte(0x42))//写地址
//   57 	{
//   58 		stopSCCB();//发送SCCB 总线停止传输命令
//   59 		return(0);//错误返回
//   60 	}
//   61 	delay_sccb(SCCB_TIME);
//   62   	if(0==SCCBwriteByte(regID))//积存器ID
//   63 	{
//   64 		stopSCCB();//发送SCCB 总线停止传输命令
//   65 		return(0);//错误返回
//   66 	}
//   67 	stopSCCB();//发送SCCB 总线停止传输命令
//   68 	
//   69 	delay_sccb(SCCB_TIME);
//   70 	
//   71 	//设置寄存器地址后，才是读
//   72 	startSCCB();
//   73 	if(0==SCCBwriteByte(0x43))//读地址
//   74 	{
//   75 		stopSCCB();//发送SCCB 总线停止传输命令
//   76 		return(0);//错误返回
//   77 	}
//   78 	delay_sccb(SCCB_TIME);
//   79   	*regDat=SCCBreadByte();//返回读到的值
//   80   	noAck();//发送NACK命令
//   81   	stopSCCB();//发送SCCB 总线停止传输命令
//   82   	return(1);//成功返回
//   83 }
//   84 
//   85 
//   86 
//   87 unsigned char temp;
//   88 uint8 Camera_Init(uint8 mode)
//   89 {
//   90     	
//   91     //
//   92 	
//   93 	unsigned int i=0;
//   94     //     XCLK_init_ON();//开启MCO功能 提供时钟给CMOS传感器
//   95 	//uchar ovidmsb=0,ovidlsb=0;
//   96 	
//   97 	
//   98 	
//   99 	temp=0x80;
//  100 	if(0==wr_Sensor_Reg(0x12, temp)) //Reset SCCB
//  101 	{
//  102           return 0 ;//错误返回
//  103 	}
//  104 	delay_sccb(SCCB_TIME);
//  105 	if(0==rd_Sensor_Reg(0x0b, &temp))//读ID
//  106 	{
//  107 		return 0 ;//错误返回
//  108 	}
//  109         
//  110     if(temp==0x73)//OV7670
//  111 	{
//  112 	    if(mode==QVGA)
//  113         {
//  114             for(i=0;i<OV7670_REG_NUM;i++)
//  115             {
//  116                 if( 0==wr_Sensor_Reg(OV7670_QVGA_reg[i][0],OV7670_QVGA_reg[i][1]))
//  117                 {
//  118                     return 0;//错误返回
//  119                 }
//  120             }
//  121         }
//  122         if(mode==QQVGA)
//  123         {
//  124             for(i=0;i<OV7670_REG_NUM;i++)
//  125             {
//  126                 if( 0==wr_Sensor_Reg(OV7670_QQVGA_reg[i][0],OV7670_QQVGA_reg[i][1]))
//  127                 {
//  128                     return 0;//错误返回
//  129                 }
//  130             }
//  131         }
//  132    	  
//  133 	}
//  134 
//  135         ////////////////////////////////  FIFO读指针复位    
//  136       FIFO_RRST_L(); 
//  137       FIFO_RCK_L();		//RCK
//  138       FIFO_RCK_H();
//  139       FIFO_RCK_L();
//  140       FIFO_RRST_H();
//  141       FIFO_RCK_H();
//  142       ///////////////////////////
//  143 	  
//  144 	  OV7670_CS_L();
//  145 	return 0x01; //ok
//  146 
//  147 }
//  148 
//  149 
//  150 void OV7670_IO_Init()
//  151 {
//  152   	uint8 i;
//  153 	(void)GPIO_Init(PORT_C,6,GPO,LVL_L);		//WE
//  154 	(void)GPIO_Init(PORT_C,10,GPO,LVL_L);		//RRST  
//  155 	(void)GPIO_Init(PORT_C,8,GPO,LVL_L);		//FIFO_CS   WRST
//  156   	(void)GPIO_Init(PORT_D,0,GPO,LVL_L);		//RD
//  157 	
//  158 	
//  159 	(void)GPIO_Init(PORT_C,12,GPO,LVL_H);		//CS
//  160   
//  161   
//  162   
//  163   	(void)GPIO_Init(PORT_C,9,GPO_HDS,LVL_H);		//SIC
//  164   	(void)GPIO_Init(PORT_C,11,GPO_HDS,LVL_H);		//SID
//  165         //GPIO_Init(PORT_D,7,GPI,GPI_UP);
//  166   
//  167   	for(i=0;i<8;i++)							//DATA
//  168 	{
//  169 		(void)GPIO_Init(PORT_B,i,GPI_UP,GPI_UP);
//  170 	}
//  171 //        (void)GPIO_Init(PORT_C,13,GPI,GPI_UP);
//  172 //        (void)GPIO_Init(PORT_D,5,GPI,GPI_UP);
//  173 //        (void)GPIO_Init(PORT_D,6,GPI,GPI_UP);
//  174 //        (void)GPIO_Init(PORT_C,7,GPI,GPI_UP);
//  175 //        (void)GPIO_Init(PORT_D,4,GPI,GPI_UP);
//  176 //        (void)GPIO_Init(PORT_D,3,GPI,GPI_UP);
//  177 //        (void)GPIO_Init(PORT_D,2,GPI,GPI_UP);
//  178 //        (void)GPIO_Init(PORT_D,1,GPI,GPI_UP);
//  179         
//  180         (void)GPIO_Init(PORT_C,13,GPI,GPI);
//  181         (void)GPIO_Init(PORT_D,5,GPI,GPI);
//  182         (void)GPIO_Init(PORT_D,6,GPI,GPI);
//  183         (void)GPIO_Init(PORT_C,7,GPI,GPI);
//  184         (void)GPIO_Init(PORT_D,4,GPI,GPI);
//  185         (void)GPIO_Init(PORT_D,3,GPI,GPI);
//  186         (void)GPIO_Init(PORT_D,2,GPI,GPI);
//  187         (void)GPIO_Init(PORT_D,1,GPI,GPI);
//  188 
//  189         
//  190 }
//  191 
//  192 
//  193 
//  194 
//  195 void GetPic(void)
//  196 {
//  197   //uint16 Color = 0;
//  198   U32 i;
//  199   uint16 *point;
//  200   //uint8 ColorH = 0,ColorL = 0;
//  201   if(VSYNC_STA == 2)
//  202   {
//  203     FIFO_RRST_L();    //复位读指针
//  204     FIFO_RCK_L();
//  205     FIFO_RCK_H();
//  206     FIFO_RCK_L();
//  207     FIFO_RRST_H();
//  208     FIFO_RCK_H();
//  209   
//  210      LCD_WRITE_CMD(0x00,0x50);        LCD_WRITE_DATA(0x00,0x00);        //hs
//  211      LCD_WRITE_CMD(0x00,0x51);        LCD_WRITE_DATA(0x00,0xef);        //he
//  212      LCD_WRITE_CMD(0x00,0x52);        LCD_WRITE_DATA(0x00,0x00);        //vs
//  213      LCD_WRITE_CMD(0x00,0x53);        LCD_WRITE_DATA(0x01,0x3f);        //ve
//  214      LCD_WRITE_CMD(0x00,0x20);        LCD_WRITE_DATA(0x00,0x00);        //h
//  215      LCD_WRITE_CMD(0x00,0x21);        LCD_WRITE_DATA(0x00,0x00);        //v
//  216      LCD_WRITE_CMD(0x00,0x22);
//  217      
//  218     for(i=0;i<76800;i++)  //320*240
//  219     {
//  220       //point = OV7670_Pic[0];
//  221       FIFO_RCK_L();
//  222       //delay_sccb(300);
//  223       //ColorH = ((GPIO_GetBit(PORT_C,13) << 7) |  (GPIO_GetBit(PORT_D,5) << 6) | (GPIO_GetBit(PORT_D,6) << 5) | (GPIO_GetBit(PORT_C,7) << 4) | (GPIO_GetBit(PORT_D,4) << 3) | (GPIO_GetBit(PORT_D,3) << 2) | (GPIO_GetBit(PORT_D,2) << 1) | (GPIO_GetBit(PORT_D,1)));
//  224       ColorH = (uint8)GPIO_PDIR_REG(PTB_BASE_PTR);
//  225       delay_sccb(ov7670time);
//  226       Color = ColorH;
//  227       FIFO_RCK_H();
//  228       Color <<= 8;
//  229       FIFO_RCK_L();
//  230       delay_sccb(ov7670time);
//  231       //delay_sccb(300);
//  232       //Color |= ((GPIO_GetBit(PORT_C,13) << 7) | (GPIO_GetBit(PORT_D,5) << 6) | (GPIO_GetBit(PORT_D,6) << 5) | (GPIO_GetBit(PORT_C,7) << 4) | (GPIO_GetBit(PORT_D,4) << 3) | (GPIO_GetBit(PORT_D,3) << 2) | (GPIO_GetBit(PORT_D,2) << 1) | (GPIO_GetBit(PORT_D,1)));
//  233       //ColorL = ((GPIO_GetBit(PORT_C,13) << 7) | (GPIO_GetBit(PORT_D,5) << 6) | (GPIO_GetBit(PORT_D,6) << 5) | (GPIO_GetBit(PORT_C,7) << 4) | (GPIO_GetBit(PORT_D,4) << 3) | (GPIO_GetBit(PORT_D,3) << 2) | (GPIO_GetBit(PORT_D,2) << 1) | (GPIO_GetBit(PORT_D,1)));
//  234       ColorL = (uint8)GPIO_PDIR_REG(PTB_BASE_PTR);
//  235       FIFO_RCK_H();
//  236       
//  237       LCD_WRITE_DATA(ColorH,ColorL);
//  238       //LCD_WRITE_DATA((char)i,0);
//  239       //*point = Color;
//  240       //point++;
//  241     
//  242     }
//  243     VSYNC_STA = 0;
//  244     Ftm_enable_int(0);
//  245   }
//  246   
//  247 }
//  248 
//  249 #endif
// 
// 688 bytes in section .rodata
// 
// 688 bytes of CONST memory
//
//Errors: none
//Warnings: none
