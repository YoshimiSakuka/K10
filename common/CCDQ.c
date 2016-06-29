#include "CCDQ.h"



int CCD_Q;
int CCD_H;


int BlocklEN ;
int BlockrEN ;
int ElbowbendrEN;
int ElbowbendlEN;
int RampEN;
int ProtectEN;

int SteerEssEN;
int SpeedextraEN;
int SinglineEN;
int OledShowEN;
int BmaEN;
int WhiteEN;
int LighthouseEN;
int BlackflagEN;
////////////////////////////////////////////////////////////////////////////////////



int weight[4]={0,0,0,0};
int Xcal_L=15;              //起始搜索范围  左  0-160
int Xcal_R=113;              //起始搜索范围  右  0-160

int Elbowbendflag=0;
int Elbowbendflagl=0;
int Elbowbendflagr=0;
int Blackflag=0;
int BlackFlagcnt=0;
int Blackflagr=0;
int Blackflagl=0;
int BlackFlag=0;

int SingleFlag=0;
int Blockflag=0;
int BlockFlag=0;
int Blockflagr=0;
int BlockL=0;
int Blockflagl=0;
int BlockR=0;

int straight;
int Straight=0;
int straightflag;
int straightFlag[10];    

int X[10];
int GrayMin;
int GrayMIN[20];
int startr;
int startl;
int Startr[10]={30,30,30,30,30,30,30,30};
int Startl[10]={30,30,30,30,30,30,30,30};
int cnt=0;
int Cnt[10];
int CNT[200];
int YZ;

byte GraydownR;         //右灰度沿降
byte GraydownR1;
byte LGrayMaxr;         //上一时刻的左灰度最大值

byte GraydownL;         //左灰度沿降 
byte GraydownL1; 
byte LGrayMaxl;         //上一时刻的左灰度最大值



int startflag=0;

int End=0;
int GrayMax=0;
int GrayMAX[20];
int LGrayMax=0;
int singleflag=0;
int single=0;
int singleL;
int singleR;
int singleflag1=0; 
int singleflag2=0; 
int Midline=70; 
int ctt=0;


//float X_Correct[50]={
//                   0.02,0.04,0.06,0.08,0.10,
//                   0.12,0.14,0.16,0.18,0.20,
//                   0.22,0.24,0.26,0.28,0.30,
//                   0.32,0.34,0.36,0.38,0.40,
//                   0.42,0.44,0.46,0.48,0.50,
//                   0.52,0.54,0.56,0.58,0.60,
//                   0.62,0.64,0.66,0.68,0.70,
//                   0.72,0.74,0.76,0.78,0.80,
//                   0.82,0.84,0.86,0.88,0.90,
//                   0.92,0.94,0.96,0.98,1.00
//                   };

//float X_Correct[60]={
//                   1.00,1.00,1.00,1.00,1.00,
//                   1.10,1.10,1.10,1.10,1.10,
//                   1.15,1.15,1.15,1.15,1.15,
//                   1.20,1.20,1.20,1.20,1.20,
//                   1.25,1.25,1.25,1.25,1.25,
//                   1.30,1.30,1.30,1.30,1.30,
//                   1.35,1.35,1.35,1.35,1.35,
//                   1.40,1.40,1.40,1.40,1.40,
//                   1.45,1.45,1.45,1.45,1.45,
//                   1.50,1.50,1.50,1.50,1.50,
//                   };

float X_Correct[60]={
1.00,1.00,1.00,1.00,1.00,
1.00,1.00,1.00,1.00,1.00,
1.00,1.00,1.00,1.00,1.00,
1.00,1.00,1.00,1.00,1.00,
1.00,1.00,1.00,1.00,1.00,
1.00,1.00,1.00,1.00,1.00,
1.00,1.00,1.00,1.00,1.00,
1.00,1.00,1.00,1.00,1.00,
1.00,1.00,1.00,1.00,1.00,
1.00,1.00,1.00,1.00,1.00,
};


long Turn_Kp_N = 0;



float Kp_Ess[4]={0.4,0.3,0.2,0.1};

