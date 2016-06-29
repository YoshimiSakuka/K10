//#include "includes.h"
//#include "gpio.h" 
//#include "speed.h" 
#include "speed.h"
#include "math.h"

//*******************************速度环*******************

float speed;
float  ExV=0;
float  ExV1=0;
float  LSV=0;
float  LSV1=0;
int out=2750;
float  Vin=0; 
float ExV_cun[10];
byte speed_flag;


//************************速度控制*****************888*
 void Speedcontrol()
    {
     
         Vin=motorspeed;
         speed=(speed*6+Vin*4)/10;
         ExV = speedset-speed;
         
         /*if(ExV>10)
          ExV=10;
        if(ExV<-10)
          ExV=-10; 
         */
         LSV=ExV-ExV1;
         
         
   /*     for(c=9;c>0;c--)
         {ExV_cun[c]=ExV_cun[c-1];}    //存储前10次速度进行积分 
         ExV_cun[0] = ExV;
       */ 
   if(ramp_flag==0)
   if(speed_flag==1)
   if(finally==0)  
   if(motorspeed>0&&motorspeed<150)
  {//Enable_Speed=2;
    Enable_Speed=0;
  }//speed_flag=0;
  

   
    if(Enable_Speed==1)
    out += (int)(S_I *ExV + S_P*LSV + S_D*LSV1); //
    //速度限幅，4000需要根据实际情况修改

          if(out > 5500)
           out = 5500;
          if(out <0)
           out = 0;  /**/
 
   if(motorspeed>200)
   {speed_flag=1;}   
   

    /* */
         
          ExV1= ExV;                          //上一时刻的偏差  
          LSV1=LSV;
    }
 
 
/*
void filtering(int data)
 {
   
 save[4]=save[3];
 save[3]=save[2];
 save[2]=save[1];
 save[1]=save[0];
 save[0]=data;
 
 //average=save[0]*0.2+save[1]*0.2+save[2]*0.2+save[3]*0.2+save[4]*0.2;
 average= save[4];
 
if(save[4]>save[3]&&save[3]>save[2])
    average=save[3];
if(save[2]>save[3]&&save[3]>save[4])
    average=save[3];
 
if(save[3]>save[4]&&save[4]>save[2])
    average=save[4];
if(save[2]>save[4]&&save[4]>save[3])
    average=save[4];
 
if(save[3]>save[2]&&save[2]>save[4])
    average=save[2];  
if(save[4]>save[2]&&save[2]>save[3])
    average=save[2];  

 if(save[1]>save[0]&&save[0]>average)
     average=save[0];   
 if(average>save[0]&&save[0]>save[1])
     average=save[0]; 
 
 if(save[0]>save[1]&&save[1]>average)
     average=save[0];   
 if(average>save[1]&&save[1]>save[0])
     average=save[1]; 
 
}*/

 
 
//int abs(int x)
//{if(x<0)
//  x=-x;
//return x;}
//

 
 
 
 
 
 
 
 

   