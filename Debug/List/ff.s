///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    13/Mar/2015  12:44:24 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Administrator\Desktop\3.11换结构BLOCK nd       /
//                    black\common\ff.c                                       /
//    Command line =  "C:\Users\Administrator\Desktop\3.11换结构BLOCK nd      /
//                    black\common\ff.c" -D DEBUG -lCN                        /
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
//                    black\Debug\List\ff.s                                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ff

        #define SHT_PROGBITS 0x1

        EXTERN disk_initialize
        EXTERN disk_ioctl
        EXTERN disk_read
        EXTERN disk_status
        EXTERN disk_write
        EXTERN ff_convert
        EXTERN ff_wtoupper
        EXTERN get_fattime

        PUBLIC clust2sect
        PUBLIC f_chdir
        PUBLIC f_chdrive
        PUBLIC f_chmod
        PUBLIC f_close
        PUBLIC f_getfree
        PUBLIC f_gets
        PUBLIC f_lseek
        PUBLIC f_mkdir
        PUBLIC f_mount
        PUBLIC f_open
        PUBLIC f_opendir
        PUBLIC f_printf
        PUBLIC f_putc
        PUBLIC f_puts
        PUBLIC f_read
        PUBLIC f_readdir
        PUBLIC f_rename
        PUBLIC f_stat
        PUBLIC f_sync
        PUBLIC f_truncate
        PUBLIC f_unlink
        PUBLIC f_utime
        PUBLIC f_write
        PUBLIC gen_numname
        PUBLIC get_fat
        PUBLIC put_fat

// C:\Users\Administrator\Desktop\3.11换结构BLOCK nd  black\common\ff.c
//    1 /*----------------------------------------------------------------------------/
//    2 /  FatFs - FAT file system module  R0.08b                 (C)ChaN, 2011
//    3 /-----------------------------------------------------------------------------/
//    4 / FatFs module is a generic FAT file system module for small embedded systems.
//    5 / This is a free software that opened for education, research and commercial
//    6 / developments under license policy of following terms.
//    7 /
//    8 /  Copyright (C) 2011, ChaN, all right reserved.
//    9 /
//   10 / * The FatFs module is a free software and there is NO WARRANTY.
//   11 / * No restriction on use. You can use, modify and redistribute it for
//   12 /   personal, non-profit or commercial products UNDER YOUR RESPONSIBILITY.
//   13 / * Redistributions of source code must retain the above copyright notice.
//   14 /
//   15 /-----------------------------------------------------------------------------/
//   16 / Feb 26,'06 R0.00  Prototype.
//   17 /
//   18 / Apr 29,'06 R0.01  First stable version.
//   19 /
//   20 / Jun 01,'06 R0.02  Added FAT12 support.
//   21 /                   Removed unbuffered mode.
//   22 /                   Fixed a problem on small (<32M) partition.
//   23 / Jun 10,'06 R0.02a Added a configuration option (_FS_MINIMUM).
//   24 /
//   25 / Sep 22,'06 R0.03  Added f_rename().
//   26 /                   Changed option _FS_MINIMUM to _FS_MINIMIZE.
//   27 / Dec 11,'06 R0.03a Improved cluster scan algorithm to write files fast.
//   28 /                   Fixed f_mkdir() creates incorrect directory on FAT32.
//   29 /
//   30 / Feb 04,'07 R0.04  Supported multiple drive system.
//   31 /                   Changed some interfaces for multiple drive system.
//   32 /                   Changed f_mountdrv() to f_mount().
//   33 /                   Added f_mkfs().
//   34 / Apr 01,'07 R0.04a Supported multiple partitions on a physical drive.
//   35 /                   Added a capability of extending file size to f_lseek().
//   36 /                   Added minimization level 3.
//   37 /                   Fixed an endian sensitive code in f_mkfs().
//   38 / May 05,'07 R0.04b Added a configuration option _USE_NTFLAG.
//   39 /                   Added FSInfo support.
//   40 /                   Fixed DBCS name can result FR_INVALID_NAME.
//   41 /                   Fixed short seek (<= csize) collapses the file object.
//   42 /
//   43 / Aug 25,'07 R0.05  Changed arguments of f_read(), f_write() and f_mkfs().
//   44 /                   Fixed f_mkfs() on FAT32 creates incorrect FSInfo.
//   45 /                   Fixed f_mkdir() on FAT32 creates incorrect directory.
//   46 / Feb 03,'08 R0.05a Added f_truncate() and f_utime().
//   47 /                   Fixed off by one error at FAT sub-type determination.
//   48 /                   Fixed btr in f_read() can be mistruncated.
//   49 /                   Fixed cached sector is not flushed when create and close without write.
//   50 /
//   51 / Apr 01,'08 R0.06  Added fputc(), fputs(), fprintf() and fgets().
//   52 /                   Improved performance of f_lseek() on moving to the same or following cluster.
//   53 /
//   54 / Apr 01,'09 R0.07  Merged Tiny-FatFs as a configuration option. (_FS_TINY)
//   55 /                   Added long file name feature.
//   56 /                   Added multiple code page feature.
//   57 /                   Added re-entrancy for multitask operation.
//   58 /                   Added auto cluster size selection to f_mkfs().
//   59 /                   Added rewind option to f_readdir().
//   60 /                   Changed result code of critical errors.
//   61 /                   Renamed string functions to avoid name collision.
//   62 / Apr 14,'09 R0.07a Separated out OS dependent code on reentrant cfg.
//   63 /                   Added multiple sector size feature.
//   64 / Jun 21,'09 R0.07c Fixed f_unlink() can return FR_OK on error.
//   65 /                   Fixed wrong cache control in f_lseek().
//   66 /                   Added relative path feature.
//   67 /                   Added f_chdir() and f_chdrive().
//   68 /                   Added proper case conversion to extended char.
//   69 / Nov 03,'09 R0.07e Separated out configuration options from ff.h to ffconf.h.
//   70 /                   Fixed f_unlink() fails to remove a sub-dir on _FS_RPATH.
//   71 /                   Fixed name matching error on the 13 char boundary.
//   72 /                   Added a configuration option, _LFN_UNICODE.
//   73 /                   Changed f_readdir() to return the SFN with always upper case on non-LFN cfg.
//   74 /
//   75 / May 15,'10 R0.08  Added a memory configuration option. (_USE_LFN = 3)
//   76 /                   Added file lock feature. (_FS_SHARE)
//   77 /                   Added fast seek feature. (_USE_FASTSEEK)
//   78 /                   Changed some types on the API, XCHAR->TCHAR.
//   79 /                   Changed fname member in the FILINFO structure on Unicode cfg.
//   80 /                   String functions support UTF-8 encoding files on Unicode cfg.
//   81 / Aug 16,'10 R0.08a Added f_getcwd(). (_FS_RPATH = 2)
//   82 /                   Added sector erase feature. (_USE_ERASE)
//   83 /                   Moved file lock semaphore table from fs object to the bss.
//   84 /                   Fixed a wrong directory entry is created on non-LFN cfg when the given name contains ';'.
//   85 /                   Fixed f_mkfs() creates wrong FAT32 volume.
//   86 / Jan 15,'11 R0.08b Fast seek feature is also applied to f_read() and f_write().
//   87 /                   f_lseek() reports required table size on creating CLMP.
//   88 /                   Extended format syntax of f_printf function.
//   89 /                   Ignores duplicated directory separators in given path names.
//   90 /---------------------------------------------------------------------------*/
//   91 
//   92 #pragma warn_implicitconv off
//   93 
//   94 #include "..\K60_datatype.h"			/* FatFs configurations and declarations */
//   95 
//   96 
//   97 /*--------------------------------------------------------------------------
//   98 
//   99    Module Private Definitions
//  100 
//  101 ---------------------------------------------------------------------------*/
//  102 
//  103 #if _FATFS != 8237
//  104 #error Wrong include file (ff.h).
//  105 #endif
//  106 
//  107 
//  108 /* Definitions on sector size */
//  109 #if _MAX_SS != 512 && _MAX_SS != 1024 && _MAX_SS != 2048 && _MAX_SS != 4096
//  110 #error Wrong sector size.
//  111 #endif
//  112 #if _MAX_SS != 512
//  113 #define	SS(fs)	((fs)->ssize)	/* Multiple sector size */
//  114 #else
//  115 #define	SS(fs)	512U			/* Fixed sector size */
//  116 #endif
//  117 
//  118 
//  119 /* Reentrancy related */
//  120 #if _FS_REENTRANT
//  121 #if _USE_LFN == 1
//  122 #error Static LFN work area must not be used in re-entrant configuration.
//  123 #endif
//  124 #define	ENTER_FF(fs)		{ if (!lock_fs(fs)) return FR_TIMEOUT; }
//  125 #define	LEAVE_FF(fs, res)	{ unlock_fs(fs, res); return res; }
//  126 #else
//  127 #define	ENTER_FF(fs)
//  128 #define LEAVE_FF(fs, res)	return res
//  129 #endif
//  130 
//  131 #define	ABORT(fs, res)		{ fp->flag |= FA__ERROR; LEAVE_FF(fs, res); }
//  132 
//  133 
//  134 /* File shareing feature */
//  135 #if _FS_SHARE
//  136 #if _FS_READONLY
//  137 #error _FS_SHARE must be 0 on read-only cfg.
//  138 #endif
//  139 typedef struct {
//  140 	FATFS *fs;				/* File ID 1, volume (NULL:blank entry) */
//  141 	DWORD clu;				/* File ID 2, directory */
//  142 	WORD idx;				/* File ID 3, directory index */
//  143 	WORD ctr;				/* File open counter, 0:none, 0x01..0xFF:read open count, 0x100:write mode */
//  144 } FILESEM;
//  145 #endif
//  146 
//  147 
//  148 /* Misc definitions */
//  149 #define LD_CLUST(dir)	(((DWORD)LD_WORD(dir+DIR_FstClusHI)<<16) | LD_WORD(dir+DIR_FstClusLO))
//  150 #define ST_CLUST(dir,cl) {ST_WORD(dir+DIR_FstClusLO, cl); ST_WORD(dir+DIR_FstClusHI, (DWORD)cl>>16);}
//  151 
//  152 
//  153 /* DBCS code ranges and SBCS extend char conversion table */
//  154 
//  155 #if _CODE_PAGE == 932	/* Japanese Shift-JIS */
//  156 #define _DF1S	0x81	/* DBC 1st byte range 1 start */
//  157 #define _DF1E	0x9F	/* DBC 1st byte range 1 end */
//  158 #define _DF2S	0xE0	/* DBC 1st byte range 2 start */
//  159 #define _DF2E	0xFC	/* DBC 1st byte range 2 end */
//  160 #define _DS1S	0x40	/* DBC 2nd byte range 1 start */
//  161 #define _DS1E	0x7E	/* DBC 2nd byte range 1 end */
//  162 #define _DS2S	0x80	/* DBC 2nd byte range 2 start */
//  163 #define _DS2E	0xFC	/* DBC 2nd byte range 2 end */
//  164 
//  165 #elif _CODE_PAGE == 936	/* Simplified Chinese GBK */
//  166 #define _DF1S	0x81
//  167 #define _DF1E	0xFE
//  168 #define _DS1S	0x40
//  169 #define _DS1E	0x7E
//  170 #define _DS2S	0x80
//  171 #define _DS2E	0xFE
//  172 
//  173 #elif _CODE_PAGE == 949	/* Korean */
//  174 #define _DF1S	0x81
//  175 #define _DF1E	0xFE
//  176 #define _DS1S	0x41
//  177 #define _DS1E	0x5A
//  178 #define _DS2S	0x61
//  179 #define _DS2E	0x7A
//  180 #define _DS3S	0x81
//  181 #define _DS3E	0xFE
//  182 
//  183 #elif _CODE_PAGE == 950	/* Traditional Chinese Big5 */
//  184 #define _DF1S	0x81
//  185 #define _DF1E	0xFE
//  186 #define _DS1S	0x40
//  187 #define _DS1E	0x7E
//  188 #define _DS2S	0xA1
//  189 #define _DS2E	0xFE
//  190 
//  191 #elif _CODE_PAGE == 437	/* U.S. (OEM) */
//  192 #define _DF1S	0
//  193 #define _EXCVT {0x80,0x9A,0x90,0x41,0x8E,0x41,0x8F,0x80,0x45,0x45,0x45,0x49,0x49,0x49,0x8E,0x8F,0x90,0x92,0x92,0x4F,0x99,0x4F,0x55,0x55,0x59,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  194 				0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  195 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  196 				0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  197 
//  198 #elif _CODE_PAGE == 720	/* Arabic (OEM) */
//  199 #define _DF1S	0
//  200 #define _EXCVT {0x80,0x81,0x45,0x41,0x84,0x41,0x86,0x43,0x45,0x45,0x45,0x49,0x49,0x8D,0x8E,0x8F,0x90,0x92,0x92,0x93,0x94,0x95,0x49,0x49,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  201 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  202 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  203 				0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  204 
//  205 #elif _CODE_PAGE == 737	/* Greek (OEM) */
//  206 #define _DF1S	0
//  207 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x92,0x92,0x93,0x94,0x95,0x96,0x97,0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87, \ 
//  208 				0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0xAA,0x92,0x93,0x94,0x95,0x96,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  209 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  210 				0x97,0xEA,0xEB,0xEC,0xE4,0xED,0xEE,0xE7,0xE8,0xF1,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  211 
//  212 #elif _CODE_PAGE == 775	/* Baltic (OEM) */
//  213 #define _DF1S	0
//  214 #define _EXCVT {0x80,0x9A,0x91,0xA0,0x8E,0x95,0x8F,0x80,0xAD,0xED,0x8A,0x8A,0xA1,0x8D,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0x95,0x96,0x97,0x97,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  215 				0xA0,0xA1,0xE0,0xA3,0xA3,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  216 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xB5,0xB6,0xB7,0xB8,0xBD,0xBE,0xC6,0xC7,0xA5,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  217 				0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE3,0xE8,0xE8,0xEA,0xEA,0xEE,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  218 
//  219 #elif _CODE_PAGE == 850	/* Multilingual Latin 1 (OEM) */
//  220 #define _DF1S	0
//  221 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0xDE,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x59,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  222 				0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  223 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  224 				0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE7,0xE9,0xEA,0xEB,0xED,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  225 
//  226 #elif _CODE_PAGE == 852	/* Latin 2 (OEM) */
//  227 #define _DF1S	0
//  228 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xDE,0x8F,0x80,0x9D,0xD3,0x8A,0x8A,0xD7,0x8D,0x8E,0x8F,0x90,0x91,0x91,0xE2,0x99,0x95,0x95,0x97,0x97,0x99,0x9A,0x9B,0x9B,0x9D,0x9E,0x9F, \ 
//  229 				0xB5,0xD6,0xE0,0xE9,0xA4,0xA4,0xA6,0xA6,0xA8,0xA8,0xAA,0x8D,0xAC,0xB8,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBD,0xBF, \ 
//  230 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC6,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD2,0xD3,0xD2,0xD5,0xD6,0xD7,0xB7,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  231 				0xE0,0xE1,0xE2,0xE3,0xE3,0xD5,0xE6,0xE6,0xE8,0xE9,0xE8,0xEB,0xED,0xED,0xDD,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xEB,0xFC,0xFC,0xFE,0xFF}
//  232 
//  233 #elif _CODE_PAGE == 855	/* Cyrillic (OEM) */
//  234 #define _DF1S	0
//  235 #define _EXCVT {0x81,0x81,0x83,0x83,0x85,0x85,0x87,0x87,0x89,0x89,0x8B,0x8B,0x8D,0x8D,0x8F,0x8F,0x91,0x91,0x93,0x93,0x95,0x95,0x97,0x97,0x99,0x99,0x9B,0x9B,0x9D,0x9D,0x9F,0x9F, \ 
//  236 				0xA1,0xA1,0xA3,0xA3,0xA5,0xA5,0xA7,0xA7,0xA9,0xA9,0xAB,0xAB,0xAD,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB6,0xB6,0xB8,0xB8,0xB9,0xBA,0xBB,0xBC,0xBE,0xBE,0xBF, \ 
//  237 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD3,0xD3,0xD5,0xD5,0xD7,0xD7,0xDD,0xD9,0xDA,0xDB,0xDC,0xDD,0xE0,0xDF, \ 
//  238 				0xE0,0xE2,0xE2,0xE4,0xE4,0xE6,0xE6,0xE8,0xE8,0xEA,0xEA,0xEC,0xEC,0xEE,0xEE,0xEF,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF8,0xFA,0xFA,0xFC,0xFC,0xFD,0xFE,0xFF}
//  239 
//  240 #elif _CODE_PAGE == 857	/* Turkish (OEM) */
//  241 #define _DF1S	0
//  242 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0x98,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x98,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9E, \ 
//  243 				0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA6,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  244 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  245 				0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xDE,0x59,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  246 
//  247 #elif _CODE_PAGE == 858	/* Multilingual Latin 1 + Euro (OEM) */
//  248 #define _DF1S	0
//  249 #define _EXCVT {0x80,0x9A,0x90,0xB6,0x8E,0xB7,0x8F,0x80,0xD2,0xD3,0xD4,0xD8,0xD7,0xDE,0x8E,0x8F,0x90,0x92,0x92,0xE2,0x99,0xE3,0xEA,0xEB,0x59,0x99,0x9A,0x9D,0x9C,0x9D,0x9E,0x9F, \ 
//  250 				0xB5,0xD6,0xE0,0xE9,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  251 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC7,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD1,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  252 				0xE0,0xE1,0xE2,0xE3,0xE5,0xE5,0xE6,0xE7,0xE7,0xE9,0xEA,0xEB,0xED,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  253 
//  254 #elif _CODE_PAGE == 862	/* Hebrew (OEM) */
//  255 #define _DF1S	0
//  256 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  257 				0x41,0x49,0x4F,0x55,0xA5,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0x21,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  258 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  259 				0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  260 
//  261 #elif _CODE_PAGE == 866	/* Russian (OEM) */
//  262 #define _DF1S	0
//  263 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  264 				0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  265 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  266 				0x90,0x91,0x92,0x93,0x9d,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F,0xF0,0xF0,0xF2,0xF2,0xF4,0xF4,0xF6,0xF6,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  267 
//  268 #elif _CODE_PAGE == 874	/* Thai (OEM, Windows) */
//  269 #define _DF1S	0
//  270 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  271 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  272 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  273 				0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  274 
//  275 #elif _CODE_PAGE == 1250 /* Central Europe (Windows) */
//  276 #define _DF1S	0
//  277 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x8D,0x8E,0x8F, \ 
//  278 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xA3,0xB4,0xB5,0xB6,0xB7,0xB8,0xA5,0xAA,0xBB,0xBC,0xBD,0xBC,0xAF, \ 
//  279 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  280 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xFF}
//  281 
//  282 #elif _CODE_PAGE == 1251 /* Cyrillic (Windows) */
//  283 #define _DF1S	0
//  284 #define _EXCVT {0x80,0x81,0x82,0x82,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x80,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x8D,0x8E,0x8F, \ 
//  285 				0xA0,0xA2,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB2,0xA5,0xB5,0xB6,0xB7,0xA8,0xB9,0xAA,0xBB,0xA3,0xBD,0xBD,0xAF, \ 
//  286 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  287 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF}
//  288 
//  289 #elif _CODE_PAGE == 1252 /* Latin 1 (Windows) */
//  290 #define _DF1S	0
//  291 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0xAd,0x9B,0x8C,0x9D,0xAE,0x9F, \ 
//  292 				0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  293 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  294 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0x9F}
//  295 
//  296 #elif _CODE_PAGE == 1253 /* Greek (Windows) */
//  297 #define _DF1S	0
//  298 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  299 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  300 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xA2,0xB8,0xB9,0xBA, \ 
//  301 				0xE0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xF2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xFB,0xBC,0xFD,0xBF,0xFF}
//  302 
//  303 #elif _CODE_PAGE == 1254 /* Turkish (Windows) */
//  304 #define _DF1S	0
//  305 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x8A,0x9B,0x8C,0x9D,0x9E,0x9F, \ 
//  306 				0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  307 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  308 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0x9F}
//  309 
//  310 #elif _CODE_PAGE == 1255 /* Hebrew (Windows) */
//  311 #define _DF1S	0
//  312 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  313 				0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  314 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  315 				0xE0,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xEB,0xEC,0xED,0xEE,0xEF,0xF0,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,0xF9,0xFA,0xFB,0xFC,0xFD,0xFE,0xFF}
//  316 
//  317 #elif _CODE_PAGE == 1256 /* Arabic (Windows) */
//  318 #define _DF1S	0
//  319 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x8C,0x9D,0x9E,0x9F, \ 
//  320 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  321 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  322 				0x41,0xE1,0x41,0xE3,0xE4,0xE5,0xE6,0x43,0x45,0x45,0x45,0x45,0xEC,0xED,0x49,0x49,0xF0,0xF1,0xF2,0xF3,0x4F,0xF5,0xF6,0xF7,0xF8,0x55,0xFA,0x55,0x55,0xFD,0xFE,0xFF}
//  323 
//  324 #elif _CODE_PAGE == 1257 /* Baltic (Windows) */
//  325 #define _DF1S	0
//  326 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0x9C,0x9D,0x9E,0x9F, \ 
//  327 				0xA0,0xA1,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xA8,0xB9,0xAA,0xBB,0xBC,0xBD,0xBE,0xAF, \ 
//  328 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  329 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xFF}
//  330 
//  331 #elif _CODE_PAGE == 1258 /* Vietnam (OEM, Windows) */
//  332 #define _DF1S	0
//  333 #define _EXCVT {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9A,0x9B,0xAC,0x9D,0x9E,0x9F, \ 
//  334 				0xA0,0x21,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xAB,0xAC,0xAD,0xAE,0xAF,0xB0,0xB1,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,0xBA,0xBB,0xBC,0xBD,0xBE,0xBF, \ 
//  335 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF,0xD0,0xD1,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xDE,0xDF, \ 
//  336 				0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xEC,0xCD,0xCE,0xCF,0xD0,0xD1,0xF2,0xD3,0xD4,0xD5,0xD6,0xF7,0xD8,0xD9,0xDA,0xDB,0xDC,0xDD,0xFE,0x9F}
//  337 
//  338 #elif _CODE_PAGE == 1	/* ASCII (for only non-LFN cfg) */
//  339 #if _USE_LFN
//  340 #error Cannot use LFN feature without valid code page.
//  341 #endif
//  342 #define _DF1S	0
//  343 
//  344 #else
//  345 #error Unknown code page
//  346 
//  347 #endif
//  348 
//  349 
//  350 /* Character code support macros */
//  351 #define IsUpper(c)	(((c)>='A')&&((c)<='Z'))
//  352 #define IsLower(c)	(((c)>='a')&&((c)<='z'))
//  353 #define IsDigit(c)	(((c)>='0')&&((c)<='9'))
//  354 
//  355 #if _DF1S		/* Code page is DBCS */
//  356 
//  357 #ifdef _DF2S	/* Two 1st byte areas */
//  358 #define IsDBCS1(c)	(((BYTE)(c) >= _DF1S && (BYTE)(c) <= _DF1E) || ((BYTE)(c) >= _DF2S && (BYTE)(c) <= _DF2E))
//  359 #else			/* One 1st byte area */
//  360 #define IsDBCS1(c)	((BYTE)(c) >= _DF1S && (BYTE)(c) <= _DF1E)
//  361 #endif
//  362 
//  363 #ifdef _DS3S	/* Three 2nd byte areas */
//  364 #define IsDBCS2(c)	(((BYTE)(c) >= _DS1S && (BYTE)(c) <= _DS1E) || ((BYTE)(c) >= _DS2S && (BYTE)(c) <= _DS2E) || ((BYTE)(c) >= _DS3S && (BYTE)(c) <= _DS3E))
//  365 #else			/* Two 2nd byte areas */
//  366 #define IsDBCS2(c)	(((BYTE)(c) >= _DS1S && (BYTE)(c) <= _DS1E) || ((BYTE)(c) >= _DS2S && (BYTE)(c) <= _DS2E))
//  367 #endif
//  368 
//  369 #else			/* Code page is SBCS */
//  370 
//  371 #define IsDBCS1(c)	0
//  372 #define IsDBCS2(c)	0
//  373 
//  374 #endif /* _DF1S */
//  375 
//  376 
//  377 /* Name status flags */
//  378 #define NS			11		/* Index of name status byte in fn[] */
//  379 #define NS_LOSS		0x01	/* Out of 8.3 format */
//  380 #define NS_LFN		0x02	/* Force to create LFN entry */
//  381 #define NS_LAST		0x04	/* Last segment */
//  382 #define NS_BODY		0x08	/* Lower case flag (body) */
//  383 #define NS_EXT		0x10	/* Lower case flag (ext) */
//  384 #define NS_DOT		0x20	/* Dot entry */
//  385 
//  386 
//  387 /* FAT sub-type boundaries */
//  388 /* Note that the FAT spec by Microsoft says 4085 but Windows works with 4087! */
//  389 #define MIN_FAT16	4086	/* Minimum number of clusters for FAT16 */
//  390 #define	MIN_FAT32	65526	/* Minimum number of clusters for FAT32 */
//  391 
//  392 
//  393 /* FatFs refers the members in the FAT structures as byte array instead of
//  394 / structure member because the structure is not binary compatible between
//  395 / different platforms */
//  396 
//  397 #define BS_jmpBoot			0	/* Jump instruction (3) */
//  398 #define BS_OEMName			3	/* OEM name (8) */
//  399 #define BPB_BytsPerSec		11	/* Sector size [byte] (2) */
//  400 #define BPB_SecPerClus		13	/* Cluster size [sector] (1) */
//  401 #define BPB_RsvdSecCnt		14	/* Size of reserved area [sector] (2) */
//  402 #define BPB_NumFATs			16	/* Number of FAT copies (1) */
//  403 #define BPB_RootEntCnt		17	/* Number of root dir entries for FAT12/16 (2) */
//  404 #define BPB_TotSec16		19	/* Volume size [sector] (2) */
//  405 #define BPB_Media			21	/* Media descriptor (1) */
//  406 #define BPB_FATSz16			22	/* FAT size [sector] (2) */
//  407 #define BPB_SecPerTrk		24	/* Track size [sector] (2) */
//  408 #define BPB_NumHeads		26	/* Number of heads (2) */
//  409 #define BPB_HiddSec			28	/* Number of special hidden sectors (4) */
//  410 #define BPB_TotSec32		32	/* Volume size [sector] (4) */
//  411 #define BS_DrvNum			36	/* Physical drive number (2) */
//  412 #define BS_BootSig			38	/* Extended boot signature (1) */
//  413 #define BS_VolID			39	/* Volume serial number (4) */
//  414 #define BS_VolLab			43	/* Volume label (8) */
//  415 #define BS_FilSysType		54	/* File system type (1) */
//  416 #define BPB_FATSz32			36	/* FAT size [sector] (4) */
//  417 #define BPB_ExtFlags		40	/* Extended flags (2) */
//  418 #define BPB_FSVer			42	/* File system version (2) */
//  419 #define BPB_RootClus		44	/* Root dir first cluster (4) */
//  420 #define BPB_FSInfo			48	/* Offset of FSInfo sector (2) */
//  421 #define BPB_BkBootSec		50	/* Offset of backup boot sectot (2) */
//  422 #define BS_DrvNum32			64	/* Physical drive number (2) */
//  423 #define BS_BootSig32		66	/* Extended boot signature (1) */
//  424 #define BS_VolID32			67	/* Volume serial number (4) */
//  425 #define BS_VolLab32			71	/* Volume label (8) */
//  426 #define BS_FilSysType32		82	/* File system type (1) */
//  427 #define	FSI_LeadSig			0	/* FSI: Leading signature (4) */
//  428 #define	FSI_StrucSig		484	/* FSI: Structure signature (4) */
//  429 #define	FSI_Free_Count		488	/* FSI: Number of free clusters (4) */
//  430 #define	FSI_Nxt_Free		492	/* FSI: Last allocated cluster (4) */
//  431 #define MBR_Table			446	/* MBR: Partition table offset (2) */
//  432 #define	SZ_PTE				16	/* MBR: Size of a partition table entry */
//  433 #define BS_55AA				510	/* Boot sector signature (2) */
//  434 
//  435 #define	DIR_Name			0	/* Short file name (11) */
//  436 #define	DIR_Attr			11	/* Attribute (1) */
//  437 #define	DIR_NTres			12	/* NT flag (1) */
//  438 #define	DIR_CrtTime			14	/* Created time (2) */
//  439 #define	DIR_CrtDate			16	/* Created date (2) */
//  440 #define	DIR_FstClusHI		20	/* Higher 16-bit of first cluster (2) */
//  441 #define	DIR_WrtTime			22	/* Modified time (2) */
//  442 #define	DIR_WrtDate			24	/* Modified date (2) */
//  443 #define	DIR_FstClusLO		26	/* Lower 16-bit of first cluster (2) */
//  444 #define	DIR_FileSize		28	/* File size (4) */
//  445 #define	LDIR_Ord			0	/* LFN entry order and LLE flag (1) */
//  446 #define	LDIR_Attr			11	/* LFN attribute (1) */
//  447 #define	LDIR_Type			12	/* LFN type (1) */
//  448 #define	LDIR_Chksum			13	/* Sum of corresponding SFN entry */
//  449 #define	LDIR_FstClusLO		26	/* Filled by zero (0) */
//  450 #define	SZ_DIR				32		/* Size of a directory entry */
//  451 #define	LLE					0x40	/* Last long entry flag in LDIR_Ord */
//  452 #define	DDE					0xE5	/* Deleted directory enrty mark in DIR_Name[0] */
//  453 #define	NDDE				0x05	/* Replacement of a character collides with DDE */
//  454 
//  455 
//  456 /*------------------------------------------------------------*/
//  457 /* Work area                                                  */
//  458 
//  459 #if _VOLUMES
//  460 static

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  461 FATFS *FatFs[_VOLUMES];	/* Pointer to the file system objects (logical drives) */
FatFs:
        DS8 4
//  462 #else
//  463 #error Number of drives must not be 0.
//  464 #endif
//  465 
//  466 static

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//  467 WORD Fsid;				/* File system mount ID */
Fsid:
        DS8 2
//  468 
//  469 #if _FS_RPATH
//  470 static

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  471 BYTE CurrVol;			/* Current drive */
CurrVol:
        DS8 1
//  472 #endif
//  473 
//  474 #if _FS_SHARE
//  475 static
//  476 FILESEM	Files[_FS_SHARE];	/* File lock semaphores */
//  477 #endif
//  478 
//  479 #if _USE_LFN == 0			/* No LFN */
//  480 #define	DEF_NAMEBUF			BYTE sfn[12]
//  481 #define INIT_BUF(dobj)		(dobj).fn = sfn
//  482 #define	FREE_BUF()
//  483 
//  484 #elif _USE_LFN == 1			/* LFN with static LFN working buffer */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  485 static WCHAR LfnBuf[_MAX_LFN+1];
LfnBuf:
        DS8 512
//  486 #define	DEF_NAMEBUF			BYTE sfn[12]
//  487 #define INIT_BUF(dobj)		{ (dobj).fn = sfn; (dobj).lfn = LfnBuf; }
//  488 #define	FREE_BUF()
//  489 
//  490 #elif _USE_LFN == 2 		/* LFN with dynamic LFN working buffer on the stack */
//  491 #define	DEF_NAMEBUF			BYTE sfn[12]; WCHAR lbuf[_MAX_LFN+1]
//  492 #define INIT_BUF(dobj)		{ (dobj).fn = sfn; (dobj).lfn = lbuf; }
//  493 #define	FREE_BUF()
//  494 
//  495 #elif _USE_LFN == 3 		/* LFN with dynamic LFN working buffer on the heap */
//  496 #define	DEF_NAMEBUF			BYTE sfn[12]; WCHAR *lfn
//  497 #define INIT_BUF(dobj)		{ lfn = ff_memalloc((_MAX_LFN + 1) * 2); \ 
//  498 							  if (!lfn) LEAVE_FF((dobj).fs, FR_NOT_ENOUGH_CORE); \ 
//  499 							  (dobj).lfn = lfn;	(dobj).fn = sfn; }
//  500 #define	FREE_BUF()			ff_memfree(lfn)
//  501 
//  502 #else
//  503 #error Wrong LFN configuration.
//  504 #endif
//  505 
//  506 
//  507 
//  508 
//  509 /*--------------------------------------------------------------------------
//  510 
//  511    Module Private Functions
//  512 
//  513 ---------------------------------------------------------------------------*/
//  514 
//  515 
//  516 /*-----------------------------------------------------------------------*/
//  517 /* String functions                                                      */
//  518 /*-----------------------------------------------------------------------*/
//  519 
//  520 /* Copy memory to memory */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  521 static
//  522 void mem_cpy (void* dst, const void* src, UINT cnt) {
//  523 	BYTE *d = (BYTE*)dst;
//  524 	const BYTE *s = (const BYTE*)src;
mem_cpy:
        B.N      ??mem_cpy_0
//  525 
//  526 #if _WORD_ACCESS == 1
//  527 	while (cnt >= sizeof(int)) {
//  528 		*(int*)d = *(int*)s;
//  529 		d += sizeof(int); s += sizeof(int);
//  530 		cnt -= sizeof(int);
//  531 	}
//  532 #endif
//  533 	while (cnt--)
//  534 		*d++ = *s++;
??mem_cpy_1:
        LDRB     R3,[R1, #+0]
        STRB     R3,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
??mem_cpy_0:
        MOVS     R3,R2
        SUBS     R2,R3,#+1
        CMP      R3,#+0
        BNE.N    ??mem_cpy_1
//  535 }
        BX       LR               ;; return
//  536 
//  537 /* Fill memory */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  538 static
//  539 void mem_set (void* dst, int val, UINT cnt) {
//  540 	BYTE *d = (BYTE*)dst;
mem_set:
        B.N      ??mem_set_0
//  541 
//  542 	while (cnt--)
//  543 		*d++ = (BYTE)val;
??mem_set_1:
        STRB     R1,[R0, #+0]
        ADDS     R0,R0,#+1
??mem_set_0:
        MOVS     R3,R2
        SUBS     R2,R3,#+1
        CMP      R3,#+0
        BNE.N    ??mem_set_1
//  544 }
        BX       LR               ;; return
//  545 
//  546 /* Compare memory to memory */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  547 static
//  548 int mem_cmp (const void* dst, const void* src, UINT cnt) {
mem_cmp:
        PUSH     {R4}
//  549 	const BYTE *d = (const BYTE *)dst, *s = (const BYTE *)src;
//  550 	int r = 0;
        MOVS     R3,#+0
//  551 
//  552 	while (cnt-- && (r = *d++ - *s++) == 0) ;
??mem_cmp_0:
        MOVS     R4,R2
        SUBS     R2,R4,#+1
        CMP      R4,#+0
        BEQ.N    ??mem_cmp_1
        LDRB     R3,[R0, #+0]
        LDRB     R4,[R1, #+0]
        SUBS     R3,R3,R4
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
        CMP      R3,#+0
        BEQ.N    ??mem_cmp_0
//  553 	return r;
??mem_cmp_1:
        MOVS     R0,R3
        POP      {R4}
        BX       LR               ;; return
//  554 }
//  555 
//  556 /* Check if chr is contained in the string */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  557 static
//  558 int chk_chr (const char* str, int chr) {
chk_chr:
        B.N      ??chk_chr_0
//  559 	while (*str && *str != chr) str++;
??chk_chr_1:
        ADDS     R0,R0,#+1
??chk_chr_0:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??chk_chr_2
        LDRB     R2,[R0, #+0]
        CMP      R2,R1
        BNE.N    ??chk_chr_1
//  560 	return *str;
??chk_chr_2:
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
//  561 }
//  562 
//  563 
//  564 
//  565 /*-----------------------------------------------------------------------*/
//  566 /* Request/Release grant to access the volume                            */
//  567 /*-----------------------------------------------------------------------*/
//  568 #if _FS_REENTRANT
//  569 
//  570 static
//  571 int lock_fs (
//  572 	FATFS *fs		/* File system object */
//  573 )
//  574 {
//  575 	return ff_req_grant(fs->sobj);
//  576 }
//  577 
//  578 
//  579 static
//  580 void unlock_fs (
//  581 	FATFS *fs,		/* File system object */
//  582 	FRESULT res		/* Result code to be returned */
//  583 )
//  584 {
//  585 	if (res != FR_NOT_ENABLED &&
//  586 		res != FR_INVALID_DRIVE &&
//  587 		res != FR_INVALID_OBJECT &&
//  588 		res != FR_TIMEOUT) {
//  589 		ff_rel_grant(fs->sobj);
//  590 	}
//  591 }
//  592 #endif
//  593 
//  594 
//  595 
//  596 /*-----------------------------------------------------------------------*/
//  597 /* File shareing control functions                                       */
//  598 /*-----------------------------------------------------------------------*/
//  599 #if _FS_SHARE
//  600 
//  601 static
//  602 FRESULT chk_lock (	/* Check if the file can be accessed */
//  603 	DIR* dj,		/* Directory object pointing the file to be checked */
//  604 	int acc			/* Desired access (0:Read, 1:Write, 2:Delete/Rename) */
//  605 )
//  606 {
//  607 	UINT i, be;
//  608 
//  609 	/* Search file semaphore table */
//  610 	for (i = be = 0; i < _FS_SHARE; i++) {
//  611 		if (Files[i].fs) {	/* Existing entry */
//  612 			if (Files[i].fs == dj->fs &&	 	/* Check if the file matched with an open file */
//  613 				Files[i].clu == dj->sclust &&
//  614 				Files[i].idx == dj->index) break;
//  615 		} else {			/* Blank entry */
//  616 			be++;
//  617 		}
//  618 	}
//  619 	if (i == _FS_SHARE)	/* The file is not opened */
//  620 		return (be || acc == 2) ? FR_OK : FR_TOO_MANY_OPEN_FILES;	/* Is there a blank entry for new file? */
//  621 
//  622 	/* The file has been opened. Reject any open against writing file and all write mode open */
//  623 	return (acc || Files[i].ctr == 0x100) ? FR_LOCKED : FR_OK;
//  624 }
//  625 
//  626 
//  627 static
//  628 int enq_lock (	/* Check if an entry is available for a new file */
//  629 	FATFS* fs	/* File system object */
//  630 )
//  631 {
//  632 	UINT i;
//  633 
//  634 	for (i = 0; i < _FS_SHARE && Files[i].fs; i++) ;
//  635 	return (i == _FS_SHARE) ? 0 : 1;
//  636 }
//  637 
//  638 
//  639 static
//  640 UINT inc_lock (	/* Increment file open counter and returns its index (0:int error) */
//  641 	DIR* dj,	/* Directory object pointing the file to register or increment */
//  642 	int acc		/* Desired access mode (0:Read, !0:Write) */
//  643 )
//  644 {
//  645 	UINT i;
//  646 
//  647 
//  648 	for (i = 0; i < _FS_SHARE; i++) {	/* Find the file */
//  649 		if (Files[i].fs == dj->fs &&
//  650 			Files[i].clu == dj->sclust &&
//  651 			Files[i].idx == dj->index) break;
//  652 	}
//  653 
//  654 	if (i == _FS_SHARE) {				/* Not opened. Register it as new. */
//  655 		for (i = 0; i < _FS_SHARE && Files[i].fs; i++) ;
//  656 		if (i == _FS_SHARE) return 0;	/* No space to register (int err) */
//  657 		Files[i].fs = dj->fs;
//  658 		Files[i].clu = dj->sclust;
//  659 		Files[i].idx = dj->index;
//  660 		Files[i].ctr = 0;
//  661 	}
//  662 
//  663 	if (acc && Files[i].ctr) return 0;	/* Access violation (int err) */
//  664 
//  665 	Files[i].ctr = acc ? 0x100 : Files[i].ctr + 1;	/* Set semaphore value */
//  666 
//  667 	return i + 1;
//  668 }
//  669 
//  670 
//  671 static
//  672 FRESULT dec_lock (	/* Decrement file open counter */
//  673 	UINT i			/* Semaphore index */
//  674 )
//  675 {
//  676 	WORD n;
//  677 	FRESULT res;
//  678 
//  679 
//  680 	if (--i < _FS_SHARE) {
//  681 		n = Files[i].ctr;
//  682 		if (n == 0x100) n = 0;
//  683 		if (n) n--;
//  684 		Files[i].ctr = n;
//  685 		if (!n) Files[i].fs = 0;
//  686 		res = FR_OK;
//  687 	} else {
//  688 		res = FR_INT_ERR;
//  689 	}
//  690 	return res;
//  691 }
//  692 
//  693 
//  694 static
//  695 void clear_lock (	/* Clear lock entries of the volume */
//  696 	FATFS *fs
//  697 )
//  698 {
//  699 	UINT i;
//  700 
//  701 	for (i = 0; i < _FS_SHARE; i++) {
//  702 		if (Files[i].fs == fs) Files[i].fs = 0;
//  703 	}
//  704 }
//  705 #endif
//  706 
//  707 
//  708 
//  709 /*-----------------------------------------------------------------------*/
//  710 /* Change window offset                                                  */
//  711 /*-----------------------------------------------------------------------*/
//  712 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  713 static
//  714 FRESULT move_window (
//  715 	FATFS *fs,		/* File system object */
//  716 	DWORD sector	/* Sector number to make appearance in the fs->win[] */
//  717 )					/* Move to zero only writes back dirty window */
//  718 {
move_window:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  719 	DWORD wsect;
//  720 
//  721 
//  722 	wsect = fs->winsect;
        LDR      R6,[R4, #+48]
//  723 	if (wsect != sector) {	/* Changed current window */
        CMP      R6,R5
        BEQ.N    ??move_window_0
//  724 #if !_FS_READONLY
//  725 		if (fs->wflag) {	/* Write back dirty window if needed */
        LDRB     R0,[R4, #+4]
        CMP      R0,#+0
        BEQ.N    ??move_window_1
//  726 			if (disk_write(fs->drv, fs->win, wsect, 1) != RES_OK)
        MOVS     R3,#+1
        MOVS     R2,R6
        ADDS     R1,R4,#+52
        LDRB     R0,[R4, #+1]
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??move_window_2
//  727 				return FR_DISK_ERR;
        MOVS     R0,#+1
        B.N      ??move_window_3
//  728 			fs->wflag = 0;
??move_window_2:
        MOVS     R0,#+0
        STRB     R0,[R4, #+4]
//  729 			if (wsect < (fs->fatbase + fs->fsize)) {	/* In FAT area */
        LDR      R0,[R4, #+36]
        LDR      R1,[R4, #+32]
        ADDS     R0,R1,R0
        CMP      R6,R0
        BCS.N    ??move_window_1
//  730 				BYTE nf;
//  731 				for (nf = fs->n_fats; nf > 1; nf--) {	/* Reflect the change to all FAT copies */
        LDRB     R7,[R4, #+3]
        B.N      ??move_window_4
//  732 					wsect += fs->fsize;
??move_window_5:
        LDR      R0,[R4, #+32]
        ADDS     R6,R0,R6
//  733 					disk_write(fs->drv, fs->win, wsect, 1);
        MOVS     R3,#+1
        MOVS     R2,R6
        ADDS     R1,R4,#+52
        LDRB     R0,[R4, #+1]
        BL       disk_write
//  734 				}
        SUBS     R7,R7,#+1
??move_window_4:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+2
        BCS.N    ??move_window_5
//  735 			}
//  736 		}
//  737 #endif
//  738 		if (sector) {
??move_window_1:
        CMP      R5,#+0
        BEQ.N    ??move_window_0
//  739 			if (disk_read(fs->drv, fs->win, sector, 1) != RES_OK)
        MOVS     R3,#+1
        MOVS     R2,R5
        ADDS     R1,R4,#+52
        LDRB     R0,[R4, #+1]
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??move_window_6
//  740 				return FR_DISK_ERR;
        MOVS     R0,#+1
        B.N      ??move_window_3
//  741 			fs->winsect = sector;
??move_window_6:
        STR      R5,[R4, #+48]
//  742 		}
//  743 	}
//  744 
//  745 	return FR_OK;
??move_window_0:
        MOVS     R0,#+0
??move_window_3:
        POP      {R1,R4-R7,PC}    ;; return
//  746 }
//  747 
//  748 
//  749 
//  750 
//  751 /*-----------------------------------------------------------------------*/
//  752 /* Clean-up cached data                                                  */
//  753 /*-----------------------------------------------------------------------*/
//  754 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  755 static
//  756 FRESULT sync (	/* FR_OK: successful, FR_DISK_ERR: failed */
//  757 	FATFS *fs	/* File system object */
//  758 )
//  759 {
sync:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  760 	FRESULT res;
//  761 
//  762 
//  763 	res = move_window(fs, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       move_window
        MOVS     R5,R0
//  764 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??sync_0
//  765 		/* Update FSInfo sector if needed */
//  766 		if (fs->fs_type == FS_FAT32 && fs->fsi_flag) {
        LDRB     R0,[R4, #+0]
        CMP      R0,#+3
        BNE.N    ??sync_1
        LDRB     R0,[R4, #+5]
        CMP      R0,#+0
        BEQ.N    ??sync_1
//  767 			fs->winsect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+48]
//  768 			/* Create FSInfo structure */
//  769 			mem_set(fs->win, 0, 512);
        MOV      R2,#+512
        MOVS     R1,#+0
        ADDS     R0,R4,#+52
        BL       mem_set
//  770 			ST_WORD(fs->win+BS_55AA, 0xAA55);
        MOVS     R0,#+85
        STRB     R0,[R4, #+562]
        MOVS     R0,#+170
        STRB     R0,[R4, #+563]
//  771 			ST_DWORD(fs->win+FSI_LeadSig, 0x41615252);
        MOVS     R0,#+82
        STRB     R0,[R4, #+52]
        MOVS     R0,#+82
        STRB     R0,[R4, #+53]
        MOVS     R0,#+97
        STRB     R0,[R4, #+54]
        MOVS     R0,#+65
        STRB     R0,[R4, #+55]
//  772 			ST_DWORD(fs->win+FSI_StrucSig, 0x61417272);
        MOVS     R0,#+114
        STRB     R0,[R4, #+536]
        MOVS     R0,#+114
        STRB     R0,[R4, #+537]
        MOVS     R0,#+65
        STRB     R0,[R4, #+538]
        MOVS     R0,#+97
        STRB     R0,[R4, #+539]
//  773 			ST_DWORD(fs->win+FSI_Free_Count, fs->free_clust);
        LDR      R0,[R4, #+16]
        STRB     R0,[R4, #+540]
        LDR      R0,[R4, #+16]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R4, #+541]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        STRB     R0,[R4, #+542]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+24
        STRB     R0,[R4, #+543]
//  774 			ST_DWORD(fs->win+FSI_Nxt_Free, fs->last_clust);
        LDR      R0,[R4, #+12]
        STRB     R0,[R4, #+544]
        LDR      R0,[R4, #+12]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R4, #+545]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+16
        STRB     R0,[R4, #+546]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+24
        STRB     R0,[R4, #+547]
//  775 			/* Write it into the FSInfo sector */
//  776 			disk_write(fs->drv, fs->win, fs->fsi_sector, 1);
        MOVS     R3,#+1
        LDR      R2,[R4, #+20]
        ADDS     R1,R4,#+52
        LDRB     R0,[R4, #+1]
        BL       disk_write
//  777 			fs->fsi_flag = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+5]
//  778 		}
//  779 		/* Make sure that no pending write process in the physical drive */
//  780 		if (disk_ioctl(fs->drv, CTRL_SYNC, (void*)0) != RES_OK)
??sync_1:
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDRB     R0,[R4, #+1]
        BL       disk_ioctl
        CMP      R0,#+0
        BEQ.N    ??sync_0
//  781 			res = FR_DISK_ERR;
        MOVS     R5,#+1
//  782 	}
//  783 
//  784 	return res;
??sync_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//  785 }
//  786 #endif
//  787 
//  788 
//  789 
//  790 
//  791 /*-----------------------------------------------------------------------*/
//  792 /* Get sector# from cluster#                                             */
//  793 /*-----------------------------------------------------------------------*/
//  794 
//  795 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  796 DWORD clust2sect (	/* !=0: Sector number, 0: Failed - invalid cluster# */
//  797 	FATFS *fs,		/* File system object */
//  798 	DWORD clst		/* Cluster# to be converted */
//  799 )
//  800 {
//  801 	clst -= 2;
clust2sect:
        SUBS     R1,R1,#+2
//  802 	if (clst >= (fs->n_fatent - 2)) return 0;		/* Invalid cluster# */
        LDR      R2,[R0, #+28]
        SUBS     R2,R2,#+2
        CMP      R1,R2
        BCC.N    ??clust2sect_0
        MOVS     R0,#+0
        B.N      ??clust2sect_1
//  803 	return clst * fs->csize + fs->database;
??clust2sect_0:
        LDRB     R2,[R0, #+2]
        LDR      R0,[R0, #+44]
        MLA      R0,R2,R1,R0
??clust2sect_1:
        BX       LR               ;; return
//  804 }
//  805 
//  806 
//  807 
//  808 
//  809 /*-----------------------------------------------------------------------*/
//  810 /* FAT access - Read value of a FAT entry                                */
//  811 /*-----------------------------------------------------------------------*/
//  812 
//  813 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  814 DWORD get_fat (	/* 0xFFFFFFFF:Disk error, 1:Internal error, Else:Cluster status */
//  815 	FATFS *fs,	/* File system object */
//  816 	DWORD clst	/* Cluster# to get the link information */
//  817 )
//  818 {
get_fat:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  819 	UINT wc, bc;
//  820 	BYTE *p;
//  821 
//  822 
//  823 	if (clst < 2 || clst >= fs->n_fatent)	/* Chack range */
        CMP      R5,#+2
        BCC.N    ??get_fat_0
        LDR      R0,[R4, #+28]
        CMP      R5,R0
        BCC.N    ??get_fat_1
//  824 		return 1;
??get_fat_0:
        MOVS     R0,#+1
        B.N      ??get_fat_2
//  825 
//  826 	switch (fs->fs_type) {
??get_fat_1:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+1
        BEQ.N    ??get_fat_3
        BCC.N    ??get_fat_4
        CMP      R0,#+3
        BEQ.N    ??get_fat_5
        BCC.N    ??get_fat_6
        B.N      ??get_fat_4
//  827 	case FS_FAT12 :
//  828 		bc = (UINT)clst; bc += bc / 2;
??get_fat_3:
        MOVS     R6,R5
        ADDS     R6,R6,R6, LSR #+1
//  829 		if (move_window(fs, fs->fatbase + (bc / SS(fs)))) break;
        LDR      R0,[R4, #+36]
        ADDS     R1,R0,R6, LSR #+9
        MOVS     R0,R4
        BL       move_window
        CMP      R0,#+0
        BEQ.N    ??get_fat_7
//  830 		wc = fs->win[bc % SS(fs)]; bc++;
//  831 		if (move_window(fs, fs->fatbase + (bc / SS(fs)))) break;
//  832 		wc |= fs->win[bc % SS(fs)] << 8;
//  833 		return (clst & 1) ? (wc >> 4) : (wc & 0xFFF);
//  834 
//  835 	case FS_FAT16 :
//  836 		if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)))) break;
//  837 		p = &fs->win[clst * 2 % SS(fs)];
//  838 		return LD_WORD(p);
//  839 
//  840 	case FS_FAT32 :
//  841 		if (move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)))) break;
//  842 		p = &fs->win[clst * 4 % SS(fs)];
//  843 		return LD_DWORD(p) & 0x0FFFFFFF;
//  844 	}
//  845 
//  846 	return 0xFFFFFFFF;	/* An error occurred at the disk I/O layer */
??get_fat_4:
        MOVS     R0,#-1
??get_fat_2:
        POP      {R1,R4-R7,PC}    ;; return
??get_fat_7:
        MOV      R0,#+512
        UDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        ADDS     R0,R1,R4
        LDRB     R7,[R0, #+52]
        ADDS     R6,R6,#+1
        LDR      R0,[R4, #+36]
        ADDS     R1,R0,R6, LSR #+9
        MOVS     R0,R4
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_4
??get_fat_8:
        MOV      R0,#+512
        UDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        ADDS     R0,R1,R4
        LDRB     R0,[R0, #+52]
        ORRS     R7,R7,R0, LSL #+8
        LSLS     R0,R5,#+31
        BPL.N    ??get_fat_9
        LSRS     R0,R7,#+4
        B.N      ??get_fat_10
??get_fat_9:
        LSLS     R0,R7,#+20       ;; ZeroExtS R0,R7,#+20,#+20
        LSRS     R0,R0,#+20
??get_fat_10:
        B.N      ??get_fat_2
??get_fat_6:
        LDR      R0,[R4, #+36]
        ADDS     R1,R0,R5, LSR #+8
        MOVS     R0,R4
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_4
??get_fat_11:
        LSLS     R0,R5,#+1
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R4
        ADDW     R0,R0,#+52
        LDRB     R1,[R0, #+1]
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,R1, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        B.N      ??get_fat_2
??get_fat_5:
        LDR      R0,[R4, #+36]
        ADDS     R1,R0,R5, LSR #+7
        MOVS     R0,R4
        BL       move_window
        CMP      R0,#+0
        BNE.N    ??get_fat_4
??get_fat_12:
        LSLS     R0,R5,#+2
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADDS     R0,R2,R4
        ADDW     R0,R0,#+52
        LDRB     R1,[R0, #+3]
        LDRB     R2,[R0, #+2]
        LSLS     R2,R2,#+16
        ORRS     R1,R2,R1, LSL #+24
        LDRB     R2,[R0, #+1]
        ORRS     R1,R1,R2, LSL #+8
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,R1
        LSLS     R0,R0,#+4        ;; ZeroExtS R0,R0,#+4,#+4
        LSRS     R0,R0,#+4
        B.N      ??get_fat_2
//  847 }
//  848 
//  849 
//  850 
//  851 
//  852 /*-----------------------------------------------------------------------*/
//  853 /* FAT access - Change value of a FAT entry                              */
//  854 /*-----------------------------------------------------------------------*/
//  855 #if !_FS_READONLY
//  856 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  857 FRESULT put_fat (
//  858 	FATFS *fs,	/* File system object */
//  859 	DWORD clst,	/* Cluster# to be changed in range of 2 to fs->n_fatent - 1 */
//  860 	DWORD val	/* New value to mark the cluster */
//  861 )
//  862 {
put_fat:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  863 	UINT bc;
//  864 	BYTE *p;
//  865 	FRESULT res;
//  866 
//  867 
//  868 	if (clst < 2 || clst >= fs->n_fatent) {	/* Check range */
        CMP      R5,#+2
        BCC.N    ??put_fat_0
        LDR      R0,[R4, #+28]
        CMP      R5,R0
        BCC.N    ??put_fat_1
//  869 		res = FR_INT_ERR;
??put_fat_0:
        MOVS     R0,#+2
        B.N      ??put_fat_2
//  870 
//  871 	} else {
//  872 		switch (fs->fs_type) {
??put_fat_1:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+1
        BEQ.N    ??put_fat_3
        BCC.W    ??put_fat_4
        CMP      R0,#+3
        BEQ.N    ??put_fat_5
        BCC.N    ??put_fat_6
        B.N      ??put_fat_4
//  873 		case FS_FAT12 :
//  874 			bc = clst; bc += bc / 2;
??put_fat_3:
        MOVS     R7,R5
        ADDS     R7,R7,R7, LSR #+1
//  875 			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
        LDR      R0,[R4, #+36]
        ADDS     R1,R0,R7, LSR #+9
        MOVS     R0,R4
        BL       move_window
//  876 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??put_fat_7
//  877 			p = &fs->win[bc % SS(fs)];
??put_fat_8:
        MOV      R0,#+512
        UDIV     R1,R7,R0
        MLS      R1,R1,R0,R7
        ADDS     R0,R1,R4
        ADDW     R1,R0,#+52
//  878 			*p = (clst & 1) ? ((*p & 0x0F) | ((BYTE)val << 4)) : (BYTE)val;
        MOVS     R0,R5
        LSLS     R0,R0,#+31
        BPL.N    ??put_fat_9
        LDRB     R0,[R1, #+0]
        ANDS     R0,R0,#0xF
        ORRS     R0,R0,R6, LSL #+4
        B.N      ??put_fat_10
??put_fat_9:
        MOVS     R0,R6
??put_fat_10:
        STRB     R0,[R1, #+0]
//  879 			bc++;
        ADDS     R7,R7,#+1
//  880 			fs->wflag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+4]
//  881 			res = move_window(fs, fs->fatbase + (bc / SS(fs)));
        LDR      R0,[R4, #+36]
        ADDS     R1,R0,R7, LSR #+9
        MOVS     R0,R4
        BL       move_window
//  882 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??put_fat_7
//  883 			p = &fs->win[bc % SS(fs)];
??put_fat_11:
        MOV      R1,#+512
        UDIV     R2,R7,R1
        MLS      R2,R2,R1,R7
        ADDS     R1,R2,R4
        ADDW     R1,R1,#+52
//  884 			*p = (clst & 1) ? (BYTE)(val >> 4) : ((*p & 0xF0) | ((BYTE)(val >> 8) & 0x0F));
        LSLS     R2,R5,#+31
        BPL.N    ??put_fat_12
        LSRS     R2,R6,#+4
        B.N      ??put_fat_13
??put_fat_12:
        LDRB     R2,[R1, #+0]
        ANDS     R2,R2,#0xF0
        LSRS     R3,R6,#+8
        ANDS     R3,R3,#0xF
        ORRS     R2,R3,R2
??put_fat_13:
        STRB     R2,[R1, #+0]
//  885 			break;
        B.N      ??put_fat_7
//  886 
//  887 		case FS_FAT16 :
//  888 			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 2)));
??put_fat_6:
        LDR      R0,[R4, #+36]
        ADDS     R1,R0,R5, LSR #+8
        MOVS     R0,R4
        BL       move_window
//  889 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??put_fat_7
//  890 			p = &fs->win[clst * 2 % SS(fs)];
??put_fat_14:
        LSLS     R1,R5,#+1
        MOV      R2,#+512
        UDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        ADDS     R1,R3,R4
        ADDW     R1,R1,#+52
//  891 			ST_WORD(p, (WORD)val);
        STRB     R6,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R2,R6,#+8
        STRB     R2,[R1, #+1]
//  892 			break;
        B.N      ??put_fat_7
//  893 
//  894 		case FS_FAT32 :
//  895 			res = move_window(fs, fs->fatbase + (clst / (SS(fs) / 4)));
??put_fat_5:
        LDR      R0,[R4, #+36]
        ADDS     R1,R0,R5, LSR #+7
        MOVS     R0,R4
        BL       move_window
//  896 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??put_fat_7
//  897 			p = &fs->win[clst * 4 % SS(fs)];
??put_fat_15:
        LSLS     R1,R5,#+2
        MOV      R2,#+512
        UDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        ADDS     R1,R3,R4
        ADDW     R1,R1,#+52
//  898 			val |= LD_DWORD(p) & 0xF0000000;
        LDRB     R2,[R1, #+3]
        LSLS     R2,R2,#+24
        ANDS     R2,R2,#0xF0000000
        ORRS     R6,R2,R6
//  899 			ST_DWORD(p, val);
        STRB     R6,[R1, #+0]
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R2,R2,#+8
        STRB     R2,[R1, #+1]
        LSRS     R2,R6,#+16
        STRB     R2,[R1, #+2]
        LSRS     R2,R6,#+24
        STRB     R2,[R1, #+3]
//  900 			break;
        B.N      ??put_fat_7
//  901 
//  902 		default :
//  903 			res = FR_INT_ERR;
??put_fat_4:
        MOVS     R0,#+2
//  904 		}
//  905 		fs->wflag = 1;
??put_fat_7:
        MOVS     R1,#+1
        STRB     R1,[R4, #+4]
//  906 	}
//  907 
//  908 	return res;
??put_fat_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
//  909 }
//  910 #endif /* !_FS_READONLY */
//  911 
//  912 
//  913 
//  914 
//  915 /*-----------------------------------------------------------------------*/
//  916 /* FAT handling - Remove a cluster chain                                 */
//  917 /*-----------------------------------------------------------------------*/
//  918 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  919 static
//  920 FRESULT remove_chain (
//  921 	FATFS *fs,			/* File system object */
//  922 	DWORD clst			/* Cluster# to remove a chain from */
//  923 )
//  924 {
remove_chain:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
//  925 	FRESULT res;
//  926 	DWORD nxt;
//  927 #if _USE_ERASE
//  928 	DWORD scl = clst, ecl = clst, resion[2];
//  929 #endif
//  930 
//  931 	if (clst < 2 || clst >= fs->n_fatent) {	/* Check range */
        CMP      R6,#+2
        BCC.N    ??remove_chain_0
        LDR      R0,[R4, #+28]
        CMP      R6,R0
        BCC.N    ??remove_chain_1
//  932 		res = FR_INT_ERR;
??remove_chain_0:
        MOVS     R5,#+2
        B.N      ??remove_chain_2
//  933 
//  934 	} else {
//  935 		res = FR_OK;
??remove_chain_1:
        MOVS     R5,#+0
        B.N      ??remove_chain_3
//  936 		while (clst < fs->n_fatent) {			/* Not a last link? */
//  937 			nxt = get_fat(fs, clst);			/* Get cluster status */
//  938 			if (nxt == 0) break;				/* Empty cluster? */
//  939 			if (nxt == 1) { res = FR_INT_ERR; break; }	/* Internal error? */
//  940 			if (nxt == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }	/* Disk error? */
//  941 			res = put_fat(fs, clst, 0);			/* Mark the cluster "empty" */
//  942 			if (res != FR_OK) break;
//  943 			if (fs->free_clust != 0xFFFFFFFF) {	/* Update FSInfo */
??remove_chain_4:
        LDR      R0,[R4, #+16]
        CMN      R0,#+1
        BEQ.N    ??remove_chain_5
//  944 				fs->free_clust++;
        LDR      R0,[R4, #+16]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+16]
//  945 				fs->fsi_flag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+5]
//  946 			}
//  947 #if _USE_ERASE
//  948 			if (ecl + 1 == nxt) {	/* Next cluster is contiguous */
//  949 				ecl = nxt;
//  950 			} else {				/* End of contiguous clusters */ 
//  951 				resion[0] = clust2sect(fs, scl);					/* Start sector */
//  952 				resion[1] = clust2sect(fs, ecl) + fs->csize - 1;	/* End sector */
//  953 				disk_ioctl(fs->drv, CTRL_ERASE_SECTOR, resion);		/* Erase the block */
//  954 				scl = ecl = nxt;
//  955 			}
//  956 #endif
//  957 			clst = nxt;	/* Next cluster */
??remove_chain_5:
        MOVS     R6,R7
??remove_chain_3:
        LDR      R0,[R4, #+28]
        CMP      R6,R0
        BCS.N    ??remove_chain_2
        MOVS     R1,R6
        MOVS     R0,R4
        BL       get_fat
        MOVS     R7,R0
        CMP      R7,#+0
        BEQ.N    ??remove_chain_2
??remove_chain_6:
        CMP      R7,#+1
        BNE.N    ??remove_chain_7
        MOVS     R5,#+2
        B.N      ??remove_chain_2
??remove_chain_7:
        CMN      R7,#+1
        BNE.N    ??remove_chain_8
        MOVS     R5,#+1
        B.N      ??remove_chain_2
??remove_chain_8:
        MOVS     R2,#+0
        MOVS     R1,R6
        MOVS     R0,R4
        BL       put_fat
        MOVS     R5,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??remove_chain_4
//  958 		}
//  959 	}
//  960 
//  961 	return res;
??remove_chain_2:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
//  962 }
//  963 #endif
//  964 
//  965 
//  966 
//  967 
//  968 /*-----------------------------------------------------------------------*/
//  969 /* FAT handling - Stretch or Create a cluster chain                      */
//  970 /*-----------------------------------------------------------------------*/
//  971 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  972 static
//  973 DWORD create_chain (	/* 0:No free cluster, 1:Internal error, 0xFFFFFFFF:Disk error, >=2:New cluster# */
//  974 	FATFS *fs,			/* File system object */
//  975 	DWORD clst			/* Cluster# to stretch. 0 means create a new chain. */
//  976 )
//  977 {
create_chain:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
//  978 	DWORD cs, ncl, scl;
//  979 	FRESULT res;
//  980 
//  981 
//  982 	if (clst == 0) {		/* Create a new chain */
        CMP      R6,#+0
        BNE.N    ??create_chain_0
//  983 		scl = fs->last_clust;			/* Get suggested start point */
        LDR      R7,[R4, #+12]
//  984 		if (!scl || scl >= fs->n_fatent) scl = 1;
        CMP      R7,#+0
        BEQ.N    ??create_chain_1
        LDR      R0,[R4, #+28]
        CMP      R7,R0
        BCC.N    ??create_chain_2
??create_chain_1:
        MOVS     R7,#+1
        B.N      ??create_chain_2
//  985 	}
//  986 	else {					/* Stretch the current chain */
//  987 		cs = get_fat(fs, clst);			/* Check the cluster status */
??create_chain_0:
        MOVS     R1,R6
        MOVS     R0,R4
        BL       get_fat
//  988 		if (cs < 2) return 1;			/* It is an invalid cluster */
        CMP      R0,#+2
        BCS.N    ??create_chain_3
        MOVS     R0,#+1
        B.N      ??create_chain_4
//  989 		if (cs < fs->n_fatent) return cs;	/* It is already followed by next cluster */
??create_chain_3:
        LDR      R1,[R4, #+28]
        CMP      R0,R1
        BCC.N    ??create_chain_4
//  990 		scl = clst;
??create_chain_5:
        MOVS     R7,R6
//  991 	}
//  992 
//  993 	ncl = scl;				/* Start cluster */
??create_chain_2:
        MOVS     R5,R7
//  994 	for (;;) {
//  995 		ncl++;							/* Next cluster */
??create_chain_6:
        ADDS     R5,R5,#+1
//  996 		if (ncl >= fs->n_fatent) {		/* Wrap around */
        LDR      R0,[R4, #+28]
        CMP      R5,R0
        BCC.N    ??create_chain_7
//  997 			ncl = 2;
        MOVS     R5,#+2
//  998 			if (ncl > scl) return 0;	/* No free cluster */
        CMP      R7,R5
        BCS.N    ??create_chain_7
        MOVS     R0,#+0
        B.N      ??create_chain_4
//  999 		}
// 1000 		cs = get_fat(fs, ncl);			/* Get the cluster status */
??create_chain_7:
        MOVS     R1,R5
        MOVS     R0,R4
        BL       get_fat
// 1001 		if (cs == 0) break;				/* Found a free cluster */
        CMP      R0,#+0
        BNE.N    ??create_chain_8
// 1002 		if (cs == 0xFFFFFFFF || cs == 1)/* An error occurred */
// 1003 			return cs;
// 1004 		if (ncl == scl) return 0;		/* No free cluster */
// 1005 	}
// 1006 
// 1007 	res = put_fat(fs, ncl, 0x0FFFFFFF);	/* Mark the new cluster "last link" */
        MVNS     R2,#-268435456
        MOVS     R1,R5
        MOVS     R0,R4
        BL       put_fat
// 1008 	if (res == FR_OK && clst != 0) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??create_chain_9
        CMP      R6,#+0
        BEQ.N    ??create_chain_9
// 1009 		res = put_fat(fs, clst, ncl);	/* Link it to the previous one if needed */
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R4
        BL       put_fat
// 1010 	}
// 1011 	if (res == FR_OK) {
??create_chain_9:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??create_chain_10
// 1012 		fs->last_clust = ncl;			/* Update FSINFO */
        STR      R5,[R4, #+12]
// 1013 		if (fs->free_clust != 0xFFFFFFFF) {
        LDR      R0,[R4, #+16]
        CMN      R0,#+1
        BEQ.N    ??create_chain_11
// 1014 			fs->free_clust--;
        LDR      R0,[R4, #+16]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+16]
// 1015 			fs->fsi_flag = 1;
        MOVS     R0,#+1
        STRB     R0,[R4, #+5]
        B.N      ??create_chain_11
// 1016 		}
// 1017 	} else {
??create_chain_8:
        CMN      R0,#+1
        BEQ.N    ??create_chain_12
        CMP      R0,#+1
        BNE.N    ??create_chain_13
??create_chain_12:
        B.N      ??create_chain_4
??create_chain_13:
        CMP      R5,R7
        BNE.N    ??create_chain_6
        MOVS     R0,#+0
        B.N      ??create_chain_4
// 1018 		ncl = (res == FR_DISK_ERR) ? 0xFFFFFFFF : 1;
??create_chain_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??create_chain_14
        MOVS     R5,#-1
        B.N      ??create_chain_11
??create_chain_14:
        MOVS     R5,#+1
// 1019 	}
// 1020 
// 1021 	return ncl;		/* Return new cluster number or error code */
??create_chain_11:
        MOVS     R0,R5
??create_chain_4:
        POP      {R1,R4-R7,PC}    ;; return
// 1022 }
// 1023 #endif /* !_FS_READONLY */
// 1024 
// 1025 
// 1026 
// 1027 /*-----------------------------------------------------------------------*/
// 1028 /* FAT handling - Convert offset into cluster with link map table        */
// 1029 /*-----------------------------------------------------------------------*/
// 1030 
// 1031 #if _USE_FASTSEEK

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1032 static
// 1033 DWORD clmt_clust (	/* <2:Error, >=2:Cluster number */
// 1034 	FIL* fp,		/* Pointer to the file object */
// 1035 	DWORD ofs		/* File offset to be converted to cluster# */
// 1036 )
// 1037 {
// 1038 	DWORD cl, ncl, *tbl;
// 1039 
// 1040 
// 1041 	tbl = fp->cltbl + 1;	/* Top of CLMT */
clmt_clust:
        LDR      R2,[R0, #+36]
        ADDS     R2,R2,#+4
// 1042 	cl = ofs / SS(fp->fs) / fp->fs->csize;	/* Cluster order from top of the file */
        LSRS     R1,R1,#+9
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+2]
        UDIV     R0,R1,R0
        B.N      ??clmt_clust_0
// 1043 	for (;;) {
// 1044 		ncl = *tbl++;			/* Number of cluters in the fragment */
// 1045 		if (!ncl) return 0;		/* End of table? (error) */
// 1046 		if (cl < ncl) break;	/* In this fragment? */
// 1047 		cl -= ncl; tbl++;		/* Next fragment */
??clmt_clust_1:
        SUBS     R0,R0,R1
        ADDS     R2,R2,#+4
??clmt_clust_0:
        LDR      R1,[R2, #+0]
        ADDS     R2,R2,#+4
        CMP      R1,#+0
        BNE.N    ??clmt_clust_2
        MOVS     R0,#+0
        B.N      ??clmt_clust_3
??clmt_clust_2:
        CMP      R0,R1
        BCS.N    ??clmt_clust_1
// 1048 	}
// 1049 	return cl + *tbl;	/* Return the cluster number */
        LDR      R1,[R2, #+0]
        ADDS     R0,R1,R0
??clmt_clust_3:
        BX       LR               ;; return
// 1050 }
// 1051 #endif	/* _USE_FASTSEEK */
// 1052 
// 1053 
// 1054 
// 1055 /*-----------------------------------------------------------------------*/
// 1056 /* Directory handling - Set directory index                              */
// 1057 /*-----------------------------------------------------------------------*/
// 1058 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1059 static
// 1060 FRESULT dir_sdi (
// 1061 	DIR *dj,		/* Pointer to directory object */
// 1062 	WORD idx		/* Directory index number */
// 1063 )
// 1064 {
dir_sdi:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1065 	DWORD clst;
// 1066 	WORD ic;
// 1067 
// 1068 
// 1069 	dj->index = idx;
        STRH     R5,[R4, #+6]
// 1070 	clst = dj->sclust;
        LDR      R0,[R4, #+8]
// 1071 	if (clst == 1 || clst >= dj->fs->n_fatent)	/* Check start cluster range */
        CMP      R0,#+1
        BEQ.N    ??dir_sdi_0
        LDR      R1,[R4, #+0]
        LDR      R1,[R1, #+28]
        CMP      R0,R1
        BCC.N    ??dir_sdi_1
// 1072 		return FR_INT_ERR;
??dir_sdi_0:
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1073 	if (!clst && dj->fs->fs_type == FS_FAT32)	/* Replace cluster# 0 with root cluster# if in FAT32 */
??dir_sdi_1:
        CMP      R0,#+0
        BNE.N    ??dir_sdi_3
        LDR      R1,[R4, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+3
        BNE.N    ??dir_sdi_3
// 1074 		clst = dj->fs->dirbase;
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+40]
// 1075 
// 1076 	if (clst == 0) {	/* Static table (root-dir in FAT12/16) */
??dir_sdi_3:
        CMP      R0,#+0
        BNE.N    ??dir_sdi_4
// 1077 		dj->clust = clst;
        STR      R0,[R4, #+12]
// 1078 		if (idx >= dj->fs->n_rootdir)		/* Index is out of range */
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+8]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BCC.N    ??dir_sdi_5
// 1079 			return FR_INT_ERR;
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1080 		dj->sect = dj->fs->dirbase + idx / (SS(dj->fs) / SZ_DIR);	/* Sector# */
??dir_sdi_5:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+40]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R0,R0,R5, LSR #+4
        STR      R0,[R4, #+16]
        B.N      ??dir_sdi_6
// 1081 	}
// 1082 	else {				/* Dynamic table (sub-dirs or root-dir in FAT32) */
// 1083 		ic = SS(dj->fs) / SZ_DIR * dj->fs->csize;	/* Entries per cluster */
??dir_sdi_4:
        LDR      R1,[R4, #+0]
        LDRB     R1,[R1, #+2]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSLS     R6,R1,#+4
        B.N      ??dir_sdi_7
// 1084 		while (idx >= ic) {	/* Follow cluster chain */
// 1085 			clst = get_fat(dj->fs, clst);				/* Get next cluster */
// 1086 			if (clst == 0xFFFFFFFF) return FR_DISK_ERR;	/* Disk error */
// 1087 			if (clst < 2 || clst >= dj->fs->n_fatent)	/* Reached to end of table or int error */
// 1088 				return FR_INT_ERR;
// 1089 			idx -= ic;
??dir_sdi_8:
        SUBS     R5,R5,R6
??dir_sdi_7:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R5,R6
        BCC.N    ??dir_sdi_9
        MOVS     R1,R0
        LDR      R0,[R4, #+0]
        BL       get_fat
        CMN      R0,#+1
        BNE.N    ??dir_sdi_10
        MOVS     R0,#+1
        B.N      ??dir_sdi_2
??dir_sdi_10:
        CMP      R0,#+2
        BCC.N    ??dir_sdi_11
        LDR      R1,[R4, #+0]
        LDR      R1,[R1, #+28]
        CMP      R0,R1
        BCC.N    ??dir_sdi_8
??dir_sdi_11:
        MOVS     R0,#+2
        B.N      ??dir_sdi_2
// 1090 		}
// 1091 		dj->clust = clst;
??dir_sdi_9:
        STR      R0,[R4, #+12]
// 1092 		dj->sect = clust2sect(dj->fs, clst) + idx / (SS(dj->fs) / SZ_DIR);	/* Sector# */
        MOVS     R1,R0
        LDR      R0,[R4, #+0]
        BL       clust2sect
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ADDS     R0,R0,R5, LSR #+4
        STR      R0,[R4, #+16]
// 1093 	}
// 1094 
// 1095 	dj->dir = dj->fs->win + (idx % (SS(dj->fs) / SZ_DIR)) * SZ_DIR;	/* Ptr to the entry in the sector */
??dir_sdi_6:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+16
        UDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,R1, LSL #+5
        ADDW     R0,R0,#+52
        STR      R0,[R4, #+20]
// 1096 
// 1097 	return FR_OK;	/* Seek succeeded */
        MOVS     R0,#+0
??dir_sdi_2:
        POP      {R4-R6,PC}       ;; return
// 1098 }
// 1099 
// 1100 
// 1101 
// 1102 
// 1103 /*-----------------------------------------------------------------------*/
// 1104 /* Directory handling - Move directory index next                        */
// 1105 /*-----------------------------------------------------------------------*/
// 1106 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1107 static
// 1108 FRESULT dir_next (	/* FR_OK:Succeeded, FR_NO_FILE:End of table, FR_DENIED:EOT and could not stretch */
// 1109 	DIR *dj,		/* Pointer to directory object */
// 1110 	int stretch		/* 0: Do not stretch table, 1: Stretch table if needed */
// 1111 )
// 1112 {
dir_next:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1113 	DWORD clst;
// 1114 	WORD i;
// 1115 
// 1116 
// 1117 	i = dj->index + 1;
        LDRH     R0,[R4, #+6]
        ADDS     R6,R0,#+1
// 1118 	if (!i || !dj->sect)	/* Report EOT when index has reached 65535 */
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+0
        BEQ.N    ??dir_next_0
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BNE.N    ??dir_next_1
// 1119 		return FR_NO_FILE;
??dir_next_0:
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1120 
// 1121 	if (!(i % (SS(dj->fs) / SZ_DIR))) {	/* Sector changed? */
??dir_next_1:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+16
        UDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        CMP      R1,#+0
        BNE.N    ??dir_next_3
// 1122 		dj->sect++;					/* Next sector */
        LDR      R0,[R4, #+16]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+16]
// 1123 
// 1124 		if (dj->clust == 0) {	/* Static table */
        LDR      R0,[R4, #+12]
        CMP      R0,#+0
        BNE.N    ??dir_next_4
// 1125 			if (i >= dj->fs->n_rootdir)	/* Report EOT when end of table */
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+8]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,R0
        BCC.N    ??dir_next_3
// 1126 				return FR_NO_FILE;
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1127 		}
// 1128 		else {					/* Dynamic table */
// 1129 			if (((i / (SS(dj->fs) / SZ_DIR)) & (dj->fs->csize - 1)) == 0) {	/* Cluster changed? */
??dir_next_4:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+4
        LDR      R1,[R4, #+0]
        LDRB     R1,[R1, #+2]
        SUBS     R1,R1,#+1
        TST      R0,R1
        BNE.N    ??dir_next_3
// 1130 				clst = get_fat(dj->fs, dj->clust);				/* Get next cluster */
        LDR      R1,[R4, #+12]
        LDR      R0,[R4, #+0]
        BL       get_fat
        MOVS     R7,R0
// 1131 				if (clst <= 1) return FR_INT_ERR;
        CMP      R7,#+2
        BCS.N    ??dir_next_5
        MOVS     R0,#+2
        B.N      ??dir_next_2
// 1132 				if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
??dir_next_5:
        CMN      R7,#+1
        BNE.N    ??dir_next_6
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1133 				if (clst >= dj->fs->n_fatent) {					/* When it reached end of dynamic table */
??dir_next_6:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+28]
        CMP      R7,R0
        BCC.N    ??dir_next_7
// 1134 #if !_FS_READONLY
// 1135 					BYTE c;
// 1136 					if (!stretch) return FR_NO_FILE;			/* When do not stretch, report EOT */
        CMP      R5,#+0
        BNE.N    ??dir_next_8
        MOVS     R0,#+4
        B.N      ??dir_next_2
// 1137 					clst = create_chain(dj->fs, dj->clust);		/* Stretch cluster chain */
??dir_next_8:
        LDR      R1,[R4, #+12]
        LDR      R0,[R4, #+0]
        BL       create_chain
        MOVS     R7,R0
// 1138 					if (clst == 0) return FR_DENIED;			/* No free cluster */
        CMP      R7,#+0
        BNE.N    ??dir_next_9
        MOVS     R0,#+7
        B.N      ??dir_next_2
// 1139 					if (clst == 1) return FR_INT_ERR;
??dir_next_9:
        CMP      R7,#+1
        BNE.N    ??dir_next_10
        MOVS     R0,#+2
        B.N      ??dir_next_2
// 1140 					if (clst == 0xFFFFFFFF) return FR_DISK_ERR;
??dir_next_10:
        CMN      R7,#+1
        BNE.N    ??dir_next_11
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1141 					/* Clean-up stretched table */
// 1142 					if (move_window(dj->fs, 0)) return FR_DISK_ERR;	/* Flush active window */
??dir_next_11:
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
        BL       move_window
        CMP      R0,#+0
        BEQ.N    ??dir_next_12
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1143 					mem_set(dj->fs->win, 0, SS(dj->fs));			/* Clear window buffer */
??dir_next_12:
        MOV      R2,#+512
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+52
        BL       mem_set
// 1144 					dj->fs->winsect = clust2sect(dj->fs, clst);	/* Cluster start sector */
        MOVS     R1,R7
        LDR      R0,[R4, #+0]
        BL       clust2sect
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+48]
// 1145 					for (c = 0; c < dj->fs->csize; c++) {		/* Fill the new cluster with 0 */
        MOVS     R5,#+0
        B.N      ??dir_next_13
// 1146 						dj->fs->wflag = 1;
// 1147 						if (move_window(dj->fs, 0)) return FR_DISK_ERR;
// 1148 						dj->fs->winsect++;
??dir_next_14:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+48]
        ADDS     R0,R0,#+1
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+48]
        ADDS     R5,R5,#+1
??dir_next_13:
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,R0
        BCS.N    ??dir_next_15
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        LDR      R0,[R4, #+0]
        BL       move_window
        CMP      R0,#+0
        BEQ.N    ??dir_next_14
        MOVS     R0,#+1
        B.N      ??dir_next_2
// 1149 					}
// 1150 					dj->fs->winsect -= c;						/* Rewind window address */
??dir_next_15:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+48]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        SUBS     R0,R0,R5
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+48]
// 1151 #else
// 1152 					return FR_NO_FILE;			/* Report EOT */
// 1153 #endif
// 1154 				}
// 1155 				dj->clust = clst;				/* Initialize data for new cluster */
??dir_next_7:
        STR      R7,[R4, #+12]
// 1156 				dj->sect = clust2sect(dj->fs, clst);
        MOVS     R1,R7
        LDR      R0,[R4, #+0]
        BL       clust2sect
        STR      R0,[R4, #+16]
// 1157 			}
// 1158 		}
// 1159 	}
// 1160 
// 1161 	dj->index = i;
??dir_next_3:
        STRH     R6,[R4, #+6]
// 1162 	dj->dir = dj->fs->win + (i % (SS(dj->fs) / SZ_DIR)) * SZ_DIR;
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+16
        UDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,R1, LSL #+5
        ADDW     R0,R0,#+52
        STR      R0,[R4, #+20]
// 1163 
// 1164 	return FR_OK;
        MOVS     R0,#+0
??dir_next_2:
        POP      {R1,R4-R7,PC}    ;; return
// 1165 }

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\"*:<>?|\\177">`:
        DATA
        DC8 "\"*:<>?|\177"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "+,;=[]">`:
        DATA
        DC8 "+,;=[]"
        DC8 0
// 1166 
// 1167 
// 1168 
// 1169 
// 1170 /*-----------------------------------------------------------------------*/
// 1171 /* LFN handling - Test/Pick/Fit an LFN segment from/to directory entry   */
// 1172 /*-----------------------------------------------------------------------*/
// 1173 #if _USE_LFN
// 1174 static

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// 1175 const BYTE LfnOfs[] = {1,3,5,7,9,14,16,18,20,22,24,28,30};	/* Offset of LFN chars in the directory entry */
LfnOfs:
        DATA
        DC8 1, 3, 5, 7, 9, 14, 16, 18, 20, 22, 24, 28, 30, 0, 0, 0
// 1176 
// 1177 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1178 static
// 1179 int cmp_lfn (			/* 1:Matched, 0:Not matched */
// 1180 	WCHAR *lfnbuf,		/* Pointer to the LFN to be compared */
// 1181 	BYTE *dir			/* Pointer to the directory entry containing a part of LFN */
// 1182 )
// 1183 {
cmp_lfn:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 1184 	UINT i, s;
// 1185 	WCHAR wc, uc;
// 1186 
// 1187 
// 1188 	i = ((dir[LDIR_Ord] & ~LLE) - 1) * 13;	/* Get offset in the LFN buffer */
        LDRB     R0,[R5, #+0]
        BICS     R0,R0,#0x40
        SUBS     R0,R0,#+1
        MOVS     R1,#+13
        MUL      R6,R1,R0
// 1189 	s = 0; wc = 1;
        MOVS     R7,#+0
        MOVS     R8,#+1
// 1190 	do {
// 1191 		uc = LD_WORD(dir+LfnOfs[s]);	/* Pick an LFN character from the entry */
??cmp_lfn_0:
        LDR.W    R0,??DataTable4
        LDRB     R0,[R7, R0]
        ADDS     R0,R0,R5
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable4
        LDRB     R1,[R7, R1]
        LDRB     R1,[R1, R5]
        ORRS     R0,R1,R0, LSL #+8
// 1192 		if (wc) {	/* Last char has not been processed */
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BEQ.N    ??cmp_lfn_1
// 1193 			wc = ff_wtoupper(uc);		/* Convert it to upper case */
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       ff_wtoupper
        MOV      R8,R0
// 1194 			if (i >= _MAX_LFN || wc != ff_wtoupper(lfnbuf[i++]))	/* Compare it */
        CMP      R6,#+255
        BCS.N    ??cmp_lfn_2
        LDRH     R0,[R4, R6, LSL #+1]
        BL       ff_wtoupper
        ADDS     R6,R6,#+1
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R8,R0
        BEQ.N    ??cmp_lfn_3
// 1195 				return 0;				/* Not matched */
??cmp_lfn_2:
        MOVS     R0,#+0
        B.N      ??cmp_lfn_4
// 1196 		} else {
// 1197 			if (uc != 0xFFFF) return 0;	/* Check filler */
??cmp_lfn_1:
        MOVW     R1,#+65535
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BEQ.N    ??cmp_lfn_3
        MOVS     R0,#+0
        B.N      ??cmp_lfn_4
// 1198 		}
// 1199 	} while (++s < 13);				/* Repeat until all chars in the entry are checked */
??cmp_lfn_3:
        ADDS     R7,R7,#+1
        CMP      R7,#+13
        BCC.N    ??cmp_lfn_0
// 1200 
// 1201 	if ((dir[LDIR_Ord] & LLE) && wc && lfnbuf[i])	/* Last segment matched but different length */
        LDRB     R0,[R5, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??cmp_lfn_5
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BEQ.N    ??cmp_lfn_5
        LDRH     R0,[R4, R6, LSL #+1]
        CMP      R0,#+0
        BEQ.N    ??cmp_lfn_5
// 1202 		return 0;
        MOVS     R0,#+0
        B.N      ??cmp_lfn_4
// 1203 
// 1204 	return 1;						/* The part of LFN matched */
??cmp_lfn_5:
        MOVS     R0,#+1
??cmp_lfn_4:
        POP      {R4-R8,PC}       ;; return
// 1205 }
// 1206 
// 1207 
// 1208 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1209 static
// 1210 int pick_lfn (			/* 1:Succeeded, 0:Buffer overflow */
// 1211 	WCHAR *lfnbuf,		/* Pointer to the Unicode-LFN buffer */
// 1212 	BYTE *dir			/* Pointer to the directory entry */
// 1213 )
// 1214 {
pick_lfn:
        PUSH     {R4-R6}
// 1215 	UINT i, s;
// 1216 	WCHAR wc, uc;
// 1217 
// 1218 
// 1219 	i = ((dir[LDIR_Ord] & 0x3F) - 1) * 13;	/* Offset in the LFN buffer */
        LDRB     R2,[R1, #+0]
        ANDS     R2,R2,#0x3F
        SUBS     R2,R2,#+1
        MOVS     R3,#+13
        MULS     R2,R3,R2
// 1220 
// 1221 	s = 0; wc = 1;
        MOVS     R3,#+0
        MOVS     R4,#+1
// 1222 	do {
// 1223 		uc = LD_WORD(dir+LfnOfs[s]);		/* Pick an LFN character from the entry */
??pick_lfn_0:
        LDR.W    R5,??DataTable4
        LDRB     R5,[R3, R5]
        ADDS     R5,R5,R1
        LDRB     R5,[R5, #+1]
        LDR.W    R6,??DataTable4
        LDRB     R6,[R3, R6]
        LDRB     R6,[R6, R1]
        ORRS     R5,R6,R5, LSL #+8
// 1224 		if (wc) {	/* Last char has not been processed */
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BEQ.N    ??pick_lfn_1
// 1225 			if (i >= _MAX_LFN) return 0;	/* Buffer overflow? */
        CMP      R2,#+255
        BCC.N    ??pick_lfn_2
        MOVS     R0,#+0
        B.N      ??pick_lfn_3
// 1226 			lfnbuf[i++] = wc = uc;			/* Store it */
??pick_lfn_2:
        MOVS     R4,R5
        STRH     R4,[R0, R2, LSL #+1]
        ADDS     R2,R2,#+1
// 1227 		} else {
// 1228 			if (uc != 0xFFFF) return 0;		/* Check filler */
// 1229 		}
// 1230 	} while (++s < 13);						/* Read all character in the entry */
??pick_lfn_4:
        ADDS     R3,R3,#+1
        CMP      R3,#+13
        BCC.N    ??pick_lfn_0
// 1231 
// 1232 	if (dir[LDIR_Ord] & LLE) {				/* Put terminator if it is the last LFN part */
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+25
        BPL.N    ??pick_lfn_5
// 1233 		if (i >= _MAX_LFN) return 0;		/* Buffer overflow? */
        CMP      R2,#+255
        BCC.N    ??pick_lfn_6
        MOVS     R0,#+0
        B.N      ??pick_lfn_3
??pick_lfn_1:
        MOVW     R6,#+65535
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R6
        BEQ.N    ??pick_lfn_4
        MOVS     R0,#+0
        B.N      ??pick_lfn_3
// 1234 		lfnbuf[i] = 0;
??pick_lfn_6:
        MOVS     R1,#+0
        STRH     R1,[R0, R2, LSL #+1]
// 1235 	}
// 1236 
// 1237 	return 1;
??pick_lfn_5:
        MOVS     R0,#+1
??pick_lfn_3:
        POP      {R4-R6}
        BX       LR               ;; return
// 1238 }
// 1239 
// 1240 
// 1241 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1242 static
// 1243 void fit_lfn (
// 1244 	const WCHAR *lfnbuf,	/* Pointer to the LFN buffer */
// 1245 	BYTE *dir,				/* Pointer to the directory entry */
// 1246 	BYTE ord,				/* LFN order (1-20) */
// 1247 	BYTE sum				/* SFN sum */
// 1248 )
// 1249 {
fit_lfn:
        PUSH     {R4-R7}
// 1250 	UINT i, s;
// 1251 	WCHAR wc;
// 1252 
// 1253 
// 1254 	dir[LDIR_Chksum] = sum;			/* Set check sum */
        STRB     R3,[R1, #+13]
// 1255 	dir[LDIR_Attr] = AM_LFN;		/* Set attribute. LFN entry */
        MOVS     R3,#+15
        STRB     R3,[R1, #+11]
// 1256 	dir[LDIR_Type] = 0;
        MOVS     R3,#+0
        STRB     R3,[R1, #+12]
// 1257 	ST_WORD(dir+LDIR_FstClusLO, 0);
        MOVS     R3,#+0
        STRB     R3,[R1, #+26]
        MOVS     R3,#+0
        STRB     R3,[R1, #+27]
// 1258 
// 1259 	i = (ord - 1) * 13;				/* Get offset in the LFN buffer */
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        SUBS     R3,R2,#+1
        MOVS     R4,#+13
        MULS     R3,R4,R3
// 1260 	s = wc = 0;
        MOVS     R4,#+0
        MOVS     R5,R4
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
// 1261 	do {
// 1262 		if (wc != 0xFFFF) wc = lfnbuf[i++];	/* Get an effective char */
??fit_lfn_0:
        MOVW     R6,#+65535
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R6
        BEQ.N    ??fit_lfn_1
        LDRH     R5,[R0, R3, LSL #+1]
        ADDS     R3,R3,#+1
// 1263 		ST_WORD(dir+LfnOfs[s], wc);	/* Put it */
??fit_lfn_1:
        LDR.W    R6,??DataTable4
        LDRB     R6,[R4, R6]
        STRB     R5,[R6, R1]
        LDR.W    R6,??DataTable4
        LDRB     R6,[R4, R6]
        ADDS     R6,R6,R1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R7,R5,#+8
        STRB     R7,[R6, #+1]
// 1264 		if (!wc) wc = 0xFFFF;		/* Padding chars following last char */
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BNE.N    ??fit_lfn_2
        MOVW     R5,#+65535
// 1265 	} while (++s < 13);
??fit_lfn_2:
        ADDS     R4,R4,#+1
        CMP      R4,#+13
        BCC.N    ??fit_lfn_0
// 1266 	if (wc == 0xFFFF || !lfnbuf[i]) ord |= LLE;	/* Bottom LFN part is the start of LFN sequence */
        MOVW     R4,#+65535
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R4
        BEQ.N    ??fit_lfn_3
        LDRH     R0,[R0, R3, LSL #+1]
        CMP      R0,#+0
        BNE.N    ??fit_lfn_4
??fit_lfn_3:
        ORRS     R2,R2,#0x40
// 1267 	dir[LDIR_Ord] = ord;			/* Set the LFN order */
??fit_lfn_4:
        STRB     R2,[R1, #+0]
// 1268 }
        POP      {R4-R7}
        BX       LR               ;; return
// 1269 
// 1270 #endif
// 1271 #endif
// 1272 
// 1273 
// 1274 
// 1275 /*-----------------------------------------------------------------------*/
// 1276 /* Create numbered name                                                  */
// 1277 /*-----------------------------------------------------------------------*/
// 1278 #if _USE_LFN

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1279 void gen_numname (
// 1280 	BYTE *dst,			/* Pointer to generated SFN */
// 1281 	const BYTE *src,	/* Pointer to source SFN to be modified */
// 1282 	const WCHAR *lfn,	/* Pointer to LFN */
// 1283 	WORD seq			/* Sequence number */
// 1284 )
// 1285 {
gen_numname:
        PUSH     {R2-R6,LR}
        MOVS     R4,R0
        MOVS     R6,R2
        MOVS     R5,R3
// 1286 	BYTE ns[8], c;
// 1287 	UINT i, j;
// 1288 
// 1289 
// 1290 	mem_cpy(dst, src, 11);
        MOVS     R2,#+11
        MOVS     R0,R4
        BL       mem_cpy
// 1291 
// 1292 	if (seq > 5) {	/* On many collisions, generate a hash number instead of sequential number */
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+6
        BCC.N    ??gen_numname_0
// 1293 		do seq = (seq >> 1) + (seq << 15) + (WORD)*lfn++; while (*lfn);
??gen_numname_1:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSLS     R0,R5,#+15
        ADDS     R0,R0,R5, LSR #+1
        LDRH     R1,[R6, #+0]
        ADDS     R5,R1,R0
        ADDS     R6,R6,#+2
        LDRH     R0,[R6, #+0]
        CMP      R0,#+0
        BNE.N    ??gen_numname_1
// 1294 	}
// 1295 
// 1296 	/* itoa (hexdecimal) */
// 1297 	i = 7;
??gen_numname_0:
        MOVS     R0,#+7
// 1298 	do {
// 1299 		c = (seq % 16) + '0';
??gen_numname_2:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R1,#+16
        SDIV     R2,R5,R1
        MLS      R2,R2,R1,R5
        ADDS     R1,R2,#+48
// 1300 		if (c > '9') c += 7;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+58
        BCC.N    ??gen_numname_3
        ADDS     R1,R1,#+7
// 1301 		ns[i--] = c;
??gen_numname_3:
        ADD      R2,SP,#+0
        STRB     R1,[R0, R2]
        SUBS     R0,R0,#+1
// 1302 		seq /= 16;
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R1,#+16
        SDIV     R5,R5,R1
// 1303 	} while (seq);
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BNE.N    ??gen_numname_2
// 1304 	ns[i] = '~';
        ADD      R1,SP,#+0
        MOVS     R2,#+126
        STRB     R2,[R0, R1]
// 1305 
// 1306 	/* Append the number */
// 1307 	for (j = 0; j < i && dst[j] != ' '; j++) {
        MOVS     R1,#+0
        B.N      ??gen_numname_4
// 1308 		if (IsDBCS1(dst[j])) {
??gen_numname_5:
        ADDS     R1,R1,#+1
??gen_numname_4:
        CMP      R1,R0
        BCS.N    ??gen_numname_6
        LDRB     R2,[R1, R4]
        CMP      R2,#+32
        BNE.N    ??gen_numname_5
// 1309 			if (j == i - 1) break;
// 1310 			j++;
// 1311 		}
// 1312 	}
// 1313 	do {
// 1314 		dst[j++] = (i < 8) ? ns[i++] : ' ';
??gen_numname_6:
        MOVS     R2,R1
        ADDS     R1,R2,#+1
        CMP      R0,#+8
        BCS.N    ??gen_numname_7
        ADD      R3,SP,#+0
        LDRB     R3,[R0, R3]
        ADDS     R0,R0,#+1
        B.N      ??gen_numname_8
??gen_numname_7:
        MOVS     R3,#+32
??gen_numname_8:
        STRB     R3,[R2, R4]
// 1315 	} while (j < 8);
        CMP      R1,#+8
        BCC.N    ??gen_numname_6
// 1316 }
        POP      {R0,R1,R4-R6,PC}  ;; return
// 1317 #endif
// 1318 
// 1319 
// 1320 
// 1321 
// 1322 /*-----------------------------------------------------------------------*/
// 1323 /* Calculate sum of an SFN                                               */
// 1324 /*-----------------------------------------------------------------------*/
// 1325 #if _USE_LFN

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1326 static
// 1327 BYTE sum_sfn (
// 1328 	const BYTE *dir		/* Ptr to directory entry */
// 1329 )
// 1330 {
// 1331 	BYTE sum = 0;
sum_sfn:
        MOVS     R1,#+0
// 1332 	UINT n = 11;
        MOVS     R2,#+11
// 1333 
// 1334 	do sum = (sum >> 1) + (sum << 7) + *dir++; while (--n);
??sum_sfn_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R3,R1,#+7
        ADDS     R1,R3,R1, LSR #+1
        LDRB     R3,[R0, #+0]
        ADDS     R1,R3,R1
        ADDS     R0,R0,#+1
        SUBS     R2,R2,#+1
        CMP      R2,#+0
        BNE.N    ??sum_sfn_0
// 1335 	return sum;
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return
// 1336 }
// 1337 #endif
// 1338 
// 1339 
// 1340 
// 1341 
// 1342 /*-----------------------------------------------------------------------*/
// 1343 /* Directory handling - Find an object in the directory                  */
// 1344 /*-----------------------------------------------------------------------*/
// 1345 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1346 static
// 1347 FRESULT dir_find (
// 1348 	DIR *dj			/* Pointer to the directory object linked to the file name */
// 1349 )
// 1350 {
dir_find:
        PUSH     {R4-R8,LR}
        MOVS     R5,R0
// 1351 	FRESULT res;
// 1352 	BYTE c, *dir;
// 1353 #if _USE_LFN
// 1354 	BYTE a, ord, sum;
// 1355 #endif
// 1356 
// 1357 	res = dir_sdi(dj, 0);			/* Rewind directory object */
        MOVS     R1,#+0
        MOVS     R0,R5
        BL       dir_sdi
        MOVS     R4,R0
// 1358 	if (res != FR_OK) return res;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??dir_find_0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??dir_find_1
// 1359 
// 1360 #if _USE_LFN
// 1361 	ord = sum = 0xFF;
??dir_find_0:
        MOVS     R7,#+255
        MOV      R8,R7
// 1362 #endif
// 1363 	do {
// 1364 		res = move_window(dj->fs, dj->sect);
??dir_find_2:
        LDR      R1,[R5, #+16]
        LDR      R0,[R5, #+0]
        BL       move_window
        MOVS     R4,R0
// 1365 		if (res != FR_OK) break;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??dir_find_3
// 1366 		dir = dj->dir;					/* Ptr to the directory entry of current index */
??dir_find_4:
        LDR      R6,[R5, #+20]
// 1367 		c = dir[DIR_Name];
        LDRB     R0,[R6, #+0]
// 1368 		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_find_5
        MOVS     R4,#+4
        B.N      ??dir_find_3
// 1369 #if _USE_LFN	/* LFN configuration */
// 1370 		a = dir[DIR_Attr] & AM_MASK;
??dir_find_5:
        LDRB     R1,[R6, #+11]
        ANDS     R1,R1,#0x3F
// 1371 		if (c == DDE || ((a & AM_VOL) && a != AM_LFN)) {	/* An entry without valid data */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+229
        BEQ.N    ??dir_find_6
        LSLS     R2,R1,#+28
        BPL.N    ??dir_find_7
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+15
        BEQ.N    ??dir_find_7
// 1372 			ord = 0xFF;
??dir_find_6:
        MOVS     R7,#+255
// 1373 		} else {
// 1374 			if (a == AM_LFN) {			/* An LFN entry is found */
// 1375 				if (dj->lfn) {
// 1376 					if (c & LLE) {		/* Is it start of LFN sequence? */
// 1377 						sum = dir[LDIR_Chksum];
// 1378 						c &= ~LLE; ord = c;	/* LFN start order */
// 1379 						dj->lfn_idx = dj->index;
// 1380 					}
// 1381 					/* Check validity of the LFN entry and compare it with given name */
// 1382 					ord = (c == ord && sum == dir[LDIR_Chksum] && cmp_lfn(dj->lfn, dir)) ? ord - 1 : 0xFF;
// 1383 				}
// 1384 			} else {					/* An SFN entry is found */
// 1385 				if (!ord && sum == sum_sfn(dir)) break;	/* LFN matched? */
// 1386 				ord = 0xFF; dj->lfn_idx = 0xFFFF;	/* Reset LFN sequence */
// 1387 				if (!(dj->fn[NS] & NS_LOSS) && !mem_cmp(dir, dj->fn, 11)) break;	/* SFN matched? */
// 1388 			}
// 1389 		}
// 1390 #else		/* Non LFN configuration */
// 1391 		if (!(dir[DIR_Attr] & AM_VOL) && !mem_cmp(dir, dj->fn, 11)) /* Is it a valid entry? */
// 1392 			break;
// 1393 #endif
// 1394 		res = dir_next(dj, 0);		/* Next entry */
??dir_find_8:
        MOVS     R1,#+0
        MOVS     R0,R5
        BL       dir_next
        MOVS     R4,R0
// 1395 	} while (res == FR_OK);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??dir_find_2
// 1396 
// 1397 	return res;
??dir_find_3:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??dir_find_1:
        POP      {R4-R8,PC}       ;; return
??dir_find_7:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+15
        BNE.N    ??dir_find_9
        LDR      R1,[R5, #+28]
        CMP      R1,#+0
        BEQ.N    ??dir_find_8
        LSLS     R1,R0,#+25
        BPL.N    ??dir_find_10
        LDRB     R8,[R6, #+13]
        ANDS     R0,R0,#0xBF
        MOVS     R7,R0
        LDRH     R1,[R5, #+6]
        STRH     R1,[R5, #+32]
??dir_find_10:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R0,R7
        BNE.N    ??dir_find_11
        LDRB     R0,[R6, #+13]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,R0
        BNE.N    ??dir_find_11
        MOVS     R1,R6
        LDR      R0,[R5, #+28]
        BL       cmp_lfn
        CMP      R0,#+0
        BEQ.N    ??dir_find_11
        SUBS     R7,R7,#+1
        B.N      ??dir_find_12
??dir_find_11:
        MOVS     R7,#+255
??dir_find_12:
        B.N      ??dir_find_8
??dir_find_9:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??dir_find_13
        MOVS     R0,R6
        BL       sum_sfn
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,R0
        BEQ.N    ??dir_find_3
??dir_find_13:
        MOVS     R7,#+255
        MOVW     R0,#+65535
        STRH     R0,[R5, #+32]
        LDR      R0,[R5, #+24]
        LDRB     R0,[R0, #+11]
        LSLS     R0,R0,#+31
        BMI.N    ??dir_find_8
        MOVS     R2,#+11
        LDR      R1,[R5, #+24]
        MOVS     R0,R6
        BL       mem_cmp
        CMP      R0,#+0
        BNE.N    ??dir_find_8
        B.N      ??dir_find_3
// 1398 }
// 1399 
// 1400 
// 1401 
// 1402 
// 1403 /*-----------------------------------------------------------------------*/
// 1404 /* Read an object from the directory                                     */
// 1405 /*-----------------------------------------------------------------------*/
// 1406 #if _FS_MINIMIZE <= 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1407 static
// 1408 FRESULT dir_read (
// 1409 	DIR *dj			/* Pointer to the directory object that pointing the entry to be read */
// 1410 )
// 1411 {
dir_read:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
// 1412 	FRESULT res;
// 1413 	BYTE c, *dir;
// 1414 #if _USE_LFN
// 1415 	BYTE a, ord = 0xFF, sum = 0xFF;
        MOVS     R6,#+255
        MOVS     R7,#+255
// 1416 #endif
// 1417 
// 1418 	res = FR_NO_FILE;
        MOVS     R5,#+4
// 1419 	while (dj->sect) {
??dir_read_0:
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BEQ.N    ??dir_read_1
// 1420 		res = move_window(dj->fs, dj->sect);
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
        BL       move_window
        MOVS     R5,R0
// 1421 		if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_read_1
// 1422 		dir = dj->dir;					/* Ptr to the directory entry of current index */
??dir_read_2:
        LDR      R0,[R4, #+20]
// 1423 		c = dir[DIR_Name];
        LDRB     R1,[R0, #+0]
// 1424 		if (c == 0) { res = FR_NO_FILE; break; }	/* Reached to end of table */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??dir_read_3
        MOVS     R5,#+4
        B.N      ??dir_read_1
// 1425 #if _USE_LFN	/* LFN configuration */
// 1426 		a = dir[DIR_Attr] & AM_MASK;
??dir_read_3:
        LDRB     R2,[R0, #+11]
        ANDS     R2,R2,#0x3F
// 1427 		if (c == DDE || (!_FS_RPATH && c == '.') || ((a & AM_VOL) && a != AM_LFN)) {	/* An entry without valid data */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+229
        BEQ.N    ??dir_read_4
        LSLS     R3,R2,#+28
        BPL.N    ??dir_read_5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+15
        BEQ.N    ??dir_read_5
// 1428 			ord = 0xFF;
??dir_read_4:
        MOVS     R6,#+255
// 1429 		} else {
// 1430 			if (a == AM_LFN) {			/* An LFN entry is found */
// 1431 				if (c & LLE) {			/* Is it start of LFN sequence? */
// 1432 					sum = dir[LDIR_Chksum];
// 1433 					c &= ~LLE; ord = c;
// 1434 					dj->lfn_idx = dj->index;
// 1435 				}
// 1436 				/* Check LFN validity and capture it */
// 1437 				ord = (c == ord && sum == dir[LDIR_Chksum] && pick_lfn(dj->lfn, dir)) ? ord - 1 : 0xFF;
// 1438 			} else {					/* An SFN entry is found */
// 1439 				if (ord || sum != sum_sfn(dir))	/* Is there a valid LFN? */
// 1440 					dj->lfn_idx = 0xFFFF;		/* It has no LFN. */
// 1441 				break;
// 1442 			}
// 1443 		}
// 1444 #else		/* Non LFN configuration */
// 1445 		if (c != DDE && (_FS_RPATH || c != '.') && !(dir[DIR_Attr] & AM_VOL))	/* Is it a valid entry? */
// 1446 			break;
// 1447 #endif
// 1448 		res = dir_next(dj, 0);				/* Next entry */
??dir_read_6:
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       dir_next
        MOVS     R5,R0
// 1449 		if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_read_0
// 1450 	}
// 1451 
// 1452 	if (res != FR_OK) dj->sect = 0;
??dir_read_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_read_7
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
// 1453 
// 1454 	return res;
??dir_read_7:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
??dir_read_5:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+15
        BNE.N    ??dir_read_8
        LSLS     R2,R1,#+25
        BPL.N    ??dir_read_9
        LDRB     R7,[R0, #+13]
        ANDS     R1,R1,#0xBF
        MOVS     R6,R1
        LDRH     R2,[R4, #+6]
        STRH     R2,[R4, #+32]
??dir_read_9:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R1,R6
        BNE.N    ??dir_read_10
        LDRB     R1,[R0, #+13]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,R1
        BNE.N    ??dir_read_10
        MOVS     R1,R0
        LDR      R0,[R4, #+28]
        BL       pick_lfn
        CMP      R0,#+0
        BEQ.N    ??dir_read_10
        SUBS     R6,R6,#+1
        B.N      ??dir_read_11
??dir_read_10:
        MOVS     R6,#+255
??dir_read_11:
        B.N      ??dir_read_6
??dir_read_8:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??dir_read_12
        BL       sum_sfn
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,R0
        BEQ.N    ??dir_read_13
??dir_read_12:
        MOVW     R0,#+65535
        STRH     R0,[R4, #+32]
??dir_read_13:
        B.N      ??dir_read_1
// 1455 }
// 1456 #endif
// 1457 
// 1458 
// 1459 
// 1460 /*-----------------------------------------------------------------------*/
// 1461 /* Register an object to the directory                                   */
// 1462 /*-----------------------------------------------------------------------*/
// 1463 #if !_FS_READONLY

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1464 static
// 1465 FRESULT dir_register (	/* FR_OK:Successful, FR_DENIED:No free entry or too many SFN collision, FR_DISK_ERR:Disk error */
// 1466 	DIR *dj				/* Target directory with object name to be created */
// 1467 )
// 1468 {
dir_register:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+16
        MOVS     R4,R0
// 1469 	FRESULT res;
// 1470 	BYTE c, *dir;
// 1471 #if _USE_LFN	/* LFN configuration */
// 1472 	WORD n, ne, is;
// 1473 	BYTE sn[12], *fn, sum;
// 1474 	WCHAR *lfn;
// 1475 
// 1476 
// 1477 	fn = dj->fn; lfn = dj->lfn;
        LDR      R7,[R4, #+24]
        LDR      R6,[R4, #+28]
// 1478 	mem_cpy(sn, fn, 12);
        MOVS     R2,#+12
        MOVS     R1,R7
        ADD      R0,SP,#+0
        BL       mem_cpy
// 1479 
// 1480 	if (_FS_RPATH && (sn[NS] & NS_DOT))		/* Cannot create dot entry */
        LDRB     R0,[SP, #+11]
        LSLS     R0,R0,#+26
        BPL.N    ??dir_register_0
// 1481 		return FR_INVALID_NAME;
        MOVS     R0,#+6
        B.N      ??dir_register_1
// 1482 
// 1483 	if (sn[NS] & NS_LOSS) {			/* When LFN is out of 8.3 format, generate a numbered name */
??dir_register_0:
        LDRB     R0,[SP, #+11]
        LSLS     R0,R0,#+31
        BPL.N    ??dir_register_2
// 1484 		fn[NS] = 0; dj->lfn = 0;			/* Find only SFN */
        MOVS     R0,#+0
        STRB     R0,[R7, #+11]
        MOVS     R0,#+0
        STR      R0,[R4, #+28]
// 1485 		for (n = 1; n < 100; n++) {
        MOVS     R8,#+1
        B.N      ??dir_register_3
??dir_register_4:
        ADDS     R8,R8,#+1
??dir_register_3:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+100
        BCS.N    ??dir_register_5
// 1486 			gen_numname(fn, sn, lfn, n);	/* Generate a numbered name */
        MOV      R3,R8
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R6
        ADD      R1,SP,#+0
        MOVS     R0,R7
        BL       gen_numname
// 1487 			res = dir_find(dj);				/* Check if the name collides with existing SFN */
        MOVS     R0,R4
        BL       dir_find
        MOVS     R5,R0
// 1488 			if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_register_4
// 1489 		}
// 1490 		if (n == 100) return FR_DENIED;		/* Abort if too many collisions */
??dir_register_5:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+100
        BNE.N    ??dir_register_6
        MOVS     R0,#+7
        B.N      ??dir_register_1
// 1491 		if (res != FR_NO_FILE) return res;	/* Abort if the result is other than 'not collided' */
??dir_register_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BEQ.N    ??dir_register_7
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??dir_register_1
// 1492 		fn[NS] = sn[NS]; dj->lfn = lfn;
??dir_register_7:
        LDRB     R0,[SP, #+11]
        STRB     R0,[R7, #+11]
        STR      R6,[R4, #+28]
// 1493 	}
// 1494 
// 1495 	if (sn[NS] & NS_LFN) {			/* When LFN is to be created, reserve an SFN + LFN entries. */
??dir_register_2:
        LDRB     R0,[SP, #+11]
        LSLS     R0,R0,#+30
        BPL.N    ??dir_register_8
// 1496 		for (ne = 0; lfn[ne]; ne++) ;
        MOVS     R7,#+0
        B.N      ??dir_register_9
??dir_register_10:
        ADDS     R7,R7,#+1
??dir_register_9:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRH     R0,[R6, R7, LSL #+1]
        CMP      R0,#+0
        BNE.N    ??dir_register_10
// 1497 		ne = (ne + 25) / 13;
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R0,R7,#+25
        MOVS     R1,#+13
        SDIV     R7,R0,R1
        B.N      ??dir_register_11
// 1498 	} else {						/* Otherwise reserve only an SFN entry. */
// 1499 		ne = 1;
??dir_register_8:
        MOVS     R7,#+1
// 1500 	}
// 1501 
// 1502 	/* Reserve contiguous entries */
// 1503 	res = dir_sdi(dj, 0);
??dir_register_11:
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       dir_sdi
        MOVS     R5,R0
// 1504 	if (res != FR_OK) return res;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_register_12
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??dir_register_1
// 1505 	n = is = 0;
??dir_register_12:
        MOVS     R8,#+0
        MOV      R6,R8
// 1506 	do {
// 1507 		res = move_window(dj->fs, dj->sect);
??dir_register_13:
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
        BL       move_window
        MOVS     R5,R0
// 1508 		if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_14
// 1509 		c = *dj->dir;				/* Check the entry status */
??dir_register_15:
        LDR      R0,[R4, #+20]
        LDRB     R0,[R0, #+0]
// 1510 		if (c == DDE || c == 0) {	/* Is it a blank entry? */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+229
        BEQ.N    ??dir_register_16
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_register_17
// 1511 			if (n == 0) is = dj->index;	/* First index of the contiguous entry */
??dir_register_16:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BNE.N    ??dir_register_18
        LDRH     R6,[R4, #+6]
// 1512 			if (++n == ne) break;	/* A contiguous entry that required count is found */
??dir_register_18:
        ADDS     R8,R8,#+1
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R0,R7
        BNE.N    ??dir_register_19
        B.N      ??dir_register_14
// 1513 		} else {
// 1514 			n = 0;					/* Not a blank entry. Restart to search */
??dir_register_17:
        MOVS     R8,#+0
// 1515 		}
// 1516 		res = dir_next(dj, 1);		/* Next entry with table stretch */
??dir_register_19:
        MOVS     R1,#+1
        MOVS     R0,R4
        BL       dir_next
        MOVS     R5,R0
// 1517 	} while (res == FR_OK);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??dir_register_13
// 1518 
// 1519 	if (res == FR_OK && ne > 1) {	/* Initialize LFN entry if needed */
??dir_register_14:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_20
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+2
        BCC.N    ??dir_register_20
// 1520 		res = dir_sdi(dj, is);
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       dir_sdi
        MOVS     R5,R0
// 1521 		if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_20
// 1522 			sum = sum_sfn(dj->fn);	/* Sum of the SFN tied to the LFN */
        LDR      R0,[R4, #+24]
        BL       sum_sfn
        MOVS     R6,R0
// 1523 			ne--;
        SUBS     R7,R7,#+1
// 1524 			do {					/* Store LFN entries in bottom first */
// 1525 				res = move_window(dj->fs, dj->sect);
??dir_register_21:
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
        BL       move_window
        MOVS     R5,R0
// 1526 				if (res != FR_OK) break;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_20
// 1527 				fit_lfn(dj->lfn, dj->dir, (BYTE)ne, sum);
??dir_register_22:
        MOVS     R3,R6
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+28]
        BL       fit_lfn
// 1528 				dj->fs->wflag = 1;
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 1529 				res = dir_next(dj, 0);	/* Next entry */
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       dir_next
        MOVS     R5,R0
// 1530 			} while (res == FR_OK && --ne);
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_20
        SUBS     R7,R7,#+1
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??dir_register_21
// 1531 		}
// 1532 	}
// 1533 
// 1534 #else	/* Non LFN configuration */
// 1535 	res = dir_sdi(dj, 0);
// 1536 	if (res == FR_OK) {
// 1537 		do {	/* Find a blank entry for the SFN */
// 1538 			res = move_window(dj->fs, dj->sect);
// 1539 			if (res != FR_OK) break;
// 1540 			c = *dj->dir;
// 1541 			if (c == DDE || c == 0) break;	/* Is it a blank entry? */
// 1542 			res = dir_next(dj, 1);			/* Next entry with table stretch */
// 1543 		} while (res == FR_OK);
// 1544 	}
// 1545 #endif
// 1546 
// 1547 	if (res == FR_OK) {		/* Initialize the SFN entry */
??dir_register_20:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_23
// 1548 		res = move_window(dj->fs, dj->sect);
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
        BL       move_window
        MOVS     R5,R0
// 1549 		if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??dir_register_23
// 1550 			dir = dj->dir;
        LDR      R6,[R4, #+20]
// 1551 			mem_set(dir, 0, SZ_DIR);	/* Clean the entry */
        MOVS     R2,#+32
        MOVS     R1,#+0
        MOVS     R0,R6
        BL       mem_set
// 1552 			mem_cpy(dir, dj->fn, 11);	/* Put SFN */
        MOVS     R2,#+11
        LDR      R1,[R4, #+24]
        MOVS     R0,R6
        BL       mem_cpy
// 1553 #if _USE_LFN
// 1554 			dir[DIR_NTres] = *(dj->fn+NS) & (NS_BODY | NS_EXT);	/* Put NT flag */
        LDR      R0,[R4, #+24]
        LDRB     R0,[R0, #+11]
        ANDS     R0,R0,#0x18
        STRB     R0,[R6, #+12]
// 1555 #endif
// 1556 			dj->fs->wflag = 1;
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 1557 		}
// 1558 	}
// 1559 
// 1560 	return res;
??dir_register_23:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??dir_register_1:
        ADD      SP,SP,#+16
        POP      {R4-R8,PC}       ;; return
// 1561 }
// 1562 #endif /* !_FS_READONLY */
// 1563 
// 1564 
// 1565 
// 1566 
// 1567 /*-----------------------------------------------------------------------*/
// 1568 /* Remove an object from the directory                                   */
// 1569 /*-----------------------------------------------------------------------*/
// 1570 #if !_FS_READONLY && !_FS_MINIMIZE

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1571 static
// 1572 FRESULT dir_remove (	/* FR_OK: Successful, FR_DISK_ERR: A disk error */
// 1573 	DIR *dj				/* Directory object pointing the entry to be removed */
// 1574 )
// 1575 {
dir_remove:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
// 1576 	FRESULT res;
// 1577 #if _USE_LFN	/* LFN configuration */
// 1578 	WORD i;
// 1579 
// 1580 	i = dj->index;	/* SFN index */
        LDRH     R5,[R4, #+6]
// 1581 	res = dir_sdi(dj, (WORD)((dj->lfn_idx == 0xFFFF) ? i : dj->lfn_idx));	/* Goto the SFN or top of the LFN entries */
        LDRH     R0,[R4, #+32]
        MOVW     R1,#+65535
        CMP      R0,R1
        BNE.N    ??dir_remove_0
        MOVS     R1,R5
        B.N      ??dir_remove_1
??dir_remove_0:
        LDRH     R1,[R4, #+32]
??dir_remove_1:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       dir_sdi
// 1582 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_remove_2
// 1583 		do {
// 1584 			res = move_window(dj->fs, dj->sect);
??dir_remove_3:
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
        BL       move_window
// 1585 			if (res != FR_OK) break;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??dir_remove_4
// 1586 			*dj->dir = DDE;			/* Mark the entry "deleted" */
??dir_remove_5:
        LDR      R1,[R4, #+20]
        MOVS     R2,#+229
        STRB     R2,[R1, #+0]
// 1587 			dj->fs->wflag = 1;
        LDR      R1,[R4, #+0]
        MOVS     R2,#+1
        STRB     R2,[R1, #+4]
// 1588 			if (dj->index >= i) break;	/* When reached SFN, all entries of the object has been deleted. */
        LDRH     R1,[R4, #+6]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R1,R5
        BCS.N    ??dir_remove_4
// 1589 			res = dir_next(dj, 0);		/* Next entry */
??dir_remove_6:
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       dir_next
// 1590 		} while (res == FR_OK);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??dir_remove_3
// 1591 		if (res == FR_NO_FILE) res = FR_INT_ERR;
??dir_remove_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??dir_remove_2
        MOVS     R0,#+2
// 1592 	}
// 1593 
// 1594 #else			/* Non LFN configuration */
// 1595 	res = dir_sdi(dj, dj->index);
// 1596 	if (res == FR_OK) {
// 1597 		res = move_window(dj->fs, dj->sect);
// 1598 		if (res == FR_OK) {
// 1599 			*dj->dir = DDE;			/* Mark the entry "deleted" */
// 1600 			dj->fs->wflag = 1;
// 1601 		}
// 1602 	}
// 1603 #endif
// 1604 
// 1605 	return res;
??dir_remove_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
// 1606 }
// 1607 #endif /* !_FS_READONLY */
// 1608 
// 1609 
// 1610 
// 1611 
// 1612 /*-----------------------------------------------------------------------*/
// 1613 /* Pick a segment and create the object name in directory form           */
// 1614 /*-----------------------------------------------------------------------*/
// 1615 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1616 static
// 1617 FRESULT create_name (
// 1618 	DIR *dj,			/* Pointer to the directory object */
// 1619 	const TCHAR **path	/* Pointer to pointer to the segment in the path string */
// 1620 )
// 1621 {
create_name:
        PUSH     {R0,R4-R11,LR}
        MOV      R8,R1
// 1622 #ifdef _EXCVT
// 1623 	static const BYTE excvt[] = _EXCVT;	/* Upper conversion table for extended chars */
// 1624 #endif
// 1625 
// 1626 #if _USE_LFN	/* LFN configuration */
// 1627 	BYTE b, cf;
// 1628 	WCHAR w, *lfn;
// 1629 	UINT i, ni, si, di;
// 1630 	const TCHAR *p;
// 1631 
// 1632 	/* Create LFN in Unicode */
// 1633 	for (p = *path; *p == '/' || *p == '\\'; p++) ;	/* Strip duplicated separator */
        LDR      R9,[R8, #+0]
        B.N      ??create_name_0
??create_name_1:
        ADDS     R9,R9,#+1
??create_name_0:
        LDRB     R0,[R9, #+0]
        CMP      R0,#+47
        BEQ.N    ??create_name_1
        LDRB     R0,[R9, #+0]
        CMP      R0,#+92
        BEQ.N    ??create_name_1
// 1634 	lfn = dj->lfn;
        LDR      R0,[SP, #+0]
        LDR      R6,[R0, #+28]
// 1635 	si = di = 0;
        MOVS     R4,#+0
        MOVS     R5,R4
        B.N      ??create_name_2
// 1636 	for (;;) {
// 1637 		w = p[si++];					/* Get a character */
// 1638 		if (w < ' ' || w == '/' || w == '\\') break;	/* Break on end of segment */
// 1639 		if (di >= _MAX_LFN)				/* Reject too long name */
// 1640 			return FR_INVALID_NAME;
// 1641 #if !_LFN_UNICODE
// 1642 		w &= 0xFF;
// 1643 		if (IsDBCS1(w)) {				/* Check if it is a DBC 1st byte (always false on SBCS cfg) */
// 1644 			b = (BYTE)p[si++];			/* Get 2nd byte */
// 1645 			if (!IsDBCS2(b))
// 1646 				return FR_INVALID_NAME;	/* Reject invalid sequence */
// 1647 			w = (w << 8) + b;			/* Create a DBC */
// 1648 		}
// 1649 		w = ff_convert(w, 1);			/* Convert ANSI/OEM to Unicode */
// 1650 		if (!w) return FR_INVALID_NAME;	/* Reject invalid code */
// 1651 #endif
// 1652 		if (w < 0x80 && chk_chr("\"*:<>\?|\x7F", w)) /* Reject illegal chars for LFN */
// 1653 			return FR_INVALID_NAME;
// 1654 		lfn[di++] = w;					/* Store the Unicode char */
??create_name_3:
        STRH     R7,[R6, R5, LSL #+1]
        ADDS     R5,R5,#+1
??create_name_2:
        LDRB     R7,[R4, R9]
        ADDS     R4,R4,#+1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+32
        BCC.N    ??create_name_4
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+47
        BEQ.N    ??create_name_4
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+92
        BNE.N    ??create_name_5
// 1655 	}
// 1656 	*path = &p[si];						/* Return pointer to the next segment */
??create_name_4:
        ADDS     R0,R4,R9
        STR      R0,[R8, #+0]
// 1657 	cf = (w < ' ') ? NS_LAST : 0;		/* Set last segment flag if end of path */
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+32
        BCS.N    ??create_name_6
        MOVS     R8,#+4
        B.N      ??create_name_7
??create_name_5:
        CMP      R5,#+255
        BCC.N    ??create_name_8
        MOVS     R0,#+6
        B.N      ??create_name_9
??create_name_8:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R1,#+1
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       ff_convert
        MOVS     R7,R0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BNE.N    ??create_name_10
        MOVS     R0,#+6
        B.N      ??create_name_9
??create_name_10:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+128
        BCS.N    ??create_name_3
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R1,R7
        LDR.W    R0,??DataTable7
        BL       chk_chr
        CMP      R0,#+0
        BEQ.N    ??create_name_3
        MOVS     R0,#+6
        B.N      ??create_name_9
??create_name_6:
        MOVS     R8,#+0
// 1658 #if _FS_RPATH
// 1659 	if ((di == 1 && lfn[di-1] == '.') || /* Is this a dot entry? */
// 1660 		(di == 2 && lfn[di-1] == '.' && lfn[di-2] == '.')) {
??create_name_7:
        CMP      R5,#+1
        BNE.N    ??create_name_11
        ADDS     R0,R6,R5, LSL #+1
        LDRH     R0,[R0, #-2]
        CMP      R0,#+46
        BEQ.N    ??create_name_12
??create_name_11:
        CMP      R5,#+2
        BNE.N    ??create_name_13
        ADDS     R0,R6,R5, LSL #+1
        LDRH     R0,[R0, #-2]
        CMP      R0,#+46
        BNE.N    ??create_name_13
        ADDS     R0,R6,R5, LSL #+1
        LDRH     R0,[R0, #-4]
        CMP      R0,#+46
        BNE.N    ??create_name_13
// 1661 		lfn[di] = 0;
??create_name_12:
        MOVS     R0,#+0
        STRH     R0,[R6, R5, LSL #+1]
// 1662 		for (i = 0; i < 11; i++)
        MOVS     R9,#+0
        B.N      ??create_name_14
// 1663 			dj->fn[i] = (i < di) ? '.' : ' ';
??create_name_15:
        MOVS     R0,#+32
??create_name_16:
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+24]
        STRB     R0,[R9, R1]
        ADDS     R9,R9,#+1
??create_name_14:
        CMP      R9,#+11
        BCS.N    ??create_name_17
        CMP      R9,R5
        BCS.N    ??create_name_15
        MOVS     R0,#+46
        B.N      ??create_name_16
// 1664 		dj->fn[i] = cf | NS_DOT;		/* This is a dot entry */
??create_name_17:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        ORRS     R1,R8,#0x20
        STRB     R1,[R9, R0]
// 1665 		return FR_OK;
        MOVS     R0,#+0
        B.N      ??create_name_9
// 1666 	}
// 1667 #endif
// 1668 	while (di) {						/* Strip trailing spaces and dots */
// 1669 		w = lfn[di-1];
// 1670 		if (w != ' ' && w != '.') break;
// 1671 		di--;
??create_name_18:
        SUBS     R5,R5,#+1
??create_name_13:
        CMP      R5,#+0
        BEQ.N    ??create_name_19
        ADDS     R0,R6,R5, LSL #+1
        LDRH     R7,[R0, #-2]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+32
        BEQ.N    ??create_name_18
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+46
        BEQ.N    ??create_name_18
// 1672 	}
// 1673 	if (!di) return FR_INVALID_NAME;	/* Reject nul string */
??create_name_19:
        CMP      R5,#+0
        BNE.N    ??create_name_20
        MOVS     R0,#+6
        B.N      ??create_name_9
// 1674 
// 1675 	lfn[di] = 0;						/* LFN is created */
??create_name_20:
        MOVS     R0,#+0
        STRH     R0,[R6, R5, LSL #+1]
// 1676 
// 1677 	/* Create SFN in directory form */
// 1678 	mem_set(dj->fn, ' ', 11);
        MOVS     R2,#+11
        MOVS     R1,#+32
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        BL       mem_set
// 1679 	for (si = 0; lfn[si] == ' ' || lfn[si] == '.'; si++) ;	/* Strip leading spaces and dots */
        MOVS     R4,#+0
        B.N      ??create_name_21
??create_name_22:
        ADDS     R4,R4,#+1
??create_name_21:
        LDRH     R0,[R6, R4, LSL #+1]
        CMP      R0,#+32
        BEQ.N    ??create_name_22
        LDRH     R0,[R6, R4, LSL #+1]
        CMP      R0,#+46
        BEQ.N    ??create_name_22
// 1680 	if (si) cf |= NS_LOSS | NS_LFN;
        CMP      R4,#+0
        BEQ.N    ??create_name_23
        ORRS     R8,R8,#0x3
        B.N      ??create_name_23
// 1681 	while (di && lfn[di - 1] != '.') di--;	/* Find extension (di<=si: no extension) */
??create_name_24:
        SUBS     R5,R5,#+1
??create_name_23:
        CMP      R5,#+0
        BEQ.N    ??create_name_25
        ADDS     R0,R6,R5, LSL #+1
        LDRH     R0,[R0, #-2]
        CMP      R0,#+46
        BNE.N    ??create_name_24
// 1682 
// 1683 	b = i = 0; ni = 8;
??create_name_25:
        MOVS     R10,#+0
        MOV      R9,R10
        MOVS     R11,#+8
        B.N      ??create_name_26
// 1684 	for (;;) {
// 1685 		w = lfn[si++];					/* Get an LFN char */
// 1686 		if (!w) break;					/* Break on end of the LFN */
// 1687 		if (w == ' ' || (w == '.' && si != di)) {	/* Remove spaces and dots */
// 1688 			cf |= NS_LOSS | NS_LFN; continue;
??create_name_27:
        ORRS     R8,R8,#0x3
// 1689 		}
??create_name_26:
        LDRH     R7,[R6, R4, LSL #+1]
        ADDS     R4,R4,#+1
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BNE.N    ??create_name_28
// 1690 
// 1691 		if (i >= ni || si == di) {		/* Extension or end of SFN */
// 1692 			if (ni == 11) {				/* Long extension */
// 1693 				cf |= NS_LOSS | NS_LFN; break;
// 1694 			}
// 1695 			if (si != di) cf |= NS_LOSS | NS_LFN;	/* Out of 8.3 format */
// 1696 			if (si > di) break;			/* No extension */
// 1697 			si = di; i = 8; ni = 11;	/* Enter extension section */
// 1698 			b <<= 2; continue;
// 1699 		}
// 1700 
// 1701 		if (w >= 0x80) {				/* Non ASCII char */
// 1702 #ifdef _EXCVT
// 1703 			w = ff_convert(w, 0);		/* Unicode -> OEM code */
// 1704 			if (w) w = excvt[w - 0x80];	/* Convert extended char to upper (SBCS) */
// 1705 #else
// 1706 			w = ff_convert(ff_wtoupper(w), 0);	/* Upper converted Unicode -> OEM code */
// 1707 #endif
// 1708 			cf |= NS_LFN;				/* Force create LFN entry */
// 1709 		}
// 1710 
// 1711 		if (_DF1S && w >= 0x100) {		/* Double byte char (always false on SBCS cfg) */
// 1712 			if (i >= ni - 1) {
// 1713 				cf |= NS_LOSS | NS_LFN; i = ni; continue;
// 1714 			}
// 1715 			dj->fn[i++] = (BYTE)(w >> 8);
// 1716 		} else {						/* Single byte char */
// 1717 			if (!w || chk_chr("+,;=[]", w)) {	/* Replace illegal chars for SFN */
// 1718 				w = '_'; cf |= NS_LOSS | NS_LFN;/* Lossy conversion */
// 1719 			} else {
// 1720 				if (IsUpper(w)) {		/* ASCII large capital */
// 1721 					b |= 2;
// 1722 				} else {
// 1723 					if (IsLower(w)) {	/* ASCII small capital */
// 1724 						b |= 1; w -= 0x20;
// 1725 					}
// 1726 				}
// 1727 			}
// 1728 		}
// 1729 		dj->fn[i++] = (BYTE)w;
// 1730 	}
// 1731 
// 1732 	if (dj->fn[0] == DDE) dj->fn[0] = NDDE;	/* If the first char collides with deleted mark, replace it with 0x05 */
??create_name_29:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+229
        BNE.N    ??create_name_30
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        MOVS     R1,#+5
        STRB     R1,[R0, #+0]
// 1733 
// 1734 	if (ni == 8) b <<= 2;
??create_name_30:
        CMP      R11,#+8
        BNE.N    ??create_name_31
        LSLS     R10,R10,#+2
// 1735 	if ((b & 0x0C) == 0x0C || (b & 0x03) == 0x03)	/* Create LFN entry when there are composite capitals */
??create_name_31:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ANDS     R0,R10,#0xC
        CMP      R0,#+12
        BEQ.N    ??create_name_32
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ANDS     R0,R10,#0x3
        CMP      R0,#+3
        BNE.N    ??create_name_33
// 1736 		cf |= NS_LFN;
??create_name_32:
        ORRS     R8,R8,#0x2
// 1737 	if (!(cf & NS_LFN)) {						/* When LFN is in 8.3 format without extended char, NT flags are created */
??create_name_33:
        LSLS     R0,R8,#+30
        BMI.N    ??create_name_34
// 1738 		if ((b & 0x03) == 0x01) cf |= NS_EXT;	/* NT flag (Extension has only small capital) */
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ANDS     R0,R10,#0x3
        CMP      R0,#+1
        BNE.N    ??create_name_35
        ORRS     R8,R8,#0x10
// 1739 		if ((b & 0x0C) == 0x04) cf |= NS_BODY;	/* NT flag (Filename has only small capital) */
??create_name_35:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ANDS     R0,R10,#0xC
        CMP      R0,#+4
        BNE.N    ??create_name_34
        ORRS     R8,R8,#0x8
// 1740 	}
// 1741 
// 1742 	dj->fn[NS] = cf;	/* SFN is created */
??create_name_34:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        STRB     R8,[R0, #+11]
// 1743 
// 1744 	return FR_OK;
        MOVS     R0,#+0
??create_name_9:
        POP      {R1,R4-R11,PC}   ;; return
??create_name_28:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+32
        BEQ.N    ??create_name_27
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+46
        BNE.N    ??create_name_36
        CMP      R4,R5
        BNE.N    ??create_name_27
??create_name_36:
        CMP      R9,R11
        BCS.N    ??create_name_37
        CMP      R4,R5
        BNE.N    ??create_name_38
??create_name_37:
        CMP      R11,#+11
        BNE.N    ??create_name_39
        ORRS     R8,R8,#0x3
        B.N      ??create_name_29
??create_name_39:
        CMP      R4,R5
        BEQ.N    ??create_name_40
        ORRS     R8,R8,#0x3
??create_name_40:
        CMP      R5,R4
        BCC.N    ??create_name_29
??create_name_41:
        MOVS     R4,R5
        MOVS     R9,#+8
        MOVS     R11,#+11
        LSLS     R10,R10,#+2
        B.N      ??create_name_26
??create_name_38:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+128
        BCC.N    ??create_name_42
        MOVS     R1,#+0
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       ff_convert
        MOVS     R7,R0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BEQ.N    ??create_name_43
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR.W    R0,??DataTable9
        ADDS     R0,R7,R0
        LDRB     R7,[R0, #-128]
??create_name_43:
        ORRS     R8,R8,#0x2
??create_name_42:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BEQ.N    ??create_name_44
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R1,R7
        LDR.W    R0,??DataTable9_1
        BL       chk_chr
        CMP      R0,#+0
        BEQ.N    ??create_name_45
??create_name_44:
        MOVS     R7,#+95
        ORRS     R8,R8,#0x3
        B.N      ??create_name_46
??create_name_45:
        SUBS     R0,R7,#+65
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+26
        BCS.N    ??create_name_47
        ORRS     R10,R10,#0x2
        B.N      ??create_name_46
??create_name_47:
        SUBS     R0,R7,#+97
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+26
        BCS.N    ??create_name_46
        ORRS     R10,R10,#0x1
        SUBS     R7,R7,#+32
??create_name_46:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        STRB     R7,[R9, R0]
        ADDS     R9,R9,#+1
        B.N      ??create_name_26
// 1745 
// 1746 
// 1747 #else	/* Non-LFN configuration */
// 1748 	BYTE b, c, d, *sfn;
// 1749 	UINT ni, si, i;
// 1750 	const char *p;
// 1751 
// 1752 	/* Create file name in directory form */
// 1753 	for (p = *path; *p == '/' || *p == '\\'; p++) ;	/* Strip duplicated separator */
// 1754 	sfn = dj->fn;
// 1755 	mem_set(sfn, ' ', 11);
// 1756 	si = i = b = 0; ni = 8;
// 1757 #if _FS_RPATH
// 1758 	if (p[si] == '.') { /* Is this a dot entry? */
// 1759 		for (;;) {
// 1760 			c = (BYTE)p[si++];
// 1761 			if (c != '.' || si >= 3) break;
// 1762 			sfn[i++] = c;
// 1763 		}
// 1764 		if (c != '/' && c != '\\' && c > ' ') return FR_INVALID_NAME;
// 1765 		*path = &p[si];									/* Return pointer to the next segment */
// 1766 		sfn[NS] = (c <= ' ') ? NS_LAST | NS_DOT : NS_DOT;	/* Set last segment flag if end of path */
// 1767 		return FR_OK;
// 1768 	}
// 1769 #endif
// 1770 	for (;;) {
// 1771 		c = (BYTE)p[si++];
// 1772 		if (c <= ' ' || c == '/' || c == '\\') break;	/* Break on end of segment */
// 1773 		if (c == '.' || i >= ni) {
// 1774 			if (ni != 8 || c != '.') return FR_INVALID_NAME;
// 1775 			i = 8; ni = 11;
// 1776 			b <<= 2; continue;
// 1777 		}
// 1778 		if (c >= 0x80) {				/* Extended char? */
// 1779 			b |= 3;						/* Eliminate NT flag */
// 1780 #ifdef _EXCVT
// 1781 			c = excvt[c-0x80];			/* Upper conversion (SBCS) */
// 1782 #else
// 1783 #if !_DF1S	/* ASCII only cfg */
// 1784 			return FR_INVALID_NAME;
// 1785 #endif
// 1786 #endif
// 1787 		}
// 1788 		if (IsDBCS1(c)) {				/* Check if it is a DBC 1st byte (always false on SBCS cfg) */
// 1789 			d = (BYTE)p[si++];			/* Get 2nd byte */
// 1790 			if (!IsDBCS2(d) || i >= ni - 1)	/* Reject invalid DBC */
// 1791 				return FR_INVALID_NAME;
// 1792 			sfn[i++] = c;
// 1793 			sfn[i++] = d;
// 1794 		} else {						/* Single byte code */
// 1795 			if (chk_chr("\"*+,:;<=>\?[]|\x7F", c))	/* Reject illegal chrs for SFN */
// 1796 				return FR_INVALID_NAME;
// 1797 			if (IsUpper(c)) {			/* ASCII large capital? */
// 1798 				b |= 2;
// 1799 			} else {
// 1800 				if (IsLower(c)) {		/* ASCII small capital? */
// 1801 					b |= 1; c -= 0x20;
// 1802 				}
// 1803 			}
// 1804 			sfn[i++] = c;
// 1805 		}
// 1806 	}
// 1807 	*path = &p[si];						/* Return pointer to the next segment */
// 1808 	c = (c <= ' ') ? NS_LAST : 0;		/* Set last segment flag if end of path */
// 1809 
// 1810 	if (!i) return FR_INVALID_NAME;		/* Reject nul string */
// 1811 	if (sfn[0] == DDE) sfn[0] = NDDE;	/* When first char collides with DDE, replace it with 0x05 */
// 1812 
// 1813 	if (ni == 8) b <<= 2;
// 1814 	if ((b & 0x03) == 0x01) c |= NS_EXT;	/* NT flag (Name extension has only small capital) */
// 1815 	if ((b & 0x0C) == 0x04) c |= NS_BODY;	/* NT flag (Name body has only small capital) */
// 1816 
// 1817 	sfn[NS] = c;		/* Store NT flag, File name is created */
// 1818 
// 1819 	return FR_OK;
// 1820 #endif
// 1821 }

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
??excvt:
        DATA
        DC8 128, 154, 144, 182, 142, 183, 143, 128, 210, 211, 212, 216, 215
        DC8 222, 142, 143, 144, 146, 146, 226, 153, 227, 234, 235, 89, 153, 154
        DC8 157, 156, 157, 158, 159, 181, 214, 224, 233, 165, 165, 166, 167
        DC8 168, 169, 170, 171, 172, 33, 174, 175, 176, 177, 178, 179, 180, 181
        DC8 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194
        DC8 195, 196, 197, 199, 199, 200, 201, 202, 203, 204, 205, 206, 207
        DC8 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220
        DC8 221, 222, 223, 224, 225, 226, 227, 229, 229, 230, 231, 231, 233
        DC8 234, 235, 237, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246
        DC8 247, 248, 249, 250, 251, 252, 253, 254, 255
// 1822 
// 1823 
// 1824 
// 1825 
// 1826 /*-----------------------------------------------------------------------*/
// 1827 /* Get file information from directory entry                             */
// 1828 /*-----------------------------------------------------------------------*/
// 1829 #if _FS_MINIMIZE <= 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1830 static
// 1831 void get_fileinfo (		/* No return code */
// 1832 	DIR *dj,			/* Pointer to the directory object */
// 1833 	FILINFO *fno	 	/* Pointer to the file information to be filled */
// 1834 )
// 1835 {
get_fileinfo:
        PUSH     {R3-R7,LR}
        MOVS     R4,R1
// 1836 	UINT i;
// 1837 	BYTE nt, *dir;
// 1838 	TCHAR *p, c;
// 1839 
// 1840 
// 1841 	p = fno->fname;
        ADDW     R1,R4,#+9
// 1842 	if (dj->sect) {
        LDR      R2,[R0, #+16]
        CMP      R2,#+0
        BEQ.N    ??get_fileinfo_0
// 1843 		dir = dj->dir;
        LDR      R2,[R0, #+20]
// 1844 		nt = dir[DIR_NTres];		/* NT flag */
        LDRB     R3,[R2, #+12]
// 1845 		for (i = 0; i < 8; i++) {	/* Copy name body */
        MOVS     R5,#+0
        B.N      ??get_fileinfo_1
// 1846 			c = dir[i];
// 1847 			if (c == ' ') break;
// 1848 			if (c == NDDE) c = (TCHAR)DDE;
??get_fileinfo_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+5
        BNE.N    ??get_fileinfo_3
        MOVS     R6,#+229
// 1849 			if (_USE_LFN && (nt & NS_BODY) && IsUpper(c)) c += 0x20;
??get_fileinfo_3:
        LSLS     R7,R3,#+28
        BPL.N    ??get_fileinfo_4
        SUBS     R7,R6,#+65
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+26
        BCS.N    ??get_fileinfo_4
        ADDS     R6,R6,#+32
// 1850 #if _LFN_UNICODE
// 1851 			if (IsDBCS1(c) && i < 7 && IsDBCS2(dir[i+1]))
// 1852 				c = (c << 8) | dir[++i];
// 1853 			c = ff_convert(c, 1);
// 1854 			if (!c) c = '?';
// 1855 #endif
// 1856 			*p++ = c;
??get_fileinfo_4:
        STRB     R6,[R1, #+0]
        ADDS     R1,R1,#+1
        ADDS     R5,R5,#+1
??get_fileinfo_1:
        CMP      R5,#+8
        BCS.N    ??get_fileinfo_5
        LDRB     R6,[R5, R2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+32
        BNE.N    ??get_fileinfo_2
// 1857 		}
// 1858 		if (dir[8] != ' ') {		/* Copy name extension */
??get_fileinfo_5:
        LDRB     R5,[R2, #+8]
        CMP      R5,#+32
        BEQ.N    ??get_fileinfo_6
// 1859 			*p++ = '.';
        MOVS     R5,#+46
        STRB     R5,[R1, #+0]
        ADDS     R1,R1,#+1
// 1860 			for (i = 8; i < 11; i++) {
        MOVS     R5,#+8
        B.N      ??get_fileinfo_7
// 1861 				c = dir[i];
// 1862 				if (c == ' ') break;
// 1863 				if (_USE_LFN && (nt & NS_EXT) && IsUpper(c)) c += 0x20;
??get_fileinfo_8:
        LSLS     R7,R3,#+27
        BPL.N    ??get_fileinfo_9
        SUBS     R7,R6,#+65
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+26
        BCS.N    ??get_fileinfo_9
        ADDS     R6,R6,#+32
// 1864 #if _LFN_UNICODE
// 1865 				if (IsDBCS1(c) && i < 10 && IsDBCS2(dir[i+1]))
// 1866 					c = (c << 8) | dir[++i];
// 1867 				c = ff_convert(c, 1);
// 1868 				if (!c) c = '?';
// 1869 #endif
// 1870 				*p++ = c;
??get_fileinfo_9:
        STRB     R6,[R1, #+0]
        ADDS     R1,R1,#+1
        ADDS     R5,R5,#+1
??get_fileinfo_7:
        CMP      R5,#+11
        BCS.N    ??get_fileinfo_6
        LDRB     R6,[R5, R2]
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+32
        BNE.N    ??get_fileinfo_8
// 1871 			}
// 1872 		}
// 1873 		fno->fattrib = dir[DIR_Attr];				/* Attribute */
??get_fileinfo_6:
        LDRB     R3,[R2, #+11]
        STRB     R3,[R4, #+8]
// 1874 		fno->fsize = LD_DWORD(dir+DIR_FileSize);	/* Size */
        LDRB     R3,[R2, #+31]
        LDRB     R5,[R2, #+30]
        LSLS     R5,R5,#+16
        ORRS     R3,R5,R3, LSL #+24
        LDRB     R5,[R2, #+29]
        ORRS     R3,R3,R5, LSL #+8
        LDRB     R5,[R2, #+28]
        ORRS     R3,R5,R3
        STR      R3,[R4, #+0]
// 1875 		fno->fdate = LD_WORD(dir+DIR_WrtDate);		/* Date */
        LDRB     R3,[R2, #+25]
        LDRB     R5,[R2, #+24]
        ORRS     R3,R5,R3, LSL #+8
        STRH     R3,[R4, #+4]
// 1876 		fno->ftime = LD_WORD(dir+DIR_WrtTime);		/* Time */
        LDRB     R3,[R2, #+23]
        LDRB     R2,[R2, #+22]
        ORRS     R2,R2,R3, LSL #+8
        STRH     R2,[R4, #+6]
// 1877 	}
// 1878 	*p = 0;		/* Terminate SFN str by a \0 */
??get_fileinfo_0:
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
// 1879 
// 1880 #if _USE_LFN
// 1881 	if (fno->lfname && fno->lfsize) {
        LDR      R1,[R4, #+24]
        CMP      R1,#+0
        BEQ.N    ??get_fileinfo_10
        LDR      R1,[R4, #+28]
        CMP      R1,#+0
        BEQ.N    ??get_fileinfo_10
// 1882 		TCHAR *tp = fno->lfname;
        LDR      R6,[R4, #+24]
// 1883 		WCHAR w, *lfn;
// 1884 
// 1885 		i = 0;
        MOVS     R5,#+0
// 1886 		if (dj->sect && dj->lfn_idx != 0xFFFF) {/* Get LFN if available */
        LDR      R1,[R0, #+16]
        CMP      R1,#+0
        BEQ.N    ??get_fileinfo_11
        LDRH     R1,[R0, #+32]
        MOVW     R2,#+65535
        CMP      R1,R2
        BEQ.N    ??get_fileinfo_11
// 1887 			lfn = dj->lfn;
        LDR      R7,[R0, #+28]
        B.N      ??get_fileinfo_12
// 1888 			while ((w = *lfn++) != 0) {			/* Get an LFN char */
// 1889 #if !_LFN_UNICODE
// 1890 				w = ff_convert(w, 0);			/* Unicode -> OEM conversion */
// 1891 				if (!w) { i = 0; break; }		/* Could not convert, no LFN */
// 1892 				if (_DF1S && w >= 0x100)		/* Put 1st byte if it is a DBC (always false on SBCS cfg) */
// 1893 					tp[i++] = (TCHAR)(w >> 8);
// 1894 #endif
// 1895 				if (i >= fno->lfsize - 1) { i = 0; break; }	/* Buffer overflow, no LFN */
// 1896 				tp[i++] = (TCHAR)w;
??get_fileinfo_13:
        STRB     R0,[R5, R6]
        ADDS     R5,R5,#+1
??get_fileinfo_12:
        LDRH     R0,[R7, #+0]
        ADDS     R7,R7,#+2
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??get_fileinfo_11
        MOVS     R1,#+0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       ff_convert
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??get_fileinfo_14
        MOVS     R5,#+0
        B.N      ??get_fileinfo_11
??get_fileinfo_14:
        LDR      R1,[R4, #+28]
        SUBS     R1,R1,#+1
        CMP      R5,R1
        BCC.N    ??get_fileinfo_13
        MOVS     R5,#+0
// 1897 			}
// 1898 		}
// 1899 		tp[i] = 0;	/* Terminate the LFN str by a \0 */
??get_fileinfo_11:
        MOVS     R0,#+0
        STRB     R0,[R5, R6]
// 1900 	}
// 1901 #endif
// 1902 }
??get_fileinfo_10:
        POP      {R0,R4-R7,PC}    ;; return
// 1903 #endif /* _FS_MINIMIZE <= 1 */
// 1904 
// 1905 
// 1906 
// 1907 
// 1908 /*-----------------------------------------------------------------------*/
// 1909 /* Follow a file path                                                    */
// 1910 /*-----------------------------------------------------------------------*/
// 1911 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1912 static
// 1913 FRESULT follow_path (	/* FR_OK(0): successful, !=0: error code */
// 1914 	DIR *dj,			/* Directory object to return last directory and found object */
// 1915 	const TCHAR *path	/* Full-path string to find a file or directory */
// 1916 )
// 1917 {
follow_path:
        PUSH     {R0,R1,R4,LR}
        MOVS     R4,R0
// 1918 	FRESULT res;
// 1919 	BYTE *dir, ns;
// 1920 
// 1921 
// 1922 #if _FS_RPATH
// 1923 	if (*path == '/' || *path == '\\') { /* There is a heading separator */
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+47
        BEQ.N    ??follow_path_0
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+92
        BNE.N    ??follow_path_1
// 1924 		path++;	dj->sclust = 0;		/* Strip it and start from the root dir */
??follow_path_0:
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
        B.N      ??follow_path_2
// 1925 	} else {							/* No heading separator */
// 1926 		dj->sclust = dj->fs->cdir;	/* Start from the current dir */
??follow_path_1:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+24]
        STR      R0,[R4, #+8]
// 1927 	}
// 1928 #else
// 1929 	if (*path == '/' || *path == '\\')	/* Strip heading separator if exist */
// 1930 		path++;
// 1931 	dj->sclust = 0;						/* Start from the root dir */
// 1932 #endif
// 1933 
// 1934 	if ((UINT)*path < ' ') {			/* Nul path means the start directory itself */
??follow_path_2:
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+32
        BCS.N    ??follow_path_3
// 1935 		res = dir_sdi(dj, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       dir_sdi
// 1936 		dj->dir = 0;
        MOVS     R1,#+0
        STR      R1,[R4, #+20]
// 1937 
// 1938 	} else {							/* Follow path */
// 1939 		for (;;) {
// 1940 			res = create_name(dj, &path);	/* Get a segment */
// 1941 			if (res != FR_OK) break;
// 1942 			res = dir_find(dj);				/* Find it */
// 1943 			ns = *(dj->fn+NS);
// 1944 			if (res != FR_OK) {				/* Failed to find the object */
// 1945 				if (res != FR_NO_FILE) break;	/* Abort if any hard error occured */
// 1946 				/* Object not found */
// 1947 				if (_FS_RPATH && (ns & NS_DOT)) {	/* If dot entry is not exit */
// 1948 					dj->sclust = 0; dj->dir = 0;	/* It is the root dir */
// 1949 					res = FR_OK;
// 1950 					if (!(ns & NS_LAST)) continue;
// 1951 				} else {							/* Could not find the object */
// 1952 					if (!(ns & NS_LAST)) res = FR_NO_PATH;
// 1953 				}
// 1954 				break;
// 1955 			}
// 1956 			if (ns & NS_LAST) break;			/* Last segment match. Function completed. */
// 1957 			dir = dj->dir;						/* There is next segment. Follow the sub directory */
// 1958 			if (!(dir[DIR_Attr] & AM_DIR)) {	/* Cannot follow because it is a file */
// 1959 				res = FR_NO_PATH; break;
// 1960 			}
// 1961 			dj->sclust = LD_CLUST(dir);
// 1962 		}
// 1963 	}
// 1964 
// 1965 	return res;
??follow_path_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4,PC}    ;; return
??follow_path_5:
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
        MOVS     R0,#+0
        STR      R0,[R4, #+20]
        MOVS     R0,#+0
        LSLS     R1,R1,#+29
        BMI.N    ??follow_path_6
??follow_path_3:
        ADD      R1,SP,#+4
        MOVS     R0,R4
        BL       create_name
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??follow_path_4
??follow_path_7:
        MOVS     R0,R4
        BL       dir_find
        LDR      R1,[R4, #+24]
        LDRB     R1,[R1, #+11]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??follow_path_8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??follow_path_4
??follow_path_9:
        LSLS     R2,R1,#+26
        BMI.N    ??follow_path_5
        LSLS     R1,R1,#+29
        BMI.N    ??follow_path_6
        MOVS     R0,#+5
??follow_path_6:
        B.N      ??follow_path_4
??follow_path_8:
        LSLS     R1,R1,#+29
        BMI.N    ??follow_path_4
??follow_path_10:
        LDR      R0,[R4, #+20]
        LDRB     R1,[R0, #+11]
        LSLS     R1,R1,#+27
        BMI.N    ??follow_path_11
        MOVS     R0,#+5
        B.N      ??follow_path_4
??follow_path_11:
        LDRB     R1,[R0, #+21]
        LDRB     R2,[R0, #+20]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDRB     R2,[R0, #+27]
        LDRB     R0,[R0, #+26]
        ORRS     R0,R0,R2, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ORRS     R0,R0,R1, LSL #+16
        STR      R0,[R4, #+8]
        B.N      ??follow_path_3
// 1966 }
// 1967 
// 1968 
// 1969 
// 1970 
// 1971 /*-----------------------------------------------------------------------*/
// 1972 /* Load boot record and check if it is an FAT boot record                */
// 1973 /*-----------------------------------------------------------------------*/
// 1974 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1975 static
// 1976 BYTE check_fs (	/* 0:The FAT BR, 1:Valid BR but not an FAT, 2:Not a BR, 3:Disk error */
// 1977 	FATFS *fs,	/* File system object */
// 1978 	DWORD sect	/* Sector# (lba) to check if it is an FAT boot record or not */
// 1979 )
// 1980 {
check_fs:
        PUSH     {R4,LR}
        MOVS     R4,R0
// 1981 	if (disk_read(fs->drv, fs->win, sect, 1) != RES_OK)	/* Load boot record */
        MOVS     R3,#+1
        MOVS     R2,R1
        ADDS     R1,R4,#+52
        LDRB     R0,[R4, #+1]
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??check_fs_0
// 1982 		return 3;
        MOVS     R0,#+3
        B.N      ??check_fs_1
// 1983 	if (LD_WORD(&fs->win[BS_55AA]) != 0xAA55)		/* Check record signature (always placed at offset 510 even if the sector size is >512) */
??check_fs_0:
        LDRB     R0,[R4, #+563]
        LDRB     R1,[R4, #+562]
        ORRS     R0,R1,R0, LSL #+8
        MOVW     R1,#+43605
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BEQ.N    ??check_fs_2
// 1984 		return 2;
        MOVS     R0,#+2
        B.N      ??check_fs_1
// 1985 
// 1986 	if ((LD_DWORD(&fs->win[BS_FilSysType]) & 0xFFFFFF) == 0x544146)	/* Check "FAT" string */
??check_fs_2:
        LDRB     R0,[R4, #+108]
        LDRB     R1,[R4, #+107]
        LSLS     R1,R1,#+8
        ORRS     R0,R1,R0, LSL #+16
        LDRB     R1,[R4, #+106]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable9_2  ;; 0x544146
        CMP      R0,R1
        BNE.N    ??check_fs_3
// 1987 		return 0;
        MOVS     R0,#+0
        B.N      ??check_fs_1
// 1988 	if ((LD_DWORD(&fs->win[BS_FilSysType32]) & 0xFFFFFF) == 0x544146)
??check_fs_3:
        LDRB     R0,[R4, #+136]
        LDRB     R1,[R4, #+135]
        LSLS     R1,R1,#+8
        ORRS     R0,R1,R0, LSL #+16
        LDRB     R1,[R4, #+134]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable9_2  ;; 0x544146
        CMP      R0,R1
        BNE.N    ??check_fs_4
// 1989 		return 0;
        MOVS     R0,#+0
        B.N      ??check_fs_1
// 1990 
// 1991 	return 1;
??check_fs_4:
        MOVS     R0,#+1
??check_fs_1:
        POP      {R4,PC}          ;; return
// 1992 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     LfnOfs
// 1993 
// 1994 
// 1995 
// 1996 
// 1997 /*-----------------------------------------------------------------------*/
// 1998 /* Check if the file system object is valid or not                       */
// 1999 /*-----------------------------------------------------------------------*/
// 2000 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2001 static
// 2002 FRESULT chk_mounted (	/* FR_OK(0): successful, !=0: any error occurred */
// 2003 	const TCHAR **path,	/* Pointer to pointer to the path name (drive number) */
// 2004 	FATFS **rfs,		/* Pointer to pointer to the found file system object */
// 2005 	BYTE chk_wp			/* !=0: Check media write protection for write access */
// 2006 )
// 2007 {
chk_mounted:
        PUSH     {R3-R7,LR}
        MOVS     R5,R2
// 2008 	BYTE fmt, b, *tbl;
// 2009 	UINT vol;
// 2010 	DSTATUS stat;
// 2011 	DWORD bsect, fasize, tsect, sysect, nclst, szbfat;
// 2012 	WORD nrsv;
// 2013 	const TCHAR *p = *path;
        LDR      R2,[R0, #+0]
// 2014 	FATFS *fs;
// 2015 
// 2016 	/* Get logical drive number from the path name */
// 2017 	vol = p[0] - '0';					/* Is there a drive number? */
        LDRB     R3,[R2, #+0]
        SUBS     R6,R3,#+48
// 2018 	if (vol <= 9 && p[1] == ':') {		/* Found a drive number, get and strip it */
        CMP      R6,#+10
        BCS.N    ??chk_mounted_0
        LDRB     R3,[R2, #+1]
        CMP      R3,#+58
        BNE.N    ??chk_mounted_0
// 2019 		p += 2; *path = p;				/* Return pointer to the path name */
        ADDS     R2,R2,#+2
        STR      R2,[R0, #+0]
        B.N      ??chk_mounted_1
// 2020 	} else {							/* No drive number is given */
// 2021 #if _FS_RPATH
// 2022 		vol = CurrVol;					/* Use current drive */
??chk_mounted_0:
        LDR.W    R0,??DataTable9_3
        LDRB     R6,[R0, #+0]
// 2023 #else
// 2024 		vol = 0;						/* Use drive 0 */
// 2025 #endif
// 2026 	}
// 2027 
// 2028 	/* Check if the logical drive is valid or not */
// 2029 	if (vol >= _VOLUMES) 				/* Is the drive number valid? */
??chk_mounted_1:
        CMP      R6,#+0
        BEQ.N    ??chk_mounted_2
// 2030 		return FR_INVALID_DRIVE;
        MOVS     R0,#+11
        B.N      ??chk_mounted_3
// 2031 	*rfs = fs = FatFs[vol];				/* Return pointer to the corresponding file system object */
??chk_mounted_2:
        LDR.W    R0,??DataTable9_4
        LDR      R4,[R0, R6, LSL #+2]
        STR      R4,[R1, #+0]
// 2032 	if (!fs) return FR_NOT_ENABLED;		/* Is the file system object available? */
        CMP      R4,#+0
        BNE.N    ??chk_mounted_4
        MOVS     R0,#+12
        B.N      ??chk_mounted_3
// 2033 
// 2034 	ENTER_FF(fs);						/* Lock file system */
// 2035 
// 2036 	if (fs->fs_type) {					/* If the logical drive has been mounted */
??chk_mounted_4:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??chk_mounted_5
// 2037 		stat = disk_status(fs->drv);
        LDRB     R0,[R4, #+1]
        BL       disk_status
// 2038 		if (!(stat & STA_NOINIT)) {		/* and the physical drive is kept initialized (has not been changed), */
        LSLS     R1,R0,#+31
        BMI.N    ??chk_mounted_5
// 2039 #if !_FS_READONLY
// 2040 			if (chk_wp && (stat & STA_PROTECT))	/* Check write protection if needed */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??chk_mounted_6
        LSLS     R0,R0,#+29
        BPL.N    ??chk_mounted_6
// 2041 				return FR_WRITE_PROTECTED;
        MOVS     R0,#+10
        B.N      ??chk_mounted_3
// 2042 #endif
// 2043 			return FR_OK;				/* The file system object is valid */
??chk_mounted_6:
        MOVS     R0,#+0
        B.N      ??chk_mounted_3
// 2044 		}
// 2045 	}
// 2046 
// 2047 	/* The logical drive must be mounted. */
// 2048 	/* Following code attempts to mount a volume. (analyze BPB and initialize the fs object) */
// 2049 
// 2050 	fs->fs_type = 0;					/* Clear the file system object */
??chk_mounted_5:
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
// 2051 	fs->drv = (BYTE)LD2PD(vol);			/* Bind the logical drive and a physical drive */
        STRB     R6,[R4, #+1]
// 2052 	stat = disk_initialize(fs->drv);	/* Initialize low level disk I/O layer */
        LDRB     R0,[R4, #+1]
        BL       disk_initialize
// 2053 	if (stat & STA_NOINIT)				/* Check if the initialization succeeded */
        LSLS     R1,R0,#+31
        BPL.N    ??chk_mounted_7
// 2054 		return FR_NOT_READY;			/* Failed to initialize due to no media or hard error */
        MOVS     R0,#+3
        B.N      ??chk_mounted_3
// 2055 #if _MAX_SS != 512						/* Get disk sector size (variable sector size cfg only) */
// 2056 	if (disk_ioctl(fs->drv, GET_SECTOR_SIZE, &fs->ssize) != RES_OK)
// 2057 		return FR_DISK_ERR;
// 2058 #endif
// 2059 #if !_FS_READONLY
// 2060 	if (chk_wp && (stat & STA_PROTECT))	/* Check disk write protection if needed */
??chk_mounted_7:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??chk_mounted_8
        LSLS     R0,R0,#+29
        BPL.N    ??chk_mounted_8
// 2061 		return FR_WRITE_PROTECTED;
        MOVS     R0,#+10
        B.N      ??chk_mounted_3
// 2062 #endif
// 2063 	/* Search FAT partition on the drive. Supports only generic partitionings, FDISK and SFD. */
// 2064 	fmt = check_fs(fs, bsect = 0);		/* Check sector 0 if it is a VBR */
??chk_mounted_8:
        MOVS     R5,#+0
        MOVS     R1,R5
        MOVS     R0,R4
        BL       check_fs
        MOVS     R6,R0
// 2065 	if (fmt == 1) {						/* Not an FAT-VBR, the disk may be partitioned */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??chk_mounted_9
// 2066 		/* Check the partition listed in top of the partition table */
// 2067 		tbl = &fs->win[MBR_Table + LD2PT(vol) * SZ_PTE];/* Partition table */
        ADDW     R0,R4,#+498
// 2068 		if (tbl[4]) {									/* Is the partition existing? */
        LDRB     R1,[R0, #+4]
        CMP      R1,#+0
        BEQ.N    ??chk_mounted_9
// 2069 			bsect = LD_DWORD(&tbl[8]);					/* Partition offset in LBA */
        LDRB     R1,[R0, #+11]
        LDRB     R2,[R0, #+10]
        LSLS     R2,R2,#+16
        ORRS     R1,R2,R1, LSL #+24
        LDRB     R2,[R0, #+9]
        ORRS     R1,R1,R2, LSL #+8
        LDRB     R0,[R0, #+8]
        ORRS     R5,R0,R1
// 2070 			fmt = check_fs(fs, bsect);					/* Check the partition */
        MOVS     R1,R5
        MOVS     R0,R4
        BL       check_fs
        MOVS     R6,R0
// 2071 		}
// 2072 	}
// 2073 	if (fmt == 3) return FR_DISK_ERR;
??chk_mounted_9:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BNE.N    ??chk_mounted_10
        MOVS     R0,#+1
        B.N      ??chk_mounted_3
// 2074 	if (fmt) return FR_NO_FILESYSTEM;					/* No FAT volume is found */
??chk_mounted_10:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??chk_mounted_11
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2075 
// 2076 	/* Following code initializes the file system object */
// 2077 
// 2078 	if (LD_WORD(fs->win+BPB_BytsPerSec) != SS(fs))		/* (BPB_BytsPerSec must be equal to the physical sector size) */
??chk_mounted_11:
        LDRB     R0,[R4, #+64]
        LDRB     R1,[R4, #+63]
        ORRS     R0,R1,R0, LSL #+8
        MOV      R1,#+512
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BEQ.N    ??chk_mounted_12
// 2079 		return FR_NO_FILESYSTEM;
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2080 
// 2081 	fasize = LD_WORD(fs->win+BPB_FATSz16);				/* Number of sectors per FAT */
??chk_mounted_12:
        LDRB     R0,[R4, #+75]
        LDRB     R1,[R4, #+74]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
// 2082 	if (!fasize) fasize = LD_DWORD(fs->win+BPB_FATSz32);
        CMP      R0,#+0
        BNE.N    ??chk_mounted_13
        LDRB     R0,[R4, #+91]
        LDRB     R1,[R4, #+90]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+89]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+88]
        ORRS     R0,R1,R0
// 2083 	fs->fsize = fasize;
??chk_mounted_13:
        STR      R0,[R4, #+32]
// 2084 
// 2085 	fs->n_fats = b = fs->win[BPB_NumFATs];				/* Number of FAT copies */
        LDRB     R1,[R4, #+68]
        STRB     R1,[R4, #+3]
// 2086 	if (b != 1 && b != 2) return FR_NO_FILESYSTEM;		/* (Must be 1 or 2) */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BEQ.N    ??chk_mounted_14
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+2
        BEQ.N    ??chk_mounted_14
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2087 	fasize *= b;										/* Number of sectors for FAT area */
??chk_mounted_14:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MULS     R0,R1,R0
// 2088 
// 2089 	fs->csize = b = fs->win[BPB_SecPerClus];			/* Number of sectors per cluster */
        LDRB     R1,[R4, #+65]
        STRB     R1,[R4, #+2]
// 2090 	if (!b || (b & (b - 1))) return FR_NO_FILESYSTEM;	/* (Must be power of 2) */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??chk_mounted_15
        SUBS     R2,R1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        TST      R1,R2
        BEQ.N    ??chk_mounted_16
??chk_mounted_15:
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2091 
// 2092 	fs->n_rootdir = LD_WORD(fs->win+BPB_RootEntCnt);	/* Number of root directory entries */
??chk_mounted_16:
        LDRB     R1,[R4, #+70]
        LDRB     R2,[R4, #+69]
        ORRS     R1,R2,R1, LSL #+8
        STRH     R1,[R4, #+8]
// 2093 	if (fs->n_rootdir % (SS(fs) / SZ_DIR)) return FR_NO_FILESYSTEM;	/* (BPB_RootEntCnt must be sector aligned) */
        LDRH     R1,[R4, #+8]
        MOVS     R2,#+16
        UDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        CMP      R3,#+0
        BEQ.N    ??chk_mounted_17
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2094 
// 2095 	tsect = LD_WORD(fs->win+BPB_TotSec16);				/* Number of sectors on the volume */
??chk_mounted_17:
        LDRB     R1,[R4, #+72]
        LDRB     R2,[R4, #+71]
        ORRS     R2,R2,R1, LSL #+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
// 2096 	if (!tsect) tsect = LD_DWORD(fs->win+BPB_TotSec32);
        CMP      R2,#+0
        BNE.N    ??chk_mounted_18
        LDRB     R1,[R4, #+87]
        LDRB     R2,[R4, #+86]
        LSLS     R2,R2,#+16
        ORRS     R1,R2,R1, LSL #+24
        LDRB     R2,[R4, #+85]
        ORRS     R1,R1,R2, LSL #+8
        LDRB     R2,[R4, #+84]
        ORRS     R2,R2,R1
// 2097 
// 2098 	nrsv = LD_WORD(fs->win+BPB_RsvdSecCnt);				/* Number of reserved sectors */
??chk_mounted_18:
        LDRB     R1,[R4, #+67]
        LDRB     R3,[R4, #+66]
        ORRS     R1,R3,R1, LSL #+8
// 2099 	if (!nrsv) return FR_NO_FILESYSTEM;					/* (BPB_RsvdSecCnt must not be 0) */
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BNE.N    ??chk_mounted_19
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2100 
// 2101 	/* Determine the FAT sub type */
// 2102 	sysect = nrsv + fasize + fs->n_rootdir / (SS(fs) / SZ_DIR);	/* RSV+FAT+DIR */
??chk_mounted_19:
        UXTAH    R3,R0,R1
        LDRH     R6,[R4, #+8]
        ADDS     R3,R3,R6, LSR #+4
// 2103 	if (tsect < sysect) return FR_NO_FILESYSTEM;		/* (Invalid volume size) */
        CMP      R2,R3
        BCS.N    ??chk_mounted_20
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2104 	nclst = (tsect - sysect) / fs->csize;				/* Number of clusters */
??chk_mounted_20:
        SUBS     R2,R2,R3
        LDRB     R6,[R4, #+2]
        UDIV     R2,R2,R6
// 2105 	if (!nclst) return FR_NO_FILESYSTEM;				/* (Invalid volume size) */
        CMP      R2,#+0
        BNE.N    ??chk_mounted_21
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2106 	fmt = FS_FAT12;
??chk_mounted_21:
        MOVS     R6,#+1
// 2107 	if (nclst >= MIN_FAT16) fmt = FS_FAT16;
        MOVW     R7,#+4086
        CMP      R2,R7
        BCC.N    ??chk_mounted_22
        MOVS     R6,#+2
// 2108 	if (nclst >= MIN_FAT32) fmt = FS_FAT32;
??chk_mounted_22:
        MOVW     R7,#+65526
        CMP      R2,R7
        BCC.N    ??chk_mounted_23
        MOVS     R6,#+3
// 2109 
// 2110 	/* Boundaries and Limits */
// 2111 	fs->n_fatent = nclst + 2;							/* Number of FAT entries */
??chk_mounted_23:
        ADDS     R2,R2,#+2
        STR      R2,[R4, #+28]
// 2112 	fs->database = bsect + sysect;						/* Data start sector */
        ADDS     R2,R3,R5
        STR      R2,[R4, #+44]
// 2113 	fs->fatbase = bsect + nrsv; 						/* FAT start sector */
        UXTAH    R1,R5,R1
        STR      R1,[R4, #+36]
// 2114 	if (fmt == FS_FAT32) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BNE.N    ??chk_mounted_24
// 2115 		if (fs->n_rootdir) return FR_NO_FILESYSTEM;		/* (BPB_RootEntCnt must be 0) */
        LDRH     R0,[R4, #+8]
        CMP      R0,#+0
        BEQ.N    ??chk_mounted_25
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2116 		fs->dirbase = LD_DWORD(fs->win+BPB_RootClus);	/* Root directory start cluster */
??chk_mounted_25:
        LDRB     R0,[R4, #+99]
        LDRB     R1,[R4, #+98]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+97]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+96]
        ORRS     R0,R1,R0
        STR      R0,[R4, #+40]
// 2117 		szbfat = fs->n_fatent * 4;						/* (Required FAT size) */
        LDR      R0,[R4, #+28]
        LSLS     R0,R0,#+2
        B.N      ??chk_mounted_26
// 2118 	} else {
// 2119 		if (!fs->n_rootdir)	return FR_NO_FILESYSTEM;	/* (BPB_RootEntCnt must not be 0) */
??chk_mounted_24:
        LDRH     R1,[R4, #+8]
        CMP      R1,#+0
        BNE.N    ??chk_mounted_27
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2120 		fs->dirbase = fs->fatbase + fasize;				/* Root directory start sector */
??chk_mounted_27:
        LDR      R1,[R4, #+36]
        ADDS     R0,R0,R1
        STR      R0,[R4, #+40]
// 2121 		szbfat = (fmt == FS_FAT16) ?					/* (Required FAT size) */
// 2122 			fs->n_fatent * 2 : fs->n_fatent * 3 / 2 + (fs->n_fatent & 1);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+2
        BNE.N    ??chk_mounted_28
        LDR      R0,[R4, #+28]
        LSLS     R0,R0,#+1
        B.N      ??chk_mounted_26
??chk_mounted_28:
        LDR      R0,[R4, #+28]
        MOVS     R1,#+3
        MULS     R0,R1,R0
        LDRB     R1,[R4, #+28]
        ANDS     R1,R1,#0x1
        ADDS     R0,R1,R0, LSR #+1
// 2123 	}
// 2124 	if (fs->fsize < (szbfat + (SS(fs) - 1)) / SS(fs))	/* (BPB_FATSz must not be less than required) */
??chk_mounted_26:
        LDR      R1,[R4, #+32]
        ADDW     R0,R0,#+511
        CMP      R1,R0, LSR #+9
        BCS.N    ??chk_mounted_29
// 2125 		return FR_NO_FILESYSTEM;
        MOVS     R0,#+13
        B.N      ??chk_mounted_3
// 2126 
// 2127 #if !_FS_READONLY
// 2128 	/* Initialize cluster allocation information */
// 2129 	fs->free_clust = 0xFFFFFFFF;
??chk_mounted_29:
        MOVS     R0,#-1
        STR      R0,[R4, #+16]
// 2130 	fs->last_clust = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+12]
// 2131 
// 2132 	/* Get fsinfo if available */
// 2133 	if (fmt == FS_FAT32) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BNE.N    ??chk_mounted_30
// 2134 	 	fs->fsi_flag = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+5]
// 2135 		fs->fsi_sector = bsect + LD_WORD(fs->win+BPB_FSInfo);
        LDRB     R0,[R4, #+101]
        LDRB     R1,[R4, #+100]
        ORRS     R0,R1,R0, LSL #+8
        UXTAH    R0,R5,R0
        STR      R0,[R4, #+20]
// 2136 		if (disk_read(fs->drv, fs->win, fs->fsi_sector, 1) == RES_OK &&
// 2137 			LD_WORD(fs->win+BS_55AA) == 0xAA55 &&
// 2138 			LD_DWORD(fs->win+FSI_LeadSig) == 0x41615252 &&
// 2139 			LD_DWORD(fs->win+FSI_StrucSig) == 0x61417272) {
        MOVS     R3,#+1
        LDR      R2,[R4, #+20]
        ADDS     R1,R4,#+52
        LDRB     R0,[R4, #+1]
        BL       disk_read
        CMP      R0,#+0
        BNE.N    ??chk_mounted_30
        LDRB     R0,[R4, #+563]
        LDRB     R1,[R4, #+562]
        ORRS     R0,R1,R0, LSL #+8
        MOVW     R1,#+43605
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BNE.N    ??chk_mounted_30
        LDRB     R0,[R4, #+55]
        LDRB     R1,[R4, #+54]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+53]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+52]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable12  ;; 0x41615252
        CMP      R0,R1
        BNE.N    ??chk_mounted_30
        LDRB     R0,[R4, #+539]
        LDRB     R1,[R4, #+538]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+537]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+536]
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable12_1  ;; 0x61417272
        CMP      R0,R1
        BNE.N    ??chk_mounted_30
// 2140 				fs->last_clust = LD_DWORD(fs->win+FSI_Nxt_Free);
        LDRB     R0,[R4, #+547]
        LDRB     R1,[R4, #+546]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+545]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+544]
        ORRS     R0,R1,R0
        STR      R0,[R4, #+12]
// 2141 				fs->free_clust = LD_DWORD(fs->win+FSI_Free_Count);
        LDRB     R0,[R4, #+543]
        LDRB     R1,[R4, #+542]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R4, #+541]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R4, #+540]
        ORRS     R0,R1,R0
        STR      R0,[R4, #+16]
// 2142 		}
// 2143 	}
// 2144 #endif
// 2145 	fs->fs_type = fmt;		/* FAT sub-type */
??chk_mounted_30:
        STRB     R6,[R4, #+0]
// 2146 	fs->id = ++Fsid;		/* File system mount ID */
        LDR.W    R0,??DataTable12_2
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable12_2
        STRH     R0,[R1, #+0]
        STRH     R0,[R4, #+6]
// 2147 	fs->winsect = 0;		/* Invalidate sector cache */
        MOVS     R0,#+0
        STR      R0,[R4, #+48]
// 2148 	fs->wflag = 0;
        MOVS     R0,#+0
        STRB     R0,[R4, #+4]
// 2149 #if _FS_RPATH
// 2150 	fs->cdir = 0;			/* Current directory (root dir) */
        MOVS     R0,#+0
        STR      R0,[R4, #+24]
// 2151 #endif
// 2152 #if _FS_SHARE				/* Clear file lock semaphores */
// 2153 	clear_lock(fs);
// 2154 #endif
// 2155 
// 2156 	return FR_OK;
        MOVS     R0,#+0
??chk_mounted_3:
        POP      {R1,R4-R7,PC}    ;; return
// 2157 }
// 2158 
// 2159 
// 2160 
// 2161 
// 2162 /*-----------------------------------------------------------------------*/
// 2163 /* Check if the file/dir object is valid or not                          */
// 2164 /*-----------------------------------------------------------------------*/
// 2165 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2166 static
// 2167 FRESULT validate (	/* FR_OK(0): The object is valid, !=0: Invalid */
// 2168 	FATFS *fs,		/* Pointer to the file system object */
// 2169 	WORD id			/* Member id of the target object to be checked */
// 2170 )
// 2171 {
validate:
        PUSH     {R7,LR}
// 2172 	if (!fs || !fs->fs_type || fs->id != id)
        CMP      R0,#+0
        BEQ.N    ??validate_0
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BEQ.N    ??validate_0
        LDRH     R2,[R0, #+6]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R2,R1
        BEQ.N    ??validate_1
// 2173 		return FR_INVALID_OBJECT;
??validate_0:
        MOVS     R0,#+9
        B.N      ??validate_2
// 2174 
// 2175 	ENTER_FF(fs);		/* Lock file system */
// 2176 
// 2177 	if (disk_status(fs->drv) & STA_NOINIT)
??validate_1:
        LDRB     R0,[R0, #+1]
        BL       disk_status
        LSLS     R0,R0,#+31
        BPL.N    ??validate_3
// 2178 		return FR_NOT_READY;
        MOVS     R0,#+3
        B.N      ??validate_2
// 2179 
// 2180 	return FR_OK;
??validate_3:
        MOVS     R0,#+0
??validate_2:
        POP      {R1,PC}          ;; return
// 2181 }
// 2182 
// 2183 
// 2184 
// 2185 
// 2186 /*--------------------------------------------------------------------------
// 2187 
// 2188    Public Functions
// 2189 
// 2190 --------------------------------------------------------------------------*/
// 2191 
// 2192 
// 2193 
// 2194 /*-----------------------------------------------------------------------*/
// 2195 /* Mount/Unmount a Logical Drive                                         */
// 2196 /*-----------------------------------------------------------------------*/
// 2197 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2198 FRESULT f_mount (
// 2199 	BYTE vol,		/* Logical drive number to be mounted/unmounted */
// 2200 	FATFS *fs		/* Pointer to new file system object (NULL for unmount)*/
// 2201 )
// 2202 {
// 2203 	FATFS *rfs;
// 2204 
// 2205 
// 2206 	if (vol >= _VOLUMES)			/* Check if the drive number is valid */
f_mount:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BCC.N    ??f_mount_0
// 2207 		return FR_INVALID_DRIVE;
        MOVS     R0,#+11
        B.N      ??f_mount_1
// 2208 	rfs = FatFs[vol];				/* Get current fs object */
??f_mount_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable9_4
        LDR      R2,[R2, R0, LSL #+2]
// 2209 
// 2210 	if (rfs) {
        CMP      R2,#+0
        BEQ.N    ??f_mount_2
// 2211 #if _FS_SHARE
// 2212 		clear_lock(rfs);
// 2213 #endif
// 2214 #if _FS_REENTRANT					/* Discard sync object of the current volume */
// 2215 		if (!ff_del_syncobj(rfs->sobj)) return FR_INT_ERR;
// 2216 #endif
// 2217 		rfs->fs_type = 0;			/* Clear old fs object */
        MOVS     R3,#+0
        STRB     R3,[R2, #+0]
// 2218 	}
// 2219 
// 2220 	if (fs) {
??f_mount_2:
        CMP      R1,#+0
        BEQ.N    ??f_mount_3
// 2221 		fs->fs_type = 0;			/* Clear new fs object */
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
// 2222 #if _FS_REENTRANT					/* Create sync object for the new volume */
// 2223 		if (!ff_cre_syncobj(vol, &fs->sobj)) return FR_INT_ERR;
// 2224 #endif
// 2225 	}
// 2226 	FatFs[vol] = fs;				/* Register new fs object */
??f_mount_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable9_4
        STR      R1,[R2, R0, LSL #+2]
// 2227 
// 2228 	return FR_OK;
        MOVS     R0,#+0
??f_mount_1:
        BX       LR               ;; return
// 2229 }
// 2230 
// 2231 
// 2232 
// 2233 
// 2234 /*-----------------------------------------------------------------------*/
// 2235 /* Open or Create a File                                                 */
// 2236 /*-----------------------------------------------------------------------*/
// 2237 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2238 FRESULT f_open (
// 2239 	FIL *fp,			/* Pointer to the blank file object */
// 2240 	const TCHAR *path,	/* Pointer to the file name */
// 2241 	BYTE mode			/* Access mode and file open mode flags */
// 2242 )
// 2243 {
f_open:
        PUSH     {R1,R4-R9,LR}
        SUB      SP,SP,#+48
        MOVS     R4,R0
        MOVS     R5,R2
// 2244 	FRESULT res;
// 2245 	DIR dj;
// 2246 	BYTE *dir;
// 2247 	DEF_NAMEBUF;
// 2248 
// 2249 
// 2250 	fp->fs = 0;			/* Clear file object */
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
// 2251 
// 2252 #if !_FS_READONLY
// 2253 	mode &= FA_READ | FA_WRITE | FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW;
        ANDS     R5,R5,#0x1F
// 2254 	res = chk_mounted(&path, &dj.fs, (BYTE)(mode & ~FA_READ));
        ANDS     R2,R5,#0xFE
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
        BL       chk_mounted
        MOVS     R6,R0
// 2255 #else
// 2256 	mode &= FA_READ;
// 2257 	res = chk_mounted(&path, &dj.fs, 0);
// 2258 #endif
// 2259 	INIT_BUF(dj);
        ADD      R0,SP,#+36
        STR      R0,[SP, #+24]
        LDR.W    R0,??DataTable12_3
        STR      R0,[SP, #+28]
// 2260 	if (res == FR_OK)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_0
// 2261 		res = follow_path(&dj, path);	/* Follow the file path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+0
        BL       follow_path
        MOVS     R6,R0
// 2262 	dir = dj.dir;
??f_open_0:
        LDR      R7,[SP, #+20]
// 2263 
// 2264 #if !_FS_READONLY	/* R/W configuration */
// 2265 	if (res == FR_OK) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_1
// 2266 		if (!dir)	/* Current dir itself */
        CMP      R7,#+0
        BNE.N    ??f_open_1
// 2267 			res = FR_INVALID_NAME;
        MOVS     R6,#+6
// 2268 #if _FS_SHARE
// 2269 		else
// 2270 			res = chk_lock(&dj, (mode & ~FA_READ) ? 1 : 0);
// 2271 #endif
// 2272 	}
// 2273 	/* Create or Open a file */
// 2274 	if (mode & (FA_CREATE_ALWAYS | FA_OPEN_ALWAYS | FA_CREATE_NEW)) {
??f_open_1:
        MOVS     R0,#+28
        TST      R5,R0
        BEQ.N    ??f_open_2
// 2275 		DWORD dw, cl;
// 2276 
// 2277 		if (res != FR_OK) {					/* No file, create new */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??f_open_3
// 2278 			if (res == FR_NO_FILE)			/* There is no file to open, create a new entry */
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+4
        BNE.N    ??f_open_4
// 2279 #if _FS_SHARE
// 2280 				res = enq_lock(dj.fs) ? dir_register(&dj) : FR_TOO_MANY_OPEN_FILES;
// 2281 #else
// 2282 				res = dir_register(&dj);
        ADD      R0,SP,#+0
        BL       dir_register
        MOVS     R6,R0
// 2283 #endif
// 2284 			mode |= FA_CREATE_ALWAYS;		/* File is created */
??f_open_4:
        ORRS     R5,R5,#0x8
// 2285 			dir = dj.dir;					/* New entry */
        LDR      R7,[SP, #+20]
        B.N      ??f_open_5
// 2286 		}
// 2287 		else {								/* Any object is already existing */
// 2288 			if (dir[DIR_Attr] & (AM_RDO | AM_DIR)) {	/* Cannot overwrite it (R/O or DIR) */
??f_open_3:
        LDRB     R0,[R7, #+11]
        MOVS     R1,#+17
        TST      R0,R1
        BEQ.N    ??f_open_6
// 2289 				res = FR_DENIED;
        MOVS     R6,#+7
        B.N      ??f_open_5
// 2290 			} else {
// 2291 				if (mode & FA_CREATE_NEW)	/* Cannot create as new file */
??f_open_6:
        LSLS     R0,R5,#+29
        BPL.N    ??f_open_5
// 2292 					res = FR_EXIST;
        MOVS     R6,#+8
// 2293 			}
// 2294 		}
// 2295 		if (res == FR_OK && (mode & FA_CREATE_ALWAYS)) {	/* Truncate it if overwrite mode */
??f_open_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_7
        LSLS     R0,R5,#+28
        BPL.N    ??f_open_7
// 2296 			dw = get_fattime();					/* Created time */
        BL       get_fattime
        MOV      R8,R0
// 2297 			ST_DWORD(dir+DIR_CrtTime, dw);
        STRB     R8,[R7, #+14]
        MOV      R0,R8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R7, #+15]
        LSRS     R0,R8,#+16
        STRB     R0,[R7, #+16]
        LSRS     R0,R8,#+24
        STRB     R0,[R7, #+17]
// 2298 			dir[DIR_Attr] = 0;					/* Reset attribute */
        MOVS     R0,#+0
        STRB     R0,[R7, #+11]
// 2299 			ST_DWORD(dir+DIR_FileSize, 0);		/* size = 0 */
        MOVS     R0,#+0
        STRB     R0,[R7, #+28]
        MOVS     R0,#+0
        STRB     R0,[R7, #+29]
        MOVS     R0,#+0
        STRB     R0,[R7, #+30]
        MOVS     R0,#+0
        STRB     R0,[R7, #+31]
// 2300 			cl = LD_CLUST(dir);					/* Get start cluster */
        LDRB     R0,[R7, #+21]
        LDRB     R1,[R7, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R7, #+27]
        LDRB     R2,[R7, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R9,R1,R0, LSL #+16
// 2301 			ST_CLUST(dir, 0);					/* cluster = 0 */
        MOVS     R0,#+0
        STRB     R0,[R7, #+26]
        MOVS     R0,#+0
        STRB     R0,[R7, #+27]
        MOVS     R0,#+0
        STRB     R0,[R7, #+20]
        MOVS     R0,#+0
        STRB     R0,[R7, #+21]
// 2302 			dj.fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 2303 			if (cl) {							/* Remove the cluster chain if exist */
        CMP      R9,#+0
        BEQ.N    ??f_open_7
// 2304 				dw = dj.fs->winsect;
        LDR      R0,[SP, #+0]
        LDR      R8,[R0, #+48]
// 2305 				res = remove_chain(dj.fs, cl);
        MOV      R1,R9
        LDR      R0,[SP, #+0]
        BL       remove_chain
        MOVS     R6,R0
// 2306 				if (res == FR_OK) {
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_7
// 2307 					dj.fs->last_clust = cl - 1;	/* Reuse the cluster hole */
        LDR      R0,[SP, #+0]
        SUBS     R1,R9,#+1
        STR      R1,[R0, #+12]
// 2308 					res = move_window(dj.fs, dw);
        MOV      R1,R8
        LDR      R0,[SP, #+0]
        BL       move_window
        MOVS     R6,R0
        B.N      ??f_open_7
// 2309 				}
// 2310 			}
// 2311 		}
// 2312 	}
// 2313 	else {	/* Open an existing file */
// 2314 		if (res == FR_OK) {						/* Follow succeeded */
??f_open_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_7
// 2315 			if (dir[DIR_Attr] & AM_DIR) {		/* It is a directory */
        LDRB     R0,[R7, #+11]
        LSLS     R0,R0,#+27
        BPL.N    ??f_open_8
// 2316 				res = FR_NO_FILE;
        MOVS     R6,#+4
        B.N      ??f_open_7
// 2317 			} else {
// 2318 				if ((mode & FA_WRITE) && (dir[DIR_Attr] & AM_RDO)) /* R/O violation */
??f_open_8:
        LSLS     R0,R5,#+30
        BPL.N    ??f_open_7
        LDRB     R0,[R7, #+11]
        LSLS     R0,R0,#+31
        BPL.N    ??f_open_7
// 2319 					res = FR_DENIED;
        MOVS     R6,#+7
// 2320 			}
// 2321 		}
// 2322 	}
// 2323 	if (res == FR_OK) {
??f_open_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_9
// 2324 		if (mode & FA_CREATE_ALWAYS)			/* Set file change flag if created or overwritten */
        LSLS     R0,R5,#+28
        BPL.N    ??f_open_10
// 2325 			mode |= FA__WRITTEN;
        ORRS     R5,R5,#0x20
// 2326 		fp->dir_sect = dj.fs->winsect;			/* Pointer to the directory entry */
??f_open_10:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+48]
        STR      R0,[R4, #+28]
// 2327 		fp->dir_ptr = dir;
        STR      R7,[R4, #+32]
// 2328 #if _FS_SHARE
// 2329 		fp->lockid = inc_lock(&dj, (mode & ~FA_READ) ? 1 : 0);
// 2330 		if (!fp->lockid) res = FR_INT_ERR;
// 2331 #endif
// 2332 	}
// 2333 
// 2334 #else				/* R/O configuration */
// 2335 	if (res == FR_OK) {					/* Follow succeeded */
// 2336 		if (!dir) {						/* Current dir itself */
// 2337 			res = FR_INVALID_NAME;
// 2338 		} else {
// 2339 			if (dir[DIR_Attr] & AM_DIR)	/* It is a directory */
// 2340 				res = FR_NO_FILE;
// 2341 		}
// 2342 	}
// 2343 #endif
// 2344 	FREE_BUF();
// 2345 
// 2346 	if (res == FR_OK) {
??f_open_9:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??f_open_11
// 2347 		fp->flag = mode;					/* File access mode */
        STRB     R5,[R4, #+6]
// 2348 		fp->sclust = LD_CLUST(dir);			/* File start cluster */
        LDRB     R0,[R7, #+21]
        LDRB     R1,[R7, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R7, #+27]
        LDRB     R2,[R7, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R0,R1,R0, LSL #+16
        STR      R0,[R4, #+16]
// 2349 		fp->fsize = LD_DWORD(dir+DIR_FileSize);	/* File size */
        LDRB     R0,[R7, #+31]
        LDRB     R1,[R7, #+30]
        LSLS     R1,R1,#+16
        ORRS     R0,R1,R0, LSL #+24
        LDRB     R1,[R7, #+29]
        ORRS     R0,R0,R1, LSL #+8
        LDRB     R1,[R7, #+28]
        ORRS     R0,R1,R0
        STR      R0,[R4, #+12]
// 2350 		fp->fptr = 0;						/* File pointer */
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
// 2351 		fp->dsect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+24]
// 2352 #if _USE_FASTSEEK
// 2353 		fp->cltbl = 0;						/* Normal seek mode */
        MOVS     R0,#+0
        STR      R0,[R4, #+36]
// 2354 #endif
// 2355 		fp->fs = dj.fs; fp->id = dj.fs->id;	/* Validate file object */
        LDR      R0,[SP, #+0]
        STR      R0,[R4, #+0]
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+6]
        STRH     R0,[R4, #+4]
// 2356 	}
// 2357 
// 2358 	LEAVE_FF(dj.fs, res);
??f_open_11:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
        POP      {R4-R9,PC}       ;; return
// 2359 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     `?<Constant "\\"*:<>?|\\177">`
// 2360 
// 2361 
// 2362 
// 2363 
// 2364 /*-----------------------------------------------------------------------*/
// 2365 /* Read File                                                             */
// 2366 /*-----------------------------------------------------------------------*/
// 2367 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2368 FRESULT f_read (
// 2369 	FIL *fp, 		/* Pointer to the file object */
// 2370 	void *buff,		/* Pointer to data buffer */
// 2371 	UINT btr,		/* Number of bytes to read */
// 2372 	UINT *br		/* Pointer to number of bytes read */
// 2373 )
// 2374 {
f_read:
        PUSH     {R4-R10,LR}
        MOVS     R5,R0
        MOVS     R6,R2
        MOVS     R7,R3
// 2375 	FRESULT res;
// 2376 	DWORD clst, sect, remain;
// 2377 	UINT rcnt, cc;
// 2378 	BYTE csect, *rbuff = buff;
        MOVS     R4,R1
// 2379 
// 2380 
// 2381 	*br = 0;	/* Initialize byte counter */
        MOVS     R0,#+0
        STR      R0,[R7, #+0]
// 2382 
// 2383 	res = validate(fp->fs, fp->id);				/* Check validity */
        LDRH     R1,[R5, #+4]
        LDR      R0,[R5, #+0]
        BL       validate
// 2384 	if (res != FR_OK) LEAVE_FF(fp->fs, res);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??f_read_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_read_1
// 2385 	if (fp->flag & FA__ERROR)					/* Aborted file? */
??f_read_0:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+24
        BPL.N    ??f_read_2
// 2386 		LEAVE_FF(fp->fs, FR_INT_ERR);
        MOVS     R0,#+2
        B.N      ??f_read_1
// 2387 	if (!(fp->flag & FA_READ)) 					/* Check access mode */
??f_read_2:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+31
        BMI.N    ??f_read_3
// 2388 		LEAVE_FF(fp->fs, FR_DENIED);
        MOVS     R0,#+7
        B.N      ??f_read_1
// 2389 	remain = fp->fsize - fp->fptr;
??f_read_3:
        LDR      R0,[R5, #+12]
        LDR      R1,[R5, #+8]
        SUBS     R0,R0,R1
// 2390 	if (btr > remain) btr = (UINT)remain;		/* Truncate btr by remaining bytes */
        CMP      R0,R6
        BCS.N    ??f_read_4
        MOVS     R6,R0
        B.N      ??f_read_4
// 2391 
// 2392 	for ( ;  btr;								/* Repeat until all data read */
// 2393 		rbuff += rcnt, fp->fptr += rcnt, *br += rcnt, btr -= rcnt) {
// 2394 		if ((fp->fptr % SS(fp->fs)) == 0) {		/* On the sector boundary? */
// 2395 			csect = (BYTE)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));	/* Sector offset in the cluster */
// 2396 			if (!csect) {						/* On the cluster boundary? */
// 2397 				if (fp->fptr == 0) {			/* On the top of the file? */
// 2398 					clst = fp->sclust;			/* Follow from the origin */
// 2399 				} else {						/* Middle or end of the file */
// 2400 #if _USE_FASTSEEK
// 2401 					if (fp->cltbl)
// 2402 						clst = clmt_clust(fp, fp->fptr);	/* Get cluster# from the CLMT */
// 2403 					else
// 2404 #endif
// 2405 						clst = get_fat(fp->fs, fp->clust);	/* Follow cluster chain on the FAT */
// 2406 				}
// 2407 				if (clst < 2) ABORT(fp->fs, FR_INT_ERR);
// 2408 				if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 2409 				fp->clust = clst;				/* Update current cluster */
// 2410 			}
// 2411 			sect = clust2sect(fp->fs, fp->clust);	/* Get current sector */
// 2412 			if (!sect) ABORT(fp->fs, FR_INT_ERR);
// 2413 			sect += csect;
// 2414 			cc = btr / SS(fp->fs);				/* When remaining bytes >= sector size, */
// 2415 			if (cc) {							/* Read maximum contiguous sectors directly */
// 2416 				if (csect + cc > fp->fs->csize)	/* Clip at cluster boundary */
// 2417 					cc = fp->fs->csize - csect;
// 2418 				if (disk_read(fp->fs->drv, rbuff, sect, (BYTE)cc) != RES_OK)
// 2419 					ABORT(fp->fs, FR_DISK_ERR);
// 2420 #if !_FS_READONLY && _FS_MINIMIZE <= 2			/* Replace one of the read sectors with cached data if it contains a dirty sector */
// 2421 #if _FS_TINY
// 2422 				if (fp->fs->wflag && fp->fs->winsect - sect < cc)
// 2423 					mem_cpy(rbuff + ((fp->fs->winsect - sect) * SS(fp->fs)), fp->fs->win, SS(fp->fs));
// 2424 #else
// 2425 				if ((fp->flag & FA__DIRTY) && fp->dsect - sect < cc)
// 2426 					mem_cpy(rbuff + ((fp->dsect - sect) * SS(fp->fs)), fp->buf, SS(fp->fs));
// 2427 #endif
// 2428 #endif
// 2429 				rcnt = SS(fp->fs) * cc;			/* Number of bytes transferred */
// 2430 				continue;
// 2431 			}
// 2432 #if !_FS_TINY
// 2433 			if (fp->dsect != sect) {			/* Load data sector if not in cache */
// 2434 #if !_FS_READONLY
// 2435 				if (fp->flag & FA__DIRTY) {		/* Write-back dirty sector cache */
// 2436 					if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
// 2437 						ABORT(fp->fs, FR_DISK_ERR);
// 2438 					fp->flag &= ~FA__DIRTY;
// 2439 				}
// 2440 #endif
// 2441 				if (disk_read(fp->fs->drv, fp->buf, sect, 1) != RES_OK)	/* Fill sector cache */
// 2442 					ABORT(fp->fs, FR_DISK_ERR);
// 2443 			}
// 2444 #endif
// 2445 			fp->dsect = sect;
??f_read_5:
        STR      R9,[R5, #+24]
// 2446 		}
// 2447 		rcnt = SS(fp->fs) - (fp->fptr % SS(fp->fs));	/* Get partial sector data from sector buffer */
??f_read_6:
        MOV      R0,#+512
        LDR      R1,[R5, #+8]
        MOV      R2,#+512
        UDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        SUBS     R8,R0,R3
// 2448 		if (rcnt > btr) rcnt = btr;
        CMP      R6,R8
        BCS.N    ??f_read_7
        MOV      R8,R6
// 2449 #if _FS_TINY
// 2450 		if (move_window(fp->fs, fp->dsect))		/* Move sector window */
// 2451 			ABORT(fp->fs, FR_DISK_ERR);
// 2452 		mem_cpy(rbuff, &fp->fs->win[fp->fptr % SS(fp->fs)], rcnt);	/* Pick partial sector */
// 2453 #else
// 2454 		mem_cpy(rbuff, &fp->buf[fp->fptr % SS(fp->fs)], rcnt);	/* Pick partial sector */
??f_read_7:
        MOV      R2,R8
        LDR      R0,[R5, #+8]
        MOV      R1,#+512
        UDIV     R3,R0,R1
        MLS      R3,R3,R1,R0
        ADDS     R0,R3,R5
        ADDS     R1,R0,#+40
        MOVS     R0,R4
        BL       mem_cpy
??f_read_8:
        ADDS     R4,R8,R4
        LDR      R0,[R5, #+8]
        ADDS     R0,R8,R0
        STR      R0,[R5, #+8]
        LDR      R0,[R7, #+0]
        ADDS     R0,R8,R0
        STR      R0,[R7, #+0]
        SUBS     R6,R6,R8
??f_read_4:
        CMP      R6,#+0
        BEQ.W    ??f_read_9
        LDR      R0,[R5, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.N    ??f_read_6
        LDR      R0,[R5, #+8]
        LSRS     R0,R0,#+9
        LDR      R1,[R5, #+0]
        LDRB     R1,[R1, #+2]
        SUBS     R1,R1,#+1
        ANDS     R8,R1,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??f_read_10
        LDR      R0,[R5, #+8]
        CMP      R0,#+0
        BNE.N    ??f_read_11
        LDR      R0,[R5, #+16]
        B.N      ??f_read_12
??f_read_11:
        LDR      R0,[R5, #+36]
        CMP      R0,#+0
        BEQ.N    ??f_read_13
        LDR      R1,[R5, #+8]
        MOVS     R0,R5
        BL       clmt_clust
        B.N      ??f_read_12
??f_read_13:
        LDR      R1,[R5, #+20]
        LDR      R0,[R5, #+0]
        BL       get_fat
??f_read_12:
        CMP      R0,#+2
        BCS.N    ??f_read_14
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_read_1
??f_read_14:
        CMN      R0,#+1
        BNE.N    ??f_read_15
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
??f_read_15:
        STR      R0,[R5, #+20]
??f_read_10:
        LDR      R1,[R5, #+20]
        LDR      R0,[R5, #+0]
        BL       clust2sect
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??f_read_16
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_read_1
??f_read_16:
        UXTAB    R9,R9,R8
        LSRS     R10,R6,#+9
        CMP      R10,#+0
        BEQ.N    ??f_read_17
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+2]
        UXTAB    R1,R10,R8
        CMP      R0,R1
        BCS.N    ??f_read_18
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+2]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        SUBS     R10,R0,R8
??f_read_18:
        MOV      R3,R10
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOV      R2,R9
        MOVS     R1,R4
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_read_19
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
??f_read_19:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_read_20
        LDR      R0,[R5, #+24]
        SUBS     R0,R0,R9
        CMP      R0,R10
        BCS.N    ??f_read_20
        MOV      R2,#+512
        ADDS     R1,R5,#+40
        LDR      R0,[R5, #+24]
        SUBS     R0,R0,R9
        MOV      R3,#+512
        MLA      R0,R3,R0,R4
        BL       mem_cpy
??f_read_20:
        MOV      R0,#+512
        MUL      R8,R0,R10
        B.N      ??f_read_8
??f_read_17:
        LDR      R0,[R5, #+24]
        CMP      R0,R9
        BEQ.W    ??f_read_5
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_read_21
        MOVS     R3,#+1
        LDR      R2,[R5, #+24]
        ADDS     R1,R5,#+40
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_read_22
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
??f_read_22:
        LDRB     R0,[R5, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R5, #+6]
??f_read_21:
        MOVS     R3,#+1
        MOV      R2,R9
        ADDS     R1,R5,#+40
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_read
        CMP      R0,#+0
        BEQ.W    ??f_read_5
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_read_1
// 2455 #endif
// 2456 	}
// 2457 
// 2458 	LEAVE_FF(fp->fs, FR_OK);
??f_read_9:
        MOVS     R0,#+0
??f_read_1:
        POP      {R4-R10,PC}      ;; return
// 2459 }
// 2460 
// 2461 
// 2462 
// 2463 
// 2464 #if !_FS_READONLY
// 2465 /*-----------------------------------------------------------------------*/
// 2466 /* Write File                                                            */
// 2467 /*-----------------------------------------------------------------------*/
// 2468 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2469 FRESULT f_write (
// 2470 	FIL *fp,			/* Pointer to the file object */
// 2471 	const void *buff,	/* Pointer to the data to be written */
// 2472 	UINT btw,			/* Number of bytes to write */
// 2473 	UINT *bw			/* Pointer to number of bytes written */
// 2474 )
// 2475 {
f_write:
        PUSH     {R4-R10,LR}
        MOVS     R5,R0
        MOVS     R6,R2
        MOVS     R7,R3
// 2476 	FRESULT res;
// 2477 	DWORD clst, sect;
// 2478 	UINT wcnt, cc;
// 2479 	const BYTE *wbuff = buff;
        MOVS     R4,R1
// 2480 	BYTE csect;
// 2481 
// 2482 
// 2483 	*bw = 0;	/* Initialize byte counter */
        MOVS     R0,#+0
        STR      R0,[R7, #+0]
// 2484 
// 2485 	res = validate(fp->fs, fp->id);			/* Check validity */
        LDRH     R1,[R5, #+4]
        LDR      R0,[R5, #+0]
        BL       validate
// 2486 	if (res != FR_OK) LEAVE_FF(fp->fs, res);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??f_write_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_write_1
// 2487 	if (fp->flag & FA__ERROR)				/* Aborted file? */
??f_write_0:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+24
        BPL.N    ??f_write_2
// 2488 		LEAVE_FF(fp->fs, FR_INT_ERR);
        MOVS     R0,#+2
        B.N      ??f_write_1
// 2489 	if (!(fp->flag & FA_WRITE))				/* Check access mode */
??f_write_2:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+30
        BMI.N    ??f_write_3
// 2490 		LEAVE_FF(fp->fs, FR_DENIED);
        MOVS     R0,#+7
        B.N      ??f_write_1
// 2491 	if ((DWORD)(fp->fsize + btw) < fp->fsize) btw = 0;	/* File size cannot reach 4GB */
??f_write_3:
        LDR      R0,[R5, #+12]
        ADDS     R0,R6,R0
        LDR      R1,[R5, #+12]
        CMP      R0,R1
        BCS.N    ??f_write_4
        MOVS     R6,#+0
        B.N      ??f_write_4
// 2492 
// 2493 	for ( ;  btw;							/* Repeat until all data written */
// 2494 		wbuff += wcnt, fp->fptr += wcnt, *bw += wcnt, btw -= wcnt) {
// 2495 		if ((fp->fptr % SS(fp->fs)) == 0) {	/* On the sector boundary? */
// 2496 			csect = (BYTE)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));	/* Sector offset in the cluster */
// 2497 			if (!csect) {					/* On the cluster boundary? */
// 2498 				if (fp->fptr == 0) {		/* On the top of the file? */
// 2499 					clst = fp->sclust;		/* Follow from the origin */
// 2500 					if (clst == 0)			/* When no cluster is allocated, */
// 2501 						fp->sclust = clst = create_chain(fp->fs, 0);	/* Create a new cluster chain */
// 2502 				} else {					/* Middle or end of the file */
// 2503 #if _USE_FASTSEEK
// 2504 					if (fp->cltbl)
// 2505 						clst = clmt_clust(fp, fp->fptr);	/* Get cluster# from the CLMT */
// 2506 					else
// 2507 #endif
// 2508 						clst = create_chain(fp->fs, fp->clust);	/* Follow or stretch cluster chain on the FAT */
// 2509 				}
// 2510 				if (clst == 0) break;		/* Could not allocate a new cluster (disk full) */
// 2511 				if (clst == 1) ABORT(fp->fs, FR_INT_ERR);
// 2512 				if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 2513 				fp->clust = clst;			/* Update current cluster */
// 2514 			}
// 2515 #if _FS_TINY
// 2516 			if (fp->fs->winsect == fp->dsect && move_window(fp->fs, 0))	/* Write-back sector cache */
// 2517 				ABORT(fp->fs, FR_DISK_ERR);
// 2518 #else
// 2519 			if (fp->flag & FA__DIRTY) {		/* Write-back sector cache */
// 2520 				if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
// 2521 					ABORT(fp->fs, FR_DISK_ERR);
// 2522 				fp->flag &= ~FA__DIRTY;
// 2523 			}
// 2524 #endif
// 2525 			sect = clust2sect(fp->fs, fp->clust);	/* Get current sector */
// 2526 			if (!sect) ABORT(fp->fs, FR_INT_ERR);
// 2527 			sect += csect;
// 2528 			cc = btw / SS(fp->fs);			/* When remaining bytes >= sector size, */
// 2529 			if (cc) {						/* Write maximum contiguous sectors directly */
// 2530 				if (csect + cc > fp->fs->csize)	/* Clip at cluster boundary */
// 2531 					cc = fp->fs->csize - csect;
// 2532 				if (disk_write(fp->fs->drv, wbuff, sect, (BYTE)cc) != RES_OK)
// 2533 					ABORT(fp->fs, FR_DISK_ERR);
// 2534 #if _FS_TINY
// 2535 				if (fp->fs->winsect - sect < cc) {	/* Refill sector cache if it gets invalidated by the direct write */
// 2536 					mem_cpy(fp->fs->win, wbuff + ((fp->fs->winsect - sect) * SS(fp->fs)), SS(fp->fs));
// 2537 					fp->fs->wflag = 0;
// 2538 				}
// 2539 #else
// 2540 				if (fp->dsect - sect < cc) { /* Refill sector cache if it gets invalidated by the direct write */
// 2541 					mem_cpy(fp->buf, wbuff + ((fp->dsect - sect) * SS(fp->fs)), SS(fp->fs));
// 2542 					fp->flag &= ~FA__DIRTY;
// 2543 				}
// 2544 #endif
// 2545 				wcnt = SS(fp->fs) * cc;		/* Number of bytes transferred */
// 2546 				continue;
// 2547 			}
// 2548 #if _FS_TINY
// 2549 			if (fp->fptr >= fp->fsize) {	/* Avoid silly cache filling at growing edge */
// 2550 				if (move_window(fp->fs, 0)) ABORT(fp->fs, FR_DISK_ERR);
// 2551 				fp->fs->winsect = sect;
// 2552 			}
// 2553 #else
// 2554 			if (fp->dsect != sect) {		/* Fill sector cache with file data */
// 2555 				if (fp->fptr < fp->fsize &&
// 2556 					disk_read(fp->fs->drv, fp->buf, sect, 1) != RES_OK)
// 2557 						ABORT(fp->fs, FR_DISK_ERR);
// 2558 			}
// 2559 #endif
// 2560 			fp->dsect = sect;
??f_write_5:
        STR      R9,[R5, #+24]
// 2561 		}
// 2562 		wcnt = SS(fp->fs) - (fp->fptr % SS(fp->fs));/* Put partial sector into file I/O buffer */
??f_write_6:
        MOV      R0,#+512
        LDR      R1,[R5, #+8]
        MOV      R2,#+512
        UDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        SUBS     R8,R0,R3
// 2563 		if (wcnt > btw) wcnt = btw;
        CMP      R6,R8
        BCS.N    ??f_write_7
        MOV      R8,R6
// 2564 #if _FS_TINY
// 2565 		if (move_window(fp->fs, fp->dsect))	/* Move sector window */
// 2566 			ABORT(fp->fs, FR_DISK_ERR);
// 2567 		mem_cpy(&fp->fs->win[fp->fptr % SS(fp->fs)], wbuff, wcnt);	/* Fit partial sector */
// 2568 		fp->fs->wflag = 1;
// 2569 #else
// 2570 		mem_cpy(&fp->buf[fp->fptr % SS(fp->fs)], wbuff, wcnt);	/* Fit partial sector */
??f_write_7:
        MOV      R2,R8
        MOVS     R1,R4
        LDR      R0,[R5, #+8]
        MOV      R3,#+512
        UDIV     R12,R0,R3
        MLS      R12,R12,R3,R0
        ADDS     R0,R12,R5
        ADDS     R0,R0,#+40
        BL       mem_cpy
// 2571 		fp->flag |= FA__DIRTY;
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x40
        STRB     R0,[R5, #+6]
??f_write_8:
        ADDS     R4,R8,R4
        LDR      R0,[R5, #+8]
        ADDS     R0,R8,R0
        STR      R0,[R5, #+8]
        LDR      R0,[R7, #+0]
        ADDS     R0,R8,R0
        STR      R0,[R7, #+0]
        SUBS     R6,R6,R8
??f_write_4:
        CMP      R6,#+0
        BEQ.N    ??f_write_9
        LDR      R0,[R5, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.N    ??f_write_6
        LDR      R0,[R5, #+8]
        LSRS     R0,R0,#+9
        LDR      R1,[R5, #+0]
        LDRB     R1,[R1, #+2]
        SUBS     R1,R1,#+1
        ANDS     R8,R1,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??f_write_10
        LDR      R0,[R5, #+8]
        CMP      R0,#+0
        BNE.N    ??f_write_11
        LDR      R0,[R5, #+16]
        CMP      R0,#+0
        BNE.N    ??f_write_12
        MOVS     R1,#+0
        LDR      R0,[R5, #+0]
        BL       create_chain
        STR      R0,[R5, #+16]
        B.N      ??f_write_12
??f_write_11:
        LDR      R0,[R5, #+36]
        CMP      R0,#+0
        BEQ.N    ??f_write_13
        LDR      R1,[R5, #+8]
        MOVS     R0,R5
        BL       clmt_clust
        B.N      ??f_write_12
??f_write_13:
        LDR      R1,[R5, #+20]
        LDR      R0,[R5, #+0]
        BL       create_chain
??f_write_12:
        CMP      R0,#+0
        BNE.N    ??f_write_14
// 2572 #endif
// 2573 	}
// 2574 
// 2575 	if (fp->fptr > fp->fsize) fp->fsize = fp->fptr;	/* Update file size if needed */
??f_write_9:
        LDR      R0,[R5, #+12]
        LDR      R1,[R5, #+8]
        CMP      R0,R1
        BCS.N    ??f_write_15
        LDR      R0,[R5, #+8]
        STR      R0,[R5, #+12]
// 2576 	fp->flag |= FA__WRITTEN;						/* Set file change flag */
??f_write_15:
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x20
        STRB     R0,[R5, #+6]
// 2577 
// 2578 	LEAVE_FF(fp->fs, FR_OK);
        MOVS     R0,#+0
??f_write_1:
        POP      {R4-R10,PC}      ;; return
??f_write_14:
        CMP      R0,#+1
        BNE.N    ??f_write_16
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_write_1
??f_write_16:
        CMN      R0,#+1
        BNE.N    ??f_write_17
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
??f_write_17:
        STR      R0,[R5, #+20]
??f_write_10:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_write_18
        MOVS     R3,#+1
        LDR      R2,[R5, #+24]
        ADDS     R1,R5,#+40
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_write_19
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
??f_write_19:
        LDRB     R0,[R5, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R5, #+6]
??f_write_18:
        LDR      R1,[R5, #+20]
        LDR      R0,[R5, #+0]
        BL       clust2sect
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??f_write_20
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_write_1
??f_write_20:
        UXTAB    R9,R9,R8
        LSRS     R10,R6,#+9
        CMP      R10,#+0
        BEQ.N    ??f_write_21
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+2]
        UXTAB    R1,R10,R8
        CMP      R0,R1
        BCS.N    ??f_write_22
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+2]
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        SUBS     R10,R0,R8
??f_write_22:
        MOV      R3,R10
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOV      R2,R9
        MOVS     R1,R4
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_write_23
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
??f_write_23:
        LDR      R0,[R5, #+24]
        SUBS     R0,R0,R9
        CMP      R0,R10
        BCS.N    ??f_write_24
        MOV      R2,#+512
        LDR      R0,[R5, #+24]
        SUBS     R0,R0,R9
        MOV      R1,#+512
        MLA      R1,R1,R0,R4
        ADDS     R0,R5,#+40
        BL       mem_cpy
        LDRB     R0,[R5, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R5, #+6]
??f_write_24:
        MOV      R0,#+512
        MUL      R8,R0,R10
        B.N      ??f_write_8
??f_write_21:
        LDR      R0,[R5, #+24]
        CMP      R0,R9
        BEQ.W    ??f_write_5
        LDR      R0,[R5, #+8]
        LDR      R1,[R5, #+12]
        CMP      R0,R1
        BCS.W    ??f_write_5
        MOVS     R3,#+1
        MOV      R2,R9
        ADDS     R1,R5,#+40
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_read
        CMP      R0,#+0
        BEQ.W    ??f_write_5
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_write_1
// 2579 }
// 2580 
// 2581 
// 2582 
// 2583 
// 2584 /*-----------------------------------------------------------------------*/
// 2585 /* Synchronize the File Object                                           */
// 2586 /*-----------------------------------------------------------------------*/
// 2587 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2588 FRESULT f_sync (
// 2589 	FIL *fp		/* Pointer to the file object */
// 2590 )
// 2591 {
f_sync:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
// 2592 	FRESULT res;
// 2593 	DWORD tim;
// 2594 	BYTE *dir;
// 2595 
// 2596 
// 2597 	res = validate(fp->fs, fp->id);		/* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
        BL       validate
// 2598 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_sync_0
// 2599 		if (fp->flag & FA__WRITTEN) {	/* Has the file been written? */
        LDRB     R1,[R4, #+6]
        LSLS     R1,R1,#+26
        BPL.N    ??f_sync_0
// 2600 #if !_FS_TINY	/* Write-back dirty buffer */
// 2601 			if (fp->flag & FA__DIRTY) {
        LDRB     R0,[R4, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_sync_1
// 2602 				if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
        MOVS     R3,#+1
        LDR      R2,[R4, #+24]
        ADDS     R1,R4,#+40
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_sync_2
// 2603 					LEAVE_FF(fp->fs, FR_DISK_ERR);
        MOVS     R0,#+1
        B.N      ??f_sync_3
// 2604 				fp->flag &= ~FA__DIRTY;
??f_sync_2:
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R4, #+6]
// 2605 			}
// 2606 #endif
// 2607 			/* Update the directory entry */
// 2608 			res = move_window(fp->fs, fp->dir_sect);
??f_sync_1:
        LDR      R1,[R4, #+28]
        LDR      R0,[R4, #+0]
        BL       move_window
// 2609 			if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_sync_0
// 2610 				dir = fp->dir_ptr;
        LDR      R5,[R4, #+32]
// 2611 				dir[DIR_Attr] |= AM_ARC;					/* Set archive bit */
        LDRB     R0,[R5, #+11]
        ORRS     R0,R0,#0x20
        STRB     R0,[R5, #+11]
// 2612 				ST_DWORD(dir+DIR_FileSize, fp->fsize);		/* Update file size */
        LDR      R0,[R4, #+12]
        STRB     R0,[R5, #+28]
        LDR      R0,[R4, #+12]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+29]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+16
        STRB     R0,[R5, #+30]
        LDR      R0,[R4, #+12]
        LSRS     R0,R0,#+24
        STRB     R0,[R5, #+31]
// 2613 				ST_CLUST(dir, fp->sclust);					/* Update start cluster */
        LDR      R0,[R4, #+16]
        STRB     R0,[R5, #+26]
        LDR      R0,[R4, #+16]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+27]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        STRB     R0,[R5, #+20]
        LDR      R0,[R4, #+16]
        LSRS     R0,R0,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R5, #+21]
// 2614 				tim = get_fattime();						/* Update updated time */
        BL       get_fattime
// 2615 				ST_DWORD(dir+DIR_WrtTime, tim);
        STRB     R0,[R5, #+22]
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R5, #+23]
        LSRS     R1,R0,#+16
        STRB     R1,[R5, #+24]
        LSRS     R0,R0,#+24
        STRB     R0,[R5, #+25]
// 2616 				fp->flag &= ~FA__WRITTEN;
        LDRB     R0,[R4, #+6]
        ANDS     R0,R0,#0xDF
        STRB     R0,[R4, #+6]
// 2617 				fp->fs->wflag = 1;
        LDR      R0,[R4, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 2618 				res = sync(fp->fs);
        LDR      R0,[R4, #+0]
        BL       sync
// 2619 			}
// 2620 		}
// 2621 	}
// 2622 
// 2623 	LEAVE_FF(fp->fs, res);
??f_sync_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??f_sync_3:
        POP      {R1,R4,R5,PC}    ;; return
// 2624 }
// 2625 
// 2626 #endif /* !_FS_READONLY */
// 2627 
// 2628 
// 2629 
// 2630 
// 2631 /*-----------------------------------------------------------------------*/
// 2632 /* Close File                                                            */
// 2633 /*-----------------------------------------------------------------------*/
// 2634 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2635 FRESULT f_close (
// 2636 	FIL *fp		/* Pointer to the file object to be closed */
// 2637 )
// 2638 {
f_close:
        PUSH     {R4,LR}
        MOVS     R4,R0
// 2639 	FRESULT res;
// 2640 
// 2641 #if _FS_READONLY
// 2642 	FATFS *fs = fp->fs;
// 2643 	res = validate(fs, fp->id);
// 2644 	if (res == FR_OK) fp->fs = 0;	/* Discard file object */
// 2645 	LEAVE_FF(fs, res);
// 2646 
// 2647 #else
// 2648 	res = f_sync(fp);		/* Flush cached data */
        MOVS     R0,R4
        BL       f_sync
// 2649 #if _FS_SHARE
// 2650 	if (res == FR_OK) {		/* Decrement open counter */
// 2651 #if _FS_REENTRANT
// 2652 		res = validate(fp->fs, fp->id);
// 2653 		if (res == FR_OK) {
// 2654 			res = dec_lock(fp->lockid);	
// 2655 			unlock_fs(fp->fs, FR_OK);
// 2656 		}
// 2657 #else
// 2658 		res = dec_lock(fp->lockid);
// 2659 #endif
// 2660 	}
// 2661 #endif
// 2662 	if (res == FR_OK) fp->fs = 0;	/* Discard file object */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_close_0
        MOVS     R1,#+0
        STR      R1,[R4, #+0]
// 2663 	return res;
??f_close_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
// 2664 #endif
// 2665 }
// 2666 
// 2667 
// 2668 
// 2669 
// 2670 /*-----------------------------------------------------------------------*/
// 2671 /* Current Drive/Directory Handlings                                     */
// 2672 /*-----------------------------------------------------------------------*/
// 2673 
// 2674 #if _FS_RPATH >= 1
// 2675 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2676 FRESULT f_chdrive (
// 2677 	BYTE drv		/* Drive number */
// 2678 )
// 2679 {
// 2680 	if (drv >= _VOLUMES) return FR_INVALID_DRIVE;
f_chdrive:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BCC.N    ??f_chdrive_0
        MOVS     R0,#+11
        B.N      ??f_chdrive_1
// 2681 
// 2682 	CurrVol = drv;
??f_chdrive_0:
        LDR.N    R1,??DataTable9_3
        STRB     R0,[R1, #+0]
// 2683 
// 2684 	return FR_OK;
        MOVS     R0,#+0
??f_chdrive_1:
        BX       LR               ;; return
// 2685 }
// 2686 
// 2687 
// 2688 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2689 FRESULT f_chdir (
// 2690 	const TCHAR *path	/* Pointer to the directory path */
// 2691 )
// 2692 {
f_chdir:
        PUSH     {R0,LR}
        SUB      SP,SP,#+48
// 2693 	FRESULT res;
// 2694 	DIR dj;
// 2695 	DEF_NAMEBUF;
// 2696 
// 2697 
// 2698 	res = chk_mounted(&path, &dj.fs, 0);
        MOVS     R2,#+0
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
        BL       chk_mounted
// 2699 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_chdir_0
// 2700 		INIT_BUF(dj);
        ADD      R0,SP,#+36
        STR      R0,[SP, #+24]
        LDR.W    R0,??DataTable12_3
        STR      R0,[SP, #+28]
// 2701 		res = follow_path(&dj, path);		/* Follow the path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+0
        BL       follow_path
// 2702 		FREE_BUF();
// 2703 		if (res == FR_OK) {					/* Follow completed */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_chdir_1
// 2704 			if (!dj.dir) {
        LDR      R1,[SP, #+20]
        CMP      R1,#+0
        BNE.N    ??f_chdir_2
// 2705 				dj.fs->cdir = dj.sclust;	/* Start directory itself */
        LDR      R1,[SP, #+0]
        LDR      R2,[SP, #+8]
        STR      R2,[R1, #+24]
        B.N      ??f_chdir_1
// 2706 			} else {
// 2707 				if (dj.dir[DIR_Attr] & AM_DIR)	/* Reached to the directory */
??f_chdir_2:
        LDR      R1,[SP, #+20]
        LDRB     R1,[R1, #+11]
        LSLS     R1,R1,#+27
        BPL.N    ??f_chdir_3
// 2708 					dj.fs->cdir = LD_CLUST(dj.dir);
        LDR      R1,[SP, #+20]
        LDRB     R1,[R1, #+21]
        LDR      R2,[SP, #+20]
        LDRB     R2,[R2, #+20]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R2,[SP, #+20]
        LDRB     R2,[R2, #+27]
        LDR      R3,[SP, #+20]
        LDRB     R3,[R3, #+26]
        ORRS     R2,R3,R2, LSL #+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ORRS     R1,R2,R1, LSL #+16
        LDR      R2,[SP, #+0]
        STR      R1,[R2, #+24]
        B.N      ??f_chdir_1
// 2709 				else
// 2710 					res = FR_NO_PATH;		/* Reached but a file */
??f_chdir_3:
        MOVS     R0,#+5
// 2711 			}
// 2712 		}
// 2713 		if (res == FR_NO_FILE) res = FR_NO_PATH;
??f_chdir_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_chdir_0
        MOVS     R0,#+5
// 2714 	}
// 2715 
// 2716 	LEAVE_FF(dj.fs, res);
??f_chdir_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
        POP      {PC}             ;; return
// 2717 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     ??excvt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     `?<Constant "+,;=[]">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x544146

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     CurrVol

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     FatFs
// 2718 
// 2719 
// 2720 #if _FS_RPATH >= 2
// 2721 FRESULT f_getcwd (
// 2722 	TCHAR *path,	/* Pointer to the directory path */
// 2723 	UINT sz_path	/* Size of path */
// 2724 )
// 2725 {
// 2726 	FRESULT res;
// 2727 	DIR dj;
// 2728 	UINT i, n;
// 2729 	DWORD ccl;
// 2730 	TCHAR *tp;
// 2731 	FILINFO fno;
// 2732 	DEF_NAMEBUF;
// 2733 
// 2734 
// 2735 	*path = 0;
// 2736 	res = chk_mounted((const TCHAR**)&path, &dj.fs, 0);	/* Get current volume */
// 2737 	if (res == FR_OK) {
// 2738 		INIT_BUF(dj);
// 2739 		i = sz_path;		/* Bottom of buffer (dir stack base) */
// 2740 		dj.sclust = dj.fs->cdir;			/* Start to follow upper dir from current dir */
// 2741 		while ((ccl = dj.sclust) != 0) {	/* Repeat while current dir is a sub-dir */
// 2742 			res = dir_sdi(&dj, 1);			/* Get parent dir */
// 2743 			if (res != FR_OK) break;
// 2744 			res = dir_read(&dj);
// 2745 			if (res != FR_OK) break;
// 2746 			dj.sclust = LD_CLUST(dj.dir);	/* Goto parent dir */
// 2747 			res = dir_sdi(&dj, 0);
// 2748 			if (res != FR_OK) break;
// 2749 			do {							/* Find the entry links to the child dir */
// 2750 				res = dir_read(&dj);
// 2751 				if (res != FR_OK) break;
// 2752 				if (ccl == LD_CLUST(dj.dir)) break;	/* Found the entry */
// 2753 				res = dir_next(&dj, 0);	
// 2754 			} while (res == FR_OK);
// 2755 			if (res == FR_NO_FILE) res = FR_INT_ERR;/* It cannot be 'not found'. */
// 2756 			if (res != FR_OK) break;
// 2757 #if _USE_LFN
// 2758 			fno.lfname = path;
// 2759 			fno.lfsize = i;
// 2760 #endif
// 2761 			get_fileinfo(&dj, &fno);		/* Get the dir name and push it to the buffer */
// 2762 			tp = fno.fname;
// 2763 			if (_USE_LFN && *path) tp = path;
// 2764 			for (n = 0; tp[n]; n++) ;
// 2765 			if (i < n + 3) {
// 2766 				res = FR_NOT_ENOUGH_CORE; break;
// 2767 			}
// 2768 			while (n) path[--i] = tp[--n];
// 2769 			path[--i] = '/';
// 2770 		}
// 2771 		tp = path;
// 2772 		if (res == FR_OK) {
// 2773 			*tp++ = '0' + CurrVol;			/* Put drive number */
// 2774 			*tp++ = ':';
// 2775 			if (i == sz_path) {				/* Root-dir */
// 2776 				*tp++ = '/';
// 2777 			} else {						/* Sub-dir */
// 2778 				do		/* Add stacked path str */
// 2779 					*tp++ = path[i++];
// 2780 				while (i < sz_path);
// 2781 			}
// 2782 		}
// 2783 		*tp = 0;
// 2784 		FREE_BUF();
// 2785 	}
// 2786 
// 2787 	LEAVE_FF(dj.fs, res);
// 2788 }
// 2789 #endif /* _FS_RPATH >= 2 */
// 2790 #endif /* _FS_RPATH >= 1 */
// 2791 
// 2792 
// 2793 
// 2794 #if _FS_MINIMIZE <= 2
// 2795 /*-----------------------------------------------------------------------*/
// 2796 /* Seek File R/W Pointer                                                 */
// 2797 /*-----------------------------------------------------------------------*/
// 2798 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2799 FRESULT f_lseek (
// 2800 	FIL *fp,		/* Pointer to the file object */
// 2801 	DWORD ofs		/* File pointer from top of file */
// 2802 )
// 2803 {
f_lseek:
        PUSH     {R3-R11,LR}
        MOVS     R5,R0
        MOVS     R6,R1
// 2804 	FRESULT res;
// 2805 
// 2806 
// 2807 	res = validate(fp->fs, fp->id);		/* Check validity of the object */
        LDRH     R1,[R5, #+4]
        LDR      R0,[R5, #+0]
        BL       validate
        MOVS     R4,R0
// 2808 	if (res != FR_OK) LEAVE_FF(fp->fs, res);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??f_lseek_0
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??f_lseek_1
// 2809 	if (fp->flag & FA__ERROR)			/* Check abort flag */
??f_lseek_0:
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+24
        BPL.N    ??f_lseek_2
// 2810 		LEAVE_FF(fp->fs, FR_INT_ERR);
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 2811 
// 2812 #if _USE_FASTSEEK
// 2813 	if (fp->cltbl) {	/* Fast seek */
??f_lseek_2:
        LDR      R0,[R5, #+36]
        CMP      R0,#+0
        BEQ.W    ??f_lseek_3
// 2814 		DWORD cl, pcl, ncl, tcl, dsc, tlen, ulen, *tbl;
// 2815 
// 2816 		if (ofs == CREATE_LINKMAP) {	/* Create CLMT */
        CMN      R6,#+1
        BNE.N    ??f_lseek_4
// 2817 			tbl = fp->cltbl;
        LDR      R10,[R5, #+36]
// 2818 			tlen = *tbl++; ulen = 2;	/* Given table size and required table size */
        LDR      R8,[R10, #+0]
        ADDS     R10,R10,#+4
        MOVS     R9,#+2
// 2819 			cl = fp->sclust;			/* Top of the chain */
        LDR      R0,[R5, #+16]
// 2820 			if (cl) {
        CMP      R0,#+0
        BEQ.N    ??f_lseek_5
// 2821 				do {
// 2822 					/* Get a fragment */
// 2823 					tcl = cl; ncl = 0; ulen += 2;	/* Top, length and used items */
??f_lseek_6:
        MOVS     R7,R0
        MOVS     R6,#+0
        ADDS     R9,R9,#+2
// 2824 					do {
// 2825 						pcl = cl; ncl++;
??f_lseek_7:
        MOV      R11,R0
        ADDS     R6,R6,#+1
// 2826 						cl = get_fat(fp->fs, cl);
        MOVS     R1,R0
        LDR      R0,[R5, #+0]
        BL       get_fat
// 2827 						if (cl <= 1) ABORT(fp->fs, FR_INT_ERR);
        CMP      R0,#+2
        BCS.N    ??f_lseek_8
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 2828 						if (cl == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
??f_lseek_8:
        CMN      R0,#+1
        BNE.N    ??f_lseek_9
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 2829 					} while (cl == pcl + 1);
??f_lseek_9:
        ADDS     R1,R11,#+1
        CMP      R0,R1
        BEQ.N    ??f_lseek_7
// 2830 					if (ulen <= tlen) {		/* Store the length and top of the fragment */
        CMP      R8,R9
        BCC.N    ??f_lseek_10
// 2831 						*tbl++ = ncl; *tbl++ = tcl;
        STR      R6,[R10, #+0]
        ADDS     R10,R10,#+4
        STR      R7,[R10, #+0]
        ADDS     R10,R10,#+4
// 2832 					}
// 2833 				} while (cl < fp->fs->n_fatent);	/* Repeat until end of chain */
??f_lseek_10:
        LDR      R1,[R5, #+0]
        LDR      R1,[R1, #+28]
        CMP      R0,R1
        BCC.N    ??f_lseek_6
// 2834 			}
// 2835 			*fp->cltbl = ulen;	/* Number of items used */
??f_lseek_5:
        LDR      R0,[R5, #+36]
        STR      R9,[R0, #+0]
// 2836 			if (ulen <= tlen)
        CMP      R8,R9
        BCC.N    ??f_lseek_11
// 2837 				*tbl = 0;		/* Terminate table */
        MOVS     R0,#+0
        STR      R0,[R10, #+0]
        B.N      ??f_lseek_12
// 2838 			else
// 2839 				res = FR_NOT_ENOUGH_CORE;	/* Given table size is smaller than required */
??f_lseek_11:
        MOVS     R4,#+17
        B.N      ??f_lseek_12
// 2840 
// 2841 		} else {						/* Fast seek */
// 2842 			if (ofs > fp->fsize)		/* Clip offset at the file size */
??f_lseek_4:
        LDR      R0,[R5, #+12]
        CMP      R0,R6
        BCS.N    ??f_lseek_13
// 2843 				ofs = fp->fsize;
        LDR      R6,[R5, #+12]
// 2844 			fp->fptr = ofs;				/* Set file pointer */
??f_lseek_13:
        STR      R6,[R5, #+8]
// 2845 			if (ofs) {
        CMP      R6,#+0
        BEQ.W    ??f_lseek_12
// 2846 				fp->clust = clmt_clust(fp, ofs - 1);
        SUBS     R1,R6,#+1
        MOVS     R0,R5
        BL       clmt_clust
        STR      R0,[R5, #+20]
// 2847 				dsc = clust2sect(fp->fs, fp->clust);
        LDR      R1,[R5, #+20]
        LDR      R0,[R5, #+0]
        BL       clust2sect
        MOVS     R7,R0
// 2848 				if (!dsc) ABORT(fp->fs, FR_INT_ERR);
        CMP      R7,#+0
        BNE.N    ??f_lseek_14
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 2849 				dsc += (ofs - 1) / SS(fp->fs) & (fp->fs->csize - 1);
??f_lseek_14:
        SUBS     R0,R6,#+1
        LDR      R1,[R5, #+0]
        LDRB     R1,[R1, #+2]
        SUBS     R1,R1,#+1
        ANDS     R0,R1,R0, LSR #+9
        ADDS     R7,R0,R7
// 2850 				if (fp->fptr % SS(fp->fs) && dsc != fp->dsect) {	/* Refill sector cache if needed */
        LDR      R0,[R5, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BEQ.W    ??f_lseek_12
        LDR      R0,[R5, #+24]
        CMP      R7,R0
        BEQ.W    ??f_lseek_12
// 2851 #if !_FS_TINY
// 2852 #if !_FS_READONLY
// 2853 					if (fp->flag & FA__DIRTY) {		/* Write-back dirty sector cache */
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_lseek_15
// 2854 						if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
        MOVS     R3,#+1
        LDR      R2,[R5, #+24]
        ADDS     R1,R5,#+40
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_lseek_16
// 2855 							ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 2856 						fp->flag &= ~FA__DIRTY;
??f_lseek_16:
        LDRB     R0,[R5, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R5, #+6]
// 2857 					}
// 2858 #endif
// 2859 					if (disk_read(fp->fs->drv, fp->buf, dsc, 1) != RES_OK)	/* Load current sector */
??f_lseek_15:
        MOVS     R3,#+1
        MOVS     R2,R7
        ADDS     R1,R5,#+40
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_lseek_17
// 2860 						ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 2861 #endif
// 2862 					fp->dsect = dsc;
??f_lseek_17:
        STR      R7,[R5, #+24]
        B.N      ??f_lseek_12
// 2863 				}
// 2864 			}
// 2865 		}
// 2866 	} else
// 2867 #endif
// 2868 
// 2869 	/* Normal Seek */
// 2870 	{
// 2871 		DWORD clst, bcs, nsect, ifptr;
// 2872 
// 2873 		if (ofs > fp->fsize					/* In read-only mode, clip offset with the file size */
// 2874 #if !_FS_READONLY
// 2875 			 && !(fp->flag & FA_WRITE)
// 2876 #endif
// 2877 			) ofs = fp->fsize;
??f_lseek_3:
        LDR      R0,[R5, #+12]
        CMP      R0,R6
        BCS.N    ??f_lseek_18
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+30
        BMI.N    ??f_lseek_18
        LDR      R6,[R5, #+12]
// 2878 
// 2879 		ifptr = fp->fptr;
??f_lseek_18:
        LDR      R0,[R5, #+8]
// 2880 		fp->fptr = nsect = 0;
        MOVS     R7,#+0
        STR      R7,[R5, #+8]
// 2881 		if (ofs) {
        CMP      R6,#+0
        BEQ.N    ??f_lseek_19
// 2882 			bcs = (DWORD)fp->fs->csize * SS(fp->fs);	/* Cluster size (byte) */
        LDR      R1,[R5, #+0]
        LDRB     R1,[R1, #+2]
        MOV      R2,#+512
        MUL      R8,R2,R1
// 2883 			if (ifptr > 0 &&
// 2884 				(ofs - 1) / bcs >= (ifptr - 1) / bcs) {	/* When seek to same or following cluster, */
        CMP      R0,#+0
        BEQ.N    ??f_lseek_20
        SUBS     R1,R0,#+1
        UDIV     R1,R1,R8
        SUBS     R2,R6,#+1
        UDIV     R2,R2,R8
        CMP      R2,R1
        BCC.N    ??f_lseek_20
// 2885 				fp->fptr = (ifptr - 1) & ~(bcs - 1);	/* start from the current cluster */
        SUBS     R0,R0,#+1
        SUBS     R1,R8,#+1
        BICS     R0,R0,R1
        STR      R0,[R5, #+8]
// 2886 				ofs -= fp->fptr;
        LDR      R0,[R5, #+8]
        SUBS     R6,R6,R0
// 2887 				clst = fp->clust;
        LDR      R1,[R5, #+20]
        B.N      ??f_lseek_21
// 2888 			} else {									/* When seek to back cluster, */
// 2889 				clst = fp->sclust;						/* start from the first cluster */
??f_lseek_20:
        LDR      R1,[R5, #+16]
// 2890 #if !_FS_READONLY
// 2891 				if (clst == 0) {						/* If no cluster chain, create a new chain */
        CMP      R1,#+0
        BNE.N    ??f_lseek_22
// 2892 					clst = create_chain(fp->fs, 0);
        MOVS     R1,#+0
        LDR      R0,[R5, #+0]
        BL       create_chain
        MOVS     R1,R0
// 2893 					if (clst == 1) ABORT(fp->fs, FR_INT_ERR);
        CMP      R1,#+1
        BNE.N    ??f_lseek_23
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 2894 					if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
??f_lseek_23:
        CMN      R1,#+1
        BNE.N    ??f_lseek_24
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 2895 					fp->sclust = clst;
??f_lseek_24:
        STR      R1,[R5, #+16]
// 2896 				}
// 2897 #endif
// 2898 				fp->clust = clst;
??f_lseek_22:
        STR      R1,[R5, #+20]
// 2899 			}
// 2900 			if (clst != 0) {
??f_lseek_21:
        CMP      R1,#+0
        BNE.N    ??f_lseek_25
        B.N      ??f_lseek_19
// 2901 				while (ofs > bcs) {						/* Cluster following loop */
// 2902 #if !_FS_READONLY
// 2903 					if (fp->flag & FA_WRITE) {			/* Check if in write mode or not */
// 2904 						clst = create_chain(fp->fs, clst);	/* Force stretch if in write mode */
// 2905 						if (clst == 0) {				/* When disk gets full, clip file size */
// 2906 							ofs = bcs; break;
// 2907 						}
// 2908 					} else
// 2909 #endif
// 2910 						clst = get_fat(fp->fs, clst);	/* Follow cluster chain if not in write mode */
// 2911 					if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 2912 					if (clst <= 1 || clst >= fp->fs->n_fatent) ABORT(fp->fs, FR_INT_ERR);
// 2913 					fp->clust = clst;
??f_lseek_26:
        STR      R1,[R5, #+20]
// 2914 					fp->fptr += bcs;
        LDR      R0,[R5, #+8]
        ADDS     R0,R8,R0
        STR      R0,[R5, #+8]
// 2915 					ofs -= bcs;
        SUBS     R6,R6,R8
??f_lseek_25:
        CMP      R8,R6
        BCS.N    ??f_lseek_27
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+30
        BPL.N    ??f_lseek_28
        LDR      R0,[R5, #+0]
        BL       create_chain
        MOVS     R1,R0
        CMP      R1,#+0
        BNE.N    ??f_lseek_29
        MOV      R6,R8
// 2916 				}
// 2917 				fp->fptr += ofs;
??f_lseek_27:
        LDR      R0,[R5, #+8]
        ADDS     R0,R6,R0
        STR      R0,[R5, #+8]
// 2918 				if (ofs % SS(fp->fs)) {
        MOV      R0,#+512
        UDIV     R2,R6,R0
        MLS      R2,R2,R0,R6
        CMP      R2,#+0
        BEQ.N    ??f_lseek_19
// 2919 					nsect = clust2sect(fp->fs, clst);	/* Current sector */
        LDR      R0,[R5, #+0]
        BL       clust2sect
        MOVS     R7,R0
// 2920 					if (!nsect) ABORT(fp->fs, FR_INT_ERR);
        CMP      R7,#+0
        BNE.N    ??f_lseek_30
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
??f_lseek_28:
        LDR      R0,[R5, #+0]
        BL       get_fat
        MOVS     R1,R0
??f_lseek_29:
        CMN      R1,#+1
        BNE.N    ??f_lseek_31
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
??f_lseek_31:
        CMP      R1,#+2
        BCC.N    ??f_lseek_32
        LDR      R0,[R5, #+0]
        LDR      R0,[R0, #+28]
        CMP      R1,R0
        BCC.N    ??f_lseek_26
??f_lseek_32:
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+2
        B.N      ??f_lseek_1
// 2921 					nsect += ofs / SS(fp->fs);
??f_lseek_30:
        ADDS     R7,R7,R6, LSR #+9
// 2922 				}
// 2923 			}
// 2924 		}
// 2925 		if (fp->fptr % SS(fp->fs) && nsect != fp->dsect) {	/* Fill sector cache if needed */
??f_lseek_19:
        LDR      R0,[R5, #+8]
        MOV      R1,#+512
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BEQ.N    ??f_lseek_33
        LDR      R0,[R5, #+24]
        CMP      R7,R0
        BEQ.N    ??f_lseek_33
// 2926 #if !_FS_TINY
// 2927 #if !_FS_READONLY
// 2928 			if (fp->flag & FA__DIRTY) {			/* Write-back dirty sector cache */
        LDRB     R0,[R5, #+6]
        LSLS     R0,R0,#+25
        BPL.N    ??f_lseek_34
// 2929 				if (disk_write(fp->fs->drv, fp->buf, fp->dsect, 1) != RES_OK)
        MOVS     R3,#+1
        LDR      R2,[R5, #+24]
        ADDS     R1,R5,#+40
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_write
        CMP      R0,#+0
        BEQ.N    ??f_lseek_35
// 2930 					ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 2931 				fp->flag &= ~FA__DIRTY;
??f_lseek_35:
        LDRB     R0,[R5, #+6]
        ANDS     R0,R0,#0xBF
        STRB     R0,[R5, #+6]
// 2932 			}
// 2933 #endif
// 2934 			if (disk_read(fp->fs->drv, fp->buf, nsect, 1) != RES_OK)	/* Fill sector cache */
??f_lseek_34:
        MOVS     R3,#+1
        MOVS     R2,R7
        ADDS     R1,R5,#+40
        LDR      R0,[R5, #+0]
        LDRB     R0,[R0, #+1]
        BL       disk_read
        CMP      R0,#+0
        BEQ.N    ??f_lseek_36
// 2935 				ABORT(fp->fs, FR_DISK_ERR);
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x80
        STRB     R0,[R5, #+6]
        MOVS     R0,#+1
        B.N      ??f_lseek_1
// 2936 #endif
// 2937 			fp->dsect = nsect;
??f_lseek_36:
        STR      R7,[R5, #+24]
// 2938 		}
// 2939 #if !_FS_READONLY
// 2940 		if (fp->fptr > fp->fsize) {			/* Set file change flag if the file size is extended */
??f_lseek_33:
        LDR      R0,[R5, #+12]
        LDR      R1,[R5, #+8]
        CMP      R0,R1
        BCS.N    ??f_lseek_12
// 2941 			fp->fsize = fp->fptr;
        LDR      R0,[R5, #+8]
        STR      R0,[R5, #+12]
// 2942 			fp->flag |= FA__WRITTEN;
        LDRB     R0,[R5, #+6]
        ORRS     R0,R0,#0x20
        STRB     R0,[R5, #+6]
// 2943 		}
// 2944 #endif
// 2945 	}
// 2946 
// 2947 	LEAVE_FF(fp->fs, res);
??f_lseek_12:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??f_lseek_1:
        POP      {R1,R4-R11,PC}   ;; return
// 2948 }
// 2949 
// 2950 
// 2951 
// 2952 #if _FS_MINIMIZE <= 1
// 2953 /*-----------------------------------------------------------------------*/
// 2954 /* Create a Directroy Object                                             */
// 2955 /*-----------------------------------------------------------------------*/
// 2956 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2957 FRESULT f_opendir (
// 2958 	DIR *dj,			/* Pointer to directory object to create */
// 2959 	const TCHAR *path	/* Pointer to the directory path */
// 2960 )
// 2961 {
f_opendir:
        PUSH     {R1,R4,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
// 2962 	FRESULT res;
// 2963 	DEF_NAMEBUF;
// 2964 
// 2965 
// 2966 	res = chk_mounted(&path, &dj->fs, 0);
        MOVS     R2,#+0
        MOVS     R1,R4
        ADD      R0,SP,#+12
        BL       chk_mounted
// 2967 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_opendir_0
// 2968 		INIT_BUF(*dj);
        ADD      R0,SP,#+0
        STR      R0,[R4, #+24]
        LDR.N    R0,??DataTable12_3
        STR      R0,[R4, #+28]
// 2969 		res = follow_path(dj, path);			/* Follow the path to the directory */
        LDR      R1,[SP, #+12]
        MOVS     R0,R4
        BL       follow_path
// 2970 		FREE_BUF();
// 2971 		if (res == FR_OK) {						/* Follow completed */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_opendir_1
// 2972 			if (dj->dir) {						/* It is not the root dir */
        LDR      R1,[R4, #+20]
        CMP      R1,#+0
        BEQ.N    ??f_opendir_2
// 2973 				if (dj->dir[DIR_Attr] & AM_DIR) {	/* The object is a directory */
        LDR      R1,[R4, #+20]
        LDRB     R1,[R1, #+11]
        LSLS     R1,R1,#+27
        BPL.N    ??f_opendir_3
// 2974 					dj->sclust = LD_CLUST(dj->dir);
        LDR      R1,[R4, #+20]
        LDRB     R1,[R1, #+21]
        LDR      R2,[R4, #+20]
        LDRB     R2,[R2, #+20]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R2,[R4, #+20]
        LDRB     R2,[R2, #+27]
        LDR      R3,[R4, #+20]
        LDRB     R3,[R3, #+26]
        ORRS     R2,R3,R2, LSL #+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ORRS     R1,R2,R1, LSL #+16
        STR      R1,[R4, #+8]
        B.N      ??f_opendir_2
// 2975 				} else {						/* The object is not a directory */
// 2976 					res = FR_NO_PATH;
??f_opendir_3:
        MOVS     R0,#+5
// 2977 				}
// 2978 			}
// 2979 			if (res == FR_OK) {
??f_opendir_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_opendir_1
// 2980 				dj->id = dj->fs->id;
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+6]
        STRH     R0,[R4, #+4]
// 2981 				res = dir_sdi(dj, 0);			/* Rewind dir */
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       dir_sdi
// 2982 			}
// 2983 		}
// 2984 		if (res == FR_NO_FILE) res = FR_NO_PATH;
??f_opendir_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_opendir_0
        MOVS     R0,#+5
// 2985 	}
// 2986 
// 2987 	LEAVE_FF(dj->fs, res);
??f_opendir_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+16
        POP      {R4,PC}          ;; return
// 2988 }
// 2989 
// 2990 
// 2991 
// 2992 
// 2993 /*-----------------------------------------------------------------------*/
// 2994 /* Read Directory Entry in Sequense                                      */
// 2995 /*-----------------------------------------------------------------------*/
// 2996 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 2997 FRESULT f_readdir (
// 2998 	DIR *dj,			/* Pointer to the open directory object */
// 2999 	FILINFO *fno		/* Pointer to file information to return */
// 3000 )
// 3001 {
f_readdir:
        PUSH     {R1-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 3002 	FRESULT res;
// 3003 	DEF_NAMEBUF;
// 3004 
// 3005 
// 3006 	res = validate(dj->fs, dj->id);			/* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
        BL       validate
// 3007 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_readdir_0
// 3008 		if (!fno) {
        CMP      R5,#+0
        BNE.N    ??f_readdir_1
// 3009 			res = dir_sdi(dj, 0);			/* Rewind the directory object */
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       dir_sdi
        B.N      ??f_readdir_0
// 3010 		} else {
// 3011 			INIT_BUF(*dj);
??f_readdir_1:
        ADD      R0,SP,#+0
        STR      R0,[R4, #+24]
        LDR.N    R0,??DataTable12_3
        STR      R0,[R4, #+28]
// 3012 			res = dir_read(dj);				/* Read an directory item */
        MOVS     R0,R4
        BL       dir_read
// 3013 			if (res == FR_NO_FILE) {		/* Reached end of dir */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_readdir_2
// 3014 				dj->sect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
// 3015 				res = FR_OK;
        MOVS     R0,#+0
// 3016 			}
// 3017 			if (res == FR_OK) {				/* A valid entry is found */
??f_readdir_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_readdir_0
// 3018 				get_fileinfo(dj, fno);		/* Get the object information */
        MOVS     R1,R5
        MOVS     R0,R4
        BL       get_fileinfo
// 3019 				res = dir_next(dj, 0);		/* Increment index for next */
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       dir_next
// 3020 				if (res == FR_NO_FILE) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_readdir_0
// 3021 					dj->sect = 0;
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
// 3022 					res = FR_OK;
        MOVS     R0,#+0
// 3023 				}
// 3024 			}
// 3025 			FREE_BUF();
// 3026 		}
// 3027 	}
// 3028 
// 3029 	LEAVE_FF(dj->fs, res);
??f_readdir_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1-R5,PC}       ;; return
// 3030 }
// 3031 
// 3032 
// 3033 
// 3034 #if _FS_MINIMIZE == 0
// 3035 /*-----------------------------------------------------------------------*/
// 3036 /* Get File Status                                                       */
// 3037 /*-----------------------------------------------------------------------*/
// 3038 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3039 FRESULT f_stat (
// 3040 	const TCHAR *path,	/* Pointer to the file path */
// 3041 	FILINFO *fno		/* Pointer to file information to return */
// 3042 )
// 3043 {
f_stat:
        PUSH     {R0,R4,R5,LR}
        SUB      SP,SP,#+48
        MOVS     R4,R1
// 3044 	FRESULT res;
// 3045 	DIR dj;
// 3046 	DEF_NAMEBUF;
// 3047 
// 3048 
// 3049 	res = chk_mounted(&path, &dj.fs, 0);
        MOVS     R2,#+0
        ADD      R1,SP,#+12
        ADD      R0,SP,#+48
        BL       chk_mounted
        MOVS     R5,R0
// 3050 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_stat_0
// 3051 		INIT_BUF(dj);
        ADD      R0,SP,#+0
        STR      R0,[SP, #+36]
        LDR.N    R0,??DataTable12_3
        STR      R0,[SP, #+40]
// 3052 		res = follow_path(&dj, path);	/* Follow the file path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+12
        BL       follow_path
        MOVS     R5,R0
// 3053 		if (res == FR_OK) {				/* Follow completed */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_stat_0
// 3054 			if (dj.dir)		/* Found an object */
        LDR      R0,[SP, #+32]
        CMP      R0,#+0
        BEQ.N    ??f_stat_1
// 3055 				get_fileinfo(&dj, fno);
        MOVS     R1,R4
        ADD      R0,SP,#+12
        BL       get_fileinfo
        B.N      ??f_stat_0
// 3056 			else			/* It is root dir */
// 3057 				res = FR_INVALID_NAME;
??f_stat_1:
        MOVS     R5,#+6
// 3058 		}
// 3059 		FREE_BUF();
// 3060 	}
// 3061 
// 3062 	LEAVE_FF(dj.fs, res);
??f_stat_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
        POP      {R4,R5,PC}       ;; return
// 3063 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x41615252

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x61417272

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     Fsid

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     LfnBuf
// 3064 
// 3065 
// 3066 
// 3067 #if !_FS_READONLY
// 3068 /*-----------------------------------------------------------------------*/
// 3069 /* Get Number of Free Clusters                                           */
// 3070 /*-----------------------------------------------------------------------*/
// 3071 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3072 FRESULT f_getfree (
// 3073 	const TCHAR *path,	/* Pointer to the logical drive number (root dir) */
// 3074 	DWORD *nclst,		/* Pointer to the variable to return number of free clusters */
// 3075 	FATFS **fatfs		/* Pointer to pointer to corresponding file system object to return */
// 3076 )
// 3077 {
f_getfree:
        PUSH     {R0,R4-R10,LR}
        SUB      SP,SP,#+4
        MOVS     R5,R1
        MOVS     R6,R2
// 3078 	FRESULT res;
// 3079 	DWORD n, clst, sect, stat;
// 3080 	UINT i;
// 3081 	BYTE fat, *p;
// 3082 
// 3083 
// 3084 	/* Get drive number */
// 3085 	res = chk_mounted(&path, fatfs, 0);
        MOVS     R2,#+0
        MOVS     R1,R6
        ADD      R0,SP,#+4
        BL       chk_mounted
        MOV      R8,R0
// 3086 	if (res == FR_OK) {
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??f_getfree_0
// 3087 		/* If free_clust is valid, return it without full cluster scan */
// 3088 		if ((*fatfs)->free_clust <= (*fatfs)->n_fatent - 2) {
        LDR      R0,[R6, #+0]
        LDR      R0,[R0, #+28]
        SUBS     R0,R0,#+2
        LDR      R1,[R6, #+0]
        LDR      R1,[R1, #+16]
        CMP      R0,R1
        BCC.N    ??f_getfree_1
// 3089 			*nclst = (*fatfs)->free_clust;
        LDR      R0,[R6, #+0]
        LDR      R0,[R0, #+16]
        STR      R0,[R5, #+0]
        B.N      ??f_getfree_0
// 3090 		} else {
// 3091 			/* Get number of free clusters */
// 3092 			fat = (*fatfs)->fs_type;
??f_getfree_1:
        LDR      R0,[R6, #+0]
        LDRB     R7,[R0, #+0]
// 3093 			n = 0;
        MOVS     R9,#+0
// 3094 			if (fat == FS_FAT12) {
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??f_getfree_2
// 3095 				clst = 2;
        MOVS     R4,#+2
// 3096 				do {
// 3097 					stat = get_fat(*fatfs, clst);
??f_getfree_3:
        MOVS     R1,R4
        LDR      R0,[R6, #+0]
        BL       get_fat
// 3098 					if (stat == 0xFFFFFFFF) { res = FR_DISK_ERR; break; }
        CMN      R0,#+1
        BNE.N    ??f_getfree_4
        MOVS     R8,#+1
        B.N      ??f_getfree_5
// 3099 					if (stat == 1) { res = FR_INT_ERR; break; }
??f_getfree_4:
        CMP      R0,#+1
        BNE.N    ??f_getfree_6
        MOVS     R8,#+2
        B.N      ??f_getfree_5
// 3100 					if (stat == 0) n++;
??f_getfree_6:
        CMP      R0,#+0
        BNE.N    ??f_getfree_7
        ADDS     R9,R9,#+1
// 3101 				} while (++clst < (*fatfs)->n_fatent);
??f_getfree_7:
        ADDS     R4,R4,#+1
        LDR      R0,[R6, #+0]
        LDR      R0,[R0, #+28]
        CMP      R4,R0
        BCC.N    ??f_getfree_3
        B.N      ??f_getfree_5
// 3102 			} else {
// 3103 				clst = (*fatfs)->n_fatent;
??f_getfree_2:
        LDR      R0,[R6, #+0]
        LDR      R4,[R0, #+28]
// 3104 				sect = (*fatfs)->fatbase;
        LDR      R0,[R6, #+0]
        LDR      R10,[R0, #+36]
// 3105 				i = 0; p = 0;
        MOVS     R1,#+0
        MOVS     R0,#+0
// 3106 				do {
// 3107 					if (!i) {
??f_getfree_8:
        CMP      R1,#+0
        BNE.N    ??f_getfree_9
// 3108 						res = move_window(*fatfs, sect++);
        MOV      R1,R10
        LDR      R0,[R6, #+0]
        BL       move_window
        MOV      R8,R0
        ADDS     R10,R10,#+1
// 3109 						if (res != FR_OK) break;
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BNE.N    ??f_getfree_5
// 3110 						p = (*fatfs)->win;
??f_getfree_10:
        LDR      R0,[R6, #+0]
        ADDW     R0,R0,#+52
// 3111 						i = SS(*fatfs);
        MOV      R1,#+512
// 3112 					}
// 3113 					if (fat == FS_FAT16) {
??f_getfree_9:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+2
        BNE.N    ??f_getfree_11
// 3114 						if (LD_WORD(p) == 0) n++;
        LDRB     R2,[R0, #+1]
        LDRB     R3,[R0, #+0]
        ORRS     R2,R3,R2, LSL #+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BNE.N    ??f_getfree_12
        ADDS     R9,R9,#+1
// 3115 						p += 2; i -= 2;
??f_getfree_12:
        ADDS     R0,R0,#+2
        SUBS     R1,R1,#+2
        B.N      ??f_getfree_13
// 3116 					} else {
// 3117 						if ((LD_DWORD(p) & 0x0FFFFFFF) == 0) n++;
??f_getfree_11:
        LDRB     R2,[R0, #+3]
        LDRB     R3,[R0, #+2]
        LSLS     R3,R3,#+16
        ORRS     R2,R3,R2, LSL #+24
        LDRB     R3,[R0, #+1]
        ORRS     R2,R2,R3, LSL #+8
        LDRB     R3,[R0, #+0]
        ORRS     R2,R3,R2
        LSLS     R2,R2,#+4
        BNE.N    ??f_getfree_14
        ADDS     R9,R9,#+1
// 3118 						p += 4; i -= 4;
??f_getfree_14:
        ADDS     R0,R0,#+4
        SUBS     R1,R1,#+4
// 3119 					}
// 3120 				} while (--clst);
??f_getfree_13:
        SUBS     R4,R4,#+1
        CMP      R4,#+0
        BNE.N    ??f_getfree_8
// 3121 			}
// 3122 			(*fatfs)->free_clust = n;
??f_getfree_5:
        LDR      R0,[R6, #+0]
        STR      R9,[R0, #+16]
// 3123 			if (fat == FS_FAT32) (*fatfs)->fsi_flag = 1;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+3
        BNE.N    ??f_getfree_15
        LDR      R0,[R6, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+5]
// 3124 			*nclst = n;
??f_getfree_15:
        STR      R9,[R5, #+0]
// 3125 		}
// 3126 	}
// 3127 	LEAVE_FF(*fatfs, res);
??f_getfree_0:
        MOV      R0,R8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R2,R4-R10,PC}  ;; return
// 3128 }
// 3129 
// 3130 
// 3131 
// 3132 
// 3133 /*-----------------------------------------------------------------------*/
// 3134 /* Truncate File                                                         */
// 3135 /*-----------------------------------------------------------------------*/
// 3136 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3137 FRESULT f_truncate (
// 3138 	FIL *fp		/* Pointer to the file object */
// 3139 )
// 3140 {
f_truncate:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
// 3141 	FRESULT res;
// 3142 	DWORD ncl;
// 3143 
// 3144 
// 3145 	res = validate(fp->fs, fp->id);		/* Check validity of the object */
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
        BL       validate
// 3146 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_truncate_0
// 3147 		if (fp->flag & FA__ERROR) {			/* Check abort flag */
        LDRB     R1,[R4, #+6]
        LSLS     R1,R1,#+24
        BPL.N    ??f_truncate_1
// 3148 			res = FR_INT_ERR;
        MOVS     R0,#+2
        B.N      ??f_truncate_0
// 3149 		} else {
// 3150 			if (!(fp->flag & FA_WRITE))		/* Check access mode */
??f_truncate_1:
        LDRB     R1,[R4, #+6]
        LSLS     R1,R1,#+30
        BMI.N    ??f_truncate_0
// 3151 				res = FR_DENIED;
        MOVS     R0,#+7
// 3152 		}
// 3153 	}
// 3154 	if (res == FR_OK) {
??f_truncate_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_truncate_2
// 3155 		if (fp->fsize > fp->fptr) {
        LDR      R1,[R4, #+8]
        LDR      R2,[R4, #+12]
        CMP      R1,R2
        BCS.N    ??f_truncate_3
// 3156 			fp->fsize = fp->fptr;	/* Set file size to current R/W point */
        LDR      R0,[R4, #+8]
        STR      R0,[R4, #+12]
// 3157 			fp->flag |= FA__WRITTEN;
        LDRB     R0,[R4, #+6]
        ORRS     R0,R0,#0x20
        STRB     R0,[R4, #+6]
// 3158 			if (fp->fptr == 0) {	/* When set file size to zero, remove entire cluster chain */
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BNE.N    ??f_truncate_4
// 3159 				res = remove_chain(fp->fs, fp->sclust);
        LDR      R1,[R4, #+16]
        LDR      R0,[R4, #+0]
        BL       remove_chain
// 3160 				fp->sclust = 0;
        MOVS     R1,#+0
        STR      R1,[R4, #+16]
        B.N      ??f_truncate_3
// 3161 			} else {				/* When truncate a part of the file, remove remaining clusters */
// 3162 				ncl = get_fat(fp->fs, fp->clust);
??f_truncate_4:
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+0]
        BL       get_fat
        MOVS     R5,R0
// 3163 				res = FR_OK;
        MOVS     R0,#+0
// 3164 				if (ncl == 0xFFFFFFFF) res = FR_DISK_ERR;
        CMN      R5,#+1
        BNE.N    ??f_truncate_5
        MOVS     R0,#+1
// 3165 				if (ncl == 1) res = FR_INT_ERR;
??f_truncate_5:
        CMP      R5,#+1
        BNE.N    ??f_truncate_6
        MOVS     R0,#+2
// 3166 				if (res == FR_OK && ncl < fp->fs->n_fatent) {
??f_truncate_6:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_truncate_3
        LDR      R1,[R4, #+0]
        LDR      R1,[R1, #+28]
        CMP      R5,R1
        BCS.N    ??f_truncate_3
// 3167 					res = put_fat(fp->fs, fp->clust, 0x0FFFFFFF);
        MVNS     R2,#-268435456
        LDR      R1,[R4, #+20]
        LDR      R0,[R4, #+0]
        BL       put_fat
// 3168 					if (res == FR_OK) res = remove_chain(fp->fs, ncl);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_truncate_3
        MOVS     R1,R5
        LDR      R0,[R4, #+0]
        BL       remove_chain
// 3169 				}
// 3170 			}
// 3171 		}
// 3172 		if (res != FR_OK) fp->flag |= FA__ERROR;
??f_truncate_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??f_truncate_2
        LDRB     R1,[R4, #+6]
        ORRS     R1,R1,#0x80
        STRB     R1,[R4, #+6]
// 3173 	}
// 3174 
// 3175 	LEAVE_FF(fp->fs, res);
??f_truncate_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
// 3176 }
// 3177 
// 3178 
// 3179 
// 3180 
// 3181 /*-----------------------------------------------------------------------*/
// 3182 /* Delete a File or Directory                                            */
// 3183 /*-----------------------------------------------------------------------*/
// 3184 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3185 FRESULT f_unlink (
// 3186 	const TCHAR *path		/* Pointer to the file or directory path */
// 3187 )
// 3188 {
f_unlink:
        PUSH     {R0,R4,LR}
        SUB      SP,SP,#+84
// 3189 	FRESULT res;
// 3190 	DIR dj, sdj;
// 3191 	BYTE *dir;
// 3192 	DWORD dclst;
// 3193 	DEF_NAMEBUF;
// 3194 
// 3195 
// 3196 	res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+84
        BL       chk_mounted
// 3197 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_0
// 3198 		INIT_BUF(dj);
        ADD      R0,SP,#+36
        STR      R0,[SP, #+24]
        LDR.W    R0,??DataTable17
        STR      R0,[SP, #+28]
// 3199 		res = follow_path(&dj, path);		/* Follow the file path */
        LDR      R1,[SP, #+84]
        ADD      R0,SP,#+0
        BL       follow_path
// 3200 		if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_1
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, #+11]
        LSLS     R1,R1,#+26
        BPL.N    ??f_unlink_1
// 3201 			res = FR_INVALID_NAME;			/* Cannot remove dot entry */
        MOVS     R0,#+6
// 3202 #if _FS_SHARE
// 3203 		if (res == FR_OK) res = chk_lock(&dj, 2);	/* Cannot remove open file */
// 3204 #endif
// 3205 		if (res == FR_OK) {					/* The object is accessible */
??f_unlink_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_0
// 3206 			dir = dj.dir;
        LDR      R1,[SP, #+20]
// 3207 			if (!dir) {
        CMP      R1,#+0
        BNE.N    ??f_unlink_2
// 3208 				res = FR_INVALID_NAME;		/* Cannot remove the start directory */
        MOVS     R0,#+6
        B.N      ??f_unlink_3
// 3209 			} else {
// 3210 				if (dir[DIR_Attr] & AM_RDO)
??f_unlink_2:
        LDRB     R2,[R1, #+11]
        LSLS     R2,R2,#+31
        BPL.N    ??f_unlink_3
// 3211 					res = FR_DENIED;		/* Cannot remove R/O object */
        MOVS     R0,#+7
// 3212 			}
// 3213 			dclst = LD_CLUST(dir);
??f_unlink_3:
        LDRB     R2,[R1, #+21]
        LDRB     R3,[R1, #+20]
        ORRS     R2,R3,R2, LSL #+8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDRB     R3,[R1, #+27]
        LDRB     R4,[R1, #+26]
        ORRS     R3,R4,R3, LSL #+8
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ORRS     R4,R3,R2, LSL #+16
// 3214 			if (res == FR_OK && (dir[DIR_Attr] & AM_DIR)) {	/* Is it a sub-dir? */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_4
        LDRB     R1,[R1, #+11]
        LSLS     R1,R1,#+27
        BPL.N    ??f_unlink_4
// 3215 				if (dclst < 2) {
        CMP      R4,#+2
        BCS.N    ??f_unlink_5
// 3216 					res = FR_INT_ERR;
        MOVS     R0,#+2
        B.N      ??f_unlink_4
// 3217 				} else {
// 3218 					mem_cpy(&sdj, &dj, sizeof(DIR));	/* Check if the sub-dir is empty or not */
??f_unlink_5:
        MOVS     R2,#+36
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
        BL       mem_cpy
// 3219 					sdj.sclust = dclst;
        STR      R4,[SP, #+56]
// 3220 					res = dir_sdi(&sdj, 2);		/* Exclude dot entries */
        MOVS     R1,#+2
        ADD      R0,SP,#+48
        BL       dir_sdi
// 3221 					if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_4
// 3222 						res = dir_read(&sdj);
        ADD      R0,SP,#+48
        BL       dir_read
// 3223 						if (res == FR_OK			/* Not empty dir */
// 3224 #if _FS_RPATH
// 3225 						|| dclst == sdj.fs->cdir	/* Current dir */
// 3226 #endif
// 3227 						) res = FR_DENIED;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??f_unlink_6
        LDR      R1,[SP, #+48]
        LDR      R1,[R1, #+24]
        CMP      R4,R1
        BNE.N    ??f_unlink_7
??f_unlink_6:
        MOVS     R0,#+7
// 3228 						if (res == FR_NO_FILE) res = FR_OK;	/* Empty */
??f_unlink_7:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??f_unlink_4
        MOVS     R0,#+0
// 3229 					}
// 3230 				}
// 3231 			}
// 3232 			if (res == FR_OK) {
??f_unlink_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_0
// 3233 				res = dir_remove(&dj);		/* Remove the directory entry */
        ADD      R0,SP,#+0
        BL       dir_remove
// 3234 				if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_0
// 3235 					if (dclst)				/* Remove the cluster chain if exist */
        CMP      R4,#+0
        BEQ.N    ??f_unlink_8
// 3236 						res = remove_chain(dj.fs, dclst);
        MOVS     R1,R4
        LDR      R0,[SP, #+0]
        BL       remove_chain
// 3237 					if (res == FR_OK) res = sync(dj.fs);
??f_unlink_8:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_unlink_0
        LDR      R0,[SP, #+0]
        BL       sync
// 3238 				}
// 3239 			}
// 3240 		}
// 3241 		FREE_BUF();
// 3242 	}
// 3243 	LEAVE_FF(dj.fs, res);
??f_unlink_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+88
        POP      {R4,PC}          ;; return
// 3244 }
// 3245 
// 3246 
// 3247 
// 3248 
// 3249 /*-----------------------------------------------------------------------*/
// 3250 /* Create a Directory                                                    */
// 3251 /*-----------------------------------------------------------------------*/
// 3252 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3253 FRESULT f_mkdir (
// 3254 	const TCHAR *path		/* Pointer to the directory path */
// 3255 )
// 3256 {
f_mkdir:
        PUSH     {R0,R4-R9,LR}
        SUB      SP,SP,#+48
// 3257 	FRESULT res;
// 3258 	DIR dj;
// 3259 	BYTE *dir, n;
// 3260 	DWORD dsc, dcl, pcl, tim = get_fattime();
        BL       get_fattime
        MOVS     R4,R0
// 3261 	DEF_NAMEBUF;
// 3262 
// 3263 
// 3264 	res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
        BL       chk_mounted
        MOVS     R5,R0
// 3265 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??f_mkdir_0
// 3266 		INIT_BUF(dj);
        ADD      R0,SP,#+36
        STR      R0,[SP, #+24]
        LDR.W    R0,??DataTable17
        STR      R0,[SP, #+28]
// 3267 		res = follow_path(&dj, path);			/* Follow the file path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+0
        BL       follow_path
        MOVS     R5,R0
// 3268 		if (res == FR_OK) res = FR_EXIST;		/* Any object with same name is already existing */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_mkdir_1
        MOVS     R5,#+8
// 3269 		if (_FS_RPATH && res == FR_NO_FILE && (dj.fn[NS] & NS_DOT))
??f_mkdir_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.N    ??f_mkdir_2
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+11]
        LSLS     R0,R0,#+26
        BPL.N    ??f_mkdir_2
// 3270 			res = FR_INVALID_NAME;
        MOVS     R5,#+6
// 3271 		if (res == FR_NO_FILE) {				/* Can create a new directory */
??f_mkdir_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.W    ??f_mkdir_0
// 3272 			dcl = create_chain(dj.fs, 0);		/* Allocate a cluster for the new directory table */
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
        BL       create_chain
        MOVS     R6,R0
// 3273 			res = FR_OK;
        MOVS     R5,#+0
// 3274 			if (dcl == 0) res = FR_DENIED;		/* No space to allocate a new cluster */
        CMP      R6,#+0
        BNE.N    ??f_mkdir_3
        MOVS     R5,#+7
// 3275 			if (dcl == 1) res = FR_INT_ERR;
??f_mkdir_3:
        CMP      R6,#+1
        BNE.N    ??f_mkdir_4
        MOVS     R5,#+2
// 3276 			if (dcl == 0xFFFFFFFF) res = FR_DISK_ERR;
??f_mkdir_4:
        CMN      R6,#+1
        BNE.N    ??f_mkdir_5
        MOVS     R5,#+1
// 3277 			if (res == FR_OK)					/* Flush FAT */
??f_mkdir_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_mkdir_6
// 3278 				res = move_window(dj.fs, 0);
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
        BL       move_window
        MOVS     R5,R0
// 3279 			if (res == FR_OK) {					/* Initialize the new directory table */
??f_mkdir_6:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_mkdir_7
// 3280 				dsc = clust2sect(dj.fs, dcl);
        MOVS     R1,R6
        LDR      R0,[SP, #+0]
        BL       clust2sect
        MOVS     R7,R0
// 3281 				dir = dj.fs->win;
        LDR      R0,[SP, #+0]
        ADDW     R8,R0,#+52
// 3282 				mem_set(dir, 0, SS(dj.fs));
        MOV      R2,#+512
        MOVS     R1,#+0
        MOV      R0,R8
        BL       mem_set
// 3283 				mem_set(dir+DIR_Name, ' ', 8+3);	/* Create "." entry */
        MOVS     R2,#+11
        MOVS     R1,#+32
        MOV      R0,R8
        BL       mem_set
// 3284 				dir[DIR_Name] = '.';
        MOVS     R0,#+46
        STRB     R0,[R8, #+0]
// 3285 				dir[DIR_Attr] = AM_DIR;
        MOVS     R0,#+16
        STRB     R0,[R8, #+11]
// 3286 				ST_DWORD(dir+DIR_WrtTime, tim);
        STRB     R4,[R8, #+22]
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+23]
        LSRS     R0,R4,#+16
        STRB     R0,[R8, #+24]
        LSRS     R0,R4,#+24
        STRB     R0,[R8, #+25]
// 3287 				ST_CLUST(dir, dcl);
        STRB     R6,[R8, #+26]
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+27]
        LSRS     R0,R6,#+16
        STRB     R0,[R8, #+20]
        LSRS     R0,R6,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+21]
// 3288 				mem_cpy(dir+SZ_DIR, dir, SZ_DIR); 	/* Create ".." entry */
        MOVS     R2,#+32
        MOV      R1,R8
        ADDS     R0,R8,#+32
        BL       mem_cpy
// 3289 				dir[33] = '.'; pcl = dj.sclust;
        MOVS     R0,#+46
        STRB     R0,[R8, #+33]
        LDR      R0,[SP, #+8]
// 3290 				if (dj.fs->fs_type == FS_FAT32 && pcl == dj.fs->dirbase)
        LDR      R1,[SP, #+0]
        LDRB     R1,[R1, #+0]
        CMP      R1,#+3
        BNE.N    ??f_mkdir_8
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+40]
        CMP      R0,R1
        BNE.N    ??f_mkdir_8
// 3291 					pcl = 0;
        MOVS     R0,#+0
// 3292 				ST_CLUST(dir+SZ_DIR, pcl);
??f_mkdir_8:
        STRB     R0,[R8, #+58]
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R8, #+59]
        LSRS     R1,R0,#+16
        STRB     R1,[R8, #+52]
        LSRS     R0,R0,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+53]
// 3293 				for (n = dj.fs->csize; n; n--) {	/* Write dot entries and clear following sectors */
        LDR      R0,[SP, #+0]
        LDRB     R9,[R0, #+2]
        B.N      ??f_mkdir_9
// 3294 					dj.fs->winsect = dsc++;
// 3295 					dj.fs->wflag = 1;
// 3296 					res = move_window(dj.fs, 0);
// 3297 					if (res != FR_OK) break;
// 3298 					mem_set(dir, 0, SS(dj.fs));
??f_mkdir_10:
        MOV      R2,#+512
        MOVS     R1,#+0
        MOV      R0,R8
        BL       mem_set
        SUBS     R9,R9,#+1
??f_mkdir_9:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??f_mkdir_7
        LDR      R0,[SP, #+0]
        STR      R7,[R0, #+48]
        ADDS     R7,R7,#+1
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
        BL       move_window
        MOVS     R5,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??f_mkdir_10
// 3299 				}
// 3300 			}
// 3301 			if (res == FR_OK) res = dir_register(&dj);	/* Register the object to the directoy */
??f_mkdir_7:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_mkdir_11
        ADD      R0,SP,#+0
        BL       dir_register
        MOVS     R5,R0
// 3302 			if (res != FR_OK) {
??f_mkdir_11:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??f_mkdir_12
// 3303 				remove_chain(dj.fs, dcl);			/* Could not register, remove cluster chain */
        MOVS     R1,R6
        LDR      R0,[SP, #+0]
        BL       remove_chain
        B.N      ??f_mkdir_0
// 3304 			} else {
// 3305 				dir = dj.dir;
??f_mkdir_12:
        LDR      R8,[SP, #+20]
// 3306 				dir[DIR_Attr] = AM_DIR;				/* Attribute */
        MOVS     R0,#+16
        STRB     R0,[R8, #+11]
// 3307 				ST_DWORD(dir+DIR_WrtTime, tim);		/* Created time */
        STRB     R4,[R8, #+22]
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+23]
        LSRS     R0,R4,#+16
        STRB     R0,[R8, #+24]
        LSRS     R0,R4,#+24
        STRB     R0,[R8, #+25]
// 3308 				ST_CLUST(dir, dcl);					/* Table start cluster */
        STRB     R6,[R8, #+26]
        MOVS     R0,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+27]
        LSRS     R0,R6,#+16
        STRB     R0,[R8, #+20]
        LSRS     R0,R6,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R8, #+21]
// 3309 				dj.fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 3310 				res = sync(dj.fs);
        LDR      R0,[SP, #+0]
        BL       sync
        MOVS     R5,R0
// 3311 			}
// 3312 		}
// 3313 		FREE_BUF();
// 3314 	}
// 3315 
// 3316 	LEAVE_FF(dj.fs, res);
??f_mkdir_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
        POP      {R4-R9,PC}       ;; return
// 3317 }
// 3318 
// 3319 
// 3320 
// 3321 
// 3322 /*-----------------------------------------------------------------------*/
// 3323 /* Change Attribute                                                      */
// 3324 /*-----------------------------------------------------------------------*/
// 3325 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3326 FRESULT f_chmod (
// 3327 	const TCHAR *path,	/* Pointer to the file path */
// 3328 	BYTE value,			/* Attribute bits */
// 3329 	BYTE mask			/* Attribute mask to change */
// 3330 )
// 3331 {
f_chmod:
        PUSH     {R0,R4,R5,LR}
        SUB      SP,SP,#+48
        MOVS     R4,R1
        MOVS     R5,R2
// 3332 	FRESULT res;
// 3333 	DIR dj;
// 3334 	BYTE *dir;
// 3335 	DEF_NAMEBUF;
// 3336 
// 3337 
// 3338 	res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+48
        BL       chk_mounted
// 3339 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_chmod_0
// 3340 		INIT_BUF(dj);
        ADD      R0,SP,#+36
        STR      R0,[SP, #+24]
        LDR.N    R0,??DataTable17
        STR      R0,[SP, #+28]
// 3341 		res = follow_path(&dj, path);		/* Follow the file path */
        LDR      R1,[SP, #+48]
        ADD      R0,SP,#+0
        BL       follow_path
// 3342 		FREE_BUF();
// 3343 		if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_chmod_1
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, #+11]
        LSLS     R1,R1,#+26
        BPL.N    ??f_chmod_1
// 3344 			res = FR_INVALID_NAME;
        MOVS     R0,#+6
// 3345 		if (res == FR_OK) {
??f_chmod_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_chmod_0
// 3346 			dir = dj.dir;
        LDR      R0,[SP, #+20]
// 3347 			if (!dir) {						/* Is it a root directory? */
        CMP      R0,#+0
        BNE.N    ??f_chmod_2
// 3348 				res = FR_INVALID_NAME;
        MOVS     R0,#+6
        B.N      ??f_chmod_0
// 3349 			} else {						/* File or sub directory */
// 3350 				mask &= AM_RDO|AM_HID|AM_SYS|AM_ARC;	/* Valid attribute mask */
??f_chmod_2:
        ANDS     R5,R5,#0x27
// 3351 				dir[DIR_Attr] = (value & mask) | (dir[DIR_Attr] & (BYTE)~mask);	/* Apply attribute change */
        ANDS     R1,R5,R4
        LDRB     R2,[R0, #+11]
        BICS     R2,R2,R5
        ORRS     R1,R2,R1
        STRB     R1,[R0, #+11]
// 3352 				dj.fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 3353 				res = sync(dj.fs);
        LDR      R0,[SP, #+0]
        BL       sync
// 3354 			}
// 3355 		}
// 3356 	}
// 3357 
// 3358 	LEAVE_FF(dj.fs, res);
??f_chmod_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+52
        POP      {R4,R5,PC}       ;; return
// 3359 }
// 3360 
// 3361 
// 3362 
// 3363 
// 3364 /*-----------------------------------------------------------------------*/
// 3365 /* Change Timestamp                                                      */
// 3366 /*-----------------------------------------------------------------------*/
// 3367 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3368 FRESULT f_utime (
// 3369 	const TCHAR *path,	/* Pointer to the file/directory name */
// 3370 	const FILINFO *fno	/* Pointer to the time stamp to be set */
// 3371 )
// 3372 {
f_utime:
        PUSH     {R0,R4,LR}
        SUB      SP,SP,#+52
        MOVS     R4,R1
// 3373 	FRESULT res;
// 3374 	DIR dj;
// 3375 	BYTE *dir;
// 3376 	DEF_NAMEBUF;
// 3377 
// 3378 
// 3379 	res = chk_mounted(&path, &dj.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+0
        ADD      R0,SP,#+52
        BL       chk_mounted
// 3380 	if (res == FR_OK) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_utime_0
// 3381 		INIT_BUF(dj);
        ADD      R0,SP,#+36
        STR      R0,[SP, #+24]
        LDR.N    R0,??DataTable17
        STR      R0,[SP, #+28]
// 3382 		res = follow_path(&dj, path);	/* Follow the file path */
        LDR      R1,[SP, #+52]
        ADD      R0,SP,#+0
        BL       follow_path
// 3383 		FREE_BUF();
// 3384 		if (_FS_RPATH && res == FR_OK && (dj.fn[NS] & NS_DOT))
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_utime_1
        LDR      R1,[SP, #+24]
        LDRB     R1,[R1, #+11]
        LSLS     R1,R1,#+26
        BPL.N    ??f_utime_1
// 3385 			res = FR_INVALID_NAME;
        MOVS     R0,#+6
// 3386 		if (res == FR_OK) {
??f_utime_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??f_utime_0
// 3387 			dir = dj.dir;
        LDR      R0,[SP, #+20]
// 3388 			if (!dir) {					/* Root directory */
        CMP      R0,#+0
        BNE.N    ??f_utime_2
// 3389 				res = FR_INVALID_NAME;
        MOVS     R0,#+6
        B.N      ??f_utime_0
// 3390 			} else {					/* File or sub-directory */
// 3391 				ST_WORD(dir+DIR_WrtTime, fno->ftime);
??f_utime_2:
        LDRH     R1,[R4, #+6]
        STRB     R1,[R0, #+22]
        LDRH     R1,[R4, #+6]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+23]
// 3392 				ST_WORD(dir+DIR_WrtDate, fno->fdate);
        LDRH     R1,[R4, #+4]
        STRB     R1,[R0, #+24]
        LDRH     R1,[R4, #+4]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+25]
// 3393 				dj.fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 3394 				res = sync(dj.fs);
        LDR      R0,[SP, #+0]
        BL       sync
// 3395 			}
// 3396 		}
// 3397 	}
// 3398 
// 3399 	LEAVE_FF(dj.fs, res);
??f_utime_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+56
        POP      {R4,PC}          ;; return
// 3400 }
// 3401 
// 3402 
// 3403 
// 3404 
// 3405 /*-----------------------------------------------------------------------*/
// 3406 /* Rename File/Directory                                                 */
// 3407 /*-----------------------------------------------------------------------*/
// 3408 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3409 FRESULT f_rename (
// 3410 	const TCHAR *path_old,	/* Pointer to the old name */
// 3411 	const TCHAR *path_new	/* Pointer to the new name */
// 3412 )
// 3413 {
f_rename:
        PUSH     {R0,R4,R5,LR}
        SUB      SP,SP,#+112
        MOVS     R4,R1
// 3414 	FRESULT res;
// 3415 	DIR djo, djn;
// 3416 	BYTE buf[21], *dir;
// 3417 	DWORD dw;
// 3418 	DEF_NAMEBUF;
// 3419 
// 3420 
// 3421 	res = chk_mounted(&path_old, &djo.fs, 1);
        MOVS     R2,#+1
        ADD      R1,SP,#+36
        ADD      R0,SP,#+112
        BL       chk_mounted
        MOVS     R5,R0
// 3422 	if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??f_rename_0
// 3423 		djn.fs = djo.fs;
        LDR      R0,[SP, #+36]
        STR      R0,[SP, #+0]
// 3424 		INIT_BUF(djo);
        ADD      R0,SP,#+72
        STR      R0,[SP, #+60]
        LDR.N    R0,??DataTable17
        STR      R0,[SP, #+64]
// 3425 		res = follow_path(&djo, path_old);		/* Check old object */
        LDR      R1,[SP, #+112]
        ADD      R0,SP,#+36
        BL       follow_path
        MOVS     R5,R0
// 3426 		if (_FS_RPATH && res == FR_OK && (djo.fn[NS] & NS_DOT))
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_1
        LDR      R0,[SP, #+60]
        LDRB     R0,[R0, #+11]
        LSLS     R0,R0,#+26
        BPL.N    ??f_rename_1
// 3427 			res = FR_INVALID_NAME;
        MOVS     R5,#+6
// 3428 #if _FS_SHARE
// 3429 		if (res == FR_OK) res = chk_lock(&djo, 2);
// 3430 #endif
// 3431 		if (res == FR_OK) {						/* Old object is found */
??f_rename_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.W    ??f_rename_0
// 3432 			if (!djo.dir) {						/* Is root dir? */
        LDR      R0,[SP, #+56]
        CMP      R0,#+0
        BNE.N    ??f_rename_2
// 3433 				res = FR_NO_FILE;
        MOVS     R5,#+4
        B.N      ??f_rename_0
// 3434 			} else {
// 3435 				mem_cpy(buf, djo.dir+DIR_Attr, 21);		/* Save the object information except for name */
??f_rename_2:
        MOVS     R2,#+21
        LDR      R0,[SP, #+56]
        ADDS     R1,R0,#+11
        ADD      R0,SP,#+84
        BL       mem_cpy
// 3436 				mem_cpy(&djn, &djo, sizeof(DIR));		/* Check new object */
        MOVS     R2,#+36
        ADD      R1,SP,#+36
        ADD      R0,SP,#+0
        BL       mem_cpy
// 3437 				res = follow_path(&djn, path_new);
        MOVS     R1,R4
        ADD      R0,SP,#+0
        BL       follow_path
        MOVS     R5,R0
// 3438 				if (res == FR_OK) res = FR_EXIST;		/* The new object name is already existing */
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_3
        MOVS     R5,#+8
// 3439 				if (res == FR_NO_FILE) { 				/* Is it a valid path and no name collision? */
??f_rename_3:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BNE.N    ??f_rename_0
// 3440 /* Start critical section that any interruption or error can cause cross-link */
// 3441 					res = dir_register(&djn);			/* Register the new entry */
        ADD      R0,SP,#+0
        BL       dir_register
        MOVS     R5,R0
// 3442 					if (res == FR_OK) {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_0
// 3443 						dir = djn.dir;					/* Copy object information except for name */
        LDR      R4,[SP, #+20]
// 3444 						mem_cpy(dir+13, buf+2, 19);
        MOVS     R2,#+19
        ADD      R1,SP,#+86
        ADDS     R0,R4,#+13
        BL       mem_cpy
// 3445 						dir[DIR_Attr] = buf[0] | AM_ARC;
        LDRB     R0,[SP, #+84]
        ORRS     R0,R0,#0x20
        STRB     R0,[R4, #+11]
// 3446 						djo.fs->wflag = 1;
        LDR      R0,[SP, #+36]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 3447 						if (djo.sclust != djn.sclust && (dir[DIR_Attr] & AM_DIR)) {		/* Update .. entry in the directory if needed */
        LDR      R0,[SP, #+44]
        LDR      R1,[SP, #+8]
        CMP      R0,R1
        BEQ.N    ??f_rename_4
        LDRB     R0,[R4, #+11]
        LSLS     R0,R0,#+27
        BPL.N    ??f_rename_4
// 3448 							dw = clust2sect(djn.fs, LD_CLUST(dir));
        LDRB     R0,[R4, #+21]
        LDRB     R1,[R4, #+20]
        ORRS     R0,R1,R0, LSL #+8
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDRB     R1,[R4, #+27]
        LDRB     R2,[R4, #+26]
        ORRS     R1,R2,R1, LSL #+8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R1,R1,R0, LSL #+16
        LDR      R0,[SP, #+0]
        BL       clust2sect
// 3449 							if (!dw) {
        CMP      R0,#+0
        BNE.N    ??f_rename_5
// 3450 								res = FR_INT_ERR;
        MOVS     R5,#+2
        B.N      ??f_rename_4
// 3451 							} else {
// 3452 								res = move_window(djn.fs, dw);
??f_rename_5:
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       move_window
        MOVS     R5,R0
// 3453 								dir = djn.fs->win+SZ_DIR;	/* .. entry */
        LDR      R0,[SP, #+0]
        ADDW     R4,R0,#+84
// 3454 								if (res == FR_OK && dir[1] == '.') {
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_4
        LDRB     R0,[R4, #+1]
        CMP      R0,#+46
        BNE.N    ??f_rename_4
// 3455 									dw = (djn.fs->fs_type == FS_FAT32 && djn.sclust == djn.fs->dirbase) ? 0 : djn.sclust;
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??f_rename_6
        LDR      R0,[SP, #+8]
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+40]
        CMP      R0,R1
        BNE.N    ??f_rename_6
        MOVS     R0,#+0
        B.N      ??f_rename_7
??f_rename_6:
        LDR      R0,[SP, #+8]
// 3456 									ST_CLUST(dir, dw);
??f_rename_7:
        STRB     R0,[R4, #+26]
        MOVS     R1,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LSRS     R1,R1,#+8
        STRB     R1,[R4, #+27]
        LSRS     R1,R0,#+16
        STRB     R1,[R4, #+20]
        LSRS     R0,R0,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        STRB     R0,[R4, #+21]
// 3457 									djn.fs->wflag = 1;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+4]
// 3458 								}
// 3459 							}
// 3460 						}
// 3461 						if (res == FR_OK) {
??f_rename_4:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_0
// 3462 							res = dir_remove(&djo);		/* Remove old entry */
        ADD      R0,SP,#+36
        BL       dir_remove
        MOVS     R5,R0
// 3463 							if (res == FR_OK)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??f_rename_0
// 3464 								res = sync(djo.fs);
        LDR      R0,[SP, #+36]
        BL       sync
        MOVS     R5,R0
// 3465 						}
// 3466 					}
// 3467 /* End critical section */
// 3468 				}
// 3469 			}
// 3470 		}
// 3471 		FREE_BUF();
// 3472 	}
// 3473 	LEAVE_FF(djo.fs, res);
??f_rename_0:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+116
        POP      {R4,R5,PC}       ;; return
// 3474 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     LfnBuf
// 3475 
// 3476 #endif /* !_FS_READONLY */
// 3477 #endif /* _FS_MINIMIZE == 0 */
// 3478 #endif /* _FS_MINIMIZE <= 1 */
// 3479 #endif /* _FS_MINIMIZE <= 2 */
// 3480 
// 3481 
// 3482 
// 3483 /*-----------------------------------------------------------------------*/
// 3484 /* Forward data to the stream directly (available on only tiny cfg)      */
// 3485 /*-----------------------------------------------------------------------*/
// 3486 #if _USE_FORWARD && _FS_TINY
// 3487 
// 3488 FRESULT f_forward (
// 3489 	FIL *fp, 						/* Pointer to the file object */
// 3490 	UINT (*func)(const BYTE*,UINT),	/* Pointer to the streaming function */
// 3491 	UINT btr,						/* Number of bytes to forward */
// 3492 	UINT *bf						/* Pointer to number of bytes forwarded */
// 3493 )
// 3494 {
// 3495 	FRESULT res;
// 3496 	DWORD remain, clst, sect;
// 3497 	UINT rcnt;
// 3498 	BYTE csect;
// 3499 
// 3500 
// 3501 	*bf = 0;	/* Initialize byte counter */
// 3502 
// 3503 	res = validate(fp->fs, fp->id);					/* Check validity of the object */
// 3504 	if (res != FR_OK) LEAVE_FF(fp->fs, res);
// 3505 	if (fp->flag & FA__ERROR)						/* Check error flag */
// 3506 		LEAVE_FF(fp->fs, FR_INT_ERR);
// 3507 	if (!(fp->flag & FA_READ))						/* Check access mode */
// 3508 		LEAVE_FF(fp->fs, FR_DENIED);
// 3509 
// 3510 	remain = fp->fsize - fp->fptr;
// 3511 	if (btr > remain) btr = (UINT)remain;			/* Truncate btr by remaining bytes */
// 3512 
// 3513 	for ( ;  btr && (*func)(0, 0);					/* Repeat until all data transferred or stream becomes busy */
// 3514 		fp->fptr += rcnt, *bf += rcnt, btr -= rcnt) {
// 3515 		csect = (BYTE)(fp->fptr / SS(fp->fs) & (fp->fs->csize - 1));	/* Sector offset in the cluster */
// 3516 		if ((fp->fptr % SS(fp->fs)) == 0) {			/* On the sector boundary? */
// 3517 			if (!csect) {							/* On the cluster boundary? */
// 3518 				clst = (fp->fptr == 0) ?			/* On the top of the file? */
// 3519 					fp->sclust : get_fat(fp->fs, fp->clust);
// 3520 				if (clst <= 1) ABORT(fp->fs, FR_INT_ERR);
// 3521 				if (clst == 0xFFFFFFFF) ABORT(fp->fs, FR_DISK_ERR);
// 3522 				fp->clust = clst;					/* Update current cluster */
// 3523 			}
// 3524 		}
// 3525 		sect = clust2sect(fp->fs, fp->clust);		/* Get current data sector */
// 3526 		if (!sect) ABORT(fp->fs, FR_INT_ERR);
// 3527 		sect += csect;
// 3528 		if (move_window(fp->fs, sect))				/* Move sector window */
// 3529 			ABORT(fp->fs, FR_DISK_ERR);
// 3530 		fp->dsect = sect;
// 3531 		rcnt = SS(fp->fs) - (WORD)(fp->fptr % SS(fp->fs));	/* Forward data from sector window */
// 3532 		if (rcnt > btr) rcnt = btr;
// 3533 		rcnt = (*func)(&fp->fs->win[(WORD)fp->fptr % SS(fp->fs)], rcnt);
// 3534 		if (!rcnt) ABORT(fp->fs, FR_INT_ERR);
// 3535 	}
// 3536 
// 3537 	LEAVE_FF(fp->fs, FR_OK);
// 3538 }
// 3539 #endif /* _USE_FORWARD */
// 3540 
// 3541 
// 3542 
// 3543 #if _USE_MKFS && !_FS_READONLY
// 3544 /*-----------------------------------------------------------------------*/
// 3545 /* Create File System on the Drive                                       */
// 3546 /*-----------------------------------------------------------------------*/
// 3547 #define N_ROOTDIR	512		/* Number of root dir entries for FAT12/16 */
// 3548 #define N_FATS		1		/* Number of FAT copies (1 or 2) */
// 3549 
// 3550 
// 3551 FRESULT f_mkfs (
// 3552 	BYTE drv,		/* Logical drive number */
// 3553 	BYTE sfd,		/* Partitioning rule 0:FDISK, 1:SFD */
// 3554 	UINT au			/* Allocation unit size [bytes] */
// 3555 )
// 3556 {
// 3557 	static const WORD vst[] = { 1024,   512,  256,  128,   64,    32,   16,    8,    4,    2,   0};
// 3558 	static const WORD cst[] = {32768, 16384, 8192, 4096, 2048, 16384, 8192, 4096, 2048, 1024, 512};
// 3559 	BYTE fmt, md, *tbl;
// 3560 	DWORD n_clst, vs, n, wsect;
// 3561 	UINT i;
// 3562 	DWORD b_vol, b_fat, b_dir, b_data;	/* Offset (LBA) */
// 3563 	DWORD n_vol, n_rsv, n_fat, n_dir;	/* Size */
// 3564 	FATFS *fs;
// 3565 	DSTATUS stat;
// 3566 
// 3567 
// 3568 	/* Check mounted drive and clear work area */
// 3569 	if (drv >= _VOLUMES) return FR_INVALID_DRIVE;
// 3570 	fs = FatFs[drv];
// 3571 	if (!fs) return FR_NOT_ENABLED;
// 3572 	fs->fs_type = 0;
// 3573 	drv = LD2PD(drv);
// 3574 
// 3575 	/* Get disk statics */
// 3576 	stat = disk_initialize(drv);
// 3577 	if (stat & STA_NOINIT) return FR_NOT_READY;
// 3578 	if (stat & STA_PROTECT) return FR_WRITE_PROTECTED;
// 3579 #if _MAX_SS != 512					/* Get disk sector size */
// 3580 	if (disk_ioctl(drv, GET_SECTOR_SIZE, &SS(fs)) != RES_OK)
// 3581 		return FR_DISK_ERR;
// 3582 #endif
// 3583 	if (disk_ioctl(drv, GET_SECTOR_COUNT, &n_vol) != RES_OK || n_vol < 128)
// 3584 		return FR_DISK_ERR;
// 3585 	b_vol = (sfd) ? 0 : 63;	/* Volume start sector */
// 3586 	n_vol -= b_vol;
// 3587 	if (au & (au - 1)) au = 0;	/* Check validity of the AU size */
// 3588 	if (!au) {					/* AU auto selection */
// 3589 		vs = n_vol / (2000 / (SS(fs) / 512));
// 3590 		for (i = 0; vs < vst[i]; i++) ;
// 3591 		au = cst[i];
// 3592 	}
// 3593 	au /= SS(fs);		/* Number of sectors per cluster */
// 3594 	if (au == 0) au = 1;
// 3595 	if (au > 128) au = 128;
// 3596 
// 3597 	/* Pre-compute number of clusters and FAT syb-type */
// 3598 	n_clst = n_vol / au;
// 3599 	fmt = FS_FAT12;
// 3600 	if (n_clst >= MIN_FAT16) fmt = FS_FAT16;
// 3601 	if (n_clst >= MIN_FAT32) fmt = FS_FAT32;
// 3602 
// 3603 	/* Determine offset and size of FAT structure */
// 3604 	if (fmt == FS_FAT32) {
// 3605 		n_fat = ((n_clst * 4) + 8 + SS(fs) - 1) / SS(fs);
// 3606 		n_rsv = 32;
// 3607 		n_dir = 0;
// 3608 	} else {
// 3609 		n_fat = (fmt == FS_FAT12) ? (n_clst * 3 + 1) / 2 + 3 : (n_clst * 2) + 4;
// 3610 		n_fat = (n_fat + SS(fs) - 1) / SS(fs);
// 3611 		n_rsv = 1;
// 3612 		n_dir = (DWORD)N_ROOTDIR * SZ_DIR / SS(fs);
// 3613 	}
// 3614 	b_fat = b_vol + n_rsv;				/* FAT area start sector */
// 3615 	b_dir = b_fat + n_fat * N_FATS;		/* Directory area start sector */
// 3616 	b_data = b_dir + n_dir;				/* Data area start sector */
// 3617 	if (n_vol < b_data + au) return FR_MKFS_ABORTED;	/* Too small volume */
// 3618 
// 3619 	/* Align data start sector to erase block boundary (for flash memory media) */
// 3620 	if (disk_ioctl(drv, GET_BLOCK_SIZE, &n) != RES_OK || !n || n > 32768) n = 1;
// 3621 	n = (b_data + n - 1) & ~(n - 1);	/* Next nearest erase block from current data start */
// 3622 	n = (n - b_data) / N_FATS;
// 3623 	if (fmt == FS_FAT32) {		/* FAT32: Move FAT offset */
// 3624 		n_rsv += n;
// 3625 		b_fat += n;
// 3626 	} else {					/* FAT12/16: Expand FAT size */
// 3627 		n_fat += n;
// 3628 	}
// 3629 
// 3630 	/* Determine number of clusters and final check of validity of the FAT sub-type */
// 3631 	n_clst = (n_vol - n_rsv - n_fat * N_FATS - n_dir) / au;
// 3632 	if (   (fmt == FS_FAT16 && n_clst < MIN_FAT16)
// 3633 		|| (fmt == FS_FAT32 && n_clst < MIN_FAT32))
// 3634 		return FR_MKFS_ABORTED;
// 3635 
// 3636 	/* Create partition table if required */
// 3637 	if (sfd) {	/* No patition table (SFD) */
// 3638 		md = 0xF0;
// 3639 	} else {	/* With patition table (FDISK) */
// 3640 		DWORD n_disk = b_vol + n_vol;
// 3641 
// 3642 		mem_set(fs->win, 0, SS(fs));
// 3643 		tbl = fs->win+MBR_Table;
// 3644 		ST_DWORD(tbl, 0x00010180);			/* Partition start in CHS */
// 3645 		if (n_disk < 63UL * 255 * 1024) {	/* Partition end in CHS */
// 3646 			n_disk = n_disk / 63 / 255;
// 3647 			tbl[7] = (BYTE)n_disk;
// 3648 			tbl[6] = (BYTE)((n_disk >> 2) | 63);
// 3649 		} else {
// 3650 			ST_WORD(&tbl[6], 0xFFFF);	/* CHS saturated */
// 3651 		}
// 3652 		tbl[5] = 254;
// 3653 		if (fmt != FS_FAT32)				/* System ID */
// 3654 			tbl[4] = (n_vol < 0x10000) ? 0x04 : 0x06;
// 3655 		else
// 3656 			tbl[4] = 0x0c;
// 3657 		ST_DWORD(tbl+8, 63);				/* Partition start in LBA */
// 3658 		ST_DWORD(tbl+12, n_vol);			/* Partition size in LBA */
// 3659 		ST_WORD(fs->win+BS_55AA, 0xAA55);	/* MBR signature */
// 3660 		if (disk_write(drv, fs->win, 0, 1) != RES_OK)	/* Put the MBR into first physical sector */
// 3661 			return FR_DISK_ERR;
// 3662 		md = 0xF8;
// 3663 	}
// 3664 
// 3665 	/* Create volume boot record */
// 3666 	tbl = fs->win;							/* Clear sector */
// 3667 	mem_set(tbl, 0, SS(fs));
// 3668 	mem_cpy(tbl, "\xEB\xFE\x90" "MSDOS5.0", 11);/* Boot jump code, OEM name */
// 3669 	i = SS(fs);								/* Sector size */
// 3670 	ST_WORD(tbl+BPB_BytsPerSec, i);
// 3671 	tbl[BPB_SecPerClus] = (BYTE)au;			/* Sectors per cluster */
// 3672 	ST_WORD(tbl+BPB_RsvdSecCnt, n_rsv);		/* Reserved sectors */
// 3673 	tbl[BPB_NumFATs] = N_FATS;				/* Number of FATs */
// 3674 	i = (fmt == FS_FAT32) ? 0 : N_ROOTDIR;	/* Number of rootdir entries */
// 3675 	ST_WORD(tbl+BPB_RootEntCnt, i);
// 3676 	if (n_vol < 0x10000) {					/* Number of total sectors */
// 3677 		ST_WORD(tbl+BPB_TotSec16, n_vol);
// 3678 	} else {
// 3679 		ST_DWORD(tbl+BPB_TotSec32, n_vol);
// 3680 	}
// 3681 	tbl[BPB_Media] = md;					/* Media descriptor */
// 3682 	ST_WORD(tbl+BPB_SecPerTrk, 63);			/* Number of sectors per track */
// 3683 	ST_WORD(tbl+BPB_NumHeads, 255);			/* Number of heads */
// 3684 	ST_DWORD(tbl+BPB_HiddSec, b_vol);		/* Hidden sectors */
// 3685 	n = get_fattime();						/* Use current time as VSN */
// 3686 	if (fmt == FS_FAT32) {
// 3687 		ST_DWORD(tbl+BS_VolID32, n);		/* VSN */
// 3688 		ST_DWORD(tbl+BPB_FATSz32, n_fat);	/* Number of sectors per FAT */
// 3689 		ST_DWORD(tbl+BPB_RootClus, 2);		/* Root directory start cluster (2) */
// 3690 		ST_WORD(tbl+BPB_FSInfo, 1);			/* FSInfo record offset (VBR+1) */
// 3691 		ST_WORD(tbl+BPB_BkBootSec, 6);		/* Backup boot record offset (VBR+6) */
// 3692 		tbl[BS_DrvNum32] = 0x80;			/* Drive number */
// 3693 		tbl[BS_BootSig32] = 0x29;			/* Extended boot signature */
// 3694 		mem_cpy(tbl+BS_VolLab32, "NO NAME    " "FAT32   ", 19);	/* Volume label, FAT signature */
// 3695 	} else {
// 3696 		ST_DWORD(tbl+BS_VolID, n);			/* VSN */
// 3697 		ST_WORD(tbl+BPB_FATSz16, n_fat);	/* Number of sectors per FAT */
// 3698 		tbl[BS_DrvNum] = 0x80;				/* Drive number */
// 3699 		tbl[BS_BootSig] = 0x29;				/* Extended boot signature */
// 3700 		mem_cpy(tbl+BS_VolLab, "NO NAME    " "FAT     ", 19);	/* Volume label, FAT signature */
// 3701 	}
// 3702 	ST_WORD(tbl+BS_55AA, 0xAA55);			/* Signature (Offset is fixed here regardless of sector size) */
// 3703 	if (disk_write(drv, tbl, b_vol, 1) != RES_OK)	/* Write VBR */
// 3704 		return FR_DISK_ERR;
// 3705 	if (fmt == FS_FAT32)							/* Write backup VBR if needed (VBR+6) */
// 3706 		disk_write(drv, tbl, b_vol + 6, 1);
// 3707 
// 3708 	/* Initialize FAT area */
// 3709 	wsect = b_fat;
// 3710 	for (i = 0; i < N_FATS; i++) {		/* Initialize each FAT copy */
// 3711 		mem_set(tbl, 0, SS(fs));			/* 1st sector of the FAT  */
// 3712 		n = md;								/* Media descriptor byte */
// 3713 		if (fmt != FS_FAT32) {
// 3714 			n |= (fmt == FS_FAT12) ? 0x00FFFF00 : 0xFFFFFF00;
// 3715 			ST_DWORD(tbl+0, n);				/* Reserve cluster #0-1 (FAT12/16) */
// 3716 		} else {
// 3717 			n |= 0xFFFFFF00;
// 3718 			ST_DWORD(tbl+0, n);				/* Reserve cluster #0-1 (FAT32) */
// 3719 			ST_DWORD(tbl+4, 0xFFFFFFFF);
// 3720 			ST_DWORD(tbl+8, 0x0FFFFFFF);	/* Reserve cluster #2 for root dir */
// 3721 		}
// 3722 		if (disk_write(drv, tbl, wsect++, 1) != RES_OK)
// 3723 			return FR_DISK_ERR;
// 3724 		mem_set(tbl, 0, SS(fs));			/* Fill following FAT entries with zero */
// 3725 		for (n = 1; n < n_fat; n++) {		/* This loop may take a time on FAT32 volume due to many single sector writes */
// 3726 			if (disk_write(drv, tbl, wsect++, 1) != RES_OK)
// 3727 				return FR_DISK_ERR;
// 3728 		}
// 3729 	}
// 3730 
// 3731 	/* Initialize root directory */
// 3732 	i = (fmt == FS_FAT32) ? au : n_dir;
// 3733 	do {
// 3734 		if (disk_write(drv, tbl, wsect++, 1) != RES_OK)
// 3735 			return FR_DISK_ERR;
// 3736 	} while (--i);
// 3737 
// 3738 #if _USE_ERASE	/* Erase data area if needed */
// 3739 	{
// 3740 		DWORD eb[2];
// 3741 
// 3742 		eb[0] = wsect; eb[1] = wsect + (n_clst - ((fmt == FS_FAT32) ? 1 : 0)) * au - 1;
// 3743 		disk_ioctl(drv, CTRL_ERASE_SECTOR, eb);
// 3744 	}
// 3745 #endif
// 3746 
// 3747 	/* Create FSInfo if needed */
// 3748 	if (fmt == FS_FAT32) {
// 3749 		ST_DWORD(tbl+FSI_LeadSig, 0x41615252);
// 3750 		ST_DWORD(tbl+FSI_StrucSig, 0x61417272);
// 3751 		ST_DWORD(tbl+FSI_Free_Count, n_clst - 1);	/* Number of free clusters */
// 3752 		ST_DWORD(tbl+FSI_Nxt_Free, 2);				/* Last allocated cluster# */
// 3753 		ST_WORD(tbl+BS_55AA, 0xAA55);
// 3754 		disk_write(drv, tbl, b_vol + 1, 1);	/* Write original (VBR+1) */
// 3755 		disk_write(drv, tbl, b_vol + 7, 1);	/* Write backup (VBR+7) */
// 3756 	}
// 3757 
// 3758 	return (disk_ioctl(drv, CTRL_SYNC, (void*)0) == RES_OK) ? FR_OK : FR_DISK_ERR;
// 3759 }
// 3760 
// 3761 #endif /* _USE_MKFS && !_FS_READONLY */
// 3762 
// 3763 
// 3764 
// 3765 
// 3766 #if _USE_STRFUNC
// 3767 /*-----------------------------------------------------------------------*/
// 3768 /* Get a string from the file                                            */
// 3769 /*-----------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3770 TCHAR* f_gets (
// 3771 	TCHAR* buff,	/* Pointer to the string buffer to read */
// 3772 	int len,		/* Size of string buffer (characters) */
// 3773 	FIL* fil		/* Pointer to the file object */
// 3774 )
// 3775 {
f_gets:
        PUSH     {R2-R8,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOV      R8,R2
// 3776 	int n = 0;
        MOVS     R5,#+0
// 3777 	TCHAR c, *p = buff;
        MOVS     R6,R4
// 3778 	BYTE s[2];
// 3779 	UINT rc;
// 3780 
// 3781 
// 3782 	while (n < len - 1) {			/* Read bytes until buffer gets filled */
??f_gets_0:
        SUBS     R0,R7,#+1
        CMP      R5,R0
        BGE.N    ??f_gets_1
// 3783 		f_read(fil, s, 1, &rc);
        ADD      R3,SP,#+0
        MOVS     R2,#+1
        ADD      R1,SP,#+4
        MOV      R0,R8
        BL       f_read
// 3784 		if (rc != 1) break;			/* Break on EOF or error */
        LDR      R0,[SP, #+0]
        CMP      R0,#+1
        BNE.N    ??f_gets_1
// 3785 		c = s[0];
??f_gets_2:
        LDRB     R0,[SP, #+4]
// 3786 #if _LFN_UNICODE					/* Read a character in UTF-8 encoding */
// 3787 		if (c >= 0x80) {
// 3788 			if (c < 0xC0) continue;	/* Skip stray trailer */
// 3789 			if (c < 0xE0) {			/* Two-byte sequense */
// 3790 				f_read(fil, s, 1, &rc);
// 3791 				if (rc != 1) break;
// 3792 				c = ((c & 0x1F) << 6) | (s[0] & 0x3F);
// 3793 				if (c < 0x80) c = '?';
// 3794 			} else {
// 3795 				if (c < 0xF0) {		/* Three-byte sequense */
// 3796 					f_read(fil, s, 2, &rc);
// 3797 					if (rc != 2) break;
// 3798 					c = (c << 12) | ((s[0] & 0x3F) << 6) | (s[1] & 0x3F);
// 3799 					if (c < 0x800) c = '?';
// 3800 				} else {			/* Reject four-byte sequense */
// 3801 					c = '?';
// 3802 				}
// 3803 			}
// 3804 		}
// 3805 #endif
// 3806 #if _USE_STRFUNC >= 2
// 3807 		if (c == '\r') continue;	/* Strip '\r' */
// 3808 #endif
// 3809 		*p++ = c;
        STRB     R0,[R6, #+0]
        ADDS     R6,R6,#+1
// 3810 		n++;
        ADDS     R5,R5,#+1
// 3811 		if (c == '\n') break;		/* Break on EOL */
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+10
        BNE.N    ??f_gets_0
// 3812 	}
// 3813 	*p = 0;
??f_gets_1:
        MOVS     R0,#+0
        STRB     R0,[R6, #+0]
// 3814 	return n ? buff : 0;			/* When no data read (eof or error), return with error. */
        CMP      R5,#+0
        BNE.N    ??f_gets_3
??f_gets_4:
        MOVS     R4,#+0
??f_gets_3:
        MOVS     R0,R4
        POP      {R1,R2,R4-R8,PC}  ;; return
// 3815 }
// 3816 
// 3817 
// 3818 
// 3819 #if !_FS_READONLY
// 3820 #include <stdarg.h>
// 3821 /*-----------------------------------------------------------------------*/
// 3822 /* Put a character to the file                                           */
// 3823 /*-----------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3824 int f_putc (
// 3825 	TCHAR c,	/* A character to be output */
// 3826 	FIL* fil	/* Pointer to the file object */
// 3827 )
// 3828 {
f_putc:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R1
// 3829 	UINT bw, btw;
// 3830 	BYTE s[3];
// 3831 
// 3832 
// 3833 #if _USE_STRFUNC >= 2
// 3834 	if (c == '\n') f_putc ('\r', fil);	/* LF -> CRLF conversion */
// 3835 #endif
// 3836 
// 3837 #if _LFN_UNICODE	/* Write the character in UTF-8 encoding */
// 3838 	if (c < 0x80) {			/* 7-bit */
// 3839 		s[0] = (BYTE)c;
// 3840 		btw = 1;
// 3841 	} else {
// 3842 		if (c < 0x800) {	/* 11-bit */
// 3843 			s[0] = (BYTE)(0xC0 | (c >> 6));
// 3844 			s[1] = (BYTE)(0x80 | (c & 0x3F));
// 3845 			btw = 2;
// 3846 		} else {			/* 16-bit */
// 3847 			s[0] = (BYTE)(0xE0 | (c >> 12));
// 3848 			s[1] = (BYTE)(0x80 | ((c >> 6) & 0x3F));
// 3849 			s[2] = (BYTE)(0x80 | (c & 0x3F));
// 3850 			btw = 3;
// 3851 		}
// 3852 	}
// 3853 #else				/* Write the character without conversion */
// 3854 	s[0] = (BYTE)c;
        STRB     R0,[SP, #+0]
// 3855 	btw = 1;
        MOVS     R5,#+1
// 3856 #endif
// 3857 	f_write(fil, s, btw, &bw);		/* Write the char to the file */
        ADD      R3,SP,#+4
        MOVS     R2,R5
        ADD      R1,SP,#+0
        MOVS     R0,R4
        BL       f_write
// 3858 	return (bw == btw) ? 1 : EOF;	/* Return the result */
        LDR      R0,[SP, #+4]
        CMP      R0,R5
        BNE.N    ??f_putc_0
        MOVS     R0,#+1
        B.N      ??f_putc_1
??f_putc_0:
        MOVS     R0,#-1
??f_putc_1:
        POP      {R1-R5,PC}       ;; return
// 3859 }
// 3860 
// 3861 
// 3862 
// 3863 
// 3864 /*-----------------------------------------------------------------------*/
// 3865 /* Put a string to the file                                              */
// 3866 /*-----------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3867 int f_puts (
// 3868 	const TCHAR* str,	/* Pointer to the string to be output */
// 3869 	FIL* fil			/* Pointer to the file object */
// 3870 )
// 3871 {
f_puts:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
// 3872 	int n;
// 3873 
// 3874 
// 3875 	for (n = 0; *str; str++, n++) {
        MOVS     R6,#+0
        B.N      ??f_puts_0
??f_puts_1:
        ADDS     R4,R4,#+1
        ADDS     R6,R6,#+1
??f_puts_0:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??f_puts_2
// 3876 		if (f_putc(*str, fil) == EOF) return EOF;
        MOVS     R1,R5
        LDRB     R0,[R4, #+0]
        BL       f_putc
        CMN      R0,#+1
        BNE.N    ??f_puts_1
        MOVS     R0,#-1
        B.N      ??f_puts_3
// 3877 	}
// 3878 	return n;
??f_puts_2:
        MOVS     R0,R6
??f_puts_3:
        POP      {R4-R6,PC}       ;; return
// 3879 }
// 3880 
// 3881 
// 3882 
// 3883 
// 3884 /*-----------------------------------------------------------------------*/
// 3885 /* Put a formatted string to the file                                    */
// 3886 /*-----------------------------------------------------------------------*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 3887 int f_printf (
// 3888 	FIL* fil,			/* Pointer to the file object */
// 3889 	const TCHAR* str,	/* Pointer to the format string */
// 3890 	...					/* Optional arguments... */
// 3891 )
// 3892 {
f_printf:
        PUSH     {R0,R2,R3}
        PUSH     {R0-R11,LR}
        MOVS     R5,R1
// 3893 	va_list arp;
// 3894 	BYTE f, r;
// 3895 	UINT i, j, w;
// 3896 	ULONG v;
// 3897 	TCHAR c, d, s[16], *p;
// 3898 	int res, cc;
// 3899 
// 3900 
// 3901 	va_start(arp, str);
        ADD      R6,SP,#+56
// 3902 
// 3903 	for (cc = res = 0; cc != EOF; res += cc) {
        MOVS     R0,#+0
        MOVS     R4,R0
        B.N      ??f_printf_0
// 3904 		c = *str++;
// 3905 		if (c == 0) break;			/* End of string */
// 3906 		if (c != '%') {				/* Non escape character */
// 3907 			cc = f_putc(c, fil);
// 3908 			if (cc != EOF) cc = 1;
// 3909 			continue;
// 3910 		}
// 3911 		w = f = 0;
// 3912 		c = *str++;
// 3913 		if (c == '0') {				/* Flag: '0' padding */
// 3914 			f = 1; c = *str++;
// 3915 		} else {
// 3916 			if (c == '-') {			/* Flag: left justified */
// 3917 				f = 2; c = *str++;
// 3918 			}
// 3919 		}
// 3920 		while (IsDigit(c)) {		/* Precision */
// 3921 			w = w * 10 + c - '0';
// 3922 			c = *str++;
// 3923 		}
// 3924 		if (c == 'l' || c == 'L') {	/* Prefix: Size is long int */
// 3925 			f |= 4; c = *str++;
// 3926 		}
// 3927 		if (!c) break;
// 3928 		d = c;
// 3929 		if (IsLower(d)) d -= 0x20;
// 3930 		switch (d) {				/* Type is... */
// 3931 		case 'S' :					/* String */
// 3932 			p = va_arg(arp, TCHAR*);
// 3933 			for (j = 0; p[j]; j++) ;
// 3934 			res = 0;
// 3935 			while (!(f & 2) && j++ < w) res += (cc = f_putc(' ', fil));
// 3936 			res += (cc = f_puts(p, fil));
// 3937 			while (j++ < w) res += (cc = f_putc(' ', fil));
// 3938 			if (cc != EOF) cc = res;
// 3939 			continue;
// 3940 		case 'C' :					/* Character */
// 3941 			cc = f_putc((TCHAR)va_arg(arp, int), fil); continue;
// 3942 		case 'B' :					/* Binary */
// 3943 			r = 2; break;
// 3944 		case 'O' :					/* Octal */
// 3945 			r = 8; break;
// 3946 		case 'D' :					/* Signed decimal */
// 3947 		case 'U' :					/* Unsigned decimal */
// 3948 			r = 10; break;
// 3949 		case 'X' :					/* Hexdecimal */
// 3950 			r = 16; break;
// 3951 		default:					/* Unknown type (passthrough) */
// 3952 			cc = f_putc(c, fil); continue;
// 3953 		}
// 3954 
// 3955 		/* Get an argument and put it in numeral */
// 3956 		v = (f & 4) ? va_arg(arp, long) : ((d == 'D') ? (long)va_arg(arp, int) : va_arg(arp, unsigned int));
// 3957 		if (d == 'D' && (v & 0x80000000)) {
// 3958 			v = 0 - v;
// 3959 			f |= 8;
// 3960 		}
// 3961 		i = 0;
// 3962 		do {
// 3963 			d = (TCHAR)(v % r); v /= r;
// 3964 			if (d > 9) d += (c == 'x') ? 0x27 : 0x07;
// 3965 			s[i++] = d + '0';
// 3966 		} while (v && i < sizeof(s) / sizeof(s[0]));
// 3967 		if (f & 8) s[i++] = '-';
// 3968 		j = i; d = (f & 1) ? '0' : ' ';
// 3969 		res = 0;
// 3970 		while (!(f & 2) && j++ < w) res += (cc = f_putc(d, fil));
// 3971 		do res += (cc = f_putc(s[--i], fil)); while(i);
// 3972 		while (j++ < w) res += (cc = f_putc(' ', fil));
// 3973 		if (cc != EOF) cc = res;
??f_printf_1:
        CMN      R0,#+1
        BEQ.N    ??f_printf_2
        MOVS     R0,R4
??f_printf_2:
        ADDS     R4,R0,R4
??f_printf_0:
        CMN      R0,#+1
        BEQ.N    ??f_printf_3
        LDRB     R2,[R5, #+0]
        ADDS     R5,R5,#+1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BNE.N    ??f_printf_4
// 3974 	}
// 3975 
// 3976 	va_end(arp);
// 3977 	return (cc == EOF) ? cc : res;
??f_printf_3:
        CMN      R0,#+1
        BNE.W    ??f_printf_5
        B.N      ??f_printf_6
??f_printf_4:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+37
        BEQ.N    ??f_printf_7
        LDR      R1,[SP, #+52]
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       f_putc
        CMN      R0,#+1
        BEQ.N    ??f_printf_8
        MOVS     R0,#+1
??f_printf_8:
        B.N      ??f_printf_2
??f_printf_7:
        MOVS     R8,#+0
        MOV      R7,R8
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R2,[R5, #+0]
        ADDS     R5,R5,#+1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+48
        BNE.N    ??f_printf_9
        MOVS     R7,#+1
        LDRB     R2,[R5, #+0]
        ADDS     R5,R5,#+1
        B.N      ??f_printf_10
??f_printf_9:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+45
        BNE.N    ??f_printf_10
        MOVS     R7,#+2
        LDRB     R2,[R5, #+0]
        ADDS     R5,R5,#+1
        B.N      ??f_printf_10
??f_printf_11:
        MOVS     R1,#+10
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MLA      R1,R1,R8,R2
        SUBS     R8,R1,#+48
        LDRB     R2,[R5, #+0]
        ADDS     R5,R5,#+1
??f_printf_10:
        SUBS     R1,R2,#+48
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+10
        BCC.N    ??f_printf_11
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+108
        BEQ.N    ??f_printf_12
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+76
        BNE.N    ??f_printf_13
??f_printf_12:
        ORRS     R7,R7,#0x4
        LDRB     R2,[R5, #+0]
        ADDS     R5,R5,#+1
??f_printf_13:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??f_printf_3
??f_printf_14:
        MOV      R11,R2
        SUBS     R0,R11,#+97
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+26
        BCS.N    ??f_printf_15
        SUBS     R11,R11,#+32
??f_printf_15:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        MOV      R0,R11
        CMP      R0,#+66
        BEQ.N    ??f_printf_16
        CMP      R0,#+67
        BEQ.N    ??f_printf_17
        CMP      R0,#+68
        BEQ.N    ??f_printf_18
        CMP      R0,#+79
        BEQ.N    ??f_printf_19
        CMP      R0,#+83
        BEQ.N    ??f_printf_20
        CMP      R0,#+85
        BEQ.N    ??f_printf_18
        CMP      R0,#+88
        BEQ.N    ??f_printf_21
        B.N      ??f_printf_22
??f_printf_20:
        LDR      R10,[R6, #+0]
        ADDS     R6,R6,#+4
        MOVS     R9,#+0
        B.N      ??f_printf_23
??f_printf_24:
        ADDS     R9,R9,#+1
??f_printf_23:
        LDRB     R0,[R9, R10]
        CMP      R0,#+0
        BNE.N    ??f_printf_24
        MOVS     R4,#+0
        B.N      ??f_printf_25
??f_printf_26:
        LDR      R1,[SP, #+52]
        MOVS     R0,#+32
        BL       f_putc
        ADDS     R4,R0,R4
??f_printf_25:
        LSLS     R0,R7,#+30
        BMI.N    ??f_printf_27
        MOV      R0,R9
        ADDS     R9,R0,#+1
        CMP      R0,R8
        BCC.N    ??f_printf_26
??f_printf_27:
        LDR      R1,[SP, #+52]
        MOV      R0,R10
        BL       f_puts
        ADDS     R4,R0,R4
        B.N      ??f_printf_28
??f_printf_29:
        LDR      R1,[SP, #+52]
        MOVS     R0,#+32
        BL       f_putc
        ADDS     R4,R0,R4
??f_printf_28:
        MOV      R1,R9
        ADDS     R9,R1,#+1
        CMP      R1,R8
        BCC.N    ??f_printf_29
        CMN      R0,#+1
        BEQ.N    ??f_printf_30
        MOVS     R0,R4
??f_printf_30:
        B.N      ??f_printf_2
??f_printf_17:
        MOVS     R0,R6
        ADDS     R6,R0,#+4
        LDR      R1,[SP, #+52]
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       f_putc
        B.N      ??f_printf_2
??f_printf_16:
        MOVS     R0,#+2
??f_printf_31:
        LSLS     R1,R7,#+29
        BPL.N    ??f_printf_32
        LDR      R1,[R6, #+0]
        ADDS     R6,R6,#+4
        B.N      ??f_printf_33
??f_printf_19:
        MOVS     R0,#+8
        B.N      ??f_printf_31
??f_printf_18:
        MOVS     R0,#+10
        B.N      ??f_printf_31
??f_printf_21:
        MOVS     R0,#+16
        B.N      ??f_printf_31
??f_printf_22:
        LDR      R1,[SP, #+52]
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       f_putc
        B.N      ??f_printf_2
??f_printf_32:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+68
        BNE.N    ??f_printf_34
        LDR      R1,[R6, #+0]
        ADDS     R6,R6,#+4
        B.N      ??f_printf_33
??f_printf_34:
        LDR      R1,[R6, #+0]
        ADDS     R6,R6,#+4
??f_printf_33:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+68
        BNE.N    ??f_printf_35
        CMP      R1,#+0
        BPL.N    ??f_printf_35
        RSBS     R1,R1,#+0
        ORRS     R7,R7,#0x8
??f_printf_35:
        MOVS     R10,#+0
??f_printf_36:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UDIV     R3,R1,R0
        MLS      R11,R0,R3,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UDIV     R1,R1,R0
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+10
        BCC.N    ??f_printf_37
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+120
        BNE.N    ??f_printf_38
        MOVS     R3,#+39
        B.N      ??f_printf_39
??f_printf_38:
        MOVS     R3,#+7
??f_printf_39:
        ADDS     R11,R3,R11
??f_printf_37:
        ADD      R3,SP,#+0
        ADDS     R4,R11,#+48
        STRB     R4,[R10, R3]
        ADDS     R10,R10,#+1
        CMP      R1,#+0
        BEQ.N    ??f_printf_40
        CMP      R10,#+16
        BCC.N    ??f_printf_36
??f_printf_40:
        LSLS     R0,R7,#+28
        BPL.N    ??f_printf_41
        ADD      R0,SP,#+0
        MOVS     R1,#+45
        STRB     R1,[R10, R0]
        ADDS     R10,R10,#+1
??f_printf_41:
        MOV      R9,R10
        LSLS     R0,R7,#+31
        BPL.N    ??f_printf_42
        MOVS     R11,#+48
        B.N      ??f_printf_43
??f_printf_42:
        MOVS     R11,#+32
??f_printf_43:
        MOVS     R4,#+0
        B.N      ??f_printf_44
??f_printf_45:
        LDR      R1,[SP, #+52]
        MOV      R0,R11
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       f_putc
        ADDS     R4,R0,R4
??f_printf_44:
        LSLS     R0,R7,#+30
        BMI.N    ??f_printf_46
        MOV      R0,R9
        ADDS     R9,R0,#+1
        CMP      R0,R8
        BCC.N    ??f_printf_45
??f_printf_46:
        SUBS     R10,R10,#+1
        LDR      R1,[SP, #+52]
        ADD      R0,SP,#+0
        LDRB     R0,[R10, R0]
        BL       f_putc
        ADDS     R4,R0,R4
        CMP      R10,#+0
        BNE.N    ??f_printf_46
??f_printf_47:
        MOV      R1,R9
        ADDS     R9,R1,#+1
        CMP      R1,R8
        BCS.W    ??f_printf_1
        LDR      R1,[SP, #+52]
        MOVS     R0,#+32
        BL       f_putc
        ADDS     R4,R0,R4
        B.N      ??f_printf_47
??f_printf_5:
        MOVS     R0,R4
??f_printf_6:
        ADD      SP,SP,#+16
        POP      {R4-R11}
        LDR      PC,[SP], #+16    ;; return
// 3978 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 3979 
// 3980 #endif /* !_FS_READONLY */
// 3981 #endif /* _USE_STRFUNC */
// 
//    519 bytes in section .bss
//    164 bytes in section .rodata
// 10 900 bytes in section .text
// 
// 10 900 bytes of CODE  memory
//    164 bytes of CONST memory
//    519 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
