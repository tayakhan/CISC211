; Task 3: result = (-var1 * var2) + var3

section .data
    var1 dq 5
    var2 dq 4
    var3 dq 10

section .bss
    result resq 1

section .text
    global _start

_start:
    mov rax, [var1]    ; Load 5
    neg rax            ; RAX = -5
    imul rax, [var2]   ; RAX = -5 * 4 = -20
    add rax, [var3]    ; RAX = -20 + 10 = -10
    
    mov [result], rax  ; Store -10 in result

    ; Exit code
    mov rax, 60
    xor rdi, rdi
    syscall
