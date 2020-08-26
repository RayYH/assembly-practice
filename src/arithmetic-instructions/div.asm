section	.text
    global _start

_start:

    ; ax <- 9
    mov	ax,'9'
    sub ax, '0'

    ; bl <- 4
    mov bl, '4'
    sub bl, '0'

    ; div bl means ax/bl, ah is the remainder, al is the quotient
    div bl
    add	al, '0'
    add ah, '0'

    mov [q], al
    mov [l], ah

    mov	ecx, qMsg
    mov	edx, qLen
    mov	ebx, 1
    mov	eax, 4
    int	0x80

    mov	ecx, q
    mov	edx, 1
    mov	ebx, 1
    mov	eax, 4
    int	0x80

    mov edx, newLineLen
    mov ecx, newLineMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov	ecx, rMsg
    mov	edx, rLen
    mov	ebx, 1
    mov	eax, 4
    int	0x80

    mov	ecx, l
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

    qMsg db "The quotient is: "
    qLen equ $-qMsg
    rMsg db "The remainder is: "
    rLen equ $-rMsg
    newLineMsg db 0xa, 0xd
    newLineLen equ $-newLineMsg

segment .bss

    q resb 1
    l resb 1
