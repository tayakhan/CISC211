section .data
    ; Initialize 5 values to compare
    num1 dd 12
    num2 dd 45
    num3 dd 22
    num4 dd 98
    num5 dd 31

section .bss
    ; Space for the final largest value
    largest resd 1

section .text
    global _start

_start:
    ; Task 1: Evens to 20
    mov eax, 0          ; Reset counter

even_loop:
    add eax, 2          ; Step by 2
    cmp eax, 20         ; Check if we hit 20
    jle even_loop       ; Loop if not finished

    ; Task 2: Find Largest
    mov ebx, [num1]     ; Start with the first number

    cmp ebx, [num2]     ; Compare with second
    jge skip2           ; Skip update if EBX is bigger
    mov ebx, [num2]     ; Update EBX
skip2:

    cmp ebx, [num3]     ; Compare with third
    jge skip3
    mov ebx, [num3]
skip3:

    cmp ebx, [num4]     ; Compare with fourth
    jge skip4
    mov ebx, [num4]
skip4:

    cmp ebx, [num5]     ; Compare with fifth
    jge skip5
    mov ebx, [num5]
skip5:

    mov [largest], ebx  ; Save the winner

    ; Exit
    mov eax, 1          
    mov ebx, 0          
    int 0x80
