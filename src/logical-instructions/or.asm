section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, progMsg
    mov edx, progMsgLen
    int 0x80

    ; 0101
    mov al, 5
    ; 0011
    mov bl, 3
    ; al should be 0111 = 7
    or al, bl
    add al, byte '0'

    mov [result], al

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newLineMsg
    mov edx, newLineMsgLen
    int 0x80

    mov eax, 1
    int 0x80

section .data
    progMsg db  "5 or 3 is: "
    progMsgLen equ $-progMsg
    newLineMsg db 0xA, 0xD
    newLineMsgLen equ $-newLineMsg

section .bss
    result resb 1
