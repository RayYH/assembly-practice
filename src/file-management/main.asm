section .text
    global _start

_start:
    ; create the file
    mov eax, 8
    mov ebx, filename
    mov ecx, 0777
    int 0x80

    mov [fdOut], eax

    ; write into the file
    mov eax, 4
    mov ebx, [fdOut]
    mov ecx, msg
    mov edx, len
    int 0x80

    ; close the file
    mov eax, 6
    mov ebx, [fdOut]

    ; write the message indicating EOF write
    mov eax, 4
    mov ebx, 1
    mov ecx, msgDone
    mov edx, msgDoneLen
    int 0x80

    ; open the file for reading
    mov eax, 5
    mov ebx, filename
    mov ecx, 0         ; for read only access
    mov edx, 0777      ; read, write and execute by all
    int 0x80

    mov [fdIn], eax

    ; read from file
    mov eax, 3
    mov ebx, [fdIn]
    mov ecx, info
    mov edx, len
    int 0x80

    ; close the file
    mov eax, 6
    mov ebx, [fdIn]
    int 0x80

    ; print the info
    mov eax, 4
    mov ebx, 1
    mov ecx, info
    mov edx, len
    int 0x80

    ; exit program
    mov eax, 1
    int 0x80

section .data
    ; cat /tmp/my_file.txt
    filename db "/tmp/my_file.txt", 0
    msg db "Welcome to assembly language", 0xA, 0xD
    len equ $-msg
    msgDone db "Written to file", 0xA, 0xD
    msgDoneLen equ $-msgDone

section .bss
    fdOut resb 1
    fdIn resb 1
    info resb len
