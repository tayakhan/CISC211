section .data
    number db 7             ; The number to check
    even_msg db "Even", 10
    even_len equ $ - even_msg
    odd_msg db "Odd", 10
    odd_len equ $ - odd_msg

section .text
    global _start

_start:
    ; Pass value to function using the stack
    movzx eax, byte [number]
    push eax
    call check_even_odd
    add esp, 4              ; Clean up stack

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function: Determines if input is even or odd
check_even_odd:
    push ebp                ; Set up stack frame
    mov ebp, esp
    
    mov eax, [ebp + 8]      ; Get the number from the stack
    test eax, 1             ; Check the least significant bit
    jz is_even              ; If bit is 0, it's even

    ; Print Odd
    mov eax, 4
    mov ebx, 1
    mov ecx, odd_msg
    mov edx, odd_len
    int 0x80
    jmp done

is_even:
    ; Print Even
    mov eax, 4
    mov ebx, 1
    mov ecx, even_msg
    mov edx, even_len
    int 0x80

done:
    mov esp, ebp            ; Restore stack
    pop ebp
    ret
