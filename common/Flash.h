#ifndef __K60_Flash_H__
#define __K60_Flash_H__
#include "..\K60_datatype.h"



typedef	union
{
  u32	DW;
  u16	W[2];
  u8	BB[4];
  struct
  {
    u32 b0:1; u32 b1:1; u32 b2:1; u32 b3:1; u32 b4:1; u32 b5:1; u32 b6:1; u32 b7:1; 
    u32 b8:1; u32 b9:1; u32 b10:1;u32 b11:1;u32 b12:1;u32 b13:1;u32 b14:1;u32 b15:1;
    u32 b16:1;u32 b17:1;u32 b18:1;u32 b19:1;u32 b20:1;u32 b21:1;u32 b22:1;u32 b23:1;
    u32 b24:1;u32 b25:1;u32 b26:1;u32 b27:1;u32 b28:1;u32 b29:1;u32 b30:1;u32 b31:1;
  };
}Dtype;		//sizeof(Dtype)	为 4 

//Flash命令宏定义，内部使用
#define   RD1BLK    0x00   // 读整块Flash
#define   RD1SEC    0x01   // 读整个扇区
#define   PGMCHK    0x02   // 写入检查
#define   RDRSRC    0x03   // 读目标数据
#define   PGM4      0x06   // 写入长字
#define   ERSBLK    0x08   // 擦除整块Flash
#define   ERSSCR    0x09   // 擦除Flash扇区
#define   PGMSEC    0x0B   // 写入扇区
#define   RD1ALL    0x40   // 读所有的块
#define   RDONCE    0x41   // 只读一次
#define   PGMONCE   0x43   // 只写一次
#define   ERSALL    0x44   // 擦除所有块
#define   VFYKEY    0x45   // 验证后门访问钥匙
#define   PGMPART   0x80   // 写入分区
#define   SETRAM    0x81   // 设定FlexRAM功能

//=================内部函数实现=============================================
void 	flash_init();//擦除指定flash扇区
uint8 	flash_erase_sector(uint16 sectorNo);//擦除指定flash扇区
uint8 	flash_write(uint16 sectorNo,uint16 offset,u32 data);//写入flash操作
void    InitFlashLcd(void);
void    FlashSetPara(void);
#define	flash_read(sectorNo,offset,type)	(*(type *)((u32)(((sectorNo)<<11) + (offset))))			//读取扇区

#define SecNum1 127
#define SecNum2 127

extern u32 LCD_KP;
extern u32 LCD_KD;
extern u32 LCD_KI;
extern int LCD_Flag;





#endif