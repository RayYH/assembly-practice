; Implements the write system call
%macro write_to_stdout 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .text
    global _start

_start:
    write_to_stdout msg1, msg1Len
    write_to_stdout msg2, msg2Len
    write_to_stdout msg3, msg3Len

    mov eax, 1
    int 0x80

section .data
    msg1 db "Hello, programmers!", 0xA, 0xD
    msg1Len equ $-msg1
    msg2 db "Welcome to the world of "
    msg2Len equ $-msg2
    msg3 db "Linux assembly programming!", 0xA, 0xD
    msg3Len equ $-msg3
