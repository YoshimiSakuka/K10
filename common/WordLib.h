#ifndef _WordLib_H
#define _WordLib_H

#include "..\K60_datatype.h"

//汉字编码表,用LCD3310.exe软件可以获取汉字编码
typedef struct typHZ_GB12	/*12*12 汉字字模显示数据结构,一个汉字分为上下两层*/
{
   char Index[2];//一个汉字占两个字节
   char Msk[24];//一个汉字的编码由24个十六进制数组成
}typHZ_GB12; 

struct typHZ_GB12 const  GB_12[] ={ 
{"前",{0x04,0xF4,0x54,0x55,0x56,0xF4,0x04,0xF6,0x05,0x04,0xF6,0x04,0x00,0x0F,0x01,0x01,0x09,0x0F,0x00,0x03,0x04,0x08,0x07,0x00}},
{"进",{0x20,0x22,0xE4,0x00,0x44,0x44,0xFF,0x44,0x44,0xFF,0x44,0x44,0x08,0x04,0x03,0x04,0x0A,0x09,0x08,0x08,0x08,0x0B,0x08,0x08}},
{"左",{0x04,0x04,0x84,0x64,0x5C,0x47,0x44,0xC4,0x44,0x64,0x46,0x04,0x02,0x09,0x08,0x08,0x08,0x08,0x08,0x0F,0x08,0x08,0x0C,0x08}},
{"转",{0x24,0x3C,0x27,0xF4,0xA0,0x14,0x54,0x7C,0x57,0x54,0xD4,0x10,0x02,0x03,0x01,0x0F,0x00,0x00,0x02,0x02,0x06,0x0D,0x00,0x00}},
{"右",{0x04,0x84,0x44,0xE4,0x5C,0x47,0x44,0x44,0x44,0xE4,0x46,0x04,0x01,0x00,0x00,0x0F,0x04,0x04,0x04,0x04,0x04,0x0F,0x00,0x00}},
{"保",{0x20,0x10,0xFC,0x43,0x40,0x5E,0xD2,0xF2,0x52,0x5F,0x42,0x40,0x00,0x00,0x0F,0x04,0x02,0x01,0x00,0x0F,0x01,0x02,0x04,0x04}},
{"持",{0x44,0x44,0xFF,0x24,0x50,0x54,0x54,0x5F,0x54,0xF6,0x54,0x50,0x04,0x08,0x0F,0x00,0x00,0x01,0x02,0x08,0x08,0x0F,0x00,0x00}},
{"车",{0x02,0x02,0x22,0x3A,0x26,0x23,0xFA,0x22,0x32,0x22,0x83,0x02,0x01,0x01,0x01,0x01,0x01,0x01,0x0F,0x01,0x01,0x01,0x01,0x01}},
{"距",{0x00,0xDE,0x12,0xF2,0x5E,0x00,0xFE,0x92,0x92,0x92,0xF3,0x02,0x04,0x07,0x04,0x03,0x02,0x04,0x0F,0x04,0x04,0x04,0x06,0x04}},
{"五",{0x00,0x00,0x3E,0x22,0x22,0x22,0x22,0x22,0x22,0xC2,0x00,0x00,0x00,0x00,0x04,0x08,0x08,0x08,0x08,0x08,0x04,0x03,0x00,0x00}},
{"零",{0x00,0xF8,0x04,0x82,0x42,0x22,0x12,0x04,0xF8,0x00,0x00,0x00,0x00,0x03,0x04,0x08,0x08,0x08,0x08,0x04,0x03,0x00,0x00,0x00}},
{"厘",{0x00,0x00,0xFE,0x02,0xFA,0xAA,0xAA,0xFA,0xAA,0xAA,0xFB,0x02,0x04,0x03,0x08,0x0A,0x0A,0x0A,0x0A,0x0F,0x0A,0x0A,0x0A,0x08}},
{"米",{0x00,0x10,0x12,0x9C,0x70,0x10,0xFF,0x58,0x94,0x12,0x18,0x10,0x04,0x02,0x01,0x00,0x00,0x00,0x0F,0x00,0x00,0x01,0x02,0x02}}
//{"",{}},
};



