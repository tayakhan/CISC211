# Question 1
```nasm
; Values used: var1=4, var2=2, var3=4. Result=3.

section .data
    var1 dq 4
    var2 dq 2
    var3 dq 4
    msg db "The result is: "
    len_msg equ $ - msg

section .bss
    result resq 1
    char_out resb 1   ; Space to hold the ASCII character for printing

section .text
    global _start

_start:
    ; --- Step 1: Addition (var1 + 2) ---
    mov rax, [var1]
    add rax, 2          ; RAX = 6

    ; --- Step 2: Subtraction (var3 - var2) ---
    mov rbx, [var3]
    sub rbx, [var2]     ; RBX = 2

    ; --- Step 3: Division ---
    cqo                 ; Sign-extend RAX into RDX before division
    idiv rbx            ; RAX = 6 / 2. Quotient=3, Remainder=0
    mov [result], rax   ; Save the answer

    ; --- Step 4: ASCII Conversion and Console Output ---
    add rax, 48         ; Convert number 3 to ASCII '3'
    mov [char_out], al  ; Store character in buffer

    ; Print "The result is: "
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, msg
    mov rdx, len_msg
    syscall

    ; Print the number '3'
    mov rax, 1
    mov rdi, 1
    mov rsi, char_out
    mov rdx, 1
    syscall

    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall
```


| Register Name | Purpose   | Value (Decimal) |
| :---          | :---      | :---            |
| **RAX**       | Quotient  | 3               |
| **RDX**       | Remainder | 0               |



# Question 2

## 1. K-map Representation
For a two-variable expression (a and b), we create a 2x2 Karnaugh Map. We place a '1' in the cells corresponding to the terms in the equation:
- **a.b**: Cell (1, 1)
- **a'.b**: Cell (0, 1)
- **a.b'**: Cell (1, 0)

| | b' (0) | b (1) |
| :--- | :---: | :---: |
| **a' (0)** | 0 | 1 |
| **a (1)** | 1 | 1 |

---

## 2. Grouping
To simplify, we look for the largest possible groups of 1s (groups of 2, 4, etc.):

1.  **Vertical Group (b column):**
    We group the 1s in the right column (a'.b and a.b). 
    - In this group, **a** changes from 0 to 1 (it cancels out).
    - **b** remains constant at 1.
    - **Result: b**

2.  **Horizontal Group (a row):**
    We group the 1s in the bottom row (a.b' and a.b).
    - In this group, **b** changes from 0 to 1 (it cancels out).
    - **a** remains constant at 1.
    - **Result: a**

---

## 3. Final Simplified Equation
By combining the results of our two groups using the OR (+) operator, we get the final simplified expression:

**Y = a + b**


# Question 3

```nasm
; Odd or Even Identification
; Design: Divide by 2 and check the remainder in RDX.

section .data
    number      dq 7                ; The number to check
    msg_even    db "even number", 10
    len_even    equ $ - msg_even
    msg_odd     db "odd number", 10
    len_odd     equ $ - msg_odd

section .text
    global _start

_start:
    ; --- Preparation for Division ---
    mov rax, [number]   ; Load the number into RAX
    mov rbx, 2          ; We will divide by 2
    xor rdx, rdx        ; Clear RDX before division

    ; --- Perform Division ---
    div rbx             ; RAX / 2. Remainder is stored in RDX.

    ; --- Check Remainder ---
    cmp rdx, 0          ; Compare remainder to 0
    je  is_even         ; If remainder is 0, jump to even label

is_odd:
    ; Display "odd number"
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, msg_odd
    mov rdx, len_odd
    syscall
    jmp end_prog

is_even:
    ; Display "even number"
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, msg_even
    mov rdx, len_even
    syscall

end_prog:
    ; --- Exit Program ---
    mov rax, 60         ; sys_exit
    xor rdi, rdi
    syscall
```




