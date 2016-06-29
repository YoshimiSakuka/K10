#ifndef __K60_Oled_H__
#define __K60_Oled_H__
#include "..\K60_datatype.h"

#define LED_IMAGE_WHITE       1
#define LED_IMAGE_BLACK       0
#define GPIO_PIN_MASK            0x1Fu
#define GPIO_PIN(x)              (((1)<<(x & GPIO_PIN_MASK))) 


extern unsigned char g_aucImageTable[64][128];
extern u8 longqiu96x64[768];
 void LCD_Init_Oled(void);
 void LCD_CLS(void);
 void LCD_P6x8Str(u8 x,u8 y,u8 ch[]);
 void LCD_P8x16Str(u8 x,u8 y,u8 ch[]);
 void LCD_P14x16Str(u8 x,u8 y,u8 ch[]);
 void LCD_Print(u8 x, u8 y, u8 ch[]);
 void LCD_PutPixel(u8 x,u8 y);
 void LCD_Rectangle(u8 x1,u8 y1,u8 x2,u8 y2,u8 gif);
 void Draw_LQLogo(void);
 void Draw_LibLogo(void);
 void Draw_BMP(u8 x0,u8 y0,u8 x1,u8 y1,u8 bmp[]); 
 void LCD_Fill(u8 dat);
 
 
 void MAIN_ConvertData(unsigned char *pInputImageData, unsigned char *pOutputImageBuf);
 void LED_PrintImage(unsigned char *pucTable, uint16 usRowNum, uint16 usColumnNum);
 void tiaoyan(byte Ledge,byte Redge,byte L_edgeFlag,byte R_edgeFlag,unsigned char *pOutputImageBuf);
 void middleline(byte middle,unsigned char *pOutputImageBuf);
 void thresholdline(byte threshold,unsigned char *pOutputImageBuf);
void parameter_show();
void parameter_showH();


void CCD_Q_show();

void CCD_H_show();

#endif