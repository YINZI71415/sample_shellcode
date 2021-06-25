Section .text
        global _start
_start:
        xor eax,eax
        mov al, 39h
        syscall
        test rax,rax
        jnz .L2
        
        xor eax,eax
        xor rdi,rdi
        xor rsi,rsi
        xor rdx,rdx
        
        push rax
        mov rdi,"n//xcalc"
        push rdi
        mov rdi,"/usr//bi"
        push rdi
        mov rdi,rsp
       
        push rax
        push rdi
        mov rsi,rsp

        push rax
        mov rdx,":0.0"
        push rdx
        mov rdx,"DISPLAY="
        push rdx
        mov rdx,rsp
        push rax
        push rdx
        mov rdx,rsp
                

        mov al, 3Bh
        syscall  
.L2:
        nop
        jmp     .L2
