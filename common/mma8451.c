#include"mma8451.h"





void MMA8451_Init(void)                    //地址0x1d
{
    I2C_init(I2C0);
    I2C_WriteAddr(I2C0, 0x1d, 0x0f, 0x10); //低通滤波
    I2C_WriteAddr(I2C0, 0x1d, 0x0e, 0x00); //2G
    I2C_WriteAddr(I2C0, 0x1d, 0x2a, 0x01); //激活 
}





//uint16 ReadAcceleration(int time)
//{
//    uint16 n;
//    uint8 zz[2];
//    int sign;
//    float v;
//    uint16 w;
//    int z=0; 
//    
//    for(z=0;z<time;z++)
//    {
//      zz[0] = I2C_ReadAddr(I2C0, 0x1d, 0x05);       //z轴高有效位  X 0x01 Y 0x03
//      zz[1] = I2C_ReadAddr(I2C0, 0x1d, 0x06);       //z轴低有效位  X 0x02 Y 0x04      
//      if(zz[0]>0x7f)
//      {
//        sign = -1;
//        n = (int)zz[0];	
//        zz[1] = zz[1]>>2;
//        n = n<<6 | zz[1];
//        n = (~n + 1)&0X3FFF;                    //
//      }
//      else
//      {
//        sign = 1;
//        n = (int)zz[0];	
//        zz[1] = zz[1]>>2;
//        n = n<<6 | zz[1];
//      }
//      v = sign * ((float)n);
//      w += (uint16)((v ) * 0.25);//+ 5120
//    }
//      return w; 
//
//}

float ReadAcceleration(int f,int time)//0 1
{
    uint16 n;
    uint8 zz[2];
    int sign;
    float v;
    double w = 0;
    int z=0; 
    
    for(z=0;z<time;z++)
    {
      if(f == 0)//Z
      {
        zz[0] = I2C_ReadAddr(I2C0, 0x1d, 0x05);       //z轴高有效位  X 0x01 Y 0x03
        zz[1] = I2C_ReadAddr(I2C0, 0x1d, 0x06);       //z轴低有效位  X 0x02 Y 0x04      
      }
      else if(f == 1)//X
      {
        zz[0] = I2C_ReadAddr(I2C0, 0x1d, 0x01);       //z轴高有效位  X 0x01 Y 0x03
        zz[1] = I2C_ReadAddr(I2C0, 0x1d, 0x02);       //z轴低有效位  X 0x02 Y 0x04
      }
      else if(f == 2)//Y
      {
        zz[0] = I2C_ReadAddr(I2C0, 0x1d, 0x03);       //z轴高有效位  X 0x01 Y 0x03
        zz[1] = I2C_ReadAddr(I2C0, 0x1d, 0x04);       //z轴低有效位  X 0x02 Y 0x04
      }
      if(zz[0]>0x7f)
      {
        sign = -1;
        n = (int)zz[0];	
        zz[1] = zz[1]>>2;
        n = n<<6 | zz[1];
        n = (~n + 1)&0X3FFF;                    //
      }
      else
      {
        sign = 1;
        n = (int)zz[0];	
        zz[1] = zz[1]>>2;
        n = n<<6 | zz[1];
      }
      v = sign * ((float)n);
      w += v ;//+ 5120
    }
    v = w / time;
      return v; 

}