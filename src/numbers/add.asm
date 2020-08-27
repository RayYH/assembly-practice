section	.text
    global _start

_start:
    mov esi, 4 ; pointing to the rightmost digit
    mov ecx, 5 ; num of digits
    clc        ; clc - clear carry flag

add_loop:
    mov al, [num1 + esi]
    adc al, [num2 + esi] ; adc - add with carry
    aaa                  ; aaa - ASCII adjust after addition
    pushf
    or al, 30h
    popf
    mov	[sum + esi], al
    dec	esi
    loop	add_loop

    mov	edx, len
    mov	ecx, msg
    mov	ebx, 1
    mov	eax, 4
    int	0x80

    mov	edx, 5
    mov	ecx, sum
    mov	ebx, 1
    mov	eax, 4
    int	0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newLine
    mov edx, newLineLen
    int 0x80

    mov eax, 1
    int	0x80

section	.data
    msg db 'The Sum is: '
    len equ $-msg
    newLine db 0xA, 0xD
    newLineLen equ $-newLine
    num1 db '12345'
    num2 db '23456'
    sum db '     '
