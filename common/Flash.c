#include "Flash.h"

u32 LCD_KP = 0;
u32 LCD_KD = 0;
u32 LCD_KI = 0;

u32 FlashWrite_flag = 0;

//==========================================================================
//函数名称：flash_cmd_launch
//函数返回：0-成功 1-失败
//参数说明：无
//功能概要：启动Flash命令
//==========================================================================
static u32 flash_cmd_launch(void)
{
    
    FTFL_FSTAT = (0
              |	FTFL_FSTAT_CCIF_MASK 		// 启动命令
              |	FTFL_FSTAT_ACCERR_MASK 		// 清除访问错误标志位
              | FTFL_FSTAT_FPVIOL_MASK		// 非法访问标志位
              );	
    									
    while(!(FTFL_FSTAT & FTFL_FSTAT_CCIF_MASK));	// 等待命令完成

    // 检查错误标志
    if( FTFL_FSTAT & (FTFL_FSTAT_ACCERR_MASK | FTFL_FSTAT_FPVIOL_MASK | FTFL_FSTAT_MGSTAT0_MASK))
        return 1 ; 	//执行命令出错
  
    return 0; 	//执行命令成功
}
//===========================================================================

//=================外部接口函数==============================================
//==========================================================================
//函数名称：flash_init
//函数返回：无
//参数说明：无
//功能概要：初始化flash模块
//==========================================================================
void flash_init(void)
{
// 清除Flash预读取缓冲区
    FMC_PFB0CR |= FMC_PFB0CR_S_B_INV_MASK;
    FMC_PFB1CR |= FMC_PFB0CR_S_B_INV_MASK;
    
    while(!(FTFL_FSTAT & FTFL_FSTAT_CCIF_MASK));// 等待命令完成
    
    FTFL_FSTAT = (0
                  |FTFL_FSTAT_ACCERR_MASK 	// 清除访问错误标志位
                  |FTFL_FSTAT_FPVIOL_MASK	// 非法访问标志位
                  );	
}

//==========================================================================
//函数名称：flash_erase_sector
//函数返回：函数执行执行状态：0=正常；非0=异常。
//参数说明：sectorNo：扇区号（K60N512实际使用0~255）
//功能概要：擦除指定flash扇区
//==========================================================================
uint8 flash_erase_sector(uint16 sectorNo)
{
    Dtype	addr;	
    addr.DW = (u32)(sectorNo<<11);	
    //每个扇区2KB，所以扇区地址=扇区号*2K ，这里用 <<11 表示 *2*1024 
    
    // 设置擦除命令
    FTFL_FCCOB0 = ERSSCR; // 擦除扇区命令
    
    // 设置目标地址
    FTFL_FCCOB1 = addr.BB[2];
    FTFL_FCCOB2 = addr.BB[1];
    FTFL_FCCOB3 = addr.BB[0];
    
    // 执行命令序列
    if(1 == flash_cmd_launch())    //若执行命令出现错误
        return 1;     //擦除命令错误
   
    // 若擦除sector0时，则解锁设备
    if(sectorNo ==0)
    {
        // 写入4字节
        FTFL_FCCOB0 = PGM4; 
        // 设置目标地址
        FTFL_FCCOB1 = 0x00;
        FTFL_FCCOB2 = 0x04;
        FTFL_FCCOB3 = 0x0C;
        // 数据
        FTFL_FCCOB4 = 0xFF;
        FTFL_FCCOB5 = 0xFF;
        FTFL_FCCOB6 = 0xFF;
        FTFL_FCCOB7 = 0xFE;
        // 执行命令序列
        if(1 == flash_cmd_launch())  //若执行命令出现错误
            return 2;   //解锁命令错误
    }  
    
    return 0;  //成功返回
}