int i,j,f;    
byte ADV[128]={0,0};
byte save_midline[10]={63,63,63,63,63,63,63,63,63,63};
float ess=0;
int Ess[10];


byte L_edgeFlag[30]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
byte R_edgeFlag[30]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};

int Ledge[30]={34,34,34,34,34,34,34,34,34,34,34,34,34,34,34};
int Redge[30]={94,94,94,94,94,94,94,94,94,94,94,94,94,94,94};
int LEDGE=30;
int REDGE=100;
int yanLL;
int yanRR;




word Add_threshold;     //灰度值和
int threshold;         //阈值
int Lthreshold;





void firstshot()
{
//单次采集曝光处理                   
GPIOC_PDOR |=  (1<<9);//TSL_SI=1; //上升沿
delay();  
GPIOC_PDOR |=  (1<<8);//TSL_CLK=1;//起始电平高
//delay();
GPIOC_PDOR &= ~(1<<9);//TSL_SI=0; //起始电平低
//发送第1个CLK
delay();
GPIOC_PDOR &= ~(1<<8);//TSL_CLK=0;//下降沿  

//发送第2~129个CLK
for(i=1; i<129; i++)
{
delay();
GPIOC_PDOR |=  (1<<8);//TSL_CLK=1;//起始电平高
delay(); 
GPIOC_PDOR &= ~(1<<8);//TSL_CLK=0;//下降沿  
}
FieldCnt++;
}


//*************************************************************************
//  * 单次采集
//************************************************
void TSL1401_GetLine_Oneshot(uint8 *pixel)
{
uint8 i;
//  byte  Er;
byte  po;
//曝光延时
//采集上次曝光得到的图像
//开始SI
GPIOC_PDOR |=  (1<<9);//TSL_SI=1; //上升沿
delay();
GPIOC_PDOR |=  (1<<8);//TSL_CLK=1;//起始电平高
//delay();
GPIOC_PDOR &= ~(1<<9);//TSL_SI=0; //起始电平低      ADV
//delay();
//采集第1个点

for(f=0;f<500;f++)
{ delay();}   

//       po = ad_once(1,15,8);  
po = ad_once(1,17,8);                                  //AD赋值
//  pixel[0] =po<<2;
pixel[0] = po ;
// Er    =   PTA12;
// pixel[0]  =  Er ;
//   pixel[0] =  PTA12;
GPIOC_PDOR &= ~(1<<8);//TSL_CLK=0;//下降沿  
//采集第1~128个点
for(i=1; i<128; i++)
{ 
//delay(); 
delay();
GPIOC_PDOR |=  (1<<8);    //TSL_CLK=1;//起始电平高
po = ad_once(1,17,8);                             //AD赋值
//  pixel[i] = po<<2 ;
pixel[i] =  po;
// Er  = PTA12;
//   pixel[i] = Er;
//   pixel[i] = PTA12;

GPIOC_PDOR &= ~(1<<8);//TSL_CLK=0;//下降沿  
}
//发送第129个clk
delay();
GPIOC_PDOR &= ~(1<<8);//TSL_CLK=0;//下降沿  
delay(); 
GPIOC_PDOR |=  (1<<8);//TSL_CLK=1;//起始电平高
delay();
}



int GrayMinl;          //左灰度最小值，初始化为255 
int GrayMaxl;          //左灰度最大值，初始化为0
word GrayMinPtrL;       //左灰度最小值指针，初始化为0
word GrayMaxPtrL;       //左灰度最大值指针，初始化为0
byte GrayMaxMinflagL;   //左灰度最大最小值标志
byte GrayMinr;          //右灰度最小值，初始化为255
byte GrayMaxr;          //右灰度最大值，初始化为0
word GrayMinPtrR;       //右灰度最小值指针，初始化为0
word GrayMaxPtrR;       //右灰度最大值指针，初始化为0      
byte GrayMaxMinflagR;   //右灰度最大最小值标志      

byte error_flag=0;

byte len_show[10]={80,80,80,80,80};
long  len_realsum=0;
long  len_real=0; 
int  len_realcnt;
int dir_error=0;
int issue_threshold;

