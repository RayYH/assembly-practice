section .text
    global _start

_start:
    mov ecx, '4'
    sub ecx, '0'
    mov edx, '5'
    sub edx, '0'

    call sum
    mov [res], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, promptMessage
    mov edx, promptMessageLen
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

sum:
    mov eax, ecx
    add eax, edx
    add eax, '0'
    ret

section .data
    promptMessage db "The sum is: "
    promptMessageLen equ $-promptMessage
    newLine db 0xA, 0xD
    newLineLen equ $-newLine

section .bss
    res resb 1
