section .text
    global _start

_start:
    ; since pop and push use 64-bit mode
    mov rcx, 9
    mov rax, '1'

loop_label:
    mov [num], rax
    mov rax, 4
    mov rbx, 1
    push rcx
    mov rcx, num
    mov rdx, 1
    int 0x80

    mov rax, [num]
    sub rax, '0'
    inc rax
    add rax, '0'
    pop rcx
    loop loop_label

    mov rax, 4
    mov rbx, 1
    mov rcx, newLine
    mov rdx, newLineLen
    int 0x80

    mov rax, 1
    int 0x80

section .bss
    num  resb 1

section .data
    newLine db 0xA, 0xD
    newLineLen equ $-newLine
