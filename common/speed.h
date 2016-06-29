//#ifndef __SPEED_H__
//#define __SPEED_H__
#ifndef __K60_SPEED_H__
#define __K60_SPEED_H__
#include "..\K60_datatype.h"




 void Speedcontrol();
void  filtering(int data);

extern int  motorspeed;  
extern  float speedset;  
extern  byte finally;
extern  int Enable_Speed;
extern  float S_P;
extern  float S_D;
extern  float S_I;
extern  int xiapo_flag;


#endif 