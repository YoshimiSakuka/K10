#include "Balance.h"
#include "math.h"


float angle ;
float D_I;
long Speed_Kp;
long Speed_Kd; 
long Speed_Ki;
long Speed_Ki_;
float TurnGyro;
float D_P;
float D_D;



long weight_Max;
long weight_Min;

long Angle_Kp=1990;
long Angle_Kd=60;

int Choice;

long SpecialPWM;
long SpecialPWML;
long SpecialPWMR;
int Ka;

int Turn_Max;
long SpeedWant;
int Stoptime;
float angleoffset=83;
uint8 str[80];
int specialfield;
float Gyro_angle;                   
float Gyro_offset;    

int SpeedEss_f[4] = {0,0,0,0};              //速度偏差滤波存储
int SpeedEss[3] = {0,0,0};
int SpeedInt = 0;

int SpeedUp = 0,SpeedUi = 0,SpeedUd = 0;
int speedmiddle = 0;
int Speedextra = 0;


float Speeda = 0.1;
int dSpeedUd[2] = 0;
long SpeedWant_ = 0;
int SpeedExtraOld = 0,SpeedExtraNew = 0;

int AngleSpeedOut;





//float rate=0.55;
//float tau=1.4;



float rate=0.55;
float tau=1.6;



float AngleConvert(void)                //加速度计角度转化
{
 float jsdangle,jsdy,jsdz,jsdx,g;
 //jsdz = ReadAcceleration(10,0);//Z
 jsdy = ReadAcceleration(2,1);
 jsdz = ReadAcceleration(0,1);
 jsdx = ReadAcceleration(1,1);
 g = sqrt(jsdx * jsdx + jsdy * jsdy);
 
 if(jsdz > 4095)
 {
  jsdz = 4095;
 }
 if(jsdz < -4095)
 {
  jsdz = -4095;
 }
 jsdangle = (acos((float)jsdz / 4095)) * 57.325;//180 / 3.14;
 
 return (jsdangle - angleoffset);//
 
}

void AngleGyroscope(void)                  //陀螺程序 暂时未加转向侧角速度
{
 uint16 gyro_balance,gyro_turn;
 gyro_balance = ad_once(ADC1,AD15,ADC_12bit);
 //Gyro_angle += ((float)gyro_balance - (float)Gyro_offset) / 200;
 Gyro_angle = ((float)gyro_balance - (float)Gyro_offset) * rate;
}



int QUADRead(uint8 dir)                    //0为右1为左
{
 uint8 direction;
 int speed;
 if(dir)
 {
  direction = (FTM2_QDCTRL & FTM_QDCTRL_QUADIR_MASK) >> FTM_QDCTRL_QUADIR_SHIFT;//正负标志
  if(direction)
  {
   speed = -(int)FTM2_CNT;
   
  }
  else
  {
   speed = 1 * (14000 - (int)FTM2_CNT);  
   
  }
  FTM2_CNT = 0;
 }
 else
 {
  direction = (FTM1_QDCTRL & FTM_QDCTRL_QUADIR_MASK) >> FTM_QDCTRL_QUADIR_SHIFT;//正负标志
  if(direction)
  {
   speed = (int)FTM1_CNT;
   
  }
  else
  {
   speed = -1 * (14000 - (int)FTM1_CNT);  
   
  }
  FTM1_CNT = 0;
 }
 if(speed < -10000)    speed = 0;
 if(speed > 10000)     speed = 0;
 return speed;
}



float a = 0.0;
float a_i = 0;
float Complementary(float newAngle,float newRate,int looptime)
{
 
 float dtC = (float)(looptime)/1000.0;
 a = tau/(tau + dtC);
 angle = a * (angle + newRate * dtC) + (1 - a) * (newAngle) + a_i * (newAngle - angle);
 return angle;
 
 
}



void AngleControl(void)
{
 float diss = 0;
 diss = angle;
 AngleSpeedOut = (int)((diss) * Angle_Kp + Gyro_angle * Angle_Kd);
}




