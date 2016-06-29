#ifndef __K60_GPIO_H__
#define __K60_GPIO_H__
#include "..\K60_datatype.h"

#include "gpio_cfg.h"


/***DEF+**********************************************************************/
/* define SET/CLR/GET Register  bit                                          */
/***DEF-**********************************************************************/
extern volatile  struct GPIO_MemMap *GPIOx[5];
extern volatile struct  PORT_MemMap *PORTX[5];

//端口宏定义
typedef enum PORTx
{
  PORT_A,
  PORT_B,
  PORT_C,
  PORT_D,
  PORT_E
}PORTx;

//定义管脚方向
typedef enum GPIO_CFG
{   //这里的值不能改！！！
    GPI         =0,                           //定义管脚输入方向      GPIOx_PDDRn里，0表示输入，1表示输出
    GPO         =1,                           //定义管脚输出方向

    GPI_DOWN    =0x02,                        //输入下拉              PORTx_PCRn需要PE=1，PS=0
    GPI_UP      =0x03,                        //输入上拉              PORTx_PCRn需要PE=1，PS=1
    GPI_PF      =0x10,                        //输入，带无源滤波器,滤波范围：10 MHz ~ 30 MHz 。不支持高速接口（>=2MHz）  0b10000           Passive Filter Enable
    GPI_DOWN_PF =GPI_DOWN | GPI_PF ,          //输入下拉，带无源滤波器
    GPI_UP_PF   =GPI_UP   | GPI_PF ,          //输入上拉，带无源滤波器

    GPO_HDS     =0x41,                         //输出高驱动能力   0b100 0001    High drive strength
    GPO_SSR     =0x05,                         //输出慢变化率          0b101     Slow slew rate
    GPO_HDS_SSR = GPO_HDS | GPO_SSR,           //输出高驱动能力、慢变化率
}GPIO_CFG;   //最低位为0，肯定是输入；GPI_UP 和 GPI_UP_PF的最低位为1，其他为输出





//设置数据方向
#define GPIO_SET_OUT(GPIOx_BASE_PTR,PINS)   GPIO_PDDR_REG(GPIOx_BASE_PTR)\
	                                        |=GPIO_PDDR_PDD((1)<<PINS)
#define GPIO_SET_IN(GPIOx_BASE_PTR,PINS)    GPIO_PDDR_REG(GPIOx_BASE_PTR)\
	                                        &=~GPIO_PDDR_PDD((1)<<PINS)
//设置IO电平
#define GPIO_PIN_SET_H(GPIOx_BASE_PTR,PINS) GPIO_PDOR_REG(GPIOx_BASE_PTR)\
	                                        |=GPIO_PDOR_PDO((1)<<PINS)
#define GPIO_PIN_SET_L(GPIOx_BASE_PTR,PINS) GPIO_PDOR_REG(GPIOx_BASE_PTR)\
	                                        &=~GPIO_PDOR_PDO((1)<<PINS)
//复位
#define GPIO_ResetBits(GPIOx_BASE_PTR,PINS) GPIO_PCOR_REG(GPIOx_BASE_PTR)|=\
                                             GPIO_PCOR_PTCO((1)<<PINS)
//置位
#define GPIO_SetBits(GPIOx_BASE_PTR,PINS)   GPIO_PSOR_REG(GPIOx_BASE_PTR)|=\
	                                        GPIO_PSOR_PTSO((1)<<PINS)
//获取单个输入引脚的输入电平(0/1)
#define GPIO_PIN_GET(GPIOx_BASE_PTR,PINS)    GPIO_PDIR_REG(GPIOx_BASE_PTR)\
	                                        &((U32)1<<PINS)?1:0



/*****************************************************************************/
/*                         Function Declare                                  */
/*****************************************************************************/
BOOL GPIO_Init(U8 Port, U8 PinNum, GPIO_CFG cfg, U8 Level);
void GPIO_SetBit(U8 Port, U8 PinNum, U8 Level);
U8 GPIO_GetBit(U8 Port, U8 PinNum);
static PORT_MemMapPtr GPIO_get_port_addr (U8 port);
static GPIO_MemMapPtr GPIO_get_pt_addr(U8 port);
void gpio_reverse (GPIO_MemMapPtr port, int index);
#endif