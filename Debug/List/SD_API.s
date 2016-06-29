///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    13/Mar/2015  12:44:25 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Administrator\Desktop\3.11换结构BLOCK nd       /
//                    black\common\SD_API.c                                   /
//    Command line =  "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\common\SD_API.c" -D DEBUG -lCN                    /
//                    "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\Debug\List\" -lB "C:\Users\Administrator\Desktop\ /
//                    3.11换结构BLOCK nd  black\Debug\List\" -o               /
//                    "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\Debug\Obj\" --no_cse --no_unroll --no_inline      /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.0\arm\INC\c\DLib_Config_Normal.h" -Ol                 /
//                    --use_c++_inline                                        /
//    List file    =  C:\Users\Administrator\Desktop\3.11换结构BLOCK nd       /
//                    black\Debug\List\SD_API.s                               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME SD_API

        #define SHT_PROGBITS 0x1

        EXTERN Delay
        EXTERN GetCardStat
        EXTERN GetFatTimer
        EXTERN OSUpDate
        EXTERN OSUptime
        EXTERN SDHC_Info
        EXTERN Serial_Envia_Frase
        EXTERN SetCardStat
        EXTERN SetFatTimer
        EXTERN Uart_Printf
        EXTERN UserEnterCritical
        EXTERN UserExitCritical
        EXTERN disk_initialize
        EXTERN f_chdir
        EXTERN f_close
        EXTERN f_getfree
        EXTERN f_lseek
        EXTERN f_mkdir
        EXTERN f_mount
        EXTERN f_open
        EXTERN f_opendir
        EXTERN f_printf
        EXTERN f_read
        EXTERN f_readdir
        EXTERN f_rename
        EXTERN f_unlink
        EXTERN f_write
        EXTERN putcharSer

        PUBLIC BmpFile
        PUBLIC Buff
        PUBLIC ChangeDir
        PUBLIC CopyFile
        PUBLIC CreateDir
        PUBLIC CreateFile
        PUBLIC DeleteFile
        PUBLIC Dir
        PUBLIC Finfo
        PUBLIC InitSD
        PUBLIC Lfname
        PUBLIC ListFiles
        PUBLIC ReadFile
        PUBLIC RenameFile
        PUBLIC SD_API_CARD_BUSY
        PUBLIC SD_API_CARD_NOT_PRESENT
        PUBLIC SD_API_FILE_INVALID
        PUBLIC SD_API_FILE_NOT_FOUND
        PUBLIC SafeRemoveSD
        PUBLIC WriteUptimeLog
        PUBLIC file_name_verify
        PUBLIC file_obj
        PUBLIC file_obj2
        PUBLIC sd_command

// C:\Users\Administrator\Desktop\3.11换结构BLOCK nd  black\common\SD_API.c
//    1 
//    2 #include "..\K60_datatype.h"
//    3 
//    4 
//    5 
//    6 #if (SD_FAT_MUTEX_EN == 1)
//    7   BRTOS_Mutex *SDCardResource;
//    8 #endif
//    9 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   10 U8  sd_command = SD_INACTIVE;    // Variable to indicate commands for SD
sd_command:
        DATA
        DC8 10

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 static FATFS FATFS_Obj;
FATFS_Obj:
        DS8 564
//   12 
//   13 // File object

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 FIL     file_obj;
file_obj:
        DS8 552
//   15 // File object 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 FIL     file_obj2;
file_obj2:
        DS8 552
//   17 
//   18 // Bitmap Object

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 BMP_FILE BmpFile;
BmpFile:
        DS8 60
//   20 
//   21 // File Info object

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 FILINFO Finfo;
Finfo:
        DS8 32
//   23 // Directory object

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 DIR     Dir;
Dir:
        DS8 36
//   25 // Read/Write Buffer

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 U8   Buff[512];
Buff:
        DS8 512
//   27 
//   28 #if _USE_LFN
//   29 //char Lfname[512];

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30 U8 Lfname[256];
Lfname:
        DS8 256
//   31 #endif
//   32   
//   33 
//   34 //Mensagens padr鉶 da API do SD

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   35 const S8 *SD_API_FILE_NOT_FOUND={"\n\rFile or directory not found.\n\r"};
SD_API_FILE_NOT_FOUND:
        DATA
        DC32 `?<Constant "\\n\\rFile or directory n...">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   36 const S8 *SD_API_FILE_INVALID={"\n\rInvalid file or directory name.\n\r"};
SD_API_FILE_INVALID:
        DATA
        DC32 `?<Constant "\\n\\rInvalid file or dir...">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   37 const S8 *SD_API_CARD_BUSY={"\n\rSD card busy !!!\n\r"};
SD_API_CARD_BUSY:
        DATA
        DC32 `?<Constant "\\n\\rSD card busy !!!\\n\\r">`

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   38 const S8 *SD_API_CARD_NOT_PRESENT={"\n\rSD card is not present or not initialized !\n\r"};
SD_API_CARD_NOT_PRESENT:
        DATA
        DC32 `?<Constant "\\n\\rSD card is not pres...">`
//   39 
//   40 
//   41 #if (SD_FAT_MUTEX_EN == 1)
//   42 void InitSDCardResource(INT8U priority)
//   43 {
//   44   // Cria um mutex informando que o recurso est?dispon韛el
//   45   // Prioridade m醲ima a acessar o recurso = priority
//   46   if (OSMutexCreate(&SDCardResource,priority) != ALLOC_EVENT_OK)
//   47   {
//   48     // Oh Oh
//   49     // N鉶 deveria entrar aqui !!!
//   50     while(1){};
//   51   };   
//   52 }
//   53 #endif
//   54 
//   55 
//   56 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   57 U8 InitSD(U8 verbose)
//   58 { 
InitSD:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   59   FRESULT f_res;
//   60   U8   status;
//   61   
//   62   //Set PTE27, and PTE28 to GPIO, input with pull-up resistor enabled
//   63   //SDCARD_GPIO_DETECT                  GPIOE_PIN28
//   64   //SDCARD_GPIO_PROTECT                 GPIOE_PIN27     
//   65   PORTE_PCR28=(0 | PORT_PCR_MUX(1) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK);
        LDR.W    R0,??DataTable10  ;; 0x4004d070
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//   66   PORTE_PCR29=(0 | PORT_PCR_MUX(1) | PORT_PCR_PS_MASK | PORT_PCR_PE_MASK);
        LDR.W    R0,??DataTable10_1  ;; 0x4004d074
        MOVW     R1,#+259
        STR      R1,[R0, #+0]
//   67  
//   68   //Set PTE27 and PTE28 as an input
//   69   GPIOE_PDDR &= ~GPIO_PDDR_PDD(GPIO_PIN(27) | GPIO_PIN(28));
        LDR.W    R0,??DataTable10_2  ;; 0x400ff114
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x18000000
        LDR.W    R1,??DataTable10_2  ;; 0x400ff114
        STR      R0,[R1, #+0]
//   70   
//   71   // Wait signals stabilization
//   72   Delay(5);
        MOVS     R0,#+5
        BL       Delay
//   73    
//   74   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.N    ??InitSD_0
//   75   {
//   76     if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??InitSD_1
//   77     {
//   78       Uart_Printf("\n\rSD card is already mounted!\n\r");
        LDR.W    R0,??DataTable10_3
        BL       Uart_Printf
//   79     }
//   80     return SD_OK;
??InitSD_1:
        MOVS     R0,#+0
        B.N      ??InitSD_2
//   81   }
//   82   
//   83   if (SDCARD_GPIO_DETECT == 0)
//   84   {
//   85 		// Card detected
//   86 		// Wait power up stabilization
//   87 		Delay(300);
??InitSD_0:
        MOV      R0,#+300
        BL       Delay
//   88 		status = disk_initialize(0);
        MOVS     R0,#+0
        BL       disk_initialize
//   89 		if (status == OK)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??InitSD_3
//   90 		{
//   91 			if (SDHC_Info.CARD == ESDHC_CARD_SD)
        LDR.W    R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??InitSD_4
//   92 			{
//   93 				if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??InitSD_4
//   94 				    Uart_Printf("\n\rSD card has been successfully initialized !!!\n\r");
        LDR.W    R0,??DataTable10_5
        BL       Uart_Printf
//   95 			}
//   96 			if (SDHC_Info.CARD == ESDHC_CARD_SDHC)
??InitSD_4:
        LDR.W    R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??InitSD_5
//   97 			{
//   98 				if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??InitSD_5
//   99 				    Uart_Printf("\n\rSDHC card has been successfully initialized !!!\n\r");
        LDR.W    R0,??DataTable10_6
        BL       Uart_Printf
//  100 			}
//  101 			
//  102 			// Mount FAT File System
//  103 			f_res = f_mount((U8)0, &FATFS_Obj);
??InitSD_5:
        LDR.W    R1,??DataTable10_7
        MOVS     R0,#+0
        BL       f_mount
//  104 			if (f_res == FR_OK)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??InitSD_6
//  105 			{
//  106 				if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??InitSD_7
//  107 				    Uart_Printf("\n\rFAT filesystem mounted !!!\n\r");   
        LDR.W    R0,??DataTable10_8
        BL       Uart_Printf
//  108 				return SD_OK;
??InitSD_7:
        MOVS     R0,#+0
        B.N      ??InitSD_2
//  109 			}else
//  110 			{
//  111 				if (verbose == VERBOSE_ON)
??InitSD_6:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??InitSD_8
//  112 				    Uart_Printf("\n\rFailed to mount SD card !\n\r");
        LDR.W    R0,??DataTable10_9
        BL       Uart_Printf
//  113 				return MOUNT_SD_FAILS;
??InitSD_8:
        MOVS     R0,#+9
        B.N      ??InitSD_2
//  114 			}
//  115 			
//  116 		}else
//  117 		{
//  118 			if (verbose == VERBOSE_ON)
??InitSD_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??InitSD_9
//  119 				Uart_Printf("\n\rSD card failure !!!\n\r");
        LDR.W    R0,??DataTable10_10
        BL       Uart_Printf
//  120 			return INIT_SD_FAILS;
??InitSD_9:
        MOVS     R0,#+8
??InitSD_2:
        POP      {R4,PC}          ;; return
//  121 		}
//  122 	}else
//  123 	{
//  124 		if (verbose == VERBOSE_ON)
//  125 		    Uart_Printf("\n\rNo SD card detected !!!\n\r");  
//  126 		return NO_SD_CARD;
//  127 	}
//  128 }
//  129 
//  130 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  131 U8 SafeRemoveSD(U8 verbose)
//  132 {        
SafeRemoveSD:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  133   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.N    ??SafeRemoveSD_0
//  134   {    
//  135     #if (SD_FAT_MUTEX_EN == 1)
//  136       OSMutexAcquire(SDCardResource);
//  137     #endif    
//  138     
//  139     if (sd_command == SD_INACTIVE)
        LDR.W    R0,??DataTable10_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.N    ??SafeRemoveSD_1
//  140     {
//  141       // Umount File System
//  142       f_mount(0,NULL);
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       f_mount
//  143       SetCardStat(STA_NOINIT | GetCardStat());
        BL       GetCardStat
        ORRS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SetCardStat
//  144       
//  145       #if (SD_FAT_MUTEX_EN == 1)
//  146         OSMutexRelease(SDCardResource);
//  147       #endif      
//  148       
//  149       if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??SafeRemoveSD_2
//  150       {
//  151         Uart_Printf("\n\rIt is safe to remove the SD card!\n\r");
        LDR.W    R0,??DataTable10_12
        BL       Uart_Printf
//  152       }
//  153       return SD_OK;
??SafeRemoveSD_2:
        MOVS     R0,#+0
        B.N      ??SafeRemoveSD_3
//  154     }
//  155     else
//  156     {
//  157       #if (SD_FAT_MUTEX_EN == 1)
//  158         OSMutexRelease(SDCardResource);
//  159       #endif
//  160       
//  161       if (verbose == VERBOSE_ON)
??SafeRemoveSD_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??SafeRemoveSD_4
//  162       {
//  163         Uart_Printf(SD_API_CARD_BUSY);
        LDR.W    R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  164       }    
//  165       
//  166       return SD_BUSY;
??SafeRemoveSD_4:
        MOVS     R0,#+9
        B.N      ??SafeRemoveSD_3
//  167     }
//  168   }
//  169   else
//  170   {
//  171       if (verbose == VERBOSE_ON)
??SafeRemoveSD_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??SafeRemoveSD_5
//  172       {
//  173         Uart_Printf(SD_API_CARD_NOT_PRESENT);
        LDR.W    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  174       }