void MotorControlLeft(int data)
{
 if(data > 0)
 {
  
  if(data > 14999)
   data = 14999;
  FTM0_C4V = data;
  FTM0_C5V = 0;
 }
 else if(data < 0)
 {
  
  
  if(data < -14999)
   data = -14999;
  
  FTM0_C4V = 0;
  FTM0_C5V = -1 * data;
  
 }
 else if (data == 0)
 {
  FTM0_C6V = 0;
  FTM0_C5V = 0;
 }
}


void MotorControlRight(int data)
{
 if(data > 0)
 {
  
  
  if(data > 14999)
   data = 14999;
  FTM0_C7V = data;
  FTM0_C6V = 0;
 }
 else if(data < 0)
 {
  
  if(data < -14999)
   data = -14999;
  FTM0_C7V = 0;
  FTM0_C6V = -1 * data;
  
 }
 else if(data == 0)
 {
  FTM0_C7V = 0;
  FTM0_C6V = 0;
 }
}





void SpeedControl(int left,int right)
{
 
 
 if(FieldCnt < 150)
 {
  SpeedWant_ = 0;
 }
 else if(FieldCnt < 400)
 {
  SpeedWant_ = (int)(SpeedWant * (FieldCnt - 150) / 250 );
 }
 else
 {
  SpeedWant_ = SpeedWant;
  
 }
 
//  if(FieldCnt >400)
//  Speed_Ki_=Speed_Ki;
 
 
 //SpeedWant_ = SpeedWant;
 
 int speedmiddle = 0,speeddis = 0;
 speedmiddle = (left + right) / 20;
 
 SpeedExtraOld = SpeedExtraNew;
 SpeedEss_f[3] = SpeedEss_f[2];
 SpeedEss_f[2] = SpeedEss_f[1];
 SpeedEss_f[1] = SpeedEss_f[0];
 
 
 
 SpeedEss[2] = SpeedEss[1];
 SpeedEss[1] = SpeedEss[0];
 
 
 
 
 speeddis = 0.6 * speedmiddle + 0.4 * SpeedEss_f[1];
 
 SpeedEss_f[0] = speeddis;
 
 
 SpeedEss[0] = SpeedWant_ - speeddis;
 
 if(abs(SpeedEss[0]) < (SpeedWant_ * 1.2))
  SpeedInt += SpeedEss[0];
 
 SpeedExtraOld = SpeedExtraNew;
 
 if((abs(SpeedEss[0]) > 0) && (abs(SpeedEss[0]) < (SpeedWant * 1.2)))//(int)(SpeedWant / 10)   //死区
 {
  //dSpeedUd[0] = (int)(Speed_Kd * (SpeedEss[0] - 2 * SpeedEss[1] + SpeedEss[2]));
  SpeedUp += (int)(Speed_Kp * (SpeedEss[0] - SpeedEss[1]));
  SpeedUi = (int)(Speed_Ki_ * SpeedInt / 10);
  
  SpeedUd += (int)((1 - Speeda) * dSpeedUd[0] + Speeda * dSpeedUd[1]);
 }
 if((abs(SpeedEss[0]) < 5) && (SpeedWant_ > 0)) //积分分离(SpeedWant / 2)(int)(SpeedWant / 10)abs
 {
  
  //BmaCnt = 10;
 }
 
 
 {
  
  Speedextra = SpeedUp + SpeedUi;
  SpeedExtraNew = SpeedUp + SpeedUi;
  
 }
 
 
}










int LCD_Flag = 0;
void chushihua()