int aa[5]={0,0,0,0,0};
int barrier_dss;

byte GrayleftedgeL;
byte GrayleftedgeR;







void Dev_cal()
{

cnt=0;
Add_threshold=0;     //清阈值和  

//****************************************************************************************
// 计算动态阈值
//****************************************************************************************CNT        
i=0;  
for(j=10;j<=118;j++)
{
Add_threshold += ADV[j];      
if(ADV[j]>LGrayMax-5)
cnt++; 
if(ADV[j]>220)
i++;
}
Cnt[0]=cnt;
CNT[0]=i;

threshold = Add_threshold/109;    //计算阈值

THreshold[0] = threshold;


Stopflag=0;

for(i=0;i<119;i++)
{
if((L_edgeFlag[0]+R_edgeFlag[0]==0))
{
Stopflag++;      
}
else
{
break;
}  
}





///*   

//    /****************************中值滤波提取黑线最黑值,作为假设的黑线位置****************************************      


GrayMin=255;
GrayMax=0; 



for(i=10;i<117;i++)
{


if(ADV[i]<GrayMin)
{
if(ADV[i-1]>ADV[i+1])
{
if(ADV[i]>ADV[i-1])
{
ADV[i]=ADV[i-1];
}
else if(ADV[i]<ADV[i+1])
{                                                     
ADV[i]=ADV[i+1];
}
}
else
{
if(ADV[i]>ADV[i+1])
{
ADV[i]=ADV[i+1];
}
else if(ADV[i]<ADV[i-1])
{
ADV[i]=ADV[i-1];
}
}
if(ADV[i]<GrayMin)
{
GrayMin = ADV[i];                    

}
}
///********************************中值滤波，提取赛道中的最白处*************************************************          
if(ADV[i]>GrayMax)
{
if(ADV[i-1]>ADV[i+1])
{
if(ADV[i]>ADV[i-1])
{
ADV[i]=ADV[i-1];
}
else if(ADV[i]<ADV[i+1])
{
ADV[i]=ADV[i+1];
}
}
else
{
if(ADV[i]>ADV[i+1])
{
ADV[i]=ADV[i+1];
}
else if(ADV[i]<ADV[i-1])
{
ADV[i]=ADV[i-1];
}
}
if(ADV[i]>GrayMax)
{
GrayMax=ADV[i];
// GrayMaxPtr = i;
}

}
}

GrayMIN[0]=GrayMin;
GrayMAX[0]=GrayMax;

////////////////////////////////////////////////////////////    
//////////////////////////////////////////////////////////// 
////////////////////////////////////////////////////////////     
for(j=0;j<10;j++)
X[j]=0;

i=0;
for(j=0;j<127;j++)
{
if(((ADV[j-1]<=threshold)&&(ADV[j]>threshold))||((ADV[j]>threshold)&&(ADV[j+1]<=threshold)))
{
X[i]=j;
i++;
j++;
}  
}        

////////////////////////////////////////////////////////////    
//////////////////////////////////////////////////////////// 
////////////////////////////////////////////////////////////    










//*****************************************************************************          
//寻找左线 上跳沿 
//***************************************************************************** 

startl=0;
for(j=64;j>10;j--)
{
if(ADV[j]>220)
{
startl++;
}       
}
Startl[0]=startl;




L_edgeFlag[0]=0; 
yanLL=midline-64;
if(yanLL<10)
yanLL=10;                     //划定左跳沿范围

for(j=midline;j>yanLL;j--)
{
if(ADV[j]>threshold)

if(ADV[j+1]>ADV[j])  
if(ADV[j]>ADV[j-1])
if(ADV[j-1]>ADV[j-2])

if(ADV[j-1]<=threshold)

if((ADV[j+1]-ADV[j-2])>Ka)  
if((ADV[j+5]-ADV[j-5])>50)  


if(ADV[j+2]>ADV[j-2])   


if(ADV[j+7]>220)

{ 
Ledge[0] = j;              
L_edgeFlag[0]=1;  
break;
}
}




//******************************************************************************      
//寻找右 下跳沿
//****************************************************************************** 




startr=0;
for(j=64;j<117;j++)
{  
if(ADV[j]>220)
{
startr++;
}     
}
Startr[0]=startr;



R_edgeFlag[0]=0;  
yanRR=midline+64;
if( yanRR>117)                   //划定右跳沿范围
yanRR=117; 

for(j=midline;j<yanRR;j++)

{

if(ADV[j]>threshold)

if(ADV[j-1]>ADV[j])   
if(ADV[j]>ADV[j+1])
if(ADV[j+1]>ADV[j+2])  

if(ADV[j+1]<=threshold)

if((ADV[j-1]-ADV[j+2])>Ka)  
if((ADV[j-5]-ADV[j+5])>50)  

if(ADV[j-2]>ADV[j+2])



if(ADV[j-7]>220)            
{ 
Redge[0] = j;              
R_edgeFlag[0]=1;  
break;
}            
}






//******************************************************************************      
//计算赛道宽度
//******************************************************************************       
if(Ledge[0]>Redge[0])
{
L_edgeFlag[0]=0;
R_edgeFlag[0]=0;
Redge[0]=Redge[1];
Ledge[0]=Ledge[1];
len_show[0]=len_show[1];        
}
else
{
if(L_edgeFlag[0]+R_edgeFlag[0]==2)
{  
len_show[0]=Redge[0]-Ledge[0];

if(len_show[0]<35)
{
L_edgeFlag[0]=0;
R_edgeFlag[0]=0;
Redge[0]=Redge[1];
Ledge[0]=Ledge[1];
len_show[0]=len_show[1];    
}
}
else
{
len_show[0]=len_show[1];
}    
}


//////////////////////////////////////////////////////////////     
//if(FieldCnt>500)
//if(FieldCnt<=550)
//if(Ess[0]<=4)
//if(L_edgeFlag[0]+R_edgeFlag[0]==2)
//{
//len_realsum=len_realsum+len_show[0];
//len_realcnt++;
//BmaCnt=2;
//}
////////////////////////////////////////////////////////////////




///////////////////////////////////////////////////
///砖头
///////////////////////////////////////////////////

//Blockflag=0;
//BlockFlag=0;
//
//
//if(BlocklEN)
//if(FieldCnt>100)
//if(CNT[7]-CNT[0]>10) 
//if(GrayMAX[0]>220)
//if(THreshold[7]-THreshold[0]>10)   
//
//
//if(R_edgeFlag[0]==1)
//if(R_edgeFlag[1]==1)
//if(R_edgeFlag[2]==1)
//if(R_edgeFlag[3]==1)
//if(R_edgeFlag[4]==1)
//if(R_edgeFlag[5]==1)
//
//
//
//if(abs(Redge[5]-Redge[0])<8)
//
//
//if(L_edgeFlag[0]==1)
//if(L_edgeFlag[1]==1)
////if(L_edgeFlag[2]==1)
////if(L_edgeFlag[3]==1)
//if(L_edgeFlag[4]==1)
//if(L_edgeFlag[5]==1)
//
//if((Ledge[0]-Ledge[5])>15)
//
//
//
//{  
//Blockflagl=1; 
//}
//
//if(Blockflagl)
//{ 
//Blockflagl++;
//if(Blockflagl<40)
//{
//L_edgeFlag[0]=1;   
//Ledge[0]=Redge[0]-31;
//
//
//if(Blockflagl<30)
//{
//L_edgeFlag[0]=1;   
//Ledge[0]=Redge[0]-29;   
//}
//
//if(Blockflagl<20)
//{
//L_edgeFlag[0]=1;   
//Ledge[0]=Redge[0]-22;   
//}
//
//
//if(Blockflagl<10)
//{
//L_edgeFlag[0]=1;   
//Ledge[0]=Redge[0]-20;   
//}
//
////BmaCnt=5;
//}
//else
//{
//Blockflagl=0;
//}
//} 
//
//
//
//
//
//
//
//
//
//
//
//if(BlockrEN)
//if(FieldCnt>100)
//if(CNT[7]-CNT[0]>10) 
//if(GrayMAX[0]>220)
//if(THreshold[7]-THreshold[0]>10)  
//
//
//if(R_edgeFlag[0]==1)
//if(R_edgeFlag[1]==1)
////if(R_edgeFlag[2]==1)
////if(R_edgeFlag[3]==1)
//if(R_edgeFlag[4]==1)
//if(R_edgeFlag[5]==1)
//
//if((Redge[5]-Redge[0])>15)
//
//
//
//
//if(L_edgeFlag[0]==1)
//if(L_edgeFlag[1]==1)
//if(L_edgeFlag[2]==1)
//if(L_edgeFlag[3]==1)
//if(L_edgeFlag[4]==1)
//if(L_edgeFlag[5]==1)
//
//
//if(abs(Ledge[0]-Ledge[5])<8)
//
//
//
//{  
//Blockflagr=1; 
//
//}
//
//
//if(Blockflagr)
//{ 
//Blockflagr++;
//
//if(Blockflagr<40)
//{
//R_edgeFlag[0]=1;  
//Redge[0]=Ledge[0]+31;
//
//if(Blockflagr<30)
//{
//R_edgeFlag[0]=1;  
//Redge[0]=Ledge[0]+29;  
//}
//
//if(Blockflagr<20)
//{
//R_edgeFlag[0]=1;  
//Redge[0]=Ledge[0]+22;  
//}
//if(Blockflagr<10)
//{
//R_edgeFlag[0]=1;  
//Redge[0]=Ledge[0]+20;  
//}
//
////BmaCnt=5; 
//}
//else
//{
//Blockflagr=0;
//}
//} 









///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////
////////十字
///////////////////////////////////////////////////////////////////
//if(!Singleflag[0])
//if(!Singleflag[1])
//if(!Singleflag[2])
//if(!Singleflag[3])
//if(!Singleflag[4])
//if(!Singleflag[5])
//if(!Singleflag[6])
//if(WhiteEN)
//{
//white_mark=0;
//
//if(FieldCnt>100)
//if(CNT[0]-CNT[7]>10) 
//if(GrayMAX[0]>220)
//if(THreshold[0]-THreshold[7]>5)
//if(abs(Ess[3])<20)
//if(L_edgeFlag[0]==0)
//if(L_edgeFlag[1]==0)
//if(L_edgeFlag[2]==0)
//
//
//
//
//
//if(R_edgeFlag[0]==0)
//if(R_edgeFlag[1]==0)
//if(R_edgeFlag[2]==0)
//
//
//
//
//if(R_edgeFlag[3]==1||L_edgeFlag[3])
//
//
//white_mark=1;
//
//
//if(white_mark)
//{
//White_mark=1;
//
//}
//
//if(White_mark)
//{
// BmaCnt=1;
//White_mark++;
//if(White_mark<7)
//{
//L_edgeFlag[0]==1;
//R_edgeFlag[0]==1;
//Redge[0]=Redge[3];
//Ledge[0]=Ledge[3];
//Redge[2]=Redge[3];
//Ledge[2]=Ledge[3];
//}
//}
//
//if(White_mark>100)
//{
// 
//White_mark=0;
//}
//
//}




/*/////////////////////////////////////////////////////////////////////////////////*/


/*///////////////////////////////////////////////
///////直角弯
//////////////////////////////////////////////*/



/*/////////////////////////////////////////////////////////////////////////////////*/

////Elbowbendflag=0;
//Blackflag=0;
//Blackflagr=0;
//Blackflagl=0;
//
//
//
////    if(FieldCnt>100)
////    if(GrayMAX[0]<150)
////    if(THreshold[8]-THreshold[0]>60)
////    Blackflag=1; 
//
//if(BlackflagEN)
//if(FieldCnt>100)
//if(Ess[5]<30)
//if(R_edgeFlag[0]==0)
//if(L_edgeFlag[0]==0)
//if(GrayMAX[0]<150)
//if(CNT[0]<10)
//{
//Blackflag=1; 
//}
//
//
//
////if(!BlackFlag)
//if(Blackflagr||Blackflagl||Blackflag)
//
//{
//
//BlackFlag=1;
////BmaCnt=5;
//}
//
//
///////////////////////////////////////
//if(BlackFlag)
//{
////BmaCnt=5;
//if(R_edgeFlag[0]==0||L_edgeFlag[0]==0) 
//{
//R_edgeFlag[0]=1;
//Redge[0]=Redge[7];
//L_edgeFlag[0]=1;
//Ledge[0]=Ledge[7];
//Redge[6]=Redge[7];
//Ledge[6]=Ledge[7];
//}
//else
//{
////BmaCnt=5;
//BlackFlag=0;
//BlackFlagcnt++;
//Elbowbendflag=1; 
//}
//}
//
//
//
////  if(BlackFlagcnt)
////  {
////    
////  }
//
//if(BlackFlagcnt>1)
//{
//BlackFlagcnt=0;
//Elbowbendflag=0;
//}
//
//
//
//if(ElbowbendrEN)
//if(Elbowbendflag)
//{
//if(THreshold[0]>=THreshold[5])
//
//
//if(R_edgeFlag[0]==1)
//if(R_edgeFlag[1]==1)
//if(R_edgeFlag[2]==1)
//
//
//
//if(Startl[0]>=Startl[3])
//if(L_edgeFlag[0]==0)
//if(L_edgeFlag[1]==0)                   
//{
//Elbowbendflagl=D_I;
//Elbowbendflag=0;                    
//}    
//}
//
//
//if(ElbowbendlEN)
//if(Elbowbendflag)
//{      
//if(THreshold[0]>=THreshold[5])
//
//if(Startr[0]>=Startr[3])
//
//if(R_edgeFlag[0]==0)
//if(R_edgeFlag[1]==0)
//
//if(L_edgeFlag[0]==1)
//if(L_edgeFlag[1]==1)
//if(L_edgeFlag[2]==1)                   
//{
//
//Elbowbendflagr=D_I;
//Elbowbendflag=0;
//}    
//}
//
//if(Elbowbendflagl>0)
//{
//Elbowbendflagl--;
//Blackflag=0;
//}
//
//if(Elbowbendflagr>0)
//{
//Elbowbendflagr--;
//Blackflag=0;
//}
//
//
//if(FieldCnt>100)
//if(abs(Ess[0])<5)
//if(R_edgeFlag[0]==1)
//if(R_edgeFlag[1]==1)
//if(R_edgeFlag[2]==1)
//if(R_edgeFlag[3]==1)
//if(R_edgeFlag[4]==1)
//if(R_edgeFlag[5]==1)
//if(abs(Redge[5]-Redge[0])<8)
//if(L_edgeFlag[0]==0)
//if(L_edgeFlag[1]==0)
//if(L_edgeFlag[2]==1)
//if(L_edgeFlag[3]==1)
//if(L_edgeFlag[4]==1)
//if(L_edgeFlag[5]==1)
//if(abs(Ledge[5]-Ledge[2])<8)
//{
// //BmaCnt=10;
//}
//
//if(FieldCnt>100)
//if(abs(Ess[0])<5)
//if(L_edgeFlag[0]==1)
//if(L_edgeFlag[1]==1)
//if(L_edgeFlag[2]==1)
//if(L_edgeFlag[3]==1)
//if(L_edgeFlag[4]==1)
//if(L_edgeFlag[5]==1)
//if(abs(Ledge[5]-Ledge[0])<8)
//if(R_edgeFlag[0]==0)
//if(R_edgeFlag[1]==0)
//if(R_edgeFlag[2]==1)
//if(R_edgeFlag[3]==1)
//if(R_edgeFlag[4]==1)
//if(R_edgeFlag[5]==1)
//if(abs(Redge[5]-Redge[2])<8)
//{
// //BmaCnt=10;
//}



///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
////////////////////////      单
////////////////////////      线
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////





if(SinglineEN)
//if(R_edgeFlag[0]==1||L_edgeFlag[0]==1)
//if(!White_mark)
{
 
 
 singleflag=0;
 single=0;

if(midline<40)
singleL=10;
else
singleL=midline-30;

if(midline>87)
singleR=117;
else
singleR=midline+30;


for(j=15;j<112;j++)
{
if((ADV[j-6]-ADV[j])>60&&(ADV[j+6]-ADV[j])>60)
if(ADV[j]<=ADV[j-1])
if(ADV[j]<=ADV[j+1])
//if(abs(midline-j)>25)
//if(abs(midline-j)>25)
{ 
//BmaCnt=1;  
singleflag=1;
//L_edgeFlag[0]=1;
//R_edgeFlag[0]=1;
//Ledge[0]=j-40;
//Redge[0]=j+40;
//midline=j; 
break;
}

}  

Singleflag[0]=singleflag;




if(Singleflag[0])
if(Singleflag[1])
if(Singleflag[2])
single=1;


if(single)
{
L_edgeFlag[0]=1;
R_edgeFlag[0]=1;
Ledge[0]=j-40;
Redge[0]=j+40;
midline=j;


{
//midline = (int)(save_midline[0]);
BmaCnt=1;
}


}









if(single)
{
if(Ledge[0]<10)L_edgeFlag[0]=0;
if(Redge[0]>117)R_edgeFlag[0]=0;

if(Ledge[0]>Redge[0])
{
L_edgeFlag[0]=0;
R_edgeFlag[0]=0;
Redge[0]=Redge[1];
Ledge[0]=Ledge[1];
len_show[0]=len_show[1];        
}
else
{
if(L_edgeFlag[0]+R_edgeFlag[0]==2)
{  
len_show[0]=Redge[0]-Ledge[0];

if(len_show[0]<40)
{
L_edgeFlag[0]=0;
R_edgeFlag[0]=0;
Redge[0]=Redge[1];
Ledge[0]=Ledge[1];
len_show[0]=len_show[1];    
}
}
else
{
Redge[0]=Redge[1];
Ledge[0]=Ledge[1]; 
len_show[0]=len_show[1];
}    
} 
}
}




//***************************************************************************** 
//存储跳沿位置
//*****************************************************************************         



for(j=28;j>=0;j--)                      
{
L_edgeFlag[j+1]=L_edgeFlag[j];
R_edgeFlag[j+1]=R_edgeFlag[j]; 
Ledge[j+1]=Ledge[j];
Redge[j+1]=Redge[j]; 
}


for(j=7;j>=0;j--)                       
{
Startl[j+1]=Startl[j];
Startr[j+1]=Startr[j]; 
straightFlag[j+1]=straightFlag[j];
len_show[j+1]=len_show[j];
Cnt[j+1]=Cnt[j];
Singleflag[j+1]=Singleflag[j];
} 


for(j=118;j>=0;j--)
{
CNT[j+1]=CNT[j];
THreshold[j+1]=THreshold[j];
}

for(j=18;j>=0;j--)
{     
GrayMIN[j+1]=GrayMIN[j];
GrayMAX[j+1]=GrayMAX[j];

} 










LGrayMax=GrayMax-5;


if(LGrayMax<200)
LGrayMax=200;         


}







