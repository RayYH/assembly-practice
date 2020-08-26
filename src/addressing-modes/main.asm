section	.text
   global _start

_start:
    ; writing the name 'Zara Ali'
    mov	edx, 9       ; message length
    mov	ecx, name    ; message to write
    mov	ebx, 1       ; file descriptor (stdout)
    mov	eax, 4       ; system call number (sys_write)
    int	0x80         ; call kernel

    ; Changed the name to None Ali
    mov	dword [name], 'None'

    ; writing the name 'None Ali'
    mov	edx,8       ; message length
    mov	ecx,name    ; message to write
    mov	ebx,1       ; file descriptor (stdout)
    mov	eax,4       ; system call number (sys_write)
    int	0x80        ; call kernel

    ; print new line
    mov edx, newLineLen
    mov ecx, newLineMsg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; exit
    mov	eax,1       ; system call number (sys_exit)
    int	0x80        ; call kernel

section	.data
    name db 'Zara Ali '
    ; new line
    newLineMsg db 0xa, 0xd
    newLineLen equ $-newLineMsg