{
 
///////////倍///////////////////////////////////////
//////////////////////////////////////////////////

BlocklEN=1;
BlockrEN=1;
ElbowbendrEN=1;
ElbowbendlEN=1;
RampEN=1;
ProtectEN=1;

SteerEssEN=1;
SpeedextraEN=1;
SinglineEN=1;
OledShowEN=1;
BmaEN=1;
WhiteEN=1;
LighthouseEN=1;
BlackflagEN=0;



 while(1)
 {
  if(!GPIO_GetBit(PORT_B,17))       //上
  {
   LCD_Flag++;
   Delay_ccd(30);
  }
  if(!GPIO_GetBit(PORT_A,15))       //下
  {
   LCD_Flag--;
   Delay_ccd(30);
  }
  if(LCD_Flag > 15)
  {
   LCD_Flag = 0;
  }
  if(LCD_Flag < 0)
  {
   LCD_Flag = 15;
  }
  
  if(LCD_Flag < 8)                //第一页
  {
   switch(LCD_Flag)
   {
	case 0:{LCD_P6x8Str(70,0,"=");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 1:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1,"=");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 2:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2,"=");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 3:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3,"=");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 4:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4,"=");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 5:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5,"=");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 6:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6,"=");
	LCD_P6x8Str(70,7," ");
	break;}
   case 7:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7,"=");
	break;}
	default:  break;
   }
   if(!GPIO_GetBit(PORT_A,12))
   {
	Delay_ccd(30);
	switch(LCD_Flag)
	{
	 case 0: BlocklEN += 1;if(BlocklEN)BlocklEN=1;break;
	 case 1: BlockrEN += 1;if(BlockrEN)BlockrEN=1;break;
	 case 2: ElbowbendrEN += 1;if(ElbowbendrEN)ElbowbendrEN=1;break;
	 case 3: ElbowbendlEN += 1;if(ElbowbendlEN)ElbowbendlEN=1;break;
	 case 4: RampEN += 1;if(RampEN)RampEN=1;break;
	 case 5: ProtectEN += 1;if(ProtectEN)ProtectEN=1;break;
	 case 6: SteerEssEN += 1;if(SteerEssEN)SteerEssEN=1;break;
	 case 7: SpeedextraEN += 1;if(SpeedextraEN)SpeedextraEN=1;break;
	 default:  break;
	}
   }
   if(!GPIO_GetBit(PORT_A,14))
   {
	Delay_ccd(30);
	switch(LCD_Flag)
	{
	 case 0: BlocklEN -= 1;if(BlocklEN<0)BlocklEN=0;break;
	 case 1: BlockrEN -= 1;if(BlockrEN<0)BlockrEN=0;break;
	 case 2: ElbowbendrEN -= 1;if(ElbowbendrEN<0)ElbowbendrEN=0;break;
	 case 3: ElbowbendlEN -= 1;if(ElbowbendlEN<0)ElbowbendlEN=0;break;
	 case 4: RampEN -= 1;if(RampEN<0)RampEN=0;break;
	 case 5: ProtectEN -= 1;if(ProtectEN<0)ProtectEN=0;break;
	 case 6: SteerEssEN -= 1;if(SteerEssEN<0)SteerEssEN=0;break;
	 case 7: SpeedextraEN -= 1;if(SpeedextraEN<0)SpeedextraEN=0;break;
	 default:  break;
	}
   }
   LCD_P6x8Str(0,0,"BlocklEN:   ");
   LCD_P6x8Str(0,1,"BlockrEN:   ");
   LCD_P6x8Str(0,2,"ElbobedrEN: ");
   LCD_P6x8Str(0,3,"ElbobedlEN: ");
   LCD_P6x8Str(0,4,"RampEN:     ");
   LCD_P6x8Str(0,5,"ProtectEN:  ");
   LCD_P6x8Str(0,6,"SteerEssEN: ");
   LCD_P6x8Str(0,7,"SpedextrEN: ");
   sprintf(str,"%6d",BlocklEN);
   LCD_P6x8Str(90,0,str);
   sprintf(str,"%6d",BlockrEN);
   LCD_P6x8Str(90,1,str);
   sprintf(str,"%6d",ElbowbendrEN);
   LCD_P6x8Str(90,2,str);
   sprintf(str,"%6d",ElbowbendlEN);
   LCD_P6x8Str(90,3,str);
   sprintf(str,"%6d",RampEN);
   LCD_P6x8Str(90,4,str);
   sprintf(str,"%6d",ProtectEN);
   LCD_P6x8Str(90,5,str);
   sprintf(str,"%6d",SteerEssEN);
   LCD_P6x8Str(90,6,str);
   sprintf(str,"%6d",SpeedextraEN);
   LCD_P6x8Str(90,7,str);
  }//end 1
  else                            //第二页
  {
   switch(LCD_Flag)
   {
	case 8:{LCD_P6x8Str(70,0,"=");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 9:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1,"=");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 10:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2,"=");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 11:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3,"=");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 12:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4,"=");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 13:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5,"=");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7," ");
	break;}
	case 14:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6,"=");
	LCD_P6x8Str(70,7," ");
	break;}
	case 15:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	LCD_P6x8Str(70,7,"=");
	break;}
	default:  break;       
   }
   if(!GPIO_GetBit(PORT_A,12))
   {
	Delay_ccd(30);
	switch(LCD_Flag)
	{
	 case 8: SinglineEN += 1; if(SinglineEN)SinglineEN=1;    break;
	 case 9: OledShowEN += 1;if(OledShowEN)OledShowEN=1;  break;
	 case 10: BmaEN += 1; if(BmaEN)BmaEN=1;   break;
	 case 11: WhiteEN+= 1; if(WhiteEN)WhiteEN=1;   break;
	 case 12: LighthouseEN+=1;  if(LighthouseEN)LighthouseEN=1;   break;
 	 case 13: BlackflagEN+=1;if(BlackflagEN)BlackflagEN=1;break;
//	 case 14: break;
//	 case 15:  break;
	 default:  break;
	}
   }
   if(!GPIO_GetBit(PORT_A,14))
   {
	Delay_ccd(30);
	switch(LCD_Flag)
	{
	 case 8: SinglineEN -= 1;  if(SinglineEN<0)SinglineEN=0;   break;
	 case 9: OledShowEN -= 1; if(OledShowEN<0)OledShowEN=0; break;
	 case 10:BmaEN -= 1; if(BmaEN<0)BmaEN=0;break;
 	 case 11:WhiteEN-= 1; if(WhiteEN<0)WhiteEN=0;   break;
	 case 12:LighthouseEN-= 1;if(LighthouseEN<0)LighthouseEN=0; break;
	 case 13:BlackflagEN-=1;if(BlackflagEN<0)BlackflagEN=0;break;
//	 case 14: break;
//	 case 15:  break;
	 default:  break;
	}
   }
   LCD_P6x8Str(0,0,"SinglineEN: ");
   LCD_P6x8Str(0,1,"OledShowEN: ");
   LCD_P6x8Str(0,2,"BmaEN:      ");
   LCD_P6x8Str(0,3,"WhiteEN:    ");
   LCD_P6x8Str(0,4,"LighhouseEN:");
   LCD_P6x8Str(0,5,"BlackflagEN:");
   LCD_P6x8Str(0,6,"            ");
   LCD_P6x8Str(0,7,"            ");
   sprintf(str,"%6d",SinglineEN);//将SinglineEN转换到str中
   LCD_P6x8Str(90,0,str);
   sprintf(str,"%6d",OledShowEN);
   LCD_P6x8Str(90,1,str);
   sprintf(str,"%6d",BmaEN);
   LCD_P6x8Str(90,2,str);
   sprintf(str,"%6d",WhiteEN);
   LCD_P6x8Str(90,3,str);
   sprintf(str,"%6d",LighthouseEN);
   LCD_P6x8Str(90,4,str);
   sprintf(str,"%6d",BlackflagEN);
   LCD_P6x8Str(90,5,str);
   LCD_P6x8Str(90,6,"       ");
   LCD_P6x8Str(90,7,"       ");
  }//end 2
    if(!GPIO_GetBit(PORT_A,16))
  {
   Delay_ccd(180);
   break;
  }
  
  
 }










