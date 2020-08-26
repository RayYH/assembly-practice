section .text
    global _start

_start:
    mov   ax, 9h
    and   ax, 1

    ; jumps to the specified location if the Zero Flag (ZF) is set (1).
    jz    even

    mov   eax, 4
    mov   ebx, 1
    mov   ecx, odd_msg
    mov   edx, len2
    int   0x80
    jmp   exit_prog

even:
    mov   eax, 4
    mov   ebx, 1
    mov   ecx, even_msg
    mov   edx, len1
    int   0x80

exit_prog:
    mov edx, newLineLen
    mov ecx, newLineMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov   eax,1
    int   0x80

section   .data
    even_msg    db  'Even Number!'
    len1        equ  $ - even_msg
    odd_msg     db  'Odd Number!'
    len2        equ  $ - odd_msg
    newLineMsg  db   0xa, 0xd
    newLineLen  equ  $ - newLineMsg
