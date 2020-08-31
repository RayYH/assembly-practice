section .text
    global _start

_start:
    mov eax, 45  ; sys_brk
    xor ebx, ebx ; a efficient way to set a register to zero
    int 80H

    add eax, 16384 ; number of bytes to be reserved, 2^14
    mov ebx, eax
    mov eax, 45    ; sys_brk
    int 80H

    cmp eax, 0
    jl exit        ; exit, if error
    mov edi, eax   ; edi = highest available address
    sub edi, 4     ; pointing to the last DWORD
    mov ecx, 4096  ; number of DWORDs allocated
    xor eax, eax   ; clear eax
    std            ; STD SeTs the Direction flag, data goes backwards.
    rep stosd      ; repeat for entire allocated area
    cld            ; put df flag to normal state

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 80H

exit:
    mov eax, 1
    xor ebx, ebx
    int 80H

section .data
    msg db "Allocated 16 kb of memory!", 10 ; 10 means 0xA
    len equ $-msg
