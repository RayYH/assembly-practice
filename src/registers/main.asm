segment .text
    global _start

_start:
    ; print message
    mov edx, len
    mov	ecx, msg
    mov	ebx, 1
    mov	eax, 4
    int	0x80

    ; print starts
    mov edx, count
    mov	ecx, stars
    mov	ebx, 1
    mov	eax, 4
    int	0x80

    ; print new line
    mov edx, newLineLen
    mov ecx, newLineMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; exit program
    mov	eax, 1
    int	0x80

segment	.data
    msg db 'Displaying 9 stars:', 0xa
    len equ $ - msg
    ; loop count
    count equ 9
    ; use times to generate a repeated string
    stars times count db '*'
    ; new line
    newLineMsg db 0xa, 0xd
    newLineLen equ $-newLineMsg
