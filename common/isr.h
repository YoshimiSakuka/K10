#ifndef __K60_ISR_H__
#define __K60_ISR_H__
#include "..\K60_datatype.h"


//#undef  VECTOR_084
//#define VECTOR_084      PIT0_ISR     // 0x0000_0150 84    68     PIT Channel 0


//#undef  VECTOR_085
//#define VECTOR_085      PIT1_ISR     // 0x0000_0154 85    69     PIT Channel 1
//
//
//#undef  VECTOR_086
//#define VECTOR_086      PIT2_ISR     // 0x0000_0158 86    70     PIT Channel 2
//
//
//#undef  VECTOR_087
//#define VECTOR_087      PIT3_ISR     // 0x0000_015C 87    71     PIT Channel 3

extern u8 StandFlag;
extern u32 FieldCnt;
extern int cnT;
extern u8 TurnCnt;
extern int R_Motor_Speed;
 extern int irreceiveok;
extern char irdata[33];
extern void DMA_CH0_Handle(void);
//extern void DMA_CH1_Handle(void);
//extern void DMA_CH2_Handle(void);
//extern void DMA_CH3_Handle(void);
//extern void DMA_CH4_Handle(void);
//extern void DMA_CH5_Handle(void);
//extern void DMA_CH6_Handle(void);
//extern void DMA_CH7_Handle(void);
//extern void DMA_CH8_Handle(void);
//extern void DMA_CH9_Handle(void);
//extern void DMA_CH10_Handle(void);
//extern void DMA_CH11_Handle(void);
//extern void DMA_CH12_Handle(void);
//extern void DMA_CH13_Handle(void);
//extern void DMA_CH14_Handle(void);
//extern void DMA_CH15_Handle(void);

extern void UART1_ISR(void);

extern void FTM0_ISR(void);
extern void FTM1_ISR(void);
extern void FTM2_ISR(void);

extern void PIT0_ISR(void);
extern void PIT1_ISR(void);
extern void PIT2_ISR(void);
extern void PIT3_ISR(void);

extern void Porta_Isr(void);
extern void Portb_Isr(void);
extern void Portc_Isr(void);
extern void Portd_Isr(void);
extern void Porte_Isr(void);

#endif