//  175       return SD_FAT_ERROR;
??SafeRemoveSD_5:
        MOVS     R0,#+8
??SafeRemoveSD_3:
        POP      {R4,PC}          ;; return
//  176   }    
//  177 }
//  178 
//  179 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  180 void ListFiles(U8 *pname1)
//  181 {
ListFiles:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+44
        MOVS     R6,R0
//  182     FRESULT f_res;
//  183     U32  p1, s1, s2;
//  184     S8   *ptr;
//  185     FATFS   *fs;       // Pointer to file system object*/
//  186     
//  187     if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.W    ??ListFiles_0
//  188     {
//  189       if (sd_command == SD_INACTIVE)
        LDR.W    R0,??DataTable10_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.W    ??ListFiles_1
//  190       {      
//  191         sd_command = SD_FILE_LISTING;
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+19
        STRB     R1,[R0, #+0]
//  192 
//  193         // list files
//  194         Uart_Printf("\n\r");
        ADR.N    R0,??DataTable2  ;; 0x0A, 0x0D, 0x00, 0x00
        BL       Uart_Printf
//  195         if (*pname1 == 0)
        LDRB     R0,[R6, #+0]
        CMP      R0,#+0
        BNE.N    ??ListFiles_2
//  196         {
//  197              ptr = ".";
        ADR.N    R6,??DataTable2_1  ;; "."
        B.N      ??ListFiles_3
//  198         }
//  199         else
//  200         {
//  201          ptr = (S8*)pname1;
//  202         }
//  203         p1 = s1 = s2 = 0;
??ListFiles_2:
??ListFiles_3:
        MOVS     R4,#+0
        MOVS     R5,R4
        STR      R4,[SP, #+36]
//  204         f_res = f_opendir(&Dir, ptr);
        MOVS     R1,R6
        LDR.W    R0,??DataTable10_15
        BL       f_opendir
//  205             
//  206         if (!f_res) 
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??ListFiles_4
//  207         {
//  208             for(;;)
//  209             {
//  210             #if _USE_LFN
//  211                 Finfo.lfname = Lfname;
//  212                 Finfo.lfsize = sizeof(Lfname);
//  213             #endif
//  214             
//  215                 f_res = f_readdir(&Dir, &Finfo);
//  216                 if ((f_res != FR_OK) || !Finfo.fname[0]) break;
//  217                 if (Finfo.fattrib & AM_DIR)
//  218                 {
//  219                     s2++;
//  220                 } 
//  221                 else
//  222                 {
//  223                     s1++;
//  224                     p1 += Finfo.fsize;
//  225                 }
//  226                 Uart_Printf("%c%c%c%c%c %u/%02u/%02u %02u:%02u %9u  %s",
//  227                 (Finfo.fattrib & AM_DIR) ? 'D' : '-',
//  228                 (Finfo.fattrib & AM_RDO) ? 'R' : '-',
//  229                 (Finfo.fattrib & AM_HID) ? 'H' : '-',
//  230                 (Finfo.fattrib & AM_SYS) ? 'S' : '-',
//  231                 (Finfo.fattrib & AM_ARC) ? 'A' : '-',
//  232                 (Finfo.fdate >> 9) + 1980, (Finfo.fdate >> 5) & 15, Finfo.fdate & 31,
//  233                 (Finfo.ftime >> 11), (Finfo.ftime >> 5) & 63,                        
//  234                 Finfo.fsize, &(Finfo.fname[0]));
//  235     
//  236                 Finfo.fname[0] = 0;
//  237             
//  238             #if _USE_LFN
//  239                 Uart_Printf("  %s\n\r", Lfname);
//  240             #else
//  241                 Uart_Printf("\n\r");
//  242             #endif
//  243                 }
//  244             }
//  245     
//  246             Uart_Printf("%4u File(s), %u bytes total \n\r%4u Dir(s)", s1, p1, s2);
??ListFiles_5:
        MOVS     R3,R5
        LDR      R2,[SP, #+36]
        MOVS     R1,R4
        LDR.W    R0,??DataTable10_16
        BL       Uart_Printf
//  247             if (f_getfree(ptr, (DWORD*)&p1, &fs) == FR_OK)
        ADD      R2,SP,#+40
        ADD      R1,SP,#+36
        MOVS     R0,R6
        BL       f_getfree
        CMP      R0,#+0
        BNE.N    ??ListFiles_6
//  248             {
//  249                 Uart_Printf(", %u bytes free \n\r", p1 * fs->csize * 512);
        LDR      R0,[SP, #+36]
        LDR      R1,[SP, #+40]
        LDRB     R1,[R1, #+2]
        MULS     R0,R1,R0
        MOV      R1,#+512
        MUL      R1,R1,R0
        LDR.W    R0,??DataTable10_17
        BL       Uart_Printf
//  250             }
//  251         
//  252         sd_command = SD_INACTIVE;
??ListFiles_6:
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
        B.N      ??ListFiles_7
??ListFiles_8:
        MOVS     R1,#+45
??ListFiles_9:
        LDR.W    R12,??DataTable10_18
        STR      R12,[SP, #+32]
        LDR.W    R12,??DataTable10_19
        LDR      R12,[R12, #+0]
        STR      R12,[SP, #+28]
        LDR.W    R12,??DataTable10_19
        LDRH     R12,[R12, #+6]
        UBFX     R12,R12,#+5,#+6
        UXTH     R12,R12          ;; ZeroExt  R12,R12,#+16,#+16
        STR      R12,[SP, #+24]
        LDR.W    R12,??DataTable10_19
        LDRH     R12,[R12, #+6]
        UXTH     R12,R12          ;; ZeroExt  R12,R12,#+16,#+16
        LSRS     R12,R12,#+11
        UXTH     R12,R12          ;; ZeroExt  R12,R12,#+16,#+16
        STR      R12,[SP, #+20]
        LDR.W    R12,??DataTable10_19
        LDRB     R12,[R12, #+4]
        ANDS     R12,R12,#0x1F
        STR      R12,[SP, #+16]
        LDR.W    R12,??DataTable10_19
        LDRH     R12,[R12, #+4]
        UBFX     R12,R12,#+5,#+4
        UXTH     R12,R12          ;; ZeroExt  R12,R12,#+16,#+16
        STR      R12,[SP, #+12]
        LDR.W    R12,??DataTable10_19
        LDRH     R12,[R12, #+4]
        UXTH     R12,R12          ;; ZeroExt  R12,R12,#+16,#+16
        LSRS     R12,R12,#+9
        MOVW     LR,#+1980
        UXTAH    R12,LR,R12
        STR      R12,[SP, #+8]
        STR      R0,[SP, #+4]
        STR      R7,[SP, #+0]
        LDR.W    R0,??DataTable10_20
        BL       Uart_Printf
        LDR.W    R0,??DataTable10_19
        MOVS     R1,#+0
        STRB     R1,[R0, #+9]
        LDR.W    R1,??DataTable10_21
        LDR.W    R0,??DataTable10_22
        BL       Uart_Printf
??ListFiles_4:
        LDR.W    R0,??DataTable10_19
        LDR.W    R1,??DataTable10_21
        STR      R1,[R0, #+24]
        LDR.W    R0,??DataTable10_19
        MOV      R1,#+256
        STR      R1,[R0, #+28]
        LDR.W    R1,??DataTable10_19
        LDR.W    R0,??DataTable10_15
        BL       f_readdir
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??ListFiles_10
        LDR.W    R0,??DataTable10_19
        LDRB     R0,[R0, #+9]
        CMP      R0,#+0
        BNE.N    ??ListFiles_11
??ListFiles_10:
        B.N      ??ListFiles_5
??ListFiles_11:
        LDR.W    R0,??DataTable10_19
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+27
        BPL.N    ??ListFiles_12
        ADDS     R5,R5,#+1
        B.N      ??ListFiles_13
??ListFiles_12:
        ADDS     R4,R4,#+1
        LDR      R0,[SP, #+36]
        LDR.W    R1,??DataTable10_19
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        STR      R0,[SP, #+36]
??ListFiles_13:
        LDR.W    R0,??DataTable10_19
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+26
        BPL.N    ??ListFiles_14
        MOVS     R0,#+65
        B.N      ??ListFiles_15
??ListFiles_14:
        MOVS     R0,#+45
??ListFiles_15:
        LDR.W    R1,??DataTable10_19
        LDRB     R1,[R1, #+8]
        LSLS     R1,R1,#+29
        BPL.N    ??ListFiles_16
        MOVS     R7,#+83
        B.N      ??ListFiles_17
??ListFiles_16:
        MOVS     R7,#+45
??ListFiles_17:
        LDR.W    R1,??DataTable10_19
        LDRB     R1,[R1, #+8]
        LSLS     R1,R1,#+30
        BPL.N    ??ListFiles_18
        MOVS     R3,#+72
        B.N      ??ListFiles_19
??ListFiles_18:
        MOVS     R3,#+45
??ListFiles_19:
        LDR.W    R1,??DataTable10_19
        LDRB     R1,[R1, #+8]
        LSLS     R1,R1,#+31
        BPL.N    ??ListFiles_20
        MOVS     R2,#+82
        B.N      ??ListFiles_21
??ListFiles_20:
        MOVS     R2,#+45
??ListFiles_21:
        LDR.W    R1,??DataTable10_19
        LDRB     R1,[R1, #+8]
        LSLS     R1,R1,#+27
        BPL.W    ??ListFiles_8
        MOVS     R1,#+68
        B.N      ??ListFiles_9
//  253 
//  254       }
//  255       else
//  256       {
//  257         Uart_Printf(SD_API_CARD_BUSY);  
??ListFiles_1:
        LDR.W    R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
        B.N      ??ListFiles_7
//  258       }        
//  259     }
//  260     else
//  261     {
//  262       Uart_Printf(SD_API_CARD_NOT_PRESENT);
??ListFiles_0:
        LDR.W    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  263     }
//  264 }
??ListFiles_7:
        ADD      SP,SP,#+44
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC8      0x0A, 0x0D, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC8      ".",0x0,0x0
//  265 
//  266 
//  267                                                
//  268 
//  269 
//  270 #define ReadDataHandle(SerPort, data) putcharSer(SerPort, data)
//  271 
//  272 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  273 U8 ReadFile(S8 *FileName, U8 verbose)
//  274 {
ReadFile:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+8
        MOVS     R5,R0
        MOVS     R4,R1
//  275     U32  p1, p2, s2;
//  276     U16  cnt = 0;
        MOVS     R6,#+0
//  277     U16  i = 0;
        MOVS     R8,#+0
//  278     U8   sd_status = 0;
        MOVS     R7,#+0
//  279   
//  280   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.W    ??ReadFile_0
//  281   {
//  282     #if (SD_FAT_MUTEX_EN == 1)
//  283       OSMutexAcquire(SDCardResource);
//  284     #endif
//  285     
//  286     if (sd_command == SD_INACTIVE)
        LDR.W    R0,??DataTable10_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.W    ??ReadFile_1
//  287     {    
//  288       sd_command = SD_FILE_READING;
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+20
        STRB     R1,[R0, #+0]
//  289       
//  290       if (f_open(&file_obj, (S8*)FileName, 	FA_READ) == FR_OK)
        MOVS     R2,#+1
        MOVS     R1,R5
        LDR.W    R0,??DataTable10_23
        BL       f_open
        CMP      R0,#+0
        BNE.N    ??ReadFile_2
//  291       {  
//  292         if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??ReadFile_3
//  293         {          
//  294             Uart_Printf("\n\r");
        ADR.N    R0,??DataTable5  ;; 0x0A, 0x0D, 0x00, 0x00
        BL       Uart_Printf
//  295         }
//  296         
//  297         p2 = 0;     
??ReadFile_3:
        MOVS     R5,#+0
//  298         SetFatTimer((U32)0);     
        MOVS     R0,#+0
        BL       SetFatTimer
//  299         p1 = f_size(&file_obj);
        LDR.W    R0,??DataTable10_23
        LDR      R7,[R0, #+12]
//  300         
//  301         while (p1) 
??ReadFile_4:
        CMP      R7,#+0
        BEQ.N    ??ReadFile_5
//  302         {
//  303             if (p1 >= sizeof(Buff))	
        MOV      R0,#+512
        CMP      R7,R0
        BCC.N    ??ReadFile_6
//  304             { 
//  305                 cnt = sizeof(Buff);
        MOV      R6,#+512
//  306                 p1 -= sizeof(Buff);
        SUBS     R7,R7,#+512
        B.N      ??ReadFile_7
//  307             }
//  308             else    
//  309             {
//  310                 cnt = (U16)p1;
??ReadFile_6:
        MOVS     R6,R7
//  311                 p1 = 0;
        MOVS     R7,#+0
//  312             }
//  313             if (f_read(&file_obj, (S8*)Buff, cnt, (UINT*)&s2) != FR_OK)
??ReadFile_7:
        ADD      R3,SP,#+0
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R2,R6
        LDR.W    R1,??DataTable10_24
        LDR.W    R0,??DataTable10_23
        BL       f_read
        CMP      R0,#+0
        BEQ.N    ??ReadFile_8
//  314             {
//  315                 break;
//  316             }
//  317             else
//  318             {
//  319                 p2 += s2;
//  320                 if (cnt != s2) break;  
//  321                 for(i=0;i<cnt;i++)
//  322                 {
//  323                     ReadDataHandle(1, Buff[i]);
//  324                 }
//  325             }
//  326         }
//  327     
//  328         GetFatTimer(&s2);
??ReadFile_5:
        ADD      R0,SP,#+0
        BL       GetFatTimer
//  329         f_close(&file_obj);
        LDR.W    R0,??DataTable10_23
        BL       f_close
//  330         
//  331         //Sets these variables to inactive states
//  332         sd_command = SD_INACTIVE;        
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  333         
//  334         Uart_Printf("\n\r%u bytes read with %u bytes/sec.\n\r", p2, s2 ? (p2 * 100 / s2) : 0);
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??ReadFile_9
        MOVS     R0,#+100
        MUL      R0,R0,R5
        LDR      R1,[SP, #+0]
        UDIV     R2,R0,R1
        B.N      ??ReadFile_10
??ReadFile_8:
        LDR      R0,[SP, #+0]
        ADDS     R5,R0,R5
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LDR      R0,[SP, #+0]
        CMP      R6,R0
        BNE.N    ??ReadFile_5
??ReadFile_11:
        MOVS     R8,#+0
??ReadFile_12:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R8,R6
        BCS.N    ??ReadFile_4
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LDR.W    R0,??DataTable10_24
        LDRB     R1,[R8, R0]
        MOVS     R0,#+1
        BL       putcharSer
        ADDS     R8,R8,#+1
        B.N      ??ReadFile_12
??ReadFile_9:
        MOVS     R2,#+0
??ReadFile_10:
        MOVS     R1,R5
        LDR.W    R0,??DataTable10_25
        BL       Uart_Printf
//  335         
//  336         if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??ReadFile_13
//  337         {
//  338             Uart_Printf("\n\r");
        ADR.N    R0,??DataTable5  ;; 0x0A, 0x0D, 0x00, 0x00
        BL       Uart_Printf
//  339         }
//  340         
//  341         #if (SD_FAT_MUTEX_EN == 1)
//  342           OSMutexRelease(SDCardResource);
//  343         #endif        
//  344         
//  345         return SD_FILE_READ;
??ReadFile_13:
        MOVS     R0,#+21
        B.N      ??ReadFile_14
//  346       } 
//  347       else
//  348       {       
//  349         //If the file was not found, the system is halted
//  350         if (verbose == VERBOSE_ON)
??ReadFile_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??ReadFile_15
//  351         {
//  352           Uart_Printf("\n\r");
        ADR.N    R0,??DataTable5  ;; 0x0A, 0x0D, 0x00, 0x00
        BL       Uart_Printf
//  353           Uart_Printf((S8*)FileName);
        MOVS     R0,R5
        BL       Uart_Printf
//  354           Uart_Printf(" not found.\n\r");
        LDR.W    R0,??DataTable10_26
        BL       Uart_Printf
//  355         }
//  356         
//  357         sd_command = SD_INACTIVE;
??ReadFile_15:
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  358         
//  359         #if (SD_FAT_MUTEX_EN == 1)
//  360           OSMutexRelease(SDCardResource);
//  361         #endif
//  362         
//  363         return SD_FILE_NOT_FOUND;
        MOVS     R0,#+27
        B.N      ??ReadFile_14
//  364       }
//  365     }
//  366     else
//  367     {
//  368       #if (SD_FAT_MUTEX_EN == 1)
//  369         OSMutexRelease(SDCardResource);
//  370       #endif            
//  371       
//  372       if (verbose == VERBOSE_ON)
??ReadFile_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??ReadFile_16
//  373       {
//  374           Uart_Printf((S8*)SD_API_CARD_BUSY);
        LDR.W    R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  375       }      
//  376       
//  377       return SD_BUSY;      
??ReadFile_16:
        MOVS     R0,#+9
        B.N      ??ReadFile_14
//  378     }
//  379   }
//  380   else
//  381   {
//  382       if (verbose == VERBOSE_ON)
??ReadFile_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??ReadFile_17
//  383       {
//  384           Uart_Printf((S8*)SD_API_CARD_NOT_PRESENT);
        LDR.W    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  385       }
//  386       return SD_FAT_ERROR;
??ReadFile_17:
        MOVS     R0,#+8
??ReadFile_14:
        POP      {R1,R2,R4-R8,PC}  ;; return
//  387   }
//  388 }
//  389 
//  390 
//  391 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  392 U8 ChangeDir(S8 *FileName, U8 verbose)
//  393 {
ChangeDir:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  394   U8   sd_status = 0;
        MOVS     R6,#+0
//  395   
//  396   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.N    ??ChangeDir_0
//  397   {
//  398     #if (SD_FAT_MUTEX_EN == 1)
//  399       OSMutexAcquire(SDCardResource);
//  400     #endif    
//  401     
//  402     if (sd_command == SD_INACTIVE)
        LDR.W    R0,??DataTable10_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.N    ??ChangeDir_1
//  403     {    
//  404       sd_command = SD_DIR_CHANGING;
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+23
        STRB     R1,[R0, #+0]
//  405       
//  406       if (f_chdir(FileName) == FR_OK)
        MOVS     R0,R5
        BL       f_chdir
        CMP      R0,#+0
        BNE.N    ??ChangeDir_2
//  407       {  
//  408         sd_command = SD_INACTIVE;        
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  409         
//  410         #if (SD_FAT_MUTEX_EN == 1)
//  411           OSMutexRelease(SDCardResource);
//  412         #endif        
//  413         
//  414         if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??ChangeDir_3
//  415         {
//  416             Uart_Printf( (S8*)"\n\r");
        ADR.N    R0,??DataTable5  ;; 0x0A, 0x0D, 0x00, 0x00
        BL       Uart_Printf
//  417         }
//  418         
//  419         return SD_OPEN_DIR_OK;
??ChangeDir_3:
        MOVS     R0,#+33
        B.N      ??ChangeDir_4
//  420       }
//  421       else
//  422       {
//  423         sd_command = SD_INACTIVE;
??ChangeDir_2:
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  424         
//  425         #if (SD_FAT_MUTEX_EN == 1)
//  426           OSMutexRelease(SDCardResource);
//  427         #endif        
//  428         
//  429         if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??ChangeDir_5
//  430         {
//  431           Uart_Printf((S8*)"\n\rDirectory ");
        LDR.W    R0,??DataTable10_27
        BL       Uart_Printf
//  432           Uart_Printf((S8*)FileName);
        MOVS     R0,R5
        BL       Uart_Printf
//  433           Uart_Printf((S8*)" does not exist !\n\r");
        LDR.W    R0,??DataTable10_28
        BL       Uart_Printf
//  434         }
//  435         return SD_OPEN_DIR_FAILURE;
??ChangeDir_5:
        MOVS     R0,#+34
        B.N      ??ChangeDir_4
//  436       }
//  437     }
//  438     else
//  439     {
//  440       #if (SD_FAT_MUTEX_EN == 1)
//  441         OSMutexRelease(SDCardResource);
//  442       #endif      
//  443 
//  444       if (verbose == VERBOSE_ON)
??ChangeDir_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??ChangeDir_6
//  445       {
//  446         Uart_Printf((S8*)SD_API_CARD_BUSY);
        LDR.W    R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  447       }      
//  448 
//  449       return SD_BUSY;
??ChangeDir_6:
        MOVS     R0,#+9
        B.N      ??ChangeDir_4
//  450     }
//  451   }
//  452   else
//  453   {
//  454       if (verbose == VERBOSE_ON)
??ChangeDir_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??ChangeDir_7
//  455       {
//  456         Uart_Printf((S8*)SD_API_CARD_NOT_PRESENT);
        LDR.W    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  457       }
//  458       return SD_FAT_ERROR;
??ChangeDir_7:
        MOVS     R0,#+8
??ChangeDir_4:
        POP      {R4-R6,PC}       ;; return
//  459   }
//  460 }
//  461 
//  462 
//  463 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  464 U8 CreateFile(S8 *FileName, U8 verbose)
//  465 {
CreateFile:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  466   U8   sd_status = 0;
        MOVS     R6,#+0
//  467   
//  468   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.N    ??CreateFile_0
//  469   {
//  470     #if (SD_FAT_MUTEX_EN == 1)
//  471       OSMutexAcquire(SDCardResource);
//  472     #endif       
//  473     
//  474     if (sd_command == SD_INACTIVE)
        LDR.W    R0,??DataTable10_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.N    ??CreateFile_1
//  475     {    
//  476       sd_command = SD_FILE_WRITING;
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+15
        STRB     R1,[R0, #+0]
//  477       
//  478       if (f_open(&file_obj, FileName, 	FA_CREATE_NEW) == FR_OK)
        MOVS     R2,#+4
        MOVS     R1,R4
        LDR.W    R0,??DataTable10_23
        BL       f_open
        CMP      R0,#+0
        BNE.N    ??CreateFile_2
//  479       {  
//  480         f_close(&file_obj);
        LDR.W    R0,??DataTable10_23
        BL       f_close
//  481         
//  482         //Sets these variables to inactive states
//  483         sd_command = SD_INACTIVE;        
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  484         
//  485         #if (SD_FAT_MUTEX_EN == 1)
//  486           OSMutexRelease(SDCardResource);
//  487         #endif        
//  488         
//  489         if (verbose == VERBOSE_ON)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??CreateFile_3
//  490         {
//  491           Uart_Printf((S8*)"\n\r");
        ADR.N    R0,??DataTable5  ;; 0x0A, 0x0D, 0x00, 0x00
        BL       Uart_Printf
//  492           Uart_Printf((S8*)FileName);
        MOVS     R0,R4
        BL       Uart_Printf
//  493           Uart_Printf( (S8*)" was created successfully.\n\r");
        LDR.W    R0,??DataTable10_29
        BL       Uart_Printf
//  494         }          
//  495         
//  496         return SD_CREATE_FILE_OK;
??CreateFile_3:
        MOVS     R0,#+30
        B.N      ??CreateFile_4
//  497       }
//  498       else
//  499       {
//  500         sd_command = SD_INACTIVE;
??CreateFile_2:
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  501         
//  502         #if (SD_FAT_MUTEX_EN == 1)
//  503           OSMutexRelease(SDCardResource);
//  504         #endif        
//  505         
//  506         if (verbose == VERBOSE_ON)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??CreateFile_5
//  507         {
//  508           Uart_Printf( (S8*)"\n\r");
        ADR.N    R0,??DataTable5  ;; 0x0A, 0x0D, 0x00, 0x00
        BL       Uart_Printf
//  509           Uart_Printf( (S8*)FileName);
        MOVS     R0,R4
        BL       Uart_Printf
//  510           Uart_Printf( (S8*)" was not created.\n\r");
        LDR.W    R0,??DataTable10_30
        BL       Uart_Printf
//  511         }
//  512         return SD_CREATE_FILE_FAILURE;
??CreateFile_5:
        MOVS     R0,#+29
        B.N      ??CreateFile_4
//  513       }
//  514     }
//  515     else
//  516     {
//  517       #if (SD_FAT_MUTEX_EN == 1)
//  518         OSMutexRelease(SDCardResource);
//  519       #endif      
//  520 
//  521       if (verbose == VERBOSE_ON)
??CreateFile_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??CreateFile_6
//  522       {
//  523         Uart_Printf( (S8*)SD_API_CARD_BUSY);
        LDR.W    R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  524       }      
//  525 
//  526       return SD_BUSY;
??CreateFile_6:
        MOVS     R0,#+9
        B.N      ??CreateFile_4
//  527     }
//  528   }
//  529   else
//  530   {
//  531       if (verbose == VERBOSE_ON)
??CreateFile_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??CreateFile_7
//  532       {
//  533         Uart_Printf( (S8*)SD_API_CARD_NOT_PRESENT);
        LDR.W    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  534       }
//  535       return SD_FAT_ERROR;
??CreateFile_7:
        MOVS     R0,#+8
??CreateFile_4:
        POP      {R4-R6,PC}       ;; return
//  536   }
//  537 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC8      0x0A, 0x0D, 0x00, 0x00
//  538 
//  539 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  540 U8 CreateDir(S8 *FileName, U8 verbose)
//  541 {
CreateDir:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  542   U8   sd_status = 0;
        MOVS     R6,#+0
//  543   
//  544   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.N    ??CreateDir_0
//  545   {
//  546     #if (SD_FAT_MUTEX_EN == 1)
//  547       OSMutexAcquire(SDCardResource);
//  548     #endif    
//  549         
//  550     if (sd_command == SD_INACTIVE)
        LDR.W    R0,??DataTable10_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.N    ??CreateDir_1
//  551     {    
//  552       sd_command = SD_DIR_CREATING;
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+22
        STRB     R1,[R0, #+0]
//  553       
//  554       if (f_mkdir( FileName) == FR_OK)
        MOVS     R0,R4
        BL       f_mkdir
        CMP      R0,#+0
        BNE.N    ??CreateDir_2
//  555       {  
//  556         sd_command = SD_INACTIVE;        
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  557         
//  558         #if (SD_FAT_MUTEX_EN == 1)
//  559           OSMutexRelease(SDCardResource);
//  560         #endif        
//  561         
//  562         if (verbose == VERBOSE_ON)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??CreateDir_3
//  563         {
//  564           Uart_Printf( (S8*)"\n\rDirectory ");
        LDR.W    R0,??DataTable10_27
        BL       Uart_Printf
//  565           Uart_Printf( (S8*)FileName);
        MOVS     R0,R4
        BL       Uart_Printf
//  566           Uart_Printf( (S8*)" was created successfully.\n\r");
        LDR.W    R0,??DataTable10_29
        BL       Uart_Printf
//  567         }          
//  568         
//  569         return SD_CREATE_DIR_OK;
??CreateDir_3:
        MOVS     R0,#+31
        B.N      ??CreateDir_4
//  570       }
//  571       else
//  572       {
//  573         sd_command = SD_INACTIVE;
??CreateDir_2:
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  574         
//  575         #if (SD_FAT_MUTEX_EN == 1)
//  576           OSMutexRelease(SDCardResource);
//  577         #endif        
//  578         
//  579         if (verbose == VERBOSE_ON)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??CreateDir_5
//  580         {
//  581           Uart_Printf( (S8*)"\n\rDirectory ");
        LDR.W    R0,??DataTable10_27
        BL       Uart_Printf
//  582           Uart_Printf( (S8*)FileName);
        MOVS     R0,R4
        BL       Uart_Printf
//  583           Uart_Printf( (S8*)" was not created.\n\r");
        LDR.W    R0,??DataTable10_30
        BL       Uart_Printf
//  584         }
//  585         return SD_CREATE_DIR_FAILURE;
??CreateDir_5:
        MOVS     R0,#+32
        B.N      ??CreateDir_4
//  586       }
//  587     }
//  588     else
//  589     {
//  590       #if (SD_FAT_MUTEX_EN == 1)
//  591         OSMutexRelease(SDCardResource);
//  592       #endif      
//  593 
//  594       if (verbose == VERBOSE_ON)
??CreateDir_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??CreateDir_6
//  595       {
//  596         Uart_Printf( (S8*)SD_API_CARD_BUSY);
        LDR.W    R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  597       }
//  598 
//  599       return SD_BUSY;
??CreateDir_6:
        MOVS     R0,#+9
        B.N      ??CreateDir_4
//  600     }
//  601   }
//  602   else
//  603   {
//  604       if (verbose == VERBOSE_ON)
??CreateDir_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??CreateDir_7
//  605       {
//  606         Uart_Printf( (S8*)SD_API_CARD_NOT_PRESENT);
        LDR.W    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  607       }
//  608       return SD_FAT_ERROR;
??CreateDir_7:
        MOVS     R0,#+8
??CreateDir_4:
        POP      {R4-R6,PC}       ;; return
//  609   }
//  610 }
//  611 
//  612 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  613 U8 DeleteFile(S8 *FileName, U8 verbose)
//  614 {
DeleteFile:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  615   U8 sd_status = 0;
        MOVS     R6,#+0
//  616   
//  617   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.N    ??DeleteFile_0
//  618   {  
//  619     #if (SD_FAT_MUTEX_EN == 1)
//  620       OSMutexAcquire(SDCardResource);
//  621     #endif    
//  622     
//  623     if (sd_command == SD_INACTIVE)
        LDR.W    R0,??DataTable10_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.N    ??DeleteFile_1
//  624     {
//  625       // Indicates that the file will be deleted
//  626       sd_command = SD_FILE_DELETING;
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+16
        STRB     R1,[R0, #+0]
//  627       
//  628       sd_status = f_unlink(FileName);
        MOVS     R0,R4
        BL       f_unlink
        MOVS     R6,R0
//  629       
//  630       sd_command = SD_INACTIVE;      
        LDR.W    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  631       
//  632       #if (SD_FAT_MUTEX_EN == 1)
//  633         OSMutexRelease(SDCardResource);
//  634       #endif      
//  635       
//  636       if (sd_status == FR_OK)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??DeleteFile_2
//  637       {
//  638         if (verbose == VERBOSE_ON)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??DeleteFile_3
//  639         {
//  640             Uart_Printf( (S8*)"\n\r");                       
        ADR.N    R0,??DataTable9  ;; 0x0A, 0x0D, 0x00, 0x00
        BL       Uart_Printf
//  641             Uart_Printf( (S8*)FileName);
        MOVS     R0,R4
        BL       Uart_Printf
//  642             Uart_Printf( (S8*)" deleted! \n\r");
        LDR.W    R0,??DataTable10_31
        BL       Uart_Printf
//  643         }
//  644         return SD_FILE_DELETED;
??DeleteFile_3:
        MOVS     R0,#+17
        B.N      ??DeleteFile_4
//  645       }
//  646       else
//  647       {
//  648         if (sd_status == FR_DENIED)
??DeleteFile_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+7
        BNE.N    ??DeleteFile_5
//  649         {
//  650           if (verbose == VERBOSE_ON)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??DeleteFile_6
//  651           {
//  652                 Uart_Printf( (S8*)"\n\rDelete file or directory denied.\n\r");
        LDR.W    R0,??DataTable10_32
        BL       Uart_Printf
//  653                 Uart_Printf( (S8*)"Directory is not empty or file is write-protected.\n\r");        
        LDR.W    R0,??DataTable10_33
        BL       Uart_Printf
//  654           }
//  655           return SD_DELETE_FILE_DENIED;
??DeleteFile_6:
        MOVS     R0,#+18
        B.N      ??DeleteFile_4
//  656         }
//  657         else
//  658         {
//  659           if (verbose == VERBOSE_ON)
??DeleteFile_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??DeleteFile_7
//  660           {
//  661               Serial_Envia_Frase(SD_API_FILE_NOT_FOUND);         
        LDR.W    R0,??DataTable10_34
        LDR      R0,[R0, #+0]
        BL       Serial_Envia_Frase
//  662           }
//  663           return SD_FILE_NOT_FOUND;
??DeleteFile_7:
        MOVS     R0,#+27
        B.N      ??DeleteFile_4
//  664         }
//  665       }
//  666     }
//  667     else
//  668     {
//  669       #if (SD_FAT_MUTEX_EN == 1)
//  670         OSMutexRelease(SDCardResource);
//  671       #endif      
//  672 
//  673       if (verbose == VERBOSE_ON)
??DeleteFile_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??DeleteFile_8
//  674       {
//  675         Uart_Printf( (S8*)SD_API_CARD_BUSY);
        LDR.N    R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  676       }
//  677 
//  678       return SD_BUSY;
??DeleteFile_8:
        MOVS     R0,#+9
        B.N      ??DeleteFile_4
//  679     }
//  680   }
//  681   else
//  682   {
//  683       if (verbose == VERBOSE_ON)
??DeleteFile_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+37
        BNE.N    ??DeleteFile_9
//  684       {
//  685         Uart_Printf( (S8*)SD_API_CARD_NOT_PRESENT);
        LDR.N    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  686       }
//  687       return SD_FAT_ERROR;
??DeleteFile_9:
        MOVS     R0,#+8
??DeleteFile_4:
        POP      {R4-R6,PC}       ;; return
//  688   }
//  689 }
//  690 
//  691 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  692 U8 RenameFile(S8 *OldFileName,S8 *NewFileName, U8 verbose)
//  693 {
RenameFile:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  694   U8 sd_status = 0;
        MOVS     R7,#+0
//  695   
//  696   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.N    ??RenameFile_0
//  697   {  
//  698     #if (SD_FAT_MUTEX_EN == 1)
//  699       OSMutexAcquire(SDCardResource);
//  700     #endif    
//  701     
//  702     if (sd_command == SD_INACTIVE)
        LDR.N    R0,??DataTable10_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.N    ??RenameFile_1
//  703     {
//  704       // Indicates that the file will be renamed
//  705       sd_command = SD_FILE_RENAMING;
        LDR.N    R0,??DataTable10_11
        MOVS     R1,#+13
        STRB     R1,[R0, #+0]
//  706       
//  707       // Passa para a fun玢o os nomes dos arquivos
//  708       sd_status = f_rename(OldFileName, NewFileName);
        MOVS     R1,R5
        MOVS     R0,R4
        BL       f_rename
        MOVS     R7,R0
//  709 
//  710       sd_command = SD_INACTIVE;
        LDR.N    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  711       
//  712       #if (SD_FAT_MUTEX_EN == 1)
//  713         OSMutexRelease(SDCardResource);
//  714       #endif      
//  715       
//  716       if(sd_status == FR_OK)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??RenameFile_2
//  717       {
//  718         if (verbose == VERBOSE_ON)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+37
        BNE.N    ??RenameFile_3
//  719         {      
//  720           Uart_Printf( (S8*)"\n\rFile found and renamed !\n\r");      
        LDR.N    R0,??DataTable10_35
        BL       Uart_Printf
//  721         }
//  722         return SD_FILE_RENAMED;
??RenameFile_3:
        MOVS     R0,#+14
        B.N      ??RenameFile_4
//  723       }
//  724       else
//  725       {
//  726         if (verbose == VERBOSE_ON)
??RenameFile_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+37
        BNE.N    ??RenameFile_5
//  727         {      
//  728           Uart_Printf( (S8*)SD_API_FILE_NOT_FOUND);       
        LDR.N    R0,??DataTable10_34
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  729         }
//  730         return SD_FILE_NOT_FOUND;
??RenameFile_5:
        MOVS     R0,#+27
        B.N      ??RenameFile_4
//  731       }
//  732     }
//  733     else
//  734     {
//  735       #if (SD_FAT_MUTEX_EN == 1)
//  736         OSMutexRelease(SDCardResource);
//  737       #endif      
//  738 
//  739       if (verbose == VERBOSE_ON)
??RenameFile_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+37
        BNE.N    ??RenameFile_6
//  740       {
//  741         Uart_Printf( (S8*)SD_API_CARD_BUSY);
        LDR.N    R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  742       }
//  743 
//  744       return SD_BUSY;
??RenameFile_6:
        MOVS     R0,#+9
        B.N      ??RenameFile_4
//  745     }
//  746   }
//  747   else
//  748   {
//  749       if (verbose == VERBOSE_ON)
??RenameFile_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+37
        BNE.N    ??RenameFile_7
//  750       {
//  751         Uart_Printf( (S8*)SD_API_CARD_NOT_PRESENT);
        LDR.N    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  752       }
//  753       return SD_FAT_ERROR;
??RenameFile_7:
        MOVS     R0,#+8
??RenameFile_4:
        POP      {R1,R4-R7,PC}    ;; return
//  754   }
//  755 }
//  756 
//  757 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  758 U8 CopyFile(S8 *SrcFileName,S8 *DstFileName, U8 verbose)
//  759 {
CopyFile:
        PUSH     {R1-R7,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R4,R2
//  760   U32  p1, p2, s1, s2;
//  761   S8   *NewDstName, *CopyName;
//  762   U8   f_res = 0;
        MOVS     R7,#+0
//  763   
//  764   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.W    ??CopyFile_0
//  765   {  
//  766     #if (SD_FAT_MUTEX_EN == 1)
//  767       OSMutexAcquire(SDCardResource);
//  768     #endif
//  769 
//  770     if (sd_command == SD_INACTIVE)
        LDR.N    R0,??DataTable10_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.W    ??CopyFile_1
//  771     {
//  772       // Indicates that the file will be renamed
//  773       sd_command = SD_FILE_COPYING;
        LDR.N    R0,??DataTable10_11
        MOVS     R1,#+24
        STRB     R1,[R0, #+0]
//  774       
//  775       // Passa para a fun玢o os nomes dos arquivos
//  776       if (f_open(&file_obj, SrcFileName, FA_OPEN_EXISTING | FA_READ) != FR_OK)
        MOVS     R2,#+1
        MOVS     R1,R5
        LDR.N    R0,??DataTable10_23
        BL       f_open
        CMP      R0,#+0
        BEQ.N    ??CopyFile_2
//  777       {        
//  778         sd_command = SD_INACTIVE;
        LDR.N    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  779         
//  780         #if (SD_FAT_MUTEX_EN == 1)
//  781           OSMutexRelease(SDCardResource);
//  782         #endif        
//  783         
//  784         if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??CopyFile_3
//  785         {      
//  786           Uart_Printf( (S8*)"\n\rSource file does not exist !\n\r");      
        LDR.N    R0,??DataTable10_36
        BL       Uart_Printf
//  787         }
//  788         return SD_COPY_FILE_FAILURE;      
??CopyFile_3:
        MOVS     R0,#+26
        B.N      ??CopyFile_4
//  789       }
//  790       
//  791       if (f_open(&file_obj2, DstFileName, FA_CREATE_ALWAYS | FA_WRITE) != FR_OK)
??CopyFile_2:
        MOVS     R2,#+10
        MOVS     R1,R6
        LDR.N    R0,??DataTable10_37
        BL       f_open
        CMP      R0,#+0
        BEQ.N    ??CopyFile_5
//  792       {
//  793         // Complementa nome do arquivo
//  794         CopyName = SrcFileName;
//  795         NewDstName = DstFileName;
        MOVS     R0,R6
        B.N      ??CopyFile_6
//  796         
//  797         while(*NewDstName)
//  798         {
//  799           NewDstName++;
??CopyFile_7:
        ADDS     R0,R0,#+1
//  800         }
??CopyFile_6:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+0
        BNE.N    ??CopyFile_7
//  801         
//  802         NewDstName--;
        SUBS     R0,R0,#+1
//  803         if (*NewDstName != '/')
        LDRB     R1,[R0, #+0]
        CMP      R1,#+47
        BEQ.N    ??CopyFile_8
//  804         {
//  805           NewDstName++;
        ADDS     R0,R0,#+1
//  806           *NewDstName = '/';
        MOVS     R1,#+47
        STRB     R1,[R0, #+0]
//  807           NewDstName++;
        ADDS     R0,R0,#+1
        B.N      ??CopyFile_9
//  808         }else
//  809         {
//  810           NewDstName++;
??CopyFile_8:
        ADDS     R0,R0,#+1
        B.N      ??CopyFile_9
//  811         }
//  812         
//  813         while(*CopyName)
//  814         {
//  815           *NewDstName = *CopyName;
??CopyFile_10:
        LDRB     R1,[R5, #+0]
        STRB     R1,[R0, #+0]
//  816           CopyName++;
        ADDS     R5,R5,#+1
//  817           NewDstName++;
        ADDS     R0,R0,#+1
//  818         }               
??CopyFile_9:
        LDRB     R1,[R5, #+0]
        CMP      R1,#+0
        BNE.N    ??CopyFile_10
//  819         
//  820         if (f_open(&file_obj2, DstFileName, FA_CREATE_ALWAYS | FA_WRITE) != FR_OK)
        MOVS     R2,#+10
        MOVS     R1,R6
        LDR.N    R0,??DataTable10_37
        BL       f_open
        CMP      R0,#+0
        BEQ.N    ??CopyFile_5
//  821         {                
//  822           sd_command = SD_INACTIVE;
        LDR.N    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  823           
//  824           #if (SD_FAT_MUTEX_EN == 1)
//  825             OSMutexRelease(SDCardResource);
//  826           #endif          
//  827           
//  828           if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??CopyFile_11
//  829           {                
//  830             Uart_Printf( (S8*)"\n\rDestination file could not be created or already exist !\n\r");       
        LDR.N    R0,??DataTable10_38
        BL       Uart_Printf
//  831           }
//  832             
//  833           f_close(&file_obj);
??CopyFile_11:
        LDR.N    R0,??DataTable10_23
        BL       f_close
//  834           return SD_COPY_FILE_FAILURE;            
        MOVS     R0,#+26
        B.N      ??CopyFile_4
//  835         }
//  836       }
//  837 
//  838       if (verbose == VERBOSE_ON)
??CopyFile_5:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??CopyFile_12
//  839       {                 
//  840         Uart_Printf( (S8*)"\n\rCopying file ...\n\r");
        LDR.N    R0,??DataTable10_39
        BL       Uart_Printf
//  841       }
//  842       
//  843         SetFatTimer((U32)0);  
??CopyFile_12:
        MOVS     R0,#+0
        BL       SetFatTimer
//  844         p1 = 0;
        MOVS     R5,#+0
//  845     
//  846         for (;;) 
//  847         {
//  848             f_res = f_read(&file_obj, Buff, sizeof(Buff), (UINT*)&s1);
??CopyFile_13:
        ADD      R3,SP,#+0
        MOV      R2,#+512
        LDR.N    R1,??DataTable10_24
        LDR.N    R0,??DataTable10_23
        BL       f_read
        MOVS     R7,R0
//  849             if (f_res || s1 == 0) break;   /* error or eof */
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??CopyFile_14
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??CopyFile_15
??CopyFile_14:
        B.N      ??CopyFile_16
//  850             f_res = f_write(&file_obj2, Buff, s1, (UINT*)&s2);
??CopyFile_15:
        ADD      R3,SP,#+4
        LDR      R2,[SP, #+0]
        LDR.N    R1,??DataTable10_24
        LDR.N    R0,??DataTable10_37
        BL       f_write
        MOVS     R7,R0
//  851             p1 += s2;
        LDR      R0,[SP, #+4]
        ADDS     R5,R0,R5
//  852             if (f_res || s2 < s1) break;   /* error or disk full */ 
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??CopyFile_17
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+0]
        CMP      R0,R1
        BCS.N    ??CopyFile_13
//  853         } 
//  854         
//  855         f_close(&file_obj);
??CopyFile_17:
??CopyFile_16:
        LDR.N    R0,??DataTable10_23
        BL       f_close
//  856         f_close(&file_obj2);
        LDR.N    R0,??DataTable10_37
        BL       f_close
//  857       
//  858       if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??CopyFile_18
//  859       {      
//  860         GetFatTimer(&p2);                                   
        ADD      R0,SP,#+8
        BL       GetFatTimer
//  861         Uart_Printf("\n\r%u bytes copied with %u bytes/sec.\n\r", p1, p2 ? (p1 * 100 / p2) : 0);      
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BEQ.N    ??CopyFile_19
        MOVS     R0,#+100
        MUL      R0,R0,R5
        LDR      R1,[SP, #+8]
        UDIV     R2,R0,R1
        B.N      ??CopyFile_20
??CopyFile_19:
        MOVS     R2,#+0
??CopyFile_20:
        MOVS     R1,R5
        LDR.N    R0,??DataTable10_40
        BL       Uart_Printf
//  862       }
//  863       
//  864       sd_command = SD_INACTIVE;
??CopyFile_18:
        LDR.N    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  865       
//  866       #if (SD_FAT_MUTEX_EN == 1)
//  867         OSMutexRelease(SDCardResource);
//  868       #endif      
//  869       
//  870       return SD_FILE_COPIED;
        MOVS     R0,#+25
        B.N      ??CopyFile_4
//  871     }
//  872     else
//  873     {
//  874       #if (SD_FAT_MUTEX_EN == 1)
//  875         OSMutexRelease(SDCardResource);
//  876       #endif      
//  877 
//  878       if (verbose == VERBOSE_ON)
??CopyFile_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??CopyFile_21
//  879       {
//  880         Uart_Printf( (S8*)SD_API_CARD_BUSY);
        LDR.N    R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  881       }
//  882 
//  883       return SD_BUSY;
??CopyFile_21:
        MOVS     R0,#+9
        B.N      ??CopyFile_4
//  884     }
//  885   }
//  886   else
//  887   {
//  888       if (verbose == VERBOSE_ON)
??CopyFile_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??CopyFile_22
//  889       {
//  890         Uart_Printf( (S8*)SD_API_CARD_NOT_PRESENT);
        LDR.N    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  891       }
//  892       return SD_FAT_ERROR;
??CopyFile_22:
        MOVS     R0,#+8
??CopyFile_4:
        POP      {R1-R7,PC}       ;; return
//  893   }
//  894 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC8      0x0A, 0x0D, 0x00, 0x00
//  895 
//  896 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  897 U8 WriteUptimeLog(U8 verbose)
//  898 {
WriteUptimeLog:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
//  899   U8   sd_status = 0;
        MOVS     R5,#+0
//  900   OSTime Uptime;
//  901   OSDate UpDate;   
//  902   
//  903   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
        BL       GetCardStat
        LSLS     R0,R0,#+31
        BMI.N    ??WriteUptimeLog_0
//  904   {
//  905     #if (SD_FAT_MUTEX_EN == 1)
//  906       OSMutexAcquire(SDCardResource);
//  907     #endif
//  908 
//  909     if (sd_command == SD_INACTIVE)
        LDR.N    R0,??DataTable10_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.N    ??WriteUptimeLog_1
//  910     {    
//  911         sd_command = SD_FILE_WRITING;
        LDR.N    R0,??DataTable10_11
        MOVS     R1,#+15
        STRB     R1,[R0, #+0]
//  912         
//  913         if (f_open(&file_obj, "uptime.txt", 	FA_WRITE) == FR_NO_FILE)
        MOVS     R2,#+2
        LDR.N    R1,??DataTable10_41
        LDR.N    R0,??DataTable10_23
        BL       f_open
        CMP      R0,#+4
        BNE.N    ??WriteUptimeLog_2
//  914         {     
//  915           f_open(&file_obj, "uptime.txt", 	FA_CREATE_NEW); 
        MOVS     R2,#+4
        LDR.N    R1,??DataTable10_41
        LDR.N    R0,??DataTable10_23
        BL       f_open
//  916           f_open(&file_obj, "uptime.txt", 	FA_WRITE);
        MOVS     R2,#+2
        LDR.N    R1,??DataTable10_41
        LDR.N    R0,??DataTable10_23
        BL       f_open
//  917         }
//  918         f_lseek(&file_obj,f_size(&file_obj));
??WriteUptimeLog_2:
        LDR.N    R0,??DataTable10_23
        LDR      R1,[R0, #+12]
        LDR.N    R0,??DataTable10_23
        BL       f_lseek
//  919         
//  920         UserEnterCritical();
        BL       UserEnterCritical
//  921         Uptime = OSUptime();
        BL       OSUptime
        STR      R0,[SP, #+8]
//  922         UpDate = OSUpDate();
        BL       OSUpDate
        STR      R0,[SP, #+12]
//  923         UserExitCritical();
        BL       UserExitCritical
//  924         
//  925         f_printf(&file_obj, "Uptime: %d Days, %d Hours, %d minutes and %d seconds \n\r", UpDate.RTC_Day, Uptime.RTC_Hour, Uptime.RTC_Minute,Uptime.RTC_Second);  
        LDRB     R0,[SP, #+8]
        STR      R0,[SP, #+4]
        LDRB     R0,[SP, #+9]
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+10]
        LDRB     R2,[SP, #+12]
        LDR.N    R1,??DataTable10_42
        LDR.N    R0,??DataTable10_23
        BL       f_printf
//  926         f_close(&file_obj);
        LDR.N    R0,??DataTable10_23
        BL       f_close
//  927         
//  928         sd_command = SD_INACTIVE;
        LDR.N    R0,??DataTable10_11
        MOVS     R1,#+10
        STRB     R1,[R0, #+0]
//  929         
//  930         #if (SD_FAT_MUTEX_EN == 1)
//  931           OSMutexRelease(SDCardResource);
//  932         #endif        
//  933         
//  934         if (verbose == VERBOSE_ON)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??WriteUptimeLog_3
//  935         {
//  936           Uart_Printf( (S8*)"\n\rUptime written !\n\r");                         
        LDR.N    R0,??DataTable10_43
        BL       Uart_Printf
//  937         }
//  938         
//  939         return SD_FILE_WRITTEN;
??WriteUptimeLog_3:
        MOVS     R0,#+36
        B.N      ??WriteUptimeLog_4
//  940     }
//  941     else
//  942     {
//  943       #if (SD_FAT_MUTEX_EN == 1)
//  944         OSMutexRelease(SDCardResource);
//  945       #endif      
//  946 
//  947       if (verbose == VERBOSE_ON)
??WriteUptimeLog_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??WriteUptimeLog_5
//  948       {
//  949         Uart_Printf( (S8*)SD_API_CARD_BUSY);
        LDR.N    R0,??DataTable10_13
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  950       }
//  951 
//  952       return SD_BUSY;
??WriteUptimeLog_5:
        MOVS     R0,#+9
        B.N      ??WriteUptimeLog_4
//  953     }
//  954   }
//  955   else
//  956   {
//  957       if (verbose == VERBOSE_ON)
??WriteUptimeLog_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+37
        BNE.N    ??WriteUptimeLog_6
//  958       {
//  959         Uart_Printf( (S8*)SD_API_CARD_NOT_PRESENT);
        LDR.N    R0,??DataTable10_14
        LDR      R0,[R0, #+0]
        BL       Uart_Printf
//  960       }
//  961       return SD_FAT_ERROR;
??WriteUptimeLog_6:
        MOVS     R0,#+8
??WriteUptimeLog_4:
        ADD      SP,SP,#+20
        POP      {R4,R5,PC}       ;; return
//  962   }
//  963 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x4004d070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x4004d074

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x400ff114

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     `?<Constant "\\n\\rSD card is already ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     SDHC_Info

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     `?<Constant "\\n\\rSD card has been su...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     `?<Constant "\\n\\rSDHC card has been ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     FATFS_Obj

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     `?<Constant "\\n\\rFAT filesystem moun...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     `?<Constant "\\n\\rFailed to mount SD ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_10:
        DC32     `?<Constant "\\n\\rSD card failure !!!\\n\\r">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_11:
        DC32     sd_command

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_12:
        DC32     `?<Constant "\\n\\rIt is safe to remov...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_13:
        DC32     SD_API_CARD_BUSY

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_14:
        DC32     SD_API_CARD_NOT_PRESENT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_15:
        DC32     Dir

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_16:
        DC32     `?<Constant "%4u File(s), %u bytes...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_17:
        DC32     `?<Constant ", %u bytes free \\n\\r">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_18:
        DC32     Finfo+0x9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_19:
        DC32     Finfo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_20:
        DC32     `?<Constant "%c%c%c%c%c %u/%02u/%0...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_21:
        DC32     Lfname

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_22:
        DC32     `?<Constant "  %s\\n\\r">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_23:
        DC32     file_obj

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_24:
        DC32     Buff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_25:
        DC32     `?<Constant "\\n\\r%u bytes read with ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_26:
        DC32     `?<Constant " not found.\\n\\r">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_27:
        DC32     `?<Constant "\\n\\rDirectory ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_28:
        DC32     `?<Constant " does not exist !\\n\\r">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_29:
        DC32     `?<Constant " was created successf...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_30:
        DC32     `?<Constant " was not created.\\n\\r">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_31:
        DC32     `?<Constant " deleted! \\n\\r">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_32:
        DC32     `?<Constant "\\n\\rDelete file or dire...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_33:
        DC32     `?<Constant "Directory is not empt...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_34:
        DC32     SD_API_FILE_NOT_FOUND

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_35:
        DC32     `?<Constant "\\n\\rFile found and rena...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_36:
        DC32     `?<Constant "\\n\\rSource file does no...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_37:
        DC32     file_obj2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_38:
        DC32     `?<Constant "\\n\\rDestination file co...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_39:
        DC32     `?<Constant "\\n\\rCopying file ...\\n\\r">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_40:
        DC32     `?<Constant "\\n\\r%u bytes copied wit...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_41:
        DC32     `?<Constant "uptime.txt">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_42:
        DC32     `?<Constant "Uptime: %d Days, %d H...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_43:
        DC32     `?<Constant "\\n\\rUptime written !\\n\\r">`
//  964 
//  965 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  966 U8 file_name_verify(S8 *pname1,S8 *pname2, U8 *pfile, U8 num)
//  967 {
file_name_verify:
        PUSH     {R4-R7}
//  968    U8  i=0;
        MOVS     R4,#+0
//  969    U8  j=0;
        MOVS     R5,#+0
//  970    U8  number = num;
        MOVS     R6,R3
//  971    U8  test_caps = 0;
        MOVS     R12,#+0
//  972    U32 estado = NOME;   
        MOVS     R7,#+0
        B.N      ??file_name_verify_0
//  973 
//  974    while (num) 
//  975    {   
//  976      j=0;
//  977      i=0;
//  978      if(*pfile!=0x20) return API_FILENAME_ERROR; //verifica se foi digitado espa鏾 entre o comando e o nome do arquivo  
//  979      pfile++;         //incrementa endere鏾 do vetor de dados para iniciar a leitura do nome do arquivo que foi digitado          
//  980      
//  981      estado = NOME;   
//  982      while(estado!=FIM) //faz a leitura at?que chegue ao final do arquivo
//  983         {
//  984           switch(estado)
//  985             {
//  986               case NOME:   //estado inicial, come鏰 pelo nome do arquivo
//  987                 if(*pfile!='.')//faz a leitura do nome at?encontar o ponto ou o n鷐ero m醲imo de caracteres estourar
//  988                 {
//  989                    switch(*pfile)
//  990                    {
//  991                     case 0x5C:
//  992                     //case '/':
//  993                     case '?':
//  994                     case ':':
//  995                     case '*':
//  996                     case '"':
//  997                     case '>':
//  998                     case '<':
//  999                     case '|':
// 1000                     return API_FILENAME_ERROR;
// 1001                     break;
// 1002                     
// 1003                     default:
// 1004                     break;
// 1005                    }
// 1006                    
// 1007                    if (num == 1)*pname1=*pfile; //faz a leitura letra por letra
// 1008                    if (num == 2)*pname2=*pfile; //se existirem dois nomes de arquivo (caso rename) le o segundo arquivo ap髎 ler o primeiro 
// 1009                    pfile++;
// 1010                    if (num == 1) pname1++;
// 1011                    if (num == 2) pname2++;
// 1012                    i++;                   
// 1013                    
// 1014                    if(i>=60)//se o nome exceder o n鷐ero m醲imo de caracteres
// 1015                    {
// 1016                       return API_FILENAME_ERROR; 
// 1017                    }
// 1018                    
// 1019                    if ((number > 1) && (num == 2))
// 1020                    {
// 1021                       if(*pfile==0x20)
// 1022                       {
// 1023                         estado = FIM;
// 1024                       }
// 1025                    }
// 1026                    else
// 1027                    {
// 1028                       if(*pfile==0x20)
// 1029                       {
// 1030                         return API_FILENAME_ERROR; 
// 1031                       }                   
// 1032                    }
// 1033                                       
// 1034                    if(*pfile==0)
// 1035                    {
// 1036                       *pname1=*pfile;
// 1037                       *pname2=*pfile;
// 1038                       estado = FIM;
// 1039                    }                          
// 1040                 }
// 1041                 else //quando o ponto for encontrado e o nome estiver correto muda estado para ler a extens鉶 do arquivo
// 1042                 {
// 1043                      if (num == 1)*pname1=*pfile;
// 1044                      if (num == 2)*pname2=*pfile;
// 1045                      estado = EXTENSAO;
// 1046                      pfile++;
// 1047                      if (num == 1) pname1++;
// 1048                      if (num == 2) pname2++;
// 1049                      i++;                   
// 1050                 }
// 1051                 
// 1052               break;
// 1053                 
// 1054                 case EXTENSAO:
// 1055                   if((*pfile!=0x20)&&(*pfile!=0))//verifica se n鉶 existe espa鏾s ou caracteres incorretos
// 1056                   {
// 1057                     switch(*pfile)
// 1058                     {
// 1059                       case 0x5C:
// 1060                       //case '/':
// 1061                       case '?':
// 1062                       case ':':
// 1063                       case '*':
// 1064                       case '"':
// 1065                       case '>':
// 1066                       case '<':
// 1067                       case '|':
// 1068                         return API_FILENAME_ERROR;
// 1069                       break;
// 1070                     
// 1071                       default:
// 1072                       break;
// 1073                     }                                        
// 1074                     
// 1075                     if (num == 1)*pname1=*pfile;
// 1076                     if (num == 2)*pname2=*pfile;
// 1077                     pfile++;
// 1078                     if (num == 1) pname1++;
// 1079                     if (num == 2) pname2++;
// 1080                     j++; 
// 1081                     if(j>=4) //se a extens鉶 for maior do que tr阺 caracteres retorna erro
// 1082                     {
// 1083                       return API_FILENAME_ERROR; 
// 1084                     }
// 1085                   }
// 1086                   else
// 1087                   {
// 1088                     // Um arquivo pode n鉶 ter extens鉶 ou ter extens鉶 menor do que 3 caracteres
// 1089                     if(j)
// 1090                     {                      
// 1091                       if (number == 1)
// 1092                       {
// 1093                         if(*pfile==0x20)
// 1094                         {
// 1095                           return API_FILENAME_ERROR; 
// 1096                         }
// 1097                       }
// 1098                       estado = FIM; //vai para estado final
// 1099                     }
// 1100                     else
// 1101                     {
// 1102                       return API_FILENAME_ERROR; 
// 1103                     }
// 1104                      
// 1105                   }
// 1106                 break;
// 1107                 
// 1108                 default:
// 1109                 return API_FILENAME_ERROR;
// 1110                 break;
// 1111             }        
// 1112         }
// 1113         num--;// decrementa num e le o pr髕imo arquivo, se existir
??file_name_verify_1:
        SUBS     R3,R3,#+1
??file_name_verify_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.W    ??file_name_verify_2
        MOVS     R5,#+0
        MOVS     R4,#+0
        LDRB     R7,[R2, #+0]
        CMP      R7,#+32
        BEQ.N    ??file_name_verify_3
        MOVS     R0,#+130
        B.N      ??file_name_verify_4
??file_name_verify_3:
        ADDS     R2,R2,#+1
        MOVS     R7,#+0
        B.N      ??file_name_verify_5
??file_name_verify_6:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??file_name_verify_7
        LDRB     R7,[R2, #+0]
        STRB     R7,[R0, #+0]
??file_name_verify_7:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??file_name_verify_8
        LDRB     R7,[R2, #+0]
        STRB     R7,[R1, #+0]
??file_name_verify_8:
        MOVS     R7,#+1
        ADDS     R2,R2,#+1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??file_name_verify_9
        ADDS     R0,R0,#+1
??file_name_verify_9:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??file_name_verify_10
        ADDS     R1,R1,#+1
??file_name_verify_10:
        ADDS     R4,R4,#+1
??file_name_verify_11:
??file_name_verify_5:
        CMP      R7,#+2
        BEQ.N    ??file_name_verify_1
        CMP      R7,#+0
        BEQ.N    ??file_name_verify_12
        CMP      R7,#+1
        BEQ.N    ??file_name_verify_13
        B.N      ??file_name_verify_14
??file_name_verify_12:
        LDRB     R12,[R2, #+0]
        CMP      R12,#+46
        BEQ.N    ??file_name_verify_6
        LDRB     R12,[R2, #+0]
        CMP      R12,#+34
        BEQ.N    ??file_name_verify_15
        CMP      R12,#+42
        BEQ.N    ??file_name_verify_15
        CMP      R12,#+58
        BEQ.N    ??file_name_verify_15
        CMP      R12,#+60
        BEQ.N    ??file_name_verify_15
        CMP      R12,#+62
        BEQ.N    ??file_name_verify_15
        CMP      R12,#+63
        BEQ.N    ??file_name_verify_15
        CMP      R12,#+92
        BEQ.N    ??file_name_verify_15
        CMP      R12,#+124
        BNE.N    ??file_name_verify_16
??file_name_verify_15:
        MOVS     R0,#+130
        B.N      ??file_name_verify_4
??file_name_verify_16:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??file_name_verify_17
        LDRB     R12,[R2, #+0]
        STRB     R12,[R0, #+0]
??file_name_verify_17:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??file_name_verify_18
        LDRB     R12,[R2, #+0]
        STRB     R12,[R1, #+0]
??file_name_verify_18:
        ADDS     R2,R2,#+1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??file_name_verify_19
        ADDS     R0,R0,#+1
??file_name_verify_19:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??file_name_verify_20
        ADDS     R1,R1,#+1
??file_name_verify_20:
        ADDS     R4,R4,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+60
        BCC.N    ??file_name_verify_21
        MOVS     R0,#+130
        B.N      ??file_name_verify_4
??file_name_verify_21:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+2
        BCC.N    ??file_name_verify_22
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??file_name_verify_22
        LDRB     R12,[R2, #+0]
        CMP      R12,#+32
        BNE.N    ??file_name_verify_23
        MOVS     R7,#+2
??file_name_verify_23:
        LDRB     R12,[R2, #+0]
        CMP      R12,#+0
        BNE.N    ??file_name_verify_11
        LDRB     R7,[R2, #+0]
        STRB     R7,[R0, #+0]
        LDRB     R7,[R2, #+0]
        STRB     R7,[R1, #+0]
        MOVS     R7,#+2
        B.N      ??file_name_verify_11
??file_name_verify_22:
        LDRB     R12,[R2, #+0]
        CMP      R12,#+32
        BNE.N    ??file_name_verify_23
        MOVS     R0,#+130
        B.N      ??file_name_verify_4
??file_name_verify_13:
        LDRB     R12,[R2, #+0]
        CMP      R12,#+32
        BEQ.N    ??file_name_verify_24
        LDRB     R12,[R2, #+0]
        CMP      R12,#+0
        BEQ.N    ??file_name_verify_24
        LDRB     R12,[R2, #+0]
        CMP      R12,#+34
        BEQ.N    ??file_name_verify_25
        CMP      R12,#+42
        BEQ.N    ??file_name_verify_25
        CMP      R12,#+58
        BEQ.N    ??file_name_verify_25
        CMP      R12,#+60
        BEQ.N    ??file_name_verify_25
        CMP      R12,#+62
        BEQ.N    ??file_name_verify_25
        CMP      R12,#+63
        BEQ.N    ??file_name_verify_25
        CMP      R12,#+92
        BEQ.N    ??file_name_verify_25
        CMP      R12,#+124
        BNE.N    ??file_name_verify_26
??file_name_verify_25:
        MOVS     R0,#+130
        B.N      ??file_name_verify_4
??file_name_verify_26:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??file_name_verify_27
        LDRB     R12,[R2, #+0]
        STRB     R12,[R0, #+0]
??file_name_verify_27:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??file_name_verify_28
        LDRB     R12,[R2, #+0]
        STRB     R12,[R1, #+0]
??file_name_verify_28:
        ADDS     R2,R2,#+1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??file_name_verify_29
        ADDS     R0,R0,#+1
??file_name_verify_29:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??file_name_verify_30
        ADDS     R1,R1,#+1
??file_name_verify_30:
        ADDS     R5,R5,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BCC.N    ??file_name_verify_31
        MOVS     R0,#+130
        B.N      ??file_name_verify_4
??file_name_verify_24:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??file_name_verify_32
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??file_name_verify_33
        LDRB     R7,[R2, #+0]
        CMP      R7,#+32
        BNE.N    ??file_name_verify_33
        MOVS     R0,#+130
        B.N      ??file_name_verify_4
??file_name_verify_33:
        MOVS     R7,#+2
??file_name_verify_31:
        B.N      ??file_name_verify_5
??file_name_verify_32:
        MOVS     R0,#+130
        B.N      ??file_name_verify_4
??file_name_verify_14:
        MOVS     R0,#+130
        B.N      ??file_name_verify_4
// 1114    }
// 1115    
// 1116    return API_COMMAND_OK; //retorna leitura de aquivos correta
??file_name_verify_2:
        MOVS     R0,#+129
??file_name_verify_4:
        POP      {R4-R7}
        BX       LR               ;; return
// 1117 
// 1118 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rFile or directory n...">`:
        DATA
        DC8 "\012\015File or directory not found.\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rInvalid file or dir...">`:
        DATA
        DC8 "\012\015Invalid file or directory name.\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rSD card busy !!!\\n\\r">`:
        DATA
        DC8 "\012\015SD card busy !!!\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rSD card is not pres...">`:
        DATA
        DC8 "\012\015SD card is not present or not initialized !\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rSD card is already ...">`:
        DATA
        DC8 "\012\015SD card is already mounted!\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rSD card has been su...">`:
        DATA
        DC8 "\012\015SD card has been successfully initialized !!!\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rSDHC card has been ...">`:
        DATA
        DC8 0AH, 0DH, 53H, 44H, 48H, 43H, 20H, 63H
        DC8 61H, 72H, 64H, 20H, 68H, 61H, 73H, 20H
        DC8 62H, 65H, 65H, 6EH, 20H, 73H, 75H, 63H
        DC8 63H, 65H, 73H, 73H, 66H, 75H, 6CH, 6CH
        DC8 79H, 20H, 69H, 6EH, 69H, 74H, 69H, 61H
        DC8 6CH, 69H, 7AH, 65H, 64H, 20H, 21H, 21H
        DC8 21H, 0AH, 0DH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rFAT filesystem moun...">`:
        DATA
        DC8 "\012\015FAT filesystem mounted !!!\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rFailed to mount SD ...">`:
        DATA
        DC8 "\012\015Failed to mount SD card !\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rSD card failure !!!\\n\\r">`:
        DATA
        DC8 "\012\015SD card failure !!!\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rIt is safe to remov...">`:
        DATA
        DC8 "\012\015It is safe to remove the SD card!\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "."

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%c%c%c%c%c %u/%02u/%0...">`:
        DATA
        DC8 "%c%c%c%c%c %u/%02u/%02u %02u:%02u %9u  %s"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "  %s\\n\\r">`:
        DATA
        DC8 "  %s\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%4u File(s), %u bytes...">`:
        DATA
        DC8 "%4u File(s), %u bytes total \012\015%4u Dir(s)"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ", %u bytes free \\n\\r">`:
        DATA
        DC8 ", %u bytes free \012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\r%u bytes read with ...">`:
        DATA
        DC8 "\012\015%u bytes read with %u bytes/sec.\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " not found.\\n\\r">`:
        DATA
        DC8 " not found.\012\015"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rDirectory ">`:
        DATA
        DC8 "\012\015Directory "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " does not exist !\\n\\r">`:
        DATA
        DC8 " does not exist !\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " was created successf...">`:
        DATA
        DC8 " was created successfully.\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " was not created.\\n\\r">`:
        DATA
        DC8 " was not created.\012\015"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant " deleted! \\n\\r">`:
        DATA
        DC8 " deleted! \012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rDelete file or dire...">`:
        DATA
        DC8 "\012\015Delete file or directory denied.\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Directory is not empt...">`:
        DATA
        DC8 44H, 69H, 72H, 65H, 63H, 74H, 6FH, 72H
        DC8 79H, 20H, 69H, 73H, 20H, 6EH, 6FH, 74H
        DC8 20H, 65H, 6DH, 70H, 74H, 79H, 20H, 6FH
        DC8 72H, 20H, 66H, 69H, 6CH, 65H, 20H, 69H
        DC8 73H, 20H, 77H, 72H, 69H, 74H, 65H, 2DH
        DC8 70H, 72H, 6FH, 74H, 65H, 63H, 74H, 65H
        DC8 64H, 2EH, 0AH, 0DH, 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rFile found and rena...">`:
        DATA
        DC8 "\012\015File found and renamed !\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rSource file does no...">`:
        DATA
        DC8 "\012\015Source file does not exist !\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rDestination file co...">`:
        DATA
        DC8 0AH, 0DH, 44H, 65H, 73H, 74H, 69H, 6EH
        DC8 61H, 74H, 69H, 6FH, 6EH, 20H, 66H, 69H
        DC8 6CH, 65H, 20H, 63H, 6FH, 75H, 6CH, 64H
        DC8 20H, 6EH, 6FH, 74H, 20H, 62H, 65H, 20H
        DC8 63H, 72H, 65H, 61H, 74H, 65H, 64H, 20H
        DC8 6FH, 72H, 20H, 61H, 6CH, 72H, 65H, 61H
        DC8 64H, 79H, 20H, 65H, 78H, 69H, 73H, 74H
        DC8 20H, 21H, 0AH, 0DH, 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rCopying file ...\\n\\r">`:
        DATA
        DC8 "\012\015Copying file ...\012\015"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\r%u bytes copied wit...">`:
        DATA
        DC8 "\012\015%u bytes copied with %u bytes/sec.\012\015"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "uptime.txt">`:
        DATA
        DC8 "uptime.txt"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Uptime: %d Days, %d H...">`:
        DATA
        DC8 55H, 70H, 74H, 69H, 6DH, 65H, 3AH, 20H
        DC8 25H, 64H, 20H, 44H, 61H, 79H, 73H, 2CH
        DC8 20H, 25H, 64H, 20H, 48H, 6FH, 75H, 72H
        DC8 73H, 2CH, 20H, 25H, 64H, 20H, 6DH, 69H
        DC8 6EH, 75H, 74H, 65H, 73H, 20H, 61H, 6EH
        DC8 64H, 20H, 25H, 64H, 20H, 73H, 65H, 63H
        DC8 6FH, 6EH, 64H, 73H, 20H, 0AH, 0DH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\n\\rUptime written !\\n\\r">`:
        DATA
        DC8 "\012\015Uptime written !\012\015"
        DC8 0, 0, 0

        END
// 1119 
// 1120 
// 1121 
// 1122 
// 1123 /*INT8U OpenBmp(D4D_POINT* ppt, const D4D_BMP* pBmp, D4D_BOOL greyScale)
// 1124 {
// 1125   INT32U           p1, p2, s2;
// 1126   INT16U           cnt = 0;
// 1127   INT16U           i = 0;
// 1128   INT8U            sd_status = 0;
// 1129   D4D_BMP_states   bmp_state = BMP_HEADER;  
// 1130   CHAR8            *FileName;
// 1131   
// 1132   FileName = (CHAR8*)pBmp->pParam;
// 1133   
// 1134   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
// 1135   {
// 1136     #if (SD_FAT_MUTEX_EN == 1)
// 1137       OSMutexAcquire(SDCardResource);
// 1138     #endif
// 1139     
// 1140     if (sd_command == SD_INACTIVE)
// 1141     {    
// 1142       sd_command = SD_FILE_READING;
// 1143       
// 1144       if (f_open(&file_obj, FileName, 	FA_READ) == FR_OK)
// 1145       {  
// 1146 				p2 = 0;
// 1147 				p1 = f_size(&file_obj);
// 1148         
// 1149 				while (p1) 
// 1150 				{
// 1151 					if (p1 >= sizeof(Buff))	
// 1152 					{
// 1153 					  cnt = sizeof(Buff);
// 1154 					  p1 -= sizeof(Buff);
// 1155 					}
// 1156 					else 			
// 1157 					{
// 1158 					  cnt = (INT16U)p1;
// 1159 					  p1 = 0;
// 1160 					}
// 1161 					if (f_read(&file_obj, Buff, cnt, (UINT*)&s2) != FR_OK)
// 1162 					{
// 1163 					  break;
// 1164 					}else
// 1165 					{
// 1166 						p2 += s2;
// 1167 						if (cnt != s2) break;
// 1168   					                					
// 1169 						// Align problem on kinetis MCU						
// 1170 						BmpFile = *(BMP_FILE*)Buff;
// 1171 							
// 1172 						#if PSP_ENDIAN == BRTOS_LITTLE_ENDIAN
// 1173 							//BmpFile.bfsize          = (INT16U)((Buff[3] << 8) + Buff[2]);
// 1174 							//BmpFile.bfoffsetbits    = (INT32U)((Buff[13] << 24) + (Buff[12] << 16) + (Buff[11] << 8) + Buff[10]);
// 1175 							//BmpFile.size            = (INT32U)((Buff[17] << 24) + (Buff[16] << 16) + (Buff[15] << 8) + Buff[14]);
// 1176 							//BmpFile.width           = (INT32U)((Buff[21] << 24) + (Buff[20] << 16) + (Buff[19] << 8) + Buff[18]);
// 1177 							//BmpFile.height          = (INT32U)((Buff[25] << 24) + (Buff[24] << 16) + (Buff[23] << 8) + Buff[22]);
// 1178 							//BmpFile.planes          = (INT16U)((Buff[27] << 8) + Buff[26]);
// 1179 							//BmpFile.bitcount        = (INT16U)((Buff[29] << 8) + Buff[28]);
// 1180 							//BmpFile.compression     = (INT32U)((Buff[33] << 24) + (Buff[32] << 16) + (Buff[31] << 8) + Buff[30]);
// 1181 							//BmpFile.sizeimage       = (INT32U)((Buff[37] << 24) + (Buff[36] << 16) + (Buff[35] << 8) + Buff[34]);						
// 1182 						#else
// 1183 							BmpFile.bfsize          = LWordSwap(BmpFile.bfsize);
// 1184 							BmpFile.bfoffsetbits    = LWordSwap(BmpFile.bfoffsetbits);
// 1185 							BmpFile.size            = LWordSwap(BmpFile.size);
// 1186 							BmpFile.width           = LWordSwap(BmpFile.width);
// 1187 							BmpFile.height          = LWordSwap(BmpFile.height);
// 1188 							BmpFile.planes          = ByteSwap(BmpFile.planes);
// 1189 							BmpFile.bitcount        = ByteSwap(BmpFile.bitcount);
// 1190 							BmpFile.compression     = LWordSwap(BmpFile.compression);
// 1191 							BmpFile.sizeimage       = LWordSwap(BmpFile.sizeimage);
// 1192 							BmpFile.colorsused      = LWordSwap(BmpFile.colorsused);
// 1193 							BmpFile.colorsimportant = LWordSwap(BmpFile.colorsimportant);						
// 1194 						#endif
// 1195 											
// 1196 						break;
// 1197 					}
// 1198 				}
// 1199 				
// 1200 				f_close(&file_obj);
// 1201         
// 1202 				D4D_DrawBmpFromFileSystem(ppt, pBmp, greyScale, &BmpFile, Buff);
// 1203         
// 1204         //Sets these variables to inactive states
// 1205         sd_command = SD_INACTIVE;                
// 1206         
// 1207         #if (SD_FAT_MUTEX_EN == 1)
// 1208           OSMutexRelease(SDCardResource);
// 1209         #endif        
// 1210         
// 1211         return SD_FILE_READ;
// 1212       } 
// 1213       else
// 1214       {               
// 1215         sd_command = SD_INACTIVE;
// 1216       
// 1217         #if (SD_FAT_MUTEX_EN == 1)
// 1218           OSMutexRelease(SDCardResource);
// 1219         #endif        
// 1220         
// 1221         return SD_FILE_NOT_FOUND;
// 1222       }
// 1223     }
// 1224     else
// 1225     {
// 1226       #if (SD_FAT_MUTEX_EN == 1)
// 1227         OSMutexRelease(SDCardResource);
// 1228       #endif      
// 1229 
// 1230       return SD_BUSY;
// 1231     }
// 1232   }
// 1233   else
// 1234   {
// 1235       return SD_FAT_ERROR;
// 1236   }
// 1237 }
// 1238 
// 1239 CopyCalibValue(INT16U *calib, INT16U *index, INT8U value)
// 1240 {
// 1241 	INT16U i = 0;
// 1242 	switch(*index)
// 1243 	{
// 1244 		case 0:
// 1245 			if ((value >= 48) && (value <= 57))
// 1246 			{
// 1247 				i = 10000 * (value-48);
// 1248 			}
// 1249 			break;			
// 1250 		case 1:
// 1251 			if ((value >= 48) && (value <= 57))
// 1252 			{			
// 1253 				i = 1000 * (value-48);
// 1254 			}
// 1255 			break;
// 1256 		case 2:
// 1257 			if ((value >= 48) && (value <= 57))
// 1258 			{			
// 1259 				i = 100 * (value-48);
// 1260 			}
// 1261 			break;
// 1262 		case 3:
// 1263 			if ((value >= 48) && (value <= 57))
// 1264 			{			
// 1265 				i = 10 * (value-48);
// 1266 			}
// 1267 			break;
// 1268 			
// 1269 		case 4:
// 1270 			if ((value >= 48) && (value <= 57))
// 1271 			{			
// 1272 				i = (value-48);
// 1273 			}
// 1274 			break;			
// 1275 	}
// 1276 	
// 1277 	*calib += i;
// 1278 }
// 1279 
// 1280 
// 1281 
// 1282 INT8U ReadCalibrationFile(CHAR8 *FileName, D4D_TOUCHSCREEN_CALIB *d4d_tch)
// 1283 {
// 1284 	INT32U  p1, p2, s2;
// 1285 	INT16U  cnt = 0;
// 1286 	INT16U  i = 0;
// 1287 	INT16U  j = 0;
// 1288 	INT16U  k = 0;
// 1289 	INT16U  value = 0;
// 1290     INT8U   sd_status = 0;
// 1291   
// 1292   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
// 1293   {
// 1294     #if (SD_FAT_MUTEX_EN == 1)
// 1295       OSMutexAcquire(SDCardResource);
// 1296     #endif
// 1297     
// 1298     if (sd_command == SD_INACTIVE)
// 1299     {    
// 1300       sd_command = SD_FILE_READING;
// 1301       
// 1302       if (f_open(&file_obj, (CHAR8*)FileName, 	FA_READ) == FR_OK)
// 1303       {          
// 1304 		p2 = 0;  			     
// 1305 		p1 = f_size(&file_obj);
// 1306         
// 1307 		while (p1) 
// 1308 		{
// 1309 			if (p1 >= sizeof(Buff))	
// 1310 			{ 
// 1311 			  cnt = sizeof(Buff);
// 1312 			  p1 -= sizeof(Buff);
// 1313 			}
// 1314 			else 			
// 1315 			{
// 1316 			  cnt = (INT16U)p1;
// 1317 			  p1 = 0;
// 1318 			}
// 1319 			if (f_read(&file_obj, (CHAR8*)Buff, cnt, (UINT*)&s2) != FR_OK)
// 1320 			{
// 1321 			  break;
// 1322 			}else
// 1323 			{
// 1324 			p2 += s2;
// 1325 			if (cnt != s2) break;			
// 1326 								
// 1327 			for(i=0;i<cnt;i++)
// 1328 			{
// 1329 				if (Buff[i] == ',')
// 1330 				{
// 1331 					j++;
// 1332 					k = 0;
// 1333 				}else
// 1334 				{
// 1335 					switch(j)
// 1336 					{
// 1337 						case 0:
// 1338 							CopyCalibValue(&d4d_tch->TouchScreenXoffset, &k, Buff[i]);
// 1339 							k++;
// 1340 							break;
// 1341 							
// 1342 						case 1:
// 1343 							CopyCalibValue(&d4d_tch->TouchScreenYoffset, &k, Buff[i]);
// 1344 							k++;
// 1345 							break;
// 1346 							
// 1347 						case 2:
// 1348 							CopyCalibValue(&d4d_tch->TouchScreenXBitsPerPixelx16, &k, Buff[i]);
// 1349 							k++;
// 1350 							break;						
// 1351 						
// 1352 						case 3:
// 1353 							CopyCalibValue(&d4d_tch->TouchScreenYBitsPerPixelx16, &k, Buff[i]);
// 1354 							k++;
// 1355 							break;
// 1356 							
// 1357 						default:
// 1358 							break;						
// 1359 					}
// 1360 				}
// 1361 			}
// 1362 		 }
// 1363 		}
// 1364 		
// 1365         f_close(&file_obj);
// 1366         
// 1367         //Sets these variables to inactive states
// 1368         sd_command = SD_INACTIVE;                       
// 1369         
// 1370         #if (SD_FAT_MUTEX_EN == 1)
// 1371           OSMutexRelease(SDCardResource);
// 1372         #endif        
// 1373         
// 1374         if (k <= 5)
// 1375         {
// 1376           return SD_FILE_READ;
// 1377         }else
// 1378         {
// 1379           return SD_FILE_NOT_FOUND;	
// 1380         }
// 1381       } 
// 1382       else
// 1383       {               
// 1384         sd_command = SD_INACTIVE;
// 1385         
// 1386         #if (SD_FAT_MUTEX_EN == 1)
// 1387           OSMutexRelease(SDCardResource);
// 1388         #endif
// 1389         
// 1390         return SD_FILE_NOT_FOUND;
// 1391       }
// 1392     }
// 1393     else
// 1394     {
// 1395       #if (SD_FAT_MUTEX_EN == 1)
// 1396         OSMutexRelease(SDCardResource);
// 1397       #endif                        
// 1398       
// 1399       return SD_BUSY;      
// 1400     }
// 1401   }
// 1402   else
// 1403   {
// 1404       return SD_FAT_ERROR;
// 1405   }
// 1406 }
// 1407 
// 1408 
// 1409 INT8U WriteCalibrationFile(D4D_TOUCHSCREEN_CALIB *d4d_tch)
// 1410 {
// 1411   INT8U  sd_status = 0;   
// 1412   
// 1413   if ((GetCardStat() & STA_NOINIT) != STA_NOINIT)
// 1414   {
// 1415     #if (SD_FAT_MUTEX_EN == 1)
// 1416       OSMutexAcquire(SDCardResource);
// 1417     #endif
// 1418 
// 1419     if (sd_command == SD_INACTIVE)
// 1420     {    
// 1421         sd_command = SD_FILE_WRITING;
// 1422         
// 1423         if (f_open(&file_obj, "calib.txt", 	FA_WRITE) == FR_NO_FILE)
// 1424         {     
// 1425           f_open(&file_obj, "calib.txt", 	FA_CREATE_NEW); 
// 1426           f_open(&file_obj, "calib.txt", 	FA_WRITE);
// 1427         }
// 1428         f_lseek(&file_obj,f_size(&file_obj));        
// 1429         
// 1430         f_printf(&file_obj, "%05u,%05u,%05u,%05u", d4d_tch->TouchScreenXoffset, d4d_tch->TouchScreenYoffset, d4d_tch->TouchScreenXBitsPerPixelx16,d4d_tch->TouchScreenYBitsPerPixelx16);  
// 1431         f_close(&file_obj);
// 1432         
// 1433         sd_command = SD_INACTIVE;
// 1434         
// 1435         #if (SD_FAT_MUTEX_EN == 1)
// 1436           OSMutexRelease(SDCardResource);
// 1437         #endif                
// 1438         
// 1439         return SD_FILE_WRITTEN;
// 1440     }
// 1441     else
// 1442     {
// 1443       #if (SD_FAT_MUTEX_EN == 1)
// 1444         OSMutexRelease(SDCardResource);
// 1445       #endif      
// 1446 
// 1447       return SD_BUSY;
// 1448     }
// 1449   }
// 1450   else
// 1451   {
// 1452       return SD_FAT_ERROR;
// 1453   }
// 1454 }
// 1455 */
// 
// 2 564 bytes in section .bss
//    17 bytes in section .data
// 1 074 bytes in section .rodata
// 3 114 bytes in section .text
// 
// 3 114 bytes of CODE  memory
// 1 074 bytes of CONST memory
// 2 581 bytes of DATA  memory
//
//Errors: none
//Warnings: 11