//////////////////////////////////////////////////////
///////////////////////////////////////////////////// 

 
 
 
 LCD_Flag = 0;
 LCD_CLS();
 
 while(1)                                 //调参
 {
  if(!GPIO_GetBit(PORT_B,17))       //上
  {
   LCD_Flag++;
   Delay_ccd(30);
  }
  if(!GPIO_GetBit(PORT_A,15))       //下
  {
   LCD_Flag--;
   Delay_ccd(30);
  }
  if(LCD_Flag > 20)
  {
   LCD_Flag = 0;
  }
  if(LCD_Flag < 0)
  {
   LCD_Flag = 20;
  }
  if(LCD_Flag < 7)                //第一页
  {
   switch(LCD_Flag)
   {
	case 0:{LCD_P6x8Str(70,0,"=");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 1:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1,"=");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 2:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2,"=");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 3:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3,"=");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 4:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4,"=");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 5:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5,"=");
	LCD_P6x8Str(70,6," ");
	break;}
	case 6:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6,"=");
	break;}
	default:  break;
   }
   if(!GPIO_GetBit(PORT_A,12))
   {
	Delay_ccd(30);
	switch(LCD_Flag)
	{
	 case 0: SpeedWant += 1;break;
	 case 1: Speed_Kp += 10;break;
	 case 2: Speed_Ki += 1;break;
	 case 3: Speed_Kd += 2;break;
	 case 4: D_P += 10;break;
	 case 5: D_I += 2;break;
	 case 6: D_D += 5;break;
	 default:  break;
	}
   }
   if(!GPIO_GetBit(PORT_A,14))
   {
	Delay_ccd(30);
	switch(LCD_Flag)
	{
	 case 0: SpeedWant -= 1;break;
	 case 1: Speed_Kp -= 10;break;
	 case 2: Speed_Ki -= 1;break;
	 case 3: Speed_Kd -= 2;break;
	 case 4: D_P -= 10;break;
	 case 5: D_I -= 2;break;
	 case 6: D_D -= 5;break;
	 default:  break;
	}
   }
   
   LCD_P6x8Str(0,0,"SpeedWant:  ");
   LCD_P6x8Str(0,1,"Speed_Kp:   ");
   LCD_P6x8Str(0,2,"Speed_Ki:   ");
   LCD_P6x8Str(0,3,"Speed_Kd:   ");
   LCD_P6x8Str(0,4,"D_P:        ");
   LCD_P6x8Str(0,5,"D_I:        ");
   LCD_P6x8Str(0,6,"D_D:        ");
   sprintf(str,"%6d",(long)SpeedWant);
   LCD_P6x8Str(90,0,str);
   sprintf(str,"%6d",(long)Speed_Kp);
   LCD_P6x8Str(90,1,str);
   sprintf(str,"%6d",(long)Speed_Ki);
   LCD_P6x8Str(90,2,str);
   sprintf(str,"%6d",(long)Speed_Kd);
   LCD_P6x8Str(90,3,str);
   sprintf(str,"%6.0f",(float)D_P);
   LCD_P6x8Str(90,4,str);
   sprintf(str,"%6.0f",(float)D_I);
   LCD_P6x8Str(90,5,str);
   sprintf(str,"%6.0f",(float)D_D);
   LCD_P6x8Str(90,6,str);
   sprintf(str,"%6d",SpeedWant);
   LCD_P6x8Str(90,7,str);
  }//end 1
  else if(LCD_Flag < 14)                            //第二页
  {
   switch(LCD_Flag)
   {
	case 7:{LCD_P6x8Str(70,0,"=");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 8:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1,"=");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 9:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2,"=");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 10:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3,"=");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 11:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4,"=");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 12:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5,"=");
	LCD_P6x8Str(70,6," ");
	break;}
	case 13:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6,"=");
	break;}
	default:  break;       
   }
   if(!GPIO_GetBit(PORT_A,12))
   {
	Delay_ccd(30);
	switch(LCD_Flag)
	{
	 case 7: Midline += 1;     break;
	 case 8: angleoffset += 1;  break;
	 case 9: Angle_Kp += 20;    break;
	 case 10: Angle_Kd += 1;     break;
	 case 11: YZ += 1;        break;
	 case 12: weight_Min += 1;       break;
	 case 13: SpecialPWM += 100; break;
	 default:  break;
	}
   }
   if(!GPIO_GetBit(PORT_A,14))
   {
	Delay_ccd(30);
	switch(LCD_Flag)
	{
	 case 7: Midline -= 1;     break;
	 case 8: angleoffset -=1;  break;
	 case 9: Angle_Kp -= 20;    break;
	 case 10: Angle_Kd -= 1;     break;
	 case 11: YZ -= 1;        break;
	 case 12: weight_Min -= 1;       break;
	 case 13: SpecialPWM -= 100; break;
	 default:  break;
	}
   }
   
   LCD_P6x8Str(0,0,"Midline:    ");
   LCD_P6x8Str(0,1,"angleoffset:");
   LCD_P6x8Str(0,2,"Angle_Kp:   ");
   LCD_P6x8Str(0,3,"Angle_Kd:   ");
   LCD_P6x8Str(0,4,"YZ:         ");
   LCD_P6x8Str(0,5,"weight_Min: ");
   LCD_P6x8Str(0,6,"SpecialPWM: ");
   sprintf(str,"%6d",Midline);
   LCD_P6x8Str(90,0,str);
   sprintf(str,"%6.1f",(float)angleoffset);
   LCD_P6x8Str(90,1,str);
   sprintf(str,"%6d",(long)Angle_Kp);
   LCD_P6x8Str(90,2,str);
   sprintf(str,"%6d",(long)Angle_Kd);
   LCD_P6x8Str(90,3,str);
   sprintf(str,"%6d",YZ);
   LCD_P6x8Str(90,4,str);
   sprintf(str,"%6d",weight_Min);
   LCD_P6x8Str(90,5,str);
   sprintf(str,"%6d",SpecialPWM);
   LCD_P6x8Str(90,6,str);
   sprintf(str,"%6d",SpeedWant);
   LCD_P6x8Str(90,7,str);
  }//end 2
  else
  {
   switch(LCD_Flag)
   {
	case 14:{LCD_P6x8Str(70,0,"=");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 15:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1,"=");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 16:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2,"=");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 17:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3,"=");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 18:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4,"=");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6," ");
	break;}
	case 19:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5,"=");
	LCD_P6x8Str(70,6," ");
	break;}
	case 20:{LCD_P6x8Str(70,0," ");
	LCD_P6x8Str(70,1," ");
	LCD_P6x8Str(70,2," ");
	LCD_P6x8Str(70,3," ");
	LCD_P6x8Str(70,4," ");
	LCD_P6x8Str(70,5," ");
	LCD_P6x8Str(70,6,"=");
	break;}
	default:  break;       
   }
   if(!GPIO_GetBit(PORT_A,12))
   {
	Delay_ccd(30);
	switch(LCD_Flag)
	{
	 case 14: Choice += 1;     break;
	 case 15: Stoptime += 1;  break;
	 case 16: Ka += 1;  break;
	 default:  break;
	}
   }
   if(!GPIO_GetBit(PORT_A,14))
   {
	Delay_ccd(30);
	switch(LCD_Flag)
	{
	 case 14: Choice -= 1;     break;
	 case 15: Stoptime -= 1;   break;
	 case 16: Ka -= 1;    break;
	 default:  break;
	}
   }
   
   LCD_P6x8Str(0,0,"Choice:     ");
   LCD_P6x8Str(0,1,"Stoptime:   ");
   LCD_P6x8Str(0,2,"Ka:         ");
   LCD_P6x8Str(0,3,"            ");
   LCD_P6x8Str(0,4,"            ");
   LCD_P6x8Str(0,5,"            ");
   LCD_P6x8Str(0,6,"            ");
   sprintf(str,"%6d",Choice);
   LCD_P6x8Str(90,0,str);
   sprintf(str,"%6d",Stoptime);
   LCD_P6x8Str(90,1,str);
   sprintf(str,"%6d",Ka);
   LCD_P6x8Str(90,2,str);
   LCD_P6x8Str(90,3,"       ");
   LCD_P6x8Str(90,4,"       ");
   LCD_P6x8Str(90,5,"       ");
   LCD_P6x8Str(90,6,"       ");
   sprintf(str,"%6d",SpeedWant);
   LCD_P6x8Str(90,7,str);
  }
  switch(Choice)
  {
   case 0: break;
   case -1: {
	SpeedWant =135;
	Speed_Kp = -280;
	Speed_Ki = -8;
	Speed_Kd=3;  
	D_P = 460;
	D_I=38;
	D_D = 110;
	Midline=65;
	angleoffset = 71;
	Angle_Kp=1800;
	Angle_Kd=35;
	YZ=10;
	weight_Min=0;
	SpecialPWM=5000;
	Stoptime=117;
	Ka=20;            
	break;}
   case 1: {
	SpeedWant =120;
	Speed_Kp = -310;
	Speed_Ki = -8;
	Speed_Kd=3;  
	D_P = 440;
	D_I=38;
	D_D = 110;
	Midline=65;
	angleoffset = 71;
	Angle_Kp=1800;
	Angle_Kd=35;
	YZ=10;
	weight_Min=0;
	SpecialPWM=5000;
	Stoptime=117;
	Ka=20;         
	break;}
   case 2: {
	SpeedWant =145;
	Speed_Kp = -280;
	Speed_Ki = -8;
	Speed_Kd=3;  
	D_P = 470;
	D_I=38;
	D_D = 115;
	Midline=65;
	angleoffset = 72;
	Angle_Kp=980;
	Angle_Kd=35;
	YZ=10;
	weight_Min=0;
	SpecialPWM=4500;
	Stoptime=117;
	Ka=20; 
	break;}
   case 3:  {
	SpeedWant =45;
	Speed_Kp = -350; 
	Speed_Ki = -18; 
	Speed_Kd=3;
	D_P = 960;
	D_I=0;
	D_D = 280;
	Midline=69;
	angleoffset = 77; 
	Angle_Kp=1800;
	Angle_Kd=35;
	YZ=10;
	weight_Min=0;
	SpecialPWM=8000;
	Stoptime=117;
	Ka=7;
	break;}
   case 4: {
	SpeedWant =45;
	Speed_Kp = -350; 
	Speed_Ki = -18; 
	Speed_Kd=3;
	D_P = 960;
	D_I=0;
	D_D = 280;
	Midline=69;
	angleoffset = 77; 
	Angle_Kp=1800;
	Angle_Kd=35;
	YZ=10;
	weight_Min=0;
	SpecialPWM=8000;
	Stoptime=117;
	Ka=7;
	break;}
   case 5: {
	SpeedWant =45;
	Speed_Kp = -350; 
	Speed_Ki = -18; 
	Speed_Kd=3;
	D_P = 960;
	D_I=0;
	D_D = 280;
	Midline=69;
	angleoffset =77; 
	Angle_Kp=1800;
	Angle_Kd=35;
	YZ=10;
	weight_Min=0;
	SpecialPWM=8000;
	Stoptime=117;
	Ka=7;
	break;}
   case 6: {              
	SpeedWant =45;
	Speed_Kp = -350; 
	Speed_Ki = -18; 
	Speed_Kd=3;
	D_P = 960;
	D_I=0;
	D_D = 280;
	Midline=69;
	angleoffset = 77; 
	Angle_Kp=1800;
	Angle_Kd=35;
	YZ=10;
	weight_Min=0;
	SpecialPWM=8000;
	Stoptime=117;
	Ka=7;
	break;}
   case 7: {              
	SpeedWant =45;
	Speed_Kp = -350; 
	Speed_Ki = -18; 
	Speed_Kd=3;
	D_P = 960;
	D_I=0;
	D_D = 280;
	Midline=69;
	angleoffset = 77; 
	Angle_Kp=1800;
	Angle_Kd=35;
	YZ=10;
	weight_Min=0;
	SpecialPWM=8000;
	Stoptime=117;
	Ka=7;
	break;}
   case 8: {
	SpeedWant =45;
	Speed_Kp = -350; 
	Speed_Ki = -18; 
	Speed_Kd=3;
	D_P = 960;
	D_I=0;
	D_D = 280;
	Midline=69;
	angleoffset = 77; 
	Angle_Kp=1800;
	Angle_Kd=35;
	YZ=10;
	weight_Min=0;
	SpecialPWM=8000;
	Stoptime=117;
	Ka=7;
	break;}
   case 9: {   
	SpeedWant =90;
	Speed_Kp = -500; 
	Speed_Ki = -10; 
	Speed_Kd=3; 
	D_P= 960;
	D_I=0;
	D_D = 280;
	Midline=69;
	angleoffset = 77;
	Angle_Kp=1800;
	Angle_Kd=35;
	YZ=10;
	weight_Min=0;
	SpecialPWM=8000;
	Stoptime=117;
	Ka=7;
	break;}               
   default:  break;       
  }//end choice
  if(!GPIO_GetBit(PORT_A,16))
  {
   Delay_ccd(180);
   FlashSetPara();
   break;
  }
 }//end while
 
 
 
}
