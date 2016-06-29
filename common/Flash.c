#include "Flash.h"

u32 LCD_KP = 0;
u32 LCD_KD = 0;
u32 LCD_KI = 0;

u32 FlashWrite_flag = 0;

//==========================================================================
//�������ƣ�flash_cmd_launch
//�������أ�0-�ɹ� 1-ʧ��
//����˵������
//���ܸ�Ҫ������Flash����
//==========================================================================
static u32 flash_cmd_launch(void)
{
    
    FTFL_FSTAT = (0
              |	FTFL_FSTAT_CCIF_MASK 		// ��������
              |	FTFL_FSTAT_ACCERR_MASK 		// ������ʴ����־λ
              | FTFL_FSTAT_FPVIOL_MASK		// �Ƿ����ʱ�־λ
              );	
    									
    while(!(FTFL_FSTAT & FTFL_FSTAT_CCIF_MASK));	// �ȴ��������

    // �������־
    if( FTFL_FSTAT & (FTFL_FSTAT_ACCERR_MASK | FTFL_FSTAT_FPVIOL_MASK | FTFL_FSTAT_MGSTAT0_MASK))
        return 1 ; 	//ִ���������
  
    return 0; 	//ִ������ɹ�
}
//===========================================================================

//=================�ⲿ�ӿں���==============================================
//==========================================================================
//�������ƣ�flash_init
//�������أ���
//����˵������
//���ܸ�Ҫ����ʼ��flashģ��
//==========================================================================
void flash_init(void)
{
// ���FlashԤ��ȡ������
    FMC_PFB0CR |= FMC_PFB0CR_S_B_INV_MASK;
    FMC_PFB1CR |= FMC_PFB0CR_S_B_INV_MASK;
    
    while(!(FTFL_FSTAT & FTFL_FSTAT_CCIF_MASK));// �ȴ��������
    
    FTFL_FSTAT = (0
                  |FTFL_FSTAT_ACCERR_MASK 	// ������ʴ����־λ
                  |FTFL_FSTAT_FPVIOL_MASK	// �Ƿ����ʱ�־λ
                  );	
}

//==========================================================================
//�������ƣ�flash_erase_sector
//�������أ�����ִ��ִ��״̬��0=��������0=�쳣��
//����˵����sectorNo�������ţ�K60N512ʵ��ʹ��0~255��
//���ܸ�Ҫ������ָ��flash����
//==========================================================================
uint8 flash_erase_sector(uint16 sectorNo)
{
    Dtype	addr;	
    addr.DW = (u32)(sectorNo<<11);	
    //ÿ������2KB������������ַ=������*2K �������� <<11 ��ʾ *2*1024 
    
    // ���ò�������
    FTFL_FCCOB0 = ERSSCR; // ������������
    
    // ����Ŀ���ַ
    FTFL_FCCOB1 = addr.BB[2];
    FTFL_FCCOB2 = addr.BB[1];
    FTFL_FCCOB3 = addr.BB[0];
    
    // ִ����������
    if(1 == flash_cmd_launch())    //��ִ��������ִ���
        return 1;     //�����������
   
    // ������sector0ʱ��������豸
    if(sectorNo ==0)
    {
        // д��4�ֽ�
        FTFL_FCCOB0 = PGM4; 
        // ����Ŀ���ַ
        FTFL_FCCOB1 = 0x00;
        FTFL_FCCOB2 = 0x04;
        FTFL_FCCOB3 = 0x0C;
        // ����
        FTFL_FCCOB4 = 0xFF;
        FTFL_FCCOB5 = 0xFF;
        FTFL_FCCOB6 = 0xFF;
        FTFL_FCCOB7 = 0xFE;
        // ִ����������
        if(1 == flash_cmd_launch())  //��ִ��������ִ���
            return 2;   //�����������
    }  
    
    return 0;  //�ɹ�����
}

