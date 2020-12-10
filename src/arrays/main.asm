section .text
    global _start

_start:
    mov eax, lengthOfArr   ; the count of numbers to be summed
    mov ebx, 0             ; store the sum
    mov ecx, arr           ; point to the current element to be summed

; loop instruction assumes that the ecx register contains the loop count
top:
    add ebx, [ecx]    ; add current element - ecx stored a pointer
    add ecx, 1        ; move pointer to next element
    dec eax           ; decrement counter
    jnz top           ; if counter (ecx) is not 0, then loop again

done:
    add ebx, '0'      ; cast to ASCII presentation
    mov [sum], ebx

display:
    ; sys_write(1, sum, 1)
    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, 1
    int 0x80

    ; sys_write(1, newLine, lengthOfNewLine)
    mov eax, 4
    mov ebx, 1
    mov ecx, newLine
    mov edx, lengthOfNewLine
    int 0x80

    ; sys_exit()
    mov eax, 1
    int 0x80

section .data
    newLine db 0xA, 0xD
    lengthOfNewLine equ $-newLine
    ; declaring a simple array
    arr:
        db 2
        db 3
        db 4
    lengthOfArr equ 3
    sum db 0
