#ifndef __K60_MMA8451_H__
#define __K60_MMA8451_H__
#include "..\K60_datatype.h"


void MMA8451_Init(void);
//uint16 ReadAcceleration(int time);
float ReadAcceleration(int f,int time);













#endif
