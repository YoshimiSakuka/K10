#include "..\K60_datatype.h"

#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "Oled.h"



int x=0;
int abc=0;

int zhengfanzhuan2;
void Delay_ccd(int num)
{
int i,j,k;
for(j = 0;j < num;j++)
{
for(i = 0;i < 245;i++)
{
for(k = 0;k < 245;k++)
{
asm("nop");
asm("nop");
asm("nop");
asm("nop");
asm("nop");
asm("nop");
asm("nop");
asm("nop");
asm("nop");
asm("nop");
}
}
}
}
int zhengfanzhuan=0;
void zhengzhuan(void){//zhengzhuan--------------------------------------------
  Delay_ccd(100);
  FTM0_C7V=abc;//abc
  FTM0_C6V=0;
  zhengfanzhuan=0;
}
void fanzhuan(void){ //fanzhuan-----------------------------------------
  Delay_ccd(100);
  FTM0_C7V=0;//abc
  FTM0_C6V=abc;
  zhengfanzhuan=1;
}

void IO_init()
{
//五向开关
GPIO_Init(PORT_A,12,GPI_UP,LVL_H); 
GPIO_Init(PORT_A,13,GPI_UP,LVL_H);
GPIO_Init(PORT_A,14,GPI_UP,LVL_H); 
GPIO_Init(PORT_A,15,GPI_UP,LVL_H);                                  
GPIO_Init(PORT_A,16,GPI_UP,LVL_H);


//guangdianguan
GPIO_Init(PORT_C,0,GPI,LVL_H);
GPIO_Init(PORT_C,8,GPI,LVL_H); 




//dt
GPIO_Init(PORT_C,6,GPO,LVL_H);                                  
//GPIO_Init(PORT_C,7,GPI,LVL_H);  //////////////////////////////////////



GPIO_Init(PORT_A,19,GPO_HDS,LVL_L);               //蜂鸣器



 GPIO_Init(PORT_C,10,GPI_UP,LVL_H);               //按键
 GPIO_Init(PORT_C,12,GPI_UP,LVL_H);



GPIO_Init(PORT_B,22,GPO,LVL_H);   // 后  CLK
GPIO_Init(PORT_C,3,GPO,LVL_H);  //  后  SI

 
GPIO_Init(PORT_B,17,GPI_UP,LVL_H);    // 前   CLK
GPIO_Init(PORT_B,16,GPI_UP,LVL_H);    // 前   SI

GPIO_Init(PORT_C,4,GPI_UP,LVL_H);//按键------------------------------------------------------------------
  GPIO_Init(PORT_C,6,GPI_UP,LVL_H);
  GPIO_Init(PORT_C,8,GPI_UP,LVL_H); 




}

int H=0;

int white_mark;
int white_markL;

int White_markL=0;
int white_markR;

int White_markR=0;
int White_mark=0;

int Stopflag;
int StopFlag;

byte Key_Q;
byte Key_H;






long testpwm,testpwm1,testpwm2,testpwm3,testpwm4;
int start=0;
int Start=0;

u8 BmaCnt=0;
float angleInit;
float accangle[4] = {0,0,0,0};
float AngleACC;
float TurnGyro_offset;
int QUAD_Left_Cnt = 0; 
int QUAD_Right_Cnt = 0;
int QUAD_Left = 0;
int QUAD_Right = 0;
u8 Pit0_cnt = 0;
long SteerOUT;
int SpeedOUT;
long SteerEssmax = 0; 
int midline= 63;

int Middlel=0;
int Middler=0;
int SPEED;
int midlineH=63;
u8 txbuf[5][32];




uint8 status;

int THreshold[120]={
200,200,200,200,200,200,200,200,200,200,
200,200,200,200,200,200,200,200,200,200,
200,200,200,200,200,200,200,200,200,200,
200,200,200,200,200,200,200,200,200,200,
200,200,200,200,200,200,200,200,200,200,
200,200,200,200,200,200,200,200,200,200,
200,200,200,200,200,200,200,200,200,200,
200,200,200,200,200,200,200,200,200,200,
};
long SteerEssOld = 0;
u8 SpeedCnt = 0;
u8 TurnCnt = 0;
int   Singleflag[10]={0,0,0,0,0};

long jibu;
float distance;
float speed;

unsigned char g_aucImageTable[64][128];
char ircode[4];

unsigned char disp[8];


