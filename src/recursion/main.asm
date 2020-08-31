section .text
    global _start

_start:
    mov bx, 3   ; calculate factorial(3)
    call proc_fact
    add ax, 30H ; 30H means '0', cast to ASCII for character presentation
    mov [fact], ax

    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, messageLen
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, fact
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newLine
    mov edx, newLineLen
    int 0x80

    mov eax, 1
    int 0x80

proc_fact:
    cmp bl, 1
    jg do_calculation ; if bl > 1, then do calculation
    mov ax, 1         ; otherwise, assign 1 to ax
    ret

do_calculation:
    dec bl
    call proc_fact    ; calc factorial(bl - 1)
    inc bl
    mul bl            ; ax = al * bl
    ret

section .data
    message db "Factorial 3 is: "
    messageLen equ $-message
    newLine db 0xA, 0xD
    newLineLen equ $-newLine

section .bss
    fact resb 1
