#ifndef __K60_GPIO_H__
#define __K60_GPIO_H__
#include "..\K60_datatype.h"

#include "gpio_cfg.h"


/***DEF+**********************************************************************/
/* define SET/CLR/GET Register  bit                                          */
/***DEF-**********************************************************************/
extern volatile  struct GPIO_MemMap *GPIOx[5];
extern volatile struct  PORT_MemMap *PORTX[5];

//�˿ں궨��
typedef enum PORTx
{
  PORT_A,
  PORT_B,
  PORT_C,
  PORT_D,
  PORT_E
}PORTx;

//����ܽŷ���
typedef enum GPIO_CFG
{   //�����ֵ���ܸģ�����
    GPI         =0,                           //����ܽ����뷽��      GPIOx_PDDRn�0��ʾ���룬1��ʾ���
    GPO         =1,                           //����ܽ��������

    GPI_DOWN    =0x02,                        //��������              PORTx_PCRn��ҪPE=1��PS=0
    GPI_UP      =0x03,                        //��������              PORTx_PCRn��ҪPE=1��PS=1
    GPI_PF      =0x10,                        //���룬����Դ�˲���,�˲���Χ��10 MHz ~ 30 MHz ����֧�ָ��ٽӿڣ�>=2MHz��  0b10000           Passive Filter Enable
    GPI_DOWN_PF =GPI_DOWN | GPI_PF ,          //��������������Դ�˲���
    GPI_UP_PF   =GPI_UP   | GPI_PF ,          //��������������Դ�˲���

    GPO_HDS     =0x41,                         //�������������   0b100 0001    High drive strength
    GPO_SSR     =0x05,                         //������仯��          0b101     Slow slew rate
    GPO_HDS_SSR = GPO_HDS | GPO_SSR,           //������������������仯��
}GPIO_CFG;   //���λΪ0���϶������룻GPI_UP �� GPI_UP_PF�����λΪ1������Ϊ���





//�������ݷ���
#define GPIO_SET_OUT(GPIOx_BASE_PTR,PINS)   GPIO_PDDR_REG(GPIOx_BASE_PTR)\
	                                        |=GPIO_PDDR_PDD((1)<<PINS)
#define GPIO_SET_IN(GPIOx_BASE_PTR,PINS)    GPIO_PDDR_REG(GPIOx_BASE_PTR)\
	                                        &=~GPIO_PDDR_PDD((1)<<PINS)
//����IO��ƽ
#define GPIO_PIN_SET_H(GPIOx_BASE_PTR,PINS) GPIO_PDOR_REG(GPIOx_BASE_PTR)\
	                                        |=GPIO_PDOR_PDO((1)<<PINS)
#define GPIO_PIN_SET_L(GPIOx_BASE_PTR,PINS) GPIO_PDOR_REG(GPIOx_BASE_PTR)\
	                                        &=~GPIO_PDOR_PDO((1)<<PINS)
//��λ
#define GPIO_ResetBits(GPIOx_BASE_PTR,PINS) GPIO_PCOR_REG(GPIOx_BASE_PTR)|=\
                                             GPIO_PCOR_PTCO((1)<<PINS)
//��λ
#define GPIO_SetBits(GPIOx_BASE_PTR,PINS)   GPIO_PSOR_REG(GPIOx_BASE_PTR)|=\
	                                        GPIO_PSOR_PTSO((1)<<PINS)
//��ȡ�����������ŵ������ƽ(0/1)
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