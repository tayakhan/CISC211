; Task 4: result = (var1 * 2) / (var2 - 3), choose var1 and var2 so that the result is an integer.
; I chose values 10 and 8 so the result is a clean integer as requested

section .data
    var1 dq 10
    var2 dq 8

section .bss
    result resq 1

section .text
    global _start

_start:
    ; Numerator logic: (var1 * 2)
    mov rax, [var1]
    imul rax, 2        ; RAX = 20

    ; Denominator logic: (var2 - 3)
    mov rbx, [var2]
    sub rbx, 3         ; RBX = 5

    ; Division logic: RAX / RBX
    cqo                ; Required: Sign-extends RAX into RDX
    idiv rbx           ; Divide RAX by RBX (20 / 5 = 4)
    
    mov [result], rax  ; Store 4 in result

    ; Exit code
    mov rax, 60
    xor rdi, rdi
    syscall
