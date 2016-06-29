


//#include "Balance.h"
//#include "math.h"

#include "CCDH.h"
//#include "include.h"
#include "math.h"

byte ADVH[128]={0,0};         //声明数组，用于存放采集的线性数值 
byte DVH[128]={0,0}; 
byte AVH[128]={0,0};
int fH;




 
void firstshotH()
{
 
 int i;
 //单次采集曝光处理                   
 GPIOC_PDOR |=  (1<<11);//TSL_SI=1; //上升沿
 delay();  
 GPIOC_PDOR |=  (1<<10);//TSL_CLK=1;//起始电平高
 //delay();
 GPIOC_PDOR &= ~(1<<11);//TSL_SI=0; //起始电平低
 //发送第1个CLK
 delay();
 //   delay();
 
 
 GPIOC_PDOR &= ~(1<<10);//TSL_CLK=0;//下降沿  
 
 //发送第2~129个CLK
 for(i=1; i<129; i++)
 {
  delay();
  GPIOC_PDOR |=  (1<<10);//TSL_CLK=1;//起始电平高
  delay(); 
  GPIOC_PDOR &= ~(1<<10);//TSL_CLK=0;//下降沿  
 }
}

//*************************************************************************
//  * 单次采集
//************************************************
void TSL1401_GetLine_OneshotH(uint8 *pixel)
{
 uint8 i;
 //  byte  Er;
 byte  po;
 //曝光延时
 //采集上次曝光得到的图像
 //开始SI
 GPIOC_PDOR |=  (1<<11);//TSL_SI=1; //上升沿
 delay();
 GPIOC_PDOR |=  (1<<10);//TSL_CLK=1;//起始电平高
 //delay();
 GPIOC_PDOR &= ~(1<<11);//TSL_SI=0; //起始电平低
 //delay();
 //采集第1个点
 for(fH=0;fH<500;fH++)
 { delay();}   
 po = ad_once(0,15,8);                                  //AD赋值
 //  pixel[0] =po<<2;
 pixel[0] = po ;
 // Er    =   PTA12;
 // pixel[0]  =  Er ;
 //   pixel[0] =  PTA12;
 GPIOC_PDOR &= ~(1<<10);//TSL_CLK=0;//下降沿  
 //采集第1~128个点
 for(i=1; i<128;i++)
 { 
  //delay(); 
  delay();
  GPIOC_PDOR |=  (1<<10);    //TSL_CLK=1;//起始电平高
  po = ad_once(0,15,8);                             //AD赋值
  //  pixel[i] = po<<2 ;
  pixel[i] =  po;
  // Er  = PTA12;
  //   pixel[i] = Er;
  //   pixel[i] = PTA12;
  
  GPIOC_PDOR &= ~(1<<10);//TSL_CLK=0;//下降沿  
 }
 //发送第129个clk
 delay();
 GPIOC_PDOR &= ~(1<<10);//TSL_CLK=0;//下降沿  
 delay(); 
 GPIOC_PDOR |=  (1<<10);//TSL_CLK=1;//起始电平高
 delay();
}



int jH,iH; 
word Add_thresholdH;  
int thresholdH;  

int GrayMinH;
int GrayMaxH;

int yanLLH;
int yanRRH;

byte L_edgeFlagH[30]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
byte R_edgeFlagH[30]={1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};

int LedgeH[30]={34,34,34,34,34,34,34,34,34,34,34,34,34,34,34};
int RedgeH[30]={94,94,94,94,94,94,94,94,94,94,94,94,94,94,94};

int LGrayMaxH=0;  

byte len_showH[10]={80,80,80,80,80};



