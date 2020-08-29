; Initialized data
section .data
    userMsg db 'Please enter a number(1 ~ 9999): ' ; Ask the user to enter a number
    lenUserMsg equ $-userMsg                       ; The length of the message
    desMsg db 'You have entered: '                 ; The description message
    lenDesMsg equ $-desMsg                         ; The length of the description message

; Uninitialized data
section .bss
    num resb 5

segment .text
    global _start

_start:
    ; ssize_t sys_write(unsigned int fd, const char * buf, size_t count)
    mov eax, 4
    mov ebx, 1
    mov ecx, userMsg
    mov edx, lenUserMsg
    int 0x80

    ; ssize_t sys_read(unsigned int fd, char * buf, size_t count)
    mov eax, 3
    mov ebx, 2       ; fd, 2 means stdin
    mov ecx, num     ; buffer
    mov edx, 5       ; 5 bytes (numeric, 1 for sign) of that information
    int 0x80

    ; Output the message 'The entered number is: '
    mov eax, 4
    mov ebx, 1
    mov ecx, desMsg
    mov edx, lenDesMsg
    int 0x80

    ; Output the number entered
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80
