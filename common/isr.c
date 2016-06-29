#include "isr.h"
#include "..\K60_datatype.h"
#include "math.h"



/***********************************ISR中变量************************/
u8 SensorState[5] = {0};
u8 SensorStateCnt[5] = {0};
u8 sensorcntmax=78;
u8 StandFlag = 0;
int Startflag=0;
int cnT;
int counta = 0;
int cnta = 0,fangxiang1 = 0,fangxiang2 = 0;
int VSYNC_STA = 0;
int q;
u32 p,m;
u32 FieldCnt = 0;                    //场计数器 暂时只计到2 未定义全局变量
u8 _v = 0,_h = 0;                   //调试用计数器
int Real_LineCnt = 0;               //行中断计数器
int ProcessLinePtr = 0;             //行采样计数器
u8 PicLine[160];                    //单行图像
u8 LineReadOverFlag = 0;
int renzi_cnt;
int renziq_cnt;
int direct_gyroscope=0;
//int ProssessLineSto[72 ] = {91,93,95,97,99,101,103,105,107,109,111,113,115,117,119,121,123,125,127,129,131,133,135,137,139,141,143,145,147,149,151,153,155,157,159,161,163,165,167,169,171,173,175,177,179,181,183,185,187,189,191,193,195,197,199,201,203,205,207,209,211,213,215,217,219,221,223,225,227,229,231,233};
//int ProssessLineSto[72] = {60,63,66,69,72,75,78,81,84,87,90,93,96,99,102,105,108,111,114,117,120,123,126,129,132,135,138,141,144,147,150,153,156,159,162,165,168,171,174,177,180,183,186,189,192,195,198,201,204,207,210,213,216,219,222,225,228,231,234,237,240,243,246,249,252,255,258,261,264,267,270,273};
int ProssessLineSto[36] = {70,80,89,97,104,110,116,122,128,134,140,146,152,158,164,169,174,179,184,189,194,199,204,209,214,219,223,227,231,235,239,243,247,251,255,259};
/************************************ISR中断函数********************/
void UART1_ISR(void)
{
}

void DMA_CH0_Handle(void)           //DMA通道0采集一次处理Error[Li005]: no definition for "GPIO_PIN" [referenced from C:\Users\Administrator\Desktop\3.11换结构BLOCK nd  black\Debug\Obj\Oled.o] 

{
 
}
int q, dir,bitnum;
long irtime;





 int now;
int last;
 int DTflag;
int DTstate;
long DTcnt;
long DTcntsum;
long L_DTcntsum;
long DTlost;
int DTreceive;


 
 
 

 

 
 

 
 
 
  
 
 
 

 
 
 
 






void FTM0_ISR(void)
{
 
 
 
 
 FTM0_STATUS = 0X00;
}


void FTM1_ISR(void)
{
 
 
 
 FTM1_STATUS = 0X00;
}


void FTM2_ISR(void)
{
 
}


int q;
int R_Motor_Speed;
void PIT0_ISR(void)
{
  
  
  
irtime++;

CLR_PIT0;
}

 uint16 data;
void PIT1_ISR(void)
{
 //data = lptmr_pulse_get();
//R_Motor_Speed=QUADRead_L();
  FTM1_CNT=0;
 CLR_PIT1;
}


void PIT2_ISR(void)
{
 CLR_PIT2;
}


void PIT3_ISR(void)
{
 CLR_PIT3;
}









void Porta_Isr(void)
{
 
 if(PORTA_ISFR & (1<<24))          //行中断
 {
  PORTA_ISFR |= (1<<24);       //清中断
 }
}


void Portb_Isr(void)
{
 if(PORTB_ISFR & (1<<23))         //场中断
 {
  
  PORTB_PCR23|=PORT_PCR_ISF_MASK;//清除中断标志
  
  
 }
 
}
int bitnum;
int u = 0,irreceiveok=0;
char irdata[33];
int sby_flag=0;
long fir_time;
long sec_time;
long  true_time;


void Portc_Isr(void)
{
 
 if(PORTC_ISFR & (1<<14))                       //行中断
 { 
//   bitnum++;
        if(irtime>40)
     {
      bitnum=0;
     }
  irdata[bitnum]=irtime;
   irtime=0;
   bitnum++;
  if(bitnum==33)
 {
//  bitnum=0;
    irreceiveok=1;
  }

   
     PORTC_ISFR |= (1<<14);       //清中断
   
 // PORTC_PCR14|=PORT_PCR_ISF_MASK;//清除中断标志位

}


}

void Portd_Isr(void)
{
 if(PORTD_ISFR & (1<<0))
 {
  PORTD_ISFR |= (1<<0);
 }
}


void Porte_Isr(void)
{
 if(PORTE_ISFR & (1<<0))
 {
  PORTE_ISFR |= (1<<0);
 }
}