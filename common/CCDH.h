
//   #ifndef __CCDH_H__
//   #define __CCDH_H__
//
//   #include "common.h"


#ifndef __K60_CCDH_H__
#define __K60_CCDH_H__
#include "..\K60_datatype.h"

extern int CCD_Q;
extern int CCD_H;

extern int midlineH;
extern byte ADVH[128];
extern byte L_edgeFlagH[30];
extern byte R_edgeFlagH[30];

extern int LedgeH[30];
extern int RedgeH[30];
extern int thresholdH;  
extern byte len_showH[10];

extern int GrayMinH;
extern int GrayMaxH;


   #endif 