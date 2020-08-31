section .text
    global _start

_start:
    mov eax, length_a ; number bytes to be summed
    mov ebx, 0        ; ebx will store the sum
    mov ecx, x        ; ecx will point to the current element to be summed

top:
    add ebx, [ecx]    ; add current element
    add ecx, 1        ; move pointer to next element
    dec eax           ; decrement counter
    jnz top           ; if counter not 0, then loop again

done:
    add ebx, '0'      ; cast to ASCII presentation
    mov [sum], ebx

display:
    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newLine
    mov edx, newLineLen
    int 0x80

    mov eax, 1
    int 0x80

section .data
    newLine db 0xA, 0xD
    newLineLen equ $-newLine
    global x
    x:
        db 2
        db 3
        db 4
    length_a equ 3
    sum db 0
