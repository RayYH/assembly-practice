section .text
    global _start

_start:
    call display
    mov eax, 1
    int 0x80

display:
    ; the ecx register contains the loop count
    mov ecx, 256
    next:
        push ecx
        mov eax, 4
        mov ebx, 2
        mov ecx, char
        mov edx, 1
        int 0x80

        pop ecx ; restore ecx
        mov dx, [char]
        cmp byte [char], 0DH
        inc byte [char]
        loop next
        ret

section .data
    char db '0'
