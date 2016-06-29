/***MODU+********************************************************************/
/* Copyright (c) 2012.04  WH, All Rights Reserved.                          */
/*  WebSite     : http://un-el.taobao.com/                                  */
/*  Email       : dragonhzw@163.com                                         */
/*  FileName    : Crt0.s                                                    */
/*  Description : The Crt0 module                                           */
/*  History     :                                                           */                                                       
/*     [Author]   [Date]      [Version]    [Description]                    */              
/*     [1] dragonhzw   2012/04/09  Ver 1.0.0    Initial file.               */
/*                                                                          */
/*  Built with IAR Embedded Workbench for ARM 6.30                          */
/***MODU-********************************************************************/



;         AREA   Crt0, CODE, READONLY      ; name this block of code
  SECTION .noinit : CODE

        EXPORT  __startup
__startup
        MOV     r0,#0                   ; Initialize the GPRs
	MOV     r1,#0
	MOV     r2,#0
	MOV     r3,#0
	MOV     r4,#0
	MOV     r5,#0
	MOV     r6,#0
	MOV     r7,#0
	MOV     r8,#0
	MOV     r9,#0
	MOV     r10,#0
	MOV     r11,#0
	MOV     r12,#0
	CPSIE   i                       ; Unmask interrupts
        import  main
        BL      main                  ; call the C code
__done
        B       __done


        END




        
