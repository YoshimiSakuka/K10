#include "assert.h"


const char ASSERT_FAILED_STR1[] = "Assertion failed in %s at line %d\n";

void assert_failed1(char *file, int line)
{
    //int i;
    //LED_init();
    while (1)
    {
        #ifdef DEBUG_PRINT
        printf(ASSERT_FAILED_STR1, file, line);  //��ӡ������Ϣ
        #endif
        //for (i = 0xffffff; i; i--) ;
        //water_lights();                         //����ˮ����ָʾ�������״̬
        //for (i = 0xffffff; i; i--) ;
    }
}