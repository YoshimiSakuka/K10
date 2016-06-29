#include "FTM.h"





////////////////////////////////////////////////////////////////////////////////////////
volatile struct FTM_MemMap *FTMx[3] = {FTM0_BASE_PTR, FTM1_BASE_PTR, FTM2_BASE_PTR};




/***FUNC+*********************************************************************/
/* Name   : Ftm_init                                                         */
/* Descrp : ��ʼ��Ӧ��FTMͨ��                                                */
/* Input  : FTMChannel:FTMģ���.                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Ftm_init(U8 FTMChannel)
{
    switch(FTMChannel)
    {
    case 0:      
      SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK; //ʹ��FTMʱ��
      //FTM_MOD_REG(FTM0_BASE_PTR) = 0x7530; 
      FTM_MOD_REG(FTM0_BASE_PTR) = 0xEA60;  //60000  0.01s
      FTM_CNTIN_REG(FTM0_BASE_PTR) = 0x0000;    //��ʼֵ
      FTM_SC_REG(FTM0_BASE_PTR) = 0x4B;//f = 6Mhz 0b01001011   4-3CLKS 01 ѡ��ϵͳʱ�� 0-2 PS011 8��Ƶ
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
/* Descrp : �رն�Ӧ��FTMͨ��                                                */
/* Input  : FTMChannel:FTMģ���.                                            */   
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
/* Descrp : ��ftm�ж�                                                        */
/* Input  : FTMChannel:FTMģ���.                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Ftm_enable_int(U8 FTMChannel)
{
    enable_irq(FTM0_irq_no + FTMChannel);  //��FTM�ж�
}



/***FUNC+*********************************************************************/
/* Name   : Ftm_disable_int                                                  */
/* Descrp : ��ftm�ж�                                                        */
/* Input  : FTMChannel:FTMģ���.                                            */   
/* Output : None.                                                            */
/* Return : None.                                                            */   
/***FUNC-*********************************************************************/
void Ftm_disable_int(U8 FTMChannel)
{
    disable_irq(FTM0_irq_no + FTMChannel);  //��FTM�ж�
}




