//*******************************************************************************************
//  MK60DN512ZVL(K/L/Q)10 Demo - _printf, Ultra-Low Pwr UART 115200 Echo ISR, 50MHz ACLK
//
//           MK60DN512ZVL(K/L/Q)10
//            -----------------
//        /|\|              XIN|-
//         | |                 | 50MHz
//         --|RST          XOUT|-
//           |                 |
//           |                 |
//           |           PTC14 |---->TXD 
//           |           PTC15 |<----RXD
//           |                 |
//           |                 |
//           |                 |
//           |                 | 
//           |                 |
//           |                 |
//           |                 |
//           |                 |
//
//  Copyright (c) 2012.04  WH, All Rights Reserved.
//  WebSite     : http://un-el.taobao.com/
//  QQ群        : 226846867 (Kinetis ARM)
//  Email       : dragonhzw@163.com
//  Description : The _printf module
//  History     :                                                           
//     [Author]   [Date]      [Version]    [Description]                     
//     [1] dragonhzw   2012/04/09  Ver 1.0.0    Initial file.
//
//  Built with IAR Embedded Workbench for ARM 6.30  
//***********************************************************************************************
//#include "..\K60_datatype.h"

#include "_printf.h"
//#ifdef  __cplusplus
//extern "C" {
//#endif

  
/***FUNC+*********************************************************************/
/* Name   : Init_UART1                                                       */
/* Descrp : init Uart1 port.                                                 */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void UART_Init(U32 SystemClock, U32 BaudRate, U8 UARTChannel)
{
  register U16 ubd, brfa;
  
  UART_MemMapPtr Channel;
  
  U8 temp;
    
  switch (UARTChannel)
  {
    case UART0:
        /* Enable the UART0_TXD function on PTD6 */
        PORTD_PCR6 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        /* Enable the UART0_RXD function on PTD7 */
        PORTD_PCR7 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin

        SIM_SCGC4 |= SIM_SCGC4_UART0_MASK;
        Channel = UART_0;
      break;
      
    case UART1:
        /* Enable the UART1_TXD function on PTC4 */
        PORTC_PCR4 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        /* Enable the UART1_RXD function on PTC3 */
        PORTC_PCR3 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin

        SIM_SCGC4 |= SIM_SCGC4_UART1_MASK;
        Channel = UART_1;
      break;
      
    case UART2:
        /* Enable the UART2_TXD function on PTD3 */
        PORTD_PCR3 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        /* Enable the UART2_RXD function on PTD2 */
        PORTD_PCR2 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin

        SIM_SCGC4 |= SIM_SCGC4_UART2_MASK;      
        Channel = UART_2;
      break;
      
    case UART3:    
        /* Enable the UART3_TXD function on PTC17 */
        PORTC_PCR17 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        /* Enable the UART3_RXD function on PTC16 */
        PORTC_PCR16 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin

        SIM_SCGC4 |= SIM_SCGC4_UART3_MASK;
        
        Channel = UART_3;
      break;
      
    case UART4:
        /* Enable the UART3_TXD function on PTC17 */
        //PORTC_PCR15 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        PORTE_PCR24 = PORT_PCR_MUX(0x3);    //tx
        /* Enable the UART3_RXD function on PTC16 */
        //PORTC_PCR14 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        PORTE_PCR25 = PORT_PCR_MUX(0x3);    //rx
        SIM_SCGC1 |= SIM_SCGC1_UART4_MASK;      
        Channel = UART_4;
      break;
      
    case UART5:
        /* Enable the UART3_TXD function on PTC17 */
        PORTE_PCR8 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin
        /* Enable the UART3_RXD function on PTC16 */
        PORTE_PCR9 = PORT_PCR_MUX(0x3); // UART is alt3 function for this pin

        SIM_SCGC1 |= SIM_SCGC1_UART5_MASK;      

        Channel = UART_5;
      break;
      
    default: 
      break;
  }  

  /* Make sure that the transmitter and receiver are disabled while we
  * change settings.
  */
  UART_C2_REG(Channel) &= ~(UART_C2_TE_MASK | UART_C2_RE_MASK );        //禁止发送接收

  /* Configure the UART for 8-bit mode, no parity */
  /* We need all default settings, so entire register is cleared */
  UART_C1_REG(Channel) = 0;
  if((UART0 == UARTChannel) ||(UART1 == UARTChannel))        //串口01 使用内核时钟 是其他外设时钟的2倍
  {
    SystemClock +=SystemClock;
  }
  /* Calculate baud settings */
  ubd = (U32)((SystemClock)/(BaudRate * 16));   // SBR+BRFA BRFA滤掉

  /* Save off the current value of the UARTx_BDH except for the SBR */
  temp = UART_BDH_REG(Channel) & ~(UART_BDH_SBR(0x1F));      //保存其他位的值
  UART_BDH_REG(Channel) = temp | UART_BDH_SBR(((ubd & 0x1F00) >> 8));   //设置BDH
  UART_BDL_REG(Channel) = (U8)(ubd & UART_BDL_SBR_MASK);    //设置BDL

  /* Determine if a fractional divider is needed to get closer to the baud rate */
  brfa = (((SystemClock*32)/(BaudRate * 16)) - (ubd * 32)); //计算BRFA  精度1/32

  /* Save off the current value of the UARTx_C4 register except for the BRFA */
  temp = UART_C4_REG(Channel) & ~(UART_C4_BRFA(0x1F));  //保存高3位
  UART_C4_REG(Channel) = temp | UART_C4_BRFA(brfa); //设置BRFA
  
  /* Enable receiver and transmitter */
  UART_C2_REG(Channel) |= (UART_C2_TE_MASK | UART_C2_RE_MASK);   //使能发送接收

  return;
}
/***FUNC+*********************************************************************/
/* Name   : Uart_Printf                                                      */
/* Descrp : 处理来自串口的发送中断                                           */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Uart_Printf(const char *fmt,...)
{
    va_list ap;
    char string[256];

    va_start(ap,fmt);
    vsprintf(string,fmt,ap);
    Uart_SendString(string);
    va_end(ap);
    return;
}
/***FUNC+*********************************************************************/
/* Name   : Uart_SendString                                                  */
/* Descrp : 发送字符串                                                       */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Uart_SendString(char *pt)
{
    while(*pt)
    {
        Uart_SendByte(UART4,*pt++);
    }
    return;
}
/***FUNC+*********************************************************************/
/* Name   : Uart_SendByte                                                    */
/* Descrp : 发送数据到串口的发送中断                                         */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Uart_SendByte(U8 UARTChannel, U8 Char)
{
    UART_MemMapPtr Channel;
  
    switch (UARTChannel)
    {
        case UART0:
            Channel = UART_0;
            break;
        case UART1:
            Channel = UART_1;
            break;
        case UART2:
            Channel = UART_2;
            break;
        case UART3:
            Channel = UART_3;
            break;
        case UART4:
            Channel = UART_4;
            break;
        case UART5:
            Channel = UART_5;
            break;
        default: 
            break;
    }  
    
    /* Wait until space is available in the FIFO */
    while(!(UART_S1_REG(Channel) & UART_S1_TDRE_MASK))
    {

    }
    /* Send the character */
    UART_D_REG(Channel) = (S8)Char;

    return;
}
void Uart_SendByte_4(unsigned char data)     //最简程序
{
    while(!(UART_S1_REG(UART4_BASE_PTR) & UART_S1_TDRE_MASK))
    {

    }
    /* Send the character */
    UART_D_REG(UART4_BASE_PTR) = (S8)data;
}
/***FUNC+*********************************************************************/
/* Name   : Uart_GetString                                                   */
/* Descrp : 获取字符串                                                       */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Uart_GetString(char *string)
{
    char *string2 = string;
    char c;
    while((c = Uart_Getch(UART4))!='\r')
    {
        if(c=='\b')
        {
            if( (int)string2 < (int)string )
            {
                //Uart_Printf("\b \b");
                string--;
            }
        }
        else 
        {
            *string++ = c;
            //Uart_SendByte(UART4,c);
        }
    }
    *string='\0';
    //Uart_SendByte(UART4,'\n');
    return;
}
/***FUNC+*********************************************************************/
/* Name   : Uart_GetIntNum                                                   */
/* Descrp : 获取数据                                                         */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
SHORT Uart_GetIntNum(void)
{
    char str[30];
    char *string = str;
    unsigned short base     = 10;
    unsigned short minus    = 0;
    short result   = 0;
    short lastIndex;    
    unsigned short i;
    
    Uart_GetString(string);
    
    if(string[0]=='-')
    {
        minus = 1;
        string++;
    }
    
    if(string[0]=='0' && (string[1]=='x' || string[1]=='X'))
    {
        base    = 16;
        string += 2;
    }
    
    lastIndex = strlen(string) - 1;
    
    if(lastIndex<0)
        return -1;
    
    if(string[lastIndex]=='h' || string[lastIndex]=='H' )
    {
        base = 16;
        string[lastIndex] = 0;
        lastIndex--;
    }

    if(base==10)
    {
        result = atoi(string);
        result = minus ? (-1*result):result;
    }
    else
    {
        for(i=0;i<=lastIndex;i++)
        {
            if(isalpha(string[i]))
            {
                if(isupper(string[i]))
                    result = (result<<4) + string[i] - 'A' + 10;
                else
                    result = (result<<4) + string[i] - 'a' + 10;
            }
            else
                result = (result<<4) + string[i] - '0';
        }
        result = minus ? (-1*result):result;
    }
    return result;
}
/***FUNC+*********************************************************************/
/* Name   : Uart_Getch                                                       */
/* Descrp : 接收串口数据                                                     */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
CHAR Uart_Getch(U8 UARTChannel)
{
    UART_MemMapPtr Channel;
  
    switch (UARTChannel)
    {
        case UART0:
            Channel = UART_0;
            break;
        case UART1:
            Channel = UART_1;
            break;
        case UART2:
            Channel = UART_2;
            break;
        case UART3:
            Channel = UART_3;
            break;
        case UART4:
            Channel = UART_4;
            break;
        case UART5:
            Channel = UART_5;
            break;
        default: 
            break;
    }  
    /* Wait until character has been received */
    while (!(UART_S1_REG(Channel) & UART_S1_RDRF_MASK));
    /* Return the 8-bit data from the receiver */
    return UART_D_REG(Channel);
}
/***FUNC+*********************************************************************/
/* Name   : Delay                                                            */
/* Descrp : 延时                                                             */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Delay(SHORT sTime)
{
    for(;sTime>0;sTime--)
    {
    }
    return; 
}


/*************************************************************************
*                             野火嵌入式开发工作室
*
*  函数名称：uart_irq_EN
*  功能说明：开串口接收中断
*  参数说明：UARTn       模块号（UART0~UART5）
*  函数返回：无
*  修改时间：2012-1-20
*  备    注：
*************************************************************************/
void uart_irq_EN(void)
{
    UART_C2_REG(UART_4) |= UART_C2_RIE_MASK;    //开放UART接收中断
    enable_irq(53);			        //开接收引脚的IRQ中断
}


/*************************************************************************
*                             野火嵌入式开发工作室
*
*  函数名称：uart_irq_DIS
*  功能说明：关串口接收中断
*  参数说明：UARTn       模块号（UART0~UART5）
*  函数返回：无
*  修改时间：2012-1-20
*  备    注：
*************************************************************************/
void uart_irq_DIS(void)
{
    UART_C2_REG(UART_4) &= ~UART_C2_RIE_MASK;   //禁止UART接收中断
    disable_irq(53);			        //关接收引脚的IRQ中断
}




//#ifdef  __cplusplus
//}
//#endif