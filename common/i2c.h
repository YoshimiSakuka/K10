#ifndef __K60_I2C_H__
#define __K60_I2C_H__
#include "..\K60_datatype.h"


typedef enum I2Cn
{
    I2C0  = 0,
    I2C1  = 1
} I2Cn;

typedef enum MSmode
{
    MWSR =   0x00,  /* Master write  */
    MRSW =   0x01   /* Master read */
} MSmode;




//      ģ��ͨ��    �˿�          ��ѡ��Χ              ����
#define I2C0_SCL    PTD8        // PTB0��PTB2��PTD8
#define I2C0_SDA    PTD9        // PTB1��PTB3��PTD9

#define I2C1_SCL    PTC10       // PTE1��PTC10
#define I2C1_SDA    PTC11       // PTE0��PTC11



#define MMA7660_I2C_ADDRESS                         0x4C    //MMA7660 ������ٶ�ģ��ĵ�ַ




#define i2c_DisableAck(I2Cn)        I2C_C1_REG(I2Cx[I2Cn]) |= I2C_C1_TXAK_MASK

//
#define i2c_RepeatedStart(I2Cn)     I2C_C1_REG(I2Cx[I2Cn]) |= I2C_C1_RSTA_MASK


//�����ź�
#define i2c_Start(I2Cn)             I2C_C1_REG(I2Cx[I2Cn]) |= I2C_C1_TX_MASK;\
                                    I2C_C1_REG(I2Cx[I2Cn]) |= I2C_C1_MST_MASK

//��ͣ�ź�
#define i2c_Stop(I2Cn)              I2C_C1_REG(I2Cx[I2Cn]) &= ~I2C_C1_MST_MASK;\
                                    I2C_C1_REG(I2Cx[I2Cn]) &= ~I2C_C1_TX_MASK

//�������ģʽ(Ӧ��)
#define i2c_EnterRxMode(I2Cn)       I2C_C1_REG(I2Cx[I2Cn]) &= ~I2C_C1_TX_MASK;\
                                    I2C_C1_REG(I2Cx[I2Cn]) &= ~I2C_C1_TXAK_MASK
//�������ģʽ(��Ӧ��)
#define i2c_PutinRxMode(I2Cn)       I2C_C1_REG(I2Cx[I2Cn]) &= ~I2C_C1_TX_MASK

//�ȴ� I2C0_S
#define i2c_Wait(I2Cn)              while(( I2C_S_REG(I2Cx[I2Cn]) & I2C_S_IICIF_MASK)==0) {} \
                                    I2C_S_REG(I2Cx[I2Cn]) |= I2C_S_IICIF_MASK;

//дһ���ֽ�
#define i2c_write_byte(I2Cn,data)   I2C_D_REG(I2Cx[I2Cn]) = data










void  I2C_init(I2Cn);                                         //��ʼ��I2C
void  I2C_WriteAddr(I2Cn, u8 SlaveID, u8 Addr, u8 Data);      //��ȡ��ַ�������
u8    I2C_ReadAddr(I2Cn, u8 SlaveID, u8 Addr);                //����ַ��д������





void  I2C_StartTransmission (I2Cn, u8 SlaveID, MSmode);       //��������














#endif
