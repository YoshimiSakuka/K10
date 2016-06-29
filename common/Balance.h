#ifndef __K60_BALANCE_H__
#define __K60_BALANCE_H__
#include "..\K60_datatype.h"

extern uint8 status;
extern int Stoptime;
extern int Ka;
extern long SpecialPWM;
extern uint8 txbuf[5][32];

extern  u8 BmaCnt;
extern long SteerEss;
extern long testpwm,testpwm1,testpwm2,testpwm3,testpwm4;
extern uint8 str[80];
extern float Gyro_angle;
extern float Gyro_offset;
extern int QUAD_Left;
extern int QUAD_Right;
extern float AngleACC;
extern float angle;
extern int AngleSpeedOut;
extern long Angle_Kp;
extern long Angle_Kd;
extern int Speedextra;
extern float angleoffset;
extern long SpeedWant;
extern float tau;
extern float TurnGyro;
extern float TurnGyro_offset;
extern long Speed_Kd;
extern long Speed_Kp;
extern long Speed_Ki;
extern int SpeedEss[3];
extern float Speeda;
extern int SpeedExtraOld;
extern int SpeedExtraNew;
extern int speedmiddle;
extern float TurnGyro; 
extern int SpeedInt;
extern int SpeedUp;
extern int SpeedUi;
extern int SpeedUd;
extern float D_P;
extern float D_I;
extern float D_D;

extern long weight_Max;
extern long weight_Min;
extern int specialfield;

float AngleConvert(void);               //加速度计  角度转化
void AngleGyroscope(void);             //陀螺
int QUADRead(uint8 dir);
void AngleControl(void);
void MotorControlLeft(int data);
void MotorControlRight(int data);
void SpeedControl(int left,int right);
float Complementary(float newAnagle,float newRate,int looptime);


void chushihua();




#endif