section .text
    global _start

_start:
    mov ecx, 9
    mov eax, '1'

loop_label:
    mov [num], eax
    mov eax, 4
    mov ebx, 1
    push ecx
    mov ecx, num
    mov edx, 1
    int 0x80

    mov eax, [num]
    sub eax, '0'
    inc eax
    add eax, '0'
    pop ecx
    loop loop_label

    mov eax, 4
    mov ebx, 1
    mov ecx, newLine
    mov edx, newLineLen
    int 0x80

    mov eax, 1
    int 0x80

section .bss
    num resb 1

section .data
    newLine db 0xA, 0xD
    newLineLen equ $-newLine
