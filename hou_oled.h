#ifndef _HOU_OLED_H
#define _HOU_OLED_H

#define byte uint8
#define word uint16
#define GPIO_PIN_MASK      0x1Fu    //0x1f=31,限制位数为0--31有效
#define GPIO_PIN(x)        (((1)<<(x & GPIO_PIN_MASK)))  //把当前位置1

#define LCD_DC_HIGH  (GPIOC_PDOR |=  GPIO_PDOR_PDO(GPIO_PIN(19)))
#define LCD_DC_LOW   (GPIOC_PDOR &=~ GPIO_PDOR_PDO(GPIO_PIN(19)))

#define LCD_SCL_HIGH (GPIOC_PDOR |=  GPIO_PDOR_PDO(GPIO_PIN(16)))
#define LCD_SCL_LOW  (GPIOC_PDOR &=~ GPIO_PDOR_PDO(GPIO_PIN(16)))

#define LCD_SDA_HIGH (GPIOC_PDOR |=  GPIO_PDOR_PDO(GPIO_PIN(17)))
#define LCD_SDA_LOW  (GPIOC_PDOR &=~ GPIO_PDOR_PDO(GPIO_PIN(17)))

#define LCD_RST_HIGH (GPIOC_PDOR |=  GPIO_PDOR_PDO(GPIO_PIN(18)))
#define LCD_RST_LOW  (GPIOC_PDOR &=~ GPIO_PDOR_PDO(GPIO_PIN(18)))

 void oledInit(void);
 void LCD_CLS(void);
 void LCD_Set_Pos(byte x, byte y);
 void LCD_WrDat(byte data);
 void LCD_P6x8Str(byte x,byte y,byte ch[]);
 void LCD_PutPixel(byte x,byte y);
 void LCD_Fill(byte dat);
 void LED_PrintImage(unsigned char *pucTable, unsigned short int usRowNum, unsigned short int usColumnNum);
#endif