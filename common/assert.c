#include "assert.h"


const char ASSERT_FAILED_STR1[] = "Assertion failed in %s at line %d\n";

void assert_failed1(char *file, int line)
{
    //int i;
    //LED_init();
    while (1)
    {
        #ifdef DEBUG_PRINT
        printf(ASSERT_FAILED_STR1, file, line);  //打印错误信息
        #endif
        //for (i = 0xffffff; i; i--) ;
        //water_lights();                         //用流水灯来指示进入错误状态
        //for (i = 0xffffff; i; i--) ;
    }
}