; Task 2: result = var1 + var2 + var3 + var4

section .data
    var1 dq 10
    var2 dq 20
    var3 dq 30
    var4 dq 40

section .bss
    result resq 1

section .text
    global _start

_start:
    mov rax, [var1]    ; Load 10 into RAX
    add rax, [var2]    ; Add 20 (RAX = 30)
    add rax, [var3]    ; Add 30 (RAX = 60)
    add rax, [var4]    ; Add 40 (RAX = 100)
    
    mov [result], rax  ; Store the sum (100) in result

    ; Exit code
    mov rax, 60
    xor rdi, rdi
    syscall
