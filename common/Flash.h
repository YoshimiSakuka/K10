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
}Dtype;		//sizeof(Dtype)	Ϊ 4 

//Flash����궨�壬�ڲ�ʹ��
#define   RD1BLK    0x00   // ������Flash
#define   RD1SEC    0x01   // ����������
#define   PGMCHK    0x02   // д����
#define   RDRSRC    0x03   // ��Ŀ������
#define   PGM4      0x06   // д�볤��
#define   ERSBLK    0x08   // ��������Flash
#define   ERSSCR    0x09   // ����Flash����
#define   PGMSEC    0x0B   // д������
#define   RD1ALL    0x40   // �����еĿ�
#define   RDONCE    0x41   // ֻ��һ��
#define   PGMONCE   0x43   // ֻдһ��
#define   ERSALL    0x44   // �������п�
#define   VFYKEY    0x45   // ��֤���ŷ���Կ��
#define   PGMPART   0x80   // д�����
#define   SETRAM    0x81   // �趨FlexRAM����

//=================�ڲ�����ʵ��=============================================
void 	flash_init();//����ָ��flash����
uint8 	flash_erase_sector(uint16 sectorNo);//����ָ��flash����
uint8 	flash_write(uint16 sectorNo,uint16 offset,u32 data);//д��flash����
void    InitFlashLcd(void);
void    FlashSetPara(void);
#define	flash_read(sectorNo,offset,type)	(*(type *)((u32)(((sectorNo)<<11) + (offset))))			//��ȡ����

#define SecNum1 127
#define SecNum2 127

extern u32 LCD_KP;
extern u32 LCD_KD;
extern u32 LCD_KI;
extern int LCD_Flag;





#endif