/*************************************************************************
*                             Ұ��Ƕ��ʽ����������
*
*  �������ƣ�FTM_Input_init
*  ����˵�������벶׽��ʼ������
*  ����˵����FTMn        ģ��ţ�0��  1��  2��
*            CHn         ͨ���ţ�0~7��
*            Input_cfg   ���벶׽���ã�Rising��Falling��Rising_or_Falling�������ز�׽���½��ز�׽�������ز�׽
*  �������أ���
*  �޸�ʱ�䣺2012-1-26
*  ��    ע��CH0~CH3����ʹ�ù�������δ����⹦��
*************************************************************************/
void FTM_Input_init(FTMn ftmn, CHn ch, Input_cfg cfg)
{
    
    /******************* ����ʱ�� �� ����IO��*******************/
    //ע�����������Ȼ����������ִ�еľͼ������
    switch(ftmn)
    {
    case FTM0:
        SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;                           //ʹ��FTM0ʱ��
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
        SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;                           //ʹ��FTM1ʱ��
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
        SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //ʹ��FTM2ʱ��
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


    /******************* ����Ϊ���벶׽���� *******************/
    switch(cfg)
    {
    case Rising:    //�����ش���
        FTM_CnSC_REG(FTMx[ftmn], ch) |=  ( FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK );                   //��1
        FTM_CnSC_REG(FTMx[ftmn], ch) &= ~( FTM_CnSC_ELSB_MASK  | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //��0
        break;

    case Falling:   //�½��ش���
        FTM_CnSC_REG(FTMx[ftmn], ch) |= (FTM_CnSC_ELSB_MASK  | FTM_CnSC_CHIE_MASK );                    //��1
        FTM_CnSC_REG(FTMx[ftmn], ch) &= ~( FTM_CnSC_ELSA_MASK | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //��0
        break;

    case Rising_or_Falling: //�����ء��½��ض�����
        FTM_CnSC_REG(FTMx[ftmn], ch) |=  ( FTM_CnSC_ELSB_MASK | FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK ); //��1
        FTM_CnSC_REG(FTMx[ftmn], ch) &= ~( FTM_CnSC_MSB_MASK  | FTM_CnSC_MSA_MASK); //��0
        break;
    }

    FTM_SC_REG(FTMx[ftmn]) = FTM_SC_CLKS(0x1);       //System clock

    FTM_MODE_REG(FTMx[ftmn]) |= FTM_MODE_WPDIS_MASK;
    FTM_COMBINE_REG(FTMx[ftmn]) = 0;
    FTM_MODE_REG(FTMx[ftmn]) &= ~FTM_MODE_FTMEN_MASK;
    FTM_CNTIN_REG(FTMx[ftmn]) = 0;

    FTM_STATUS_REG(FTMx[ftmn]) = 0x00;               //���жϱ�־λ

    //�������벶׽�ж�
    enable_irq(78 - 16 + ftmn);
}


/********************************************************************************************************************/
/*    PWM                                                                                                           */
/*                                                                                                                  */
/********************************************************************************************************************/
void PWM_Init(void)
{
  
    /* config port for FTM:  */
    //PORTA_PCR8 = PORT_PCR_MUX(0x3) | PORT_PCR_DSE_MASK; //������ǿ��
    PORTD_PCR6 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH6    PTD6   ����
    PORTD_PCR7 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH7    PTD7   ����
    PORTD_PCR4 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH4    PTD4   ����
    PORTD_PCR5 = PORT_PCR_MUX(0x4)| PORT_PCR_DSE_MASK;  //FTM0_CH5    PTD5   ����  
  
  
  
    /* FTM1 clock enable:*/
    //SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
    SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;
    
    //FTM1_SC |= (FTM_SC_CLKS(1)           // CLKS=1:System clock
    //           |FTM_SC_PS(7));           // 48MHz/128=375KHz
    FTM0_SC = 0x08; //�������жϡ����¼�������Ƶ����Ϊ1��
                      //���ش���ģʽ
                      //PMWƵ��=XϵͳƵ��/(2^FTM0_SC_PS)/FTM0_MOD
    
    
    //FTM1_C0SC |= (FTM_CnSC_MSB_MASK      // MSB=1:Edge-aligned PWM
    //             |FTM_CnSC_ELSA_MASK);   // ELSA=1:Low first    ռ�ձ�Ϊ�͵�ƽ
    
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
//                 |FTM_CnSC_ELSB_MASK);    //ռ�ձ�Ϊ�ߵ�ƽ
//    FTM1_C0SC &= ~FTM_CnSC_ELSA_MASK;
    
    //FTM1_OUTMASK = 0XFE;                 // Ch1-7 output is masked except ch0 ��������
    
    /* set PWM frequence: */
    FTM0_COMBINE=0;      //  ˫���ز�׽��ֹ��COMBINE=0��������
    FTM0_OUTINIT=0;
    FTM0_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
    FTM0_POL=0;          //Channels Polarity (FTMx_POL)
                           //0 The channel polarity is active high.
                           //1 The channel polarity is active low.     
      //Set Edge Aligned PWM
    FTM0_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;     //��ʹ���������빦��
    FTM0_INVCTRL=0;      //��ת����
    FTM0_SWOCTRL=0;      //����������F TM Software Output Control (FTMx_SWOCTRL)
    FTM0_PWMLOAD=0;      //FTM PWM Load
                           //BIT9: 0 Loading updated values is disabled.
                           //1 Loading updated values is enabled.
    FTM0_CNTIN=0;        //Counter Initial Value      FTM0��������ʼֵΪ0 
    FTM0_MOD=15000;       //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001)  ����ֵ������Ϊ��MOD-CNTIN+1��*ʱ������=10ms
    
    FTM0_C6V=0;                   //���ַ�ת
    FTM0_C7V=0;                   //������ת    
    FTM0_C4V=0;                   //������ת                 ������ת����300����
    FTM0_C5V=0;                   //���ַ�ת               
    
    
    //FTM1_CNTIN = 0;
    //FTM1_MOD   = 374;                    // f=375KHz/(MOD - CNTIN + 1)=1KHz
    
    //FTM1_C0V   = 0;                      // 0% for initiation

}



/********************************************************************************************************************/
/*    PWM    ���Ķ���                                                                                               */
/*                                                                                                                  */
/********************************************************************************************************************/
void CPWM_INIT(void)
{
    PORTA_PCR8 = PORT_PCR_MUX(0x3) | PORT_PCR_DSE_MASK;
    SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
    FTM1_SC |= FTM_SC_CPWMS_MASK;          //CPWM
    FTM1_SC |= (FTM_SC_CLKS(1)           // CLKS=1:System clock
               |FTM_SC_PS(7)); 
    FTM1_C0SC |= FTM_CnSC_ELSA_MASK;    //�͸ߵ�
    FTM1_OUTMASK = 0XFE;
    FTM1_CNTIN = 0;
    FTM1_MOD   = 374; 
    FTM1_C0V   = 0;
    
    
}


/********************************************************************************************************************/
/*    PWM    �������������                                                                                         */
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
    FTM1_MODE |= FTM_MODE_WPDIS_MASK;//д������ֹ
    FTM1_MODE |=FTM_MODE_FTMEN_MASK;//FTMEN=1
    FTM1_QDCTRL &= ~FTM_QDCTRL_QUADEN_MASK;//��ֹ��������ģʽ
    FTM1_COMBINE |= FTM_COMBINE_COMBINE0_MASK;//FTM1ͨ��0,1����ʹ��
    FTM1_COMBINE |= FTM_COMBINE_COMP0_MASK;//FTM1ͨ��0,1�������
    FTM1_COMBINE |= FTM_COMBINE_SYNCEN0_MASK;//ʹ��FTM1ͨ��0,1 PWMͬ��
    FTM1_COMBINE |= FTM_COMBINE_DTEN0_MASK;//��������
    FTM1_DEADTIME = FTM_DEADTIME_DTPS(3)|FTM_DEADTIME_DTVAL(6);     //16��Ƶ ��0x 1��10 4��11 16��   6������  =2us  48M/16
    FTM1_SYNCONF|=FTM_SYNCONF_SWWRBUF_MASK;//ʹ��MOD,CNTIN,CV�Ĵ������������ͬ��
    FTM1_SYNC=FTM_SYNC_CNTMIN_MASK|FTM_SYNC_CNTMAX_MASK;//����load point
    FTM1_C0SC |= FTM_CnSC_ELSA_MASK;    //�͸ߵ�
    FTM1_C1SC |= FTM_CnSC_ELSA_MASK;    //�͸ߵ�
    FTM1_OUTMASK=0XFC;//ͨ��0��1�������������ͨ��
    FTM1_CNTIN = 0;
    FTM1_MOD = 374; 
    FTM1_C0V = 0;
    FTM1_C1V = 50 * 374 / 100;
    FTM1_CNT = 0;
    FTM1_SYNC|=FTM_SYNC_SWSYNC_MASK;//ʹ���������
    
    
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
        FTM1_SYNC |= FTM_SYNC_SWSYNC_MASK;//ʹ���������
    }
    
    else
    {    
        FTM1_C0V = (U16)ucDuty * 374 / 100;
        FTM1_SYNC |= FTM_SYNC_SWSYNC_MASK;//ʹ���������
    }
    
}




/************************************************************************/
/*��������*/
//�鿴FTM1_CNT��FTM2_CNT�Ϳ�֪����ǰ����ֵ���鿴TOFDIR��QUADIR����֪��ת��
/************************************************************************/
void FTM_QUAD_init()
{
    /*�����˿�ʱ��*/
    SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;

    /*ѡ��ܽŸ��ù���*/
    //PORTA_PCR12 = PORT_PCR_MUX(7);
    //PORTA_PCR13 = PORT_PCR_MUX(7);
    //PORTA_PCR10 = PORT_PCR_MUX(6);
    //PORTA_PCR11 = PORT_PCR_MUX(6);
    
    
    PORTB_PCR0 = PORT_PCR_MUX(6);
    PORTB_PCR1 = PORT_PCR_MUX(6); 
    PORTB_PCR18 = PORT_PCR_MUX(6);
    PORTB_PCR19 = PORT_PCR_MUX(6); 
    
    
    

    /*ʹ��FTM1��FTM2ʱ��*/
    SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;
    SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;

    FTM1_MOD = 14000; //�ɸ�����Ҫ����
    FTM2_MOD = 14000;

    FTM1_CNTIN = 0;
    FTM2_CNTIN = 0;

    FTM1_MODE |= FTM_MODE_WPDIS_MASK; //��ֹд����
    FTM2_MODE |= FTM_MODE_WPDIS_MASK; //��ֹд����
    FTM1_MODE |= FTM_MODE_FTMEN_MASK; //FTMEN=1,�ر�TPM����ģʽ������FTM���й���
    FTM2_MODE |= FTM_MODE_FTMEN_MASK; //FTMEN=1,�ر�TPM����ģʽ������FTM���й���

    //FTM1_QDCTRL &= ~FTM_QDCTRL_QUADMODE_MASK; //ѡ������ģʽΪA����B�����ģʽ
    FTM1_QDCTRL |= FTM_QDCTRL_QUADMODE_MASK;//AB��ͬʱ�жϼ���
    
    FTM1_QDCTRL |= FTM_QDCTRL_QUADEN_MASK; //ʹ����������ģʽ
    //FTM2_QDCTRL &= ~FTM_QDCTRL_QUADMODE_MASK; //ѡ������ģʽΪA����B�����ģʽ
    FTM2_QDCTRL |= FTM_QDCTRL_QUADMODE_MASK;
    
    FTM2_QDCTRL |= FTM_QDCTRL_QUADEN_MASK; //ʹ����������ģʽ

    FTM1_SC |= FTM_SC_CLKS(3);  //ѡ���ⲿʱ��
//   FTM1_CONF |=FTM_CONF_BDMMODE(3); //�ɸ�����Ҫѡ��
    FTM2_SC |= FTM_SC_CLKS(3);
//   FTM2_CONF |=FTM_CONF_BDMMODE(3);

}
int speed_L;
int direction;
void lptmr_pulse_clean(void)
{
    LPTMR0_CSR  &= ~LPTMR_CSR_TEN_MASK;     //����LPT��ʱ��ͻ��Զ����������ֵ
    LPTMR0_CSR  |= LPTMR_CSR_TEN_MASK;
}
int QUADRead_L(void)   
{                     
      direction =GPIO_GetBit(PORT_A,13); //1��ת
      
      if(direction)
      {     
      speed_L = LPTMR0_CNR;     //�����������������ֵ
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
  LPTMR0_CSR|=LPTMR_CSR_TPP_MASK;  //�͵�ƽ����
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
 *  @brief      LPTMR���������ʼ��
 *  @param      LPT0_ALTn   LPTMR��������ܽ�
 *  @param      count       LPTMR����Ƚ�ֵ
 *  @param      LPT_CFG     LPTMR���������ʽ�������ؼ������½��ؼ���
 *  @since      v5.0
 *  Sample usage:       lptmr_pulse_init(LPT0_ALT1,0xFFFF,LPT_Rising);     // LPTMR ���岶׽����׽0xFFFF�󴥷��ж�������Ҫ���жϲ�ִ���жϸ�λ�������������ز�׽
 */
void lptmr_pulse_init(LPT0_ALTn altn, uint16 count, LPT_CFG cfg)
{

#if  defined(MK60F15)
    OSC0_CR |= OSC_CR_ERCLKEN_MASK;                              //ʹ�� OSCERCLK
#endif

    // ����ģ��ʱ��
    SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;                        //ʹ��LPTģ��ʱ��

    //��������ܽ�
    if(altn == LPTMR_ALT1)
    {
       // port_init(PTA19, 0x06 << PORT_PCR_MUX_SHIFT );            //��PTA19��ʹ�� ALT6
        //GPIO_Init(PORT_B,9,GPO,LVL_H);    // ǰ   CLK
          SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK; //Turn on PORTA clock
          PORTA_PCR19=PORT_PCR_MUX(0x6); //Use ALT6 on PTA19
    }
    else if(altn == LPTMR_ALT2)
    {
          SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK; //Turn on PORTC clock
         PORTC_PCR5=PORT_PCR_MUX(0x4); //Use ALT4 on PTC5
       // port_init(PTC5, 0x04 << PORT_PCR_MUX_SHIFT );             //��PTC5��ʹ�� ALT4
    }
    else                                    //�����ܷ����¼�
    {
       // ASSERT((altn == LPTMR_ALT1 ) || (altn == LPTMR_ALT2 ));   //���ùܽ�����
    }

    // ��״̬�Ĵ���
    LPTMR0_CSR = 0x00;                                          //�ȹ���LPT��������������ʱ�ӷ�Ƶ,��ռ���ֵ��

#if defined(MK60DZ10)
    //ѡ��ʱ��Դ
    LPTMR0_PSR  =   ( 0
                      | LPTMR_PSR_PCS(1)                  //ѡ��ʱ��Դ�� 0 Ϊ MCGIRCLK ��1Ϊ LPO��1KHz�� ��2Ϊ ERCLK32K ��3Ϊ OSCERCLK
                      | LPTMR_PSR_PBYP_MASK               //��· Ԥ��Ƶ/�����˲��� ,������ Ԥ��Ƶ/�����˲���(ע���˱�ʾʹ��Ԥ��Ƶ/�����˲���)
                      //| LPTMR_PSR_PRESCALE(1)           //Ԥ��Ƶֵ = 2^(n+1) ,n = 0~ 0xF
                    );
#elif defined(MK60F15)
    //ѡ��ʱ��Դ
    LPTMR0_PSR  =   ( 0
                      | LPTMR_PSR_PCS(3)          //ѡ��ʱ��Դ�� 0 Ϊ MCGIRCLK ��1Ϊ LPO��1KHz�� ��2Ϊ ERCLK32K ��3Ϊ OSCERCLK
                      //| LPTMR_PSR_PBYP_MASK     //��· Ԥ��Ƶ/�����˲��� ,������ Ԥ��Ƶ/�����˲���(ע���˱�ʾʹ��Ԥ��Ƶ/�����˲���)
                      | LPTMR_PSR_PRESCALE(4)     //Ԥ��Ƶֵ = 2^(n+1) ,n = 0~ 0xF
                    );
#endif

    // �����ۼӼ���ֵ
    LPTMR0_CMR  =   LPTMR_CMR_COMPARE(count);                   //���ñȽ�ֵ

    // �ܽ����á�ʹ���ж�
    LPTMR0_CSR  =  (0
                    | LPTMR_CSR_TPS(altn)       // ѡ������ܽ� ѡ��
                    | LPTMR_CSR_TMS_MASK        // ѡ��������� (ע���˱�ʾʱ�����ģʽ)
                    | ( cfg == LPT_Falling ?  LPTMR_CSR_TPP_MASK :   0  )  //���������������ʽѡ��0Ϊ�ߵ�ƽ��Ч�������ؼ�1
                    | LPTMR_CSR_TEN_MASK        //ʹ��LPT(ע���˱�ʾ����)
                    | LPTMR_CSR_TIE_MASK        //�ж�ʹ��
                    //| LPTMR_CSR_TFC_MASK      //0:����ֵ���ڱȽ�ֵ�͸�λ��1�������λ��ע�ͱ�ʾ0��
                   );
}


/*!
 *  @brief      ��ȡLPTMR�������ֵ
 *  @return     �������ֵ
 *  @since      v5.0
 *  Sample usage:       uint16 data = lptmr_pulse_get();  //��ȡ�������ֵ
 */
uint16 lptmr_pulse_get(void)
{
    uint16 data;
    if(LPTMR0_CSR & LPTMR_CSR_TCF_MASK)     //�Ѿ������
    {

        data = ~0;                          //���� 0xffffffff ��ʾ����
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
