#ifndef __K60_FTM_H__
#define __K60_FTM_H__
#include "..\K60_datatype.h"


/***DEF+**********************************************************************/
/* 定义FTM0~2的中断号                                                        */
/***DEF-**********************************************************************/
#define FTM0_irq_no 62
#define FTM1_irq_no 63
#define FTM2_irq_no 64

/***DEF+**********************************************************************/
/*                                                        */
/***DEF-**********************************************************************/


extern volatile struct FTM_MemMap *FTMx[3];



typedef enum FTMn
{
    FTM0,
    FTM1,
    FTM2
} FTMn;

typedef enum CHn
{
    //   --FTM0--  --FTM1--  --FTM2--
    CH0,   //     PTC1      PTA8      PTA10
    CH1,   //     PTC2      PTA9      PTA11
    CH2,   //     PTC3       ×         ×
    CH3,   //     PTC4       ×         ×
    CH4,   //     PTD4       ×         ×
    CH5,   //     PTD5       ×         ×
    CH6,   //     PTD6       ×         ×
    CH7    //     PTD7       ×         ×
    // ×表示不存在
} CHn;




typedef enum Input_cfg
{
    Rising,               //上升沿捕捉
    Falling,              //下降沿捕捉
    Rising_or_Falling     //跳变沿捕捉
} Input_cfg;


void FTM_Input_init(FTMn, CHn, Input_cfg);


#define FTM_IRQ_EN(FTMn,CHn)        FTM_CnSC_REG(FTMx[FTMn],CHn) |= FTM_CnSC_CHIE_MASK       //开启 FTMn_CHn 中断
#define FTM_IRQ_DIS(FTMn,CHn)       FTM_CnSC_REG(FTMx[FTMn],CHn) &= ~FTM_CnSC_CHIE_MASK      //关闭 FTMn_CHn 中断


////      模块通道    端口          可选范围              建议
//#define FTM0_CH0    PTC1        //PTC1、PTA3            PTA3不要用（与Jtag、SWD冲突）
//#define FTM0_CH1    PTC2        //PTC2、PTA4
//#define FTM0_CH2    PTC3        //PTC3、PTA5
//#define FTM0_CH3    PTC4        //PTC4、PTA6
//#define FTM0_CH4    PTD4        //PTD4、PTA7
//#define FTM0_CH5    PTD5        //PTD5、PTA0            PTA0不要用（与Jtag、SWD冲突）
//#define FTM0_CH6    PTD6        //PTD6、PTA1            PTA1不要用（与Jtag冲突）
//#define FTM0_CH7    PTD7        //PTD7、PTA2            PTA2不要用（与Jtag冲突）
//
//
////      模块通道    端口          可选范围              建议
//#define FTM1_CH0    PTA8        //PTA8、PTA12、PTB0
//#define FTM1_CH1    PTA9        //PTA9、PTA13、PTB1
///*
//#define FTM1_CH2                //空
//#define FTM1_CH3                //空
//#define FTM1_CH4                //空
//#define FTM1_CH5                //空
//#define FTM1_CH6                //空
//#define FTM1_CH7                //空
//*/
//
////      模块通道    端口          可选范围              建议
//#define FTM2_CH0    PTA10       //PTA10、PTB18
//#define FTM2_CH1    PTA11       //PTA11、PTB19




/*****************************************************************************/
/*                         Function Declare                                  */
/*****************************************************************************/
typedef enum
{
    //只有1、2管脚，并没有0、3管脚
    LPTMR_ALT1 = 1,      // PTA19
    LPTMR_ALT2 = 2       // PTC5
} LPT0_ALTn;

/**
 *  @brief LPTMR脉冲计数触发方式
 */
typedef enum LPT_CFG
{
    LPT_Rising  = 0,    //上升沿触发
    LPT_Falling = 1     //下降沿触发
} LPT_CFG;
void Ftm_init(U8 FTMChannel);
void Ftm_stop(U8 FTMChannel);
void Ftm_enable_int(U8 FTMChannel);
void Ftm_disable_int(U8 FTMChannel);
void lptmr_pulse_init(LPT0_ALTn altn, uint16 count, LPT_CFG cfg);
uint16 lptmr_pulse_get(void);
void PWM_Init(void);
void PWM1Output(UCHAR ucDuty);

void CPWM_INIT(void);
void CPWM_COMBINE_INIT(void);


void FTM_QUAD_init(void);
void lptmr_pulse_counter(char pin_select);
#define LPTMR_ALT1 0x1
#define LPTMR_ALT2 0x2




#endif