//ASCII码编码表
 uint8 font6x8[][6] =
{
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },   // sp      00
    { 0x00, 0x00, 0x00, 0x2f, 0x00, 0x00 },   // !       01
    { 0x00, 0x00, 0x07, 0x00, 0x07, 0x00 },   // "       02
    { 0x00, 0x14, 0x7f, 0x14, 0x7f, 0x14 },   // #       03
    { 0x00, 0x24, 0x2a, 0x7f, 0x2a, 0x12 },   // $       04
    { 0x00, 0x62, 0x64, 0x08, 0x13, 0x23 },   // %       05
    { 0x00, 0x36, 0x49, 0x55, 0x22, 0x50 },   // &       06
    { 0x00, 0x00, 0x05, 0x03, 0x00, 0x00 },   // '       07
    { 0x00, 0x00, 0x1c, 0x22, 0x41, 0x00 },   // (       08
    { 0x00, 0x00, 0x41, 0x22, 0x1c, 0x00 },   // )       09
    { 0x00, 0x14, 0x08, 0x3E, 0x08, 0x14 },   // *       10
    { 0x00, 0x08, 0x08, 0x3E, 0x08, 0x08 },   // +       11
    { 0x00, 0x00, 0x00, 0xA0, 0x60, 0x00 },   // ,       12
    { 0x00, 0x08, 0x08, 0x08, 0x08, 0x08 },   // -       13
    { 0x00, 0x00, 0x60, 0x60, 0x00, 0x00 },   // .       14
    { 0x00, 0x20, 0x10, 0x08, 0x04, 0x02 },   // /       15
    { 0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E },   // 0       16
    { 0x00, 0x00, 0x42, 0x7F, 0x40, 0x00 },   // 1       17
    { 0x00, 0x42, 0x61, 0x51, 0x49, 0x46 },   // 2       18
    { 0x00, 0x21, 0x41, 0x45, 0x4B, 0x31 },   // 3       19
    { 0x00, 0x18, 0x14, 0x12, 0x7F, 0x10 },   // 4       20
    { 0x00, 0x27, 0x45, 0x45, 0x45, 0x39 },   // 5       21
    { 0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30 },   // 6       22
    { 0x00, 0x01, 0x71, 0x09, 0x05, 0x03 },   // 7       23
    { 0x00, 0x36, 0x49, 0x49, 0x49, 0x36 },   // 8       24
    { 0x00, 0x06, 0x49, 0x49, 0x29, 0x1E },   // 9       25
    { 0x00, 0x00, 0x36, 0x36, 0x00, 0x00 },   // :       26
    { 0x00, 0x00, 0x56, 0x36, 0x00, 0x00 },   // ;       27
    { 0x00, 0x08, 0x14, 0x22, 0x41, 0x00 },   // <       28
    { 0x00, 0x14, 0x14, 0x14, 0x14, 0x14 },   // =       29
    { 0x00, 0x00, 0x41, 0x22, 0x14, 0x08 },   // >       30
    { 0x00, 0x02, 0x01, 0x51, 0x09, 0x06 },   // ?       31
    { 0x00, 0x32, 0x49, 0x59, 0x51, 0x3E },   // @       32
    { 0x00, 0x7C, 0x12, 0x11, 0x12, 0x7C },   // A       33
    { 0x00, 0x7F, 0x49, 0x49, 0x49, 0x36 },   // B       34
    { 0x00, 0x3E, 0x41, 0x41, 0x41, 0x22 },   // C       35
    { 0x00, 0x7F, 0x41, 0x41, 0x22, 0x1C },   // D       36
    { 0x00, 0x7F, 0x49, 0x49, 0x49, 0x41 },   // E       37
    { 0x00, 0x7F, 0x09, 0x09, 0x09, 0x01 },   // F       38
    { 0x00, 0x3E, 0x41, 0x49, 0x49, 0x7A },   // G       39
    { 0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F },   // H       40
    { 0x00, 0x00, 0x41, 0x7F, 0x41, 0x00 },   // I       41
    { 0x00, 0x20, 0x40, 0x41, 0x3F, 0x01 },   // J       42
    { 0x00, 0x7F, 0x08, 0x14, 0x22, 0x41 },   // K       43
    { 0x00, 0x7F, 0x40, 0x40, 0x40, 0x40 },   // L       44
    { 0x00, 0x7F, 0x02, 0x0C, 0x02, 0x7F },   // M       45
    { 0x00, 0x7F, 0x04, 0x08, 0x10, 0x7F },   // N       46
    { 0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E },   // O       47
    { 0x00, 0x7F, 0x09, 0x09, 0x09, 0x06 },   // P       48
    { 0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E },   // Q       49
    { 0x00, 0x7F, 0x09, 0x19, 0x29, 0x46 },   // R       50
    { 0x00, 0x46, 0x49, 0x49, 0x49, 0x31 },   // S       51
    { 0x00, 0x01, 0x01, 0x7F, 0x01, 0x01 },   // T       52
    { 0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F },   // U       53
    { 0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F },   // V       54
    { 0x00, 0x3F, 0x40, 0x38, 0x40, 0x3F },   // W       55
    { 0x00, 0x63, 0x14, 0x08, 0x14, 0x63 },   // X       56
    { 0x00, 0x07, 0x08, 0x70, 0x08, 0x07 },   // Y       57
    { 0x00, 0x61, 0x51, 0x49, 0x45, 0x43 },   // Z       58
    { 0x00, 0x00, 0x7F, 0x41, 0x41, 0x00 },   // [       59
    { 0x00, 0x55, 0x2A, 0x55, 0x2A, 0x55 },   // 55      60
    { 0x00, 0x00, 0x41, 0x41, 0x7F, 0x00 },   // ]       61
    { 0x00, 0x04, 0x02, 0x01, 0x02, 0x04 },   // ^       62
    { 0x00, 0x40, 0x40, 0x40, 0x40, 0x40 },   // _       63
    { 0x00, 0x00, 0x01, 0x02, 0x04, 0x00 },   // '       64
    { 0x00, 0x20, 0x54, 0x54, 0x54, 0x78 },   // a       65
    { 0x00, 0x7F, 0x48, 0x44, 0x44, 0x38 },   // b       66
    { 0x00, 0x38, 0x44, 0x44, 0x44, 0x20 },   // c       67
    { 0x00, 0x38, 0x44, 0x44, 0x48, 0x7F },   // d       68
    { 0x00, 0x38, 0x54, 0x54, 0x54, 0x18 },   // e       69
    { 0x00, 0x08, 0x7E, 0x09, 0x01, 0x02 },   // f       70
    { 0x00, 0x18, 0xA4, 0xA4, 0xA4, 0x7C },   // g       71
    { 0x00, 0x7F, 0x08, 0x04, 0x04, 0x78 },   // h       72
    { 0x00, 0x00, 0x44, 0x7D, 0x40, 0x00 },   // i       73
    { 0x00, 0x40, 0x80, 0x84, 0x7D, 0x00 },   // j       74
    { 0x00, 0x7F, 0x10, 0x28, 0x44, 0x00 },   // k       75
    { 0x00, 0x00, 0x41, 0x7F, 0x40, 0x00 },   // l       76
    { 0x00, 0x7C, 0x04, 0x18, 0x04, 0x78 },   // m       77
    { 0x00, 0x7C, 0x08, 0x04, 0x04, 0x78 },   // n       78
    { 0x00, 0x38, 0x44, 0x44, 0x44, 0x38 },   // o       79
    { 0x00, 0xFC, 0x24, 0x24, 0x24, 0x18 },   // p       80
    { 0x00, 0x18, 0x24, 0x24, 0x18, 0xFC },   // q       81
    { 0x00, 0x7C, 0x08, 0x04, 0x04, 0x08 },   // r       82
    { 0x00, 0x48, 0x54, 0x54, 0x54, 0x20 },   // s       83
    { 0x00, 0x04, 0x3F, 0x44, 0x40, 0x20 },   // t       84
    { 0x00, 0x3C, 0x40, 0x40, 0x20, 0x7C },   // u       85
    { 0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C },   // v       86
    { 0x00, 0x3C, 0x40, 0x30, 0x40, 0x3C },   // w       87
    { 0x00, 0x44, 0x28, 0x10, 0x28, 0x44 },   // x       88
    { 0x00, 0x1C, 0xA0, 0xA0, 0xA0, 0x7C },   // y       89
    { 0x00, 0x44, 0x64, 0x54, 0x4C, 0x44 },   // z       90
    { 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 }    // horiz lines
};



#endif