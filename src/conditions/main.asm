section .text
    global _start

_start:
    ; ecx <- num1
    mov ecx, [num1]
    ; compare num1 & num2
    cmp ecx, [num2]
    ; if num1 > num2, jump to check_third_num
    jg  check_third_sum
    ; else ecx <- num2
    mov ecx, [num2]

    check_third_sum:
        cmp ecx, [num3]
        ; if ecx > num3, jump to _exit
        jg  _exit
        ; else ecx <- num3
        mov ecx, [num3]

    _exit:
        ; now, the ecx holds the largest value
        mov [largest], ecx

        mov eax, 4
        mov ebx, 1
        mov ecx, msg
        mov edx, len
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, largest
        mov edx, 2
        int 0x80

        mov eax, 4
        mov ebx, 1
        mov ecx, newLine
        mov edx, newLineLen
        int 0x80

        mov eax, 1
        int 80h

section .data
    msg db "The largest digit is: "
    len equ $ - msg
    newLine db 0xA, 0xD
    newLineLen equ $ - newLine
    num1 dd '47'
    num2 dd '22'
    num3 dd '31'

segment .bss
    largest resb 2