int irwork_ok;
void irwork()
{
 disp[0]=ircode[0]/16; 
 disp[1]=ircode[0]%16; 
 
 disp[2]=ircode[1]/16; 
 disp[3]=ircode[1]%16; 
 
 disp[4]=ircode[2]/16; 
 disp[5]=ircode[2]%16; 
 
 disp[6]=ircode[3]/16; 
 disp[7]=ircode[3]%16; 
 
 
  irwork_ok=1;

}
int key_num_COUNT=0;
int key_num,key_num_end;
int key_num_change=0; 
void key_code()
{
   key_num_COUNT++;
   if( key_num_COUNT>4 )
   {
     key_num_COUNT=0;
   }
if(disp[4]==1&&disp[5]==6){key_num=0;}
if(disp[4]==0&&disp[5]==12)key_num=1;
if(disp[4]==1&&disp[5]==8)key_num=2;
if(disp[4]==5&&disp[5]==14)key_num=3;
if(disp[4]==0&&disp[5]==8)key_num=4;
if(disp[4]==1&&disp[5]==12)key_num=5;
if(disp[4]==5&&disp[5]==10)key_num=6;
if(disp[4]==4&&disp[5]==2)key_num=7;
if(disp[4]==5&&disp[5]==2)key_num=8;
if(disp[4]==4&&disp[5]==10)key_num=9;
if(disp[4]==0&&disp[5]==7)key_num=10;//-
if(disp[4]==1&&disp[5]==5)key_num=11;//+
if(disp[4]==0&&disp[5]==9)
{
key_num_change=1;//调试
}
else
{
  key_num_change=0;
}
if(disp[4]==0&&disp[5]==9){key_num_end=1;}
}



long count ;

//void control()
//{
//
//switch (key_num)
//{
//case 1: count+=10;  break;
//case 2:  count-=10; break;
//default: break;
//}
//}


int irpros_ok;
void irpros()
{


char x,y,z=1;
char value;
for(y=0;y<4;y++)
{
for(x=0;x<8;x++)
{
value=value>>1;
if(irdata[z]>6)
{
value=value|0x80;
}
z++;
}
ircode[y]=value;
}

irpros_ok=1;

}

int Speed_Set_R;
void Speed_Control(void)
{
    FTM2_C0V=0;
    R_Motor_Speed=FTM2_C1V;//caihuilaidezhi
    SpeedEss[2] = SpeedEss[1];
    SpeedEss[1] = SpeedEss[0];

    SpeedEss[0] = SpeedWant-R_Motor_Speed;

    SpeedEss[0]=SpeedEss[0]>300?300:(SpeedEss[0]<-300?-300:SpeedEss[0]);

    SpeedInt += SpeedEss[0];
    SpeedInt=SpeedInt>2000?2000:(SpeedInt<-2000?-2000:SpeedInt);
    
    SpeedUp = (int)(Speed_Kp * SpeedEss[0]);
    SpeedUi = (int)(Speed_Ki * SpeedInt/10);
    SpeedUd = (int)(Speed_Kd*(SpeedEss[0]-SpeedEss[1]));
 
    Speed_Set_R = SpeedUp + SpeedUi + SpeedUd;
}
int s[5]={0,0};
int SpeedWant1=0;

void main(void) 
{
 
  


DisableInterrupts; 

WatchdogDisable();  


VECTableInit();




SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
			  | SIM_SCGC5_PORTB_MASK
			  | SIM_SCGC5_PORTC_MASK
			  | SIM_SCGC5_PORTD_MASK
			  | SIM_SCGC5_PORTE_MASK );

pll_init(PLL150);
Timer0_Init();
Timer1_Init();
PWM_Init();
FTM_QUAD_init();
EnableInterrupts;

///FTM_QUAD_init();
//LCD_Init_Oled();
//EnableTimer0();                 //PIT0      使能
//EnableTimer1(); 
//PORTC_PCR14=PORT_PCR_MUX(1)|PORT_PCR_IRQC(10);

 //GPIO_Init(PORT_E,26,GPI_UP,LVL_H);               //按键

//enable_irq(89);

FTM0_C7V=4000;

while(1)
{
 testpwm3=QUADRead(1);
 testpwm4=QUADRead(0);
// FTM0_C7V=testpwm1;//abc
// FTM0_C6V=testpwm2;
 Delay_ccd(1000);
//   if(GPIO_GetBit(PORT_C,4)==0)
// { Delay_ccd(100);
//  FTM0_C7V=6000;
//  abc=6000;
//  if(zhengfanzhuan==1){zhengzhuan();
//  goto knot1;}
//  else{fanzhuan();
//  goto knot1;}
// }
//knot1:
//  if(GPIO_GetBit(PORT_C,6)==0)
// { Delay_ccd(100);
//  FTM0_C7V+=500;
// }
// if(GPIO_GetBit(PORT_C,8)==0)
// { 
//   Delay_ccd(100);
//   FTM0_C7V-=500;
//}
// 
 
 
}

                           


}



