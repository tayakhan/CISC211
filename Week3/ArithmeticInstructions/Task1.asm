section .data
    var1 dq 5          ; Initialized variable

section .bss
    result resq 1      ; Uninitialized variable for the answer

section .text
    global _start

_start:
    ; Equation: result = -var1 * 10
    mov rax, [var1]    ; Load var1 into RAX
    neg rax            ; Make it negative (rax is now -5)
    imul rax, 10       ; Multiply by 10 (rax is now -50)
    mov [result], rax  ; Store final result in memory

    ; Standard Exit Code
    mov rax, 60        ; system call for exit
    xor rdi, rdi       ; return code 0
    syscall
