#include "GPIO.h"


//#ifdef  __cplusplus
//extern "C" {
//#endif
  
  
/******************************************************************************************************************/
/*GPIO port                                                                                                        */
/******************************************************************************************************************/

volatile struct GPIO_MemMap *GPIOx[5] = {PTA_BASE_PTR, PTB_BASE_PTR, PTC_BASE_PTR, PTD_BASE_PTR, PTE_BASE_PTR}; //定义五个指针数组保存 GPIOx 的地址
volatile struct PORT_MemMap *PORTX[5] = {PORTA_BASE_PTR, PORTB_BASE_PTR, PORTC_BASE_PTR, PORTD_BASE_PTR, PORTE_BASE_PTR};


/***FUNC+*********************************************************************/
/* Name   : GPIO_init                                                        */
/* Descrp : init Prot pin state                                              */
/* Input  : port -- select PORT A/B/C/D/E                                    */
/*          PinNum -- set pin number                                         */
/*          Dir -- pin in or out                                             */
/*          Level -- high or low                                             */
/* Output : None.                                                            */
/* Return : Prot  high or low level                                          */   
/***FUNC-*********************************************************************/
BOOL GPIO_Init(U8 Port, U8 PinNum, GPIO_CFG cfg, U8 Level)
{
    //将GPIO端口号转换成端口寄存器组指针
    GPIO_MemMapPtr pt = GPIO_get_pt_addr(Port);
    PORT_MemMapPtr p  = GPIO_get_port_addr(Port);
    
    if (!p||!pt) 
    {
        return FALSE;  //参数错误
    }
     
    //设定通用端口引脚控制寄存器的值，设定为GPIO功能
    PORT_PCR_REG(p, PinNum) = (0|PORT_PCR_MUX(1)|cfg);

    //端口方向控制输入还是输出
    if(((cfg&0x01) == GPI)||(cfg == GPI_UP)|| (cfg == GPI_UP_PF))
    //   最低位为0则输入   ||   输入上拉模式  ||   输入上拉，带无源滤波器
    {
        GPIO_PDDR_REG(pt) &= ~(1<< PinNum);         //设置端口方向为输入
    }
    else
    {
        GPIO_PDDR_REG(pt) |= (1<<PinNum);           //设置端口方向为输出
        
        if(LVL_H == Level)                          //output
        {
            BIT_SET(PinNum, GPIO_PDOR_REG(pt));     //对端口输出控制，输出为1
        }
        else
        {
            BIT_CLR(PinNum, GPIO_PDOR_REG(pt));     //对端口输出控制，输出为0
        }
    }

    return TRUE;  //成功返回
}

/***FUNC+*********************************************************************/
/* Name   : GPIO_SetBit                                                      */
/* Descrp : Set Prot pin high or low level                                   */
/* Input  : port -- select PORT A/B/C/D/E                                    */
/*          PinNum -- set pin number                                         */
/*          Level -- state high or low                                       */
/* Output : None.                                                            */
/* Return : Prot  high or low level                                          */   
/***FUNC-*********************************************************************/
void GPIO_SetBit(U8 Port, U8 PinNum, U8 Level)
{
    //将GPIO端口号转换成端口寄存器组指针
    GPIO_MemMapPtr pt = GPIO_get_pt_addr(Port);
        
    if (Level == 0) //控制为低电平
    {
        BIT_CLR(PinNum, GPIO_PDOR_REG(pt));
    }
    else 
    {
        //控制为高电平
        BIT_SET(PinNum, GPIO_PDOR_REG(pt));
    }
}

/***FUNC+*********************************************************************/
/* Name   : Gpio_GetBit                                                      */
/* Descrp : get Prot Pin number high or low level                            */
/* Input  : port -- select PORT A/B/C/D/E                                    */
/*          PinNum -- select pin 0～31                                       */
/* Output : None.                                                            */
/* Return : Prot Pin number high or low level                                */   
/***FUNC-*********************************************************************/
U8 GPIO_GetBit(U8 Port, U8 PinNum)
{
    U8 i; 
    //将GPIO端口号转换成端口寄存器组指针
    GPIO_MemMapPtr pt = GPIO_get_pt_addr(Port);
    //查看引脚状态
    i = BIT_GET(PinNum, GPIO_PDIR_REG(pt));
    return i;     //返回引脚状态（0或1）
}

/***FUNC+*********************************************************************/
/* Name   : Gpio_get_port_addr                                               */
/* Descrp : get Prot PTR.                                                    */
/* Input  : port -- select PORT A/B/C/D/E                                    */ 
/* Output : None.                                                            */
/* Return : PORT A/B/C/D/E Ptr.                                              */   
/***FUNC-*********************************************************************/
static PORT_MemMapPtr GPIO_get_port_addr (U8 port)
{
    PORT_MemMapPtr p;
    
    switch(port)
    {
    case PORT_A:
        p = PORTA_BASE_PTR;
        break;
    case PORT_B:
        p = PORTB_BASE_PTR;
        break;
    case PORT_C:
        p = PORTC_BASE_PTR;
        break;
    case PORT_D:
        p = PORTD_BASE_PTR;
        break;
    case PORT_E:
        p = PORTE_BASE_PTR;
        break;
    default:
        return 0; //输入参数无效返回
    }
    
    return p;
}

/***FUNC+*********************************************************************/
/* Name   : Gpio_get_pt_addr                                                 */
/* Descrp : get Prot PTR.                                                    */
/* Input  : port -- select PORT A/B/C/D/E                                    */ 
/* Output : None.                                                            */
/* Return : PORT A/B/C/D/E Ptr.                                              */   
/***FUNC-*********************************************************************/
static GPIO_MemMapPtr GPIO_get_pt_addr(U8 port)
{
    GPIO_MemMapPtr p;
    
    switch(port)
    {
    case PORT_A:
        p = PTA_BASE_PTR;
        break;
    case PORT_B:
        p = PTB_BASE_PTR;
        break;
    case PORT_C:
        p = PTC_BASE_PTR;
        break;
    case PORT_D:
        p = PTD_BASE_PTR;
        break;
    case PORT_E:
        p = PTE_BASE_PTR;
        break;
    default:
        return 0; //输入参数无效返回
    }
    
    return p;
}


  
/******************翻转电平************/
void gpio_reverse (GPIO_MemMapPtr port, int index)
{
    GPIO_PDOR_REG(port) ^= (1<<index);
}
  
  
//#ifdef  __cplusplus
//}
//#endif