section .text
    global _start

_start:
    mov al, '9'
    sub al, '3'
    aas
    or al, 30H
    mov [res], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newLine
    mov edx, newLineLen
    int 0x80

    mov eax, 1
    int 0x80

section .bss
    res resb 1

section .data
    msg db "The result is: "
    msgLen equ $-msg
    newLine db 0xA, 0xD
    newLineLen equ $-newLine