//==========================================================================
//�������ƣ�flash_write
//�������أ�����ִ��״̬��0=��������0=�쳣��
//����˵����sectorNo��Ŀ�������� ��K60N512ʵ��ʹ��0~255��
//         offset:д�������ڲ�ƫ�Ƶ�ַ��0~2043��
//         data����Ҫд��ı�����uint32�ͣ�
//���ܸ�Ҫ��flashд�����
//==========================================================================
uint8 flash_write(uint16 sectorNo,uint16 offset,u32 data)
{
    Dtype	addr;	
    Dtype	Data;
		
    addr.DW = (u32)((sectorNo<<11) + offset);//�����ַ
	Data.DW	= data;	
	    
    FTFL_FCCOB0 = PGM4;	// ����д������

    FTFL_FCCOB1 = addr.BB[2];// ����Ŀ���ַ
    FTFL_FCCOB2 = addr.BB[1];
    FTFL_FCCOB3 = addr.BB[0];


    FTFL_FCCOB4 = Data.BB[3];// ����д������
    FTFL_FCCOB5 = Data.BB[2];
    FTFL_FCCOB6 = Data.BB[1];
    FTFL_FCCOB7 = Data.BB[0];
    
    if(1 == flash_cmd_launch()) 	
      return 2;  //д���������

    return 0;  //�ɹ�ִ��
}


void InitFlashLcd(void) 
{
  flash_init();
  FlashWrite_flag = flash_read(SecNum1,0,u32);
  if(FlashWrite_flag!=0xffffffff)//flash��ȫ��������򲻶�ȡflash������ʹ�ó�����ı���ֵ
  {
    SpeedWant = flash_read(SecNum1,0,u32);
    Speed_Kp = flash_read(SecNum1,32,u32);
    Speed_Ki = flash_read(SecNum1,64,u32);
    angleoffset = flash_read(SecNum1,96,u32);
    D_P = flash_read(SecNum1,128,u32);
    D_D = flash_read(SecNum1,160,u32);
    SpecialPWM= flash_read(SecNum1,192,u32);
    weight_Max = flash_read(SecNum1,224,u32);
    weight_Min = flash_read(SecNum1,256,u32);
    Ka = flash_read(SecNum1,288,u32);
    Midline = flash_read(SecNum1,320,u32);
    Stoptime = flash_read(SecNum1,352,u32);
    Angle_Kp = flash_read(SecNum1,384,u32);
    Angle_Kd = flash_read(SecNum1,416,u32);
    D_I = flash_read(SecNum1,448,u32);
    Speed_Kd = flash_read(SecNum1,480,u32);
    
  }
   

}


void FlashSetPara(void)
{
  
  
//  Speed_Kp=0;
//  Speed_Kp=0;
//  Speed_Ki=0;
//  Speed_Kd=0;
//  Turn_Kp=0;
//  Turn_Kd=0;
//  weight_Max=0;
//  weight_Min=0;
//  SpeedWant=0;
//  Angle_Kp=0;
//  Angle_Kd=0;
//  Turn_Kp_cir=0;
//  SpecialPWML=0;
//  Stoptime=0;
//  specialfield=0;
// SpecialPWMR=0;
// Turn_Max=0;
  //angleoffset=0; 

  
  flash_erase_sector(SecNum1);//�������
  flash_write(SecNum1,0,SpeedWant);      
  flash_write(SecNum1,32,Speed_Kp);
  flash_write(SecNum1,64,Speed_Ki);
  flash_write(SecNum1,480,Speed_Kd);
  flash_write(SecNum1,128,D_P);
  flash_write(SecNum1,448,D_I); 
  flash_write(SecNum1,160,D_D);
  flash_write(SecNum1,320,Midline);
  flash_write(SecNum1,96,angleoffset);
  flash_write(SecNum1,384,Angle_Kp);
  flash_write(SecNum1,416,Angle_Kd);
  flash_write(SecNum1,224,weight_Max);
  flash_write(SecNum1,256,weight_Min);
  flash_write(SecNum1,192,SpecialPWM);
  flash_write(SecNum1,352,Stoptime);
  flash_write(SecNum1,288,Ka);
  
  
} 