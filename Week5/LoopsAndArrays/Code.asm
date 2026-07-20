section .data
    ; Task 3: Integer array of length 3
    my_array dd 15, 42, 23

section .bss
    ; Space to store the final largest element
    largest resd 1

section .text
    global _start

_start:
    ; TASK 1: Optimized Counter (Using EBX)
    mov ecx, 5          ; Set loop count to 5
    xor ebx, ebx        ; Clear EBX (EBX = 0)
    
counter_loop:
    inc ebx             ; Increment counter
    loop counter_loop   ; Dec ECX and jump if not zero
    ; Findings: EBX increments each time ECX decreases. 
    ; The 'loop' instruction handles the jump automatically.

    ; TASK 2: Fibonacci (10th number)
    ; Sequence: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55...
    mov eax, 0          ; First number
    mov ebx, 1          ; Second number
    mov ecx, 9          ; We need 9 more steps to reach the 10th index (55)

fib_loop:
    mov edx, eax        ; Temporarily hold 'a'
    add edx, ebx        ; edx = a + b
    mov eax, ebx        ; a = b
    mov ebx, edx        ; b = new sum
    loop fib_loop       ; Repeat until 10th number is in EBX
    ; Result: EBX now holds 55

    ; TASK 3: Largest in Array
    mov esi, 0          ; Index offset (0, 4, 8)
    mov ecx, 3          ; Array size
    mov eax, [my_array] ; Assume first element is largest

array_loop:
    cmp eax, [my_array + esi] ; Compare current max with array element
    jge skip_update           ; Skip if EAX is already bigger
    mov eax, [my_array + esi] ; Update EAX with new max
skip_update:
    add esi, 4          ; Move to next 4-byte integer
    loop array_loop

    mov [largest], eax  ; Save result

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