//==========================================================================
//函数名称：flash_write
//函数返回：函数执行状态：0=正常；非0=异常。
//参数说明：sectorNo：目标扇区号 （K60N512实际使用0~255）
//         offset:写入扇区内部偏移地址（0~2043）
//         data：需要写入的变量（uint32型）
//功能概要：flash写入操作
//==========================================================================
uint8 flash_write(uint16 sectorNo,uint16 offset,u32 data)
{
    Dtype	addr;	
    Dtype	Data;
		
    addr.DW = (u32)((sectorNo<<11) + offset);//计算地址
	Data.DW	= data;	
	    
    FTFL_FCCOB0 = PGM4;	// 设置写入命令

    FTFL_FCCOB1 = addr.BB[2];// 设置目标地址
    FTFL_FCCOB2 = addr.BB[1];
    FTFL_FCCOB3 = addr.BB[0];


    FTFL_FCCOB4 = Data.BB[3];// 设置写入数据
    FTFL_FCCOB5 = Data.BB[2];
    FTFL_FCCOB6 = Data.BB[1];
    FTFL_FCCOB7 = Data.BB[0];
    
    if(1 == flash_cmd_launch()) 	
      return 2;  //写入命令错误

    return 0;  //成功执行
}


void InitFlashLcd(void) 
{
  flash_init();
  FlashWrite_flag = flash_read(SecNum1,0,u32);
  if(FlashWrite_flag!=0xffffffff)//flash若全部清除，则不读取flash，变量使用程序本身的变量值
  {
    SpeedWant = flash_read(SecNum1,0,u32);
    Speed_Kp = flash_read(SecNum1,32,u32);
    Speed_Ki = flash_read(SecNum1,64,u32);
    angleoffset = flash_read(SecNum1,96,u32);
    D_P = flash_read(SecNum1,128,u32);
    D_D = flash_read(SecNum1,160,u32);
    SpecialPWM= flash_read(SecNum1,192,u32);
    weight_Max = flash_read(SecNum1,224,u32);
    weight_Min = flash_read(SecNum1,256,u32);
    Ka = flash_read(SecNum1,288,u32);
    Midline = flash_read(SecNum1,320,u32);
    Stoptime = flash_read(SecNum1,352,u32);
    Angle_Kp = flash_read(SecNum1,384,u32);
    Angle_Kd = flash_read(SecNum1,416,u32);
    D_I = flash_read(SecNum1,448,u32);
    Speed_Kd = flash_read(SecNum1,480,u32);
    
  }
   

}


void FlashSetPara(void)
{
  
  
//  Speed_Kp=0;
//  Speed_Kp=0;
//  Speed_Ki=0;
//  Speed_Kd=0;
//  Turn_Kp=0;
//  Turn_Kd=0;
//  weight_Max=0;
//  weight_Min=0;
//  SpeedWant=0;
//  Angle_Kp=0;
//  Angle_Kd=0;
//  Turn_Kp_cir=0;
//  SpecialPWML=0;
//  Stoptime=0;
//  specialfield=0;
// SpecialPWMR=0;
// Turn_Max=0;
  //angleoffset=0; 

  
  flash_erase_sector(SecNum1);//清除扇区
  flash_write(SecNum1,0,SpeedWant);      
  flash_write(SecNum1,32,Speed_Kp);
  flash_write(SecNum1,64,Speed_Ki);
  flash_write(SecNum1,480,Speed_Kd);
  flash_write(SecNum1,128,D_P);
  flash_write(SecNum1,448,D_I); 
  flash_write(SecNum1,160,D_D);
  flash_write(SecNum1,320,Midline);
  flash_write(SecNum1,96,angleoffset);
  flash_write(SecNum1,384,Angle_Kp);
  flash_write(SecNum1,416,Angle_Kd);
  flash_write(SecNum1,224,weight_Max);
  flash_write(SecNum1,256,weight_Min);
  flash_write(SecNum1,192,SpecialPWM);
  flash_write(SecNum1,352,Stoptime);
  flash_write(SecNum1,288,Ka);
  
  
} 