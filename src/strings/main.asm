segment .text
    global _start

_start:
    ; ssize_t sys_write(unsigned int fd, const char * buf, size_t count)
    mov eax, 4
    mov ebx, 1
    mov ecx, message1
    mov edx, lenMessage1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, message2
    mov edx, lenMessage2
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, message3
    int 0x80

    mov eax, 1
    int 0x80

segment .data
    ; using the `$` location counter symbol
    message1 db "Hello World!", 0xA
    lenMessage1 equ $-message1
    ; using the literal
    message2 db "Hello World!", 0xA
    lenMessage2 equ 13
    ; using a sentinel character
    message3 db "Hello World!", 0xA, 0
