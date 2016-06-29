#include "FTM.h"





////////////////////////////////////////////////////////////////////////////////////////
volatile struct FTM_MemMap *FTMx[3] = {FTM0_BASE_PTR, FTM1_BASE_PTR, FTM2_BASE_PTR};




/***FUNC+*********************************************************************/
/* Name   : Ftm_init                                                         */
/* Descrp : 初始对应的FTM通道                                                */
/* Input  : FTMChannel:FTM模块号.                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Ftm_init(U8 FTMChannel)
{
    switch(FTMChannel)
    {
    case 0:      
      SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK; //使能FTM时钟
      //FTM_MOD_REG(FTM0_BASE_PTR) = 0x7530; 
      FTM_MOD_REG(FTM0_BASE_PTR) = 0xEA60;  //60000  0.01s
      FTM_CNTIN_REG(FTM0_BASE_PTR) = 0x0000;    //初始值
      FTM_SC_REG(FTM0_BASE_PTR) = 0x4B;//f = 6Mhz 0b01001011   4-3CLKS 01 选择系统时钟 0-2 PS011 8分频
      break;
    case 1:
      SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;
      FTM_MOD_REG(FTM1_BASE_PTR) = 0x7530;
      FTM_CNTIN_REG(FTM1_BASE_PTR) = 0x0000;
      FTM_SC_REG(FTM1_BASE_PTR) = 0x4B;//f = 3Mhz
      break;
    case 2:
      SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;
      FTM_MOD_REG(FTM2_BASE_PTR) = 0x7530;
      FTM_CNTIN_REG(FTM2_BASE_PTR) = 0x0000;
      FTM_SC_REG(FTM2_BASE_PTR) = 0x4B;//f = 3Mhz
      break;      
    }
}


/***FUNC+*********************************************************************/
/* Name   : Ftm_stop                                                         */
/* Descrp : 关闭对应的FTM通道                                                */
/* Input  : FTMChannel:FTM模块号.                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Ftm_stop(U8 FTMChannel)
{
    switch(FTMChannel)
    {
    case 0:
      FTM_SC_REG(FTM0_BASE_PTR) &= ~FTM_SC_CLKS_MASK;
      break;
    case 1:
      FTM_SC_REG(FTM1_BASE_PTR) &= ~FTM_SC_CLKS_MASK;
      break;
    case 2:
      FTM_SC_REG(FTM2_BASE_PTR) &= ~FTM_SC_CLKS_MASK;
      break;      
    }
}


/***FUNC+*********************************************************************/
/* Name   : Ftm_enable_int                                                   */
/* Descrp : 开ftm中断                                                        */
/* Input  : FTMChannel:FTM模块号.                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Ftm_enable_int(U8 FTMChannel)
{
    enable_irq(FTM0_irq_no + FTMChannel);  //开FTM中断
}



/***FUNC+*********************************************************************/
/* Name   : Ftm_disable_int                                                  */
/* Descrp : 关ftm中断                                                        */
/* Input  : FTMChannel:FTM模块号.                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Ftm_disable_int(U8 FTMChannel)
{
    disable_irq(FTM0_irq_no + FTMChannel);  //关FTM中断
}




/*************************************************************************
*                             野火嵌入式开发工作室
*
*  函数名称：FTM_Input_init
*  功能说明：输入捕捉初始化函数
*  参数说明：FTMn        模块号（0、  1、  2）
*            CHn         通道号（0~7）
*            Input_cfg   输入捕捉配置（Rising、Falling、Rising_or_Falling）上升沿捕捉、下降沿捕捉、跳变沿捕捉
*  函数返回：无
*  修改时间：2012-1-26
*  备    注：CH0~CH3可以使用过滤器，未添加这功能
*************************************************************************/
void FTM_Input_init(FTMn ftmn, CHn ch, Input_cfg cfg)
{
    
    /******************* 开启时钟 和 复用IO口*******************/
    //注，这里代码虽然长，但真正执行的就几条语句
    switch(ftmn)
    {
    case FTM0:
        SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;                           //使能FTM0时钟
        switch(ch)
        {
        case CH0:

            SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
            PORT_PCR_REG(PORTC_BASE_PTR, 1) = PORT_PCR_MUX(4);  // PTC1

            break;

        case CH1:
//            if(FTM0_CH1 == PTC2)
//            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 2) = PORT_PCR_MUX(4);  // PTC2
//            }
//            else if(FTM0_CH1 == PTA4)
//            {
//                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//                PORT_PCR_REG(PORTA_BASE_PTR, 4) = PORT_PCR_MUX(3);  // PTA4
//            }

            break;

        case CH2:
//            if(FTM0_CH2 == PTC3)
//            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 3) = PORT_PCR_MUX(4);  // PTC3
//            }
//            else if(FTM0_CH2 == PTA5)
//            {
//                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//                PORT_PCR_REG(PORTA_BASE_PTR, 5) = PORT_PCR_MUX(3);  // PTA5
//            }
            break;

        case CH3:
//            if(FTM0_CH3 == PTC4)
//            {
                SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
                PORT_PCR_REG(PORTC_BASE_PTR, 4) = PORT_PCR_MUX(4);  // PTC4
//            }
//            else if(FTM0_CH3 == PTA6)
//            {
//                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//                PORT_PCR_REG(PORTA_BASE_PTR, 6) = PORT_PCR_MUX(3);  // PTA6
//            }

            break;

        case CH4:
//            if(FTM0_CH4 == PTD4)
//            {
                SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
                PORT_PCR_REG(PORTD_BASE_PTR, 4) = PORT_PCR_MUX(4);  // PTD4
//            }
//            else if(FTM0_CH4 == PTA7)
//            {
//                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//                PORT_PCR_REG(PORTA_BASE_PTR, 7) = PORT_PCR_MUX(3);  // PTA7
//            }

            break;

        case CH5:

            SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
            PORT_PCR_REG(PORTD_BASE_PTR, 5) = PORT_PCR_MUX(4);  // PTD5

            break;

        case CH6:

            SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
            PORT_PCR_REG(PORTD_BASE_PTR, 6) = PORT_PCR_MUX(4);  // PTD6

            break;

        case CH7:

            SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
            PORT_PCR_REG(PORTD_BASE_PTR, 7) = PORT_PCR_MUX(4);  // PTD7

            break;
        default:
            return;
        }
        break;

    case FTM1:
        SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;                           //使能FTM1时钟
        switch(ch)
        {
        case CH0:
//            if(FTM1_CH0 == PTA8)
//            {
                //SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                //PORT_PCR_REG(PORTA_BASE_PTR, 8) = PORT_PCR_MUX(3);  // PTA8
//            }
//            else if(FTM1_CH0 == PTA12)
//            {
//                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//                PORT_PCR_REG(PORTA_BASE_PTR, 12) = PORT_PCR_MUX(3);  // PTA12
//            }
//            else if(FTM1_CH0 == PTB0)
//            {
                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
                PORT_PCR_REG(PORTB_BASE_PTR, 0) = PORT_PCR_MUX(3);  // PTB0
//            }

            break;


        case CH1:
//            if(FTM1_CH1 == PTA9)
//            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 9) = PORT_PCR_MUX(3);  // PTA9
//            }
//            else if(FTM1_CH1 == PTA13)
//            {
//                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
//                PORT_PCR_REG(PORTA_BASE_PTR, 13) = PORT_PCR_MUX(3);  // PTA13
//            }
//            else if(FTM1_CH1 == PTB1)
//            {
//                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//                PORT_PCR_REG(PORTB_BASE_PTR, 1) = PORT_PCR_MUX(3);  // PTB1
//            }

            break;

        default:
            return;
        }
        break;
    case FTM2:
        SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //使能FTM2时钟
        switch(ch)
        {
        case CH0:
//            if(FTM2_CH0 == PTA10)
//            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 10) = PORT_PCR_MUX(3);  // PTA10
//            }
//            else if(FTM2_CH0 == PTB18)
//            {
//                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//                PORT_PCR_REG(PORTA_BASE_PTR, 18) = PORT_PCR_MUX(3);  // PTB18
//            }

            break;

        case CH1:
//            if(FTM2_CH1 == PTA11)
//            {
                SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
                PORT_PCR_REG(PORTA_BASE_PTR, 11) = PORT_PCR_MUX(3);  // PTA11
//            }
//            else if(FTM2_CH1 == PTB19)
//            {
//                SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK;
//                PORT_PCR_REG(PORTA_BASE_PTR, 19) = PORT_PCR_MUX(3);  // PTB19
//            }


            break;

        default:
            return;
        }
        break;
    default:
        break;
    }


    /******************* 设置为输入捕捉功能 *******************/
    switch(cfg)
    {
    case Rising:    //上升沿触发
        FTM_CnSC_REG(FTMx[ftmn], ch) |=  ( FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK );                   //置1
        FTM_CnSC_REG(FTMx[ftmn], ch) &= ~( FTM_CnSC_ELSB_MASK  | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        break;

    case Falling:   //下降沿触发
        FTM_CnSC_REG(FTMx[ftmn], ch) |= (FTM_CnSC_ELSB_MASK  | FTM_CnSC_CHIE_MASK );                    //置1
        FTM_CnSC_REG(FTMx[ftmn], ch) &= ~( FTM_CnSC_ELSA_MASK | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        break;

    case Rising_or_Falling: //上升沿、下降沿都触发
        FTM_CnSC_REG(FTMx[ftmn], ch) |=  ( FTM_CnSC_ELSB_MASK | FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK ); //置1
        FTM_CnSC_REG(FTMx[ftmn], ch) &= ~( FTM_CnSC_MSB_MASK  | FTM_CnSC_MSA_MASK); //清0
        break;
    }

    FTM_SC_REG(FTMx[ftmn]) = FTM_SC_CLKS(0x1);       //System clock

    FTM_MODE_REG(FTMx[ftmn]) |= FTM_MODE_WPDIS_MASK;
    FTM_COMBINE_REG(FTMx[ftmn]) = 0;
    FTM_MODE_REG(FTMx[ftmn]) &= ~FTM_MODE_FTMEN_MASK;
    FTM_CNTIN_REG(FTMx[ftmn]) = 0;

    FTM_STATUS_REG(FTMx[ftmn]) = 0x00;               //清中断标志位

    //开启输入捕捉中断
    enable_irq(78 - 16 + ftmn);
}


/********************************************************************************************************************/
/*    PWM                                                                                                           */
/*                                                                                                                  */
/********************************************************************************************************************/
void PWM_Init(void)
{
  
    /* config port for FTM:  */
    //PORTA_PCR8 = PORT_PCR_MUX(0x3) | PORT_PCR_DSE_MASK; //高驱动强度
    PORTD_PCR6 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH6    PTD6   右轮
    PORTD_PCR7 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH7    PTD7   右轮
    PORTD_PCR4 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH4    PTD4   左轮
    PORTD_PCR5 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH5    PTD5   左轮  
  
  
  
    /* FTM1 clock enable:*/
    //SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
    SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;
    
    //FTM1_SC |= (FTM_SC_CLKS(1)           // CLKS=1:System clock
    //           |FTM_SC_PS(7));           // 48MHz/128=375KHz
    FTM0_SC = 0x08; //设置无中断、向下计数及分频因子为1；
                      //边沿触发模式
                      //PMW频率=X系统频率/(2^FTM0_SC_PS)/FTM0_MOD
    
    
    //FTM1_C0SC |= (FTM_CnSC_MSB_MASK      // MSB=1:Edge-aligned PWM
    //             |FTM_CnSC_ELSA_MASK);   // ELSA=1:Low first    占空比为低电平
    
    FTM0_C4SC |= FTM_CnSC_ELSB_MASK;                          
    FTM0_C4SC &= ~FTM_CnSC_ELSA_MASK;                         
    FTM0_C4SC |= FTM_CnSC_MSB_MASK;                         
      
    FTM0_C5SC |= FTM_CnSC_ELSB_MASK;                         
    FTM0_C5SC &= ~FTM_CnSC_ELSA_MASK;                        
    FTM0_C5SC |= FTM_CnSC_MSB_MASK;     
      
       /**/
     
    FTM0_C6SC |= FTM_CnSC_ELSB_MASK;
    FTM0_C6SC &= ~FTM_CnSC_ELSA_MASK;
    FTM0_C6SC |= FTM_CnSC_MSB_MASK;     
      
    FTM0_C7SC |= FTM_CnSC_ELSB_MASK;
    FTM0_C7SC &= ~FTM_CnSC_ELSA_MASK;
    FTM0_C7SC |= FTM_CnSC_MSB_MASK; 
    
    
    
    FTM0_MODE |= FTM_MODE_WPDIS_MASK;      //BIT1   Initialize the Channels Output
   
    FTM0_MODE &= ~1;           //BIT0   FTM Enable
    
//    FTM1_C0SC |= (FTM_CnSC_MSB_MASK      // MSB=1:Edge-aligned PWM
//                 |FTM_CnSC_ELSB_MASK);    //占空比为高电平
//    FTM1_C0SC &= ~FTM_CnSC_ELSA_MASK;
    
    //FTM1_OUTMASK = 0XFE;                 // Ch1-7 output is masked except ch0 屏蔽其他
    
    /* set PWM frequence: */
    FTM0_COMBINE=0;      //  双边沿捕捉禁止，COMBINE=0，不级联
    FTM0_OUTINIT=0;
    FTM0_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
    FTM0_POL=0;          //Channels Polarity (FTMx_POL)
                           //0 The channel polarity is active high.
                           //1 The channel polarity is active low.     
      //Set Edge Aligned PWM
    FTM0_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;     //不使能正交编码功能
    FTM0_INVCTRL=0;      //反转控制
    FTM0_SWOCTRL=0;      //软件输出控制F TM Software Output Control (FTMx_SWOCTRL)
    FTM0_PWMLOAD=0;      //FTM PWM Load
                           //BIT9: 0 Loading updated values is disabled.
                           //1 Loading updated values is enabled.
    FTM0_CNTIN=0;        //Counter Initial Value      FTM0计数器初始值为0 
    FTM0_MOD=15000;       //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001)  结束值，周期为（MOD-CNTIN+1）*时钟周期=10ms
    
    FTM0_C6V=0;                   //右轮反转
    FTM0_C7V=0;                   //右轮正转    
    FTM0_C4V=0;                   //左轮正转                 正、反转死区300左右
    FTM0_C5V=0;                   //左轮反转               
    
    
    //FTM1_CNTIN = 0;
    //FTM1_MOD   = 374;                    // f=375KHz/(MOD - CNTIN + 1)=1KHz
    
    //FTM1_C0V   = 0;                      // 0% for initiation

}



/********************************************************************************************************************/
/*    PWM    中心对奇                                                                                               */
/*                                                                                                                  */
/********************************************************************************************************************/
void CPWM_INIT(void)
{
    PORTA_PCR8 = PORT_PCR_MUX(0x3) | PORT_PCR_DSE_MASK;
    SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
    FTM1_SC |= FTM_SC_CPWMS_MASK;          //CPWM
    FTM1_SC |= (FTM_SC_CLKS(1)           // CLKS=1:System clock
               |FTM_SC_PS(7)); 
    FTM1_C0SC |= FTM_CnSC_ELSA_MASK;    //低高低
    FTM1_OUTMASK = 0XFE;
    FTM1_CNTIN = 0;
    FTM1_MOD   = 374; 
    FTM1_C0V   = 0;
    
    
}


/********************************************************************************************************************/
/*    PWM    互补输出带死区                                                                                         */
/*                                                                                                                  */
/********************************************************************************************************************/
void CPWM_COMBINE_INIT(void)
{
    PORTA_PCR8 = PORT_PCR_MUX(0x3) | PORT_PCR_DSE_MASK;
    PORTA_PCR9 = PORT_PCR_MUX(0x3) | PORT_PCR_DSE_MASK;
    SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
    FTM1_SC = 0;
    //FTM1_SC |= FTM_SC_CPWMS_MASK;       //CPWM
    FTM1_SC |= (FTM_SC_CLKS(1)           // CLKS=1:System clock
               |FTM_SC_PS(7));
    FTM1_MODE |= FTM_MODE_WPDIS_MASK;//写保护禁止
    FTM1_MODE |=FTM_MODE_FTMEN_MASK;//FTMEN=1
    FTM1_QDCTRL &= ~FTM_QDCTRL_QUADEN_MASK;//禁止正交解码模式
    FTM1_COMBINE |= FTM_COMBINE_COMBINE0_MASK;//FTM1通道0,1联合使用
    FTM1_COMBINE |= FTM_COMBINE_COMP0_MASK;//FTM1通道0,1互补输出
    FTM1_COMBINE |= FTM_COMBINE_SYNCEN0_MASK;//使能FTM1通道0,1 PWM同步
    FTM1_COMBINE |= FTM_COMBINE_DTEN0_MASK;//死区插入
    FTM1_DEADTIME = FTM_DEADTIME_DTPS(3)|FTM_DEADTIME_DTVAL(6);     //16分频 （0x 1；10 4；11 16）   6个周期  =2us  48M/16
    FTM1_SYNCONF|=FTM_SYNCONF_SWWRBUF_MASK;//使能MOD,CNTIN,CV寄存器的软件触发同步
    FTM1_SYNC=FTM_SYNC_CNTMIN_MASK|FTM_SYNC_CNTMAX_MASK;//设置load point
    FTM1_C0SC |= FTM_CnSC_ELSA_MASK;    //低高低
    FTM1_C1SC |= FTM_CnSC_ELSA_MASK;    //低高低
    FTM1_OUTMASK=0XFC;//通道0，1输出，屏蔽其它通道
    FTM1_CNTIN = 0;
    FTM1_MOD = 374; 
    FTM1_C0V = 0;
    FTM1_C1V = 50 * 374 / 100;
    FTM1_CNT = 0;
    FTM1_SYNC|=FTM_SYNC_SWSYNC_MASK;//使能软件触发
    
    
}


/***FUNC+*********************************************************************/
/* Name   : PWM1Output                                                       */
/* Descrp : output for PWM1                                                  */
/* Input  : None.                                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void PWM1Output(UCHAR ucDuty)
{

    if (ucDuty >= 100)
    {
        FTM1_C0V = 375;
        FTM1_SYNC |= FTM_SYNC_SWSYNC_MASK;//使能软件触发
    }
    
    else
    {    
        FTM1_C0V = (U16)ucDuty * 374 / 100;
        FTM1_SYNC |= FTM_SYNC_SWSYNC_MASK;//使能软件触发
    }
    
}




/************************************************************************/
/*正交解码*/
//查看FTM1_CNT、FTM2_CNT就可知道当前计数值，查看TOFDIR、QUADIR可以知道转向。
/************************************************************************/
void FTM_QUAD_init()
{
    /*开启端口时钟*/
    SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;

    /*选择管脚复用功能*/
    //PORTA_PCR12 = PORT_PCR_MUX(7);
    //PORTA_PCR13 = PORT_PCR_MUX(7);
    //PORTA_PCR10 = PORT_PCR_MUX(6);
    //PORTA_PCR11 = PORT_PCR_MUX(6);
    
    
    PORTB_PCR0 = PORT_PCR_MUX(6);
    PORTB_PCR1 = PORT_PCR_MUX(6); 
    PORTB_PCR18 = PORT_PCR_MUX(6);
    PORTB_PCR19 = PORT_PCR_MUX(6); 
    
    
    

    /*使能FTM1、FTM2时钟*/
    SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
    SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;

    FTM1_MOD = 14000; //可根据需要设置
    FTM2_MOD = 14000;

    FTM1_CNTIN = 0;
    FTM2_CNTIN = 0;

    FTM1_MODE |= FTM_MODE_WPDIS_MASK; //禁止写保护
    FTM2_MODE |= FTM_MODE_WPDIS_MASK; //禁止写保护
    FTM1_MODE |= FTM_MODE_FTMEN_MASK; //FTMEN=1,关闭TPM兼容模式，开启FTM所有功能
    FTM2_MODE |= FTM_MODE_FTMEN_MASK; //FTMEN=1,关闭TPM兼容模式，开启FTM所有功能

    //FTM1_QDCTRL &= ~FTM_QDCTRL_QUADMODE_MASK; //选定编码模式为A相与B相编码模式
    FTM1_QDCTRL |= FTM_QDCTRL_QUADMODE_MASK;//AB相同时判断极性
    
    FTM1_QDCTRL |= FTM_QDCTRL_QUADEN_MASK; //使能正交解码模式
    //FTM2_QDCTRL &= ~FTM_QDCTRL_QUADMODE_MASK; //选定编码模式为A相与B相编码模式
    FTM2_QDCTRL |= FTM_QDCTRL_QUADMODE_MASK;
    
    FTM2_QDCTRL |= FTM_QDCTRL_QUADEN_MASK; //使能正交解码模式

    FTM1_SC |= FTM_SC_CLKS(3);  //选择外部时钟
//   FTM1_CONF |=FTM_CONF_BDMMODE(3); //可根据需要选择
    FTM2_SC |= FTM_SC_CLKS(3);
//   FTM2_CONF |=FTM_CONF_BDMMODE(3);

}
int speed_L;
int direction;
void lptmr_pulse_clean(void)
{
    LPTMR0_CSR  &= ~LPTMR_CSR_TEN_MASK;     //禁用LPT的时候就会自动清计数器的值
    LPTMR0_CSR  |= LPTMR_CSR_TEN_MASK;
}
int QUADRead_L(void)   
{                     
      direction =GPIO_GetBit(PORT_A,13); //1正转
      
      if(direction)
      {     
      speed_L = LPTMR0_CNR;     //保存脉冲计数器计算值
      }
      else
      {        
       speed_L =-LPTMR0_CNR;   
      }
      lptmr_pulse_clean();
      
      return speed_L;
}

void lptmr_pulse_counter(char pin_select)
{
  uint16 compare_value=3056;     //3056
 
  //Reset LPTMR module
  LPTMR0_CSR=0x00;
  LPTMR0_PSR=0x00;
  LPTMR0_CMR=0x00;
    SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;
    
  //Set up GPIO
  if(pin_select==LPTMR_ALT1)
  {
    SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK; //Turn on PORTA clock
    PORTA_PCR19=PORT_PCR_MUX(0x6); //Use ALT6 on PTA19

    //printf("Testing ALT1 pin on PORTA19\n");
    //printf("\tTWR-K70F120M: ALT1 is conected to pin 18 on J15\n");
  }
  else if(pin_select==LPTMR_ALT2)
  {
    SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK; //Turn on PORTC clock
    PORTC_PCR5=PORT_PCR_MUX(0x3); //Use ALT4 on PTC5
  }
  else
  {
    return;
  }

  LPTMR0_PSR=LPTMR_PSR_PCS(0x01)|LPTMR_PSR_PBYP_MASK; //Use LPO clock but bypass glitch filter  ox1
  LPTMR0_CMR=LPTMR_CMR_COMPARE(compare_value);  //Set compare value
  LPTMR0_CSR=LPTMR_CSR_TPS(pin_select)|LPTMR_CSR_TMS_MASK; //Set LPT to use the pin selected, and put in pulse count mode, on rising edge (default)

  

  LPTMR0_CSR|=LPTMR_CSR_TEN_MASK; //Turn on LPT
  LPTMR0_CSR|=LPTMR_CSR_TPP_MASK;  //低电平触发
 // LPTMR0_CSR|=LPTMR_CSR_TIE_MASK;  
  /*When the Timer Interrupt Enable is set, the LPTMR Interrupt is generated whenever the Timer Compare
Flag is also set.
0 Timer Interrupt Disabled.
1 Timer Interrupt Enabled.
  */
  //Wait for compare flag to be set
 //while((LPTMR0_CSR&LPTMR_CSR_TCF_MASK)==0)
  {
    //This may not get proper counter data if the CNR is read at the same time it is incremented
    //printf("Current value of pulse count register CNR is %d\n",get_counter_value());
  }

  
}


/*!
 *  @brief      LPTMR脉冲计数初始化
 *  @param      LPT0_ALTn   LPTMR脉冲计数管脚
 *  @param      count       LPTMR脉冲比较值
 *  @param      LPT_CFG     LPTMR脉冲计数方式：上升沿计数或下降沿计数
 *  @since      v5.0
 *  Sample usage:       lptmr_pulse_init(LPT0_ALT1,0xFFFF,LPT_Rising);     // LPTMR 脉冲捕捉，捕捉0xFFFF后触发中断请求（需要开中断才执行中断复位函数），上升沿捕捉
 */
void lptmr_pulse_init(LPT0_ALTn altn, uint16 count, LPT_CFG cfg)
{

#if  defined(MK60F15)
    OSC0_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
#endif

    // 开启模块时钟
    SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;                        //使能LPT模块时钟

    //设置输入管脚
    if(altn == LPTMR_ALT1)
    {
       // port_init(PTA19, 0x06 << PORT_PCR_MUX_SHIFT );            //在PTA19上使用 ALT6
        //GPIO_Init(PORT_B,9,GPO,LVL_H);    // 前   CLK
          SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK; //Turn on PORTA clock
          PORTA_PCR19=PORT_PCR_MUX(0x6); //Use ALT6 on PTA19
    }
    else if(altn == LPTMR_ALT2)
    {
          SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK; //Turn on PORTC clock
         PORTC_PCR5=PORT_PCR_MUX(0x4); //Use ALT4 on PTC5
       // port_init(PTC5, 0x04 << PORT_PCR_MUX_SHIFT );             //在PTC5上使用 ALT4
    }
    else                                    //不可能发生事件
    {
       // ASSERT((altn == LPTMR_ALT1 ) || (altn == LPTMR_ALT2 ));   //设置管脚有误？
    }

    // 清状态寄存器
    LPTMR0_CSR = 0x00;                                          //先关了LPT，这样才能设置时钟分频,清空计数值等

#if defined(MK60DZ10)
    //选择时钟源
    LPTMR0_PSR  =   ( 0
                      | LPTMR_PSR_PCS(1)                  //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
                      | LPTMR_PSR_PBYP_MASK               //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
                      //| LPTMR_PSR_PRESCALE(1)           //预分频值 = 2^(n+1) ,n = 0~ 0xF
                    );
#elif defined(MK60F15)
    //选择时钟源
    LPTMR0_PSR  =   ( 0
                      | LPTMR_PSR_PCS(3)          //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
                      //| LPTMR_PSR_PBYP_MASK     //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
                      | LPTMR_PSR_PRESCALE(4)     //预分频值 = 2^(n+1) ,n = 0~ 0xF
                    );
#endif

    // 设置累加计数值
    LPTMR0_CMR  =   LPTMR_CMR_COMPARE(count);                   //设置比较值

    // 管脚设置、使能中断
    LPTMR0_CSR  =  (0
                    | LPTMR_CSR_TPS(altn)       // 选择输入管脚 选择
                    | LPTMR_CSR_TMS_MASK        // 选择脉冲计数 (注释了表示时间计数模式)
                    | ( cfg == LPT_Falling ?  LPTMR_CSR_TPP_MASK :   0  )  //脉冲计数器触发方式选择：0为高电平有效，上升沿加1
                    | LPTMR_CSR_TEN_MASK        //使能LPT(注释了表示禁用)
                    | LPTMR_CSR_TIE_MASK        //中断使能
                    //| LPTMR_CSR_TFC_MASK      //0:计数值等于比较值就复位；1：溢出复位（注释表示0）
                   );
}


/*!
 *  @brief      获取LPTMR脉冲计数值
 *  @return     脉冲计数值
 *  @since      v5.0
 *  Sample usage:       uint16 data = lptmr_pulse_get();  //获取脉冲计数值
 */
uint16 lptmr_pulse_get(void)
{
    uint16 data;
    if(LPTMR0_CSR & LPTMR_CSR_TCF_MASK)     //已经溢出了
    {

        data = ~0;                          //返回 0xffffffff 表示错误
    }
    else
    {
#if defined(MK60F15)
        LPTMR0_CNR = 0;
#endif
        data = LPTMR0_CNR;
    }
    return data;
}