int add_midline;
int R;
int weight_max=80;


int Weight_Denominator=0;
int Weight_Molecular=0; 
//******************************************************************************      
//控制函数
//****************************************************************************** 
void  Control()

{

Weight_Denominator=0;
Weight_Molecular=0; 





if(!single)

{
if(L_edgeFlag[0]+R_edgeFlag[0]==2)
{         
midline = (Ledge[1] + Redge[1])/2;
}           
if((L_edgeFlag[0]==0)&&(R_edgeFlag[0]==1))
{ 
//BmaCnt=10;
// midline = Redge[1]-45;
midline = Redge[1]-len_show[2]/2;         
}    
if((R_edgeFlag[0]==0)&&(L_edgeFlag[0]==1))
{ 
//BmaCnt=10;
//midline = Ledge[1]+45;
midline = Ledge[1]+len_show[2]/2;  
}     
if((R_edgeFlag[0]==0)&&(L_edgeFlag[0]==0))
{          
midline = (int)(save_midline[1]); 
}
}

//******************************************************************************
// 中值限幅
//****************************************************************************** 









if(midline<15)
{
midline=15;
}
if(midline>112)
{
midline=112;
}   










for(j=7;j>=0;j--)  
{ 
save_midline[j+1]=save_midline[j];
}                
save_midline[0]=midline; 






for(j=0;j<4;j++)
{

weight[j] = weight_max-(weight_max-weight_Min)*j/4; 
dir_error = save_midline[j]-Midline;                      
Weight_Molecular += (dir_error)*weight[j];
Weight_Denominator += weight[j];
}

ess = Weight_Molecular/Weight_Denominator;



long SteerDis[2] = 0;           //微分项a
float TurnGyroDis[2] = 0;
float TurnUda = 0.0;
float TurnUd[2] = 0;      
int TurnGyrodis = 0; 

TurnGyroDis[1] = TurnGyroDis[0];
TurnUd[1] = TurnUd[0];
SteerDis[1] = SteerDis[0];


// while(1)
{
TurnGyro = ad_once(ADC1,AD14,ADC_12bit);
}
TurnGyrodis = (int)((TurnGyro - TurnGyro_offset) * 0.33);

TurnUd[0] = -D_D* TurnGyrodis;


R=(ess*ess+H*H)/(2*ess);



SteerEssOld = SteerEss;

Turn_Kp_N=D_P*X_Correct[abs(ess)];

SteerEss =Turn_Kp_N* ess+ TurnUd[0];//Ka*speedmiddle*speedmiddle/R;




if(Elbowbendflagl)
{
//BmaCnt=1;
SteerEss=-SpecialPWM*Elbowbendflagl/(D_I/2);   
if(Elbowbendflagl>(D_I/2))     
SteerEss=-SpecialPWM*(D_I-Elbowbendflagl)/(D_I/2);   
}

if(Elbowbendflagr)
{
//BmaCnt=1;
SteerEss=SpecialPWM*Elbowbendflagr/(D_I/2);   
if(Elbowbendflagr>(D_I/2))     
SteerEss=SpecialPWM*(D_I-Elbowbendflagr)/(D_I/2);   
}



//      BmaCnt=1;
//    SteerEss=(SpecialPWM/4)*(D_I-Elbowbendflagl)/(D_I/4)
//    if(Elbowbendflagl<(D_I/(3*4)))
//     SteerEss=(SpecialPWM/4)+(SpecialPWM*0.75)*(D_I*0.75-Elbowbendflagl)/(D_I/4);
//    if(Elbowbendflagl<(D_I/2))
//    SteerEss=SpecialPWM+(SpecialPWM*0.75)*(D_I*0.5-Elbowbendflagl)/(D_I/4);   
//    if(Elbowbendflagl<(D_I/4))     
//    SteerEss=SpecialPWM*0.75+0.25*SpecialPWM*(D_I*0.75-Elbowbendflagl)/(D_I/4); 


//if(Elbowbendflagl)
//{
//BmaCnt=1;
//
//if(Elbowbendflagl<Speed_Kd)
//
//SteerEss=-SpecialPWM*(Speed_Kd-Elbowbendflagl)/(Speed_Kd/2);
//
//if(Elbowbendflagl<(Speed_Kd/2))
//
//SteerEss=-SpecialPWM*Elbowbendflagl/(Speed_Kd/2);
//
//
//}
//
//if(Elbowbendflagr)
//{
//
//BmaCnt=1;
//
//if(Elbowbendflagr<Speed_Kd)
//
//SteerEss=SpecialPWM*(Speed_Kd-Elbowbendflagr)/(Speed_Kd/2);
//
//if(Elbowbendflagr<(Speed_Kd/2))
//
//SteerEss=SpecialPWM*Elbowbendflagr/(Speed_Kd/2);
//
//
//
//
//
//}




if(SteerEss<-15000)
{
SteerEss=-15000;
//BmaCnt=2; 
}

if(SteerEss>15000)
{
SteerEss=15000;
//BmaCnt=2; 

}

for(j=7;j>=0;j--)
{
Ess[j+1]=Ess[j];
}
Ess[0]=ess;



}












