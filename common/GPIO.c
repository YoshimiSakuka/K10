#include "GPIO.h"


//#ifdef  __cplusplus
//extern "C" {
//#endif
  
  
/******************************************************************************************************************/
/*GPIO port                                                                                                        */
/******************************************************************************************************************/

volatile struct GPIO_MemMap *GPIOx[5] = {PTA_BASE_PTR, PTB_BASE_PTR, PTC_BASE_PTR, PTD_BASE_PTR, PTE_BASE_PTR}; //�������ָ�����鱣�� GPIOx �ĵ�ַ
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
    //��GPIO�˿ں�ת���ɶ˿ڼĴ�����ָ��
    GPIO_MemMapPtr pt = GPIO_get_pt_addr(Port);
    PORT_MemMapPtr p  = GPIO_get_port_addr(Port);
    
    if (!p||!pt) 
    {
        return FALSE;  //��������
    }
     
    //�趨ͨ�ö˿����ſ��ƼĴ�����ֵ���趨ΪGPIO����
    PORT_PCR_REG(p, PinNum) = (0|PORT_PCR_MUX(1)|cfg);

    //�˿ڷ���������뻹�����
    if(((cfg&0x01) == GPI)||(cfg == GPI_UP)|| (cfg == GPI_UP_PF))
    //   ���λΪ0������   ||   ��������ģʽ  ||   ��������������Դ�˲���
    {
        GPIO_PDDR_REG(pt) &= ~(1<< PinNum);         //���ö˿ڷ���Ϊ����
    }
    else
    {
        GPIO_PDDR_REG(pt) |= (1<<PinNum);           //���ö˿ڷ���Ϊ���
        
        if(LVL_H == Level)                          //output
        {
            BIT_SET(PinNum, GPIO_PDOR_REG(pt));     //�Զ˿�������ƣ����Ϊ1
        }
        else
        {
            BIT_CLR(PinNum, GPIO_PDOR_REG(pt));     //�Զ˿�������ƣ����Ϊ0
        }
    }

    return TRUE;  //�ɹ�����
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
    //��GPIO�˿ں�ת���ɶ˿ڼĴ�����ָ��
    GPIO_MemMapPtr pt = GPIO_get_pt_addr(Port);
        
    if (Level == 0) //����Ϊ�͵�ƽ
    {
        BIT_CLR(PinNum, GPIO_PDOR_REG(pt));
    }
    else 
    {
        //����Ϊ�ߵ�ƽ
        BIT_SET(PinNum, GPIO_PDOR_REG(pt));
    }
}

/***FUNC+*********************************************************************/
/* Name   : Gpio_GetBit                                                      */
/* Descrp : get Prot Pin number high or low level                            */
/* Input  : port -- select PORT A/B/C/D/E                                    */
/*          PinNum -- select pin 0��31                                       */
/* Output : None.                                                            */
/* Return : Prot Pin number high or low level                                */   
/***FUNC-*********************************************************************/
U8 GPIO_GetBit(U8 Port, U8 PinNum)
{
    U8 i; 
    //��GPIO�˿ں�ת���ɶ˿ڼĴ�����ָ��
    GPIO_MemMapPtr pt = GPIO_get_pt_addr(Port);
    //�鿴����״̬
    i = BIT_GET(PinNum, GPIO_PDIR_REG(pt));
    return i;     //��������״̬��0��1��
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
        return 0; //���������Ч����
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
        return 0; //���������Ч����
    }
    
    return p;
}


  
/******************��ת��ƽ************/
void gpio_reverse (GPIO_MemMapPtr port, int index)
{
    GPIO_PDOR_REG(port) ^= (1<<index);
}
  
  
//#ifdef  __cplusplus
//}
//#endif