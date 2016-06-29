

#ifndef __K60_CCDQ_H__
#define __K60_CCDQ_H__
#include "..\K60_datatype.h"






extern int BlocklEN ;
extern int BlockrEN ;
extern int ElbowbendrEN;
extern int ElbowbendlEN;
extern int RampEN;
extern int ProtectEN;

extern int SteerEssEN;
extern int SpeedextraEN;
extern int SinglineEN;
extern int OledShowEN;
extern int BmaEN;
extern int WhiteEN;
extern int LighthouseEN;
extern int BlackflagEN;
extern int CCDQ;
extern int CCDH;











extern int BlackFlag;
extern int Blackflag;
extern int Blackflagr;
extern int Blackflagl;
extern int Elbowbendflag;
extern int Elbowbendflagl;
extern int Elbowbendflagr;
extern int BlackFlagcnt;


extern int white_mark;
extern int white_markL;
extern int white_markR;
extern int White_mark;
extern int H;
extern int StopFlag;
extern  int threshold;
extern   int ctt;
extern   int Cnt[10];
extern int CNT[200];
extern   int startflag;
extern   int start;
extern  int Start;
extern   int End;
extern float Kp_Ess[4];
extern  int singleflag1;
extern  int singleflag2;
extern  int Singleflag[10];
extern int single;
extern   int Midline; 
extern int midline;
extern int Middlel;
extern int Middler;
extern long  len_realsum;
extern long  len_real;
extern int  len_realcnt;
extern byte ADV[128];
extern int issue_threshold;
extern  int Redge[30];
extern byte R_edgeFlag[30];
extern  int Ledge[30]; 
extern byte L_edgeFlag[30];
extern byte save_midline[10];
extern  float ess;
extern int Ess[10];
extern int Stopflag;
extern int THreshold[120];
extern int Xcal_L;              
extern int Xcal_R;              
extern int cnt;
extern int X[10];
extern int SingleFlag;
extern int Blockflag;
extern int BlockFlag;
extern int BlockL;
extern int BlockR;
extern int startr;
extern int startl;
extern int Startr[10];
extern int Startl[10];
extern int straight;
extern int Straight;
extern int straightflag;
extern int straightFlag[10]; 
extern byte len_show[10];
extern int GrayMin;
extern int GrayMIN[20];
extern   int GrayMax;
extern int GrayMAX[20];
extern  int LGrayMax;
extern int weight[4];

extern long SteerEssOld;

extern int YZ;




void  Control();
void Dev_cal();
int variance(int x[],int n);

void Devcal();
void  control();
#endif 