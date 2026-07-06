section .data
    my_value dq 15    ; Test number

section .text
    global _start

_start:
    ;  Part 1: XORing an operand with itself 
    mov rax, 1234     ; Put a random number in RAX
    xor rax, rax      ; XOR with itself to clear RAX to 0

    ;  Part 2: TEST instruction 
    ; Using TEST to check if number is odd
    mov rax, [my_value] ; Load 15 into RAX
    test rax, 1         ; checks the last bit of the number
    
   
    ; Exit Code
    mov rax, 60
    xor rdi, rdi        ; Clear rdi to 0 for success status
    syscall