void Dev_calH()
{
 
 Add_thresholdH=0;
 for(jH=10;jH<=118;jH++)
 {
  Add_thresholdH += ADVH[jH];      
  
 }
 thresholdH = Add_thresholdH/109; 
 
 GrayMinH=255;
 GrayMaxH=0; 
 
 for(iH=10;iH<118;iH++)
 {
  
  
  if(ADVH[iH]<GrayMinH)
  {
   if(ADVH[iH-1]>ADVH[iH+1])
   {
	if(ADVH[iH]>ADVH[iH-1])
	{
	 ADVH[iH]=ADVH[iH-1];
	}
	else if(ADVH[iH]<ADVH[iH+1])
	{                                                     
	 ADVH[iH]=ADVH[iH+1];
	}
   }
   else
   {
	if(ADVH[iH]>ADVH[iH+1])
	{
	 ADVH[iH]=ADVH[iH+1];
	}
	else if(ADVH[iH]<ADVH[iH-1])
	{
	 ADVH[iH]=ADVH[iH-1];
	}
   }
   if(ADVH[iH]<GrayMinH)
   {
	GrayMinH = ADVH[iH];                    
	
   }
  }
  ///********************************中值滤波，提取赛道中的最白处*************************************************          
  if(ADVH[iH]>GrayMaxH)
  {
   if(ADVH[iH-1]>ADVH[iH+1])
   {
	if(ADVH[iH]>ADVH[iH-1])
	{
	 ADVH[iH]=ADVH[iH-1];
	}
	else if(ADVH[iH]<ADVH[iH+1])
	{
	 ADVH[iH]=ADVH[iH+1];
	}
   }
   else
   {
	if(ADVH[iH]>ADVH[iH+1])
	{
	 ADVH[iH]=ADVH[iH+1];
	}
	else if(ADVH[iH]<ADVH[iH-1])
	{
	 ADVH[iH]=ADVH[iH-1];
	}
   }
   if(ADVH[iH]>GrayMaxH)
   {
	GrayMaxH=ADVH[iH];
	
   }
   
  }
 }
 
 
 
 
 
 
 L_edgeFlagH[0]=0; 
 yanLLH=midlineH-64;
 if(yanLLH<10)
  yanLLH=10;                     //划定左跳沿范围
 
 for(jH=midlineH;jH>yanLLH;jH--)
 {
  if(ADVH[jH]>thresholdH)
   
   if(ADVH[jH+1]>ADVH[jH])  
	if(ADVH[jH]>ADVH[jH-1])
	 if(ADVH[jH-1]>ADVH[jH-2])
	  
	  if(ADVH[jH-1]<=thresholdH)
	   
	   if((ADVH[jH+1]-ADVH[jH-2])>Ka)  
		
		
		if(ADVH[jH+2]>ADVH[jH-2])   
		 
		 
		 if(ADVH[jH+7]>220)
		  
		 { 
		  LedgeH[0] = jH;              
		  L_edgeFlagH[0]=1;  
		  break;
		 }
 }
 
 
 R_edgeFlagH[0]=0;  
 yanRRH=midlineH+64;
 if( yanRRH>117)                   //划定右跳沿范围
  yanRRH=117; 
 
 for(jH=midlineH;jH<yanRRH;jH++)
  
 {
  
  if(ADVH[jH]>thresholdH)
   
   if(ADVH[jH-1]>ADVH[jH])   
	if(ADVH[jH]>ADVH[jH+1])
	 if(ADVH[jH+1]>ADVH[jH+2])  
	  
	  if(ADVH[jH+1]<=thresholdH)
	   
	   if((ADVH[jH-1]-ADVH[jH+2])>Ka)  
		
		if(ADVH[jH-2]>ADVH[jH+2])
		 
		 
		 
		 if(ADVH[jH-7]>220)
		  
		 { 
		  RedgeH[0] = jH;              
		  R_edgeFlagH[0]=1;  
		  break;
		 }            
 }
 
 
 
 
 
 if(LedgeH[0]>RedgeH[0])
 {
  L_edgeFlagH[0]=0;
  R_edgeFlagH[0]=0;
  RedgeH[0]=RedgeH[1];
  LedgeH[0]=LedgeH[1];
  len_showH[0]=len_showH[1];        
 }
 else
 {
  if(L_edgeFlagH[0]+R_edgeFlagH[0]==2)
  {  
   len_showH[0]=RedgeH[0]-LedgeH[0];
   
   if(len_showH[0]<40)
   {
	L_edgeFlagH[0]=0;
	R_edgeFlagH[0]=0;
	RedgeH[0]=RedgeH[1];
	LedgeH[0]=LedgeH[1];
	len_showH[0]=len_showH[1];    
   }
  }
  else
  {
   len_showH[0]=len_showH[1];
  }    
 }
 
 
 
 for(jH=28;jH>=0;jH--)                      
 {
  L_edgeFlagH[jH+1]=L_edgeFlagH[jH];
  R_edgeFlagH[jH+1]=R_edgeFlagH[jH]; 
  LedgeH[jH+1]=LedgeH[jH];
  RedgeH[jH+1]=RedgeH[jH]; 
 }  
 
 
 for(jH=7;jH>=0;jH--) 
 {
  len_showH[jH+1]=len_showH[jH];
 }
 
 LGrayMaxH=GrayMaxH-5;
 
 
 if(LGrayMaxH<200)
  LGrayMaxH=200;  
 
}  




byte save_midlineH[10]={63,63,63,63,63,63,63,63,63,63};




void  ControlH()
{
 
 
 if(L_edgeFlagH[0]+R_edgeFlagH[0]==2)
 {         
  midlineH = (LedgeH[1] + RedgeH[1])/2;
 }           
 if((L_edgeFlagH[0]==0)&&(R_edgeFlagH[0]==1))
 {        
  midlineH = RedgeH[1]-len_showH[2]/2;         
 }    
 if((R_edgeFlagH[0]==0)&&(L_edgeFlagH[0]==1))
 {        
  midlineH = LedgeH[1]+len_showH[2]/2;  
 }     
 if((R_edgeFlagH[0]==0)&&(L_edgeFlagH[0]==0))
 {          
  midlineH = (int)(save_midlineH[1]); 
  
 }
 
 
 if(midlineH<15)
 {
  midlineH=15;
 }
 if(midlineH>112)
 {
  midlineH=112;
 }        
 
 
 for(jH=7;jH>=0;jH--)  
 { 
  save_midlineH[jH+1]=save_midlineH[jH];
 }                
 save_midlineH[0]=midlineH; 
 
 
 
 
}