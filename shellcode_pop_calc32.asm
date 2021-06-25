Section .text
        global _start
_start:
        xor eax,eax
        mov al, 2
        int 0x80
        test eax,eax
        jnz .L2
        xor ecx,ecx
        xor edx,edx

        push edx 
        push "calc"
        push "n//x"
        push "//bi"
        push "/usr"
        mov ebx,esp

        push ecx
        push ebx
        mov ecx,esp
        
        push edx
        push ":0.0"
        push "LAY="
        push "DISP"
        mov edx,esp
        xor eax,eax
        push eax
        push edx
        mov edx,esp
         
       
        mov al,0Bh 
        int 80h
.L2:
        jmp     .L2
