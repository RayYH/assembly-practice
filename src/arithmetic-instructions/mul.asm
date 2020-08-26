section	.text
   global _start

_start:

    ; al <- 3
    mov al, '3'
    sub al, '0'

    ; bl <- 3
    mov bl, '2'
    sub bl, '0'

    ; https://www.cs.uaf.edu/2005/fall/cs301/support/x86/nasm.html
    ; mul bl means Multiply al by bl
    mul bl
    add	al, '0'

    mov [res], al
    mov	ecx, msg
    mov	edx, len
    mov	ebx, 1
    mov	eax, 4
    int	0x80

    mov	ecx, res
    mov	edx, 1
    mov	ebx, 1
    mov	eax, 4
    int	0x80

    mov edx, newLineLen
    mov ecx, newLineMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov	eax, 1
    int	0x80

section .data

    msg db "The result is: "
    len equ $-msg

    ; new line
    newLineMsg db 0xa, 0xd
    newLineLen equ $-newLineMsg

segment .bss

    res resb 1
